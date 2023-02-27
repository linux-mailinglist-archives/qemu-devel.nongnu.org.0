Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5926A440A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe9C-0006CA-3U; Mon, 27 Feb 2023 09:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe99-00061j-IO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:31 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe97-00082r-Uc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7231236wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aGiQ03h5DQob+9swZAW1Hsx6uEGDUvSbCmNrFqjMJNA=;
 b=k54x9RfxpUwwuABj9e2b1EhzkhnXWpZVtP8scRUJERndDNllaDI/06DbNYQhahwEvX
 P9sGHi4bdRRZDM6+IRgiIL0ZNWr7QZeNYnqtyj+IgrMEGLZZowIKv3m9MMtd6upEfz3+
 dFUXFX4ysxDNSeD+10g+QWOMhU3pS82s1LlBezWiFzZws4LwSgRKMucEX3RvUBV/SyGp
 fPd5n+za7VKP6NmMksdT4mEsnaBx6M/j5ndTIvSj1Ae8YvFE17gUA2md/KK1t/3ze6jS
 Fdu7YZt+D9YgaKyV0K9vJA+EhzSS59QvybyhBweKeAW11iawhFV/E3cZ9weQFpnpH9wn
 ue6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGiQ03h5DQob+9swZAW1Hsx6uEGDUvSbCmNrFqjMJNA=;
 b=4OVgoyYiWWa7BSQsSX6vSmIoeL1GsXqf310IYai7BAl/i0ahgSYH/NcJ2fgt26z2ud
 Ka+OXTjCa219BpgFuBCKkfTbtMAU2iTPoU+TDb/sKnRqwYfB4iSEARSKzjx2G+BHyqA4
 9YmSe8gSHul06XocoBTY6w8AxjphcbeYmRFG7nho0k3OQpuhw9f2HREfxNVay6kg5dHb
 OShMUNOYeGtmxoNZSjaG+eKAT1lqv7lpGi97nDPLl94Xc5lSYw8fbjLowVOk75KT9LYm
 TKEDkNoN+RZthpb71DyzYZbhUBRjzMmcSPMTxYyrnLNpP4IsXkiRRn+eRPJ8uLRIWWBf
 xY9g==
X-Gm-Message-State: AO0yUKVkZAn/JED5NHX0SbIYMHOsd+CdodheH0c2fUY9jWM2BqZikJDG
 DhyqKfJz9KIPDcYHyhL1rGMEpdsdClXgNjFi
X-Google-Smtp-Source: AK7set9hyCmSFl6Xu6gRlq63inoY9+mSa5ri0H1aU9jQFdK4ytLbK7ukJj54yYh4KPD3hvt6uiMxTQ==
X-Received: by 2002:a05:600c:4d18:b0:3ea:e554:7811 with SMTP id
 u24-20020a05600c4d1800b003eae5547811mr9932833wmp.10.1677506789011; 
 Mon, 27 Feb 2023 06:06:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c1d0400b003db0ad636d1sm14620759wms.28.2023.02.27.06.06.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 056/126] hw/isa/vt82c686: Remove intermediate IRQ forwarder
Date: Mon, 27 Feb 2023 15:01:03 +0100
Message-Id: <20230227140213.35084-47-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20230210163744.32182-5-philmd@linaro.org>
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


