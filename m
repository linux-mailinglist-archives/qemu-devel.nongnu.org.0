Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFF3FAABE
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 12:07:46 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKHj7-0007Zj-5C
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 06:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKHcy-0000xl-HD
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 06:01:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52164
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKHcw-0005bG-Ve
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 06:01:24 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKHcW-0007cB-FH; Sun, 29 Aug 2021 11:01:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 29 Aug 2021 11:01:02 +0100
Message-Id: <20210829100103.1950-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
References: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/3] escc: fix R_STATUS channel reset value
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

According to the "Z80X30 Register Reset Values" table in the ESCC datasheet
bits 2 and 6 are set whilst bits 0 and 1 are cleared during channel reset.
All other bits should be left unaltered.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 63e0f15dfa..0f6957ba8b 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -281,12 +281,11 @@ static void escc_reset_chn(ESCCChannelState *s)
     s->wregs[W_MISC2] = MISC2_PLLDIS;
     /* Enable most interrupts */
     s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
-        EXTINT_TXUNDRN | EXTINT_BRKINT;
+                         EXTINT_TXUNDRN | EXTINT_BRKINT;
+    s->rregs[R_STATUS] &= ~(STATUS_RXAV | STATUS_ZERO);
+    s->rregs[R_STATUS] |= STATUS_TXEMPTY | STATUS_TXUNDRN;
     if (s->disabled) {
-        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_DCD | STATUS_SYNC |
-            STATUS_CTS | STATUS_TXUNDRN;
-    } else {
-        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_TXUNDRN;
+        s->rregs[R_STATUS] |= STATUS_DCD | STATUS_CTS;
     }
     s->rregs[R_SPEC] = SPEC_BITS8 | SPEC_ALLSENT;
 
-- 
2.20.1


