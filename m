Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FC69CA42
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4hk-0001jB-BB; Mon, 20 Feb 2023 06:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hi-0001i9-Ud
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hh-00056R-EU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso812046wmb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wg6knbur2mmJV8L9g7D6SKJ7/ERhPsRC33COYh3Bljw=;
 b=VDZ000fopMnMKslEBLL9pEqrmVFf6Xs+q7tczg18RLnpAu5FoBKA0uFfeC37vrT2jg
 SN2ndwkQHgN/DevtloSzAbEot55W2BfIBGZCthMfcJTNzuOfxJSOQECx8gNwhG0ijIDp
 Rf6mvFysejO1GmNcFGdhh2UPPxKJ5sCOLdixtObDrSk44krnxezNyqwgDnd0g+YKUD10
 K1PQBKDMbx6l1y/WMM4/Ux6YgtbfClWWKL9H7RaP610wjjUDFLI9W0NAIvB43cdBhHju
 Pkmcnmhxmp4Te5xh/0Fn6TmWRWIJWSqoNnvhJn4GPcmYpJYMZo9z4hIvRHzmIwygacUN
 i1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wg6knbur2mmJV8L9g7D6SKJ7/ERhPsRC33COYh3Bljw=;
 b=1kG/Wr3BX8vfLmyRloglVCih50Yk87VhbWIa5amzsWfInmxmehUCcD6AuCUe8PMI1S
 B84l7dwAp5mKXP5Helr1jEZKLAGUgOsrSgCiHVJZHbk4RxbLFCzRsDjLyeQA+M6S3ICa
 /oV1J3DD+b8Wz6q0QwZk2hxpNGgOce1G8GXe7GPYzfbU7xKZQtMwK7ku7c4lMLD4qjTU
 AEBF0AlNhcftFtdb061T/qpXs7ZPugoO+n816MF0QduN3gtMBqPjo88o12C9bwpr6x1K
 FZFK5HBmwp3Y/bUvNmfPzGvIReOpC0XxtFjc1xeUuAbngmzcZ61983fLlaOxRrLoLm8H
 gVFQ==
X-Gm-Message-State: AO0yUKWVGLKTv2oEpB6Z/DpiSa+DLn/DUhs37b1sjXvyO3shuIZSJQaC
 7hVvHbikk7goaRfw+S/Ptn5qFwQtIa/AFBzU
X-Google-Smtp-Source: AK7set8AdtaGwhUINf61DXhdgFMfuGeRDfgQVWoU4CiKOyy6kwV9yP0jiJz2T16PfKOQcO7KubqPBg==
X-Received: by 2002:a05:600c:1895:b0:3e2:589:2512 with SMTP id
 x21-20020a05600c189500b003e205892512mr780466wmp.21.1676893891694; 
 Mon, 20 Feb 2023 03:51:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003dc4480df80sm89905wmc.34.2023.02.20.03.51.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] hw/char/pl011: Open-code pl011_luminary_create()
Date: Mon, 20 Feb 2023 12:51:09 +0100
Message-Id: <20230220115114.25237-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

pl011_luminary_create() is only used for the Stellaris board,
open-code it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c      | 11 ++++++++---
 include/hw/char/pl011.h | 17 -----------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 67a2293d35..f7e99baf62 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1146,9 +1146,14 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
     for (i = 0; i < 4; i++) {
         if (board->dc2 & (1 << i)) {
-            pl011_luminary_create(0x4000c000 + i * 0x1000,
-                                  qdev_get_gpio_in(nvic, uart_irq[i]),
-                                  serial_hd(i));
+            SysBusDevice *sbd;
+
+            dev = qdev_new("pl011_luminary");
+            sbd = SYS_BUS_DEVICE(dev);
+            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
+            sysbus_realize_and_unref(sbd, &error_fatal);
+            sysbus_mmio_map(sbd, 0, 0x4000c000 + i * 0x1000);
+            sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(nvic, uart_irq[i]));
         }
     }
     if (board->dc2 & (1 << 4)) {
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index d82870c006..d853802132 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -57,21 +57,4 @@ struct PL011State {
 
 DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
 
-static inline DeviceState *pl011_luminary_create(hwaddr addr,
-                                                 qemu_irq irq,
-                                                 Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new("pl011_luminary");
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-
-    return dev;
-}
-
 #endif
-- 
2.38.1


