Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393275BEDF8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:43:33 +0200 (CEST)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaj9X-0001y3-TF
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHf-0007ex-9A
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHZ-0001O7-OC
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663688133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtfPa67NmTQgeAhSkmjN4Ka56fipN29VmTDaSN6BlSQ=;
 b=iXS/OTOpWyXLxeV/3jCX6pqx6Pwekbi+ssCRKOUc6RaMaH3qxKiDPC0ytq/CreTDl+tocD
 XGt4+LfaRrlH/tVVZyjV3w8ejvLVWM9BufG1WgnI+ZiMoCMZ0CFx/DqeOShfRR9UmX5o44
 H/zPGW8azFy2+Yj+Lu178EOqNzeB0Lw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-JLSMqI0-O3KlDboGlXqTlg-1; Tue, 20 Sep 2022 11:35:30 -0400
X-MC-Unique: JLSMqI0-O3KlDboGlXqTlg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 858CF87AA1E;
 Tue, 20 Sep 2022 15:35:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56AEC492B04;
 Tue, 20 Sep 2022 15:35:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/15] bios-tables-test: Make oem-fields tests be consistent
Date: Tue, 20 Sep 2022 17:35:05 +0200
Message-Id: <20220920153512.187283-9-thuth@redhat.com>
In-Reply-To: <20220920153512.187283-1-thuth@redhat.com>
References: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Every other test function is named:

	test_acpi_<machine>_<test>()

Just make this test the same.  Once there, rename "acpi/oem-fields" to
"acpi/piix4/oem-fields" so it is consistent with everything else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220902173452.1904-2-quintela@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 36783966b0..a62f8f9c08 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1671,7 +1671,7 @@ static void test_oem_fields(test_data *data)
     }
 }
 
-static void test_acpi_oem_fields_pc(void)
+static void test_acpi_piix4_oem_fields(void)
 {
     test_data data;
     char *args;
@@ -1691,7 +1691,7 @@ static void test_acpi_oem_fields_pc(void)
     g_free(args);
 }
 
-static void test_acpi_oem_fields_q35(void)
+static void test_acpi_q35_oem_fields(void)
 {
     test_data data;
     char *args;
@@ -1711,7 +1711,7 @@ static void test_acpi_oem_fields_q35(void)
     g_free(args);
 }
 
-static void test_acpi_oem_fields_microvm(void)
+static void test_acpi_microvm_oem_fields(void)
 {
     test_data data;
     char *args;
@@ -1728,7 +1728,7 @@ static void test_acpi_oem_fields_microvm(void)
     g_free(args);
 }
 
-static void test_acpi_oem_fields_virt(void)
+static void test_acpi_virt_oem_fields(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1766,13 +1766,13 @@ int main(int argc, char *argv[])
         if (ret) {
             return ret;
         }
-        qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
+        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
         if (tpm_model_is_available("-machine q35", "tpm-tis")) {
             qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
             qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
         }
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
-        qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
+        qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
         qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
         qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
                        test_acpi_piix4_no_root_hotplug);
@@ -1819,7 +1819,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
-        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
+        qtest_add_func("acpi/microvm/oem-fields", test_acpi_microvm_oem_fields);
         if (has_tcg) {
             qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
             if (strcmp(arch, "x86_64") == 0) {
@@ -1844,7 +1844,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-            qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+            qtest_add_func("acpi/virt/oem-fields", test_acpi_virt_oem_fields);
             qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
         }
     }
-- 
2.31.1


