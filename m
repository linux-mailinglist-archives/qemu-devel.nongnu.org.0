Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F1A5FB2C8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:59:23 +0200 (CEST)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEqw-0002El-8f
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIp-0002y9-BT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIn-0008I0-Gv
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ls7yjzgtegsEdtTaf1OQdi45CterqBiWgePQdLDruZQ=;
 b=fP4l5MhWwkpkHlyafXL38kv4ebUjy9q0nBOwgv5I4hRsV7Ga5L0XYRjbJh3LV1seJhBspv
 XiSDEepvI4IoCaHXQ0Cpqlj/XdnoJUStDIAw/k29lpEHQobOuu4WBGfS766N9+AGyL4qiI
 VI7nZpdsoR7Bo919DF9NhcHx0oXTOZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-v6hbQsN8PHCyXnHabr7ecA-1; Tue, 11 Oct 2022 07:18:24 -0400
X-MC-Unique: v6hbQsN8PHCyXnHabr7ecA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B788B862FDF;
 Tue, 11 Oct 2022 11:18:23 +0000 (UTC)
Received: from ovpn-194-244.brq.redhat.com (ovpn-194-244.brq.redhat.com
 [10.40.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79F6F4B400F;
 Tue, 11 Oct 2022 11:18:22 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v3 4/5] bios-tables-test: add test for number of cores > 255
Date: Tue, 11 Oct 2022 13:17:30 +0200
Message-Id: <20221011111731.101412-5-jusual@redhat.com>
In-Reply-To: <20221011111731.101412-1-jusual@redhat.com>
References: <20221011111731.101412-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new test is run with a large number of cpus and checks if the
core_count field in smbios_cpu_test (structure type 4) is correct.

Choose q35 as it allows to run with -smp > 255.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-5-jusual@redhat.com>
---
 tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f5fffdc348..4a76befc93 100644
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
@@ -631,29 +633,42 @@ static inline bool smbios_single_instance(uint8_t type)
     }
 }
 
-static bool smbios_cpu_test(test_data *data, uint32_t addr)
+static void smbios_cpu_test(test_data *data, uint32_t addr,
+                            SmbiosEntryPointType ep_type)
 {
-    uint16_t expect_speed[2];
-    uint16_t real;
+    uint8_t core_count, expected_core_count = data->smbios_core_count;
+    uint16_t speed, expected_speed[2];
+    uint16_t core_count2, expected_core_count2 = data->smbios_core_count2;
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
+                    addr + offsetof(struct smbios_type_4, core_count));
+
+    if (expected_core_count) {
+        g_assert_cmpuint(core_count, ==, expected_core_count);
+    }
+
+    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
+        core_count2 = qtest_readw(data->qts,
+                          addr + offsetof(struct smbios_type_4, core_count2));
+
+        /* Core Count has reached its limit, checking Core Count 2 */
+        if (expected_core_count == 0xFF && expected_core_count2) {
+            g_assert_cmpuint(core_count2, ==, expected_core_count2);
+        }
+    }
 }
 
 static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
@@ -686,7 +701,7 @@ static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
         set_bit(type, struct_bitmap);
 
         if (type == 4) {
-            g_assert(smbios_cpu_test(data, addr));
+            smbios_cpu_test(data, addr, ep_type);
         }
 
         /* seek to end of unformatted string area of this struct ("\0\0") */
@@ -908,6 +923,21 @@ static void test_acpi_q35_tcg(void)
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
@@ -1859,6 +1889,8 @@ int main(int argc, char *argv[])
                 qtest_add_func("acpi/q35/tpm12-tis",
                                test_acpi_q35_tcg_tpm12_tis);
             }
+            qtest_add_func("acpi/q35/core-count2",
+                           test_acpi_q35_tcg_core_count2);
             qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
             qtest_add_func("acpi/q35/multif-bridge",
                            test_acpi_q35_multif_bridge);
-- 
2.37.3


