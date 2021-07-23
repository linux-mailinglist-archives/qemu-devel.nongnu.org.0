Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26173D3DA8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:36:01 +0200 (CEST)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6y9Y-00017q-Ga
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y7w-0007rY-Nf
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6y7t-0006rt-C9
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627058055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JLB36a0yLSkmkH4XLxwam1woN8bzFyAh+upC7qvFNvw=;
 b=hB46LxczFUE2qQYCAwt0FsqoKoPsEPxaN+WY8gTOnibxajOt0+r/7gDCJJnjiAEC8tBGKR
 9qe8sYzlhSXEJuWG+WEhaAdRVaVk+1ShfIGOISvVWU+KQdopqqpCu6FcjpbjOtbkoQ17U6
 GDBrEeY+rLgsk3yhi2ds7LxK5zaEsj0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-R_3xq2e1PQSZxrYGe8hV3A-1; Fri, 23 Jul 2021 12:34:13 -0400
X-MC-Unique: R_3xq2e1PQSZxrYGe8hV3A-1
Received: by mail-qt1-f200.google.com with SMTP id
 j5-20020ac874c50000b029026ae3f4adc9so146703qtr.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JLB36a0yLSkmkH4XLxwam1woN8bzFyAh+upC7qvFNvw=;
 b=X5U9rX6AfOLXUYnMWRJ25Twb3vsE9mSiF25YlDpvSACJl1EoFvwRU0xiNgESgKWfsy
 MQH69+TGrLiNoR98WMegoM6GoEwtVaz87yZldOYWYWqIbQLoovfmRhHURurQ96YheMxx
 xyXgB578dxN3sZ2xIe/h7JCR0VZibOFyPSASguVJaRMOBoJ4RoPAPYw7iyR5UN8ar/M4
 J1Q++cRD5PPm0mJsByoZf/oJmynKBuzY69xVzRgSQ947dcyn4lc1q8n1mWKKN97IVWH4
 FgCvfnDkMnhvh3AKA6G2fjIcuuUqE8NbaWflKZWdXj7QajT0OIoWv2JczBLwpZDyU3NL
 JHuQ==
X-Gm-Message-State: AOAM533etS0/oe9Q8aM7M+TUUBtJQZX/2UqAO1LuTDm81QQ6QdHfVm/j
 1QBCPFVmjMrSRg80HCD60rWGzHHMSA7Bb/LGvvramJDg1GlH/C5S+bKOar8RFsFiBeTKBSCMnkH
 A6U4xWST/UbpJfsk=
X-Received: by 2002:ac8:5b83:: with SMTP id a3mr4732327qta.210.1627058053474; 
 Fri, 23 Jul 2021 09:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/FiBjdRfu5EsEFe6EJk0ELu1+EkSf/OJm1hgXnAI/lE+swPaUBpEI9kkDiJJWbJTFBjn+PQ==
X-Received: by 2002:ac8:5b83:: with SMTP id a3mr4732302qta.210.1627058053222; 
 Fri, 23 Jul 2021 09:34:13 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id c2sm11915137qtw.30.2021.07.23.09.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:34:12 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:34:05 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <YPrvfST43SFOMA1F@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721092759.21368-6-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jul 21, 2021 at 11:27:58AM +0200, David Hildenbrand wrote:
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
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/postcopy-ram.c | 25 +++++++++++++++++++++----
>  migration/ram.c          | 23 +++++++++++++++++++++++
>  migration/ram.h          |  1 +
>  3 files changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 2e9697bdd2..673f60ce2b 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -671,6 +671,23 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
>      return ret;
>  }
>  
> +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
> +                                 ram_addr_t start, uint64_t haddr)
> +{
> +    /*
> +     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
> +     * access, place a zeropage, which will also set the relevant bits in the
> +     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
> +     */
> +    if (ramblock_page_is_discarded(rb, start)) {
> +        bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);

Will received be set for any case with the current code base?  As I thought
virtio-mem forbids plug/unplug during the whole lifecycle of migration.

> +
> +        return received ? 0 : postcopy_place_page_zero(mis, (void *)haddr, rb);

(now we can fill up pages in two threads.. but looks thread-safe)

Meanwhile if this is highly not wanted, maybe worth an error_report_once() so
the admin could see something?

> +    }
> +
> +    return migrate_send_rp_req_pages(mis, rb, start, haddr);
> +}
> +
>  /*
>   * Callback from shared fault handlers to ask for a page,
>   * the page must be specified by a RAMBlock and an offset in that rb
> @@ -690,7 +707,7 @@ int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
>                                          qemu_ram_get_idstr(rb), rb_offset);
>          return postcopy_wake_shared(pcfd, client_addr, rb);
>      }
> -    migrate_send_rp_req_pages(mis, rb, aligned_rbo, client_addr);
> +    postcopy_request_page(mis, rb, aligned_rbo, client_addr);
>      return 0;
>  }
>  
> @@ -984,8 +1001,8 @@ retry:
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
> @@ -993,7 +1010,7 @@ retry:
>                      goto retry;
>                  } else {
>                      /* This is a unavoidable fault */
> -                    error_report("%s: migrate_send_rp_req_pages() get %d",
> +                    error_report("%s: postcopy_request_page() get %d",
>                                   __func__, ret);
>                      break;
>                  }
> diff --git a/migration/ram.c b/migration/ram.c
> index 4bf74ae2e1..d7505f5368 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -876,6 +876,29 @@ static uint64_t ramblock_dirty_bitmap_exclude_discarded_pages(RAMBlock *rb)
>      return cleared_bits;
>  }
>  
> +/*
> + * Check if a page falls into a discarded range as managed by a
> + * RamDiscardManager responsible for the mapped memory region of the RAMBlock.
> + * Pages inside discarded ranges are never migrated and postcopy has to
> + * place zeropages instead.
> + *
> + * Note: The result is only stable while migration (precopy/postcopy).
> + */
> +bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t offset)
> +{
> +    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
> +        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
> +        MemoryRegionSection section = {
> +            .mr = rb->mr,
> +            .offset_within_region = offset,
> +            .size = int128_get64(TARGET_PAGE_SIZE),

rb->page_size?

Although I think it should also work with TARGET_PAGE_SIZE in this specific
case, but maybe still better to use what we have.

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
> index 4833e9fd5b..6e7f12e556 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -72,6 +72,7 @@ void ramblock_recv_bitmap_set_range(RAMBlock *rb, void *host_addr, size_t nr);
>  int64_t ramblock_recv_bitmap_send(QEMUFile *file,
>                                    const char *block_name);
>  int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
> +bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t offset);
>  
>  /* ram cache */
>  int colo_init_ram_cache(void);
> -- 
> 2.31.1
> 

-- 
Peter Xu


