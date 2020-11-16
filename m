Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA1D2B507B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:03:09 +0100 (CET)
Received: from localhost ([::1]:47414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejmO-0005Qc-3b
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejR2-0003yL-Cp
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:45330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQo-0000lF-Q5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 436F6B011;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/7] scsi-disk: convert more errno values back to SCSI statuses
Date: Mon, 16 Nov 2020 19:40:37 +0100
Message-Id: <20201116184041.60465-4-hare@suse.de>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

Linux has some OS-specific (and sometimes weird) mappings for various SCSI
statuses and sense codes.  The most important is probably RESERVATION
CONFLICT.  Add them so that they can be reported back to the guest
kernel.

Cc: Hannes Reinecke <hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 5d6c892f29..797779afd6 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -460,6 +460,25 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
             }
             error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
             break;
+#ifdef CONFIG_LINUX
+            /* These errno mapping are specific to Linux.  For more information:
+             * - scsi_decide_disposition in drivers/scsi/scsi_error.c
+             * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
+             * - blk_errors[] in block/blk-core.c
+             */
+        case EBADE:
+            /* DID_NEXUS_FAILURE -> BLK_STS_NEXUS.  */
+            scsi_req_complete(&r->req, RESERVATION_CONFLICT);
+            break;
+        case ENODATA:
+            /* DID_MEDIUM_ERROR -> BLK_STS_MEDIUM.  */
+            scsi_check_condition(r, SENSE_CODE(READ_ERROR));
+            break;
+        case EREMOTEIO:
+            /* DID_TARGET_FAILURE -> BLK_STS_TARGET.  */
+            scsi_req_complete(&r->req, HARDWARE_ERROR);
+            break;
+#endif
         case ENOMEDIUM:
             scsi_check_condition(r, SENSE_CODE(NO_MEDIUM));
             break;
-- 
2.16.4


