Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ACD5BEE5A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:19:08 +0200 (CEST)
Received: from localhost ([::1]:40904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajhz-00045J-I7
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHt-0007lY-Am
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHl-0001Pw-Oq
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663688144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ai8H9jrFJGa5WuQ81u0anK9jjsk3bb7CRCt2yy+WLXk=;
 b=dcRWQRCE5StPBfmZZ3liMUGxtvghZs5OVPeuuAeZUn1J5C24mP1KrMvFzapHr56eOwFEP7
 V8h0ZbPLXLd8ssQhcnZ6HFYdDLSG1RChXD+h/LvnU/m24J0SXiPGkP7stOq5773NbbVcpo
 KoU+fAh42q8IuhCaAj4iMoFSL1l7VvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-paenjVB7McG8Yt10hwMYYw-1; Tue, 20 Sep 2022 11:35:33 -0400
X-MC-Unique: paenjVB7McG8Yt10hwMYYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC8FB88F472;
 Tue, 20 Sep 2022 15:35:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9B97492B04;
 Tue, 20 Sep 2022 15:35:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 10/15] bios-tables-test: Only run test for machine types
 compiled in
Date: Tue, 20 Sep 2022 17:35:07 +0200
Message-Id: <20220920153512.187283-11-thuth@redhat.com>
In-Reply-To: <20220920153512.187283-1-thuth@redhat.com>
References: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220902173452.1904-4-quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 145 ++++++++++++++++++---------------
 1 file changed, 78 insertions(+), 67 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 21d9d77dd4..46a46fe0aa 100644
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
2.31.1


