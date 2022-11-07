Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EA6203BD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:27:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0Z-0006NK-Q7; Mon, 07 Nov 2022 17:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0X-0006JX-KQ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0V-00065e-Uq
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQ1/BomIRFztpDcrRWvl9XIanMtjGIScXYTSMoiPANE=;
 b=Roi9WSpzUrsbf/GIBLD7t23FzoyFWT1LX4qK5gLaKsEgIxnjB7aBUE2ba+SZqwEAjpdfCn
 68AybR681XtaftRcIznTRcAm7oeGs4KoSlPC4p+ZhFNmE9C+MO7pjL/gRDX8PCvxoOW3VM
 MJaogieDfREWJANM529H52QcdabdDVY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-E93iWtN7M02OHMTWC_rFPw-1; Mon, 07 Nov 2022 17:54:18 -0500
X-MC-Unique: E93iWtN7M02OHMTWC_rFPw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bq13-20020a05620a468d00b006fa5a75759aso11402610qkb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQ1/BomIRFztpDcrRWvl9XIanMtjGIScXYTSMoiPANE=;
 b=ilqy4DzViyLzSHbpATlldRSVDslkUqhCcmiIH07UKL5hGG1kUSVBrmCKPY8VGg1Wta
 uN+unZ6gkUXfQo+58xntzjYboMUyCL9eBAiJ1gGcyf+cQZX4rCkHT8DSxdWoygsX12FG
 zd1Yta5xb/R4pmotY0qQqIT1mkhcGl/izJT4XJDvbqJbQ0bcDAn1O8CxwoXY9jlc7EgT
 F+xf5Cl407glRWiRjIC7QPRC1YXfWfqe6x2qPVXMNnO0Qfqmx0tjAsXMQ2zIRZVetwag
 xUBLVwvwld7MnYrWAiZgmRE0PL8wRWSPw/lRYxPp3A7iCMSPhWCh4E2M+cUCR72fXJpD
 suJw==
X-Gm-Message-State: ACrzQf0MkzpA+EfFXvD66oolLt5orbgrMlovlMh2Bh72y6i1VXv7zAS5
 vclD5GaclbOB6tmhcR1LTkWOOWgXWm4RIkiFoduYZfXdpKtoJgZID5KK0Nt649JrmjwVM/2H+19
 PMO9ZFufXGI3RbsMsgGPHAlIxWTwh0tTOXXZXVTQ1nXsEcJZ7g07X/i9JlXv0
X-Received: by 2002:ae9:ef53:0:b0:6fa:401a:7f68 with SMTP id
 d80-20020ae9ef53000000b006fa401a7f68mr784043qkg.551.1667861657574; 
 Mon, 07 Nov 2022 14:54:17 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4Pnlft+2gjEtRMo8wO4BvahbKv0I/08RMFGCalHetWH9uqnC5yewd8MH8YNOdJXH9wOv+VCQ==
X-Received: by 2002:ae9:ef53:0:b0:6fa:401a:7f68 with SMTP id
 d80-20020ae9ef53000000b006fa401a7f68mr784037qkg.551.1667861657247; 
 Mon, 07 Nov 2022 14:54:17 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 c8-20020a05620a134800b006ecb9dfdd15sm7651430qkl.92.2022.11.07.14.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:54:16 -0800 (PST)
Date: Mon, 7 Nov 2022 17:54:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 80/83] bios-tables-test: add test for number of cores > 255
Message-ID: <20221107224600.934080-81-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index aa91b0fca5..395d441212 100644
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
@@ -1994,6 +2024,8 @@ int main(int argc, char *argv[])
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


