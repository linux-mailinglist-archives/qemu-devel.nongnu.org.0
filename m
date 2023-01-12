Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8003F667733
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBP-0002L4-3o; Thu, 12 Jan 2023 09:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-00027L-R5
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005sf-Uu
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCgnBchHbmuCfitzzKhfB+DjCrVb5oaS27a4Mv6Dsxk=;
 b=KNgYohk4SUSoG6Csrv0bTpgDv2RofYAfhJpmi3cwqf5w+rxYgFhevN1fEJI+lu5SRe2XDg
 Bg2MGxmB791IZ9wRZQwamsA0PwCAkJ+YR7lwVLRU0sf3agZywG9KQlVaDxoKyTCUEC99cX
 fQSLspcF21Q3yNm6OpZyb9RgpMVu2iQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-KTfRKUOdP7-shjQ8pvtrGw-1; Thu, 12 Jan 2023 09:03:21 -0500
X-MC-Unique: KTfRKUOdP7-shjQ8pvtrGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89792889059;
 Thu, 12 Jan 2023 14:03:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0207D4085720;
 Thu, 12 Jan 2023 14:03:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 06/40] tests: acpi: cleanup use_uefi argument usage
Date: Thu, 12 Jan 2023 15:02:38 +0100
Message-Id: <20230112140312.3096331-7-imammedo@redhat.com>
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

'use_uefi' is used for the flag is a part of 'test_data *data'
argument that is passed to the same functions, which
makes use_uefi argument redundant.

Drop it and use 'data::uefi_*' directly, instead.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 35 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 6a99b10384..cb95f687fe 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -748,9 +748,9 @@ static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
     }
 }
 
-static void test_acpi_load_tables(test_data *data, bool use_uefi)
+static void test_acpi_load_tables(test_data *data)
 {
-    if (use_uefi) {
+    if (data->uefi_fl1 && data->uefi_fl2) { /* use UEFI */
         g_assert(data->scan_len);
         data->rsdp_addr = acpi_find_rsdp_address_uefi(data->qts,
             data->ram_start, data->scan_len);
@@ -766,12 +766,11 @@ static void test_acpi_load_tables(test_data *data, bool use_uefi)
     test_acpi_fadt_table(data);
 }
 
-static char *test_acpi_create_args(test_data *data, const char *params,
-                                   bool use_uefi)
+static char *test_acpi_create_args(test_data *data, const char *params)
 {
     char *args;
 
-    if (use_uefi) {
+    if (data->uefi_fl1 && data->uefi_fl2) { /* use UEFI */
         /*
          * TODO: convert '-drive if=pflash' to new syntax (see e33763be7cd3)
          * when arm/virt boad starts to support it.
@@ -809,11 +808,10 @@ static char *test_acpi_create_args(test_data *data, const char *params,
 static void test_acpi_one(const char *params, test_data *data)
 {
     char *args;
-    bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-    args = test_acpi_create_args(data, params, use_uefi);
+    args = test_acpi_create_args(data, params);
     data->qts = qtest_init(args);
-    test_acpi_load_tables(data, use_uefi);
+    test_acpi_load_tables(data);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
         dump_aml_files(data, true);
@@ -826,7 +824,7 @@ static void test_acpi_one(const char *params, test_data *data)
      * Bug on uefi-test-tools to provide entry point:
      * https://bugs.launchpad.net/qemu/+bug/1821884
      */
-    if (!use_uefi) {
+    if (!(data->uefi_fl1 && data->uefi_fl2)) {
         SmbiosEntryPointType ep_type = test_smbios_entry_point(data);
         test_smbios_structs(data, ep_type);
     }
@@ -1904,10 +1902,9 @@ static void test_acpi_piix4_oem_fields(void)
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
 
-    args = test_acpi_create_args(&data,
-                                 OEM_TEST_ARGS, false);
+    args = test_acpi_create_args(&data, OEM_TEST_ARGS);
     data.qts = qtest_init(args);
-    test_acpi_load_tables(&data, false);
+    test_acpi_load_tables(&data);
     test_oem_fields(&data);
     qtest_quit(data.qts);
     free_test_data(&data);
@@ -1924,10 +1921,9 @@ static void test_acpi_q35_oem_fields(void)
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
 
-    args = test_acpi_create_args(&data,
-                                 OEM_TEST_ARGS, false);
+    args = test_acpi_create_args(&data, OEM_TEST_ARGS);
     data.qts = qtest_init(args);
-    test_acpi_load_tables(&data, false);
+    test_acpi_load_tables(&data);
     test_oem_fields(&data);
     qtest_quit(data.qts);
     free_test_data(&data);
@@ -1942,9 +1938,9 @@ static void test_acpi_microvm_oem_fields(void)
     test_acpi_microvm_prepare(&data);
 
     args = test_acpi_create_args(&data,
-                                 OEM_TEST_ARGS",acpi=on", false);
+                                 OEM_TEST_ARGS",acpi=on");
     data.qts = qtest_init(args);
-    test_acpi_load_tables(&data, false);
+    test_acpi_load_tables(&data);
     test_oem_fields(&data);
     qtest_quit(data.qts);
     free_test_data(&data);
@@ -1964,10 +1960,9 @@ static void test_acpi_virt_oem_fields(void)
     };
     char *args;
 
-    args = test_acpi_create_args(&data,
-                                 "-cpu cortex-a57 "OEM_TEST_ARGS, true);
+    args = test_acpi_create_args(&data, "-cpu cortex-a57 "OEM_TEST_ARGS);
     data.qts = qtest_init(args);
-    test_acpi_load_tables(&data, true);
+    test_acpi_load_tables(&data);
     test_oem_fields(&data);
     qtest_quit(data.qts);
     free_test_data(&data);
-- 
2.31.1


