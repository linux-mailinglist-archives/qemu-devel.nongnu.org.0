Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCCE559AD4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:01:10 +0200 (CEST)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jrw-0003LO-TY
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaX-0001SU-BL; Fri, 24 Jun 2022 09:43:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaT-0005FY-FN; Fri, 24 Jun 2022 09:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ltZ3+GgmUYaGJn2M/PGmFQmXCQadV/DJAVJw9ttqRfM=; b=b0EIeHVE9Q3Hxo2l2HAJveXco2
 YsYd0E5uTqj0OY0QGKxh8Oju7rKx1Aj11EHgyIbPHjRtAik8vYSXJeI62AxROFeowSzHBKU9xtoUD
 ubCeXadVWm+BxCSCZkKVq06PVMhCNdDVD6oT0DjGU5zCmKNl0ocyFYhX3sjIHEwhP9bHMWld8UYMt
 S8F9s4FY77EEof5U+AGXgvMmijQdAoudQGJq//JSw3LyLO4hvemL3wET65m63bHFo9EE0tWfTjLok
 DebBWmdocxz+8Hjd1J0tW3VEG2IFsqkrC4giAUKHj0FKBBFKMLINldnobYdlFdgKlgvO1k4UckEM6
 9dRcNI0HPpo3Rz4TV20jghnuRc71VYRr3MkZAxWxeRc3WLxdICKzcNPDstI+Bts00eDDZOfKWLo3p
 8Rl8VZldiNzjMNYU+OL6Axtq2U84ZGI4TqagQ4VZdJtcG2GNC1aFzXplYVr5M//7/35sMmQkXfScG
 CqezXiPZswoyBqey1OD5necXgZ90mEewR4qRmsp1SGv1hptGTlESp5dx2RPRIhMBwGCNBkz40mLeX
 UgWh7oaubejThmAhV6rkwdnFkbnIMl5bfT2l1vTN58PXIC8GscItmBx2JiAJpDT3eOKuWI3k9nVXH
 LGMMPXOAwdMw/usxGa4VpAMEMLDr+6RfagI+ZlI/Q=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYr-00037t-IQ; Fri, 24 Jun 2022 14:41:29 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:38 +0100
Message-Id: <20220624134109.881989-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 23/54] pckbd: add mask qdev property to I8042_MMIO device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the KBDState mask value to be set using a qdev property rather
than directly in i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 7b520d0eb4..c04a2c587e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -673,11 +673,17 @@ static void i8042_mmio_reset(DeviceState *dev)
     kbd_reset(ks);
 }
 
+static Property i8042_mmio_properties[] = {
+    DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = i8042_mmio_reset;
+    device_class_set_props(dc, i8042_mmio_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -689,12 +695,12 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     KBDState *s;
 
     dev = qdev_new(TYPE_I8042_MMIO);
+    qdev_prop_set_uint64(dev, "mask", mask);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = &I8042_MMIO(dev)->kbd;
 
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
-    s->mask = mask;
 
     s->extended_state = true;
 
-- 
2.30.2


