Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C3C6E9C36
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:06:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZb2-00031L-MN; Thu, 20 Apr 2023 15:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZaX-0002wt-Qx; Thu, 20 Apr 2023 15:05:08 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZaU-0000gB-Aa; Thu, 20 Apr 2023 15:04:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFEBA1FD8C;
 Thu, 20 Apr 2023 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682017496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlM/g1aS7wcq0cfO78sTcll8Ur2rmEooPMzn41zpoR8=;
 b=CAzvUqG9QER9eCSoCCdVqxO1v6fBfRh9jAYzKr824KFZnzvhNYNwk3j/rC+LxWQWjoUdtd
 43ez5ackqBtrIo7w5UfttZ8UHbWn5v0J3JpACxtGrNxXNEquGN53CyttGlycNjkfsNiGQb
 7iANeWszQZ5orRq398QHPm7kNe5b+OQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682017496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlM/g1aS7wcq0cfO78sTcll8Ur2rmEooPMzn41zpoR8=;
 b=mjWF20aI8UuEgyWGDMVbbgq8AO3yvK6RDwaR7XhAbzexK455aS0yqUopy7Wg/JtcKjWuYB
 ecP9uX3/rNZXNEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B6F01333C;
 Thu, 20 Apr 2023 19:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SnxwBdiMQWS5QwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 20 Apr 2023 19:04:56 +0000
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
Subject: Re: [PATCH v2 24/43] migration: Move migrate_announce_params() to
 option.c
In-Reply-To: <20230420134002.29531-25-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-25-quintela@redhat.com>
Date: Thu, 20 Apr 2023 16:04:53 -0300
Message-ID: <877cu68je2.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

> ---
>  migration/migration.c | 14 --------------
>  migration/options.c   | 19 +++++++++++++++++++
>  2 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index dbb89c2e7b..2191437b15 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -954,20 +954,6 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>      return params;
>  }
>  
> -AnnounceParameters *migrate_announce_params(void)
> -{
> -    static AnnounceParameters ap;
> -
> -    MigrationState *s = migrate_get_current();
> -
> -    ap.initial = s->parameters.announce_initial;
> -    ap.max = s->parameters.announce_max;
> -    ap.rounds = s->parameters.announce_rounds;
> -    ap.step = s->parameters.announce_step;
> -
> -    return &ap;
> -}
> -
>  /*
>   * Return true if we're already in the middle of a migration
>   * (i.e. any of the active or setup states)
> diff --git a/migration/options.c b/migration/options.c
> index 2cb04fbbd1..ed9d2a226f 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -16,6 +16,7 @@
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/runstate.h"
> +#include "migration/misc.h"
>  #include "migration.h"
>  #include "ram.h"
>  #include "options.h"
> @@ -589,3 +590,21 @@ uint64_t migrate_xbzrle_cache_size(void)
>  
>      return s->parameters.xbzrle_cache_size;
>  }
> +
> +/* parameters helpers */
> +
> +AnnounceParameters *migrate_announce_params(void)
> +{
> +    static AnnounceParameters ap;
> +
> +    MigrationState *s = migrate_get_current();
> +
> +    ap.initial = s->parameters.announce_initial;
> +    ap.max = s->parameters.announce_max;
> +    ap.rounds = s->parameters.announce_rounds;
> +    ap.step = s->parameters.announce_step;
> +
> +    return &ap;
> +}
> +
> +

Extra whitespace here^

