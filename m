Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA6A536683
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:22:58 +0200 (CEST)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudft-0000Za-AT
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH9-0006XR-Q2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH8-000726-7Y
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653670641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJJc10DVqGDEpNlre1qEvs9AhiCw/sv9P3SoXjjmmIU=;
 b=QVGR0aSKnaBSlSk8bOmjX8Vdr5eLK1QjqZFooor9j3lCrdufYYeEFZX3XfB0nBjTA6R9Cq
 KVqwF0jRcvjkZ78mc1ed60Aez4IOnNGxX9Sr1+i4QRCLC88I92rwXX2GoPD+rvjp+ukN+I
 3kjOH5QMXZ/i4X9wjv0kXYvs8sq4CdY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-zpDFvq43Pc-67za7H-h0QA-1; Fri, 27 May 2022 12:57:20 -0400
X-MC-Unique: zpDFvq43Pc-67za7H-h0QA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EAD41801386;
 Fri, 27 May 2022 16:57:20 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C13FF2026D64;
 Fri, 27 May 2022 16:57:18 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
Date: Fri, 27 May 2022 18:56:50 +0200
Message-Id: <20220527165651.28092-5-jusual@redhat.com>
In-Reply-To: <20220527165651.28092-1-jusual@redhat.com>
References: <20220527165651.28092-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new test is run with a large number of cpus and checks if the
core_count field in smbios_cpu_test (structure type 4) is correct.

Choose q35 as it allows to run with -smp > 255.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0ba9d749a5..f2464adaa0 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -100,6 +100,8 @@ typedef struct {
     smbios_entry_point smbios_ep_table;
     uint16_t smbios_cpu_max_speed;
     uint16_t smbios_cpu_curr_speed;
+    uint8_t smbios_core_count;
+    uint16_t smbios_core_count2;
     uint8_t *required_struct_types;
     int required_struct_types_len;
     QTestState *qts;
@@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
 
 static bool smbios_cpu_test(test_data *data, uint32_t addr)
 {
+    uint8_t real_cc, expect_cc = data->smbios_core_count;
+    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
     uint16_t expect_speed[2];
-    uint16_t real;
     int offset[2];
     int i;
 
@@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
         }
     }
 
+    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
+    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
+
+    if (expect_cc && (real_cc != expect_cc)) {
+        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
+                real_cc, expect_cc);
+        return false;
+    }
+    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
+        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
+                real_cc2, expect_cc2);
+        return false;
+    }
+
     return true;
 }
 
@@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_core_count2(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".core-count2",
+        .required_struct_types = base_required_struct_types,
+        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
+        .smbios_core_count = 0xFF,
+        .smbios_core_count2 = 275,
+    };
+
+    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_bridge(void)
 {
     test_data data;
@@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/piix4/pci-hotplug/off",
                        test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
         qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-- 
2.35.1


