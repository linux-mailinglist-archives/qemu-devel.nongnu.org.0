Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B215169851C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:00:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNvx-0006DG-Pv; Wed, 15 Feb 2023 14:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSNvq-0006D3-A2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:59:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSNvo-00057M-2B
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676491145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4rpoWDZzatWIWtQTXfWq6qbUUbrtQgJyiJTEr9yCgeg=;
 b=IHlf9kzwOIDl+ne+gTSlZkt6qGA/WpmDcqnFyPpPiHvbIJVH8goLHW4rqfy8Tfv56Td90i
 ERhvsa8zrRzKAlQO8VNxX3892zFcfSfeiDY+frcvUg57Go71QOEl8P89rsabDsoRw7YBSG
 dwCAuMF78IEJKMYamthnhy5X7UWlrMM=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-UmDAsgVtOPK1Fj9qN3D0jQ-1; Wed, 15 Feb 2023 14:59:04 -0500
X-MC-Unique: UmDAsgVtOPK1Fj9qN3D0jQ-1
Received: by mail-il1-f198.google.com with SMTP id
 w11-20020a92d2cb000000b003157a4fddf3so3350ilg.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rpoWDZzatWIWtQTXfWq6qbUUbrtQgJyiJTEr9yCgeg=;
 b=Vqpy0vzgq/twY09KpbvqajD2P7NNT11StytR5dtcCVJ0jZlt4DPKD7XSDC4Y4zSvc7
 gnqk8RIzvPBvviDumAo9FWSxRjjJcuJEZ4aCaHnmMn4QnbBIVO/luschd0lcRRjSYG3Z
 Umu5INh1hqtZN5WTC7jyIaDBnq5sReqB45v0fHM9YvwIoQKeiecMEZInt9TcNrwOWm9v
 a1mzJkKjIA9ijZpgQfL7DiqdNtZrmECqvu8MciIy/AGAuBOCh7LQy/pa4roBOaXVUqxg
 chlkVRoaKsH06eSMWMAYTSqUWX96Jij7GLmBWw1ka++CkYUL+thrhXidn+7BEWSKYs0y
 5Pbg==
X-Gm-Message-State: AO0yUKVD5Rea+ybvJ7Qv/5chcfZZFXSUTLkbqwE3pOjwh5so+06RI3kx
 CwbswZBW9Ugp44mlMkXjW8YQRBW+dxvaA94Hbi6v1ilGq8SFt/5wnIMo1nS1XPbHXFTxI7N91CZ
 Tl45fV9YHf2kT2b8=
X-Received: by 2002:a05:6e02:1aa7:b0:315:39ce:abd2 with SMTP id
 l7-20020a056e021aa700b0031539ceabd2mr2741557ilv.3.1676491143737; 
 Wed, 15 Feb 2023 11:59:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8YsM5eYLk6R1hvROTXurHfU1FIkjILOuLZ4tHNiPKlw5mADgoSj+3sgdbH48x2FH6DprckCg==
X-Received: by 2002:a05:6e02:1aa7:b0:315:39ce:abd2 with SMTP id
 l7-20020a056e021aa700b0031539ceabd2mr2741527ilv.3.1676491143269; 
 Wed, 15 Feb 2023 11:59:03 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 h18-20020a02c732000000b00363d6918540sm5997022jao.171.2023.02.15.11.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:59:02 -0800 (PST)
Date: Wed, 15 Feb 2023 14:59:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 1/3] multifd: Create property
 multifd-flush-after-each-section
Message-ID: <Y+05hM4JPbfjUjn8@x1n>
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215180231.7644-2-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Feb 15, 2023 at 07:02:29PM +0100, Juan Quintela wrote:
> We used to flush all channels at the end of each RAM section
> sent.  That is not needed, so preparing to only flush after a full
> iteration through all the RAM.
> 
> Default value of the property is false.  But we return "true" in
> migrate_multifd_flush_after_each_section() until we implement the code
> in following patches.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

This line can be dropped, after (I assume) git commit helped to add the
other one below. :)

Normally that's also why I put R-bs before my SoB because I should have two
SoB but then I merge them into the last; git is happy with that too.

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

But some nitpicks below (I'll leave those to you to decide whether to
rework or keep them as is..).

>
> ---
> 
> Rename each-iteration to after-each-section
> Rename multifd-sync-after-each-section to
>        multifd-flush-after-each-section
> ---
>  qapi/migration.json   | 21 ++++++++++++++++++++-
>  migration/migration.h |  1 +
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 17 +++++++++++++++--
>  4 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..3afd81174d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -478,6 +478,24 @@
>  #                    should not affect the correctness of postcopy migration.
>  #                    (since 7.1)
>  #
> +# @multifd-flush-after-each-section: flush every channel after each
> +#                                    section sent.  This assures that
> +#                                    we can't mix pages from one
> +#                                    iteration through ram pages with
> +#                                    pages for the following
> +#                                    iteration.  We really only need
> +#                                    to do this flush after we have go
> +#                                    through all the dirty pages.
> +#                                    For historical reasons, we do
> +#                                    that after each section.  This is
> +#                                    suboptimal (we flush too many
> +#                                    times).
> +#                                    Default value is false.
> +#                                    Setting this capability has no
> +#                                    effect until the patch that
> +#                                    removes this comment.
> +#                                    (since 8.0)

IMHO the core of this new "cap" is the new RAM_SAVE_FLAG_MULTIFD_FLUSH bit
in the stream protocol, but it's not referenced here.  I would suggest
simplify the content but highlight the core change:

 @multifd-lazy-flush:  When enabled, multifd will only do sync flush after
                       each whole round of bitmap scan.  Otherwise it'll be
                       done per RAM save iteration (which happens with a much
                       higher frequency).

                       Please consider enable this as long as possible, and
                       keep this off only if any of the src/dst QEMU binary
                       doesn't support it.

                       This capability is bound to the new RAM save flag
                       RAM_SAVE_FLAG_MULTIFD_FLUSH, the new flag will only
                       be used and recognized when this feature bit set.

I know you dislike multifd-lazy-flush, but that's still the best I can come
up with when writting this (yeah I still like it :-p), please bare with me
and take whatever you think the best.

> +#
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -492,7 +510,8 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt',
> +           'multifd-flush-after-each-section'] }
>  
>  ##
>  # @MigrationCapabilityStatus:
> diff --git a/migration/migration.h b/migration/migration.h
> index 2da2f8a164..7f0f4260ba 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -424,6 +424,7 @@ int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
>  int migrate_multifd_zstd_level(void);
> +bool migrate_multifd_flush_after_each_section(void);
>  
>  #ifdef CONFIG_LINUX
>  bool migrate_use_zero_copy_send(void);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f73fc4c45c..602e775f34 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -54,6 +54,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>  GlobalProperty hw_compat_7_0[] = {
>      { "arm-gicv3-common", "force-8-bit-prio", "on" },
>      { "nvme-ns", "eui64-default", "on"},
> +    { "migration", "multifd-flush-after-each-section", "on"},

[same note to IRC: need to revert if rename, but otherwise don't bother]

Thanks,

>  };
>  const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index 90fca70cb7..cfba0da005 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -167,7 +167,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>      MIGRATION_CAPABILITY_XBZRLE,
>      MIGRATION_CAPABILITY_X_COLO,
>      MIGRATION_CAPABILITY_VALIDATE_UUID,
> -    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
> +    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
> +    MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION);
>  
>  /* When we add fault tolerance, we could have several
>     migrations at once.  For now we don't need to add
> @@ -2701,6 +2702,17 @@ bool migrate_use_multifd(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
>  }
>  
> +bool migrate_multifd_flush_after_each_section(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    /*
> +     * Until the patch that remove this comment, we always return that
> +     * the capability is enabled.
> +     */
> +    return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION];

(I'd rather not care about what happens if someone applies only this patch
 not the latter two by dropping "true ||" directly here, but again, no a
 huge deal)

> +}
> +
>  bool migrate_pause_before_switchover(void)
>  {
>      MigrationState *s;
> @@ -4535,7 +4547,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-zero-copy-send",
>              MIGRATION_CAPABILITY_ZERO_COPY_SEND),
>  #endif
> -
> +    DEFINE_PROP_MIG_CAP("multifd-flush-after-each-section",
> +                        MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> -- 
> 2.39.1
> 
> 

-- 
Peter Xu


