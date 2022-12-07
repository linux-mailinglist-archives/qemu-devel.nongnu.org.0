Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE46464DC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 00:14:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p33as-0005jP-KM; Wed, 07 Dec 2022 18:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33aq-0005iy-R3
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:48 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33ao-0003Uz-Jh
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:48 -0500
Received: by mail-ej1-x634.google.com with SMTP id vp12so17537613ejc.8
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 15:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXF6leAVFw+IPAA2S+2l7sWlCEcXEtnrXV0kdfpgDh8=;
 b=c+hfSW/2n0jM/xO2gVMU6QsATbQR9sOhpcOqv86bPnrSnX/W2S38uOIYDS0KPJms7Q
 HPq7f+Riny6UXRehEVSY71uYG/q9Kaj0UdEPTX8XEm075uI1G2xxOJsurIfiN+RK1LxO
 0MDyBnNMpS/poChh7AJIPbXx1WVgkj1OFbklwNvx0MLbuIpfy/+GvlX8r0yTImn0CW47
 6qUKrQ5twdX9Hkns6eLKhvypv0luFLfnXVH1KxRlk6SJGaDePMKtHvtmB5DQESuaNw/O
 MX2HJ9ZvcHaIPpmdVe9kYatcWsxgjAfth061SD4UTOrX5zktqXu2h77QrY6TN60y8m0H
 hSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXF6leAVFw+IPAA2S+2l7sWlCEcXEtnrXV0kdfpgDh8=;
 b=rbAMi95pa3BVsmNEjBqcs6rpeecwtKJD0pGex3RP3GL/jx5H32x6q0XVt+iH07puMJ
 2Mqk1aDNxMJjqAEyIi5MUwaaQUiyzEnGyzbHjEPWwl5LJS6ZsqXBooVtGrUM7MZIV/iq
 BIzvZqg3hImKGVIPM3yzEbgdfKIDeDmNOlBLamPfIWoPwAPW4G4L514c5Tn+UNvN9gLi
 y/7yrlpm1YoYuzmAlrcEGlsC51mcQ/2iRmSmHQ9o97XG4PbiYOvaa8E74A9n276yFdO8
 mh6DDK8QteVvg5xwba+xZu2/ym/bLsy9efxtbaECHeU9BXDckcOq+hA97hEIQoHMTo9W
 0hzA==
X-Gm-Message-State: ANoB5pnIP/tAARf8Ih9bVrtNp7OjXhhHxoZbj3rJX57lxx3rlo5TcASx
 DiWES9vqRMDHgBdIXsaQ9FDyZumjMPA=
X-Google-Smtp-Source: AA0mqf5hfWIH/p5/XotWr/8ior1F4sI9fNP01VnpiolW7pJ4toiJWAJUtaUUGuziAhktZWUj9V0sxQ==
X-Received: by 2002:a17:907:770e:b0:7bf:3627:df32 with SMTP id
 kw14-20020a170907770e00b007bf3627df32mr876612ejc.75.1670454763873; 
 Wed, 07 Dec 2022 15:12:43 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-181-051.77.11.pool.telefonica.de. [77.11.181.51])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b004587f9d3ce8sm2732367edh.56.2022.12.07.15.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:12:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/5] hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
Date: Thu,  8 Dec 2022 00:12:01 +0100
Message-Id: <20221207231205.1106381-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207231205.1106381-1-shentey@gmail.com>
References: <20221207231205.1106381-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

piix4_pm_realize() uses apm_init() and pm_smbus_init(), so both APM and
ACPI_SMBUS are provided by the device model managed by ACPI_PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 configs/devices/mips-softmmu/common.mak | 2 --
 hw/acpi/Kconfig                         | 2 ++
 hw/i386/Kconfig                         | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 416161f833..3011304443 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -19,7 +19,6 @@ CONFIG_PCKBD=y
 CONFIG_FDC=y
 CONFIG_ACPI=y
 CONFIG_ACPI_PIIX4=y
-CONFIG_APM=y
 CONFIG_I8257=y
 CONFIG_PIIX4=y
 CONFIG_IDE_ISA=y
@@ -32,6 +31,5 @@ CONFIG_MIPS_ITU=y
 CONFIG_MALTA=y
 CONFIG_PCNET_PCI=y
 CONFIG_MIPSSIM=y
-CONFIG_ACPI_SMBUS=y
 CONFIG_SMBUS_EEPROM=y
 CONFIG_TEST_DEVICES=y
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 3703aca212..9504cbad2f 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -30,6 +30,8 @@ config ACPI_NVDIMM
 
 config ACPI_PIIX4
     bool
+    select ACPI_SMBUS
+    select APM
     depends on ACPI
 
 config ACPI_PCIHP
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..2fdefd7458 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -62,7 +62,6 @@ config PC_ACPI
     select ACPI_VIOT
     select SMBUS_EEPROM
     select PFLASH_CFI01
-    depends on ACPI_SMBUS
 
 config I440FX
     bool
@@ -71,7 +70,6 @@ config I440FX
     imply VMMOUSE
     select PC_PCI
     select PC_ACPI
-    select ACPI_SMBUS
     select PCI_I440FX
     select PIIX3
     select IDE_PIIX
-- 
2.38.1


