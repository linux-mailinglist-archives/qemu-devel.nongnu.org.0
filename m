Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D76AFAC1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh33-0004kF-Nf; Tue, 07 Mar 2023 18:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh30-0004WN-0t
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:46 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2y-0002u3-8y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso196461wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvZA9kHv9vC3q4gyCksHVwK7luWn5sDCN4JTXjtF+kU=;
 b=A5kVc/GeqbJTFVVopw3C2R0ZYUj3G633doRkKCInHYAkoIADBunNYWarVQqnxWFzwW
 XMy4OZfHn+3sBcSRksMrREdEDbFwknEH5rZc9HpznNbqNSRMtkt+xPGkMgKBMVCHPvmB
 aVIyzpUF/XBdVJbvxQAUYgXS8ZEjGh1xd8vy9ECVUjBGITZF4V9q9EAur0BMQrd69WqE
 GCoCao50MbfeMDOBU0L3OFbCNla+TSsFQo5Yxgz2yk7oy8eVHpAn92zlMbvluBOsiCHw
 /Kn5Bk6dzU4UH8gnXrwP1yGTujNqjszfD39xb/KnwATOyVetyQIaA3p/Wr8wTSVt0azo
 kHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvZA9kHv9vC3q4gyCksHVwK7luWn5sDCN4JTXjtF+kU=;
 b=VlkhfZ8EOG+RaCPoYg30uGSptDf+PV1SASvFyCk2wwrwVH2969TkItTui9zbd4zkmT
 LP1lw6POhG/7/OCW/HwsvkvcCJeJj6UQfasZPulKfZ+G8hBiLceQd+umuRIB2YghFCw2
 rXL7zhf7ymhl+CESOMbFBfnhYRFdT4IPuJv4BwwJ8LnxbcWmL+tVX15H9vh+jc1dIP6b
 GpLNHZlRsnawQhl3knAwRJyfIXuGLxCOAREx5tlM1TKTTm12qYc+yZZjFbmlktUWRipy
 3EMN5sEjJ/PQ0u+9mcpfe0IXau5J/cRZmJCaJPQqbQwQgZsuJJcruBWfdid2zwm20kEN
 TfCw==
X-Gm-Message-State: AO0yUKX7GlkkHT5+4aT+nN8p0zinn+G7bNlPQf67cMQRu7MoE/ezUCQO
 JGNpAiGUEPBRQWotp3IxkuwhqJBr4nHIlPVNem0=
X-Google-Smtp-Source: AK7set9m3apu0wbnTk+EhTO+Tqmj6YIBHEmTYwtqiU8Ualh2Ek6949PeycYq6kq4AApu4kOxvub8Mw==
X-Received: by 2002:a05:600c:450b:b0:3ea:ea8a:a94a with SMTP id
 t11-20020a05600c450b00b003eaea8aa94amr14921165wmo.27.1678232922525; 
 Tue, 07 Mar 2023 15:48:42 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 q30-20020a05600c331e00b003dc5b59ed7asm13912209wmp.11.2023.03.07.15.48.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Rene Engel <ReneEngel80@emailn.de>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 15/20] hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
Date: Wed,  8 Mar 2023 00:47:06 +0100
Message-Id: <20230307234711.55375-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

According to the PCI specification, PCI_INTERRUPT_LINE shall have no
effect on hardware operations. Now that the VIA south bridges implement
the internal PCI interrupt router let's be more conformant to the PCI
specification.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <9fb86a74d16db65e3aafbb154238d55e123053eb.1678188711.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/vt82c686-uhci-pci.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 46a901f56f..b4884c9011 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,17 +1,7 @@
 #include "qemu/osdep.h"
-#include "hw/irq.h"
 #include "hw/isa/vt82c686.h"
 #include "hcd-uhci.h"
 
-static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
-{
-    UHCIState *s = opaque;
-    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
-    if (irq > 0 && irq < 15) {
-        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
-    }
-}
-
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -25,8 +15,6 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
-    object_unref(s->irq);
-    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.38.1


