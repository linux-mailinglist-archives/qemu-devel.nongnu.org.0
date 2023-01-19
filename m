Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F83673604
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIST6-0001tQ-Lu; Thu, 19 Jan 2023 05:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pIST1-0001la-17
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pISSy-0005Yp-Ql
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674125299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoA8n1nYfE9GGg3ofOZZcS1yOZuCEqSXjiBFQv+3CvQ=;
 b=a2znhW7mZKIfr7aB9BZLLVBTKOW5FCblNsMoo2Rt+XO1HP19xo0aESgyEOeSGFKSxjSNg6
 tmvcYntCBivBd9LZc1MnTT9RFEO7/v00toZ2Io/BGzHHJvz8HJamuGXHVZR19/8aAVHR0e
 svEcIzt9U34amgYthNWV7z4HWge3/xo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-xHTEZnk3NDukAo2OYBUfTA-1; Thu, 19 Jan 2023 05:48:18 -0500
X-MC-Unique: xHTEZnk3NDukAo2OYBUfTA-1
Received: by mail-qv1-f72.google.com with SMTP id
 e5-20020a056214110500b0053547681552so791826qvs.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RoA8n1nYfE9GGg3ofOZZcS1yOZuCEqSXjiBFQv+3CvQ=;
 b=k9RmC5F+1XL8PLu9S9h2dRb9TkOSjIQcyHDNaBFh3qPbyKlJgmxNPOLV/iGgfll8qt
 2QD4mxt9yVdI4HKbyfELlMInC0KnGOd4OJvKbCgD+9IvcOuOct3qZ1GLyXRIyP7fBahQ
 NIzGkcPVn3JWt3MILVjQUGPedpHIN/TfUPGaOoihhOzvf3PosY+rYOm3RiGorTZn/dHo
 cP3an8SP6kj7kXFBl0+4tY/eymQb9BWyK/woXePj5BQSBJPenwKCERIjRMkL9JwGxXlT
 Udg1TN+yBAiWggMOLEGppnziYxl2f1TegGyjT2O0sqNgzri722MJbYW2pM2+ky1QmORw
 ggEA==
X-Gm-Message-State: AFqh2kqRfFyc5FceKDUC/lMauRx5CTfjDUHkpeh4Ic4BW95rhbEo9sOr
 Malu5D42u6cWmCO1bv535TnJWw/SNWl43qGKK1/uVIIPKRP3HVdNDh6sdWkO7JN3rqzEVTQsc2F
 RhPmN/a0k40UP2w4=
X-Received: by 2002:a05:622a:5a91:b0:3b6:414f:c2ba with SMTP id
 fz17-20020a05622a5a9100b003b6414fc2bamr15095524qtb.38.1674125297356; 
 Thu, 19 Jan 2023 02:48:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHMhl2rR4yfnzkvh8EjkDiJ4V80R4vwAGCzw+EG+F4DbYTl/UuihMPHzFoMwi8MN3iCeD0Aw==
X-Received: by 2002:a05:622a:5a91:b0:3b6:414f:c2ba with SMTP id
 fz17-20020a05622a5a9100b003b6414fc2bamr15095507qtb.38.1674125297101; 
 Thu, 19 Jan 2023 02:48:17 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-u.redhat.com.
 [213.175.37.12]) by smtp.gmail.com with ESMTPSA id
 bl24-20020a05620a1a9800b007059c5929b8sm8138621qkb.21.2023.01.19.02.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 02:48:16 -0800 (PST)
Date: Thu, 19 Jan 2023 11:48:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Michael
 S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] tests/qtest/bios-tables-test: Make the test less
 verbose by default
Message-ID: <20230119114813.347d7e1f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230118125132.1694469-1-thuth@redhat.com>
References: <20230118125132.1694469-1-thuth@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 18 Jan 2023 13:51:32 +0100
Thomas Huth <thuth@redhat.com> wrote:

> We are facing the issues that our test logs in the gitlab CI are
> too big (and thus cut off). The bios-tables-test is one of the few
> qtests that prints many lines of output by default when running with
> V=1, so it contributes to this problem. Almost all other qtests are
> silent with V=1 and only print debug messages with V=2 and higher.
> Thus let's change the bios-tables-test to behave more like the
> other tests and only print the debug messages with V=2 (or higher).

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  See also this discussion here:
>  https://lore.kernel.org/qemu-devel/Y8Z8CJoFyxB9uHqU@redhat.com/
> 
>  tests/qtest/bios-tables-test.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 8608408213..355d0c3d56 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -24,7 +24,7 @@
>   * You will also notice that tests/qtest/bios-tables-test-allowed-diff.h lists
>   * a bunch of files. This is your hint that you need to do the below:
>   * 4. Run
> - *      make check V=1
> + *      make check V=2
>   * this will produce a bunch of warnings about differences
>   * beween actual and expected ACPI tables. If you have IASL installed,
>   * they will also be disassembled so you can look at the disassembled
> @@ -108,6 +108,8 @@ static const char *iasl = CONFIG_IASL;
>  static const char *iasl;
>  #endif
>  
> +static int verbosity_level;
> +
>  static bool compare_signature(const AcpiSdtTable *sdt, const char *signature)
>  {
>     return !memcmp(sdt->aml, signature, 4);
> @@ -368,7 +370,7 @@ static GArray *load_expected_aml(test_data *data)
>      gsize aml_len;
>  
>      GArray *exp_tables = g_array_new(false, true, sizeof(AcpiSdtTable));
> -    if (getenv("V")) {
> +    if (verbosity_level >= 2) {
>          fputc('\n', stderr);
>      }
>      for (i = 0; i < data->tables->len; ++i) {
> @@ -383,7 +385,7 @@ static GArray *load_expected_aml(test_data *data)
>  try_again:
>          aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
>                                     sdt->aml, ext);
> -        if (getenv("V")) {
> +        if (verbosity_level >= 2) {
>              fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
>          }
>          if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> @@ -395,7 +397,7 @@ try_again:
>              goto try_again;
>          }
>          g_assert(exp_sdt.aml_file);
> -        if (getenv("V")) {
> +        if (verbosity_level >= 2) {
>              fprintf(stderr, "Using expected file '%s'\n", aml_file);
>          }
>          ret = g_file_get_contents(aml_file, (gchar **)&exp_sdt.aml,
> @@ -503,7 +505,7 @@ static void test_acpi_asl(test_data *data)
>                          exp_sdt->aml, sdt->asl_file, sdt->aml_file,
>                          exp_sdt->asl_file, exp_sdt->aml_file);
>                  fflush(stderr);
> -                if (getenv("V")) {
> +                if (verbosity_level >= 1) {
>                      const char *diff_env = getenv("DIFF");
>                      const char *diff_cmd = diff_env ? diff_env : "diff -U 16";
>                      char *diff = g_strdup_printf("%s %s %s", diff_cmd,
> @@ -1974,8 +1976,13 @@ int main(int argc, char *argv[])
>      const char *arch = qtest_get_arch();
>      const bool has_kvm = qtest_has_accel("kvm");
>      const bool has_tcg = qtest_has_accel("tcg");
> +    char *v_env = getenv("V");
>      int ret;
>  
> +    if (v_env) {
> +        verbosity_level = atoi(v_env);
> +    }
> +
>      g_test_init(&argc, &argv, NULL);
>  
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {


