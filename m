Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B367864EBDF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:07:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AOr-0004po-Ex; Fri, 16 Dec 2022 08:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOM-0004gw-12; Fri, 16 Dec 2022 08:04:57 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOJ-00087V-A5; Fri, 16 Dec 2022 08:04:45 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m19so3514790edj.8;
 Fri, 16 Dec 2022 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vG7cvGFYj3R9xUAjHyS/+8MPMSL1wkhvWNAECoU6/p0=;
 b=mqyjNsV7ltC4AxCrhykZNo7PKaAapbss2r/9/juS+UXDNKr45CxzmUfj4ULmu+hRVA
 nhah7tskcv1VP6azprKhpLu6hwKnt4P7prc92BCRVZMACXJCp/qPDVTHWg6qIpvnvY2v
 mfjw4j1pHVNjdOE9f0Xn2+t2SD/EcOl1E4lEoXX7R63FkYUYwSHmnrNfp0Gf17MHGMGK
 Bp+gCjAWtsvj9ZuxZAcCcG/U4MUZeX0F2K1rhkzKkPc972EEea0aJFNEJ3cifk1VHGtL
 EEbRbMBTrcsZivFT9tGlvaf/NGRZ4UTEPP5rFkvVvXJUb1l10P+KzIj/CXSoZoCa4UZ8
 0Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vG7cvGFYj3R9xUAjHyS/+8MPMSL1wkhvWNAECoU6/p0=;
 b=vuM+uVo9WH7bakaLROXzUQRhveA9jEeC13yhu20lo9LCRwNqnd51rWNC1by0SEzRI1
 f90y0IjZeKfjNU9HoSbU+pU5W+yzcyxGlS2uLmPjKC8U29xBwA376OXvH4ywYtctUvxJ
 IExXLr98D+IETDRQOUdV8vhloyUx/onyZCqRCqwNet3B5kalmLRkEGON7VcLF0Osz9eU
 mlT/k/KxaNZwFp6Gs2xU5N4SQDZ6bvHg5GiAsfl1Fhva6IGNbuK44IN22raTVjPOlIh5
 BJbh7yx/vvnnvJZMIiHXzWXvRkSmLb8MxfmpgJqF1UV0oPMQr0BIM9yNSCUz9aB1192S
 r9fA==
X-Gm-Message-State: ANoB5pkb3Qgk+Ude8Q3TxaDKDHyr0RGWry/vcbR8TQuGFKxez5zzowN3
 RraaIzkxTJFl31Kys1FYA/jbOiHj0s4=
X-Google-Smtp-Source: AA0mqf7TZgsyA+Lqukj9YqxS0QY/9g8viA6GnJSCasA5kFAWxnsZ2rKlRpmic9HZjwsiza3buCJ7kw==
X-Received: by 2002:a05:6402:c0b:b0:46c:a763:5889 with SMTP id
 co11-20020a0564020c0b00b0046ca7635889mr40997084edb.25.1671195880811; 
 Fri, 16 Dec 2022 05:04:40 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:39 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 4/7] hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
Date: Fri, 16 Dec 2022 14:03:52 +0100
Message-Id: <20221216130355.41667-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

The ACPIREGS are also provided by ACPI_PIIX4, so needs to select ACPI.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index b7006e18c8..1f7803fdab 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -31,7 +31,9 @@ config ACPI_NVDIMM
 
 config ACPI_PIIX4
     bool
-    depends on ACPI
+    select ACPI
+    select ACPI_SMBUS
+    select APM
 
 config ACPI_PCIHP
     bool
-- 
2.39.0


