Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86969187F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMtX-0003S1-90; Fri, 10 Feb 2023 01:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQMtV-0003Rt-CY
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:28:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQMtT-0006tg-Mj
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676010502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gWCYT7e+BIao6SnB9ZiICBXGD0WUkw4cyQh/J85bxU=;
 b=WlYGDzu9rgelWWw0VytMD9bfnOa5bZTeDFk5xPlprEGekAJ8f1f+hEdMI+daigMnrwaWUO
 sLUs70BPOSWIeiqS2qIni+XlhVPnMkBlPHMFNuu8XlstyZ/bLIJgJMwyi/z5PWR+ynt9V4
 mvO3ImrIcOqBy+6arUOBN4WJjW01Oa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-i4naB54QN56zpwwWvvIDag-1; Fri, 10 Feb 2023 01:28:18 -0500
X-MC-Unique: i4naB54QN56zpwwWvvIDag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABBCE833948;
 Fri, 10 Feb 2023 06:28:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91FAB2026D4B;
 Fri, 10 Feb 2023 06:28:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 70D0D21E6A1F; Fri, 10 Feb 2023 07:28:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Yanan
 Wang <wangyanan55@huawei.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v4 1/4] multifd: Create property
 multifd-sync-after-each-section
References: <20230209233730.38288-1-quintela@redhat.com>
 <20230209233730.38288-2-quintela@redhat.com>
Date: Fri, 10 Feb 2023 07:28:15 +0100
In-Reply-To: <20230209233730.38288-2-quintela@redhat.com> (Juan Quintela's
 message of "Fri, 10 Feb 2023 00:37:27 +0100")
Message-ID: <87edqyxce8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

[...]

> diff --git a/migration/migration.c b/migration/migration.c
> index a5c22e327d..b2844d374f 100644
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
> @@ -2705,6 +2706,15 @@ bool migrate_use_multifd(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
>  }
>  
> +bool migrate_multifd_sync_after_each_section(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return true;
> +    // We will change this when code gets in.

It seems the time for that would be right now, doesn't it?  ;)

> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
> +}
> +
>  bool migrate_pause_before_switchover(void)
>  {
>      MigrationState *s;
> @@ -4539,7 +4549,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-zero-copy-send",
>              MIGRATION_CAPABILITY_ZERO_COPY_SEND),
>  #endif
> -
> +    DEFINE_PROP_MIG_CAP("multifd-sync-after-each-section",
> +                        MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION),
>      DEFINE_PROP_END_OF_LIST(),
>  };


