Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A8695D65
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:45:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqwI-0003BD-ID; Tue, 14 Feb 2023 03:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRqw5-00035W-3T
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRqw2-0005TP-EE
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676364307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TwxsZZgbYTX5OG+rT+P/ho6Dmi2KF3SpeETNDjz2bRs=;
 b=BGujoSsGurO+7aPZDTO7dSDbD9heaj2lzIHkg5HPPItl1MXj0+0nHM++EdJ2IANT/piGLe
 z8z+S5seUa+CBQ/LtCHg+SnytnmO9UPw9NWtUbbPNL1HLXjyOyhrLmSDxZwwi8PaQmG8yO
 TA/3WoVLOudJTBGSi2Fkrmnh4X+1kw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-X3tyyMURMdeGmUQPyCwL7A-1; Tue, 14 Feb 2023 03:45:04 -0500
X-MC-Unique: X3tyyMURMdeGmUQPyCwL7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C989818A6467;
 Tue, 14 Feb 2023 08:45:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25DE2492B03;
 Tue, 14 Feb 2023 08:45:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 05C0B21E6A1F; Tue, 14 Feb 2023 09:45:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Eric Blake <eblake@redhat.com>,  Yanan Wang
 <wangyanan55@huawei.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 1/3] multifd: Create property
 multifd-sync-after-each-section
References: <20230213091548.76444-1-quintela@redhat.com>
 <20230213091548.76444-2-quintela@redhat.com>
Date: Tue, 14 Feb 2023 09:45:02 +0100
In-Reply-To: <20230213091548.76444-2-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 13 Feb 2023 10:15:46 +0100")
Message-ID: <87mt5goctt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Juan Quintela <quintela@redhat.com> writes:

> We used to synchronize all channels at the end of each RAM section
> sent.  That is not needed, so preparing to only synchronize once every
> full round in latests patches.
>
> Notice that we initialize the property as true.  We will change the
> default when we introduce the new mechanism.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> ---
>
> Rename each-iteration to after-each-section
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json   | 10 +++++++++-
>  migration/migration.h |  1 +
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 15 +++++++++++++--
>  4 files changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..2907241b9c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -478,6 +478,13 @@
>  #                    should not affect the correctness of postcopy migration.
>  #                    (since 7.1)
>  #
> +# @multifd-sync-after-each-section: Synchronize channels after each
> +#                                   section is sent.

What does it mean to synchronize channels?

When would I want to, and why?

> +#                                                     We used to do
> +#                                   that in the past, but it is
> +#                                   suboptimal.

This isn't particularly helpful, I'm afraid.

> +#                                   Default value is true until all code is in.

As far as I can tell, it's actually *unused* for now, and a later patch
will put it to use ...

> +#                                   (since 8.0)
> +#
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -492,7 +499,8 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt',
> +           'multifd-sync-after-each-section'] }
>  
>  ##
>  # @MigrationCapabilityStatus:
> diff --git a/migration/migration.h b/migration/migration.h
> index 2da2f8a164..cf84520196 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -424,6 +424,7 @@ int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
>  int migrate_multifd_zstd_level(void);
> +bool migrate_multifd_sync_after_each_section(void);
>  
>  #ifdef CONFIG_LINUX
>  bool migrate_use_zero_copy_send(void);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f73fc4c45c..dc86849402 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -54,6 +54,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>  GlobalProperty hw_compat_7_0[] = {
>      { "arm-gicv3-common", "force-8-bit-prio", "on" },
>      { "nvme-ns", "eui64-default", "on"},
> +    { "migration", "multifd-sync-after-each-section", "on"},
>  };
>  const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index 90fca70cb7..406c27bc82 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -167,7 +167,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>      MIGRATION_CAPABILITY_XBZRLE,
>      MIGRATION_CAPABILITY_X_COLO,
>      MIGRATION_CAPABILITY_VALIDATE_UUID,
> -    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
> +    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
> +    MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION);
>  
>  /* When we add fault tolerance, we could have several
>     migrations at once.  For now we don't need to add
> @@ -2701,6 +2702,15 @@ bool migrate_use_multifd(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
>  }
>  
> +bool migrate_multifd_sync_after_each_section(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return true;
> +    // We will change this when code gets in.
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];

... here.

No warning about unreachable code?  Checking... nope, gcc seems to not
to care.

> +}
> +
>  bool migrate_pause_before_switchover(void)
>  {
>      MigrationState *s;
> @@ -4535,7 +4545,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-zero-copy-send",
>              MIGRATION_CAPABILITY_ZERO_COPY_SEND),
>  #endif
> -
> +    DEFINE_PROP_MIG_CAP("multifd-sync-after-each-section",
> +                        MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION),
>      DEFINE_PROP_END_OF_LIST(),
>  };


