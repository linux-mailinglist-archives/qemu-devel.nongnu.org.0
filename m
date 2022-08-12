Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C0591699
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 23:08:11 +0200 (CEST)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMbt3-00078A-QO
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 17:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oMYPs-00019D-OP
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:25:48 -0400
Received: from mail-4316.protonmail.ch ([185.70.43.16]:59787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oMYPp-0000AH-7v
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:25:48 -0400
Date: Fri, 12 Aug 2022 17:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1660325134; x=1660584334;
 bh=B+8YRXUekClts287dgJ90AN/X1xAs3WhdNiUVYKRSKc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=l+TFAE1PpCgBwGxrWP20qdgpQEn6KfPgahDgTIJHZcJJM3boALs0P4tt0OQGhQIJN
 sqKB3b/3YajiAexL0R/1+yAwBChV7d7u8WWkgHQ00lqjgmcnhxYdlXaINXmVBlX4IQ
 0aWnkL6TMVMAd2ZzyybBHVYPQPPRw3hkt8wp5qkXrjjW0UR99uwj/DvY2+RAehjoro
 FatmBrhJ33ME2HFWR6LS5SUhCZniBDJElaJ6l/vWgzFmneVDiQPUPoYw79AHBXzf6t
 8AeLIFGLNbGkUdBgnEny9D5+1UvS3dCpqlr0lkgh+t7V3SFn06KVOEj5ZMfj6EwTSY
 daBkbLaM56VvQ==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: Anton Kochkov <anton.kochkov@proton.me>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH] can: fix Xilinx ZynqMP CAN RX FIFO logic
Message-ID: <20220812172420.1946484-1-anton.kochkov@proton.me>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.16;
 envelope-from=anton.kochkov@proton.me; helo=mail-4316.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Aug 2022 17:06:05 -0400
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
Reply-To: Anton Kochkov <anton.kochkov@proton.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Function "update_rx_fifo()" should operate on the RX FIFO
registers, not the TX FIFO ones.

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
Resolves: https://gitlab.com/qemu-projects/qemu/-/issues/1123
---
 hw/net/can/xlnx-zynqmp-can.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index 82ac48cee2..e93e6c5e19 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -696,30 +696,30 @@ static void update_rx_fifo(XlnxZynqMPCANState *s, con=
st qemu_can_frame *frame)
                                                timestamp));

             /* First 32 bit of the data. */
-            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA1_DB3_SHIFT=
,
-                                               R_TXFIFO_DATA1_DB3_LENGTH,
+            fifo32_push(&s->rx_fifo, deposit32(0, R_RXFIFO_DATA1_DB3_SHIFT=
,
+                                               R_RXFIFO_DATA1_DB3_LENGTH,
                                                frame->data[0]) |
-                                     deposit32(0, R_TXFIFO_DATA1_DB2_SHIFT=
,
-                                               R_TXFIFO_DATA1_DB2_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA1_DB2_SHIFT=
,
+                                               R_RXFIFO_DATA1_DB2_LENGTH,
                                                frame->data[1]) |
-                                     deposit32(0, R_TXFIFO_DATA1_DB1_SHIFT=
,
-                                               R_TXFIFO_DATA1_DB1_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA1_DB1_SHIFT=
,
+                                               R_RXFIFO_DATA1_DB1_LENGTH,
                                                frame->data[2]) |
-                                     deposit32(0, R_TXFIFO_DATA1_DB0_SHIFT=
,
-                                               R_TXFIFO_DATA1_DB0_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA1_DB0_SHIFT=
,
+                                               R_RXFIFO_DATA1_DB0_LENGTH,
                                                frame->data[3]));
             /* Last 32 bit of the data. */
-            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA2_DB7_SHIFT=
,
-                                               R_TXFIFO_DATA2_DB7_LENGTH,
+            fifo32_push(&s->rx_fifo, deposit32(0, R_RXFIFO_DATA2_DB7_SHIFT=
,
+                                               R_RXFIFO_DATA2_DB7_LENGTH,
                                                frame->data[4]) |
-                                     deposit32(0, R_TXFIFO_DATA2_DB6_SHIFT=
,
-                                               R_TXFIFO_DATA2_DB6_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA2_DB6_SHIFT=
,
+                                               R_RXFIFO_DATA2_DB6_LENGTH,
                                                frame->data[5]) |
-                                     deposit32(0, R_TXFIFO_DATA2_DB5_SHIFT=
,
-                                               R_TXFIFO_DATA2_DB5_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA2_DB5_SHIFT=
,
+                                               R_RXFIFO_DATA2_DB5_LENGTH,
                                                frame->data[6]) |
-                                     deposit32(0, R_TXFIFO_DATA2_DB4_SHIFT=
,
-                                               R_TXFIFO_DATA2_DB4_LENGTH,
+                                     deposit32(0, R_RXFIFO_DATA2_DB4_SHIFT=
,
+                                               R_RXFIFO_DATA2_DB4_LENGTH,
                                                frame->data[7]));

             ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
--
2.37.1



