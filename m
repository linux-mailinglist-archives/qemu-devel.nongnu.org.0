Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAB15AB7BB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:46:13 +0200 (CEST)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUAk3-0006eG-HB
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZR-00063A-2a
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZP-0007Or-BQ
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbjtPo/xyC9prLBoKjq9RpH2MHSAx76NbYPXCuH+nAA=;
 b=Og5072ooLLFh9/xAWMMcdgbvvWbevEFWKWU+8RfJgrjCqYeODji7//A+qTJ84qCfdaqldb
 4i2KVIf0Zmxje1xEeqpkKdgTTAoL/6C4EGXzmuOtygI0MKoplrhRBzqhN15JNCZjFq0E6/
 EAtTjaBSRJOlg26JIHquxrK86ifS8NY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-LVCmaZfRP2y_Ssy_Zt2Auw-1; Fri, 02 Sep 2022 13:35:01 -0400
X-MC-Unique: LVCmaZfRP2y_Ssy_Zt2Auw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAAB885A589;
 Fri,  2 Sep 2022 17:35:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9528EC15BB3;
 Fri,  2 Sep 2022 17:34:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 2/8] bios-tables-test: Sort all x86_64 tests by machine type
Date: Fri,  2 Sep 2022 19:34:46 +0200
Message-Id: <20220902173452.1904-3-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-1-quintela@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

No code change here, just move test around.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/bios-tables-test.c | 60 +++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 1e808b0864..757db2bc40 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1766,11 +1766,6 @@ int main(int argc, char *argv[])
         if (ret) {
             return ret;
         }
-        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
-        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
-            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
-            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
-        }
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
         qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
@@ -1780,48 +1775,68 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_no_bridge_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/off",
                        test_acpi_piix4_no_acpi_pci_hotplug);
-        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
-        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
-        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
-        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
         qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
-        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
         qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
         qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
-        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
         qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
         qtest_add_func("acpi/piix4/smm-compat",
                        test_acpi_piix4_tcg_smm_compat);
         qtest_add_func("acpi/piix4/smm-compat-nosmm",
                        test_acpi_piix4_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
+        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
+        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
+#ifdef CONFIG_POSIX
+        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
+#endif
+
+        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
+        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
+            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
+            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
+        }
+        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
+        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
+        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
+        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
+        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
+        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
+        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
         qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
         qtest_add_func("acpi/q35/smm-compat",
                        test_acpi_q35_tcg_smm_compat);
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
-        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
 #ifdef CONFIG_POSIX
-        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
         qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
 #endif
         qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
         qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
+        if (has_tcg) {
+            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
+        }
+        if (has_kvm) {
+            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
+            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
+        }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+#ifdef CONFIG_POSIX
+        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
+#endif
+        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
+
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_microvm_oem_fields);
         if (has_tcg) {
-            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
             if (strcmp(arch, "x86_64") == 0) {
                 qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
 #ifdef CONFIG_POSIX
@@ -1829,15 +1844,6 @@ int main(int argc, char *argv[])
 #endif
             }
         }
-        if (has_kvm) {
-            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
-            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
-        }
-        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
-#ifdef CONFIG_POSIX
-        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
-#endif
-        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
2.37.2


