Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105116A448A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAR-0008Ht-FP; Mon, 27 Feb 2023 09:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9r-0007jm-Ub
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:26 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9n-0000D1-SO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so7262342wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gKVTnfoWv8+BbXRD0LsQp3bVMjHdMF0SmIkC/9rOp+Q=;
 b=W0RQ4aso0uI5NS2lP/YatKlfFzkjnSO0Ob3uG0wVSPFwjQ8Z5G76UInjN5EErcH0k+
 rL3CYAwm4L2Yfn/sEOXpkrkQrcJ7LIp8svftMrOVsNmeyPkwuH6VUCKLrkdHeKBSGxro
 Uu08bD0uMXu03/CH0JhPoMtmcNyFcNzlF7Q6YmLdy1EOCQHXdKQHhxPTn0z1LpqtSS0R
 7H/Do1H1NRkvleHPGwHLQ4ey85n+Vhzr3m+Y/VqwJDKf+P/QNLPC4B4isUOYjml7+Vbk
 vXGW9r1C6Y5SjW6rk+Z94C9RS/5tPHYeSIQn0U4wXuiOJZQvQru9nmnq8ecDg3NoTIA0
 ePhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKVTnfoWv8+BbXRD0LsQp3bVMjHdMF0SmIkC/9rOp+Q=;
 b=ad+r9P+xRuLqeJ9JH6pGcNvD9iyAMW8tFUM6ai5dhLCBhia37j2UoLL18z8JoW/aXb
 jTM59bJwLLj9rzbWMc4uqMx493y7H8uSGdDI/AU3pEUFzC4MZhbXZqaZiwGksRiYls+3
 RtVJFoQ1XExYp/nueCfvZseao9rG2k5Oi6hk5Qd1MeaU2lwj9P5ll4OCqPEW5ClrmlTq
 FCdEuqSyViAl9yUN3ABlwyA4jn66pqOg0mPeFA8mMfM0krxJ9G3BYoJKeYNlzW9CqJAz
 ntVYhhcZMistC6RKJOGNcLqUOTLno4AR6KZoZKUKTiomxJDyHaGvU7usMt6E+qoutmnL
 vuSg==
X-Gm-Message-State: AO0yUKWsIlMll1y23rbX7CedUsC1mw8A2yJBUlx7DB5xNAn7nYTC/SY4
 9OQrW6ZunSMKjMHaCKqDxKVnrIpqjATeitFX
X-Google-Smtp-Source: AK7set/eYecMAAU/6Ou+xJnI43K0gAksP6bAEosZevbL5k4yqxQKKt/g9MAROprDVRnrOTLw00b/sQ==
X-Received: by 2002:a05:600c:4748:b0:3eb:3945:d3f4 with SMTP id
 w8-20020a05600c474800b003eb3945d3f4mr4864931wmo.2.1677506827408; 
 Mon, 27 Feb 2023 06:07:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b003eaf666cbe0sm9774516wmq.27.2023.02.27.06.07.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 063/126] hw/isa: Rename isa_get_dma() -> isa_bus_get_dma()
Date: Mon, 27 Feb 2023 15:01:10 +0100
Message-Id: <20230227140213.35084-54-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

isa_get_dma() returns a DMA channel handler from an ISABus.
To emphasize this, rename it as isa_bus_get_dma().

Mechanical change using:

  $ sed -i -e 's/isa_get_dma/isa_bus_get_dma/g' \
        $(git grep -l isa_get_dma)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230215161641.32663-2-philmd@linaro.org>
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
index b3d2e5ec52..80d8fb4c5b 100644
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
index eb920aa710..3a60f6afa6 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -71,7 +71,7 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
-IsaDma *isa_get_dma(ISABus *bus, int nchan);
+IsaDma *isa_bus_get_dma(ISABus *bus, int nchan);
 ISADevice *isa_new(const char *name);
 ISADevice *isa_try_new(const char *name);
 bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
-- 
2.38.1


