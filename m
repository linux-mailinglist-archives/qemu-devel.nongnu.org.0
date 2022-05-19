Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C44052CEEA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:03:58 +0200 (CEST)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrc4b-0000oT-3u
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrbzF-0007Md-EA
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:58:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrbzC-0003AC-DJ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652950701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V4PNkKlrf+QU6pWUzerwzfxK98zc3emiFr8Fr/L+vLw=;
 b=D6zSoQdCYOWw+4dnnTR4pFt9qLWnJKXA1AvRUWbTjF7o2WoGfhomKqam3y3aMHxNvpZFx0
 ptFy/qqUYayoVlZsziISaB5ltQNGjoRbiMx9548iiOtHOOhdmBpugIrVb98L0Wl2Ud1ow7
 7T2gZU7iOqYBrtwKpYszTBaRXGce+uw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-YbQepg1VMZeaj4PP5Kh7Yw-1; Thu, 19 May 2022 04:58:20 -0400
X-MC-Unique: YbQepg1VMZeaj4PP5Kh7Yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m26-20020a05600c3b1a00b00397220d6329so1278522wms.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V4PNkKlrf+QU6pWUzerwzfxK98zc3emiFr8Fr/L+vLw=;
 b=CawFWmqKsUZtbDXcjMZTHNSWWVIry2mjK2eli86GmS5bH3f0kNc2d4w/PPOmYp0Kky
 9Fdn5XeK62H62nuw617GF5IIaAQKfoDVHNKK8b6PjjBB6H0Xkq3BTVmV9tGqdoxmMUEf
 +ZDBWnr2J6QB0A1rIx0HUL/eT6WC6qAyrW1pGPo3ap2pBTwcco33eMO6ynOkUGAO4c6t
 M9US3+2iawaR3N0nmbwJ2WP4oL+asCGCJ3mGPEb8BdudVYdXbNFr7ZPmSkIFkmdVBDzn
 /5eU/x5jKEl7tgJYi9r55Rp15EUHBGrQg6srr+q/k5xprEv9lZMI1BlaP0fa9LG4MhPB
 gsEg==
X-Gm-Message-State: AOAM5336rWdmr7xpmejCvvm1A/SWhniZdO13qmNQ+Lyhr6zSIsi2Z4NC
 LHP+Cig69ZpvGm7WtMU3AOrS8xY4XWQtgW979IA0OXUKqRb80Qo0a/27xChcErG+gQ3WLGYqUK+
 CwNHOeJ1aWTuVgQM=
X-Received: by 2002:a5d:584a:0:b0:20c:5bad:11c1 with SMTP id
 i10-20020a5d584a000000b0020c5bad11c1mr3143054wrf.62.1652950699346; 
 Thu, 19 May 2022 01:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWzEd4InDAJsN8QgY8k/Tbdh12081KXQtGUNL/ZhRhnX5peIyGyRxawA5u5WGoCTGIhWrBFA==
X-Received: by 2002:a5d:584a:0:b0:20c:5bad:11c1 with SMTP id
 i10-20020a5d584a000000b0020c5bad11c1mr3143031wrf.62.1652950699109; 
 Thu, 19 May 2022 01:58:19 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f20-20020a7bcc14000000b003948f4e750fsm6152773wmh.23.2022.05.19.01.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 01:58:18 -0700 (PDT)
Date: Thu, 19 May 2022 09:58:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 13/13] tests: Add postcopy preempt tests
Message-ID: <YoYGqB3jDA1k9BGc@work-vm>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-14-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517195730.32312-14-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
>  tests/qtest/migration-test.c | 54 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index ba7e4a2ed2..26264c7872 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -477,6 +477,7 @@ typedef struct {
>       */
>      bool hide_stderr;
>      bool use_shmem;
> +    bool postcopy_preempt;
>      /* only launch the target process */
>      bool only_target;
>      /* Use dirty ring if true; dirty logging otherwise */
> @@ -992,6 +993,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
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
> @@ -1058,6 +1064,25 @@ static void test_postcopy_tls_psk(void)
>      test_postcopy_common(&args);
>  }
>  
> +static void test_postcopy_preempt(void)
> +{
> +    MigrateStart args = {
> +        .postcopy_preempt = true,
> +    };
> +
> +    test_postcopy_common(&args);
> +}
> +
> +static void test_postcopy_preempt_tls_psk(void)
> +{
> +    MigrateStart args = {
> +        .postcopy_preempt = true,
> +        .postcopy_tls = true,
> +    };
> +
> +    test_postcopy_common(&args);
> +}
> +
>  static void test_postcopy_recovery_common(MigrateStart *args)
>  {
>      QTestState *from, *to;
> @@ -1134,6 +1159,24 @@ static void test_postcopy_recovery_tls_psk(void)
>      test_postcopy_recovery_common(&args);
>  }
>  
> +static void test_postcopy_preempt_recovery(void)
> +{
> +    MigrateStart args = { .postcopy_preempt = true };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
> +/* This contains preempt+recovery+tls test altogether */
> +static void test_postcopy_preempt_all(void)
> +{
> +    MigrateStart args = {
> +        .postcopy_preempt = true,
> +        .postcopy_tls = true,
> +    };
> +
> +    test_postcopy_recovery_common(&args);
> +}
> +
>  static void test_baddest(void)
>  {
>      MigrateStart args = {
> @@ -2190,6 +2233,17 @@ int main(int argc, char **argv)
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


