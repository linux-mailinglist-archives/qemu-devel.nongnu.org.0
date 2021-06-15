Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C433A85F7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:02:28 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBWF-0004xF-4r
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFB-0006Ga-UA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEh-0000xt-VD
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id z8so18868468wrp.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cyCGn2SVLHm0FcqfG3WrqBeex+FwY6W9NPYT/ExK5rY=;
 b=RTIRZkFXYwNRvr8zYxRg40Y8AOx9ZvebiiHfTdf+WNE/8v2d2mQINPgeNMiqlIS+4+
 xvKQSKTp2L3CNnojzSunMCWUm9wVS1FG8bV/9v4xrYgY96UaSD3u81jL3MRO/+qKJ9f8
 Hs9PFKZ51gq2+hmBxzWFrhDzNGPYalQPj0lpNnbHa0Gsu66lzepp/AN6KUmYlN8FyuDM
 OvA8vFGPzKLR8XcVa3GQJRqRvcvuET/a3WmSosLgmdBeysJ/FcoxgiyPptpIBIWsk2Qm
 PKOprDccOu+Zz7v1wS9H37Km0z1Ql4SrqDQ9sRkEqPFMA8stBaqz00ROAAgZdA//3OJR
 FY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyCGn2SVLHm0FcqfG3WrqBeex+FwY6W9NPYT/ExK5rY=;
 b=PKq8huM7pJhrRzK3ufomfmnEs9wQ9r8ClB1TRErnBMHD48Q/yMpF9FykiQla+GhY1w
 B5d+XNcIPx96rfOyi8UJmz99YTssl/+k8GeMf28CaYHCRsSdSkfJLjT8oLj1maUaVX4T
 Ib6obOErh5f5yFjxGl8D3CTX1rpoTjJTjV/YBMi1bpasAfY++B16VnZ92nTcDjgILVkD
 I1pgku+fCN76E9/detdUe+vFRKoeOfDqOXAzoe7PcFbJdGjVS3jstMrpVMrr0FGWPOww
 flZMURdoqqWxks1OblbJG6CqaJK+GjhECiG+SArErG1OEwKw9mcFjClsl1AzJxDK+tN8
 azsA==
X-Gm-Message-State: AOAM531ZTKXyv0DjgZ9typYi2wmVLDrEJD4ARWbhrgBkljbqeo8WmYm6
 4D/J/bK50DslrXDRqllyEesbFDYBfovlPg==
X-Google-Smtp-Source: ABdhPJwo0t32WImYpQgkf4EnBqsqWHkbWoEUH11KK19J7SgEIqkf6MSHE3i8EBTKRC4ptYXbMTM+sA==
X-Received: by 2002:adf:bd88:: with SMTP id l8mr25816320wrh.90.1623771854899; 
 Tue, 15 Jun 2021 08:44:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
Date: Tue, 15 Jun 2021 16:43:46 +0100
Message-Id: <20210615154405.21399-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
index dd69577212a..03ea43f8627 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -13,13 +13,13 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false:('ghes-stub.c'))
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


