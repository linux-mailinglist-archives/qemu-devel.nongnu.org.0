Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC126A8F4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 17:40:16 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kID43-0005Bm-1E
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 11:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kID2X-0003v2-JR
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 11:38:41 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:54211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kID2V-0004Wo-Um
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 11:38:41 -0400
Received: by mail-pj1-x1043.google.com with SMTP id t7so1960872pjd.3
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C+pxfabqqEbpbP52/uopOa9jod19U4/Iicx9HACbYdw=;
 b=W+SikXy0pa865LDa/jflLOzbt64Ir/B2KMrutaFdxJDfV7FF3+fD3r1SJNtYE9qK3Q
 bPa0KNioDVxkpAOtRPe7+0zZOvhRB4Pwsz+eBL5oZO9+cgEaaydTQaIt/UXpL0P84gVi
 StQM7Y+Z+6bMl6bi2d7By5Q1tQotHtLo0ayWMRN3AundMfPwKMzFca8t5QiHJ+QjfYgB
 /oPQGwRplyR91eG0RX4/woUjToJDfImI2FC/P8a45Hlg1jNOmWOGvRO+bkaXxVmcZKh8
 rcBFQyx7ggJ1vbsnCnB6w62B/HHhIR8Foo8QpSaXCNzbGaWR9BBlFwFsDWjF96CB+alJ
 5WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C+pxfabqqEbpbP52/uopOa9jod19U4/Iicx9HACbYdw=;
 b=O27ck7rEoUTg/Ww2Eg3+rHVwe6YADu9bs7/rFJKbS4Oio7q9U8+MCccEXJu3v3JjXO
 9BhOXcdIRMfbaCCD8ILAnYS5t+Iai0x8OLI8o1ciolac/M3qaz11El9LHD0yhCtaTgHf
 w4MwoEcNCOyBSqG7WigV/FsnuVz2T2eqNQYKYGEt8sp0SoJM21HKgbWejUfB3dX4+dPz
 PTsXDnvYBgwUQSOea5vCNY4XMX+vfWR50c+QmKpYiKV5gCLk2wlcsJC5D+WYHeVtTvwV
 7ItpJb7mh6JbIHBCcqOCEiR2sSNqepw6uXtiK6nPZk/BbVky/7F1Mh7uTJk71jSQJDBo
 zLWw==
X-Gm-Message-State: AOAM530g95UXD5cPRJM01rfliNLYvGKTEyy+A/JR6vRqRxyIyONbUe3w
 EobEZTQQKpTJRnndDbsbHjz80Zc1nIbKP8gs
X-Google-Smtp-Source: ABdhPJwiqYvwWcO4CxbvLpEJJZ1qhEE9UvMN/Ek8uzTy5vdT8SMQRExIrWJVqVLGiLmenHJU2mT9FA==
X-Received: by 2002:a17:902:6bc3:b029:d1:e609:7a29 with SMTP id
 m3-20020a1709026bc3b02900d1e6097a29mr1997156plt.46.1600184318264; 
 Tue, 15 Sep 2020 08:38:38 -0700 (PDT)
Received: from localhost.localdomain ([115.96.130.76])
 by smtp.googlemail.com with ESMTPSA id 194sm13283547pfy.44.2020.09.15.08.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:38:37 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] tests/acpi: add a new unit test to test hotplug off/on
 feature on the root pci bus
Date: Tue, 15 Sep 2020 21:08:11 +0530
Message-Id: <20200915153818.13020-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915153818.13020-1-ani@anisinha.ca>
References: <20200915153818.13020-1-ani@anisinha.ca>
Received-SPF: none client-ip=2607:f8b0:4864:20::1043;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1043.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
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


