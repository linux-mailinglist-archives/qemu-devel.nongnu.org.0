Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1A6EE924
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:38:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPNl-0007TX-QZ; Tue, 25 Apr 2023 16:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNj-0007SK-Em
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:35:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNe-0002mE-G3
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:35:23 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a667067275so50265155ad.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 13:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454917; x=1685046917; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aoi5Jr/oybb6QVYBY4oT3SSMiz/77CzPxbv5fPfCtsQ=;
 b=SkFslqvintKj9TTTP6XQqr9fw+ibmZQyjF5JFLuf27NsEFvaaVvyNeBKuw21fMHCMz
 6mCeDZ90S99Nd8kL8J8K5vDE9xxT5i6G/jnLNUKZQdnzU4xCezS1DIF+3JM8cjbW9Tfe
 YXypwkmp5hxONS4Y3iGZwNT3vkH1/fUEajxV3Pn+BoIfsCu6ueaIEWv/NtpauYBA6DsZ
 I6dFbQKviA4vx7XjT7S0a+wbKatONMeEjNJy/LNeMk+ODDYZNZdZ9x1/ziJqBZYFA2g1
 duErKQxVCG7YhLgEFgRVKkKm8UEyWB/lELRjI7dDp8+0d47rLIVY6y+FJHUMcUDz/FQI
 hsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454917; x=1685046917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aoi5Jr/oybb6QVYBY4oT3SSMiz/77CzPxbv5fPfCtsQ=;
 b=MPl/9Kuwwe5PhSy84wrXp+FXTU92+DQQTMVcTspt8zytCAfbQvPO/Dncj1l0F7e3pY
 kGOMSchP/0ienlCIJBBQvpFvNJq7hzCBpxOZ4yV7Szj+CH8+w5g5zTk6pXdcKa8cn38v
 lfDzwG/YexmSjOvWLVlBZJ8TexnPoUC9cXsYsGbv1PfHb4xV+ampBIwLARpbkt1aOaQu
 HFMMQwN2st/1kgDVeI8q3xZWIOyXPUxZqLhwvzZX77OmF9Can4qEVF/6j6K+yGxBsCg7
 K/LjM2xDWmsgFi3ZGDyCZWv7yxybH+xjDUuT3PHj7FzLq1O6uk6vTaiIRLScex2xZQAE
 /q0w==
X-Gm-Message-State: AAQBX9e3BcyFGxkbAO7HWN2fuzGekKqyO4738ZNlfjM91i4dvSwibRyB
 Bu8cEVzl/NEz+5E5NhYAuOn8ag==
X-Google-Smtp-Source: AKy350a+L8MdQUu0gWbh/8zraaW+f4bEERNrLPGBrp+o6sjWrLoTgtRSJTABS9XPFv2x6bPrxaKu7Q==
X-Received: by 2002:a17:902:ec8b:b0:1a9:4167:5daf with SMTP id
 x11-20020a170902ec8b00b001a941675dafmr20652434plg.50.1682454917034; 
 Tue, 25 Apr 2023 13:35:17 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:16 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Ved Shanbhogue <ved@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH v2 9/9] hw/riscv: build example SoC when CBQRI_EXAMPLE_SOC
 enabled
Date: Tue, 25 Apr 2023 13:38:34 -0700
Message-Id: <20230425203834.1135306-10-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dfustini@baylibre.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Build the example SoC instantiation code when CBQRI_EXAMPLE_SOC is
enabled.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Note: the example SoC instantiation code is only included for reference
and it is not required anymore for the CBQRI proof-of-concept to work.
The CBQRI controllers can be fully configured with device properties in
the Qemu command line.

 hw/riscv/Kconfig     | 5 +++++
 hw/riscv/meson.build | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 8fd4aebc77d1..e5892736733c 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -49,6 +49,7 @@ config RISCV_VIRT
     select PLATFORM_BUS
     select ACPI
     imply RISCV_CBQRI
+    imply CBQRI_EXAMPLE_SOC
 
 config SHAKTI_C
     bool
@@ -88,3 +89,7 @@ config SPIKE
     select HTIF
     select RISCV_ACLINT
     select SIFIVE_PLIC
+
+config CBQRI_EXAMPLE_SOC
+    bool
+    select RISCV_CBQRI
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 2281d17d0b09..50e94f40de46 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -12,5 +12,6 @@ riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c')
 riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_CBQRI',
               if_true: files('cbqri_capacity.c', 'cbqri_bandwidth.c'))
+riscv_ss.add(when: 'CONFIG_CBQRI_EXAMPLE_SOC', if_true: files('cbqri_example_soc.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.34.1


