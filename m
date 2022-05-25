Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B2534054
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:25:59 +0200 (CEST)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsta-0000O2-Ab
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntsPr-0005Zu-1T
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntsPo-0000fF-Sa
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653490512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uL83jeU5LXjGpRu/u2kv//ouZrM6R+qVpb20mZ9q8Zg=;
 b=YKP+BFkXUVjilNGSjSgKWsdS6mqnAcgA2+moqyn3dtYPTYKe3ayGIUPAHpnkU6PLzcze1G
 Cxlx+4ws0e5rSNjwXnO5pB99TqUW92dLeozufqFtCXNxCpGxW+kaL4wYZhsBodTexA8AbS
 B6tumjIx9PpbKmtC98703x4EUkBkvVQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-tZdbTEWmMYORr9XenbLT2Q-1; Wed, 25 May 2022 10:55:11 -0400
X-MC-Unique: tZdbTEWmMYORr9XenbLT2Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 m19-20020a05600c4f5300b003974eba88c0so2948916wmq.9
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 07:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uL83jeU5LXjGpRu/u2kv//ouZrM6R+qVpb20mZ9q8Zg=;
 b=y/9LTlHpPgje2Vp2Y8zYCoUKdtxed4Yiy5KrhzmiwYr/GroJRx2kaVVVDqeQ0iDCFO
 Q7PpU0Vo3b7f3T2aCcuxfxO9roBLIWs9PiORc6bItYR/p0M1N3mLbLEgOwEUwzs4w34d
 jyYHpvVXylnp9ZW6Q84YeEWYCUdIjfTAatvyfYiscpT6MQM1VewiPH97M9VLEjIJCfWj
 LvXmmqqeOQW9nwFgJxOq+bZTDamihypgImtMpm/BYsD7AQbP4FCVgRwNfFefE4KgnFwV
 DbleBnEGoDLHGEpGfRFeZ6t6iEl2Xxuw/ZlLQlxZhTG/tK5mFaxMDQsTFgCqo/VkToyD
 aw/A==
X-Gm-Message-State: AOAM532sUWg7C/cfD0h4cNzuTMx/4HJkZikWbD0aoGTwcSzSVduTGPS6
 4Ag7Ju6zFDolWy4vplT+7KQBLw/d5oR/3TY9hgz2PfQ8kSOjtSPoaDOS/xpI0wb4gjV11OTwwav
 oyvIVgdDQtRZlsSk=
X-Received: by 2002:a05:6000:246:b0:20f:fff4:e1ec with SMTP id
 m6-20020a056000024600b0020ffff4e1ecmr2638819wrz.485.1653490509644; 
 Wed, 25 May 2022 07:55:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPVnic2T7k3rcBHbW5PuJTIuquH5pjUKDIylC+KfMIhZP9dQp/4+AqzTS3aFJOSu59ZuZghA==
X-Received: by 2002:a05:6000:246:b0:20f:fff4:e1ec with SMTP id
 m6-20020a056000024600b0020ffff4e1ecmr2638797wrz.485.1653490509399; 
 Wed, 25 May 2022 07:55:09 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q9-20020a5d6589000000b0020c7ec0fdf4sm2406443wru.117.2022.05.25.07.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 07:55:08 -0700 (PDT)
Date: Wed, 25 May 2022 15:55:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v7 13/14] tests: Add postcopy tls recovery migration test
Message-ID: <Yo5DSxSQ47JDg41o@work-vm>
References: <20220524221151.18225-1-peterx@redhat.com>
 <20220524221151.18225-14-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524221151.18225-14-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
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
> It's easy to build this upon the postcopy tls test.  Rename the old
> postcopy recovery test to postcopy/recovery/plain.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 38 +++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 03f7bb0d96..12f1e3a751 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1131,17 +1131,15 @@ static void test_postcopy_tls_psk(void)
>      test_postcopy_common(&args);
>  }
>  
> -static void test_postcopy_recovery(void)
> +static void test_postcopy_recovery_common(MigrateCommon *args)
>  {
> -    MigrateCommon args = {
> -        .start = {
> -            .hide_stderr = true,
> -        },
> -    };
>      QTestState *from, *to;
>      g_autofree char *uri = NULL;
>  
> -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> +    /* Always hide errors for postcopy recover tests since they're expected */
> +    args->start.hide_stderr = true;
> +
> +    if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
>      }
>  
> @@ -1192,7 +1190,24 @@ static void test_postcopy_recovery(void)
>      /* Restore the postcopy bandwidth to unlimited */
>      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
>  
> -    migrate_postcopy_complete(from, to, &args);
> +    migrate_postcopy_complete(from, to, args);
> +}
> +
> +static void test_postcopy_recovery(void)
> +{
> +    MigrateCommon args = { };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
> +static void test_postcopy_recovery_tls_psk(void)
> +{
> +    MigrateCommon args = {
> +        .start_hook = test_migrate_tls_psk_start_match,
> +        .finish_hook = test_migrate_tls_psk_finish,
> +    };
> +
> +    test_postcopy_recovery_common(&args);
>  }
>  
>  static void test_baddest(void)
> @@ -2173,7 +2188,12 @@ int main(int argc, char **argv)
>       */
>      qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
>  #endif /* CONFIG_GNUTLS */
> -    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> +    qtest_add_func("/migration/postcopy/recovery/plain",
> +                   test_postcopy_recovery);
> +#ifdef CONFIG_GNUTLS
> +    qtest_add_func("/migration/postcopy/recovery/tls/psk",
> +                   test_postcopy_recovery_tls_psk);
> +#endif /* CONFIG_GNUTLS */
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
>      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


