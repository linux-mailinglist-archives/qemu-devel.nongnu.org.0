Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA95667790
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:45:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBS-0002Nl-2O; Thu, 12 Jan 2023 09:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-000277-Nh
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005sV-Uu
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJXz815BdS7g+uY8lVjYJEOlxy0y1KtY4t37lPrhGQ8=;
 b=Ate9Q+/EWtVPz9ZQ2qDhGz93CrsYQ6nEekM2LMVgd998AKvFMAGrhnndhQuDXvEAnVVQPc
 /ZWHh9Q3amkSjZm1DiWzlB1qUzR6D6kwKdMPxlf89DMwpBgoGt5ikGMwUMPlNlQNwcmbb/
 h5NuKHRLrwrQA1DXx1UuhGe4Zwbu1Gc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-WjWj2iiXNqG-n55tOFHr-w-1; Thu, 12 Jan 2023 09:03:18 -0500
X-MC-Unique: WjWj2iiXNqG-n55tOFHr-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 112AA3C38FF2;
 Thu, 12 Jan 2023 14:03:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 803624085723;
 Thu, 12 Jan 2023 14:03:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 04/40] tests: acpi: extend pcihp with nested bridges
Date: Thu, 12 Jan 2023 15:02:36 +0100
Message-Id: <20230112140312.3096331-5-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

add nested bridges/root-ports to pcihp tests, to make sure
follow up patches don't break nested enumeration of bridges
in DSDT.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 08b8aee76b..6a99b10384 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -863,7 +863,8 @@ static void test_acpi_piix4_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1", &data);
+    test_acpi_one("-device pci-bridge,chassis_nr=1 "
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
     free_test_data(&data);
 }
 
@@ -877,7 +878,8 @@ static void test_acpi_piix4_no_root_hotplug(void)
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
-                  "-device pci-bridge,chassis_nr=1", &data);
+                  "-device pci-bridge,chassis_nr=1 "
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
     free_test_data(&data);
 }
 
@@ -891,7 +893,8 @@ static void test_acpi_piix4_no_bridge_hotplug(void)
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
-                  "-device pci-bridge,chassis_nr=1", &data);
+                  "-device pci-bridge,chassis_nr=1 "
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
     free_test_data(&data);
 }
 
@@ -965,8 +968,14 @@ static void test_acpi_q35_multif_bridge(void)
         " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
         " -device pcie-root-port,id=rp0,multifunction=on,"
                   "port=0x0,chassis=1,addr=0x2"
-        " -device pcie-root-port,id=rp1,port=0x1,chassis=2,addr=0x3.0x1",
+        " -device pcie-root-port,id=rp1,port=0x1,chassis=2,addr=0x3.0x1"
+        " -device pcie-root-port,id=rp2,port=0x0,chassis=3,bus=rp1,addr=0.0"
+        " -device pci-bridge,bus=rp2,chassis_nr=4,id=br1"
+        " -device pcie-root-port,id=rphptgt1,port=0x0,chassis=5,addr=2.1"
+        " -device pcie-root-port,id=rphptgt2,port=0x0,chassis=6,addr=2.2"
+        " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3",
         &data);
+
     free_test_data(&data);
 }
 
-- 
2.31.1


