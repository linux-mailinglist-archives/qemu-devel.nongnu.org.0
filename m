Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0542F61674B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJA-0003h2-IV; Wed, 02 Nov 2022 12:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIt-0003V3-Pk
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIs-0002Qh-2A
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r9vdx2EfpMpYrBk5S9oLt56NSZSM3zJ5c2K9Y7veOgQ=;
 b=XNJKN4/r68ZHTuTqHvRXjSC5FEulaGVflkvUQdcC59ccNMhdObfBnlgROPRWrckXIbBeNL
 7aMAiRuKddRCHa1KUxiBC4LGyxQkelaRiru5ABtHXDSIVLtgfvUh4CzgRedHfAbUR1PvI1
 v1BfZQ2G5b2YbXovu7Dyrj+kHZ2Iakk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-9E7K_O81PuKv1LH7voGm3A-1; Wed, 02 Nov 2022 12:09:19 -0400
X-MC-Unique: 9E7K_O81PuKv1LH7voGm3A-1
Received: by mail-wr1-f71.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso4981675wrb.8
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9vdx2EfpMpYrBk5S9oLt56NSZSM3zJ5c2K9Y7veOgQ=;
 b=vnaA6rw+apVvTktirf1EkXoYdaKu0vUV7DPUy8sCNhNR0cjgmXrJM6AQuJr+ioiMrK
 vz8SsxNVIFE6czW1jKaJgzyDfjMWcyCHiMx3LF4Kgm3o8VTh7LwT13nNZg9JQSQZ6DzM
 1umKyuF6o44ntI9yk8mXXITBYtc6hrKqh4jHa+DrhLckOe2FoWjSA8dgLxP7Gq9RV4c6
 sn1mtK40aLxiG7VsQRZZHV7ltTCk2XLL0HZ66XlQ/5rMtdwYNQajaaZHmF6Mg3TZ1cWz
 qgVTFN6ZKuyCd/AMA+PAFWQQS504a6VGOlt82pzP3Ur1EHgRK6PdSK9sHy0qO0tJj1Zf
 Fhxw==
X-Gm-Message-State: ACrzQf3MAegN4v8rFkgRJGYWtS8kR5XtNRPo5eYTKwclQJNb+700sEC/
 Ol7jogpShahll/hJHZL74/vR6fYk9dapz07qL39cIjVGbD20gygTu5+TzZnXhz6oI57pQdjIXbo
 G1jIBIOkhw78m+tbGOC9U7QQp+aViwi+XnKQTOdlmrLyIUFrXxGrwV+czWvgO
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id
 k9-20020a7bc409000000b003cf4c818936mr25907173wmi.38.1667405357878; 
 Wed, 02 Nov 2022 09:09:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Z6IztirklKoAtVs9+SMH06fyWpJ+NQcBCp4nm64mZtbFvteS+5pLeU4zxN7jRHS6uZ4ddSg==
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id
 k9-20020a7bc409000000b003cf4c818936mr25907137wmi.38.1667405357543; 
 Wed, 02 Nov 2022 09:09:17 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003a6125562e1sm3042736wmq.46.2022.11.02.09.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:17 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 20/82] bios-tables-test: add test for number of cores > 255
Message-ID: <20221102160336.616599-21-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Julia Suvorova <jusual@redhat.com>

The new test is run with a large number of cpus and checks if the
core_count field in smbios_cpu_test (structure type 4) is correct.

Choose q35 as it allows to run with -smp > 255.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-5-jusual@redhat.com>
Message-Id: <20221011111731.101412-5-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0db6630772..ee6b1b483d 100644
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
@@ -1887,6 +1917,8 @@ int main(int argc, char *argv[])
             if (has_kvm) {
                 qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
                 qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
+                qtest_add_func("acpi/q35/core-count2",
+                               test_acpi_q35_tcg_core_count2);
             }
             qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
 #ifdef CONFIG_POSIX
-- 
MST


