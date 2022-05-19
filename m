Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A882E52CF89
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:37:55 +0200 (CEST)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcbS-0005LO-OT
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrcYL-0003qj-FI
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:34:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrcYH-0008Ig-Pb
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652952876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMgZzqDwfns9wXBl7jShcl95Pn7mTt8g0jHHZNIRWik=;
 b=RhTJ+50+KXxcXDEF1uT4pAbTyLKx3gkdPyoJoccQkyoyoZw3rNudFaLjTRexycpfHHLOXP
 I+XcjhUQLCXhRapf3BB91yYMdgItP/HX2HnFy5iqWTOqMzsGUovU1LVnKIgKvvxWUtpKt4
 h+e/OzEVOnDhKCunROTBiSy24CUQToU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-b2GSWKVCOYKvZs1xCg6iMA-1; Thu, 19 May 2022 05:34:35 -0400
X-MC-Unique: b2GSWKVCOYKvZs1xCg6iMA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso4256231wma.6
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 02:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YMgZzqDwfns9wXBl7jShcl95Pn7mTt8g0jHHZNIRWik=;
 b=1wA7EAn1fhuBGXrHbJWJfUe3eCS8qaSJRLuyG++8As0251+GUG3r6Rwtn6Y+XXV56b
 jjgYLF85xFlv2z7GDOhBMNZC+9Ey6CYOpRD5CR+RYVCEmFfisgrloRSeGh67Mw9BZGcL
 lTsrU+/BzrmHECTuDCD/xVB3+Yzs6sqy/vk8ongU7rm/jm/TaGqJZwroP2APi6NGQz8F
 f4CtBTVOUZwH/7BVjnup3pQqJH8kgx6JSjTj1t+PY4TbYraC8+BdvRMS69QmM8YlCci6
 nCkV1RmwAgA0iEQNou8fu6uo27f/LtgewVfu68c4X1mtPG0n/4YCF22mz8+Uvgq5Xa52
 wZgg==
X-Gm-Message-State: AOAM533SVIBRGA4iLb+5AMaOg/dv++dxqIOqgHlp5Y/7p/Frbgl8xR7j
 HcrEFIeXClI8BCOclZrUI0lcA5Vgfu+DMDPefuOp9536h32m9H/3YvnWsKlbSwdg6zxUB4P0gAF
 2udG1/6g7lou8/3k=
X-Received: by 2002:a5d:5187:0:b0:20d:dfc:c333 with SMTP id
 k7-20020a5d5187000000b0020d0dfcc333mr3193790wrv.623.1652952874298; 
 Thu, 19 May 2022 02:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXYGR5Lv/ock95C4BLuPYqcuenVwN45bybH3riJjcvlhO38fr0StdOT6EptNNbCuuOO/OxkA==
X-Received: by 2002:a5d:5187:0:b0:20d:dfc:c333 with SMTP id
 k7-20020a5d5187000000b0020d0dfcc333mr3193771wrv.623.1652952874054; 
 Thu, 19 May 2022 02:34:34 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q16-20020adfbb90000000b0020d0c9c95d3sm4311521wrg.77.2022.05.19.02.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:34:33 -0700 (PDT)
Date: Thu, 19 May 2022 10:34:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 12/13] tests: Add postcopy tls recovery migration test
Message-ID: <YoYPJ1LDD/PSX4nk@work-vm>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-13-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517195730.32312-13-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
>  tests/qtest/migration-test.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index e8304aa454..ba7e4a2ed2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1058,15 +1058,15 @@ static void test_postcopy_tls_psk(void)
>      test_postcopy_common(&args);
>  }
>  
> -static void test_postcopy_recovery(void)
> +static void test_postcopy_recovery_common(MigrateStart *args)
>  {
> -    MigrateStart args = {
> -        .hide_stderr = true,
> -    };
>      QTestState *from, *to;
>      g_autofree char *uri = NULL;
>  
> -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> +    /* Always hide errors for postcopy recover tests since they're expected */
> +    args->hide_stderr = true;
> +
> +    if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
>      }
>  
> @@ -1117,7 +1117,21 @@ static void test_postcopy_recovery(void)
>      /* Restore the postcopy bandwidth to unlimited */
>      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
>  
> -    migrate_postcopy_complete(from, to, &args);
> +    migrate_postcopy_complete(from, to, args);
> +}
> +
> +static void test_postcopy_recovery(void)
> +{
> +    MigrateStart args = { };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
> +static void test_postcopy_recovery_tls_psk(void)
> +{
> +    MigrateStart args = { .postcopy_tls = true };
> +
> +    test_postcopy_recovery_common(&args);
>  }
>  
>  static void test_baddest(void)
> @@ -2170,7 +2184,12 @@ int main(int argc, char **argv)
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


