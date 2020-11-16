Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17F2B50F3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:23:47 +0100 (CET)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kek6M-0004RE-17
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQy-0003wN-Gp
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:45372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQt-0000oY-1a
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64837B016;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 5/7] scsi: Add mapping for generic SCSI_HOST status to sense
 codes
Date: Mon, 16 Nov 2020 19:40:39 +0100
Message-Id: <20201116184041.60465-6-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201116184041.60465-1-hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:53:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we don't have a driver-specific mapping (yet) we should provide
for a detailed mapping from host_status to SCSI sense codes.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 scsi/utils.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/scsi/utils.c b/scsi/utils.c
index 262ef1c3ea..ae68881184 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -252,6 +252,21 @@ const struct SCSISense sense_code_LUN_COMM_FAILURE = {
     .key = ABORTED_COMMAND, .asc = 0x08, .ascq = 0x00
 };
 
+/* Command aborted, LUN does not respond to selection */
+const struct SCSISense sense_code_LUN_NOT_RESPONDING = {
+    .key = ABORTED_COMMAND, .asc = 0x05, .ascq = 0x00
+};
+
+/* Command aborted, Command Timeout during processing */
+const struct SCSISense sense_code_COMMAND_TIMEOUT = {
+    .key = ABORTED_COMMAND, .asc = 0x2e, .ascq = 0x02
+};
+
+/* Command aborted, Commands cleared by device server */
+const struct SCSISense sense_code_COMMAND_ABORTED = {
+    .key = ABORTED_COMMAND, .asc = 0x2f, .ascq = 0x02
+};
+
 /* Medium Error, Unrecovered read error */
 const struct SCSISense sense_code_READ_ERROR = {
     .key = MEDIUM_ERROR, .asc = 0x11, .ascq = 0x00
@@ -568,6 +583,14 @@ int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
         switch (errno_value) {
         case EDOM:
             return TASK_SET_FULL;
+        case EBADE:
+            return RESERVATION_CONFLICT;
+        case ENODATA:
+            *sense = SENSE_CODE(READ_ERROR);
+            return CHECK_CONDITION;
+        case EREMOTEIO:
+            *sense = SENSE_CODE(LUN_COMM_FAILURE);
+            return CHECK_CONDITION;
         case ENOMEM:
             *sense = SENSE_CODE(TARGET_FAILURE);
             return CHECK_CONDITION;
@@ -576,14 +599,41 @@ int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
             return CHECK_CONDITION;
         }
     } else {
-        if (io_hdr->host_status == SCSI_HOST_NO_LUN ||
-            io_hdr->host_status == SCSI_HOST_BUSY ||
-            io_hdr->host_status == SCSI_HOST_TIME_OUT ||
-            (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT)) {
+        switch (io_hdr->host_status) {
+        case SCSI_HOST_NO_LUN:
+            *sense = SENSE_CODE(LUN_NOT_RESPONDING);
+            return CHECK_CONDITION;
+        case SCSI_HOST_BUSY:
             return BUSY;
-        } else if (io_hdr->host_status) {
+        case SCSI_HOST_TIME_OUT:
+            *sense = SENSE_CODE(COMMAND_TIMEOUT);
+            return CHECK_CONDITION;
+        case SCSI_HOST_BAD_RESPONSE:
+            *sense = SENSE_CODE(LUN_COMM_FAILURE);
+            return CHECK_CONDITION;
+        case SCSI_HOST_ABORTED:
+            *sense = SENSE_CODE(COMMAND_ABORTED);
+            return CHECK_CONDITION;
+        case SCSI_HOST_RESET:
+            *sense = SENSE_CODE(RESET);
+            return CHECK_CONDITION;
+        case SCSI_HOST_TRANSPORT_DISRUPTED:
             *sense = SENSE_CODE(I_T_NEXUS_LOSS);
             return CHECK_CONDITION;
+        case SCSI_HOST_TARGET_FAILURE:
+            *sense = SENSE_CODE(TARGET_FAILURE);
+            return CHECK_CONDITION;
+        case SCSI_HOST_RESERVATION_ERROR:
+            return RESERVATION_CONFLICT;
+        case SCSI_HOST_ALLOCATION_FAILURE:
+            *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
+            return CHECK_CONDITION;
+        case SCSI_HOST_MEDIUM_ERROR:
+            *sense = SENSE_CODE(READ_ERROR);
+            return CHECK_CONDITION;
+        }
+        if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
+            return BUSY;
         } else if (io_hdr->status) {
             return io_hdr->status;
         } else if (io_hdr->driver_status & SG_ERR_DRIVER_SENSE) {
-- 
2.16.4


