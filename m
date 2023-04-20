Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C296E9BE3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 20:47:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZJH-00056t-Q7; Thu, 20 Apr 2023 14:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZIn-000554-Mk; Thu, 20 Apr 2023 14:46:47 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZIj-0002FZ-Jb; Thu, 20 Apr 2023 14:46:40 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08B8F1F88F;
 Thu, 20 Apr 2023 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682016395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TpnUpwVARCVCxFR3QLbrBU1P1lPuKbgR34e8dwnfLXI=;
 b=dxU78cyK7eF3xEXiOh6GA2cpcD7WBMnzyv53Cb4IxvtTQWUWiixWyp8OP1blcOmp7b7CKc
 3+SVwkvVsOE0TW4j000IMuKJL8NzRvudSBrjdM954czFrvI9XC2t3s/8Kquq5jSf/Fkb96
 l0cOyEWzBV697xHRcoT2H3zhdasQm9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682016395;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TpnUpwVARCVCxFR3QLbrBU1P1lPuKbgR34e8dwnfLXI=;
 b=jI3J0a5qIi2/4UiIhOlxlIKzZS8IOZflUJQBFL0TUxEfaKGGd0BaE9AgT76SW1gLnxm0VH
 QgEccZz7DfOheWAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8961413584;
 Thu, 20 Apr 2023 18:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2miaFIqIQWR9OwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 20 Apr 2023 18:46:34 +0000
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
Subject: Re: [PATCH v2 13/43] migration: Create migrate_rdma_pin_all() function
In-Reply-To: <20230420134002.29531-14-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-14-quintela@redhat.com>
Date: Thu, 20 Apr 2023 15:46:32 -0300
Message-ID: <87leim8k8n.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  migration/options.c | 7 +++++++
>  migration/options.h | 1 +
>  migration/rdma.c    | 6 +++---
>  3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/migration/options.c b/migration/options.c
> index 2003e413da..9c9b8e5863 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -138,6 +138,13 @@ bool migrate_postcopy_ram(void)
>      return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
>  }
>  
> +bool migrate_rdma_pin_all(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
> +}
> +
>  bool migrate_release_ram(void)
>  {
>      MigrationState *s;
> diff --git a/migration/options.h b/migration/options.h
> index 316efd1063..25c002b37a 100644
> --- a/migration/options.h
> +++ b/migration/options.h
> @@ -30,6 +30,7 @@ bool migrate_pause_before_switchover(void);
>  bool migrate_postcopy_blocktime(void);
>  bool migrate_postcopy_preempt(void);
>  bool migrate_postcopy_ram(void);
> +bool migrate_rdma_pin_all(void);
>  bool migrate_release_ram(void);
>  bool migrate_return_path(void);
>  bool migrate_validate_uuid(void);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index bf55e2f163..3e7b68c482 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -35,6 +35,7 @@
>  #include <rdma/rdma_cma.h>
>  #include "trace.h"
>  #include "qom/object.h"
> +#include "options.h"
>  #include <poll.h>
>  
>  /*
> @@ -4178,8 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
>          goto err;
>      }
>  
> -    ret = qemu_rdma_source_init(rdma,
> -        s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
> +    ret = qemu_rdma_source_init(rdma,migrate_rdma_pin_all(), errp);

Missing a space after the comma here.

>  
>      if (ret) {
>          goto err;
> @@ -4201,7 +4201,7 @@ void rdma_start_outgoing_migration(void *opaque,
>          }
>  
>          ret = qemu_rdma_source_init(rdma_return_path,
> -            s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
> +                                    migrate_rdma_pin_all(), errp);
>  
>          if (ret) {
>              goto return_path_err;

