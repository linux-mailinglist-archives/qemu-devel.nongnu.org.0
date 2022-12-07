Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F16464DB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 00:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p33b8-0005s7-7s; Wed, 07 Dec 2022 18:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33b5-0005rt-Qj
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:13:04 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33ap-0003V9-Nc
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:13:03 -0500
Received: by mail-ej1-x629.google.com with SMTP id fc4so17480811ejc.12
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 15:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL+X4URS6URh+lnIy3wy89QDomDBD/eH1SHw/ATk9/Y=;
 b=IejAtmu/1+nnUOQFhadGDgZ0cSFD4EXIuHbkp6CmKWNrOnZTitVkUu4oRlriVt0ZBo
 Xn/ppvqQPX5aaSskh7jyVOzKpugWxcxxVWj/RSvi3oi5CerC7XFmjMkip2zwkl8JnjRZ
 XobCF4YU77oGcd0M/jfgZDzmApfhS5Cr6gSQLDxIEj4TnKm/qsEtTenWhLJnAESYDJ5s
 R53ktkQDvk+3Hg2jlIVvU5U5Shrn59YK7aTJt/boMetplFtYX/dAnQ+WgUmjed28R8Ps
 JiXfeIRnjL9uG0eHu8Dy7u5KJFBUzRBoIIFYK+h6BskBOea94Av0ahVJ1e3znQznnIvY
 6UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uL+X4URS6URh+lnIy3wy89QDomDBD/eH1SHw/ATk9/Y=;
 b=WvEO8glnB9f6t7bfC7XWAfOMSN5vgg8cpJjG+GmbsatpwQros8153u8NR5gsdAtE9n
 86GnUJpEfP4MIrQSThUxPPTehPmxQPHEExWoqVBgztUQbRtxr9/hbm/205Q73OjbQmd8
 fsF2dBY5VGCY8ZgnLV3ZF5FX10GE36p7cFewcYpbdxrmL5KzzLp8qIUlz208WOhMzQtc
 J2cQ2ZY7j+ElUGyB+c7hF+rE+qgtJiYuLpBW2M99m4sFvLkCgSXOViMcgHFKjec5f1Ls
 yGOsjW/Ps5xCd3NF0D7akp8o0ONleM3OXzKbS5nupX9AsM8w6sxC5e46Q03ttURjdFjt
 XFaQ==
X-Gm-Message-State: ANoB5pkOVNevxeJFWzJHtlQJy+5pME4TrAPW0Te/wKE4PDM5jvAq5kSM
 0Cgx0rDsYhxsvXENzz9cUxV1dhWvl2g=
X-Google-Smtp-Source: AA0mqf6qZ1rS7ycAAEIBvERGgzZBcMNCZG9JJStorwg0A2qit9IH8Bkn53ohxFXxKFrnt9bD+KaHAw==
X-Received: by 2002:a17:906:7c83:b0:7c0:f325:637b with SMTP id
 w3-20020a1709067c8300b007c0f325637bmr868627ejo.62.1670454766175; 
 Wed, 07 Dec 2022 15:12:46 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-181-051.77.11.pool.telefonica.de. [77.11.181.51])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b004587f9d3ce8sm2732367edh.56.2022.12.07.15.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:12:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/5] hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
Date: Thu,  8 Dec 2022 00:12:03 +0100
Message-Id: <20221207231205.1106381-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207231205.1106381-1-shentey@gmail.com>
References: <20221207231205.1106381-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ich9_lpc_realize() uses apm_init() and ich9_smbus_realize() uses
pm_smbus_init(), so both APM and ACPI_SMBUS are provided by the device
models managed by ACPI_ICH9.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/Kconfig | 2 ++
 hw/i386/Kconfig | 1 -
 hw/isa/Kconfig  | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index ec16dd20e6..5a678b07c7 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -15,7 +15,9 @@ config ACPI_X86
 
 config ACPI_ICH9
     bool
+    select ACPI_SMBUS
     select ACPI_X86
+    select APM
 
 config ACPI_CPU_HOTPLUG
     bool
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 2fdefd7458..4b4b5265bb 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -51,7 +51,6 @@ config PC_PCI
     bool
     select APIC
     select IOAPIC
-    select APM
     select PC
 
 config PC_ACPI
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 01f330d941..0a6a04947c 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -77,5 +77,4 @@ config LPC_ICH9
     # for ICH9.
     select I8257
     select ISA_BUS
-    select ACPI_SMBUS
     select ACPI_ICH9
-- 
2.38.1


