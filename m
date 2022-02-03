Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CB4A8802
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:49:45 +0100 (CET)
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeMh-0000ij-Rs
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeJe-0005Hp-S5
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeJa-0005Sx-T3
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643903190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3nDt5Q7uIwFLbM4c3npyYKKzTQHkNRDEO9eEJ88ZB8U=;
 b=QIpCRT83vvQGcXUdqCvgkGGSa5Y/3M6QSHGM86r+lww4QMeAAJq2ZKONmnq1g7/CmRRMOx
 N4QxqJuyj30bvbsRVI9qq6z1Jr3416r6ZnzuFgc6vU2ZvX1Lloaa2zM6APAkkGIJ6mHE3N
 3RRLTbTT7c+HPNskF6K1WFtm/qzIT0U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-GrTqR2bBNWOvYSi9XXjGMQ-1; Thu, 03 Feb 2022 10:46:23 -0500
X-MC-Unique: GrTqR2bBNWOvYSi9XXjGMQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j21-20020adfa555000000b001db55dd5a1dso818776wrb.15
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3nDt5Q7uIwFLbM4c3npyYKKzTQHkNRDEO9eEJ88ZB8U=;
 b=PXxOaK+uNYfpyUWOfDzm0LwCmn/yuf/jFUkybAm5+pgb1gMKCnWeCXfsotOEv/lykc
 5J1/KLIv6fRi4Wj5OP1L0Gzu7NfbzJNe6jH2bq+YXbS4yHJjMXN64e8lrw3t80DRsoKI
 w+z9qrHCS0t1Qb2MMYtK2mCwxP6PPHarNuopZ4zH+1GMNaujYFY6YCHYHNjZXcLFSk7o
 Cu8tn5OoLk39AwgAqA+amwraCTtq12mlT4iaz/qGquf/MfobX7hkA3sviOJeqKRx5AD0
 hOLN8xsA0LQXCJEZ1S8tnlMAKc8VGBhYYC0XfiDFfXYnerEjIk1rkWZ1WGjP9ib9Df7x
 GdJg==
X-Gm-Message-State: AOAM530hUOyJONhOKREmnTn8YGPhS28MH8KVqiuEZNoY0TTklQuoy4qR
 6/BSAyXTNSPk0vCwvtYmJ85GSL+CtKtsgWrbZkws8GSvHDyfL+F6Lvuk1BVFsvf3psos80df+u+
 gURFpC+EmsQISSDY=
X-Received: by 2002:a05:600c:1587:: with SMTP id
 r7mr10701927wmf.5.1643903182568; 
 Thu, 03 Feb 2022 07:46:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5U2EPt1RnrfX6/zViP7q6roI5vpZGGZCqP9uBR/44DepwVhVQniysjA9vbOrp1DKrHboXvw==
X-Received: by 2002:a05:600c:1587:: with SMTP id
 r7mr10701909wmf.5.1643903182273; 
 Thu, 03 Feb 2022 07:46:22 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id a9sm8983126wmm.32.2022.02.03.07.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:46:21 -0800 (PST)
Date: Thu, 3 Feb 2022 15:46:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 13/15] migration: Add postcopy-preempt capability
Message-ID: <Yfv4y875xVz+nYML@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-14-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-14-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Firstly, postcopy already preempts precopy due to the fact that we do
> unqueue_page() first before looking into dirty bits.
> 
> However that's not enough, e.g., when there're host huge page enabled, when
> sending a precopy huge page, a postcopy request needs to wait until the whole
> huge page that is sending to finish.  That could introduce quite some delay,
> the bigger the huge page is the larger delay it'll bring.
> 
> This patch adds a new capability to allow postcopy requests to preempt existing
> precopy page during sending a huge page, so that postcopy requests can be
> serviced even faster.
> 
> Meanwhile to send it even faster, bypass the precopy stream by providing a
> standalone postcopy socket for sending requested pages.
> 
> Since the new behavior will not be compatible with the old behavior, this will
> not be the default, it's enabled only when the new capability is set on both
> src/dst QEMUs.
> 
> This patch only adds the capability itself, the logic will be added in follow
> up patches.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 23 +++++++++++++++++++++++
>  migration/migration.h |  1 +
>  qapi/migration.json   |  8 +++++++-
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 15a48b548a..84a8fbd80d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1227,6 +1227,11 @@ static bool migrate_caps_check(bool *cap_list,
>              error_setg(errp, "Postcopy is not compatible with ignore-shared");
>              return false;
>          }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> +            error_setg(errp, "Multifd is not supported in postcopy");
> +            return false;
> +        }
>      }
>  
>      if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
> @@ -1270,6 +1275,13 @@ static bool migrate_caps_check(bool *cap_list,
>          return false;
>      }
>  
> +    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
> +        if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
> +            error_setg(errp, "Postcopy preempt requires postcopy-ram");
> +            return false;
> +        }
> +    }
> +
>      return true;
>  }
>  
> @@ -2623,6 +2635,15 @@ bool migrate_background_snapshot(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
>  }
>  
> +bool migrate_postcopy_preempt(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
> +}
> +
>  /* migration thread support */
>  /*
>   * Something bad happened to the RP stream, mark an error
> @@ -4239,6 +4260,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
>      DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
>      DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
> +    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
> +                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
>      DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
>      DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
>      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
> diff --git a/migration/migration.h b/migration/migration.h
> index d0c0902ec9..9d39ccfcf5 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -391,6 +391,7 @@ int migrate_decompress_threads(void);
>  bool migrate_use_events(void);
>  bool migrate_postcopy_blocktime(void);
>  bool migrate_background_snapshot(void);
> +bool migrate_postcopy_preempt(void);
>  
>  /* Sending on the return path - generic and then for each message type */
>  void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/qapi/migration.json b/qapi/migration.json
> index bbfd48cf0b..f00b365bd5 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -452,6 +452,12 @@
>  #                       procedure starts. The VM RAM is saved with running VM.
>  #                       (since 6.0)
>  #
> +# @postcopy-preempt: If enabled, the migration process will allow postcopy
> +#                    requests to preempt precopy stream, so postcopy requests
> +#                    will be handled faster.  This is a performance feature and
> +#                    should not affect the correctness of postcopy migration.
> +#                    (since 7.0)
> +#
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -465,7 +471,7 @@
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> -           'validate-uuid', 'background-snapshot'] }
> +           'validate-uuid', 'background-snapshot', 'postcopy-preempt'] }
>  
>  ##
>  # @MigrationCapabilityStatus:
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


