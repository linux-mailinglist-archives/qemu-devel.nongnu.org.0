Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED65379E0D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:10:50 +0200 (CEST)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJjN-00032X-Np
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfL-0005Om-1X; Tue, 11 May 2021 00:06:39 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfJ-0007cB-JK; Tue, 11 May 2021 00:06:38 -0400
Received: by mail-ed1-x52f.google.com with SMTP id s7so16517038edq.12;
 Mon, 10 May 2021 21:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10h0MBG9bZSfI53ifYB8yD5uFgIe2ZaP7erN0xjXxEE=;
 b=CGUuM//f6+iWk388KAg/gx+HmNgbFcePTd7nZxfkCVan6FwD0AszV6la2ABTP3WuwY
 /cjA5IvfLVtomt0SAz3QmUY6IiUGQwDEgAV+vX3qL2WEpMdDhcSjLPopKcLBuXpejgQ/
 /U1GYpl+aWW8sj2K9oXA7P8xULbui1whJlCLBtYN3eGxFe60jYwRkDaXVn3ALyLiLSzq
 0g0EdPWYJbXsfRfXc9fbyPLayvldQbCXmhTG8BGu4RUfxelQniTc7KyhtmYupko8W5Y1
 6PhHjW0Fz/A93bRXRP4hGAx2YdoPiw5xCLF1VypdP2uuG8iShoX/hhXaPceeFJdJ/QHu
 y5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=10h0MBG9bZSfI53ifYB8yD5uFgIe2ZaP7erN0xjXxEE=;
 b=SF7Mye0AbfuznWH80IUsQJfhg0Yw4abNQTPJdu2DOY4Zn1OttSVfoIKcsg7GcvUdP5
 Kyhwz4tDUH0dAEOTSLPQ947XrOkhHalZrsjsv/gpYrkM5MvVR3cma0M8tW3jhMZy8XiC
 yqevSphPWrKruJB04wSCGRA5lVcLP3D2wDrBZz92Tiz3hgI653pFdLUOf8gtZUow/9ee
 8rZ64OgGZ0+ZHA5EAvrtk1Ll2LhHEumiBwbwj4oFO6JcShxXusDP8d+mRuGRBi/hT6cb
 19hLjaUIeMIMkeaX24IaJL1H9YVElLsNeQ42zcaY5+0rvbLAB1DRMPnjQKlOQ/wRvC4B
 olDg==
X-Gm-Message-State: AOAM531oHRdVCLqmIBE2PSd/uTbo+xxnFM7AvM8To7c4g1Gi5z0lENi3
 9usoBSc6Dqr6/eo2VdffFMMVevXdbdl3Ew==
X-Google-Smtp-Source: ABdhPJynCUt57CHteG5qMjhwTKUWeu/MJt+mhwMnV3V3O0FzPMAkJ/u3OUPQ2cVyRPCwDXaCP7f1mQ==
X-Received: by 2002:a50:ab06:: with SMTP id s6mr24925372edc.100.1620705995454; 
 Mon, 10 May 2021 21:06:35 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d25sm12999974edx.58.2021.05.10.21.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:06:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/isa/i82378: Simplify removing unuseful
 qemu_allocate_irqs() call
Date: Tue, 11 May 2021 06:06:19 +0200
Message-Id: <20210511040621.2736981-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511040621.2736981-1-f4bug@amsat.org>
References: <20210511040621.2736981-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the i82378 model was added in commit a04ff940974 ("prep:
Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
not yet QOM'ified. This happened later in commit 747c70af78f
("i8259: Convert to qdev").

Instead of creating an input IRQ with qemu_allocate_irqs()
to pass it as output IRQ of the PIC, with its handler simply
dispatching into the "intr" output IRQ, we can now simplify
and directly connect the PIC to the "intr" named output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/i82378.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index fd296c8ed7a..817eca47053 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -47,12 +47,6 @@ static const VMStateDescription vmstate_i82378 = {
     },
 };
 
-static void i82378_request_out0_irq(void *opaque, int irq, int level)
-{
-    I82378State *s = opaque;
-    qemu_set_irq(s->out[0], level);
-}
-
 static void i82378_request_pic_irq(void *opaque, int irq, int level)
 {
     DeviceState *dev = opaque;
@@ -94,8 +88,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
      */
 
     /* 2 82C59 (irq) */
-    s->i8259 = i8259_init(isabus,
-                          qemu_allocate_irq(i82378_request_out0_irq, s, 0));
+    s->i8259 = i8259_init(isabus, s->out[0]);
     isa_bus_irqs(isabus, s->i8259);
 
     /* 1 82C54 (pit) */
-- 
2.26.3


