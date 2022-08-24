Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1364C59F70B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:03:05 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnE0-000841-4X
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu0-0003Gk-TW
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:24 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtz-0001Ys-3P
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:24 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 2so15220372pll.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=egPBjLFOzH2BItTwAJOAYvxF5nntobkrM7llqKrjcSw=;
 b=qsjs9EA6ub7htysYKqy/NANvhT3OwOgQ59U4XURNx2QZzpERT8m5LN+HWxWMDU3H/F
 RVoi3EI/eZsgq5SGtHg4m4AtzB8aEggXXg6weuhAths1lF47Lm6ax/Mq3ywWEG7asgXg
 +BC7hccB26Uwwqv6f5SM8cxFqyHahDiLsQhMnzI3PgLw8K7qq9/xOnmp56sr3QCtoME8
 OwA2jL5FvceL2XzQD2Eb0vKUwOvem0LTJyQDHkl1XzOMJE9f29tHugyS6emiN/n1CQ53
 XTPxYjr42aK/3/DwJlDw1vcfaolTyILgJN1R3S1n/ZA3+/Sq61Qou2lL0KhfwRZIKPmp
 O7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=egPBjLFOzH2BItTwAJOAYvxF5nntobkrM7llqKrjcSw=;
 b=g7Iseaq5/aujHfUhX9qEQMXUbMznYDZ+upmBpFTFVe25MKLuKHxC1TO2o8aMQ/Cji+
 t1xgo831Oqum04LvahlUeLHk29PAPfwcIMnj9y9eB+KQBd+xqgDcJMcyh+8xjDOQtL97
 IgpEcDZyw77PNHwQmnjjtGbiTyJXqxCxSM5wPB8DAatVw4WkEqf7XDaouP2OubALRCM8
 HYgqeb6Khv92z2z5Zr1H32Kv5daQvC/+EfARm71zRkji83Y2gCWVjH7D6P8/L0U8VAoF
 ktI719nsyQbd2wdiiXrloCVKFfcR9jiJdQfp+zm7OA663qYzFcMjMulYAzHfEf6ImOy7
 WKqA==
X-Gm-Message-State: ACgBeo3txPtTA4CTux673hcxOC3E2QGSXibl07M9WJdUarjQL+l1bPKo
 mdG1o72lPWzEfni1MfMl3qCuSA8Dx/o=
X-Google-Smtp-Source: AA6agR6z5b2+kRc4XbBwlBXAV222dfFFZjXEltEwrHIgx29Wa2A3eKmmZIax1+OleQzltVijzWRYTw==
X-Received: by 2002:a17:90b:3b8a:b0:1f5:1df2:1fff with SMTP id
 pc10-20020a17090b3b8a00b001f51df21fffmr7554690pjb.169.1661334141453; 
 Wed, 24 Aug 2022 02:42:21 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 18/51] tests/qtest: Build cases that use memory-backend-file
 for posix only
Date: Wed, 24 Aug 2022 17:39:56 +0800
Message-Id: <20220824094029.1634519-19-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

As backends/meson.build tells us, hostmem-file.c is only supported on
POSIX platforms, hence any test case that utilizes the memory backend
file should be guarded by CONFIG_POSIX too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
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
index b3733cdb5f..4b4e7e5088 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -89,6 +89,7 @@ static void cxl_2root_port(void)
     qtest_end();
 }
 
+#ifdef CONFIG_POSIX
 static void cxl_t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
@@ -136,6 +137,7 @@ static void cxl_2pxb_4rp_4t3d(void)
     qtest_start(cmdline->str);
     qtest_end();
 }
+#endif /* CONFIG_POSIX */
 
 int main(int argc, char **argv)
 {
@@ -147,8 +149,10 @@ int main(int argc, char **argv)
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
index 72bb9e21f3..9e484e60ba 100644
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
2.34.1


