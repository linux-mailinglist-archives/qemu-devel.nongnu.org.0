Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED165E813
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKf-0001Op-Md; Thu, 05 Jan 2023 04:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKe-0001OU-63
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKc-0006mU-I3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ce2QpQ0ot58HD8RqdypL8PMLuYh1tuAM9+EGw8rDsGg=;
 b=eGZcLCs9N0jNqIdG81P6Eh2zpsfyguGXKWJrMe59M8njewtKFMg1ObsPEsp3tyFdV3WLjP
 sQPr58jzQ9l5mLGn8rlBcvw6fcQXOoXZdLjy0RGVLUxoxtx4oNiR/nPHGH6jVpbpyMfktB
 uSRHpVoqh7ann86QRGiT15KUGcUcO5k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-I3BRlLHCNiC4zVrC4yiuQQ-1; Thu, 05 Jan 2023 04:14:36 -0500
X-MC-Unique: I3BRlLHCNiC4zVrC4yiuQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so17468855wms.7
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ce2QpQ0ot58HD8RqdypL8PMLuYh1tuAM9+EGw8rDsGg=;
 b=h+J++TtYa5gKKeZko2lxwo+dWYNKIjvahIY/No94nk9Dl0DQsAE8tiG1ixGTWhpQMG
 RlBJK1JO5odh6nM+SevdNDJFBFOgn3T32JeczX6voXIMPG943LH1EuMMRVDbVkhJwKz6
 4T7WuQx+sw63bPcUvdH8w7UfoOT4HzTYSZAS8CqpOuOM6lG0XLKX+ZBWN5qxVqV6MUz/
 LDUQtoMzqV/67yHxA5pi1sl3gkv0PSZlflzrbLXSUBO2VxuehWBr8AgtEo0sS8HE0JXH
 uwwbqyXFqw7WNF05Y9Wvc9ZXwWFNJAk/g+zOLXc/LIeFMKd+GfJ32AH59SE78NOiijlB
 w8Mw==
X-Gm-Message-State: AFqh2koZ+LsRH/PAt5oSvqpECvAy4wjpOMXFXMgFHtnFYl8GsnNUObsY
 8JPkOYQh5P5Q9SAAAy8aB4rueLeSXRXLRLcaw3WFTUc81ZZaPZ86+TEVDpp+HIMFJm+c/WW/s9o
 CZUOpv45fc3RlegDstCYh2SGJP84p9Me6ClFC0C4UoizlQ3IZ3AzroKQ3QtGO
X-Received: by 2002:a1c:4b06:0:b0:3cf:5e42:de64 with SMTP id
 y6-20020a1c4b06000000b003cf5e42de64mr39365673wma.39.1672910075013; 
 Thu, 05 Jan 2023 01:14:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsoeqhKJws3IaVERiLZhhMjVDZrK/5kL0oHc2/MX32dJNeMiRP/6gitBOVz/YkZFzy9i6Loag==
X-Received: by 2002:a1c:4b06:0:b0:3cf:5e42:de64 with SMTP id
 y6-20020a1c4b06000000b003cf5e42de64mr39365654wma.39.1672910074750; 
 Thu, 05 Jan 2023 01:14:34 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003d96c811d6dsm1763035wmq.30.2023.01.05.01.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:34 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 05/51] hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
Message-ID: <20230105091310.263867-6-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Although the ICH9 ACPI controller may currently be tied to x86 it
doesn't have to. Furthermore, the source files this configuration switch
manages contain a '9', so this name fits more.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216130355.41667-2-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index 2ed29ae94c..30054a8cdc 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -22,7 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'ich9_tco.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('ich9.c', 'ich9_tco.c'))
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
MST


