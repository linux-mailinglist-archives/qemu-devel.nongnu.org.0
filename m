Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E139357355F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 13:28:33 +0200 (CEST)
Received: from localhost ([::1]:43050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBaXg-0001S9-H7
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 07:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBaVJ-00084j-Ik
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 07:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBaVF-0006gZ-99
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 07:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657711560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXCTOWJM+GoZ0p/js2HPFZngu+Xe5Y7zULcsZ9G/NHw=;
 b=VwDWSpJQXd9H8KuTUS3Xv2n5By176+CVlDbNomjsMbp19zZPUjZ1OcOR7p73fjLcjeYXOC
 +3we2PZJ1wGdiluhCBYcsGJC0na2fmv5mDorRGgyupkh4dRaiB9JOWLaaCuO+ugfj5tY7p
 OmBXay5+W8DaU+wseHgAbKZUuYDkvrU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-Q5Y8loMdOH6gm2aMzIKTlw-1; Wed, 13 Jul 2022 07:25:57 -0400
X-MC-Unique: Q5Y8loMdOH6gm2aMzIKTlw-1
Received: by mail-wr1-f71.google.com with SMTP id
 w12-20020adf8bcc000000b0021d20a5b24fso2068048wra.22
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 04:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JXCTOWJM+GoZ0p/js2HPFZngu+Xe5Y7zULcsZ9G/NHw=;
 b=62qgLI9awjF2Xjl+jZeX+BrwVcmeSdqQA+lF9ys4uYcovI3933VUqQYXXNzJkudlvj
 np0ENkM+37sbTNuE+OUnt2ybJiVbDG/dMarImpe9JVe540M+eHV+v1hMM61YM+JPkw6R
 5Icb/oKdF5ZujZSeaBFPN06OkqaNNk0yHM/j885Yz0xHzdPhgQNA6vIcouvw6zu3Y+Bk
 LvEQTzkKLB+GDbyLO5nZTpQSRX8MoZF9Yh3H+ZnEaeZ086GK8PuMz0u3dhEyFXY/5j1F
 17eLaF1GRBBAKDI8X7FNUrID4kk/7U8TpXfDgAb9L+Sv+mNPlUJHgomGh3KdfStq2mB/
 crdA==
X-Gm-Message-State: AJIora/BLHlgfO3xw10IoLme0G1+HYtxa7BdV25ZF9qRnt0HWosS4lIC
 FD+x58GrRtmle1gS9vVfMW+/jRe6mbPNPdC124/x2Ovq99t7ryJ49nDt4scG1bqNsBNkpgsBdns
 V4duLO2U/xoZlTFw=
X-Received: by 2002:a05:600c:1da2:b0:3a2:e534:4df5 with SMTP id
 p34-20020a05600c1da200b003a2e5344df5mr9010436wms.93.1657711556138; 
 Wed, 13 Jul 2022 04:25:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2OO2PLbtx2ssEwMj2+PQcY/3CHuBb+Rpcx+Vm6a5EDWH3rJnStYetqROFP4AwndIfkrJEQg==
X-Received: by 2002:a05:600c:1da2:b0:3a2:e534:4df5 with SMTP id
 p34-20020a05600c1da200b003a2e5344df5mr9010411wms.93.1657711555902; 
 Wed, 13 Jul 2022 04:25:55 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056000129000b0021d74906683sm10576604wrx.28.2022.07.13.04.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 04:25:55 -0700 (PDT)
Date: Wed, 13 Jul 2022 12:25:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v9 12/14] tests: Add postcopy tls migration test
Message-ID: <Ys6rwYe6VLlYHNVP@work-vm>
References: <20220707185342.26794-1-peterx@redhat.com>
 <20220707185525.27692-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707185525.27692-1-peterx@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

* Peter Xu (peterx@redhat.com) wrote:
> We just added TLS tests for precopy but not postcopy.  Add the
> corresponding test for vanilla postcopy.
> 
> Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
> will only use unix sockets as channel.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 61 ++++++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index f15a7517b1..ee37ad6631 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -566,6 +566,9 @@ typedef struct {
>  
>      /* Optional: set number of migration passes to wait for */
>      unsigned int iterations;
> +
> +    /* Postcopy specific fields */
> +    void *postcopy_data;
>  } MigrateCommon;
>  
>  static int test_migrate_start(QTestState **from, QTestState **to,
> @@ -1054,15 +1057,19 @@ test_migrate_tls_x509_finish(QTestState *from,
>  
>  static int migrate_postcopy_prepare(QTestState **from_ptr,
>                                      QTestState **to_ptr,
> -                                    MigrateStart *args)
> +                                    MigrateCommon *args)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
>      QTestState *from, *to;
>  
> -    if (test_migrate_start(&from, &to, uri, args)) {
> +    if (test_migrate_start(&from, &to, uri, &args->start)) {
>          return -1;
>      }
>  
> +    if (args->start_hook) {
> +        args->postcopy_data = args->start_hook(from, to);
> +    }
> +
>      migrate_set_capability(from, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
> @@ -1082,7 +1089,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      return 0;
>  }
>  
> -static void migrate_postcopy_complete(QTestState *from, QTestState *to)
> +static void migrate_postcopy_complete(QTestState *from, QTestState *to,
> +                                      MigrateCommon *args)
>  {
>      wait_for_migration_complete(from);
>  
> @@ -1093,25 +1101,48 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
>          read_blocktime(to);
>      }
>  
> +    if (args->finish_hook) {
> +        args->finish_hook(from, to, args->postcopy_data);
> +        args->postcopy_data = NULL;
> +    }
> +
>      test_migrate_end(from, to, true);
>  }
>  
> -static void test_postcopy(void)
> +static void test_postcopy_common(MigrateCommon *args)
>  {
> -    MigrateStart args = {};
>      QTestState *from, *to;
>  
> -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> +    if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
>      }
>      migrate_postcopy_start(from, to);
> -    migrate_postcopy_complete(from, to);
> +    migrate_postcopy_complete(from, to, args);
> +}
> +
> +static void test_postcopy(void)
> +{
> +    MigrateCommon args = { };
> +
> +    test_postcopy_common(&args);
> +}
> +
> +static void test_postcopy_tls_psk(void)
> +{
> +    MigrateCommon args = {
> +        .start_hook = test_migrate_tls_psk_start_match,
> +        .finish_hook = test_migrate_tls_psk_finish,
> +    };
> +
> +    test_postcopy_common(&args);
>  }
>  
>  static void test_postcopy_recovery(void)
>  {
> -    MigrateStart args = {
> -        .hide_stderr = true,
> +    MigrateCommon args = {
> +        .start = {
> +            .hide_stderr = true,
> +        },
>      };
>      QTestState *from, *to;
>      g_autofree char *uri = NULL;
> @@ -1167,7 +1198,7 @@ static void test_postcopy_recovery(void)
>      /* Restore the postcopy bandwidth to unlimited */
>      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
>  
> -    migrate_postcopy_complete(from, to);
> +    migrate_postcopy_complete(from, to, &args);
>  }
>  
>  static void test_baddest(void)
> @@ -2122,6 +2153,16 @@ int main(int argc, char **argv)
>      if (has_uffd) {
>          qtest_add_func("/migration/postcopy/unix", test_postcopy);
>          qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> +        qtest_add_func("/migration/postcopy/plain", test_postcopy);
> +#ifdef CONFIG_GNUTLS
> +        /*
> +         * NOTE: psk test is enough for postcopy, as other types of TLS
> +         * channels are tested under precopy.  Here what we want to test is the
> +         * general postcopy path that has TLS channel enabled.
> +         */
> +        qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
> +#endif /* CONFIG_GNUTLS */
> +        qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
>      }
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


