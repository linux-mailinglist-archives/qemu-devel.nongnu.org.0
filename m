Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B520C487B59
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:25:29 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5szY-0007pE-98
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:25:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw0-000542-Ud
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:49 -0500
Received: from [2a00:1450:4864:20::429] (port=34326
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5svy-0007s3-Mi
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:48 -0500
Received: by mail-wr1-x429.google.com with SMTP id h10so2184778wrb.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p0bFkZNomX7Q5MaA4fGopx5oG80cnusqXxawnRuyq4M=;
 b=XHJtFzZlA1DAaYgvG0kPPrbNAFhNldhOJ8N2flQgdyHuIjVOgzrhL+x4QSaGHpyBAY
 oNdBehRWxhRxSRog3StFLiolx5QjJiL8w7aXPjnP5QTLE22n6BEnvY2p5KDk8s2WixzG
 CXRfKltqXou13gmVsP1J5AszTnoz9g/HeZ6H+Mpc/PRVEXwWbaOKPmSVGQZiC/rp/QRf
 JFz0CsBNomp95904+YCwrsRxgGuLUltO8Ru4ToDOWiP/a3A15Dl2gOYfDJmBDZqysCTg
 ZbJnqepZr7BnAA0EB128FIOTS12XspdDTEBDleFy2POKwANGdX7o/TqfTykIthsqJOcs
 zUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0bFkZNomX7Q5MaA4fGopx5oG80cnusqXxawnRuyq4M=;
 b=PAq74QeIbvE/gMVjXKRbqhVFETH2Q30Z24kmv8qCUcCBMxZ+FX0GjtmKGN+AGdnfl7
 JkD3qQTpvqDkSzpRk00SPi4YRQ0AE5QZ0Bo8gjVBA89p5QAGJHTdgN3PxzS5470f2HgE
 95zaWjmlBboA7J+cLL3t02QIiujTIlKAypDmLn7iqGYZvA8RaDpbLU9LUsKXCGyZvwoP
 6bUEenOpIBYPcmLaQWXGg3dYZVZfL9IHUvvpt9ZLaizcScLykZ25sExv8iJSC9wp2kIx
 0c7zexXdsbguAGWsMGDkcgWQ0CrRCcYAD6NiRwLXhfBG7U8jZbm7CFia2xbWZx6w2OrE
 QQOQ==
X-Gm-Message-State: AOAM5316Iw2fammDAHAEdn0hNDZsVppQoLpbMXCksRwQenkjyGWoIfvx
 c454ezM5zDdAtszjZuwW7DD5vPqvBNlFpw==
X-Google-Smtp-Source: ABdhPJzQkjbVT7X57KmZ6ErnuGWpN267ss0LcaSElFvtqQ0etKKu/jqzACWoibYU1yrVXeUg97YgaQ==
X-Received: by 2002:a05:6000:1684:: with SMTP id
 y4mr53409025wrd.26.1641576105421; 
 Fri, 07 Jan 2022 09:21:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
Date: Fri,  7 Jan 2022 17:21:24 +0000
Message-Id: <20220107172142.2651911-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Troy Lee <troy_lee@aspeedtech.com>

AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memory
and io address. If guest machine try to access DPMCU memory, it will
cause a fatal error.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20211210083034.726610-1-troy_lee@aspeedtech.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/aspeed_soc.h | 2 ++
 hw/arm/aspeed_ast2600.c     | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8139358549d..18fb7eed461 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -139,6 +139,8 @@ enum {
     ASPEED_DEV_EMMC,
     ASPEED_DEV_KCS,
     ASPEED_DEV_HACE,
+    ASPEED_DEV_DPMCU,
+    ASPEED_DEV_DP,
 };
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 0384357a951..e33483fb5dd 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -19,9 +19,11 @@
 #include "sysemu/sysemu.h"
 
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
+#define ASPEED_SOC_DPMCU_SIZE       0x00040000
 
 static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_SRAM]      = 0x10000000,
+    [ASPEED_DEV_DPMCU]     = 0x18000000,
     /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
     [ASPEED_DEV_IOMEM]     = 0x1E600000,
     [ASPEED_DEV_PWM]       = 0x1E610000,
@@ -44,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_SCU]       = 0x1E6E2000,
     [ASPEED_DEV_XDMA]      = 0x1E6E7000,
     [ASPEED_DEV_ADC]       = 0x1E6E9000,
+    [ASPEED_DEV_DP]        = 0x1E6EB000,
     [ASPEED_DEV_VIDEO]     = 0x1E700000,
     [ASPEED_DEV_SDHCI]     = 0x1E740000,
     [ASPEED_DEV_EMMC]      = 0x1E750000,
@@ -104,6 +107,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_ETH3]      = 32,
     [ASPEED_DEV_ETH4]      = 33,
     [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
+    [ASPEED_DEV_DP]        = 62,
 };
 
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -298,6 +302,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(),
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
+    /* DPMCU */
+    create_unimplemented_device("aspeed.dpmcu", sc->memmap[ASPEED_DEV_DPMCU],
+                                ASPEED_SOC_DPMCU_SIZE);
+
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
-- 
2.25.1


