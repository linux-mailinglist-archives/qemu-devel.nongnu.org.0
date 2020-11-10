Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEAE2AD56E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:39:09 +0100 (CET)
Received: from localhost ([::1]:49388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRzQ-0000Y6-4z
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgV-00027k-9s
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgT-0006qC-DJ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d12so10733266wrr.13
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=13y5A/3RdD1ISz9lCnE9vUehU86kOiFH9EjJAMVmudI=;
 b=COcFL/fXMT6yNw4rFMSYfgRnnrelQchFAj9+NcRIGRoV7ThlTVCRms2aIia/5L2BQs
 t1vkPvW0qZm+bxwJyuml1dASVThJ964g7pIDomHhpdDNbG1A0LZE621OurCWhFNA6C44
 ZMNH/mTaks4VgkCSAeQmaqC6je6wop70R/fabosPh4bmGrxg/w6nYH+ZH9mcKxa+cRjh
 J7BZls9wULO1kxhpxqjpG31WbOLOJDO3YOglGkAHcKxK4ozB1eEnF6c1KyL2ANKbPIt2
 nBmRV2luBNOQvXPNVvNfuUpvYo0RQbFbQEEGmxSJ/8we9TbPlQLvTz8xRSYI0NCYPmFj
 Dshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13y5A/3RdD1ISz9lCnE9vUehU86kOiFH9EjJAMVmudI=;
 b=DFLKZafdxl80DL5CV28GF8G0kobgozc7BkHslfyMS4Cv8k3U7mifkP4pa8aZHBtAo+
 H2ixtssSHRr/vmjjiMqEUIS+NGKx56LEmD54AYY2H68V2YjKh+9vyI1FKxcWt2F8ut85
 Yfpwws0Ofn1nKeNyytvvq1Jp+JvTXiDpVb9eM1XGSDQmbUdFHPGBqPExNdYpU4QtzkJn
 ge+gfA0GufqZZSkfw8VBFk4WWw9fYHBpe1U2IbXQE6rzlejgocM4LISX4mXA1Fz+CT/u
 Nfl54AtcWnuZvMeOb3miJMyMKmNLkX+KYozmrjWpkP+lg8/pKropzEWApAuLC8LoTdkN
 KHeQ==
X-Gm-Message-State: AOAM531B5le4s49eDu0sc+YgoGybR4A1Ev2ameMHLaA4cpyVvwg4D3Ov
 5VzKoZJhZqsAc6KrFpW0/Q5WBA0XVe0FoA==
X-Google-Smtp-Source: ABdhPJwSSY4ixL+UfwPKbdQt953eq6Kfh0/p1/aefhUxEa7KGG7A7pnr93l3vnhOeFTi6DOoWkBJLA==
X-Received: by 2002:a05:6000:1c9:: with SMTP id
 t9mr17015370wrx.379.1605007171822; 
 Tue, 10 Nov 2020 03:19:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] hw/misc/stm32f2xx_syscfg: Remove extraneous IRQ
Date: Tue, 10 Nov 2020 11:19:11 +0000
Message-Id: <20201110111917.29539-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The system configuration controller (SYSCFG) doesn't have
any output IRQ (and the INTC input #71 belongs to the UART6).
Remove the invalid code.

Fixes: db635521a02 ("stm32f205: Add the stm32f205 SoC")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201107193403.436146-3-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/stm32f2xx_syscfg.h | 2 --
 hw/arm/stm32f205_soc.c             | 1 -
 hw/misc/stm32f2xx_syscfg.c         | 2 --
 3 files changed, 5 deletions(-)

diff --git a/include/hw/misc/stm32f2xx_syscfg.h b/include/hw/misc/stm32f2xx_syscfg.h
index 57a98c533db..8595a3b31b0 100644
--- a/include/hw/misc/stm32f2xx_syscfg.h
+++ b/include/hw/misc/stm32f2xx_syscfg.h
@@ -53,8 +53,6 @@ struct STM32F2XXSyscfgState {
     uint32_t syscfg_exticr3;
     uint32_t syscfg_exticr4;
     uint32_t syscfg_cmpcr;
-
-    qemu_irq irq;
 };
 
 #endif /* HW_STM32F2XX_SYSCFG_H */
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index a4f3344db25..9cd41bf56da 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -117,7 +117,6 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, 0x40013800);
-    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, 71));
 
     /* Attach UART (uses USART registers) and USART controllers */
     for (i = 0; i < STM_NUM_USARTS; i++) {
diff --git a/hw/misc/stm32f2xx_syscfg.c b/hw/misc/stm32f2xx_syscfg.c
index aa59b435498..04c22c28502 100644
--- a/hw/misc/stm32f2xx_syscfg.c
+++ b/hw/misc/stm32f2xx_syscfg.c
@@ -133,8 +133,6 @@ static void stm32f2xx_syscfg_init(Object *obj)
 {
     STM32F2XXSyscfgState *s = STM32F2XX_SYSCFG(obj);
 
-    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
-
     memory_region_init_io(&s->mmio, obj, &stm32f2xx_syscfg_ops, s,
                           TYPE_STM32F2XX_SYSCFG, 0x400);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
-- 
2.20.1


