Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B206464D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 00:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p33aw-0005mR-ET; Wed, 07 Dec 2022 18:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33au-0005lb-Kt
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:53 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33ao-0003V3-Sv
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:52 -0500
Received: by mail-ed1-x52e.google.com with SMTP id d20so27096070edn.0
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 15:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z6A2hDYam9mls+BGlfzcKRLkIxZPLYh/mqXWVkLXZUU=;
 b=lwX3oWbS+c/5H42Q7i9h63C18KyswkuASRHb9CtAr6KVWI+WtXq76IerZgko3qnkey
 Pw3Q5+4vyjNDTiNNG/Wd6ThYsJs4Ph00qOZbb/EIVT6Mg4EvNpGOXKINUPGib3iCx/NA
 AnUzSLt6SbfPPh1HAmHpkD2ALOZZHMxV02QytY1FbDzVMdvuQUnb5fk3UEyzPhMjn3jr
 y+1O8HUy8/of3SBBG06gssOgiy7rMmsMgM9jSssm2vXTwdQNuu9CgqYqZs1QTxsq4Ra3
 IWJnPELqErL3h7nRe30/q030lSzaQUdqMcXe4+Y//xfkSKfGuqmUFuO3AdpyDh1lyKE0
 d3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z6A2hDYam9mls+BGlfzcKRLkIxZPLYh/mqXWVkLXZUU=;
 b=UIHUEbhISHXb2o/fyAx9s0qGANa10w9QkqnBVDUfFJYrXy1c0tEyZWVg9zDgIal8C4
 QCucm7uO6zoIkRK8KZ8GTPSfHsFpAGfhqNv/X/M4hyrueajtHfwgjnnU3ILTSmsL5ZzD
 kOZwU94z996rc3w/L32GLFOk+2Hvm2MyIsL04WBua/Oxp8QOj0bqUT1IP+N1/R+h74UK
 kNCTq08RaDKNAeRo+SwPMCY/QBHNaCX4olWV4C0HZN0S4cUAcRnbc4NVGly0fmqXbfXj
 FEh27ESvrjCrUZ13Xg/0OK7TXkLOGZlSUA6TxTm9bJN46e8PnJAkeUHDzjpaFyMJUzA7
 tA1g==
X-Gm-Message-State: ANoB5pllzShdJ6lpnk7HLrUHhqiknfgRZkYuzW6PpgOduEpomFQTwDHu
 VHtZt+gqQBfvRANJWib7UNMnzdtbLJU=
X-Google-Smtp-Source: AA0mqf7hbXKQA2otC7RtaajB+tj1rMPuyNChJCenWbHlNeXVLXpcK4h9T7dnfjsRXb/2rM9tke7i/w==
X-Received: by 2002:a05:6402:1ccc:b0:461:8be6:1ac4 with SMTP id
 ds12-20020a0564021ccc00b004618be61ac4mr1224387edb.20.1670454765044; 
 Wed, 07 Dec 2022 15:12:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-181-051.77.11.pool.telefonica.de. [77.11.181.51])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b004587f9d3ce8sm2732367edh.56.2022.12.07.15.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:12:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/5] hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
Date: Thu,  8 Dec 2022 00:12:02 +0100
Message-Id: <20221207231205.1106381-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207231205.1106381-1-shentey@gmail.com>
References: <20221207231205.1106381-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

Although the ICH9 ACPI controller may currently be tied to x86 it
doesn't have to. Furthermore, the source files this configuration switch
manages contain a '9', so this name fits more.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/Kconfig     | 2 +-
 hw/acpi/meson.build | 2 +-
 hw/i2c/meson.build  | 2 +-
 hw/isa/Kconfig      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 9504cbad2f..ec16dd20e6 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -13,7 +13,7 @@ config ACPI_X86
     select ACPI_PCIHP
     select ACPI_ERST
 
-config ACPI_X86_ICH
+config ACPI_ICH9
     bool
     select ACPI_X86
 
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index f8c820ca94..cfae2f58f6 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -22,7 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index d3df273251..6e7340aaac 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -2,7 +2,7 @@ i2c_ss = ss.source_set()
 i2c_ss.add(when: 'CONFIG_I2C', if_true: files('core.c'))
 i2c_ss.add(when: 'CONFIG_SMBUS', if_true: files('smbus_slave.c', 'smbus_master.c'))
 i2c_ss.add(when: 'CONFIG_ACPI_SMBUS', if_true: files('pm_smbus.c'))
-i2c_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('smbus_ich9.c'))
+i2c_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('smbus_ich9.c'))
 i2c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i2c.c'))
 i2c_ss.add(when: 'CONFIG_BITBANG_I2C', if_true: files('bitbang_i2c.c'))
 i2c_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_i2c.c'))
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 18b5c6bf3f..01f330d941 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -78,4 +78,4 @@ config LPC_ICH9
     select I8257
     select ISA_BUS
     select ACPI_SMBUS
-    select ACPI_X86_ICH
+    select ACPI_ICH9
-- 
2.38.1


