Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB355E541
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:18:12 +0200 (CEST)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6C2d-0005xZ-5Q
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6C1K-00059n-Vr
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:16:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6C1H-0003aS-Fm
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656425806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLGjDl8B3iEA7Cfp30rMmfFWUT6HDQChzzWJqE3rMU8=;
 b=QvTY89K2L5wM85Kn4pSmpekXNWGBCnfZwOadqVTbPPtaQDm81GV23bhJ9HF8GOP/ZGRZQw
 cGeas8hSfdqj2CHhlXpiz7r9ysfina/dr1kJXdfF7AGuz2Zj7WLinUAPZRTcyPtwr4Cc+w
 C2scoLuzQCohvijy7DzXL6qnWMKnDR0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-LABLmtG8OsWPhR1MGy7KHQ-1; Tue, 28 Jun 2022 10:16:44 -0400
X-MC-Unique: LABLmtG8OsWPhR1MGy7KHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 s1-20020a5d69c1000000b0021b9f3abfebso1838594wrw.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VLGjDl8B3iEA7Cfp30rMmfFWUT6HDQChzzWJqE3rMU8=;
 b=EZieyXwO0hpihdl3sv4xsrOTde2vnnCXcMfTx04LCsxJIzZtMSrZh2Y9Ca5Y9atBtt
 +4qiWnACTAyt7YbAzfe2fIOzuAEMIDOaYcbRUq8Jl1/vboGZEe9dgvRcYq4Zrge0on3l
 xpQO/fLojP9Y7pmo5nkGSEfScNctiukaOP1+j+++SEnrZdOMpYL+9WHVeiJ4iT8kiSxs
 SZDkcnE3KVFueJE2cOVdmdNMttR4PaTW9u2PgIDMFZpnyXR+UNaX6KubntsSJa6r3nji
 SC2qbrinLbXHwkQv3XVrtKh6M6vQaGIgzxoBwTgx7SK+DvCj9NTgZS3YWUt/OljkKf14
 O2nQ==
X-Gm-Message-State: AJIora9CJGDeVY5+69alrkrx9yL1/jtaGAyjJdHLZDK4vBb/7GSxdcsQ
 nR0AoLNWLaRl8BbHEIA/+2156Dhijqg3YV+r9mQT5T1bzsBfQCPYtjkp/EW7rTEbtvVbF4PoeHx
 ckseZ17ywg8InD2w=
X-Received: by 2002:a5d:584e:0:b0:21c:e4db:35e with SMTP id
 i14-20020a5d584e000000b0021ce4db035emr9629079wrf.192.1656425801843; 
 Tue, 28 Jun 2022 07:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7TTGI1tIhnyl4yatSiEf3f8h4z4+LgA2A4ABkIpP5QLWiL0EItBbHGfwHVmdsM8etxwOHuw==
X-Received: by 2002:a5d:584e:0:b0:21c:e4db:35e with SMTP id
 i14-20020a5d584e000000b0021ce4db035emr9629036wrf.192.1656425801491; 
 Tue, 28 Jun 2022 07:16:41 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j19-20020a5d6e53000000b002102b16b9a4sm13745427wrz.110.2022.06.28.07.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:16:40 -0700 (PDT)
Date: Tue, 28 Jun 2022 15:16:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 4/5] tests: use consistent bandwidth/downtime limits in
 migration tests
Message-ID: <YrsNRtFh9LVwlHuq@work-vm>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-5-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628105434.295905-5-berrange@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The different migration test cases are using a variety of settings
> to ensure convergance/non-convergance. Introduce two helpers to
> extra the common functionality and ensure consistency.
> 
>   * Non-convergance: 1ms downtime, 30mbs bandwidth
>   * Convergance: 30s downtime, 1gbs bandwidth
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 54 +++++++++++++-----------------------
>  1 file changed, 20 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index a54eff6d56..9e64125f02 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -46,9 +46,6 @@ unsigned start_address;
>  unsigned end_address;
>  static bool uffd_feature_thread_id;
>  
> -/* A downtime where the test really should converge */
> -#define CONVERGE_DOWNTIME (1000 * 30)
> -
>  #if defined(__linux__)
>  #include <sys/syscall.h>
>  #include <sys/vfs.h>
> @@ -402,6 +399,20 @@ static void migrate_set_parameter_str(QTestState *who, const char *parameter,
>      migrate_check_parameter_str(who, parameter, value);
>  }
>  
> +static void migrate_ensure_non_converge(QTestState *who)
> +{
> +    /* Can't converge with 1ms downtime + 30 mbs bandwidth limit */
> +    migrate_set_parameter_int(who, "max-bandwidth", 30 * 1000 * 1000);
> +    migrate_set_parameter_int(who, "downtime-limit", 1);
> +}
> +
> +static void migrate_ensure_converge(QTestState *who)
> +{
> +    /* Should converge with 30s downtime + 1 gbs bandwidth limit */
> +    migrate_set_parameter_int(who, "max-bandwidth", 1 * 1000 * 1000 * 1000);
> +    migrate_set_parameter_int(who, "downtime-limit", 30 * 1000);
> +}
> +
>  static void migrate_pause(QTestState *who)
>  {
>      QDict *rsp;
> @@ -984,12 +995,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
>  
> -    /* We want to pick a speed slow enough that the test completes
> -     * quickly, but that it doesn't complete precopy even on a slow
> -     * machine, so also set the downtime.
> -     */
> -    migrate_set_parameter_int(from, "max-bandwidth", 30000000);
> -    migrate_set_parameter_int(from, "downtime-limit", 1);
> +    migrate_ensure_non_converge(from);
>  
>      /* Wait for the first serial output from the source */
>      wait_for_serial("src_serial");
> @@ -1188,15 +1194,7 @@ static void test_precopy_common(MigrateCommon *args)
>          return;
>      }
>  
> -    /*
> -     * We want to pick a speed slow enough that the test completes
> -     * quickly, but that it doesn't complete precopy even on a slow
> -     * machine, so also set the downtime.
> -     */
> -    /* 1 ms should make it not converge*/
> -    migrate_set_parameter_int(from, "downtime-limit", 1);
> -    /* 1GB/s */
> -    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
> +    migrate_ensure_non_converge(from);
>  
>      if (args->start_hook) {
>          data_hook = args->start_hook(from, to);
> @@ -1230,7 +1228,7 @@ static void test_precopy_common(MigrateCommon *args)
>              wait_for_migration_pass(from);
>          }
>  
> -        migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
> +        migrate_ensure_converge(from);
>  
>          /* We do this first, as it has a timeout to stop us
>           * hanging forever if migration didn't converge */
> @@ -1694,8 +1692,7 @@ static void test_migrate_auto_converge(void)
>       * Set the initial parameters so that the migration could not converge
>       * without throttling.
>       */
> -    migrate_set_parameter_int(from, "downtime-limit", 1);
> -    migrate_set_parameter_int(from, "max-bandwidth", 100000000); /* ~100Mb/s */
> +    migrate_ensure_non_converge(from);
>  
>      /* To check remaining size after precopy */
>      migrate_set_capability(from, "pause-before-switchover", true);
> @@ -2000,15 +1997,7 @@ static void test_multifd_tcp_cancel(void)
>          return;
>      }
>  
> -    /*
> -     * We want to pick a speed slow enough that the test completes
> -     * quickly, but that it doesn't complete precopy even on a slow
> -     * machine, so also set the downtime.
> -     */
> -    /* 1 ms should make it not converge*/
> -    migrate_set_parameter_int(from, "downtime-limit", 1);
> -    /* 300MB/s */
> -    migrate_set_parameter_int(from, "max-bandwidth", 30000000);
> +    migrate_ensure_non_converge(from);
>  
>      migrate_set_parameter_int(from, "multifd-channels", 16);
>      migrate_set_parameter_int(to, "multifd-channels", 16);
> @@ -2054,10 +2043,7 @@ static void test_multifd_tcp_cancel(void)
>  
>      wait_for_migration_status(from, "cancelled", NULL);
>  
> -    /* 300ms it should converge */
> -    migrate_set_parameter_int(from, "downtime-limit", 300);
> -    /* 1GB/s */
> -    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
> +    migrate_ensure_converge(from);
>  
>      migrate_qmp(from, uri, "{}");
>  
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


