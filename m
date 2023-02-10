Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A603569237B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWPk-0000gt-2A; Fri, 10 Feb 2023 11:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPa-0000Y5-KK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:12 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPY-0000G2-RK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:10 -0500
Received: by mail-wr1-x436.google.com with SMTP id bu23so5612599wrb.8
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tAEskSQoIREJd0prgZX4+7TZ4EJFCBxdpEPk1pPdPMY=;
 b=hEiJbTLU1hRmpzn+EbxZxEEocXV6+FKcv+TMay1NE4ZVuwqoQ4JuIHzBg6nNdts845
 idca82N3dnJBIPw6L+sfz4QMPH3IutaKYx7mjgaf9UcFKT9tZ6IHmAiG0rpviHdNGpAT
 bJwk+0OCayOw7wzOVPrFwWWHMYu/3QkOdg5Ewfnp7I4pQ1WghSTkqYm5nifUokAfgJh7
 EnV/RiCW2ivAJihRBEErWG1xV3+pQSSvhaig3Nn4M7dDDBmcGZWa9Y7nGDP1hek3rCz+
 H0qJK7IGzX2eke4V6zjKUMXXHCWDppu3x3X+8X0hkgeTt7PSbur0kCNYxulJX8ffglxg
 q5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tAEskSQoIREJd0prgZX4+7TZ4EJFCBxdpEPk1pPdPMY=;
 b=y+it0DJYtRa4zcRKWIyxg+lCuB7wneD/AcNCIqbBkGqbqHMI9FhQYJ+IAfS2Wx7Ryj
 +uynyO//UgTC6rNTJC99N5+yx68ahQEHYlnX9v7Aj1ovbeaHapPVV3TV7KHd/ufyGgGa
 Q/VipfeXySmxGpkCy9sUQK+Rol4zpkIeN3TcG0vkxK1WVKLedJmRhSQhFw8NLipOLfnw
 bX0SoiZoJTe7WQQtTOwRFwynxc7nGUjmScCpWLJrh5KEOFdq9QhOJZVFcZmGJJzOkVJz
 mXb1XZ6mZJkDqPqlAPIjgH0lz0UGspF9KhiesAbb5CfrHWgYDYTcYs9mEXYJH7KtowGB
 wVMQ==
X-Gm-Message-State: AO0yUKV1d2ey1pJ5P6CQdcQW+jJCFQXXIsA2zudLYR57qvMo6i1aVrtu
 VfUcCKJRz69lmg5f4RIRARA7hu3btRfIqm1G
X-Google-Smtp-Source: AK7set/jmIuHOb+7Iu+C79DVSrSpia/7+J6MESQ7/TE+LZFGfwCOvRrG8XOvbYFNm3JRR040HNRlyw==
X-Received: by 2002:a5d:6110:0:b0:2c3:dfcb:afc4 with SMTP id
 v16-20020a5d6110000000b002c3dfcbafc4mr13268708wrt.27.1676047087087; 
 Fri, 10 Feb 2023 08:38:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adff203000000b002c3f6d7d5fesm4086640wro.44.2023.02.10.08.38.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 04/11] hw/isa/vt82c686: Remove intermediate IRQ forwarder
Date: Fri, 10 Feb 2023 17:37:37 +0100
Message-Id: <20230210163744.32182-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Directly dispatch ISA IRQs to 'cpu_intr' output IRQ
by removing the intermediate via_isa_request_i8259_irq()
handler. Rename ISA IRQs array as 'isa_irqs_in' to
emphasize these are input IRQs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/vt82c686.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..a913a509f7 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -548,7 +548,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
 struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
-    qemu_irq *isa_irqs;
+    qemu_irq *isa_irqs_in;
     ViaSuperIOState via_sio;
     RTCState rtc;
     PCIIDEState ide;
@@ -595,13 +595,7 @@ static const TypeInfo via_isa_info = {
 void via_isa_set_irq(PCIDevice *d, int n, int level)
 {
     ViaISAState *s = VIA_ISA(d);
-    qemu_set_irq(s->isa_irqs[n], level);
-}
-
-static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
-{
-    ViaISAState *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
+    qemu_set_irq(s->isa_irqs_in[n], level);
 }
 
 static void via_isa_realize(PCIDevice *d, Error **errp)
@@ -609,12 +603,10 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     PCIBus *pci_bus = pci_get_bus(d);
-    qemu_irq *isa_irq;
     ISABus *isa_bus;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           errp);
 
@@ -622,8 +614,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
         return;
     }
 
-    s->isa_irqs = i8259_init(isa_bus, *isa_irq);
-    isa_bus_irqs(isa_bus, s->isa_irqs);
+    s->isa_irqs_in = i8259_init(isa_bus, s->cpu_intr);
+    isa_bus_irqs(isa_bus, s->isa_irqs_in);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
 
-- 
2.38.1


