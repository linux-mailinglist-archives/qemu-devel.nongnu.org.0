Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA33AEF35
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:34:51 +0200 (CEST)
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMss-000792-LO
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmv-0006z4-8X
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmr-0007RN-FF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d11so17999704wrm.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SM3QkhRywuOpgQl00XhRFMmxWkvrw2KqqZIARSUsh7Q=;
 b=lr3kXvpAjMHRSnGrzDJVNyYbx+Ord6Vu6mp+B01Or+bcPvPUKuDggQHEDxmla2hlOX
 GCvXz6TYKBzyeB1HmqMZCbqBs9qAhKpUS9uxFWhC92ZkvQX6XC5C5doTbwXvcWoyhQjz
 sQnoiFl1kV8Q/Vczo+jilJZzWiUABSDVxtjpemek5M9RCcvG17MVku9ENqfWeFgMCcTd
 O4REfGk36mHaJ60ZgQ5M9/eAa5CMWsk2H/yF/69Cn5zm/SA5s8CBFVCgCoaFagviYCe+
 Otmy9UxUrzP1UyU8ex63UGxzUI1LeTsz9A2XyzBMCjuHG81SWDnZlWh1Le+RLCAd6uyU
 snHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SM3QkhRywuOpgQl00XhRFMmxWkvrw2KqqZIARSUsh7Q=;
 b=Eo94FsZDzy75DS2MUmXE1hn26EzwWU2IlNs4TJtXRzlGCXZiC0F+uhBb5Asc9GhBIZ
 y4IU2XOzTK5E0eSQU04VJxCc6/zDt4ec/6bxA5Whcyc55JuFwBgKVWh5exIn84sCZtAU
 +ixdCjSBrq1j0JPRmZkZTZzf+0eMkD6MiaIbbVgcdZJ9wQamMjKIYmUtQWYyU121moxu
 zbMTuxPGQUolPFq99p1UseP0Ct59GxhScywoYOSCJE1APBD04xnGGzEOSubq8mdU/ks1
 dz8J1XsVNH/qE/RPLTofo8g2CEu7S5DYxG7MHusuOkscq01W0ZsQ/7poa0XGoH6lag+W
 qulg==
X-Gm-Message-State: AOAM532dpi6sH3Sgf0awRMfUEHsvlrnhhGFToz6K9GBjM8NTRkNAdqes
 3Mi6fGz1xLDlQRgO8nN8g9B296pDxQy1QgSB
X-Google-Smtp-Source: ABdhPJxhfplisFpKBZ3r8swCul9lo0N2VMmxRbQDUY0ZDncXdW9bDlnQurJhuwO82kJKewkHKUv+Sg==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr20012088wrr.356.1624292915810; 
 Mon, 21 Jun 2021 09:28:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/57] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
Date: Mon, 21 Jun 2021 17:27:37 +0100
Message-Id: <20210621162833.32535-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Generic code in target/arm wants to call acpi_ghes_record_errors();
provide a stub version so that we don't fail to link when
CONFIG_ACPI_APEI is not set. This requires us to add a new
ghes-stub.c file to contain it and the meson.build mechanics
to use it when appropriate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Message-id: 20210603171259.27962-2-peter.maydell@linaro.org
---
 hw/acpi/ghes-stub.c | 17 +++++++++++++++++
 hw/acpi/meson.build |  6 +++---
 2 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 hw/acpi/ghes-stub.c

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
new file mode 100644
index 00000000000..9faba043b85
--- /dev/null
+++ b/hw/acpi/ghes-stub.c
@@ -0,0 +1,17 @@
+/*
+ * Support for generating APEI tables and recording CPER for Guests:
+ * stub functions.
+ *
+ * Copyright (c) 2021 Linaro, Ltd
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/ghes.h"
+
+int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+{
+    return -1;
+}
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577212a..9b7fa75719c 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -13,13 +13,13 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
-                                                  'acpi-x86-stub.c', 'ipmi-stub.c'))
+                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))
-- 
2.20.1


