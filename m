Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E080C65E775
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:15:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKl-0001Pn-5c; Thu, 05 Jan 2023 04:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKh-0001PJ-0S
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKf-0006mh-J4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmpETAMTNVqO7akbx0McCgslyb/NoOOWfwMRfsMMuSQ=;
 b=OWNGOtC/5QRphxZbxjsIH6qkt5iq6b8lGEpAhqgGw5fg9HuwUEM+g0hitKpQTCPAgm9nXs
 jrwgms/RbQR1VO1PuGB2hvMdBmQC9LYlkjCQ3htdIxffm4MvbFKezS4dNqBCHv4sEWNWZI
 krl2VTyUGIwJnKGNO5hC9ovPfaY8tlo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-vduMYLmoMGKeVYE2mkCLCg-1; Thu, 05 Jan 2023 04:14:39 -0500
X-MC-Unique: vduMYLmoMGKeVYE2mkCLCg-1
Received: by mail-wr1-f69.google.com with SMTP id
 o14-20020adfa10e000000b002631c56fe26so4629762wro.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vmpETAMTNVqO7akbx0McCgslyb/NoOOWfwMRfsMMuSQ=;
 b=fe07+MYxo571k6TZmWIl79r+7/Yzph6Cc3ctaJCqwZU+yixn3GSvELgStDh0U0qoKW
 VaixVmfU/LMCx5LLK7ha3A7zahciMS4jukQw2Qvy9ddNLQ4YCTaWvuCrrn6DkscSoTny
 0JuS7cHX9nn7wrZ4U2zwXL/dNBglI9jyuCB2JkEB6XCiqprzV83ze0ospFS5LrmDaEmm
 rKDnXKcSjbpjkGb1TMk+O3jeQTBD5yTwhKWpKl1FaufoEt9/OR9Fg6KPYz/QetgpxedV
 ko/k18i+AzFcNBOqSmYN1QkuII5DEFvb9D21/HKLjCXyXBQv9SXiodbXlh4YYk+reVO8
 5oZQ==
X-Gm-Message-State: AFqh2kod4N9p0erduSc83rc201/CfPDKfVQIKiPONCOv7l9YQPR97Ra9
 F96VUO2o1faUn1qwIgTdAfKsn+IikOgIUtMn7XiSa8pnLFuiwKxxOreOFmJ0SD4tT6xYc5bThSK
 gPF9B1KmlPisLEVcSNXWHc4uHUCajYnjs6kPsaCuT6YVzVrJKomIBtdt1RQoi
X-Received: by 2002:a05:600c:a51:b0:3cf:6f4d:c259 with SMTP id
 c17-20020a05600c0a5100b003cf6f4dc259mr34782021wmq.39.1672910078309; 
 Thu, 05 Jan 2023 01:14:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu45giiXLSQ/T98EPekjAZzH77sc+7w0KLs7+BuA0b7lnV0+Xi+RQHsN7Dur+rAApFyRCygfg==
X-Received: by 2002:a05:600c:a51:b0:3cf:6f4d:c259 with SMTP id
 c17-20020a05600c0a5100b003cf6f4dc259mr34782002wmq.39.1672910078034; 
 Thu, 05 Jan 2023 01:14:38 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm1851768wmb.42.2023.01.05.01.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:37 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 06/51] hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
Message-ID: <20230105091310.263867-7-mst@redhat.com>
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

ich9_lpc_realize() uses apm_init() and ich9_smbus_realize() uses
pm_smbus_init(), so both APM and ACPI_SMBUS are provided by the device
models managed by ACPI_ICH9.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216130355.41667-3-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/Kconfig | 2 ++
 hw/isa/Kconfig  | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 14694c75b4..704cbc6236 100644
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
MST


