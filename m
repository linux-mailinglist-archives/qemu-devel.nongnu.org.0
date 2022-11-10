Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E94262439B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:49:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7va-0001Nw-2J; Thu, 10 Nov 2022 08:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ot7ub-0001DN-Gw
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:48:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ot7uZ-0006O2-UD
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668088084;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=U5mfiI37bduni8jReemLMy1MfTvDZNuhVG8CzUhC5NE=;
 b=dAX9CabakeT68iFRzkv7gmSObm5l1c0/CdO/+ng61WUUiUMjjcOEXkbLPImO1smb9m77+k
 rNEjXZw3NokTHM66bSGkEv+ADj3S0WjhLhwUHW62rHucxqDlLiisr8/hAIf2pDXxBzUnes
 UIORDPNwK/DeOTk+o6Jm85/8KxSf5SU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-_8VdRCsBP-60WwGIy3Xmfg-1; Thu, 10 Nov 2022 08:48:02 -0500
X-MC-Unique: _8VdRCsBP-60WwGIy3Xmfg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so2685645wme.7
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 05:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5mfiI37bduni8jReemLMy1MfTvDZNuhVG8CzUhC5NE=;
 b=FyOXtsCXPcLiC8oq6wbDGPz1+A+6N7qDYGTqGCVu9z8SSihBM7+287hZrFuwlo9fPM
 BmWuMa7C4LXaUF5cS4I1k75+unhr5a7jKGWKpLgwzF6LWPP3sJ6QRKlbbihGNRPQyTGp
 KHrgUwfM8foLqIZUCaFuOSkL52g632ib6YUfcOm5hPzrfo1hVQuMtGkGRWAO/CrQkKxr
 46WtzQwR+OQlftE/BDG4mXh/hoI6f71NICU1TnC9R3rkAcLb31wPSP/NVNcw4+6OuYNW
 4ol82m8rF9UlAgqLeCegI3q+Nj9Du4K1KAkgewMoTMLAbIVv6zLckTilLQ8//kv5Z5Xy
 OxHA==
X-Gm-Message-State: ACrzQf2KE3B09cGelGoKbKK1Qp0EfbCYzeIBhdiDb/Cx0JUAKr9NKrYM
 nJnIbXoRyHRwF1FYCzzDYkgO4pbw8th9URxdpYveyQBu9RyfJ1vAzrjHbWt51MAW7Eni1zuyXhq
 3Wh4W+b+0uzgUzlI=
X-Received: by 2002:a05:600c:3b22:b0:3cf:5eff:c858 with SMTP id
 m34-20020a05600c3b2200b003cf5effc858mr43522023wms.193.1668088075921; 
 Thu, 10 Nov 2022 05:47:55 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4baqRCDsTr7ItucaHDNWtD/kLzc3CbPilXmcT2Gh4OsT1QSkwqn4sYinjiI2TxYl2RDqOdqA==
X-Received: by 2002:a05:600c:3b22:b0:3cf:5eff:c858 with SMTP id
 m34-20020a05600c3b2200b003cf5effc858mr43522009wms.193.1668088075625; 
 Thu, 10 Nov 2022 05:47:55 -0800 (PST)
Received: from redhat.com (62.117.240.223.dyn.user.ono.com. [62.117.240.223])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d48c7000000b0022cce7689d3sm19015996wrs.36.2022.11.10.05.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 05:47:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  qemu-devel@nongnu.org,  Li Xiaohui
 <xiaohli@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
In-Reply-To: <20221109055629.789795-1-leobras@redhat.com> (Leonardo Bras's
 message of "Wed, 9 Nov 2022 02:56:29 -0300")
References: <20221109055629.789795-1-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Thu, 10 Nov 2022 14:47:53 +0100
Message-ID: <87tu362a5y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Leonardo Bras <leobras@redhat.com> wrote:
D> When multifd and postcopy-ram capabilities are enabled, if a
> migrate-start-postcopy is attempted, the migration will finish sending the
> memory pages and then crash with the following error:
>
> qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion
> `QLIST_EMPTY(&entry->yankfns)' failed.
>
> This happens because even though all multifd channels could
> yank_register_function(), none of them could unregister it before
> unregistering the MIGRATION_YANK_INSTANCE, causing the assert to fail.
>
> Fix that by calling multifd_load_cleanup() on postcopy_ram_listen_thread()
> before MIGRATION_YANK_INSTANCE is unregistered.

Hi

One question,
What warantees that migration_load_cleanup() is not called twice?

I can't see anything that provides that here?  Or does postcopy have
never done the cleanup of multifd channels before?

Later, Juan.


> Fixes: b5eea99ec2 ("migration: Add yank feature")
> Reported-by: Li Xiaohui <xiaohli@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/migration.h |  1 +
>  migration/migration.c | 18 +++++++++++++-----
>  migration/savevm.c    |  2 ++
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/migration/migration.h b/migration/migration.h
> index cdad8aceaa..240f64efb0 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -473,6 +473,7 @@ void migration_make_urgent_request(void);
>  void migration_consume_urgent_request(void);
>  bool migration_rate_limit(void);
>  void migration_cancel(const Error *error);
> +bool migration_load_cleanup(void);
>  
>  void populate_vfio_info(MigrationInfo *info);
>  void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb683f3..4f363b2a95 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -486,6 +486,17 @@ void migrate_add_address(SocketAddress *address)
>                        QAPI_CLONE(SocketAddress, address));
>  }
>  
> +bool migration_load_cleanup(void)
> +{
> +    Error *local_err = NULL;
> +
> +    if (multifd_load_cleanup(&local_err)) {
> +        error_report_err(local_err);
> +        return true;
> +    }
> +    return false;
> +}
> +
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> @@ -540,8 +551,7 @@ static void process_incoming_migration_bh(void *opaque)
>       */
>      qemu_announce_self(&mis->announce_timer, migrate_announce_params());
>  
> -    if (multifd_load_cleanup(&local_err) != 0) {
> -        error_report_err(local_err);
> +    if (migration_load_cleanup()) {
>          autostart = false;
>      }
>      /* If global state section was not received or we are in running
> @@ -646,9 +656,7 @@ fail:
>      migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
>                        MIGRATION_STATUS_FAILED);
>      qemu_fclose(mis->from_src_file);
> -    if (multifd_load_cleanup(&local_err) != 0) {
> -        error_report_err(local_err);
> -    }
> +    migration_load_cleanup();
>      exit(EXIT_FAILURE);
>  }
>  
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a0cdb714f7..250caff7f4 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
>          exit(EXIT_FAILURE);
>      }
>  
> +    migration_load_cleanup();
> +

This addition is the one that I don't understand why it was not
needed/done before.

>      migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>                                     MIGRATION_STATUS_COMPLETED);
>      /*

Later, Juan.


