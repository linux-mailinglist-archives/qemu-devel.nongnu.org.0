Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31364EBDD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AOp-0004n4-Ky; Fri, 16 Dec 2022 08:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOF-0004eV-KC; Fri, 16 Dec 2022 08:04:41 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOD-00086n-PQ; Fri, 16 Dec 2022 08:04:39 -0500
Received: by mail-ed1-x52f.google.com with SMTP id a16so3509511edb.9;
 Fri, 16 Dec 2022 05:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmWkf40YF9rxEeuvUggH9110DycmE6xIVyiiroawu3w=;
 b=KfK7fKHS8mq06q3A7KXjIgje8ABQgIsE00IB2S9PuI/Qy5VonElsauuRbTxoq9i6tW
 1OvEomiNEhpu6HY8YN4i2tZtMEJBk2hG1yz3Rv9D1p34zSywTO2N7LiuMEDDDjvuzVk1
 mdbSBJKR5CgfHItLExF0Q7MjA2ZJxdL59YGh9rSOn5FtNObkbfiD41sOS2yPYAaFhlrh
 NuhmNXtyIxZofaI4auyfe0NfanEhr4P4e2scl4Pc/zj7ApgftyyKS+a3eWVhTliyKAmn
 tWN9lXLRlUSKCCYG3ofMh2YDO6aXkWtHZ4JH4SFididbUH4sGmIrEpGXvjysoTc/hbN/
 f7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmWkf40YF9rxEeuvUggH9110DycmE6xIVyiiroawu3w=;
 b=JoOrFO+2jBzraYtsdQcfOZJUK+Gde8vxH0O3RlF3SEUKTMK4fdl09GjtT8aA3sr70o
 U2scf28NRMUnhbOVCsKqPDzXuWRZniNOp3iDTS/nUC1lK3oTkIAFnN4PmBhhd7l489m/
 ttRL136ghHUS5+q9WNXFjGs957zQj0ykTQafoLCdDWFgjNw+yxQeakqGr7Uw//UqTtoM
 vt/JwHl64X3gGaObgcEWWd9LtjMTB3RKzEQgnuxTM+YU3W69Q/cPMxlWd5MzfyQaPHWj
 ZxJPVDgCoPXGEKcnlSs3FuJFG7u2TkOvLfyNVHK9Bwc0d5YtvDG/8qBHr2zj3GUCx08W
 NRiw==
X-Gm-Message-State: ANoB5pkJgkvwwWRKmQ5R/JApBhchfSYnYQR6RjVPdoGmjUwtlycGpQU2
 3YtHztMKuC8JiXqpP9K+MMrD1z2Z78s=
X-Google-Smtp-Source: AA0mqf5qxjSQX6AQurrzPFlNTIPb0R9PynkFintqzSrONCG0qz79TfFTLPnHqo3C52i94PLywttxEg==
X-Received: by 2002:a05:6402:540b:b0:45c:835c:c6d0 with SMTP id
 ev11-20020a056402540b00b0045c835cc6d0mr27963008edb.1.1671195873945; 
 Fri, 16 Dec 2022 05:04:33 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 1/7] hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
Date: Fri, 16 Dec 2022 14:03:49 +0100
Message-Id: <20221216130355.41667-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/Kconfig     | 2 +-
 hw/acpi/meson.build | 2 +-
 hw/i2c/meson.build  | 2 +-
 hw/isa/Kconfig      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 3703aca212..14694c75b4 100644
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
2.39.0


