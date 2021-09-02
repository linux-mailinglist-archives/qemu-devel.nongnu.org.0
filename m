Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A733A3FEC1A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:24:59 +0200 (CEST)
Received: from localhost ([::1]:53870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjty-0001iW-Hy
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjs2-0006Zj-0Z
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57668
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjs0-0001lC-9o
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:57 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrY-0000t5-RY; Thu, 02 Sep 2021 11:22:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  2 Sep 2021 11:22:04 +0100
Message-Id: <20210902102205.7554-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 8/9] escc: re-use escc_reset_chn() for hard and soft reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes duplication of the internal device state initialisation from all
of device reset, soft reset and hard reset.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index c6b477ef78..29fcdcb625 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -291,7 +291,8 @@ static void escc_reset_chn(ESCCChannelState *s)
 
 static void escc_soft_reset_chn(ESCCChannelState *s)
 {
-    s->reg = 0;
+    escc_reset_chn(s);
+
     s->wregs[W_CMD] = 0;
     s->wregs[W_INTR] &= ~(INTR_INTALL | INTR_TXINT | INTR_RXINT1ST |
                           INTR_RXINTALL | INTR_WTDMA_EN | INTR_WTDMA_RQ);
@@ -318,17 +319,12 @@ static void escc_soft_reset_chn(ESCCChannelState *s)
     s->rregs[R_SPEC] |= SPEC_BITS8;
     s->rregs[R_INTR] = 0;
     s->rregs[R_MISC] &= ~MISC_2CLKMISS;
-
-    s->rx = s->tx = 0;
-    s->rxint = s->txint = 0;
-    s->rxint_under_svc = s->txint_under_svc = 0;
-    s->e0_mode = s->led_mode = s->caps_lock_mode = s->num_lock_mode = 0;
-    clear_queue(s);
 }
 
 static void escc_hard_reset_chn(ESCCChannelState *s)
 {
-    s->reg = 0;
+    escc_reset_chn(s);
+
     s->wregs[W_CMD] = 0;
     s->wregs[W_INTR] &= ~(INTR_INTALL | INTR_TXINT | INTR_RXINT1ST |
                           INTR_RXINTALL | INTR_WTDMA_EN | INTR_WTDMA_RQ);
@@ -357,12 +353,6 @@ static void escc_hard_reset_chn(ESCCChannelState *s)
     s->rregs[R_SPEC] |= SPEC_BITS8;
     s->rregs[R_INTR] = 0;
     s->rregs[R_MISC] &= ~MISC_2CLKMISS;
-
-    s->rx = s->tx = 0;
-    s->rxint = s->txint = 0;
-    s->rxint_under_svc = s->txint_under_svc = 0;
-    s->e0_mode = s->led_mode = s->caps_lock_mode = s->num_lock_mode = 0;
-    clear_queue(s);
 }
 
 static void escc_reset(DeviceState *d)
-- 
2.20.1


