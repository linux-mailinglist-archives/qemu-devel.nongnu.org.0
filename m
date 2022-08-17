Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9855970DB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:24:13 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJxs-0007tR-2e
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oOJw0-0004xi-CI
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:22:16 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oOJvw-00026J-M5
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:22:16 -0400
Date: Wed, 17 Aug 2022 14:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1660746126; x=1661005326;
 bh=f1oesnvE5hUnSBswW6uWqe8LvQAyQMlQpTSd/qigjCc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=mbOGbcoKXE2vw60/AefwhUNp0wDDat+UxEryX+fdwCOicP1WZj1Yk1l/u0kS8hBYI
 X0crOpRQXKjKuhlmQ9HTwwx0bWDpnPgxbSM9JhWlSlxVcG1rsl4/irj2hNaaam9zer
 XvTYWrwrty9p8hbfj2B90ORtLLTNnSGo/PHYz2+3pbJj4/SFOJXd5QTHFSzYTQIyrR
 6nHMRLMV/g3VhZm8b2wlBtjf4jkI+Dw7dRdCxDH8F72sTbetqbhUjXIp9f5FbFnxLR
 ODzUQxU4sdJnDbyTt+vND4Sf7sb7XfisKN6fGiP4u2WgtkLUuabJxHa7qw//b0BsEC
 YgweMsWPbtzlg==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: Anton Kochkov <anton.kochkov@proton.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2] hw/net/can: fix Xilinx ZynqMP CAN RX FIFO logic
Message-ID: <20220817141754.2105981-1-anton.kochkov@proton.me>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=188.165.51.139;
 envelope-from=anton.kochkov@proton.me; helo=mail-0301.mail-europe.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Anton Kochkov <anton.kochkov@proton.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For consistency, function "update_rx_fifo()" should use
the RX FIFO register names, not the TX FIFO ones even if
they refer to the same memory region.

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1123
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
2.37.2



