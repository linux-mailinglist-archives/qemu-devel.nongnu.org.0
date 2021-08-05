Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090A3E0B16
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:06:32 +0200 (CEST)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBQu7-0001h2-27
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBQsd-0000Wz-N7
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBQsZ-0005qy-IJ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628121893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQYk8A1JNiB899vBFr+5pnTTApQoeQLzyF8HHnCz1Hg=;
 b=MXigLgIEFv5ylBxwm0lXFzus471Zp25fmI+yUinrXHuOOiymfK+MNCL1EK0xsEjAECbKSS
 yr5AJq5rE01xpjiRGS+AGbssadPzGTOaVvFC2A5VWAG+75BtCzRtoj9x/XrR4fi00Dc8XB
 EGAUawX1d0D4ErTqK1rx0pKIrhvNZJs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-0JBONmdxPmORP5GExP7kNw-1; Wed, 04 Aug 2021 20:04:52 -0400
X-MC-Unique: 0JBONmdxPmORP5GExP7kNw-1
Received: by mail-qt1-f199.google.com with SMTP id
 f19-20020ac846530000b02902682e86c382so1881028qto.4
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 17:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aQYk8A1JNiB899vBFr+5pnTTApQoeQLzyF8HHnCz1Hg=;
 b=CjPMWTHnjcCVYXASTl6QSAwmE8i18KSwmwoHTTJ1dzSTlGwvyeKFR646y8tezVSNVO
 D6zydBonJwI+9OekWXp8xfSUJbBUY9mTE5/lIMaOca3UT+1DpKCUmMeQCMzS//yYf7kV
 tIiqEcpFVANdMeUQtBtdkWhKWmvhAH2rV8TVXlBCShTPTwKAGmbB/vBLagKQlM3qHPM8
 RbaWJtw91K9bzU75oxIC9KtBtCMv5IqQ+/lcPbebyQPvgbJYcCxApZEmClFTkGKcTTyE
 pqgI3LfE3xcC97zYGTg3XllERCwQOEMMBVQYICTPyKheZSvhUaP4YmaEegEYSvJgd/Yb
 aIGA==
X-Gm-Message-State: AOAM5307ndH3CoywzfEIbuRHUDebYkz36be9JM2iaFnqbKJQKTeRx3sy
 9nw6iH18jJRDIDbRtphZFPFcfVm1Uke6+rdWVQumIQWfnSy0OqTB6Jv9QmgvVqAYk6eA6fbl7nU
 QIf5SqiqYr4pL6TM=
X-Received: by 2002:a05:622a:1104:: with SMTP id
 e4mr1995042qty.369.1628121892043; 
 Wed, 04 Aug 2021 17:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1gSoIF08S0sJJmrZihTBLz58n/+XcX/ZoFsSP3OHKN3CERmMo5Xbo5EbkYw83aCoiPxVP2w==
X-Received: by 2002:a05:622a:1104:: with SMTP id
 e4mr1995008qty.369.1628121891769; 
 Wed, 04 Aug 2021 17:04:51 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id u11sm2205441qkk.72.2021.08.04.17.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 17:04:50 -0700 (PDT)
Date: Wed, 4 Aug 2021 20:04:49 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 6/7] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <YQsrIQ4gvP6M+/rS@t490s>
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-7-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730085249.8246-7-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 10:52:48AM +0200, David Hildenbrand wrote:
> Currently, when someone (i.e., the VM) accesses discarded parts inside a
> RAMBlock with a RamDiscardManager managing the corresponding mapped memory
> region, postcopy will request migration of the corresponding page from the
> source. The source, however, will never answer, because it refuses to
> migrate such pages with undefined content ("logically unplugged"): the
> pages are never dirty, and get_queued_page() will consequently skip
> processing these postcopy requests.
> 
> Especially reading discarded ("logically unplugged") ranges is supposed to
> work in some setups (for example with current virtio-mem), although it
> barely ever happens: still, not placing a page would currently stall the
> VM, as it cannot make forward progress.
> 
> Let's check the state via the RamDiscardManager (the state e.g.,
> of virtio-mem is migrated during precopy) and avoid sending a request
> that will never get answered. Place a fresh zero page instead to keep
> the VM working. This is the same behavior that would happen
> automatically without userfaultfd being active, when accessing virtual
> memory regions without populated pages -- "populate on demand".
> 
> For now, there are valid cases (as documented in the virtio-mem spec) where
> a VM might read discarded memory; in the future, we will disallow that.
> Then, we might want to handle that case differently, e.g., warning the
> user that the VM seems to be mis-behaving.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/postcopy-ram.c | 31 +++++++++++++++++++++++++++----
>  migration/ram.c          | 21 +++++++++++++++++++++
>  migration/ram.h          |  1 +
>  3 files changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 2e9697bdd2..38cdfc09c3 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -671,6 +671,29 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
>      return ret;
>  }
>  
> +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
> +                                 ram_addr_t start, uint64_t haddr)
> +{
> +    void *aligned = (void *)(uintptr_t)(haddr & -qemu_ram_pagesize(rb));
> +
> +    /*
> +     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
> +     * access, place a zeropage, which will also set the relevant bits in the
> +     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
> +     *
> +     * Checking a single bit is sufficient to handle pagesize > TPS as either
> +     * all relevant bits are set or not.
> +     */
> +    assert(QEMU_IS_ALIGNED(start, qemu_ram_pagesize(rb)));

Is this check for ramblock_page_is_discarded()?  If so, shall we move this into
it, e.g. after memory_region_has_ram_discard_manager() returned true?

Other than that it looks good to me, thanks.

> +    if (ramblock_page_is_discarded(rb, start)) {
> +        bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);
> +
> +        return received ? 0 : postcopy_place_page_zero(mis, aligned, rb);
> +    }
> +
> +    return migrate_send_rp_req_pages(mis, rb, start, haddr);
> +}
> +
>  /*
>   * Callback from shared fault handlers to ask for a page,
>   * the page must be specified by a RAMBlock and an offset in that rb
> @@ -690,7 +713,7 @@ int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
>                                          qemu_ram_get_idstr(rb), rb_offset);
>          return postcopy_wake_shared(pcfd, client_addr, rb);
>      }
> -    migrate_send_rp_req_pages(mis, rb, aligned_rbo, client_addr);
> +    postcopy_request_page(mis, rb, aligned_rbo, client_addr);
>      return 0;
>  }
>  
> @@ -984,8 +1007,8 @@ retry:
>               * Send the request to the source - we want to request one
>               * of our host page sizes (which is >= TPS)
>               */
> -            ret = migrate_send_rp_req_pages(mis, rb, rb_offset,
> -                                            msg.arg.pagefault.address);
> +            ret = postcopy_request_page(mis, rb, rb_offset,
> +                                        msg.arg.pagefault.address);
>              if (ret) {
>                  /* May be network failure, try to wait for recovery */
>                  if (ret == -EIO && postcopy_pause_fault_thread(mis)) {
> @@ -993,7 +1016,7 @@ retry:
>                      goto retry;
>                  } else {
>                      /* This is a unavoidable fault */
> -                    error_report("%s: migrate_send_rp_req_pages() get %d",
> +                    error_report("%s: postcopy_request_page() get %d",
>                                   __func__, ret);
>                      break;
>                  }
> diff --git a/migration/ram.c b/migration/ram.c
> index 9776919faa..01cea01774 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -912,6 +912,27 @@ static uint64_t ramblock_dirty_bitmap_clear_discarded_pages(RAMBlock *rb)
>      return cleared_bits;
>  }
>  
> +/*
> + * Check if a host-page aligned page falls into a discarded range as managed by
> + * a RamDiscardManager responsible for the mapped memory region of the RAMBlock.
> + *
> + * Note: The result is only stable while migration (precopy/postcopy).
> + */
> +bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start)
> +{
> +    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
> +        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
> +        MemoryRegionSection section = {
> +            .mr = rb->mr,
> +            .offset_within_region = start,
> +            .size = int128_get64(qemu_ram_pagesize(rb)),
> +        };
> +
> +        return !ram_discard_manager_is_populated(rdm, &section);
> +    }
> +    return false;
> +}
> +
>  /* Called with RCU critical section */
>  static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
>  {
> diff --git a/migration/ram.h b/migration/ram.h
> index 4833e9fd5b..dda1988f3d 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -72,6 +72,7 @@ void ramblock_recv_bitmap_set_range(RAMBlock *rb, void *host_addr, size_t nr);
>  int64_t ramblock_recv_bitmap_send(QEMUFile *file,
>                                    const char *block_name);
>  int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
> +bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start);
>  
>  /* ram cache */
>  int colo_init_ram_cache(void);
> -- 
> 2.31.1
> 

-- 
Peter Xu


