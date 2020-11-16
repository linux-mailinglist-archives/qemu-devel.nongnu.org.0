Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7592B5071
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:59:47 +0100 (CET)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejj8-0002Dk-Vy
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQx-0003vB-ND
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:45332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQo-0000lG-QZ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4682CB012;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/7] scsi: Rename linux-specific SG_ERR codes to generic
 SCSI_HOST error codes
Date: Mon, 16 Nov 2020 19:40:38 +0100
Message-Id: <20201116184041.60465-5-hare@suse.de>
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

We really should make a distinction between legitimate sense codes
(ie if one is running against an emulated block device or for
pass-through sense codes), and the intermediate errors generated
during processing of the command, which really are not sense codes
but refer to some specific internal status. And this internal
state is not necessarily linux-specific, but rather can refer to
the qemu implementation itself.
So rename the linux-only SG_ERR codes to SCSI_HOST codes and make
them available generally.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/scsi/utils.h | 23 ++++++++++++++++-------
 scsi/utils.c         |  6 +++---
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index fbc5588279..a55ba2c1ea 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -16,6 +16,22 @@ enum SCSIXferMode {
     SCSI_XFER_TO_DEV,    /*  WRITE, MODE_SELECT, ...         */
 };
 
+enum SCSIHostStatus {
+    SCSI_HOST_OK,
+    SCSI_HOST_NO_LUN,
+    SCSI_HOST_BUSY,
+    SCSI_HOST_TIME_OUT,
+    SCSI_HOST_BAD_RESPONSE,
+    SCSI_HOST_ABORTED,
+    SCSI_HOST_ERROR = 0x07,
+    SCSI_HOST_RESET = 0x08,
+    SCSI_HOST_TRANSPORT_DISRUPTED = 0xe,
+    SCSI_HOST_TARGET_FAILURE = 0x10,
+    SCSI_HOST_RESERVATION_ERROR = 0x11,
+    SCSI_HOST_ALLOCATION_FAILURE = 0x12,
+    SCSI_HOST_MEDIUM_ERROR = 0x13,
+};
+
 typedef struct SCSICommand {
     uint8_t buf[SCSI_CMD_BUF_SIZE];
     int len;
@@ -122,13 +138,6 @@ int scsi_cdb_length(uint8_t *buf);
 #define SG_ERR_DRIVER_TIMEOUT  0x06
 #define SG_ERR_DRIVER_SENSE    0x08
 
-#define SG_ERR_DID_OK          0x00
-#define SG_ERR_DID_NO_CONNECT  0x01
-#define SG_ERR_DID_BUS_BUSY    0x02
-#define SG_ERR_DID_TIME_OUT    0x03
-
-#define SG_ERR_DRIVER_SENSE    0x08
-
 int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
                            SCSISense *sense);
 #endif
diff --git a/scsi/utils.c b/scsi/utils.c
index b37c283014..262ef1c3ea 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -576,9 +576,9 @@ int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
             return CHECK_CONDITION;
         }
     } else {
-        if (io_hdr->host_status == SG_ERR_DID_NO_CONNECT ||
-            io_hdr->host_status == SG_ERR_DID_BUS_BUSY ||
-            io_hdr->host_status == SG_ERR_DID_TIME_OUT ||
+        if (io_hdr->host_status == SCSI_HOST_NO_LUN ||
+            io_hdr->host_status == SCSI_HOST_BUSY ||
+            io_hdr->host_status == SCSI_HOST_TIME_OUT ||
             (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT)) {
             return BUSY;
         } else if (io_hdr->host_status) {
-- 
2.16.4


