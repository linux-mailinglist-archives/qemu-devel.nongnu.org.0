Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1FB3B407D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:28:34 +0200 (CEST)
Received: from localhost ([::1]:42716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwi8X-0005xD-QV
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzP-0002QF-Kp
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzI-0006k8-TH
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWHwF/qeaFUvk/BrxUhFvyxta5Ru95+xXxSxRUVuqUs=;
 b=b4zYe97nw0HAtfgLa+MXNI6swkIAs1GZ+ubHG1cwVv6I+wZ9yWerhB8I5MTXY7QhtxqG/u
 VpTI9So0/rvkUUmjK4uDRAl6Y8tdAoukYlfBZt1VaWR+IHoKCPzZfyB3gKQLfl8zJH11TH
 uszsfBT5jxa0PFbFxaG2xOVoiV9Nb74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-e82UAlBrMnmXjuFkN71LmA-1; Fri, 25 Jun 2021 05:18:58 -0400
X-MC-Unique: e82UAlBrMnmXjuFkN71LmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67858189CD1D;
 Fri, 25 Jun 2021 09:18:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4979D60C05;
 Fri, 25 Jun 2021 09:18:56 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/53] tests: bios-tables-test: use qtest_has_accel() API to
 register TCG only tests
Date: Fri, 25 Jun 2021 05:17:43 -0400
Message-Id: <20210625091818.1047980-20-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, thuth@redhat.com, f4bug@amsat.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 .. only if TCG is available

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: thuth@redhat.com
CC: lvivier@redhat.com
CC: f4bug@amsat.org
---
 tests/qtest/bios-tables-test.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ebe8ec0850..550450c5c3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -722,13 +722,6 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
-
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
     test_acpi_load_tables(data, use_uefi);
@@ -1546,6 +1539,7 @@ int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_tcg = qtest_has_accel("tcg");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1588,7 +1582,6 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
@@ -1598,19 +1591,24 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+        if (has_tcg) {
+            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
+            if (strcmp(arch, "x86_64") == 0) {
+                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            }
         }
         if (has_kvm) {
             qtest_add_func("acpi/q35/numamem", test_acpi_q35_kvm_numamem);
             qtest_add_func("acpi/q35/dmar", test_acpi_q35_tcg_dmar);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        if (has_tcg) {
+            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+            qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        }
         if (has_kvm) {
             qtest_add_func("acpi/virt/iort", test_acpi_virt_iort);
         }
-- 
2.27.0


