Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B616AFABE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh2l-0002eC-57; Tue, 07 Mar 2023 18:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2i-0002Sj-CC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:28 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2g-0002mt-EI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:28 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q16so13796251wrw.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nlUn/qxhfZToqYocMyFXsIpQiyWQahr0nRRfrh2Btes=;
 b=KCBxNQM1Hm2K8ZGthIToX99ecwzDUcMKC84LdiFPS8I/AWhgoKE5CliIev7Kz77ZUt
 87pWl45IS4voC1uPIPPmlPYHbQT29py9gxEjj1qINI86+9UgVjg6bpFDOXxs2Qp5x+sa
 leyB0ecysGpwMo8kxivtpCVkalmxfBPBzGnCfn+8mz6ybs6X073aSsKDxVE/pz+0Kbw6
 3HF0MRRLmTAXPoTOWOO5Cp48Z7D1HotcAR8zgz7osWKULshVVLkQCspfaZcydgWEQNB6
 DteMtswRVlSLqT3AMiFYG3nHM40pIWfk0ZVob2QyTXZtOwo5t//QlUAOtQunbzaVwP9T
 15+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nlUn/qxhfZToqYocMyFXsIpQiyWQahr0nRRfrh2Btes=;
 b=1VD1eKVXgEsXAE66eqGQJ/q4+KhNC5pZPB4beS4XqE0gtsPfgg99VUjg/Sb+dvZvnx
 V00Vho1X7s91PUvDnmSCtzqReEmvUkSMPAoca6q4dieho/3vkEs0+gr/wg7Kq5pB0tsv
 L/TXePIvj8zke5Oool28q1FfOari9e0ZYr+OCSb7yFAd+c+a4YGAz5x1/bLoA8C0Gjl2
 kPboPJIxPFI3M8oDlN7ZuoTZrsMTUYk0pCCTSw51bpPhKc2tB5cMjHwb8ZvyuqEPgV4p
 O7LmyHdI938H0J2iYm2Sz2v1ME7AknaIFwZZ5SWqrG+byKtf/nLxqprNlwbcZOoLUUDo
 YsQQ==
X-Gm-Message-State: AO0yUKVpCWtC6ZTTvAzuP4xakWTZQqAo1/KIpRNjNLLpJZhZvhp0P+u4
 oMCOx8Xbh/WDIBrCLtuqUwzRTibphR9E/cm1oEY=
X-Google-Smtp-Source: AK7set9xe3+cdB61kabZiT06gL0AcxH2Mitd1NDH1oobUwpd3rg/mIZwuAmBTN0UBEhJA6NnyC0Pog==
X-Received: by 2002:a5d:66ce:0:b0:2c7:8f73:7700 with SMTP id
 k14-20020a5d66ce000000b002c78f737700mr10486088wrw.39.1678232904680; 
 Tue, 07 Mar 2023 15:48:24 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c70d269b4esm13467895wrt.91.2023.03.07.15.48.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 12/20] hw/intc/i8259: Implement legacy LTIM Edge/Level Bank
 Select
Date: Wed,  8 Mar 2023 00:47:03 +0100
Message-Id: <20230307234711.55375-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

From: David Woodhouse <dwmw2@infradead.org>

Back in the mists of time, before EISA came along and required per-pin
level control in the ELCR register, the i8259 had a single chip-wide
level-mode control in bit 3 of ICW1.

Even in the PIIX3 datasheet from 1996 this is documented as 'This bit is
disabled', but apparently MorphOS is using it in the version of the
i8259 which is in the Pegasos2 board as part of the VT8231 chipset.

It's easy enough to implement, and I think it's harmless enough to do so
unconditionally.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
[balaton: updated commit message as asked by author]
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <3f09b2dd109d19851d786047ad5c2ff459c90cd7.1678188711.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/i8259.c                 | 10 ++++------
 hw/intc/i8259_common.c          | 24 +++++++++++++++++++++++-
 include/hw/isa/i8259_internal.h |  1 +
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 17910f3bcb..bbae2d87f4 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -133,7 +133,7 @@ static void pic_set_irq(void *opaque, int irq, int level)
     }
 #endif
 
-    if (s->elcr & mask) {
+    if (s->ltim || (s->elcr & mask)) {
         /* level triggered */
         if (level) {
             s->irr |= mask;
@@ -167,7 +167,7 @@ static void pic_intack(PICCommonState *s, int irq)
         s->isr |= (1 << irq);
     }
     /* We don't clear a level sensitive interrupt here */
-    if (!(s->elcr & (1 << irq))) {
+    if (!s->ltim && !(s->elcr & (1 << irq))) {
         s->irr &= ~(1 << irq);
     }
     pic_update_irq(s);
@@ -224,6 +224,7 @@ static void pic_reset(DeviceState *dev)
     PICCommonState *s = PIC_COMMON(dev);
 
     s->elcr = 0;
+    s->ltim = 0;
     pic_init_reset(s);
 }
 
@@ -243,10 +244,7 @@ static void pic_ioport_write(void *opaque, hwaddr addr64,
             s->init_state = 1;
             s->init4 = val & 1;
             s->single_mode = val & 2;
-            if (val & 0x08) {
-                qemu_log_mask(LOG_UNIMP,
-                              "i8259: level sensitive irq not supported\n");
-            }
+            s->ltim = val & 8;
         } else if (val & 0x08) {
             if (val & 0x04) {
                 s->poll = 1;
diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
index af2e4a2241..c931dc2d07 100644
--- a/hw/intc/i8259_common.c
+++ b/hw/intc/i8259_common.c
@@ -51,7 +51,7 @@ void pic_reset_common(PICCommonState *s)
     s->special_fully_nested_mode = 0;
     s->init4 = 0;
     s->single_mode = 0;
-    /* Note: ELCR is not reset */
+    /* Note: ELCR and LTIM are not reset */
 }
 
 static int pic_dispatch_pre_save(void *opaque)
@@ -144,6 +144,24 @@ static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
                    s->special_fully_nested_mode);
 }
 
+static bool ltim_state_needed(void *opaque)
+{
+    PICCommonState *s = PIC_COMMON(opaque);
+
+    return !!s->ltim;
+}
+
+static const VMStateDescription vmstate_pic_ltim = {
+    .name = "i8259/ltim",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ltim_state_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(ltim, PICCommonState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_pic_common = {
     .name = "i8259",
     .version_id = 1,
@@ -168,6 +186,10 @@ static const VMStateDescription vmstate_pic_common = {
         VMSTATE_UINT8(single_mode, PICCommonState),
         VMSTATE_UINT8(elcr, PICCommonState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_pic_ltim,
+        NULL
     }
 };
 
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index 155b098452..f9dcc4163e 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -61,6 +61,7 @@ struct PICCommonState {
     uint8_t single_mode; /* true if slave pic is not initialized */
     uint8_t elcr; /* PIIX edge/trigger selection*/
     uint8_t elcr_mask;
+    uint8_t ltim; /* Edge/Level Bank Select (pre-PIIX, chip-wide) */
     qemu_irq int_out[1];
     uint32_t master; /* reflects /SP input pin */
     uint32_t iobase;
-- 
2.38.1


