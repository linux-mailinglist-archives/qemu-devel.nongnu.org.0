Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E727CBF8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 14:33:21 +0200 (CEST)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNEoq-0006CB-Rz
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 08:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kNEmD-0005CQ-6q
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 08:30:38 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kNEm3-0007m0-KB
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 08:30:35 -0400
Received: by mail-pj1-x1042.google.com with SMTP id bw23so2574545pjb.2
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 05:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+67w5EoAOzICYZfnx9BrYBd+y0NxsFJyPv4doQcmzjY=;
 b=ex+c2ilQ0BF3qCxYGgnTu2PD6mOxx3QzuJvlYF97eKHiduByyXKmojLwWFZB6rz9Ux
 AftGX+34ClZuJ0bFwB3c+3w4CXsSCXxv6elCl0yeO8OvQ8LiVWU8rwclcXk1yUIcjVkj
 9YpOtT8GdbI4jHnt9RGOaRooX7XxcEKL22BV078HFtrZyOV0f0faSfCXRomtP+i7Pl1w
 3tBT3ZUVFROmZjzQgCVTXJ22SZYTyotuX26w70eIzmckEc15mHbBPYHJTH1hOLY+0Tnl
 3lB3gfJkd/ph1OmWvzcAqnxEnhsEDzyoG/ssyQb6ftapAAlx9RlxBMaIQ7WlWJ1SMil9
 4MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+67w5EoAOzICYZfnx9BrYBd+y0NxsFJyPv4doQcmzjY=;
 b=rLE/i3ay+caYvyFsyKhXC0jHLDo24AA1denEYolndnoUV6i1CB+dwhEVWamXC74Bbd
 sXo8ZeThPS767qZ1/2XEpgeEmkTi4mO7wWTarzpL0IYabdn+5UnSnTEGYCRJEPElo+sY
 sREufobnOBf60J9yfNGzbUYEGrHcB8puVC2d/piL4Mk3OJaHV+ZCBlPU34AwBhqIPuPg
 oZ+QzRvwSAqH2g71I0kWpPjag/+2up2Tp5i3kbjAKfmbSth2remKfIalUZ0ewdrx2L1x
 1uw/hM+4GMeKkFqPS8lmzKGfBr5wgrsAi+9hxOs5oAfZ505xfrMAJAjAs26V5+IJud/D
 Gt3g==
X-Gm-Message-State: AOAM530ZZr1wrUdSsLR4tMrTAkvXH+bRWp15YqtEYjiTKEh5wCMgnuZn
 6T5QCTh9YcAyNsIKuL3KbTbK7Q==
X-Google-Smtp-Source: ABdhPJyWDD+Ek9cuoJnBRTtvxhUmebh/m38j0FjM0sEQkAiGr2kkZZKxvwOH0itouIPlPRLrXmsX1g==
X-Received: by 2002:a17:90a:4498:: with SMTP id
 t24mr3534211pjg.166.1601382626107; 
 Tue, 29 Sep 2020 05:30:26 -0700 (PDT)
Received: from localhost.localdomain ([115.96.125.11])
 by smtp.googlemail.com with ESMTPSA id 16sm4359035pjl.27.2020.09.29.05.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 05:30:25 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/acpi: unit test exercising global pci hotplug off
 for i440fx
Date: Tue, 29 Sep 2020 18:00:10 +0530
Message-Id: <20200929123011.31836-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929123011.31836-1-ani@anisinha.ca>
References: <20200929123011.31836-1-ani@anisinha.ca>
Received-SPF: none client-ip=2607:f8b0:4864:20::1042;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1042.google.com
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
 jusual@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change adds a unit test to exercise the case when hotplug is disabled
both for pci root bus and the pci bridges by passing the following two
switches to qemu:

  -global PIIX4_PM.acpi-root-pci-hotplug=off
  -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off

bios-tables-test-allowed-diff.h documents the fact that a new DSDT acpi gold
master binary blob we need to be added to test this. We will do the actual
addition in the next patch in the series.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  1 +
 tests/qtest/bios-tables-test.c              | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

Changelog:
no changes in this patch from previously sent v10

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dea61d94f1 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.hpbrroot",
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 3c09b844f9..b514b70b62 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -770,6 +770,21 @@ static void test_acpi_piix4_no_bridge_hotplug(void)
     free_test_data(&data);
 }
 
+static void test_acpi_piix4_no_acpi_pci_hotplug(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".hpbrroot";
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+    test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
+                  "-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
+                  "-device pci-bridge,chassis_nr=1", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg(void)
 {
     test_data data;
@@ -1192,6 +1207,8 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_no_root_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
                        test_acpi_piix4_no_bridge_hotplug);
+        qtest_add_func("acpi/piix4/pci-hotplug/off",
+                       test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-- 
2.17.1


