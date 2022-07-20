Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FCD57B49B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:38:32 +0200 (CEST)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE767-0007FU-Ly
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE74k-0005sC-T2
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE74f-0000qo-Fw
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658313421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g7pHa9Yu9FB6BO0sLfxOr4kI9/yi6ZKpZGQxSRtkgp8=;
 b=hKFVrIgyOE8/I2wxjT9Qhaws4+R7FBWZNrqsClqTtqYOct5nyZvt4E4XL+1UO5+s+0B7dr
 Rb4k/9sxTsXf3fOWsF6yFurETf15GKY3RvvddljL+2vwcXkDv85Z+PQ7eSejmdHZh8nKSI
 hSCw6njE339bQYJDw6lD6Tlv6y5FPZg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-eKxlpQVqPICJqcl0N0Yklw-1; Wed, 20 Jul 2022 06:36:59 -0400
X-MC-Unique: eKxlpQVqPICJqcl0N0Yklw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v18-20020a05600c215200b003a2fea66b7cso596933wml.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 03:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g7pHa9Yu9FB6BO0sLfxOr4kI9/yi6ZKpZGQxSRtkgp8=;
 b=3gwT+w1914rSw1Ad/0C7oy6Jjj6UtemPZbLX48yfkYEmsqX4WIisbjVdvTLemP9IeE
 bal2d4GAVW8hPrR1m2lT5z1h+2lpe3u25QO1MAgmoEeOZ6BjUO6+cRfSLNw+JstTyJR3
 iUE9jhqhvtedliVRHM8klgEU71t8sTFDLqaGAEfM52D2wVzOk94Lj7Fyzb0oapFHhZWw
 lzfXwQOSGHaDNXojpaFSXDsqAYjdISy7Ad97gQv9VyDkCJAIPIU8wsytoFc/mhPQkSpv
 tIu/rtySPCqXnmdY5V0I9Bu2Hqixpr0aE3AkWH3PeUm920xVStw4mRuSH2zDmTnuBITq
 FA8A==
X-Gm-Message-State: AJIora9KzfIH5MbogUOKGHSiKwYLw0FPOwU9btMM/PNpU7e91oFsPQFx
 RBoPiYpVOJrX3/wItdCENDulOZ6zNRC3ABLKCaK5L6Agy5xj2yiDpDMnnNoBy8aQxav8puIp3/9
 v9rk/CAyt3QryNHg=
X-Received: by 2002:a05:600c:211:b0:3a3:194d:7282 with SMTP id
 17-20020a05600c021100b003a3194d7282mr3188732wmi.132.1658313417650; 
 Wed, 20 Jul 2022 03:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdsv7mykMSb1bzfhiLO2wbJm1a6RoUSMm+/Ttrn76iKrX/tuElE9aZD9nszbpKjOEuK2tKDQ==
X-Received: by 2002:a05:600c:211:b0:3a3:194d:7282 with SMTP id
 17-20020a05600c021100b003a3194d7282mr3188707wmi.132.1658313417367; 
 Wed, 20 Jul 2022 03:36:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b003a31fd05e0fsm8762011wms.2.2022.07.20.03.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 03:36:56 -0700 (PDT)
Date: Wed, 20 Jul 2022 11:36:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 leobras@redhat.com, quintela@redhat.com, berrange@redhat.com,
 iii@linux.ibm.com, huangy81@chinatelecom.cn
Subject: Re: [PULL 00/29] migration queue
Message-ID: <Ytfax47xHawaFmCb@work-vm>
References: <20220719170221.576190-1-dgilbert@redhat.com>
 <CAFEAcA_+UkfoetuMeQLGGhg_7_6=rdT3O+z0M8bE0=2Zt-j-TQ@mail.gmail.com>
 <Ytct7/TArSHT5va3@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ytct7/TArSHT5va3@xz-m1.local>
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
> On Tue, Jul 19, 2022 at 10:53:33PM +0100, Peter Maydell wrote:
> > On Tue, 19 Jul 2022 at 18:16, Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:
> > >
> > >   Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220719c
> > >
> > > for you to fetch changes up to ec0345c1000b3a57b557da4c2e3f2114dd23903a:
> > >
> > >   migration: Avoid false-positive on non-supported scenarios for zero-copy-send (2022-07-19 17:33:22 +0100)
> > >
> > > ----------------------------------------------------------------
> > > Migration pull 2022-07-19
> > >
> > >   Hyman's dirty page rate limit set
> > >   Ilya's fix for zlib vs migration
> > >   Peter's postcopy-preempt
> > >   Cleanup from Dan
> > >   zero-copy tidy ups from Leo
> > >   multifd doc fix from Juan
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > >
> > > ----------------------------------------------------------------
> > 
> > Fails to build on some configs, eg:
> > https://gitlab.com/qemu-project/qemu/-/jobs/2743059797
> > https://gitlab.com/qemu-project/qemu/-/jobs/2743059743
> > 
> > ../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_tls_psk':
> > ../tests/qtest/migration-test.c:1168:23: error:
> > 'test_migrate_tls_psk_start_match' undeclared (first use in this
> > function)
> > 1168 | .start_hook = test_migrate_tls_psk_start_match,
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../tests/qtest/migration-test.c:1168:23: note: each undeclared
> > identifier is reported only once for each function it appears in
> > ../tests/qtest/migration-test.c:1169:24: error:
> > 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> > 1169 | .finish_hook = test_migrate_tls_psk_finish,
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../tests/qtest/migration-test.c: In function 'test_postcopy_recovery_tls_psk':
> > ../tests/qtest/migration-test.c:1247:23: error:
> > 'test_migrate_tls_psk_start_match' undeclared (first use in this
> > function)
> > 1247 | .start_hook = test_migrate_tls_psk_start_match,
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../tests/qtest/migration-test.c:1248:24: error:
> > 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> > 1248 | .finish_hook = test_migrate_tls_psk_finish,
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_all':
> > ../tests/qtest/migration-test.c:1268:23: error:
> > 'test_migrate_tls_psk_start_match' undeclared (first use in this
> > function)
> > 1268 | .start_hook = test_migrate_tls_psk_start_match,
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../tests/qtest/migration-test.c:1269:24: error:
> > 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> > 1269 | .finish_hook = test_migrate_tls_psk_finish,
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > At top level:
> > ../tests/qtest/migration-test.c:1264:13: error:
> > 'test_postcopy_preempt_all' defined but not used
> > [-Werror=unused-function]
> > 1264 | static void test_postcopy_preempt_all(void)
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~
> > ../tests/qtest/migration-test.c:1244:13: error:
> > 'test_postcopy_recovery_tls_psk' defined but not used
> > [-Werror=unused-function]
> > 1244 | static void test_postcopy_recovery_tls_psk(void)
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../tests/qtest/migration-test.c:1164:13: error:
> > 'test_postcopy_preempt_tls_psk' defined but not used
> > [-Werror=unused-function]
> > 1164 | static void test_postcopy_preempt_tls_psk(void)
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Sorry my fault.  We'll need to fix the 3 test patches one by one to use "#ifdef
> CONFIG_GNUTLS" properly for those functions..

and mine, I fixed one of those up but missed the others.

> I've attached the three small fixups, Peter/Dave, let me know what's the
> best way to redo this.

I've manually merged them in, and will resend.

Dave

> Thanks,
> 
> -- 
> Peter Xu

> From 7d361c8d61a51ed0df9e1606c3a6f8c306028181 Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Tue, 19 Jul 2022 18:16:40 -0400
> Subject: [PATCH 1/3] fixup! tests: Add postcopy tls migration test
> Content-type: text/plain
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 81780189a8..87dc87ba8b 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1133,6 +1133,7 @@ static void test_postcopy(void)
>      test_postcopy_common(&args);
>  }
>  
> +#ifdef CONFIG_GNUTLS
>  static void test_postcopy_tls_psk(void)
>  {
>      MigrateCommon args = {
> @@ -1142,6 +1143,7 @@ static void test_postcopy_tls_psk(void)
>  
>      test_postcopy_common(&args);
>  }
> +#endif
>  
>  static void test_postcopy_preempt(void)
>  {
> -- 
> 2.32.0
> 

> From c76945ab7b9a38456f077267ccb51133ef087e35 Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Tue, 19 Jul 2022 18:16:57 -0400
> Subject: [PATCH 2/3] fixup! tests: Add postcopy preempt tests
> Content-type: text/plain
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 87dc87ba8b..490ee71b75 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1154,6 +1154,7 @@ static void test_postcopy_preempt(void)
>      test_postcopy_common(&args);
>  }
>  
> +#ifdef CONFIG_GNUTLS
>  static void test_postcopy_preempt_tls_psk(void)
>  {
>      MigrateCommon args = {
> @@ -1164,6 +1165,7 @@ static void test_postcopy_preempt_tls_psk(void)
>  
>      test_postcopy_common(&args);
>  }
> +#endif
>  
>  static void test_postcopy_recovery_common(MigrateCommon *args)
>  {
> @@ -1253,6 +1255,7 @@ static void test_postcopy_preempt_recovery(void)
>      test_postcopy_recovery_common(&args);
>  }
>  
> +#ifdef CONFIG_GNUTLS
>  /* This contains preempt+recovery+tls test altogether */
>  static void test_postcopy_preempt_all(void)
>  {
> @@ -1264,6 +1267,7 @@ static void test_postcopy_preempt_all(void)
>  
>      test_postcopy_recovery_common(&args);
>  }
> +#endif
>  
>  static void test_baddest(void)
>  {
> -- 
> 2.32.0
> 

> From 3f6e48d9cd915378284fe897ddab19112c097f1f Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Tue, 19 Jul 2022 18:17:05 -0400
> Subject: [PATCH 3/3] fixup! tests: Add postcopy tls recovery migration test
> Content-type: text/plain
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 490ee71b75..b0843d35d4 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1236,6 +1236,7 @@ static void test_postcopy_recovery(void)
>      test_postcopy_recovery_common(&args);
>  }
>  
> +#ifdef CONFIG_GNUTLS
>  static void test_postcopy_recovery_tls_psk(void)
>  {
>      MigrateCommon args = {
> @@ -1245,6 +1246,7 @@ static void test_postcopy_recovery_tls_psk(void)
>  
>      test_postcopy_recovery_common(&args);
>  }
> +#endif
>  
>  static void test_postcopy_preempt_recovery(void)
>  {
> -- 
> 2.32.0
> 

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


