Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6F56E9C67
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:20:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZp5-0003Y7-Od; Thu, 20 Apr 2023 15:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZp3-0003X7-EF; Thu, 20 Apr 2023 15:20:01 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZp1-0004Oj-7v; Thu, 20 Apr 2023 15:20:01 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6E0321A04;
 Thu, 20 Apr 2023 19:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682018397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OP4bpF13rpzkcXPE8rIyAFUcFLbidl+CwD7vZEgCb3s=;
 b=DBWQF+AixSRnszlFKjBIPgrO21rEGF7rwugtoxCqBEHW4vBe2f5Z9kF1c62xfhmit8h5yf
 TTnWjLMTfkCy8lE3HYwQ0HxH79GkBeL3A22hdgLlDUsCltgOaAd8rFWs1Lw0aYC/mCrYEm
 1X9tNiwVYUkG1RN6aEgQ+OaRkAe3HcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682018397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OP4bpF13rpzkcXPE8rIyAFUcFLbidl+CwD7vZEgCb3s=;
 b=MOfMF6xM9WOM52hvjg5c2S6YG2uv+0LYXJVO36rFl3POoRQIenJ+fG+GpdnG2hmYl6l7Te
 evlJlCZgDr75AhCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 375051333C;
 Thu, 20 Apr 2023 19:19:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ns2IAF2QQWRxSgAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 20 Apr 2023 19:19:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, David Hildenbrand <david@redhat.com>, John
 Snow <jsnow@redhat.com>, Fam Zheng <fam@euphon.net>, Hailiang Zhang
 <zhanghailiang@xfusion.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Leonardo Bras
 <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>, Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 28/43] migration: Move migrate_use_tls() to options.c
In-Reply-To: <20230420134002.29531-29-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-29-quintela@redhat.com>
Date: Thu, 20 Apr 2023 16:19:54 -0300
Message-ID: <87v8hq744l.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> Once there, rename it to migrate_tls() and make it return bool for
> consistency.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.c |  9 ---------
>  migration/migration.h |  2 --
>  migration/options.c   | 16 +++++++++++++++-
>  migration/options.h   |  9 +++++++++
>  migration/tls.c       |  3 ++-
>  5 files changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 2191437b15..bbc9a07fd7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2251,15 +2251,6 @@ bool migrate_postcopy(void)
>      return migrate_postcopy_ram() || migrate_dirty_bitmaps();
>  }
>  
> -int migrate_use_tls(void)
> -{
> -    MigrationState *s;
> -
> -    s = migrate_get_current();
> -
> -    return s->parameters.tls_creds && *s->parameters.tls_creds;
> -}
> -
>  /* migration thread support */
>  /*
>   * Something bad happened to the RP stream, mark an error
> diff --git a/migration/migration.h b/migration/migration.h
> index 3ae938b19c..2099470e8e 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -449,8 +449,6 @@ MigrationState *migrate_get_current(void);
>  
>  bool migrate_postcopy(void);
>  
> -int migrate_use_tls(void);
> -
>  uint64_t ram_get_total_transferred_pages(void);
>  
>  /* Sending on the return path - generic and then for each message type */
> diff --git a/migration/options.c b/migration/options.c
> index a111d0d43f..6db221157f 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -204,6 +204,20 @@ bool migrate_zero_copy_send(void)
>  
>      return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
>  }
> +
> +/* pseudo capabilities */
> +
> +bool migrate_tls(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->parameters.tls_creds && *s->parameters.tls_creds;
> +}
> +
> +
> +
>  typedef enum WriteTrackingSupport {
>      WT_SUPPORT_UNKNOWN = 0,
>      WT_SUPPORT_ABSENT,
> @@ -353,7 +367,7 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
>           new_caps[MIGRATION_CAPABILITY_COMPRESS] ||
>           new_caps[MIGRATION_CAPABILITY_XBZRLE] ||
>           migrate_multifd_compression() ||
> -         migrate_use_tls())) {
> +         migrate_tls())) {
>          error_setg(errp,
>                     "Zero copy only available for non-compressed non-TLS multifd migration");
>          return false;
> diff --git a/migration/options.h b/migration/options.h
> index 99f6bbd7a1..c91d5cbef0 100644
> --- a/migration/options.h
> +++ b/migration/options.h
> @@ -38,6 +38,15 @@ bool migrate_xbzrle(void);
>  bool migrate_zero_blocks(void);
>  bool migrate_zero_copy_send(void);
>  
> +/*
> + * pseudo capabilities
> + *
> + * This are functions that are used in a similar way that capabilities
> + * check, but they are not a capability.

s/This/These/
s/that capabilities/to capabilities/

> + */
> +
> +bool migrate_tls(void);
> +
>  /* capabilities helpers */
>  
>  bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp);
> diff --git a/migration/tls.c b/migration/tls.c
> index 4d2166a209..acd38e0b62 100644
> --- a/migration/tls.c
> +++ b/migration/tls.c
> @@ -22,6 +22,7 @@
>  #include "channel.h"
>  #include "migration.h"
>  #include "tls.h"
> +#include "options.h"
>  #include "crypto/tlscreds.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> @@ -165,7 +166,7 @@ void migration_tls_channel_connect(MigrationState *s,
>  
>  bool migrate_channel_requires_tls_upgrade(QIOChannel *ioc)
>  {
> -    if (!migrate_use_tls()) {
> +    if (!migrate_tls()) {
>          return false;
>      }

