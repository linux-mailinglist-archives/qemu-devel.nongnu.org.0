Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B432E534
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:47:48 +0100 (CET)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI73k-0004TI-0L
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lI6zq-0001EJ-Mp
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lI6zo-0007A6-4r
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614937422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kiS4RTdvz7drTKTJgv65CRtDLA42VHoLp1Yvdyvtw5U=;
 b=MOG7efaS5N5Neytb9y2PWtRw47PkF4i9cLYMhlChqszAV92+S1orYd2LPysswnZd21pJCF
 fzriOjEgbkMwxzlXJkLsfEQIzSXwD0KL4vLUrzM2jerF2tzT710hMMHpQJ79gyuqRiu9dn
 gBdOJh1DKh56kIJgqs3zWxC6WGd00v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-pFT4pcckOp6hSFbThyiIZA-1; Fri, 05 Mar 2021 04:43:41 -0500
X-MC-Unique: pFT4pcckOp6hSFbThyiIZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06F6F57;
 Fri,  5 Mar 2021 09:43:40 +0000 (UTC)
Received: from [10.36.112.194] (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B0DF62954;
 Fri,  5 Mar 2021 09:43:32 +0000 (UTC)
Subject: Re: [PATCH RFC] migrate/ram: remove "ram_bulk_stage" and "fpo_enabled"
To: qemu-devel@nongnu.org
References: <20210216105039.40680-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9b059636-2b9e-906c-c53b-bfdb0e0e447d@redhat.com>
Date: Fri, 5 Mar 2021 10:43:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210216105039.40680-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.21 11:50, David Hildenbrand wrote:
> The bulk stage is kind of weird: migration_bitmap_find_dirty() will
> indicate a dirty page, however, ram_save_host_page() will never save it, as
> migration_bitmap_clear_dirty() detects that it is not dirty.
> 
> We already fill the bitmap in ram_list_init_bitmaps() with ones, marking
> everything dirty - it didn't used to be that way, which is why we needed
> an explicit first bulk stage.
> 
> Let's simplify: make the bitmap the single source of thuth. Explicitly
> handle the "xbzrle_enabled after first round" case.
> 
> Regarding XBZRLE (implicitly handled via "ram_bulk_stage = false" right
> now), there is now a slight change in behavior:
> - Colo: When starting, it will be disabled (was implicitly enabled)
>    until the first round actually finishes.
> - Free page hinting: When starting, XBZRLE will be disabled (was implicitly
>    enabled) until the first round actually finished.
> - Snapshots: When starting, XBZRLE will be disabled. We essentially only
>    do a single run, so I guess it will never actually get disabled.
> 
> Postcopy seems to indirectly disable it in ram_save_page(), so there
> shouldn't be really any change.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Our dirty bitmap handling is right now a little confusing due to the bulk
> stage. Am i missing something important? Can someone comment on the
> expected XBZRLE handling? It all is a little bit too intertwined for my
> taste.
> 
> ---
>   hw/virtio/virtio-balloon.c |  4 +-
>   hw/virtio/virtio-mem.c     |  3 --
>   include/migration/misc.h   |  1 -
>   migration/ram.c            | 78 +++++++++-----------------------------
>   4 files changed, 18 insertions(+), 68 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e770955176..d162b89603 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -659,9 +659,6 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
>       }
>   
>       switch (pnd->reason) {
> -    case PRECOPY_NOTIFY_SETUP:
> -        precopy_enable_free_page_optimization();
> -        break;
>       case PRECOPY_NOTIFY_BEFORE_BITMAP_SYNC:
>           virtio_balloon_free_page_stop(dev);
>           break;
> @@ -681,6 +678,7 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
>            */
>           virtio_balloon_free_page_done(dev);
>           break;
> +    case PRECOPY_NOTIFY_SETUP:
>       case PRECOPY_NOTIFY_COMPLETE:
>           break;
>       default:
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 99d0712195..c7d261ffe7 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -1063,9 +1063,6 @@ static int virtio_mem_precopy_notify(NotifierWithReturn *n, void *data)
>       PrecopyNotifyData *pnd = data;
>   
>       switch (pnd->reason) {
> -    case PRECOPY_NOTIFY_SETUP:
> -        precopy_enable_free_page_optimization();
> -        break;
>       case PRECOPY_NOTIFY_AFTER_BITMAP_SYNC:
>           virtio_mem_precopy_exclude_unplugged(vmem);
>           break;
> diff --git a/include/migration/misc.h b/include/migration/misc.h
> index bccc1b6b44..69c7e7e14b 100644
> --- a/include/migration/misc.h
> +++ b/include/migration/misc.h
> @@ -37,7 +37,6 @@ void precopy_infrastructure_init(void);
>   void precopy_add_notifier(NotifierWithReturn *n);
>   void precopy_remove_notifier(NotifierWithReturn *n);
>   int precopy_notify(PrecopyNotifyReason reason, Error **errp);
> -void precopy_enable_free_page_optimization(void);
>   
>   void ram_mig_init(void);
>   void qemu_guest_free_page_hint(void *addr, size_t len);
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..7394a9c414 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -313,10 +313,6 @@ struct RAMState {
>       ram_addr_t last_page;
>       /* last ram version we have seen */
>       uint32_t last_version;
> -    /* We are in the first round */
> -    bool ram_bulk_stage;
> -    /* The free page optimization is enabled */
> -    bool fpo_enabled;
>       /* How many times we have dirty too many pages */
>       int dirty_rate_high_cnt;
>       /* these variables are used for bitmap sync */
> @@ -332,6 +328,8 @@ struct RAMState {
>       uint64_t xbzrle_pages_prev;
>       /* Amount of xbzrle encoded bytes since the beginning of the period */
>       uint64_t xbzrle_bytes_prev;
> +    /* Start using XBZRLE (e.g., after the first round). */
> +    bool xbzrle_enabled;
>   
>       /* compression statistics since the beginning of the period */
>       /* amount of count that no free thread to compress data */
> @@ -385,15 +383,6 @@ int precopy_notify(PrecopyNotifyReason reason, Error **errp)
>       return notifier_with_return_list_notify(&precopy_notifier_list, &pnd);
>   }
>   
> -void precopy_enable_free_page_optimization(void)
> -{
> -    if (!ram_state) {
> -        return;
> -    }
> -
> -    ram_state->fpo_enabled = true;
> -}
> -
>   uint64_t ram_bytes_remaining(void)
>   {
>       return ram_state ? (ram_state->migration_dirty_pages * TARGET_PAGE_SIZE) :
> @@ -666,7 +655,7 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
>    */
>   static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
>   {
> -    if (rs->ram_bulk_stage || !migrate_use_xbzrle()) {
> +    if (!rs->xbzrle_enabled) {
>           return;
>       }
>   
> @@ -794,23 +783,12 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
>   {
>       unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
>       unsigned long *bitmap = rb->bmap;
> -    unsigned long next;
>   
>       if (ramblock_is_ignored(rb)) {
>           return size;
>       }
>   
> -    /*
> -     * When the free page optimization is enabled, we need to check the bitmap
> -     * to send the non-free pages rather than all the pages in the bulk stage.
> -     */
> -    if (!rs->fpo_enabled && rs->ram_bulk_stage && start > 0) {
> -        next = start + 1;
> -    } else {
> -        next = find_next_bit(bitmap, size, start);
> -    }
> -
> -    return next;
> +    return find_next_bit(bitmap, size, start);
>   }
>   
>   static inline bool migration_bitmap_clear_dirty(RAMState *rs,
> @@ -1188,8 +1166,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss, bool last_stage)
>       trace_ram_save_page(block->idstr, (uint64_t)offset, p);
>   
>       XBZRLE_cache_lock();
> -    if (!rs->ram_bulk_stage && !migration_in_postcopy() &&
> -        migrate_use_xbzrle()) {
> +    if (rs->xbzrle_enabled && !migration_in_postcopy()) {
>           pages = save_xbzrle_page(rs, &p, current_addr, block,
>                                    offset, last_stage);
>           if (!last_stage) {
> @@ -1389,7 +1366,10 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>               pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
>               /* Flag that we've looped */
>               pss->complete_round = true;
> -            rs->ram_bulk_stage = false;
> +            /* After the first round, enable XBZRLE. */
> +            if (migrate_use_xbzrle()) {
> +                rs->xbzrle_enabled = true;
> +            }
>           }
>           /* Didn't find anything this time, but try again on the new block */
>           *again = true;
> @@ -1752,14 +1732,6 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>       }
>   
>       if (block) {
> -        /*
> -         * As soon as we start servicing pages out of order, then we have
> -         * to kill the bulk stage, since the bulk stage assumes
> -         * in (migration_bitmap_find_and_reset_dirty) that every page is
> -         * dirty, that's no longer true.
> -         */
> -        rs->ram_bulk_stage = false;
> -
>           /*
>            * We want the background search to continue from the queued page
>            * since the guest is likely to want other pages near to the page
> @@ -1872,15 +1844,15 @@ static bool save_page_use_compression(RAMState *rs)
>       }
>   
>       /*
> -     * If xbzrle is on, stop using the data compression after first
> -     * round of migration even if compression is enabled. In theory,
> -     * xbzrle can do better than compression.
> +     * If xbzrle is enabled (e.g., after first round of migration), stop
> +     * using the data compression. In theory, xbzrle can do better than
> +     * compression.
>        */
> -    if (rs->ram_bulk_stage || !migrate_use_xbzrle()) {
> -        return true;
> +    if (rs->xbzrle_enabled) {
> +        return false;
>       }
>   
> -    return false;
> +    return true;
>   }
>   
>   /*
> @@ -2187,8 +2159,7 @@ static void ram_state_reset(RAMState *rs)
>       rs->last_sent_block = NULL;
>       rs->last_page = 0;
>       rs->last_version = ram_list.version;
> -    rs->ram_bulk_stage = true;
> -    rs->fpo_enabled = false;
> +    rs->xbzrle_enabled = false;
>   }
>   
>   #define MAX_WAIT 50 /* ms, half buffered_file limit */
> @@ -2672,15 +2643,7 @@ static void ram_state_resume_prepare(RAMState *rs, QEMUFile *out)
>       /* This may not be aligned with current bitmaps. Recalculate. */
>       rs->migration_dirty_pages = pages;
>   
> -    rs->last_seen_block = NULL;
> -    rs->last_sent_block = NULL;
> -    rs->last_page = 0;
> -    rs->last_version = ram_list.version;
> -    /*
> -     * Disable the bulk stage, otherwise we'll resend the whole RAM no
> -     * matter what we have sent.
> -     */
> -    rs->ram_bulk_stage = false;
> +    ram_state_reset(rs);
>   
>       /* Update RAMState cache of output QEMUFile */
>       rs->f = out;
> @@ -3298,16 +3261,9 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
>       qemu_mutex_unlock(&decomp_done_lock);
>   }
>   
> - /*
> -  * we must set ram_bulk_stage to false, otherwise in
> -  * migation_bitmap_find_dirty the bitmap will be unused and
> -  * all the pages in ram cache wil be flushed to the ram of
> -  * secondary VM.
> -  */
>   static void colo_init_ram_state(void)
>   {
>       ram_state_init(&ram_state);
> -    ram_state->ram_bulk_stage = false;
>   }
>   
>   /*
> 

Let's refloat this one.

-- 
Thanks,

David / dhildenb


