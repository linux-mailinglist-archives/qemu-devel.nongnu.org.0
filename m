Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD73268ACA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 14:23:18 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHnVt-0005AG-8K
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 08:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kHnSs-0002it-R8
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 08:20:12 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kHnSp-00070A-QV
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 08:20:10 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kk9so5278412pjb.2
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=yfXD2zBgmYZgPVxKBmr80THfM4wfEY9XMRnvrPT1WGI=;
 b=Xbf0N+f8x7KpO7nfaM6DWhWKa18qtYaVqH3yrcsBtESulUyIDTKvKO2LHxJKAEK65D
 mcCS160W5dIL6sWN4HuIVKWCFk4gEcLCaxXKtQN2hVSilVi7vBxCD3/JdFZS2Grtt4FU
 ABRBcmaZiSBMc58rIO4ShSzA7KkoIWxEy1kZSV0bKk48vh2TNWoqxofq5YayNE0Xr3Mq
 vPcXGUgr1KPpZFbl/Pc0dX9ZwP5TYTAdBLMvnrXj+g81emP6kHjqWI5m+u+tDcSE2x9B
 9BTOjmemiY45FAli4QM7Uytr+RQ/46vXieLRBLHkqFCNFwoyCrM7a6BIhkoQHJ50jUqf
 vk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yfXD2zBgmYZgPVxKBmr80THfM4wfEY9XMRnvrPT1WGI=;
 b=TClgXf4U/RIMwonVSL6VcNzf+vwfHKCuBPZOkYO3ycWS0KmF8cn/Sk6Y2yqGSsIWzd
 HUy3u+8U7V0/6PrgOfX69w96gtCfSKInPrEjAgeQrW3z9XpVbnWN3YHlr6oothbgCoUF
 RN4ic+DSaHUibuxeIYiDE7mvuFWMCrF3xCMAG+T5eJKO8CUmWDEnT29n4kheExKjAiUU
 L6uO8bPpyS5K66942hoNGVJcWXzLlygTzXVbbZ5ltD8T3fHNEA0m4NLthnq1RKRmY/vq
 9IEmq0U8lZi76otfUF2i9+PzANgO1UACOfRMKr6xr/0cgh7vA7HiYY9nu2Ouy1gu/vZT
 4/dg==
X-Gm-Message-State: AOAM532DlPvcEWALE63JB1LKCmKZlcEikDIcjveQRz43FnCr+JGNdwS5
 IjJgfqUlw33tI3pFlG23HCzD/6hl6XKww5MW
X-Google-Smtp-Source: ABdhPJxPKKX1ARFPeQD21RycxT/ZmZtw4pwJz7B5HhTCq1uoYIeKh5xk3TJyT3FMPKMFPloEwXTCvg==
X-Received: by 2002:a17:90a:1188:: with SMTP id
 e8mr14053155pja.185.1600086005945; 
 Mon, 14 Sep 2020 05:20:05 -0700 (PDT)
Received: from localhost.localdomain ([203.212.240.177])
 by smtp.googlemail.com with ESMTPSA id h6sm10548128pfb.217.2020.09.14.05.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 05:20:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9 v2] tests/acpi: add a new unit test to test hotplug off/on
 feature on the root pci bus
Date: Mon, 14 Sep 2020 17:49:57 +0530
Message-Id: <20200914121957.4073-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2607:f8b0:4864:20::1041;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ability to turn hotplug off on the pci root bus for i440fx was added in commit:
3d7e78aa7777f0 ("Introduce a new flag for i440fx to disable PCI hotplug on the root bus")

This change adds a unit test in order to test this feature.

This change has been tested against upstream qemu master branch tip.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

changelog:
v1: initial patch
v2:  updated comment to reflect that the patch was tested against qemu master branch tip.

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 504b810af5..d8c7d57557 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -740,6 +740,20 @@ static void test_acpi_piix4_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_piix4_root_hotplug(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".roothp";
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+    test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
+                  "-device pci-bridge,chassis_nr=1", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg(void)
 {
     test_data data;
@@ -1144,6 +1158,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+        qtest_add_func("acpi/piix4/hotplug", test_acpi_piix4_root_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-- 
2.17.1


