Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46233662CB9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuE-00036s-NT; Mon, 09 Jan 2023 12:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtk-0002lv-H7; Mon, 09 Jan 2023 12:25:24 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvti-0000yw-K5; Mon, 09 Jan 2023 12:25:24 -0500
Received: by mail-ej1-x62d.google.com with SMTP id fy8so21840861ejc.13;
 Mon, 09 Jan 2023 09:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGvyeNb4iYvMSKSeOfclhQE+TWSpdUAai8m//G6LtO4=;
 b=ZfiVo+2PFZzkk3hPf/h/NQi2UB5P8jfjZODaKWiB/nYU5x7sD2NIT3WE8uWgTMKNaS
 VsvEXdaYC6Xy18ceO7gOkcI+rThDVJxKXgnsORmdOfhoHCYrEollXacFi7HxVLWbDKG3
 9b/NEfWF3UgbmK8rUHIHbHB/RnvvZyxMHgjHyCJzDL0kzhMywtSxQoclReMmnMJ/Ss6k
 8LkIoBluoMGb7H1Q9Giu1e9b5y2vOcuM5IAaTH9DFu5igXJ7OhwMj6bvtpKDYU0qYt8V
 6s2IerfB/5N6373A1ipIreuQbWFVtbmLIOx6vtL4UsYkI6Gd2JfHhZg386ZHIjA4fvU3
 1RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGvyeNb4iYvMSKSeOfclhQE+TWSpdUAai8m//G6LtO4=;
 b=GpxkicFgGaVJsi3cYZAgej74dv7jB6vU7T3H37y9wTOINcIMj9qqXUzq9NJ2beET/w
 fiZuvv4hWo/JIrPGurEQmFIfvjoX28/bnLxTBUSDHYc8Clm0w0dIcZMMK00D9UHTiJ4S
 qibbC1+BOxBFxvx2n7f+xQUV/nvV6pHOZm+NUbH/xuYcJ0dL14L+2aSJ9cvcT+/+Ok9k
 Md1cNe8qXzPW0P4QcKjpFnur5eI7attdsJAiFwbwFQVt/Uqzzw5dujyOUz9efXGfYJLH
 ezUMw9JtoZ6Ggpcs9VtGPyCAHx+JcBBAmdlEQQ2smlQKfFflpGiVda7fvKTiyQ5Fqz4E
 DRbg==
X-Gm-Message-State: AFqh2krrBFCiXMIwxhRV0QXzCAhW1NhJ0iZrjKZR1D8hog6C4dBaE4jC
 wCYfFwAHhao2yAZtzovDkSGgI4wGJgw4Rw==
X-Google-Smtp-Source: AMrXdXvcaZuB5q5FIef67Bv9TWu5jQyXKHqAuF+CuhgNk34Ze+2+ursMYW85U5UuJz1HkP4HSeO1dw==
X-Received: by 2002:a17:906:7fc2:b0:838:9c66:cd2f with SMTP id
 r2-20020a1709067fc200b008389c66cd2fmr52966351ejs.74.1673285120343; 
 Mon, 09 Jan 2023 09:25:20 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:19 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 24/33] hw/isa/piix4: Remove unused inbound ISA interrupt
 lines
Date: Mon,  9 Jan 2023 18:23:37 +0100
Message-Id: <20230109172347.1830-25-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The Malta board, which is the only user of PIIX4, doesn't connect to the
exported interrupt lines. PIIX3 doesn't expose such interrupt lines
either, so remove them for PIIX4 for simplicity and consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-32-shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de4133f573..9edaa5de3e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -155,12 +155,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_set_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->isa[irq], level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -204,8 +198,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
-                            "isa", ISA_NUM_IRQS);
     qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
                              "intr", 1);
 
-- 
2.39.0


