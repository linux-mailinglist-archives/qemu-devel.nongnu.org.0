Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8569828A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:45:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLpP-0000hA-DT; Wed, 15 Feb 2023 12:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLpN-0000gj-MN
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLpL-0008EX-Ia
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so2951230wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRiYpacq2buGtsbzdt2U4edvI0iODkUmTaRGtL8ovas=;
 b=jDsZJRQLERfeLQ490jpStffMhiCHc+0Rwb7tmTYaJq0Kw6f+YIzHKeqnuJALZNPbAJ
 URQiKJ1Jgt4qncCRdljh3VUryyaUxWLFWFTt21xdoaz80sQlE1IArzmcK6mpuxHwqhDb
 ZOBcfs8MLY0rzQPRd9oHW2MVOm10HmIgfQ5tVRi9Qm1nHOWniVqlMJzjPEfq0GqVFEiD
 XmB7L3HDZoWo46KvkoyBicrBZ+xPsjAnYdi3OQiKxuvZKTlI4+3sZp+MN+LjvG98sSpB
 iuzEddUN4npG0E5L37O6WRfVOt3789FjxMaTxqx4YekzlaHL5ebxC6mC/eHo6c0ENmVn
 BH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRiYpacq2buGtsbzdt2U4edvI0iODkUmTaRGtL8ovas=;
 b=Pxx+ZzEyvsWXNBUpq4cSxGQkZ2T+rrT/14dPMgBZEowoqo+wxv9hjp4rGGooRLIfuo
 JhP9OTAohHQW81BzMOTD7Ule2dlnfuK8dnRi0Y3i37wsgVm6gvYBYFjmxtqz8uUkHgKG
 8H3b9MP5TJF+ubmSwKCo6ooozdxw5tBce0MZnUHG82aqXlyfwnU++cjoA8YCKVcTWiJW
 RHNEb1gW4OYgBm2zXi1+zipWQKj6Y/XDsb6pfxKlplTX1uF/Lpm/UgjL5Mlho/LjEzFI
 FsNBiy66jrGetGJfpdd/Lj0+9BZtgEycYyTOESM1dqmkNVjqOvNi2/N4kj5l3G9WiiIx
 0OhQ==
X-Gm-Message-State: AO0yUKVJQAcxFzCnijAtMkQCCftYn0G3z49HHCpdLQAq6u3uHBf8pPVK
 Q9tqbpXgmd2GeNhwuNUfYvmFE/ufM0t76mNH
X-Google-Smtp-Source: AK7set8jnVvjneWIxfxH9Bn5U/pjoZeBdZs+qd4MTX4M47EdU+EutDCEiNwQ6TNvB3qvIVBBMpJe7w==
X-Received: by 2002:a05:600c:318a:b0:3db:5f1:53a5 with SMTP id
 s10-20020a05600c318a00b003db05f153a5mr2757152wmp.20.1676483058010; 
 Wed, 15 Feb 2023 09:44:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c021500b003e209186c07sm414427wmi.19.2023.02.15.09.44.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 09:44:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 4/5] hw/timer/i8254: Really inline i8254_pit_init()
Date: Wed, 15 Feb 2023 18:43:52 +0100
Message-Id: <20230215174353.37097-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215174353.37097-1-philmd@linaro.org>
References: <20230215174353.37097-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

In-line the one-line i8254_pit_create() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/microvm.c        | 2 +-
 hw/isa/i82378.c          | 2 +-
 hw/isa/piix4.c           | 4 ++--
 hw/isa/vt82c686.c        | 2 +-
 hw/mips/jazz.c           | 2 +-
 include/hw/timer/i8254.h | 7 -------
 6 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 29f30dd6d3..9204bb4ff2 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -261,7 +261,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         if (kvm_pit_in_kernel()) {
             kvm_pit_init(isa_bus, 0x40);
         } else {
-            i8254_pit_init(isa_bus, 0x40, 0, NULL);
+            i8254_pit_create(isa_bus, 0x40, isa_bus_get_irq(isa_bus, 0));
         }
     }
 
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index e3322e03bf..f75f5a23ba 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -99,7 +99,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     isa_bus_irqs(isabus, s->i8259);
 
     /* 1 82C54 (pit) */
-    pit = i8254_pit_init(isabus, 0x40, 0, NULL);
+    pit = i8254_pit_create(isabus, 0x40, isa_bus_get_irq(isabus, 0));
 
     /* speaker */
     pcspk_init(isa_new(TYPE_PC_SPEAKER), isabus, pit);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 94e5dc7825..8ff118445f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -214,8 +214,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* initialize ISA irqs */
     isa_bus_irqs(isa_bus, s->isa);
 
-    /* initialize pit */
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    /* PIT */
+    i8254_pit_create(isa_bus, 0x40, isa_bus_get_irq(isa_bus, 0));
 
     /* DMA */
     i8257_dma_init(isa_bus, 0);
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..297bcda420 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -624,7 +624,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
 
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8254_pit_create(isa_bus, 0x40, isa_bus_get_irq(isa_bus, 0));
     i8257_dma_init(isa_bus, 0);
 
     /* RTC */
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6aefe9a61b..856acfe2a7 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -251,7 +251,7 @@ static void mips_jazz_init(MachineState *machine,
     i8259 = i8259_init(isa_bus, env->irq[4]);
     isa_bus_irqs(isa_bus, i8259);
     i8257_dma_init(isa_bus, 0);
-    pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    pit = i8254_pit_create(isa_bus, 0x40, isa_bus_get_irq(isa_bus, 0));
     pcspk_init(isa_new(TYPE_PC_SPEAKER), isa_bus, pit);
 
     /* Video card */
diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index 0d837f3f41..aa48c44d39 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -56,13 +56,6 @@ OBJECT_DECLARE_TYPE(PITCommonState, PITCommonClass, PIT_COMMON)
  */
 ISADevice *i8254_pit_create(ISABus *bus, int iobase, qemu_irq irq_in);
 
-static inline ISADevice *i8254_pit_init(ISABus *bus, int base, int isa_irq,
-                                        qemu_irq alt_irq)
-{
-    assert(isa_irq == 0 && alt_irq == NULL);
-    return i8254_pit_create(bus, base, isa_bus_get_irq(bus, 0));
-}
-
 static inline ISADevice *kvm_pit_init(ISABus *bus, int base)
 {
     DeviceState *dev;
-- 
2.38.1


