Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BB39BC68
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:59:25 +0200 (CEST)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCEE-0007hj-HB
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8a-0002ra-7T
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8W-000059-Rx
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id a11so7916918wrt.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JaXO37oL0Bjgy5CbV3aQwdfffelPx4CsfMkOQJk0Amo=;
 b=j4ekZwoUGqBxQbvgqsImdYhFqO9F2t+t9MeU/p4DulzCN29f/7iTIdZ6Dtk3+53YDQ
 UuNXOR/620M6TY/RT9YC9nA0DpE89f4m6gYrhWn9qOZ6laSLAgLrbhubRms0w6EtSksn
 yN0eFWo2Eu19sJq/9xA7Q7IX9j5NpmvNEVa6AHLHlUnU1Mo4OeOQ+E2OsYc690bHEcSo
 MOt62W3EWPURM3PvxcXIzUnr61C7hORKFLNe0OlkiL0Q9hMIwfDQFp/tK0oun7W6LnEU
 SehXadRlI0n8plmH8vsc9eLE8JrFJVYmL27sm2rl3a2gk8v8NRTYPByLPq7TyL8g+am1
 88+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JaXO37oL0Bjgy5CbV3aQwdfffelPx4CsfMkOQJk0Amo=;
 b=QvRn5+YImo/T/JuZNQVPXiWje795aFu0z93Qi4WfSexJbUTxgrPwCKUDAsdn7C7ImU
 oetbB3uqf9N7FFoRSG2Bhaw4JyonE2JRA9yHjDsS3FYHnDFuS1m0W50pcaXleh0slN4X
 H14xjWHqpr4m1Y7TnbBS7vLyTnLjuQ0iiUfGjPe7k7OWaZMKSOq4xm/LNgJmjYgbu13x
 uHpHhc5NSMp24xCCbvdx0o6RuSgPgcSYm2I/68klZqLg13Tvg7RhG6UMpvAq9hh1UstD
 aqY8cjCs43ijZ0FCoYWtenW5Rd2Gil0F81xdqtDJ/SRuS32OhSojUTz9hT2fEL4I+LSV
 i9Jw==
X-Gm-Message-State: AOAM532E16uDMPi/15R3GLfxvCB99JZmNZPVwUFGstb5vPcruN9o5LsB
 BiiN4AVWxljqhXvl0OWy2tYkkQ==
X-Google-Smtp-Source: ABdhPJz3NIGDMQ09nL9ULOvAhC+N08rdZOk/+ZPlrQkXqPzOSa7LBpLaFOBcoRDVVz7PfS/QurNz/w==
X-Received: by 2002:a5d:6e0d:: with SMTP id h13mr4720422wrz.118.1622822007261; 
 Fri, 04 Jun 2021 08:53:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm7478013wre.67.2021.06.04.08.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 337C71FF98;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 09/99] qtest/bios-tables-test: Rename tests not TCG
 specific
Date: Fri,  4 Jun 2021 16:51:42 +0100
Message-Id: <20210604155312.15902-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Various tests don't require TCG, but have '_tcg' in their name.
As this is misleading, remove 'tcg' from their name.

Reported-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-10-philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 142 ++++++++++++++++-----------------
 1 file changed, 71 insertions(+), 71 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 156d4174aa..ce498b3ff4 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -753,7 +753,7 @@ static uint8_t base_required_struct_types[] = {
     0, 1, 3, 4, 16, 17, 19, 32, 127
 };
 
-static void test_acpi_piix4_tcg(void)
+static void test_acpi_piix4(void)
 {
     test_data data;
 
@@ -768,7 +768,7 @@ static void test_acpi_piix4_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_bridge(void)
+static void test_acpi_piix4_bridge(void)
 {
     test_data data;
 
@@ -824,7 +824,7 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg(void)
+static void test_acpi_q35(void)
 {
     test_data data;
 
@@ -841,7 +841,7 @@ static void test_acpi_q35_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_bridge(void)
+static void test_acpi_q35_bridge(void)
 {
     test_data data;
 
@@ -855,7 +855,7 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_mmio64(void)
+static void test_acpi_q35_mmio64(void)
 {
     test_data data = {
         .machine = MACHINE_Q35,
@@ -872,7 +872,7 @@ static void test_acpi_q35_tcg_mmio64(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_cphp(void)
+static void test_acpi_piix4_cphp(void)
 {
     test_data data;
 
@@ -888,7 +888,7 @@ static void test_acpi_piix4_tcg_cphp(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_cphp(void)
+static void test_acpi_q35_cphp(void)
 {
     test_data data;
 
@@ -908,7 +908,7 @@ static uint8_t ipmi_required_struct_types[] = {
     0, 1, 3, 4, 16, 17, 19, 32, 38, 127
 };
 
-static void test_acpi_q35_tcg_ipmi(void)
+static void test_acpi_q35_ipmi(void)
 {
     test_data data;
 
@@ -923,7 +923,7 @@ static void test_acpi_q35_tcg_ipmi(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_ipmi(void)
+static void test_acpi_piix4_ipmi(void)
 {
     test_data data;
 
@@ -941,7 +941,7 @@ static void test_acpi_piix4_tcg_ipmi(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_memhp(void)
+static void test_acpi_q35_memhp(void)
 {
     test_data data;
 
@@ -957,7 +957,7 @@ static void test_acpi_q35_tcg_memhp(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_memhp(void)
+static void test_acpi_piix4_memhp(void)
 {
     test_data data;
 
@@ -973,7 +973,7 @@ static void test_acpi_piix4_tcg_memhp(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_nosmm(void)
+static void test_acpi_piix4_nosmm(void)
 {
     test_data data;
 
@@ -984,7 +984,7 @@ static void test_acpi_piix4_tcg_nosmm(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_smm_compat(void)
+static void test_acpi_piix4_smm_compat(void)
 {
     test_data data;
 
@@ -995,7 +995,7 @@ static void test_acpi_piix4_tcg_smm_compat(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
+static void test_acpi_piix4_smm_compat_nosmm(void)
 {
     test_data data;
 
@@ -1006,7 +1006,7 @@ static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_nohpet(void)
+static void test_acpi_piix4_nohpet(void)
 {
     test_data data;
 
@@ -1017,7 +1017,7 @@ static void test_acpi_piix4_tcg_nohpet(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_numamem(void)
+static void test_acpi_q35_numamem(void)
 {
     test_data data;
 
@@ -1029,7 +1029,7 @@ static void test_acpi_q35_tcg_numamem(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_nosmm(void)
+static void test_acpi_q35_nosmm(void)
 {
     test_data data;
 
@@ -1040,7 +1040,7 @@ static void test_acpi_q35_tcg_nosmm(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_smm_compat(void)
+static void test_acpi_q35_smm_compat(void)
 {
     test_data data;
 
@@ -1051,7 +1051,7 @@ static void test_acpi_q35_tcg_smm_compat(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_smm_compat_nosmm(void)
+static void test_acpi_q35_smm_compat_nosmm(void)
 {
     test_data data;
 
@@ -1062,7 +1062,7 @@ static void test_acpi_q35_tcg_smm_compat_nosmm(void)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_nohpet(void)
+static void test_acpi_q35_nohpet(void)
 {
     test_data data;
 
@@ -1073,7 +1073,7 @@ static void test_acpi_q35_tcg_nohpet(void)
     free_test_data(&data);
 }
 
-static void test_acpi_piix4_tcg_numamem(void)
+static void test_acpi_piix4_numamem(void)
 {
     test_data data;
 
@@ -1087,11 +1087,11 @@ static void test_acpi_piix4_tcg_numamem(void)
 
 uint64_t tpm_tis_base_addr;
 
-static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
+static void test_acpi_tpm(const char *machine, const char *tpm_if,
                               uint64_t base)
 {
 #ifdef CONFIG_TPM
-    gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
+    gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_%s.XXXXXX",
                                           machine, tpm_if);
     char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
     TestState test;
@@ -1139,12 +1139,12 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
 #endif
 }
 
-static void test_acpi_q35_tcg_tpm_tis(void)
+static void test_acpi_q35_tpm_tis(void)
 {
-    test_acpi_tcg_tpm("q35", "tis", 0xFED40000);
+    test_acpi_tpm("q35", "tis", 0xFED40000);
 }
 
-static void test_acpi_tcg_dimm_pxm(const char *machine)
+static void test_acpi_dimm_pxm(const char *machine)
 {
     test_data data;
 
@@ -1174,14 +1174,14 @@ static void test_acpi_tcg_dimm_pxm(const char *machine)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_dimm_pxm(void)
+static void test_acpi_q35_dimm_pxm(void)
 {
-    test_acpi_tcg_dimm_pxm(MACHINE_Q35);
+    test_acpi_dimm_pxm(MACHINE_Q35);
 }
 
-static void test_acpi_piix4_tcg_dimm_pxm(void)
+static void test_acpi_piix4_dimm_pxm(void)
 {
-    test_acpi_tcg_dimm_pxm(MACHINE_PC);
+    test_acpi_dimm_pxm(MACHINE_PC);
 }
 
 static void test_acpi_virt_tcg_memhp(void)
@@ -1223,7 +1223,7 @@ static void test_acpi_microvm_prepare(test_data *data)
     data->blkdev = "virtio-blk-device";
 }
 
-static void test_acpi_microvm_tcg(void)
+static void test_acpi_microvm(void)
 {
     test_data data;
 
@@ -1233,7 +1233,7 @@ static void test_acpi_microvm_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_microvm_usb_tcg(void)
+static void test_acpi_microvm_usb(void)
 {
     test_data data;
 
@@ -1244,7 +1244,7 @@ static void test_acpi_microvm_usb_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_microvm_rtc_tcg(void)
+static void test_acpi_microvm_rtc(void)
 {
     test_data data;
 
@@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_microvm_pcie_tcg(void)
+static void test_acpi_microvm_pcie(void)
 {
     test_data data;
 
@@ -1267,7 +1267,7 @@ static void test_acpi_microvm_pcie_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_microvm_ioapic2_tcg(void)
+static void test_acpi_microvm_ioapic2(void)
 {
     test_data data;
 
@@ -1332,7 +1332,7 @@ static void test_acpi_virt_tcg_pxb(void)
     free_test_data(&data);
 }
 
-static void test_acpi_tcg_acpi_hmat(const char *machine)
+static void test_acpi_acpi_hmat(const char *machine)
 {
     test_data data;
 
@@ -1364,14 +1364,14 @@ static void test_acpi_tcg_acpi_hmat(const char *machine)
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_acpi_hmat(void)
+static void test_acpi_q35_acpi_hmat(void)
 {
-    test_acpi_tcg_acpi_hmat(MACHINE_Q35);
+    test_acpi_acpi_hmat(MACHINE_Q35);
 }
 
-static void test_acpi_piix4_tcg_acpi_hmat(void)
+static void test_acpi_piix4_acpi_hmat(void)
 {
-    test_acpi_tcg_acpi_hmat(MACHINE_PC);
+    test_acpi_acpi_hmat(MACHINE_PC);
 }
 
 static void test_acpi_virt_tcg(void)
@@ -1512,50 +1512,50 @@ int main(int argc, char *argv[])
             return ret;
         }
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
-        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
-        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
+        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tpm_tis);
+        qtest_add_func("acpi/piix4", test_acpi_piix4);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
-        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_bridge);
         qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
                        test_acpi_piix4_no_root_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
                        test_acpi_piix4_no_bridge_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/off",
                        test_acpi_piix4_no_acpi_pci_hotplug);
-        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
-        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
-        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
-        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
-        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
-        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
-        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
-        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
+        qtest_add_func("acpi/q35", test_acpi_q35);
+        qtest_add_func("acpi/q35/bridge", test_acpi_q35_bridge);
+        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_mmio64);
+        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_ipmi);
+        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_ipmi);
+        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_cphp);
+        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_cphp);
+        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_memhp);
+        qtest_add_func("acpi/q35/memhp", test_acpi_q35_memhp);
+        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_numamem);
+        qtest_add_func("acpi/q35/numamem", test_acpi_q35_numamem);
+        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_nosmm);
         qtest_add_func("acpi/piix4/smm-compat",
-                       test_acpi_piix4_tcg_smm_compat);
+                       test_acpi_piix4_smm_compat);
         qtest_add_func("acpi/piix4/smm-compat-nosmm",
-                       test_acpi_piix4_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
-        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
+                       test_acpi_piix4_smm_compat_nosmm);
+        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_nohpet);
+        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_nosmm);
         qtest_add_func("acpi/q35/smm-compat",
-                       test_acpi_q35_tcg_smm_compat);
+                       test_acpi_q35_smm_compat);
         qtest_add_func("acpi/q35/smm-compat-nosmm",
-                       test_acpi_q35_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
-        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
-        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
-        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
-        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
-        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
+                       test_acpi_q35_smm_compat_nosmm);
+        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_nohpet);
+        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_dimm_pxm);
+        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_dimm_pxm);
+        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_acpi_hmat);
+        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_acpi_hmat);
+        qtest_add_func("acpi/microvm", test_acpi_microvm);
+        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb);
+        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
+        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
2.20.1


