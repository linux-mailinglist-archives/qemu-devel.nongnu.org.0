Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A47681B6B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMae1-0004pp-HK; Mon, 30 Jan 2023 15:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadQ-0003Ng-FV
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadN-00075p-CP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jY+AksjrJX7CqpiCRcQ/PHiwB0AL/642abvCG866J2c=;
 b=hjCV0SgidVA/eonzrlhlnN4E/rjKNP49QcP6ZgfpyaWCqIPMzo1ec2ob26R+9QeChjXHE1
 1hx5vCH1YrwzXYsEZWUi8a57LGRQooCowOu1+Ao5iEPU9xlBfnwh3Fh+5YVaL8KqNnL54e
 +BMkAqNBSlcqM6mA2VzgY84mb5B02fg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-e5GiJGrYO0O8vF70E-ES4Q-1; Mon, 30 Jan 2023 15:20:05 -0500
X-MC-Unique: e5GiJGrYO0O8vF70E-ES4Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso8935903edc.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jY+AksjrJX7CqpiCRcQ/PHiwB0AL/642abvCG866J2c=;
 b=aq5yURtHYZ6wLjzYaEQE7Spt3HzQg0s2UuiK1cseR+iI1W9u65vXHkYTOrbmcUUlLs
 D+VD+mQSIb3hvGQNiS/w82oQ2KBZrl9iLakI6mCe5nrC5Q5kPA9hzGTpE0ZHu6ZaYMMj
 Bn+dbthVAQUsYKN2ms70Glfk/eBfE7JZOTz1nwCNmQPpqsVPxJ9vWGnzIQ6f1jdbJIM+
 50mvEJ4cDsut+mOHtULPpMJQatqQoSMLG0nVYpyyWnKGnA2rMmls9+BWCmhn5vF7uYDf
 y0SRttA2GmbEiQhRAt2ADnKC34nPOk2IsiPJfcV0ajGP6SX9WcVX3ZU5n11Vw5eOXcZT
 fz1Q==
X-Gm-Message-State: AO0yUKW/Tj7vPTm4mSMuO21492wazuyNi6HHzf2qDrIdBjjBNSTqLlmU
 W4a2IY7fUr4PfYMnu2m/Mw1u7GE5XC4k2XGdgY+AaXZksfrBTg8C2Lv28AVIjtKyqSVkdGsC3+I
 MfAieqkNW//Q6ZrjyS7qVLa9bwkeUkYO6HzEHpaQ3tRBCF9f0FXbB66boAnAH
X-Received: by 2002:a50:c050:0:b0:4a1:9fb0:8770 with SMTP id
 u16-20020a50c050000000b004a19fb08770mr16533356edd.26.1675110004361; 
 Mon, 30 Jan 2023 12:20:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/OuoOPAtvPD81uG1de+TRb3v7tDAmqbqJcQv5VBwgeukfAPCvYrvX6LQxBN651fQlo4EkFYQ==
X-Received: by 2002:a50:c050:0:b0:4a1:9fb0:8770 with SMTP id
 u16-20020a50c050000000b004a19fb08770mr16533329edd.26.1675110004030; 
 Mon, 30 Jan 2023 12:20:04 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 w25-20020aa7d299000000b0048789661fa2sm7237588edq.66.2023.01.30.12.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:03 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 24/56] tests: acpi: extend bridge tests with hotplugged bridges
Message-ID: <20230130201810.11518-25-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

with previous commit fixing malformed PCNT calls to hotplugged
bridges, it should be possible add coldplug/hotplug test when
describing PCI topology in DSDT without breeaking CI.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-15-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 48 ++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index cb95f687fe..b65e864a9c 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -805,12 +805,15 @@ static char *test_acpi_create_args(test_data *data, const char *params)
     return args;
 }
 
-static void test_acpi_one(const char *params, test_data *data)
+static void test_vm_prepare(const char *params, test_data *data)
 {
-    char *args;
-
-    args = test_acpi_create_args(data, params);
+    char *args = test_acpi_create_args(data, params);
     data->qts = qtest_init(args);
+    g_free(args);
+}
+
+static void process_acpi_tables(test_data *data)
+{
     test_acpi_load_tables(data);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
@@ -830,7 +833,12 @@ static void test_acpi_one(const char *params, test_data *data)
     }
 
     qtest_quit(data->qts);
-    g_free(args);
+}
+
+static void test_acpi_one(const char *params, test_data *data)
+{
+    test_vm_prepare(params, data);
+    process_acpi_tables(data);
 }
 
 static uint8_t base_required_struct_types[] = {
@@ -861,8 +869,21 @@ static void test_acpi_piix4_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1 "
-                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
+    test_vm_prepare("-S"
+        " -device pci-bridge,chassis_nr=1"
+        " -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2", &data);
+
+    /* hotplugged bridges section */
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr",
+        "{'bus': 'pci.1', 'addr': '2.0', 'chassis_nr': 3 }");
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr_multifunc",
+        "{'bus': 'pci.1', 'addr': '0xf.1', 'chassis_nr': 4 }");
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbrhost",
+        "{'bus': 'pci.0', 'addr': '4.0', 'chassis_nr': 5 }");
+    qtest_qmp_send(data.qts, "{'execute':'cont' }");
+    qtest_qmp_eventwait(data.qts, "RESUME");
+
+    process_acpi_tables(&data);
     free_test_data(&data);
 }
 
@@ -962,7 +983,7 @@ static void test_acpi_q35_multif_bridge(void)
         .machine = MACHINE_Q35,
         .variant = ".multi-bridge",
     };
-    test_acpi_one(
+    test_vm_prepare("-S"
         " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
         " -device pcie-root-port,id=rp0,multifunction=on,"
                   "port=0x0,chassis=1,addr=0x2"
@@ -974,6 +995,17 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3",
         &data);
 
+    /* hotplugged bridges section */
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr1",
+        "{'bus': 'br1', 'addr': '6.0', 'chassis_nr': 128 }");
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr2-multiif",
+        "{ 'bus': 'br1', 'addr': '2.2', 'chassis_nr': 129 }");
+    qtest_qmp_device_add(data.qts, "pcie-pci-bridge", "hpbr3",
+        "{'bus': 'rp0', 'addr': '0.0' }");
+    qtest_qmp_send(data.qts, "{'execute':'cont' }");
+    qtest_qmp_eventwait(data.qts, "RESUME");
+
+    process_acpi_tables(&data);
     free_test_data(&data);
 }
 
-- 
MST


