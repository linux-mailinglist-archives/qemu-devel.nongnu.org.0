Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52339444121
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 13:12:52 +0100 (CET)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miF8N-0000mn-8Q
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 08:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1miF6o-0008M0-Mz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1miF6l-0002Ob-PL
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635941470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sPgLDQ4GkrfvapCsEDQBUSlaaWy+iSbPf2uA1XHNjNE=;
 b=LtrJjG+BDpPHS2RfY4SXgrAm3Si7wV4C5yZTqcsSyghXBRYJKR1T6yFk1PtbDvh/ySveIY
 mtec0ZY6UcYaOfrrmemUG9gRAkf8Kpnw6D9SDyIJiTRu20tsWCGntm6jhB1+YDc025xK5C
 +FKlPzN74KkRzCdiBnIHfJaaFcCfwRA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-I-ZMt1eROLapsJBmw-OfYA-1; Wed, 03 Nov 2021 08:11:09 -0400
X-MC-Unique: I-ZMt1eROLapsJBmw-OfYA-1
Received: by mail-wm1-f72.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso2677163wmb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 05:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sPgLDQ4GkrfvapCsEDQBUSlaaWy+iSbPf2uA1XHNjNE=;
 b=fFIvrNQT3N0+5Es6auc4sdFQAIUcNmRBgtO72uBkbsgBBiqiUz0BMtutqfOS1AYRO+
 A7pKmDh0Wdph25x5EmJkjDhQzJiNPQhrf2DaWAmdyzr/NCgRpmBu/9O5LCPxYiQM999I
 VwgcG4VfBQT5WVKrfcLOnyShNc7VgRWtis7eAe48rDKoF2QQ/fGIJFxyTpBpAcjui7sN
 io/fhSsMmyh+FdEm4n+9hpDbQ6f4M04MrIzeKD7ORAiimz0blyGOuuavkiMgv4ldNL0e
 PMvcyDhzLJL/lxAayTwVOYS3Qo+cjNP+6XpXfe0w8IHXpg/0f6zsKHnVRSN70hgEVJ80
 R2gg==
X-Gm-Message-State: AOAM533jfeMFhtVSmouEy/06gV1VvQibE3B4w125hAxt6BQxI9E5wCse
 xXD2WvVfbe6W/R19PPPkZJC89Tax0B8FCA0k1m2uwFuorwbdrZeNTpf6CBvIuqChJn/CMEfK+HK
 gUTEbEw1/A2pES80=
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr52339689wri.352.1635941468408; 
 Wed, 03 Nov 2021 05:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyItY2OPsvL4Q6fvHbsOBs2WoyEL9U9jN1EMiaweVERFAa9yD/VxKXCILIx8DOtFaTxE0NfyQ==
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr52339662wri.352.1635941468171; 
 Wed, 03 Nov 2021 05:11:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n184sm3506609wme.2.2021.11.03.05.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:11:07 -0700 (PDT)
Date: Wed, 3 Nov 2021 12:11:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhiwei Jiang <elish.jiang@ucloud.cn>
Subject: Re: [PATCH] migration: RDMA registrations interval optimization
Message-ID: <YYJ8WQlGAW8vG8dL@work-vm>
References: <20210820155756.3899605-1-elish.jiang@ucloud.cn>
MIME-Version: 1.0
In-Reply-To: <20210820155756.3899605-1-elish.jiang@ucloud.cn>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhiwei Jiang (elish.jiang@ucloud.cn) wrote:
> RDMA migration very hard to complete when VM run mysql
> benchmark on 1G host hugepage.I think the time between
> ram_control_before_iterate(f, RAM_CONTROL_ROUND) and
> after_iterate is too large when 1G host pagesize,so 1M
> buffer size match with mlx driver that will be good.
> after this patch,it will work as normal on my situation.

Hi,
  Apologies for the delay in responding.

There are a few things I don't understand about this patch:
  a) Splitting the ram_save-host_page is probably wrong, in other
places we rely on this always saving the whole page.

  b) I don't understand why splitting ram_save_host_page to a smaller
size, causes ram_control..(RAM_CONTROL_ROUND) to be called more often
- it might be if you have the bandwidth limits set?

  c) I thought the RDMA cards preferred large transfers? Can you provide
some pointer to the information on this 1M buffer size and why it slows
it down?

Dave

> Signed-off-by: Zhiwei Jiang <elish.jiang@ucloud.cn>
> ---
>  migration/migration.c | 13 +++++++++++++
>  migration/migration.h |  6 ++++++
>  migration/ram.c       |  6 +++++-
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 041b8451a6..934916b161 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -457,6 +457,8 @@ void migrate_add_address(SocketAddress *address)
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> +    MigrationState *s = migrate_get_current();
> +    s->enabled_rdma_migration = false;
>  
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>      if (strstart(uri, "tcp:", &p) ||
> @@ -465,6 +467,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>          socket_start_incoming_migration(p ? p : uri, errp);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> +        s->enabled_rdma_migration = true;
>          rdma_start_incoming_migration(p, errp);
>  #endif
>      } else if (strstart(uri, "exec:", &p)) {
> @@ -2040,6 +2043,7 @@ void migrate_init(MigrationState *s)
>      s->start_postcopy = false;
>      s->postcopy_after_devices = false;
>      s->migration_thread_running = false;
> +    s->enabled_rdma_migration = false;
>      error_free(s->error);
>      s->error = NULL;
>      s->hostname = NULL;
> @@ -2300,6 +2304,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> +        s->enabled_rdma_migration = true;
>          rdma_start_outgoing_migration(s, p, &local_err);
>  #endif
>      } else if (strstart(uri, "exec:", &p)) {
> @@ -2475,6 +2480,14 @@ bool migrate_use_events(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_EVENTS];
>  }
>  
> +bool migrate_use_rdma(void)
> +{
> +    MigrationState *s;
> +    s = migrate_get_current();
> +
> +    return s->enabled_rdma_migration;
> +}
> +
>  bool migrate_use_multifd(void)
>  {
>      MigrationState *s;
> diff --git a/migration/migration.h b/migration/migration.h
> index 7a5aa8c2fd..860dc93df1 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -296,6 +296,11 @@ struct MigrationState {
>       * This save hostname when out-going migration starts
>       */
>      char *hostname;
> +
> +    /*
> +     * Enable RDMA migration
> +     */
> +    bool enabled_rdma_migration;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> @@ -332,6 +337,7 @@ bool migrate_ignore_shared(void);
>  bool migrate_validate_uuid(void);
>  
>  bool migrate_auto_converge(void);
> +bool migrate_use_rdma(void);
>  bool migrate_use_multifd(void);
>  bool migrate_pause_before_switchover(void);
>  int migrate_multifd_channels(void);
> diff --git a/migration/ram.c b/migration/ram.c
> index 7a43bfd7af..dc0c0e2565 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2043,7 +2043,11 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
>      unsigned long hostpage_boundary =
>          QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
> +    /* Set RDMA boundary default 256*4K=1M that driver delivery more effective*/
> +    unsigned long rdma_boundary =
> +        QEMU_ALIGN_UP(pss->page + 1, 256);
>      unsigned long start_page = pss->page;
> +    bool use_rdma = migrate_use_rdma();
>      int res;
>  
>      if (ramblock_is_ignored(pss->block)) {
> @@ -2069,7 +2073,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>              }
>          }
>          pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
> -    } while ((pss->page < hostpage_boundary) &&
> +    } while ((pss->page < (use_rdma ? rdma_boundary : hostpage_boundary)) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
>      /* The offset we leave with is the min boundary of host page and block */
> -- 
> 2.25.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


