Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6C5438DF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:28:28 +0200 (CEST)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyXj-0006Aw-J4
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyyVY-00056i-F7
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyyVW-0004Pj-2n
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654705568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9NSy4oShLhbUrqlKwSDURdkM21O3CLIqatYZXV62eE=;
 b=K1uGHkqZkncCPIVkFa+JlJOG+7k+ZGroFfj3sZWxLih9wVjuyPQPJ/8gu/gHc0IW/mCZfb
 rnX4+1GYVP4GqHKIzUvEg+BXx5YwQDuFA2VCHp9UMCwfLaEd3DPwFXto3vVzZ0Xl9qVZIp
 p1J1Pv5X0nIVxc8yIm53/OGBVC8WHhk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-Ppy72FjuM8OIsYQv15dpgQ-1; Wed, 08 Jun 2022 12:26:07 -0400
X-MC-Unique: Ppy72FjuM8OIsYQv15dpgQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so4990843wra.15
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S9NSy4oShLhbUrqlKwSDURdkM21O3CLIqatYZXV62eE=;
 b=gz5YESBCwzWXa1ecx4bajg4NlWwkhKFUwtnjKXl7nQheatnwYTanMYlJZJCDhmkqBd
 zXBLHQPl9gkTvAEgLYrgiGW0eN2oOVDCf4FUk6HwNq/6IJeZIgxk4RM5xWTjj2KEFoso
 y31Ot9MKvzjYSMWqjkssvrwaKjnAtxha1OMz8DVRiag1UR98IaSGTxdJ+UHPTeFw+98T
 llZPDe7FTBvh6AX8H1Y57vry30TwDD/a9KIn/aBbf8U92b/tfRjZav3k1GQDdp+25Xaa
 LpbXFIUljRA8arKDztLyysVY4stV7q2ihMqlm/QLHYrW63vT/M0YoA371lG3mLZTlzof
 8CAw==
X-Gm-Message-State: AOAM530YV28ptPgABoohYHBQTp665grDLEmHUVZ5NCm1KERv7lEIB1Xk
 I9qpcEA91ch8o5rrYAC4NlEdaipTWNqDnjU6OvIvGLWUBmOc9thQfNFmYTHpLP2+4LoeE9Rcsza
 O5UxfTk8TgyhvsQQ=
X-Received: by 2002:a5d:6dd1:0:b0:210:7a1:cda0 with SMTP id
 d17-20020a5d6dd1000000b0021007a1cda0mr34038184wrz.570.1654705566368; 
 Wed, 08 Jun 2022 09:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL3I+u3N+j2rxO55n6lmWy7BD9tcbdy51yi8Z4G4zvdyjisAOnYJymX79e9yXqbZeCReUD2w==
X-Received: by 2002:a5d:6dd1:0:b0:210:7a1:cda0 with SMTP id
 d17-20020a5d6dd1000000b0021007a1cda0mr34038162wrz.570.1654705566159; 
 Wed, 08 Jun 2022 09:26:06 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h1-20020adffd41000000b002103aebe8absm21842840wrs.93.2022.06.08.09.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:26:05 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:26:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v7 14/14] tests: Add postcopy preempt tests
Message-ID: <YqDNmwnRYywZ2+l2@work-vm>
References: <20220524221151.18225-1-peterx@redhat.com>
 <20220524221151.18225-15-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524221151.18225-15-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
> Four tests are added for preempt mode:
> 
>   - Postcopy plain
>   - Postcopy recovery
>   - Postcopy tls
>   - Postcopy tls+recovery
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 58 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 12f1e3a751..ca2082a7d9 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -558,6 +558,7 @@ typedef struct {
>  
>      /* Postcopy specific fields */
>      void *postcopy_data;
> +    bool postcopy_preempt;
>  } MigrateCommon;
>  
>  static int test_migrate_start(QTestState **from, QTestState **to,
> @@ -1063,6 +1064,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
>  
> +    if (args->postcopy_preempt) {
> +        migrate_set_capability(from, "postcopy-preempt", true);
> +        migrate_set_capability(to, "postcopy-preempt", true);
> +    }
> +
>      /* We want to pick a speed slow enough that the test completes
>       * quickly, but that it doesn't complete precopy even on a slow
>       * machine, so also set the downtime.
> @@ -1131,6 +1137,26 @@ static void test_postcopy_tls_psk(void)
>      test_postcopy_common(&args);
>  }
>  
> +static void test_postcopy_preempt(void)
> +{
> +    MigrateCommon args = {
> +        .postcopy_preempt = true,
> +    };
> +
> +    test_postcopy_common(&args);
> +}
> +
> +static void test_postcopy_preempt_tls_psk(void)
> +{
> +    MigrateCommon args = {
> +        .postcopy_preempt = true,
> +        .start_hook = test_migrate_tls_psk_start_match,
> +        .finish_hook = test_migrate_tls_psk_finish,
> +    };
> +
> +    test_postcopy_common(&args);
> +}
> +
>  static void test_postcopy_recovery_common(MigrateCommon *args)
>  {
>      QTestState *from, *to;
> @@ -1210,6 +1236,27 @@ static void test_postcopy_recovery_tls_psk(void)
>      test_postcopy_recovery_common(&args);
>  }
>  
> +static void test_postcopy_preempt_recovery(void)
> +{
> +    MigrateCommon args = {
> +        .postcopy_preempt = true,
> +    };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
> +/* This contains preempt+recovery+tls test altogether */
> +static void test_postcopy_preempt_all(void)
> +{
> +    MigrateCommon args = {
> +        .postcopy_preempt = true,
> +        .start_hook = test_migrate_tls_psk_start_match,
> +        .finish_hook = test_migrate_tls_psk_finish,
> +    };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
>  static void test_baddest(void)
>  {
>      MigrateStart args = {
> @@ -2194,6 +2241,17 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/postcopy/recovery/tls/psk",
>                     test_postcopy_recovery_tls_psk);
>  #endif /* CONFIG_GNUTLS */
> +
> +    qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
> +    qtest_add_func("/migration/postcopy/preempt/recovery/plain",
> +                   test_postcopy_preempt_recovery);
> +#ifdef CONFIG_GNUTLS
> +    qtest_add_func("/migration/postcopy/preempt/tls/psk",
> +                   test_postcopy_preempt_tls_psk);
> +    qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
> +                   test_postcopy_preempt_all);
> +#endif /* CONFIG_GNUTLS */
> +
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
>      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


