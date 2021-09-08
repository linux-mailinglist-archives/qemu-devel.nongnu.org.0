Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AF740397C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:08:29 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwNQ-0000Mu-Mm
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwBC-0006gU-CV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59078
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwBA-0005ij-TM
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:50 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwB5-0009u6-Qq; Wed, 08 Sep 2021 12:55:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  8 Sep 2021 12:54:51 +0100
Message-Id: <20210908115451.9821-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
References: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 12/12] escc: fix STATUS_SYNC bit in R_STATUS register
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

After an SDLC "Enter hunt" command has been sent the STATUS_SYNC bit should remain
high until the flag byte has been detected. Whilst the ESCC device doesn't yet
implement SDLC mode, without this change the active low STATUS_SYNC is constantly
asserted causing the MacOS OpenTransport extension to hang on startup as it thinks
it is constantly receiving LocalTalk responses during its initial negotiation
phase.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210903113223.19551-10-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 9283ed70a6..0fce4f6324 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -94,6 +94,7 @@
 #define W_IVEC    2
 #define W_RXCTRL  3
 #define RXCTRL_RXEN    0x01
+#define RXCTRL_HUNT    0x10
 #define W_TXCTRL1 4
 #define TXCTRL1_PAREN  0x01
 #define TXCTRL1_PAREV  0x02
@@ -561,7 +562,13 @@ static void escc_mem_write(void *opaque, hwaddr addr,
                 break;
             }
             break;
-        case W_INTR ... W_RXCTRL:
+        case W_RXCTRL:
+            s->wregs[s->reg] = val;
+            if (val & RXCTRL_HUNT) {
+                s->rregs[R_STATUS] |= STATUS_SYNC;
+            }
+            break;
+        case W_INTR ... W_IVEC:
         case W_SYNC1 ... W_TXBUF:
         case W_MISC1 ... W_CLOCK:
         case W_MISC2 ... W_EXTINT:
-- 
2.20.1


