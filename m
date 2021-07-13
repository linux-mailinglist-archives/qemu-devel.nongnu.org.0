Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1423C7509
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:37:46 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LPl-00035j-P7
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3LOt-0001ss-QP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3LOr-0001o1-MW
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626194208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g+kVi/5XCZ1pTk22oBcmIXysp1bNRkEFyg/zwQgpdw=;
 b=gAhqjeT6bdpB2pFeV0+6EcFT5Rzaq4lwA9BV0hTCn++VclDtfN9MT4nI82qWlL75c4LljJ
 T9WUdjqMo/6UbwitoIkGadB0d9ZGlJHipz/U/pibGF3SOFsFsLXTFzbcOSOtpqwJuXxrzm
 zo4GdDwIDGceSKlIKArScGKuRDBQmu0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-V49EnCv2PBCC0nYtEw2rGA-1; Tue, 13 Jul 2021 12:36:45 -0400
X-MC-Unique: V49EnCv2PBCC0nYtEw2rGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so724165wms.8
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8g+kVi/5XCZ1pTk22oBcmIXysp1bNRkEFyg/zwQgpdw=;
 b=T1oz60XMAvUYwiVwWqx18y7xrFK2N1xFuYe2Hvzp8fy2FjE6r1cFG8SFupHbNAsVlJ
 R7zeuTD0RwczaEbu/1lA/omwaX/8ZCfzVA3bO/eQ3UgQA6fI9rxwvasBsA3bCBzCs9/8
 yXZZcc85orzm6dTHzlhmAQyJVYvTbByHjirUIT2o1fPl2a/i8MAhGfizpGhHA5bDI5Jo
 OSTOypilv42O+lPlc9wFfKJGhRIa9sXhs4qdVM7uu5MXua8ddEYfTANjXe5++XHNMdne
 aexTs23j8xQ89Tymnh16bsOs1FTz//KMs0CB5j7FuLk6gmd440QVfC5YlSFvQEaWlrHu
 0Upw==
X-Gm-Message-State: AOAM533kSvmhxZXpb47L+aSXv2Ga5U4M2yf/KYsrP7Ipvcv9wU+6oxwd
 9/boxsxB4aZZmjDfFk7NhcjW9kkrdmyCsUJXYdr3OLetSlZNbXgQlQghYVI7C2h4q2aZ2nPsqlW
 caNjZEYW6aROVIOA=
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr6968643wrx.298.1626194204116; 
 Tue, 13 Jul 2021 09:36:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbYHINh+cPYy8IlHCdGlxWpcGk99nWEeGvU1OeKdP/QcG1zrGTwoaz+s5eU4GxSJj5KhndqA==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr6968610wrx.298.1626194203814; 
 Tue, 13 Jul 2021 09:36:43 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id g3sm18798354wrv.64.2021.07.13.09.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:36:43 -0700 (PDT)
Subject: Re: [PATCH v4 10/10] tests: Use QMP to check whether a TPM device
 model is available
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
References: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
 <20210712204736.365349-11-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bdaca209-d2ac-9b72-ae93-94651ec10712@redhat.com>
Date: Tue, 13 Jul 2021 18:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712204736.365349-11-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 7/12/21 10:47 PM, Stefan Berger wrote:
> Use QMP to check whether a given TPM device model is available
> and if it is not the case then skip a test that requires it.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  tests/qtest/bios-tables-test.c | 14 +++++++------
>  tests/qtest/tpm-emu.c          | 37 ++++++++++++++++++++++++++++++++++
>  tests/qtest/tpm-emu.h          |  2 ++
>  3 files changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index ddfd2d2b2a..64add7da72 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1094,7 +1094,6 @@ uint64_t tpm_tis_base_addr;
>  static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>                                uint64_t base, enum TPMVersion tpm_version)
>  {
> -#ifdef CONFIG_TPM
>      gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
>                                            machine, tpm_if);
>      char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
> @@ -1140,19 +1139,22 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>      g_free(tmp_dir_name);
>      g_free(args);
>      free_test_data(&data);
> -#else
> -    g_test_skip("TPM disabled");
> -#endif
>  }
>  
>  static void test_acpi_q35_tcg_tpm2_tis(void)
>  {
> -    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
> +    if (!tpm_model_is_available("-machine q35", "tpm-tis"))

Style requires { }

> +        g_test_skip("TPM disabled");
> +    else
> +        test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
>  }
>  
>  static void test_acpi_q35_tcg_tpm12_tis(void)
>  {
> -    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);

Can you call this once in main() (before registering the tests)
and place this patch before patch #8 "tests: acpi: Add test cases
for TPM 1.2 with TCPA table" of this series? Otherwise looks good
(beside the unref you already mentioned).

> +    if (!tpm_model_is_available("-machine q35", "tpm-tis"))
> +        g_test_skip("TPM disabled");
> +    else
> +        test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);
>  }
>  
>  static void test_acpi_tcg_dimm_pxm(const char *machine)
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 32c704194b..553f1ad4ee 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -16,6 +16,8 @@
>  #include "backends/tpm/tpm_ioctl.h"
>  #include "io/channel-socket.h"
>  #include "qapi/error.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qmp/qstring.h"
>  #include "tpm-emu.h"
>  
>  void tpm_emu_test_wait_cond(TPMTestState *s)
> @@ -192,3 +194,38 @@ void *tpm_emu_ctrl_thread(void *data)
>      object_unref(OBJECT(lioc));
>      return NULL;
>  }
> +
> +bool tpm_model_is_available(const char *args, const char *tpm_if)
> +{
> +    QTestState *qts;
> +    QDict *rsp_tpm;
> +    bool ret = false;
> +
> +    qts = qtest_init(args);
> +    if (!qts)
> +        return false;
> +
> +    rsp_tpm = qtest_qmp(qts, "{ 'execute': 'query-tpm'}");
> +    if (!qdict_haskey(rsp_tpm, "error")) {
> +        QDict *rsp_models = qtest_qmp(qts,
> +                                      "{ 'execute': 'query-tpm-models'}");
> +        if (qdict_haskey(rsp_models, "return")) {
> +            QList *models = qdict_get_qlist(rsp_models, "return");
> +            QListEntry *e;
> +
> +            QLIST_FOREACH_ENTRY(models, e) {
> +                QString *s = qobject_to(QString, qlist_entry_obj(e));
> +                const char *ename = qstring_get_str(s);
> +                if (!strcmp(ename, tpm_if)) {
> +                    ret = true;
> +                }
> +            }
> +            qobject_unref(models);
> +        }
> +        qobject_unref(rsp_models);
> +    }
> +    qobject_unref(rsp_tpm);
> +    qtest_quit(qts);
> +
> +    return ret;
> +}


