Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09012B8A58
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 04:11:18 +0100 (CET)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfaLt-00060Z-DR
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 22:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfaKW-0005PB-Ln; Wed, 18 Nov 2020 22:09:52 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfaKT-0004nq-JT; Wed, 18 Nov 2020 22:09:52 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cc4Qs1Wdzzhcjn;
 Thu, 19 Nov 2020 11:09:25 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 11:09:31 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH] hw/usb: Fix bad printf format specifiers
Date: Thu, 19 Nov 2020 02:57:51 +0000
Message-ID: <20201119025751.45750-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 20:50:48
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/usb/ccid-card-passthru.c   | 2 +-
 hw/usb/core.c                 | 4 ++--
 hw/usb/dev-smartcard-reader.c | 8 ++++----
 hw/usb/hcd-ehci.c             | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index e8e9d37e88..48590730e0 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -335,7 +335,7 @@ static void passthru_apdu_from_guest(
     PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     if (!qemu_chr_fe_backend_connected(&card->cs)) {
-        printf("ccid-passthru: no chardev, discarding apdu length %d\n", len);
+        printf("ccid-passthru: no chardev, discarding apdu length %u\n", len);
         return;
     }
     ccid_card_vscard_send_apdu(card, apdu, len);
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 5234dcc73f..965178f506 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -142,7 +142,7 @@ static void do_token_setup(USBDevice *s, USBPacket *p)
     setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
     if (setup_len > sizeof(s->data_buf)) {
         fprintf(stderr,
-                "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+                "usb_generic_handle_packet: ctrl buffer too small (%u > %zu)\n",
                 setup_len, sizeof(s->data_buf));
         p->status = USB_RET_STALL;
         return;
@@ -277,7 +277,7 @@ static void do_parameter(USBDevice *s, USBPacket *p)
     setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
     if (setup_len > sizeof(s->data_buf)) {
         fprintf(stderr,
-                "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+                "usb_generic_handle_packet: ctrl buffer too small (%u > %zu)\n",
                 setup_len, sizeof(s->data_buf));
         p->status = USB_RET_STALL;
         return;
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 946df9734a..80109fa551 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -945,7 +945,7 @@ static void ccid_on_apdu_from_guest(USBCCIDState *s, CCID_XferBlock *recv)
         return;
     }
     len = le32_to_cpu(recv->hdr.dwLength);
-    DPRINTF(s, 1, "%s: seq %d, len %d\n", __func__,
+    DPRINTF(s, 1, "%s: seq %d, len %u\n", __func__,
                 recv->hdr.bSeq, len);
     ccid_add_pending_answer(s, (CCID_Header *)recv);
     if (s->card && len <= BULK_OUT_DATA_SIZE) {
@@ -995,13 +995,13 @@ static void ccid_handle_bulk_out(USBCCIDState *s, USBPacket *p)
     if ((s->bulk_out_pos - 10 < ccid_header->dwLength) &&
         (p->iov.size == CCID_MAX_PACKET_SIZE)) {
         DPRINTF(s, D_VERBOSE,
-                "usb-ccid: bulk_in: expecting more packets (%d/%d)\n",
+                "usb-ccid: bulk_in: expecting more packets (%u/%u)\n",
                 s->bulk_out_pos - 10, ccid_header->dwLength);
         return;
     }
     if (s->bulk_out_pos - 10 != ccid_header->dwLength) {
         DPRINTF(s, 1,
-                "usb-ccid: bulk_in: message size mismatch (got %d, expected %d)\n",
+                "usb-ccid: bulk_in: message size mismatch (got %u, expected %u)\n",
                 s->bulk_out_pos - 10, ccid_header->dwLength);
         goto err;
     }
@@ -1202,7 +1202,7 @@ void ccid_card_send_apdu_to_guest(CCIDCardState *card,
         ccid_report_error_failed(s, ERROR_HW_ERROR);
         return;
     }
-    DPRINTF(s, 1, "APDU returned to guest %d (answer seq %d, slot %d)\n",
+    DPRINTF(s, 1, "APDU returned to guest %u (answer seq %d, slot %d)\n",
         len, answer->seq, answer->slot);
     ccid_write_data_block_answer(s, apdu, len);
 }
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index ae7f20c502..257375d254 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1192,7 +1192,7 @@ static int ehci_init_transfer(EHCIPacket *p)
 
     while (bytes > 0) {
         if (cpage > 4) {
-            fprintf(stderr, "cpage out of range (%d)\n", cpage);
+            fprintf(stderr, "cpage out of range (%u)\n", cpage);
             qemu_sglist_destroy(&p->sgl);
             return -1;
         }
@@ -1598,7 +1598,7 @@ static int ehci_state_fetchentry(EHCIState *ehci, int async)
 
     default:
         /* TODO: handle FSTN type */
-        fprintf(stderr, "FETCHENTRY: entry at %X is of type %d "
+        fprintf(stderr, "FETCHENTRY: entry at %X is of type %u "
                 "which is not supported yet\n", entry, NLPTR_TYPE_GET(entry));
         return -1;
     }
-- 
2.19.1


