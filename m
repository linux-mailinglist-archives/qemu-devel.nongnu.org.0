Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE71681B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMahm-0001wZ-HC; Mon, 30 Jan 2023 15:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaew-0007PL-3m
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaet-0007Tf-5D
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+u+/jVfLuhQEtNxnBBIodRfyU5vt6JMgwR5Rz45FcIw=;
 b=EDydh+5ZvjDFzUYjiYmaXZNUVrNksyUoNO6T+BgeZ+G6mv3m5gNS3g35okBuGXnXR0+PBH
 Yrt8/xr9KaoFUQiMaEea6ZqliU5LYumxeoC/nf0IeJrCbbPbp1aLbDmOmPHfzakmXZiDn2
 p0Gj67GzgzOmRZ04Et1ScFHs2mBEyzc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-LPiwn5ksOZKF1_1V6rsYtw-1; Mon, 30 Jan 2023 15:21:41 -0500
X-MC-Unique: LPiwn5ksOZKF1_1V6rsYtw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc9-20020a1709078a0900b0086910fdf624so8175770ejc.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+u+/jVfLuhQEtNxnBBIodRfyU5vt6JMgwR5Rz45FcIw=;
 b=nvwGoWh2+1dA3MsUz9FdMHSj4nkm3kVNSkSBAkemlLgXpPBmHY0LP7duwPj8kT/7F2
 JUnkxSk44Zm5UFGPGo3+7H/gCcgwwBNsn4gEi/YftsuG9xnj7SqNWe9an00B4JiMgG5e
 BfdDMn9ohgWct4/ugkQYqaTr/HTNBdfYShMknRFzXM9em39m4stpLJjXC+uUVkxSyGDY
 +7tCycG0TknsZiELerZRP2xn3TsEVquadm6+LeZxht9Al9YrZCYhLb+/0ml9jVB+MgD7
 Ryptccmtba8b2kWFATqy5KNhn244Ka8A7eSlBxjb5rSr6clinr6B9X/OcAXVOx1I1eRa
 13rg==
X-Gm-Message-State: AO0yUKVPbhlNbAtawav18q1rb6OkxvbYt2iZqM1gm8Hj4ITJkbipbvhx
 X3nI2p2PUoeEPisie3l1bRRQYm5FOLIDz+90KNGVIsNaVnjTKw/y2eAipE4+dvODIIZJgpJx8yp
 2a7G7+wTSkzb1bzOqAPraWRGtibXmDCZAWChqoonRRBnjVyT4AqB/VBZn6xQN
X-Received: by 2002:a17:906:5c4:b0:878:4917:f02f with SMTP id
 t4-20020a17090605c400b008784917f02fmr17243443ejt.15.1675110099523; 
 Mon, 30 Jan 2023 12:21:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/8A3XrfCpQaiMSeXkbLk2RQC9eKVgoUEED3V/CzUKctx4W2RWolyr5x7QpiyXF0hItsWVQzw==
X-Received: by 2002:a17:906:5c4:b0:878:4917:f02f with SMTP id
 t4-20020a17090605c400b008784917f02fmr17243419ejt.15.1675110099243; 
 Mon, 30 Jan 2023 12:21:39 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 z24-20020a170906945800b008790ae3e094sm6457878ejx.20.2023.01.30.12.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:38 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 53/56] tests/qtest/bios-tables-test: Make the test less
 verbose by default
Message-ID: <20230130201810.11518-54-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Thomas Huth <thuth@redhat.com>

We are facing the issues that our test logs in the gitlab CI are
too big (and thus cut off). The bios-tables-test is one of the few
qtests that prints many lines of output by default when running with
V=1, so it contributes to this problem. Almost all other qtests are
silent with V=1 and only print debug messages with V=2 and higher.
Thus let's change the bios-tables-test to behave more like the
other tests and only print the debug messages with V=2 (or higher).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230118125132.1694469-1-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 22b22c403d..d8c8cda58e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -24,7 +24,7 @@
  * You will also notice that tests/qtest/bios-tables-test-allowed-diff.h lists
  * a bunch of files. This is your hint that you need to do the below:
  * 4. Run
- *      make check V=1
+ *      make check V=2
  * this will produce a bunch of warnings about differences
  * beween actual and expected ACPI tables. If you have IASL installed,
  * they will also be disassembled so you can look at the disassembled
@@ -108,6 +108,8 @@ static const char *iasl = CONFIG_IASL;
 static const char *iasl;
 #endif
 
+static int verbosity_level;
+
 static bool compare_signature(const AcpiSdtTable *sdt, const char *signature)
 {
    return !memcmp(sdt->aml, signature, 4);
@@ -368,7 +370,7 @@ static GArray *load_expected_aml(test_data *data)
     gsize aml_len;
 
     GArray *exp_tables = g_array_new(false, true, sizeof(AcpiSdtTable));
-    if (getenv("V")) {
+    if (verbosity_level >= 2) {
         fputc('\n', stderr);
     }
     for (i = 0; i < data->tables->len; ++i) {
@@ -383,7 +385,7 @@ static GArray *load_expected_aml(test_data *data)
 try_again:
         aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
                                    sdt->aml, ext);
-        if (getenv("V")) {
+        if (verbosity_level >= 2) {
             fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
         }
         if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
@@ -395,7 +397,7 @@ try_again:
             goto try_again;
         }
         g_assert(exp_sdt.aml_file);
-        if (getenv("V")) {
+        if (verbosity_level >= 2) {
             fprintf(stderr, "Using expected file '%s'\n", aml_file);
         }
         ret = g_file_get_contents(aml_file, (gchar **)&exp_sdt.aml,
@@ -503,7 +505,7 @@ static void test_acpi_asl(test_data *data)
                         exp_sdt->aml, sdt->asl_file, sdt->aml_file,
                         exp_sdt->asl_file, exp_sdt->aml_file);
                 fflush(stderr);
-                if (getenv("V")) {
+                if (verbosity_level >= 1) {
                     const char *diff_env = getenv("DIFF");
                     const char *diff_cmd = diff_env ? diff_env : "diff -U 16";
                     char *diff = g_strdup_printf("%s %s %s", diff_cmd,
@@ -2042,8 +2044,13 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_tcg = qtest_has_accel("tcg");
+    char *v_env = getenv("V");
     int ret;
 
+    if (v_env) {
+        verbosity_level = atoi(v_env);
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-- 
MST


