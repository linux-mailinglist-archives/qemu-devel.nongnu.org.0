Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1C61DC6A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMoO-0007Nh-4V; Sat, 05 Nov 2022 13:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMma-0006c0-Ny
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmW-0007M7-CN
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r9vdx2EfpMpYrBk5S9oLt56NSZSM3zJ5c2K9Y7veOgQ=;
 b=Ry/BMQOjPuuyf4aD+BkYTX4EkwsSVmJrPFec34A7iKfilXEq4/E4hMkrbabdSAd0YIhawf
 W5+Qa7aC8iuMwAriSmveoAJFxE3y12gNxfDOFIUUsblDcEjYTDlVyLut8al5NX0p/5JzDj
 Ch9kozdOKX8w+V5k7baPnWq8Tbkx+hA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-7cYvNdN_Om6OLnEDV25icQ-1; Sat, 05 Nov 2022 13:16:30 -0400
X-MC-Unique: 7cYvNdN_Om6OLnEDV25icQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so5987862wme.7
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9vdx2EfpMpYrBk5S9oLt56NSZSM3zJ5c2K9Y7veOgQ=;
 b=THGgvpNme0SWIhi9pPGYwHomEStfCYKx3+aKF8TjVb7v+rI+Tr0++aM21B+Rl75Al2
 y23mc9KuoS7LIJamIhCH/pRclJO8B86GgrytcszFbksTV1RVHEw4+hfeUxEP6QAOeSui
 ja4hzifWMui8lgDH56xKfN9YRFEsXzDy8n4LPXxC3DZ1qpkb4boseAA6+40KxxW0J0qV
 Hk+Mrs3irbSlB/T+7WGdKYM05jM5tKAcML5ElugERqciozW9Wu6vTVBbP6kZ9sHefrvj
 /G8v/O2tTtSYtMsFRmVgugpn+MOg08IEjWMzXy3RRoMnZk3wUwZdLTqF7aDs8Qmn1/dP
 PIEQ==
X-Gm-Message-State: ACrzQf0KdwO6wNoGhJVI/Jxit36IZYqzwWmb4QQitgm6yPsKYCPouMHj
 ef7ikF46f9VQNnuv5yRoS8qPw8o0+ayQ8HqZLcKsBsmHGNk6YBTJcljSTbTPdfhDJkxBlQoOUc4
 hpXZj7h/NTUQUfjag+JhcGfiHfomn2cgVZ6TwPpaO/jQuXexIMBpKCPV0Xxm/
X-Received: by 2002:a05:600c:1609:b0:3cf:4dc4:5a99 with SMTP id
 m9-20020a05600c160900b003cf4dc45a99mr27869125wmn.67.1667668588676; 
 Sat, 05 Nov 2022 10:16:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5VTO/3+OXmu1WYuxAHt56v5g/PDT3fdXlLz+gQ1pEtnGdrgoGjpmTYGtq2uQ8h28Vipq//7g==
X-Received: by 2002:a05:600c:1609:b0:3cf:4dc4:5a99 with SMTP id
 m9-20020a05600c160900b003cf4dc45a99mr27869108wmn.67.1667668588371; 
 Sat, 05 Nov 2022 10:16:28 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003b4fdbb6319sm7117397wmq.21.2022.11.05.10.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:27 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 20/81] bios-tables-test: add test for number of cores > 255
Message-ID: <20221105171116.432921-21-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


