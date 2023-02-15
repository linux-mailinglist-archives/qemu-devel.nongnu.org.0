Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41A96980A2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKSl-0006gr-3L; Wed, 15 Feb 2023 11:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKSj-0006ft-7q
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:16:53 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKSg-0008Cs-GT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:16:52 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so2639318wmp.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHQyFWJ9e+LELEF6P8mJecAKwVQHuIPaArP4zvDKZCY=;
 b=eXOOtKTb2mrOKpdDpoR8HS5FzJVJZddjtQ1bU8NGxAmPmwIYV5WUDBYYTwZVGi8YVT
 ulUMrGNXBRLxSSzjR4irR5wULPCcNkWmXXjiDcZ3KMd4yH4IFssa/0YRCoClWT3wf/Ak
 CNm82EBMrJ3Kz6tpfdMN3Ucq8uM2Y0bY9DDmQOC0IQ8bNnB+m1OteOlArg3LOkQrrpHB
 sI1cQdR5kZ2xQiyt32N2s+hbwEWoOkdoH3vjloVFrw6Ok5Tilite1bV4oOwai7SwyKyk
 PdT9VWgU9TfIJcKvqzmzmtuM8SRP73OYd1hb7oo1xNJjJB9t1Z4Naube8y6pF9fknsCS
 anaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHQyFWJ9e+LELEF6P8mJecAKwVQHuIPaArP4zvDKZCY=;
 b=seZWVv4cP5iepdtzMLw+sdX6weDRR/VZcbMuaEbm8wkf0qCNNH8rug1rOo8cYHpjGf
 aD9yeU+7ORZjL/utsPwGTE0B+kXUScTr1PY92CiciGAjclmAPMGE4fQv+wKKxun44CXG
 qzg6keYIxiBaCfVUYrdZAWOy0LSX+4Cfd6lAkadSSaQFgrcNJJcxfEAIVE+RfAPg+oWC
 jexZBjvjndyPGWPlMI5zoIPykeSfaetnoMa8uOOGIjOcZvVAKyMjbk1RZPswgew93VvQ
 3ilUlFRgDBmOWzLEBNI6nvJwhlr2IlNt+uKSTImbLWQYo1BF0aGC/LEZ5zLfE8nRzEAy
 nkUA==
X-Gm-Message-State: AO0yUKXNZWhI9goPCz6tvJVJym8MlH8m77gvV2QI0J+r0CNvz7h3hor+
 VoVAjSdMU90FaX1R9kk9B+eSYSrSc/bWnWD0
X-Google-Smtp-Source: AK7set8zwfHWiGePc0l21AXrcu9vRq4Xe8OoVh8qQuZ4QotjxbvKKuYClFu9ma6ouPqNyuguMwU4+g==
X-Received: by 2002:a05:600c:2b0f:b0:3dc:4633:9844 with SMTP id
 y15-20020a05600c2b0f00b003dc46339844mr2818954wme.17.1676477808869; 
 Wed, 15 Feb 2023 08:16:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003dc4aae4739sm2444929wmc.27.2023.02.15.08.16.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:16:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 01/18] hw/isa: Rename isa_get_dma() -> isa_bus_get_dma()
Date: Wed, 15 Feb 2023 17:16:24 +0100
Message-Id: <20230215161641.32663-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

isa_get_dma() returns a DMA channel handler from an ISABus.
To emphasize this, rename it as isa_bus_get_dma().

Mechanical change using:

  $ sed -i -e 's/isa_get_dma/isa_bus_get_dma/g' \
        $(git grep -l isa_get_dma)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/cs4231a.c   | 2 +-
 hw/audio/gus.c       | 2 +-
 hw/audio/sb16.c      | 4 ++--
 hw/block/fdc-isa.c   | 2 +-
 hw/dma/i82374.c      | 2 +-
 hw/isa/isa-bus.c     | 2 +-
 include/hw/isa/isa.h | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 7f17a72a9c..ec066fcd89 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -671,7 +671,7 @@ static void cs4231a_realizefn (DeviceState *dev, Error **errp)
     CSState *s = CS4231A (dev);
     IsaDmaClass *k;
 
-    s->isa_dma = isa_get_dma(isa_bus_from_device(d), s->dma);
+    s->isa_dma = isa_bus_get_dma(isa_bus_from_device(d), s->dma);
     if (!s->isa_dma) {
         error_setg(errp, "ISA controller does not support DMA");
         return;
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 42f010b671..2a08a0f7d7 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -240,7 +240,7 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
     IsaDmaClass *k;
     struct audsettings as;
 
-    s->isa_dma = isa_get_dma(isa_bus_from_device(d), s->emu.gusdma);
+    s->isa_dma = isa_bus_get_dma(isa_bus_from_device(d), s->emu.gusdma);
     if (!s->isa_dma) {
         error_setg(errp, "ISA controller does not support DMA");
         return;
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 2215386ddb..ae745c7283 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1401,8 +1401,8 @@ static void sb16_realizefn (DeviceState *dev, Error **errp)
     SB16State *s = SB16 (dev);
     IsaDmaClass *k;
 
-    s->isa_hdma = isa_get_dma(isa_bus_from_device(isadev), s->hdma);
-    s->isa_dma = isa_get_dma(isa_bus_from_device(isadev), s->dma);
+    s->isa_hdma = isa_bus_get_dma(isa_bus_from_device(isadev), s->hdma);
+    s->isa_dma = isa_bus_get_dma(isa_bus_from_device(isadev), s->dma);
     if (!s->isa_dma || !s->isa_hdma) {
         error_setg(errp, "ISA controller does not support DMA");
         return;
diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index fee1ca68a8..a5f07b668d 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -98,7 +98,7 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
     fdctrl->dma_chann = isa->dma;
     if (fdctrl->dma_chann != -1) {
         IsaDmaClass *k;
-        fdctrl->dma = isa_get_dma(isa_bus_from_device(isadev), isa->dma);
+        fdctrl->dma = isa_bus_get_dma(isa_bus_from_device(isadev), isa->dma);
         if (!fdctrl->dma) {
             error_setg(errp, "ISA controller does not support DMA");
             return;
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 34c3aaf7d3..63734c22c9 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -125,7 +125,7 @@ static void i82374_realize(DeviceState *dev, Error **errp)
     I82374State *s = I82374(dev);
     ISABus *isa_bus = isa_bus_from_device(ISA_DEVICE(dev));
 
-    if (isa_get_dma(isa_bus, 0)) {
+    if (isa_bus_get_dma(isa_bus, 0)) {
         error_setg(errp, "DMA already initialized on ISA bus");
         return;
     }
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index f155b80010..39111f74cc 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -99,7 +99,7 @@ void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16)
     bus->dma[1] = dma16;
 }
 
-IsaDma *isa_get_dma(ISABus *bus, int nchan)
+IsaDma *isa_bus_get_dma(ISABus *bus, int nchan)
 {
     assert(bus);
     return bus->dma[nchan > 3 ? 1 : 0];
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 25acd5c34c..029d6e90bf 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -77,7 +77,7 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
-IsaDma *isa_get_dma(ISABus *bus, int nchan);
+IsaDma *isa_bus_get_dma(ISABus *bus, int nchan);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
 ISADevice *isa_new(const char *name);
-- 
2.38.1


