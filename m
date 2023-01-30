Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FD681B80
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:28:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafb-0007nW-7Z; Mon, 30 Jan 2023 15:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMae0-00058H-Oq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadz-0007Ma-2k
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GHFRXYwA21eo24z+E3B/zrLrvMQuWtK2WvOqY5eAuAQ=;
 b=gZOEKgeH0gq1i8Cyv0tyWEooYOSgZXgdPu/Nq1j0uvCbIAyICbXEZguiSDuWYu5yKjcTDd
 rRc7mGq1ziauAdc6MGc9kIXNm0jp56Wn7hXt/qbSoKXHyG73osb50DiaLNSOO5KAjMZ/fk
 euSrZVWjhw1EGPXl91iuwR2JyVt6yOQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-035nY9zJNA-vOjByX0xFqw-1; Mon, 30 Jan 2023 15:20:44 -0500
X-MC-Unique: 035nY9zJNA-vOjByX0xFqw-1
Received: by mail-ej1-f72.google.com with SMTP id
 ds1-20020a170907724100b008775bfcef62so8064295ejc.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHFRXYwA21eo24z+E3B/zrLrvMQuWtK2WvOqY5eAuAQ=;
 b=25fwlDkT7m4XVWAIkvtXBpa17VW9mN0ia4tij5Uk3RE41ceDEWgX1FhkxxwRgEzLLL
 tn6B4dDJ/hapvsvbTVrEVTPa+mvzki7TOLX37SB4ixHIvZT8hpC+QdOnqrwIZmHCNlcO
 1VEUsUrM3wRFu58CO+cKsPJ8v9ChiMynecni1yO4ir/tJUnJrM/TkpjMDhDAxgrx+WAM
 hAs3xJ+KmJi5SKgRYcOGqxgthEEPe7bjyu4x5ZI30E8FSGJEyrsLQ/+nUZaeIrNpy3LG
 HBKBfk9lqMLtra+IrF+8kdUVFmV9kXEOTx1u3QxXL99HChlL83fdoO95DDuGfu8VK3JZ
 ErXQ==
X-Gm-Message-State: AFqh2kpQcNCUvEGRrXoO/MOiglJdOJf2Zzy3VFGWxVlaLUsd3rQPom78
 nmiWab8QPODl2ydiQcRBAdy8Q+qUOjIE1fHVCIZ8zJf1VuK7KIMI8kZlY2N5FsngarXxYFXxos4
 YzMWS+LVKg5xPXt+gudo5yiChkyBgc3Bwhxxae0CI13C2w6OpeTy8dyOwmPFC
X-Received: by 2002:a17:907:29c4:b0:857:b916:94bd with SMTP id
 ev4-20020a17090729c400b00857b91694bdmr43202301ejc.60.1675110043454; 
 Mon, 30 Jan 2023 12:20:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYBimtcPhz2U5+G2vI6oV3xIjTjZpCsCTbSrsGCzWwW1hBoasNd9WrKWxhfaahEp0w1gOmgw==
X-Received: by 2002:a17:907:29c4:b0:857:b916:94bd with SMTP id
 ev4-20020a17090729c400b00857b91694bdmr43202289ejc.60.1675110043224; 
 Mon, 30 Jan 2023 12:20:43 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 v5-20020a1709061dc500b0088a694749f7sm1140549ejh.4.2023.01.30.12.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:42 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 35/56] tests: acpi: add endpoint devices to bridges
Message-ID: <20230130201810.11518-36-mst@redhat.com>
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

to make sure that they are enumerated or ignored as expected

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-26-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 37 ++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a8c17461c8..22b22c403d 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -875,7 +875,9 @@ static void test_acpi_piix4_tcg_bridge(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_vm_prepare("-S"
         " -device pci-bridge,chassis_nr=1"
-        " -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2", &data);
+        " -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2"
+        " -device pci-testdev,bus=pci.0,addr=5.0"
+        " -device pci-testdev,bus=pci.1", &data);
 
     /* hotplugged bridges section */
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr",
@@ -884,6 +886,10 @@ static void test_acpi_piix4_tcg_bridge(void)
         "{'bus': 'pci.1', 'addr': '0xf.1', 'chassis_nr': 4 }");
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbrhost",
         "{'bus': 'pci.0', 'addr': '4.0', 'chassis_nr': 5 }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "d1", "{'bus': 'pci.0' }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "d2", "{'bus': 'pci.1' }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "d3", "{'bus': 'hpbr', "
+                                   "'addr': '1.0' }");
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
@@ -907,7 +913,9 @@ static void test_acpi_piix4_no_root_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
                   "-device pci-bridge,chassis_nr=1 "
-                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 "
+                  "-device pci-testdev,bus=pci.0 "
+                  "-device pci-testdev,bus=pci.1", &data);
     free_test_data(&data);
 }
 
@@ -922,7 +930,9 @@ static void test_acpi_piix4_no_bridge_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
                   "-device pci-bridge,chassis_nr=1 "
-                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 "
+                  "-device pci-testdev,bus=pci.0 "
+                  "-device pci-testdev,bus=pci.1,addr=2.0", &data);
     free_test_data(&data);
 }
 
@@ -937,7 +947,9 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
                   "-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
-                  "-device pci-bridge,chassis_nr=1", &data);
+                  "-device pci-bridge,chassis_nr=1 "
+                  "-device pci-testdev,bus=pci.0 "
+                  "-device pci-testdev,bus=pci.1", &data);
     free_test_data(&data);
 }
 
@@ -982,7 +994,9 @@ static void test_acpi_q35_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1", &data);
+    test_acpi_one("-device pci-bridge,chassis_nr=1,id=br1"
+                  " -device pci-testdev,bus=pcie.0"
+                  " -device pci-testdev,bus=br1", &data);
     free_test_data(&data);
 }
 
@@ -1001,8 +1015,11 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pci-bridge,bus=rp2,chassis_nr=4,id=br1"
         " -device pcie-root-port,id=rphptgt1,port=0x0,chassis=5,addr=2.1"
         " -device pcie-root-port,id=rphptgt2,port=0x0,chassis=6,addr=2.2"
-        " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3",
-        &data);
+        " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3"
+        " -device pci-testdev,bus=pcie.0,addr=2.4"
+        " -device pci-testdev,bus=pcie.0,addr=5.0"
+        " -device pci-testdev,bus=rp0,addr=0.0"
+        " -device pci-testdev,bus=br1", &data);
 
     /* hotplugged bridges section */
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr1",
@@ -1010,7 +1027,11 @@ static void test_acpi_q35_multif_bridge(void)
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr2-multiif",
         "{ 'bus': 'br1', 'addr': '2.2', 'chassis_nr': 129 }");
     qtest_qmp_device_add(data.qts, "pcie-pci-bridge", "hpbr3",
-        "{'bus': 'rp0', 'addr': '0.0' }");
+        "{'bus': 'rphptgt1', 'addr': '0.0' }");
+    qtest_qmp_device_add(data.qts, "pcie-root-port", "hprp",
+        "{'bus': 'rphptgt2', 'addr': '0.0' }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "hpnic",
+        "{'bus': 'rphptgt3', 'addr': '0.0' }");
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
-- 
MST


