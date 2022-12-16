Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF61864EBD3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:05:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AOp-0004jn-69; Fri, 16 Dec 2022 08:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOH-0004fs-Mb; Fri, 16 Dec 2022 08:04:41 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOG-00087A-0r; Fri, 16 Dec 2022 08:04:41 -0500
Received: by mail-ed1-x531.google.com with SMTP id c66so3542164edf.5;
 Fri, 16 Dec 2022 05:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oJiZVmApEjALEzHYNXTV+R4bMMwnVoZOSSUYbCCbzzk=;
 b=P2YkkhOx76iLEaq0w8O8dVHot9xc1QFNyDWi19nOAwPS44ZPSn/s3CVUDsC/lIjq68
 rqLlNvIfJoRFyJfptqdIzEEy1aaLaPTTzT3lyIdSkK9kAttwd5z0CuvlJTJfyNa+QFQU
 +f4wQh2K7dgpycRfEOqI+8fvzNz/N9QCsNWMUu1n8QbwhUHrEl15qca+oePJE6LE6HAJ
 2WkEs4A4F2Uc5I3Z8Ew46iVPJvh1qqXSu4TP7w5+AUfJT/dxG6sKKJ9qq7ABjxrp+lbh
 7Nx8Vc1mjeMU7rVDhFQN4jIyrRri/hYfA4XE6Xbr6dfk/ohwZL2XUxXoq0lI/YLwMytP
 JVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJiZVmApEjALEzHYNXTV+R4bMMwnVoZOSSUYbCCbzzk=;
 b=UAciOaw69yzSCO1co2Q/g11G62R6O/czls9Ft9mf94HrcDithaquaRgfPvEr1AzdSK
 3ye85KPNdOHDTdT/LIa5pf0DKLkMR2P/NSokd6aNKoL9NNCLNP98qHgDCsXu7DBWhIBw
 2khnCKtEs4AvetjE8ndn4KwVKv8p5+z+X9U3YHx3GzivOUx0t/xRB5TdhgtWHog1OkBI
 7WSFHgnXBQvrirJQlhVyvpd8ZspOL4xnyYRiSDw/4lgNXHS/QwWXNZDAiZe8oUCpavxQ
 kPlLTkfOeLlRTea/qsrHf4SDSDGbnlp2FutBekJSkwyec+OZMMd6/EeMsKsP29b785JR
 556w==
X-Gm-Message-State: ANoB5pmp1wEumU3FuKYsZzSt3mBeutWkdvQx5IAjcsJH3owOqd3kY35p
 yaortcA15WQ7WRcdIzqJZkxBvKsFTzo=
X-Google-Smtp-Source: AA0mqf78CmYjAmi+4nbeqY0bC9nUJ9wtiwrOytdB8z971kfMpnbtUS3Lfr5uKZYjoxX3KyRnizhA/w==
X-Received: by 2002:aa7:c917:0:b0:46d:8aeb:bc03 with SMTP id
 b23-20020aa7c917000000b0046d8aebbc03mr29622009edt.22.1671195877953; 
 Fri, 16 Dec 2022 05:04:37 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 3/7] hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM
 in non-PC/Malta machines
Date: Fri, 16 Dec 2022 14:03:51 +0100
Message-Id: <20221216130355.41667-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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

TYPE_PIIX4_PM is only used in machines where PIIX chipsets are used
which is currently PC and Malta. There is no point building it for the
other ACPI_X86 machines.

Note that this also removes unneeded ACPI_PIIX4 from PEGASOS2.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/Kconfig | 1 -
 hw/i386/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 704cbc6236..b7006e18c8 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -9,7 +9,6 @@ config ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HMAT
-    select ACPI_PIIX4
     select ACPI_PCIHP
     select ACPI_ERST
 
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..3a92566701 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -69,6 +69,7 @@ config I440FX
     imply E1000_PCI
     imply VMPORT
     imply VMMOUSE
+    select ACPI_PIIX4
     select PC_PCI
     select PC_ACPI
     select ACPI_SMBUS
-- 
2.39.0


