Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57663FFF7C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:58:33 +0200 (CEST)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7q4-0002z2-PZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mM7R3-0001uS-ST
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:32:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59830
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mM7R2-0005nn-D9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:32:41 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mM7Qc-0009kl-8N; Fri, 03 Sep 2021 12:32:18 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Fri,  3 Sep 2021 12:32:16 +0100
Message-Id: <20210903113223.19551-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 2/9] escc: reset register values to zero in escc_reset()
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

This is to ensure that a device reset always returns the ESCC to a known state.

Note that this is currently redundant with the same code in escc_reset_chn()
but that will change shortly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index c87ecd59d8..b0d3b92dc1 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -300,9 +300,24 @@ static void escc_reset_chn(ESCCChannelState *s)
 static void escc_reset(DeviceState *d)
 {
     ESCCState *s = ESCC(d);
+    int i, j;
 
-    escc_reset_chn(&s->chn[0]);
-    escc_reset_chn(&s->chn[1]);
+    for (i = 0; i < 2; i++) {
+        ESCCChannelState *cs = &s->chn[i];
+
+        /*
+         * According to the ESCC datasheet "Miscellaneous Questions" section
+         * on page 384, the values of the ESCC registers are not guaranteed on
+         * power-on until an explicit hardware or software reset has been
+         * issued. For now we zero the registers so that a device reset always
+         * returns the emulated device to a fixed state.
+         */
+        for (j = 0; j < ESCC_SERIAL_REGS; j++) {
+            cs->rregs[j] = 0;
+            cs->wregs[j] = 0;
+        }
+        escc_reset_chn(cs);
+    }
 }
 
 static inline void set_rxint(ESCCChannelState *s)
-- 
2.20.1


