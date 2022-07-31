Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B6B585FD1
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jul 2022 18:26:52 +0200 (CEST)
Received: from localhost ([::1]:45780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIBmF-00018C-KP
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 12:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oIBif-0002QV-1y
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 12:23:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oIBid-0007Tb-9A
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 12:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659284586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIeozfPQ+q91HKbKXYEwiaqMRpPbtxizeVHugjKww0s=;
 b=f0ttfFCKZ/vBYIc78Ac8bGEoeUb3GXUNF0iFuKg+le1xLvFjYhW5XmHvet9oIFEj3+CGWY
 tq+4NZs8cZ4qLLgeixA5dW5eLAuMRxNroD9/sMuxedf23/gBK2E34za2825D5T3MvZCaEn
 d/WQ1sDp4ZQiUDuQHPtGNijHoMPPRaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-zcW8TahWO7qXv9eReT7aiw-1; Sun, 31 Jul 2022 12:21:59 -0400
X-MC-Unique: zcW8TahWO7qXv9eReT7aiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C6C48041BE;
 Sun, 31 Jul 2022 16:21:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C21802026D64;
 Sun, 31 Jul 2022 16:21:57 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v2 4/5] bios-tables-test: add test for number of cores > 255
Date: Sun, 31 Jul 2022 18:21:40 +0200
Message-Id: <20220731162141.178443-5-jusual@redhat.com>
In-Reply-To: <20220731162141.178443-1-jusual@redhat.com>
References: <20220731162141.178443-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 tests/qtest/bios-tables-test.c | 53 +++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e352d5249f..cebfa430ac 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -92,6 +92,8 @@ typedef struct {
     SmbiosEntryPoint smbios_ep_table;
     uint16_t smbios_cpu_max_speed;
     uint16_t smbios_cpu_curr_speed;
+    uint8_t smbios_core_count;
+    uint16_t smbios_core_count2;
     uint8_t *required_struct_types;
     int required_struct_types_len;
     QTestState *qts;
@@ -631,29 +633,38 @@ static inline bool smbios_single_instance(uint8_t type)
     }
 }
 
-static bool smbios_cpu_test(test_data *data, uint32_t addr)
+static void smbios_cpu_test(test_data *data, uint32_t addr)
 {
-    uint16_t expect_speed[2];
-    uint16_t real;
+    uint8_t core_count, expected_core_count = data->smbios_core_count;
+    uint16_t speed, core_count2, expected_core_count2 = data->smbios_core_count2;
+    uint16_t expected_speed[2];
     int offset[2];
     int i;
 
     /* Check CPU speed for backward compatibility */
     offset[0] = offsetof(struct smbios_type_4, max_speed);
     offset[1] = offsetof(struct smbios_type_4, current_speed);
-    expect_speed[0] = data->smbios_cpu_max_speed ? : 2000;
-    expect_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
+    expected_speed[0] = data->smbios_cpu_max_speed ? : 2000;
+    expected_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
 
     for (i = 0; i < 2; i++) {
-        real = qtest_readw(data->qts, addr + offset[i]);
-        if (real != expect_speed[i]) {
-            fprintf(stderr, "Unexpected SMBIOS CPU speed: real %u expect %u\n",
-                    real, expect_speed[i]);
-            return false;
-        }
+        speed = qtest_readw(data->qts, addr + offset[i]);
+        g_assert_cmpuint(speed, ==, expected_speed[i]);
     }
 
-    return true;
+    core_count = qtest_readb(data->qts,
+                             addr + offsetof(struct smbios_type_4, core_count));
+    core_count2 = qtest_readw(data->qts,
+                              addr + offsetof(struct smbios_type_4, core_count2));
+
+    if (expected_core_count) {
+        g_assert_cmpuint(core_count, ==, expected_core_count);
+    }
+
+    /* Core Count has reached its limit, checking Core Count 2 */
+    if (expected_core_count == 0xFF && expected_core_count2) {
+        g_assert_cmpuint(core_count2, ==, expected_core_count2);
+    }
 }
 
 static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
@@ -686,7 +697,7 @@ static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
         set_bit(type, struct_bitmap);
 
         if (type == 4) {
-            g_assert(smbios_cpu_test(data, addr));
+            smbios_cpu_test(data, addr);
         }
 
         /* seek to end of unformatted string area of this struct ("\0\0") */
@@ -903,6 +914,21 @@ static void test_acpi_q35_tcg(void)
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
@@ -1822,6 +1848,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/piix4/pci-hotplug/off",
                        test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
         qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-- 
2.35.3


