Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2185A6A6420
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 01:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXA9r-0008L8-F6; Tue, 28 Feb 2023 19:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXA9n-0008IJ-B7; Tue, 28 Feb 2023 19:17:19 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXA9l-0001im-Pp; Tue, 28 Feb 2023 19:17:19 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 96498746705;
 Wed,  1 Mar 2023 01:17:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6175F74645F; Wed,  1 Mar 2023 01:17:11 +0100 (CET)
Message-Id: <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677628524.git.balaton@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 5/7] hw/isa/vt82c686: Work around missing level sensitive
 irq in i8259 model
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Date: Wed,  1 Mar 2023 01:17:11 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

MorphOS sets the ISA PIC to level sensitive mode but QEMU does not
support that so this causes a freeze if multiple devices try to raise
a shared interrupt. Work around it by lowering the interrupt before
raising it again if it is already raised. This could be reverted when
the i8259 model is fixed.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 018a119964..3e44a51f92 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -549,6 +549,7 @@ struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs_in;
+    uint16_t isa_irqs_state;
     ViaSuperIOState via_sio;
     MC146818RtcState rtc;
     PCIIDEState ide;
@@ -636,6 +637,14 @@ static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
             pic_level |= pci_bus_get_irq_level(bus, i);
         }
     }
+    /* FIXME: workaround for i8259: level sensitive irq not supported */
+    if ((s->isa_irqs_state & BIT(pic_irq)) && pic_level) {
+        qemu_irq_lower(s->isa_irqs_in[pic_irq]);
+    } else if (pic_level) {
+        s->isa_irqs_state |= BIT(pic_irq);
+    } else {
+        s->isa_irqs_state &= ~BIT(pic_irq);
+    }
     /* Now we change the pic irq level according to the via irq mappings. */
     qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
 }
-- 
2.30.8


