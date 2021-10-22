Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC14372A5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:23:06 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdotN-0000fL-Sl
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonj-0000zA-Oh
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:15 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdong-0003Iu-3T
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:15 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mo7Bb-1n1s8T28RX-00peRp; Fri, 22
 Oct 2021 09:17:10 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] q800: wire up remaining IRQs in classic mode
Date: Fri, 22 Oct 2021 09:17:03 +0200
Message-Id: <20211022071705.471954-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:piRksRMWMSCZU2eJN0db4zmOBuY/bRV8K+UDyQGra/ATseqR0q7
 TngPxg6/2rQPjyr8UO9BcoQwp+5/93Gi82vG9c4+GMVV5Y+KOYRaggUkxBXVUt7GXOzfjGw
 qlGfOAtePn00Nhj03imS4sEpn1EViN4LOgaCGFfcXe7Nl9Laa9JK+3n5bl1ckKICHa5145I
 H+FITylIIRFo3FLD6/fhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PW/GfesSVrU=:mj3aEgIHlm6tpVZ6JFsuU3
 26SB54OHZTSBbFEayl06PoYDdv9uqGSfG84ihJwfsVcVqteoO1B5og3nYRHE6YC5A1OyxOHt9
 6bpDdge6KwtgDu4g5iRy+a93+96+tF/qKg2E9Oquue54nxYebm40jseWlZvP6jKAZNrhMd7lg
 BDINnJwtXRHcwr0/4EODyVo1ajXkTUaFS4Bh9ydRxCknZbwik4gorBglTWP4PgDvTDQnjejyN
 GIGFEtV2WuDGIVJjsrHN5+svjXmnanVe2cd5gM2eevFQP83sygkwHjgmWClfSj0R/i40gDIj7
 wnwEc8U5fUdLdRka2TgiXDx89kSF5AZAf0puuvGNiJT3LMWgyYvdp8ufh9aBv/vjRkuVjuOhR
 /18rQomgG7qY4Xq6Umjm4Svd8/os0n80swDXA97o+tpS8XgotlGI5ZX3AufAOabBsGVIIkOao
 iQye43dejFX1fb5cwAh3ZFdJIsA822AfaS42mwHysfX+QWvBm+uotqtCHIKvAL+pZQSXGPRIs
 vJDgvamzkE3V4NKcsPSxmWXUb3GSAhuiXguc7gN7Uuyww1Bte6l/OgtOSJ13ZmuCebIChyZWv
 ee252httZyN/ivrzGNe460yu3Pp1ZsCPh3/IVRBRtNjHIpIh0DLDO6W8mp+Zt6lmEVcpA0vW+
 51MRPb5JrwABVKGtS0D21gB18fV7mirlkh6uqwqVZ+3mJ1mUYWonhTD2rtml0QNpw/BY=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Explicitly wire up the remaining IRQs in classic mode to enable the use of
g_assert_not_reached() in the default case to detect any unexpected IRQs.

Add a comment explaining the IRQ routing differences in A/UX mode based
upon the comments in NetBSD (also noting that at least A/UX 3.0.1 still
uses classic mode).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 7a8de089f4d8..83fde3929834 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -111,6 +111,37 @@ struct GLUEState {
 
 #define GLUE_IRQ_NUBUS_9       0
 
+/*
+ * The GLUE logic on the Quadra 800 supports 2 different IRQ routing modes
+ * controlled from the VIA1 auxmode GPIO (port B bit 6) which are documented
+ * in NetBSD as follows:
+ *
+ * A/UX mode (Linux, NetBSD, auxmode GPIO low)
+ *
+ *   Level 0:        Spurious: ignored
+ *   Level 1:        Software
+ *   Level 2:        VIA2 (except ethernet, sound)
+ *   Level 3:        Ethernet
+ *   Level 4:        Serial (SCC)
+ *   Level 5:        Sound
+ *   Level 6:        VIA1
+ *   Level 7:        NMIs: parity errors, RESET button, YANCC error
+ *
+ * Classic mode (default: used by MacOS, A/UX 3.0.1, auxmode GPIO high)
+ *
+ *   Level 0:        Spurious: ignored
+ *   Level 1:        VIA1 (clock, ADB)
+ *   Level 2:        VIA2 (NuBus, SCSI)
+ *   Level 3:
+ *   Level 4:        Serial (SCC)
+ *   Level 5:
+ *   Level 6:
+ *   Level 7:        Non-maskable: parity errors, RESET button
+ *
+ * Note that despite references to A/UX mode in Linux and NetBSD, at least
+ * A/UX 3.0.1 still uses Classic mode.
+ */
+
 static void GLUE_set_irq(void *opaque, int irq, int level)
 {
     GLUEState *s = opaque;
@@ -119,10 +150,25 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
     if (s->auxmode) {
         /* Classic mode */
         switch (irq) {
+        case GLUE_IRQ_IN_VIA1:
+            irq = 0;
+            break;
+
+        case GLUE_IRQ_IN_VIA2:
+            irq = 1;
+            break;
+
         case GLUE_IRQ_IN_SONIC:
             /* Route to VIA2 instead */
             qemu_set_irq(s->irqs[GLUE_IRQ_NUBUS_9], level);
             return;
+
+        case GLUE_IRQ_IN_ESCC:
+            irq = 3;
+            break;
+
+        default:
+            g_assert_not_reached();
         }
     } else {
         /* A/UX mode */
@@ -142,6 +188,9 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
         case GLUE_IRQ_IN_ESCC:
             irq = 3;
             break;
+
+        default:
+            g_assert_not_reached();
         }
     }
 
-- 
2.31.1


