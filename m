Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4E3443456
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:08:57 +0100 (CET)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxHL-0004r7-NJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwwX-0000cP-Dz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwwV-0005iI-Ev
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635871642;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JVGFNZnNQ9YFnEeQRpVAm8+cyh1KbYhs2A1THYFJ3a0=;
 b=YlhegmpgTjCFNEb7I667KXT0tx63l499Shk/6YymjY/5cp52shD23fJxNMe7LgPa09f+2O
 XpOeVcDZ797UwRu70p2T6QjmdxoWfmli6HeYF3zRlFHSCv7Az2a4n4ePsYWKqNIewP2TmV
 6JsMRzv2QoNO7wVQSaop4fkM6UGcJdw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559--rxgmCUrOjivt1JFoxULIA-1; Tue, 02 Nov 2021 12:47:21 -0400
X-MC-Unique: -rxgmCUrOjivt1JFoxULIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so1414997wmc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=JVGFNZnNQ9YFnEeQRpVAm8+cyh1KbYhs2A1THYFJ3a0=;
 b=ngHLV1A+6LX9Ow0i6P7pBrKu0rshs3Bd2lL2CWv7WOG5jhi3MUdtVjlkHlMV08mOWs
 bey+pylqhLTuFMS+TaSYpLDOxSVx0QoWYwwNFhZMX4X9iiU36Y73LzWcB6v3JYk7aYIa
 QJTAM/ldmzHcIZ0iehZR3kblMLvnX7HkW0qbOzkuzf8UMbmbUvFVmunHP2MxO47F91x5
 rXBH8UjgFDP4ZnFI9AF/sSQbUruvvuaMQHE5sy20pncLdYHcHmaUtvc6AyJN2hMgKcGI
 lhGjlvPz9UVdxG9XCSMcwoz/CNODgkuOkwRGev3OV2p/KalNnFNFDl7yCPsR4Xvna+qq
 EHAg==
X-Gm-Message-State: AOAM532vFVus+YxOZ3NKeYgRiTeTpkgLd7zR8OjF4nvkFyXagVlH90Iu
 NMezZhcCGxvH7YbAt0Ket367kLAczbrSSDYgRZEUJL4s58JMY/hf3PyhVlVmZD1R6FSVtlPY5Kp
 u9uQw1NpjiO47y6Y=
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr49822525wrd.42.1635871640639; 
 Tue, 02 Nov 2021 09:47:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG/xuj4FOHCrpM/m745JhT0S9HonY98NUd89dBNyulgx3zI5Sz6absM+1hcLp9O6KZdqc9hw==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr49822495wrd.42.1635871640460; 
 Tue, 02 Nov 2021 09:47:20 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id y6sm18866304wrh.18.2021.11.02.09.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:47:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Zhiwei Jiang <elish.jiang@ucloud.cn>
Subject: Re: [PATCH] migration: RDMA registrations interval optimization
In-Reply-To: <20210820155756.3899605-1-elish.jiang@ucloud.cn> (Zhiwei Jiang's
 message of "Fri, 20 Aug 2021 23:57:56 +0800")
References: <20210820155756.3899605-1-elish.jiang@ucloud.cn>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 17:47:18 +0100
Message-ID: <874k8uh5d5.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhiwei Jiang <elish.jiang@ucloud.cn> wrote:
> RDMA migration very hard to complete when VM run mysql
> benchmark on 1G host hugepage.I think the time between
> ram_control_before_iterate(f, RAM_CONTROL_ROUND) and
> after_iterate is too large when 1G host pagesize,so 1M
> buffer size match with mlx driver that will be good.
> after this patch,it will work as normal on my situation.
>
> Signed-off-by: Zhiwei Jiang <elish.jiang@ucloud.cn>

Hi

Nice catch.

Could you split the migrate_use_rdma() part (which is obvious).
I can't believe that wedon't have that function. And the rest.

See my comments there.

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

This shouldn't be needed (famous last words).  If it is needed, we are
masking other problem that we need to fix, like not initialzing the
migration state properly.
> +    /*
> +     * Enable RDMA migration
> +     */
> +    bool enabled_rdma_migration;


I think that ""rdma_enabled" is enough, what do you think?

I think that the comment is not needed.

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

To not have to do the comparison everytime, what about:

       unsigned long boundary = migrate_use_rdma() ? rdma_boundary : hostpage_boundary;

>      if (ramblock_is_ignored(pss->block)) {
> @@ -2069,7 +2073,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>              }
>          }
>          pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
> -    } while ((pss->page < hostpage_boundary) &&
> +    } while ((pss->page < (use_rdma ? rdma_boundary : hostpage_boundary)) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) <<
> TARGET_PAGE_BITS));

    } while ((pss->page < boundary) &&
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));

We remove one comparison in every round.

What do you think?

Later, Juan.

PD. Nice acchievement being able to migrate with a relative high load
    using 1GB pages.  Could you share your setup and how fast it goes.
    Thanks.


