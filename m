Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D985A6CAA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:01:03 +0200 (CEST)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6Tu-0002a2-Aa
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AB-0007Pv-94
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A7-00056i-IU
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=womE81JXopfMM1IwN2KuEbhe3dH+xAZa5F0wbxuLioI=;
 b=eNEa2TDoWkU2LqbtrjUe7nxlKPIVJTfqWO1nNgIXJPMMGJdvz1QMlHc9Zqzs6LekYPf2Ur
 gPVGvCgUM3EWhOLTMIvkMm4jxYNqQMQsEJaSt81xgmm7Ybiyg7pSsnG1I8aLi3MMwkCjlg
 up9U4EpYvhCayG6wAHCCiNyBU4eFQHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-fzgKrfDwOOS7cYIHp9SexQ-1; Tue, 30 Aug 2022 14:40:29 -0400
X-MC-Unique: fzgKrfDwOOS7cYIHp9SexQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0B2580418F;
 Tue, 30 Aug 2022 18:40:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B24E01415117;
 Tue, 30 Aug 2022 18:40:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 08/23] tests/qtest: Build cases that use memory-backend-file
 for posix only
Date: Tue, 30 Aug 2022 20:39:57 +0200
Message-Id: <20220830184012.77978-9-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Bin Meng <bin.meng@windriver.com>

As backends/meson.build tells us, hostmem-file.c is only supported on
POSIX platforms, hence any test case that utilizes the memory backend
file should be guarded by CONFIG_POSIX too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-19-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 10 ++++++++++
 tests/qtest/cxl-test.c         |  4 ++++
 tests/qtest/meson.build        |  3 ++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7c5f736b51..36783966b0 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1461,6 +1461,7 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+#ifdef CONFIG_POSIX
 static void test_acpi_erst(const char *machine)
 {
     gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
@@ -1511,6 +1512,7 @@ static void test_acpi_microvm_acpi_erst(void)
     g_free(tmp_path);
     free_test_data(&data);
 }
+#endif /* CONFIG_POSIX */
 
 static void test_acpi_virt_tcg(void)
 {
@@ -1551,6 +1553,7 @@ static void test_acpi_q35_viot(void)
     free_test_data(&data);
 }
 
+#ifdef CONFIG_POSIX
 static void test_acpi_q35_cxl(void)
 {
     gchar *tmp_path = g_dir_make_tmp("qemu-test-cxl.XXXXXX", NULL);
@@ -1593,6 +1596,7 @@ static void test_acpi_q35_cxl(void)
     g_free(tmp_path);
     free_test_data(&data);
 }
+#endif /* CONFIG_POSIX */
 
 static void test_acpi_virt_viot(void)
 {
@@ -1805,8 +1809,10 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+#ifdef CONFIG_POSIX
         qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
         qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
+#endif
         qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
         qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
@@ -1818,7 +1824,9 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
             if (strcmp(arch, "x86_64") == 0) {
                 qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+#ifdef CONFIG_POSIX
                 qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_acpi_erst);
+#endif
             }
         }
         if (has_kvm) {
@@ -1826,7 +1834,9 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
         qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+#ifdef CONFIG_POSIX
         qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
+#endif
         qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 4e6d285061..2e14da7dee 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -89,6 +89,7 @@ static void cxl_2root_port(void)
     qtest_end();
 }
 
+#ifdef CONFIG_POSIX
 static void cxl_t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
@@ -133,6 +134,7 @@ static void cxl_2pxb_4rp_4t3d(void)
     qtest_start(cmdline->str);
     qtest_end();
 }
+#endif /* CONFIG_POSIX */
 
 int main(int argc, char **argv)
 {
@@ -144,8 +146,10 @@ int main(int argc, char **argv)
     qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
     qtest_add_func("/pci/cxl/rp", cxl_root_port);
     qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
+#ifdef CONFIG_POSIX
     qtest_add_func("/pci/cxl/type3_device", cxl_t3d);
     qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
     qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4", cxl_2pxb_4rp_4t3d);
+#endif
     return g_test_run();
 }
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 9d0f82bf1c..e910cb32ca 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -71,7 +71,8 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) +                   \
   (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
-  (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
+  (config_host.has_key('CONFIG_POSIX') and                                                  \
+   config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                   \
   (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
-- 
2.31.1


