Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A2681B7D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadW-0003J0-0R; Mon, 30 Jan 2023 15:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacz-0002ak-Gz
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacx-0006t7-Go
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WkluPFfN6Y0CEC5X/uT1vS+uu0muJwK9Vs7OtIF0wSo=;
 b=KvsofX9bo3j/5dkPE5SbdhLSNfIRRmPOF/a51ItLs1wEslJt3MqMw0EZipznCk/QrjOsvt
 UlmTLSmMEzRW4xzk4Vwbcpqie3IKflP7NXjXV0EjDiBZQIWoH0TTMApMbmoSVFcg/kTyKb
 CVy1xajpu/yzHpnd1aaaotWUGYp0bVs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-5lbOwJDDODyMpjuVo8v27g-1; Mon, 30 Jan 2023 15:19:41 -0500
X-MC-Unique: 5lbOwJDDODyMpjuVo8v27g-1
Received: by mail-ed1-f70.google.com with SMTP id
 m23-20020aa7c2d7000000b004a230f52c81so3854388edp.11
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkluPFfN6Y0CEC5X/uT1vS+uu0muJwK9Vs7OtIF0wSo=;
 b=QWTFMqKD1STkeAK+50YeF0QQD/UqFmyGuBfRzYoWqkWbPgpW3QF3ZfrzoaYeqdSFz9
 n/iAY1KkE3+zV7uY1swWF4CY4uH22HihGknEbb5WhrievlMq8jLtgW3JqEK2dWitBPKH
 IWt1d2lcPPMmV7pqyGKryESwDOm2yUEmzQuza+q0FHcgCI8k0zj+wPDSy2axitBbMw5b
 Dx+fWnw0r29MyKEm7SP2zAgU7VD/q1MwC4Lh327A+8iTRT6mOYs6QpQL74TSG0H5JLo2
 47KczzIAz3D78FmIcxt/DwKC0hcuMKXBfNfQCUNZwlmqZWpNLcSAOfiV2ww6bIdNIX99
 BQ6g==
X-Gm-Message-State: AO0yUKWjTN0MfEBMr+7124w3/MocEaW0QVvLafFf00rXYHrHvLoWXg8M
 wRU4yOKtCuAXJCMRa0B82jjR89Qu6m5NAI4xZOspTi+PPAeJLphIsO4EysN+ytD/5Abw0tyiCxx
 6pK2TQBeYDQvfh5uNz0pMoifSuVrpZqV4EBWswyjE4Dqwj6XAKWz0YCENphts
X-Received: by 2002:a05:6402:538d:b0:4a2:4abb:8d2b with SMTP id
 ew13-20020a056402538d00b004a24abb8d2bmr4482631edb.6.1675109978279; 
 Mon, 30 Jan 2023 12:19:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+OUZoHRK6+ImiG2bH1+Bp3w+TkeeE8BgNYMKqh0/Ui5pD6q91sH39xXf8ZVFExipJ2i4OheA==
X-Received: by 2002:a05:6402:538d:b0:4a2:4abb:8d2b with SMTP id
 ew13-20020a056402538d00b004a24abb8d2bmr4482615edb.6.1675109978049; 
 Mon, 30 Jan 2023 12:19:38 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 op27-20020a170906bcfb00b0084bfd56fb3bsm7297330ejb.162.2023.01.30.12.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:37 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 16/56] tests: acpi: cleanup use_uefi argument usage
Message-ID: <20230130201810.11518-17-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

'use_uefi' is used for the flag is a part of 'test_data *data'
argument that is passed to the same functions, which
makes use_uefi argument redundant.

Drop it and use 'data::uefi_*' directly, instead.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


