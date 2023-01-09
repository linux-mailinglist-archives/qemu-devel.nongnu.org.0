Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4CE66230A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:20:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpG8-0002AL-MB; Mon, 09 Jan 2023 05:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pEpG2-00028L-VD
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:20:00 -0500
Received: from [183.159.98.38] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pEpFz-0007Dm-BU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:19:57 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 9a122eb5;
 Mon, 9 Jan 2023 09:19:51 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>, Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net/can/xlnx-zynqmp-can: fix assertion failures in
 transfer_fifo()
Date: Mon,  9 Jan 2023 17:19:50 +0800
Message-Id: <20230109091950.784235-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 183.159.98.38 (failed)
Received-SPF: softfail client-ip=183.159.98.38;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Check fifos before poping data from and pushing data into it.

Fixes: 98e5d7a2b726 ("hw/net/can: Introduce Xilinx ZynqMP CAN controller")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1425
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1427
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/net/can/xlnx-zynqmp-can.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index e93e6c5e19..55d3221b49 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -451,6 +451,12 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
     }
 
     while (!fifo32_is_empty(fifo)) {
+        if (fifo32_num_used(fifo) < (4 * CAN_FRAME_SIZE)) {
+            g_autofree char *path = object_get_canonical_path(OBJECT(s));
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: data left in the fifo is not"
+                          " enough for transfer.\n", path);
+            break;
+        }
         for (i = 0; i < CAN_FRAME_SIZE; i++) {
             data[i] = fifo32_pop(fifo);
         }
@@ -463,7 +469,8 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
              * acknowledged. The XlnxZynqMPCAN core receives any message
              * that it transmits.
              */
-            if (fifo32_is_full(&s->rx_fifo)) {
+            if (fifo32_is_full(&s->rx_fifo) ||
+                    (fifo32_num_free(&s->rx_fifo) < (4 * CAN_FRAME_SIZE))) {
                 ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
             } else {
                 for (i = 0; i < CAN_FRAME_SIZE; i++) {
-- 
2.25.1


