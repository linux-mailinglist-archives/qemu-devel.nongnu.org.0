Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B555AB7CD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:54:04 +0200 (CEST)
Received: from localhost ([::1]:42016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUArj-0004AX-2f
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZS-00064M-U9
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZQ-0007PG-0b
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKw1lpPmOlCevZorhhPgkKGM3YQ8jWHGdINeSk7DJkU=;
 b=DKuB85xehrXPkkOUUxyVvjyRDConlkFbvA36MBHY+r2f2wixZgD/wnvLwpdBbx9EQU7mN3
 l0sKClzF8gERqSBEjp/b3lyO1PLKImrDi2fGrpo7aKMN3/u6D2bsqX9NBP9i8jSYL2+eto
 NZCup5zp64qP2dk/0ZQ8kSF+KpD/MvA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-FrErM9nDPrybM0HfakzR-g-1; Fri, 02 Sep 2022 13:35:04 -0400
X-MC-Unique: FrErM9nDPrybM0HfakzR-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23A7638149A8;
 Fri,  2 Sep 2022 17:35:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 404BBC15BB3;
 Fri,  2 Sep 2022 17:35:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 3/8] bios-tables-test: Only run test for machine types
 compiled in
Date: Fri,  2 Sep 2022 19:34:47 +0200
Message-Id: <20220902173452.1904-4-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-1-quintela@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/bios-tables-test.c | 145 ++++++++++++++++++---------------
 1 file changed, 78 insertions(+), 67 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 757db2bc40..bc216cac95 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1766,82 +1766,93 @@ int main(int argc, char *argv[])
         if (ret) {
             return ret;
         }
-        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
-        qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
-        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
-        qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
-                       test_acpi_piix4_no_root_hotplug);
-        qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
-                       test_acpi_piix4_no_bridge_hotplug);
-        qtest_add_func("acpi/piix4/pci-hotplug/off",
-                       test_acpi_piix4_no_acpi_pci_hotplug);
-        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
-        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
-        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
-        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
-        qtest_add_func("acpi/piix4/smm-compat",
-                       test_acpi_piix4_tcg_smm_compat);
-        qtest_add_func("acpi/piix4/smm-compat-nosmm",
-                       test_acpi_piix4_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
-        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
-        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
+        if (qtest_has_machine(MACHINE_PC)) {
+            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
+            qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
+            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+            qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
+                           test_acpi_piix4_no_root_hotplug);
+            qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
+                           test_acpi_piix4_no_bridge_hotplug);
+            qtest_add_func("acpi/piix4/pci-hotplug/off",
+                           test_acpi_piix4_no_acpi_pci_hotplug);
+            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
+            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
+            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
+            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
+            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
+            qtest_add_func("acpi/piix4/smm-compat",
+                           test_acpi_piix4_tcg_smm_compat);
+            qtest_add_func("acpi/piix4/smm-compat-nosmm",
+                           test_acpi_piix4_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
+            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
+            qtest_add_func("acpi/piix4/acpihmat",
+                           test_acpi_piix4_tcg_acpi_hmat);
 #ifdef CONFIG_POSIX
-        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
+            qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
 #endif
-
-        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
-        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
-            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
-            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
         }
-        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
-        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
-        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
-        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
-        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
-        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
-        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
-        qtest_add_func("acpi/q35/smm-compat",
-                       test_acpi_q35_tcg_smm_compat);
-        qtest_add_func("acpi/q35/smm-compat-nosmm",
-                       test_acpi_q35_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
-        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        if (qtest_has_machine(MACHINE_Q35)) {
+            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+            qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
+            if (tpm_model_is_available("-machine q35", "tpm-tis")) {
+                qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
+                qtest_add_func("acpi/q35/tpm12-tis",
+                               test_acpi_q35_tcg_tpm12_tis);
+            }
+            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+            qtest_add_func("acpi/q35/multif-bridge",
+                           test_acpi_q35_multif_bridge);
+            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
+            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
+            qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
+            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
+            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
+            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
+            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
+            qtest_add_func("acpi/q35/smm-compat",
+                           test_acpi_q35_tcg_smm_compat);
+            qtest_add_func("acpi/q35/smm-compat-nosmm",
+                           test_acpi_q35_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
+            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
+            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
 #ifdef CONFIG_POSIX
-        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
+            qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
 #endif
-        qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
-        qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
-        if (has_tcg) {
-            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
-        }
-        if (has_kvm) {
-            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
-            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
-        }
-        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+            qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
+            qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
+            if (has_tcg) {
+                qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
+            }
+            if (has_kvm) {
+                qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
+                qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
+            }
+            qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
 #ifdef CONFIG_POSIX
-        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
+            qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
 #endif
-        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
-
-        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
-        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
-        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
-        qtest_add_func("acpi/microvm/oem-fields", test_acpi_microvm_oem_fields);
-        if (has_tcg) {
-            if (strcmp(arch, "x86_64") == 0) {
-                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
+        }
+        if (qtest_has_machine("microvm")) {
+            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
+            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
+            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
+            qtest_add_func("acpi/microvm/ioapic2",
+                           test_acpi_microvm_ioapic2_tcg);
+            qtest_add_func("acpi/microvm/oem-fields",
+                           test_acpi_microvm_oem_fields);
+            if (has_tcg) {
+                if (strcmp(arch, "x86_64") == 0) {
+                    qtest_add_func("acpi/microvm/pcie",
+                                   test_acpi_microvm_pcie_tcg);
 #ifdef CONFIG_POSIX
-                qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_acpi_erst);
+                    qtest_add_func("acpi/microvm/acpierst",
+                                   test_acpi_microvm_acpi_erst);
 #endif
+                }
             }
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-- 
2.37.2


