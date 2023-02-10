Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A0692371
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWPZ-0000TE-6M; Fri, 10 Feb 2023 11:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPV-0000Ss-Qw
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPT-0000Em-Ht
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so5666027wmp.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2K/4sNW5W4Rl4jasLMZHv15T8ERXUsmy69mOw2i5LA=;
 b=u9nXTa6mcNBWa1ZNMJ3Io03hGIfjuQdBPU/OS7at8pCfnBCn03BYXbv+fvkwtFEgpi
 TQIkVF3rwcyU3FCDBB301p5z16i/W6wQ5bWCLTO8K0UBulc/jjZK8kTTC8qOuPHFUON5
 OObA+gqBzNWmykBvIGywMWRv1Xvicvl/U+iV6yVwmP9zTej6hnZ+q4nQ/3dEGrPosEFm
 Olu8jI8zND7DaSB+ddvjINv8nWMm34H7yHGFhVgsGERj+XbpKEDPEycPiZ5J1vTnJHCT
 Od2xGw+nx9lF0W1Mx29MkOdBsMrurxWC7N4xO5slwujcFfZN/kr4S++HU++ElcQOdfKt
 IxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2K/4sNW5W4Rl4jasLMZHv15T8ERXUsmy69mOw2i5LA=;
 b=shuBDieX3VLlXTTn8d0PtcipAxCv+JkyCave5i4Vi6uMIPE8xD5U5P3uVZ7IG+/MEz
 C5qxXtpsdkBIRag+2uucoCUrYcSrAbqJdNIuuIr/xL8l368ghSOyFvgLh4Rg4V9s7jjh
 P6sYVGygQmK8KHutduBjJ8+ilmhpzMc+sWvi3lB+BGOGFk1h2QV0LOllIrTgxFNV5oyr
 YJsTIX51QUelKn/+iAGxzjRu3biGtRN+asWhZrBbSmj6e5o/giQMYsm73xvOsCQn59dW
 ciHErHIsM28JsLehNKQooxjE/YQVh8PGSFa2CRjbUCdVIst3Pz5rJxZdsqNH6cj49aRW
 4paw==
X-Gm-Message-State: AO0yUKUp7MKYQusynrMGcLgXYzayvqUOCRwyR3u4FbwlNejFd/fbCZCT
 bUi96I/0c+thTI5K5FPUZTGuSF2IKm7/6dRE
X-Google-Smtp-Source: AK7set+jkHbooGoA0SnTVYj6Ei/T5SAhC4Ng1BmHTM6y53kWVf9C3pFyawBR3pIPSSNbWJ6Mw01bAg==
X-Received: by 2002:a05:600c:4910:b0:3dc:440f:8e9d with SMTP id
 f16-20020a05600c491000b003dc440f8e9dmr13754005wmp.0.1676047082115; 
 Fri, 10 Feb 2023 08:38:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a7bc444000000b003d9fba3c7a4sm8034390wmi.16.2023.02.10.08.38.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 03/11] hw/isa/i82378: Remove intermediate IRQ forwarder
Date: Fri, 10 Feb 2023 17:37:36 +0100
Message-Id: <20230210163744.32182-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the i82378 model was added in commit a04ff940974 ("prep:
Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
not yet QOM'ified. This happened later in commit 747c70af78f
("i8259: Convert to qdev").

Directly dispatch ISA IRQs to 'cpu_intr' output IRQ
by removing the intermediate i82378_request_out0_irq()
handler. Rename ISA IRQs array as 'isa_irqs_in' to
emphasize these are input IRQs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/i82378.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 84ce761f5f..d32653369d 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -33,7 +33,7 @@ struct I82378State {
     PCIDevice parent_obj;
 
     qemu_irq cpu_intr;
-    qemu_irq *i8259;
+    qemu_irq *isa_irqs_in;
     MemoryRegion io;
 };
 
@@ -47,18 +47,12 @@ static const VMStateDescription vmstate_i82378 = {
     },
 };
 
-static void i82378_request_out0_irq(void *opaque, int irq, int level)
-{
-    I82378State *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
-}
-
 static void i82378_request_pic_irq(void *opaque, int irq, int level)
 {
     DeviceState *dev = opaque;
     I82378State *s = I82378(dev);
 
-    qemu_set_irq(s->i8259[irq], level);
+    qemu_set_irq(s->isa_irqs_in[irq], level);
 }
 
 static void i82378_realize(PCIDevice *pci, Error **errp)
@@ -94,9 +88,8 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
      */
 
     /* 2 82C59 (irq) */
-    s->i8259 = i8259_init(isabus,
-                          qemu_allocate_irq(i82378_request_out0_irq, s, 0));
-    isa_bus_irqs(isabus, s->i8259);
+    s->isa_irqs_in = i8259_init(isabus, s->cpu_intr);
+    isa_bus_irqs(isabus, s->isa_irqs_in);
 
     /* 1 82C54 (pit) */
     pit = i8254_pit_init(isabus, 0x40, 0, NULL);
-- 
2.38.1


