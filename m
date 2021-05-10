Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB4379754
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:00:22 +0200 (CEST)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgB8f-0005o4-9r
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgB75-000555-6O
 for qemu-devel@nongnu.org; Mon, 10 May 2021 14:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgB6z-0007el-Uo
 for qemu-devel@nongnu.org; Mon, 10 May 2021 14:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620673116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xTw8peN7R0Yhf9RjNI5I4yUO3paY71J8Jm2pqZM3ImA=;
 b=HJeaNFXF92TNga2SeCqatx81HdHy82WMeFfLQgy03Ch/bTKPoRxGGZLTas604XX0UMgVXt
 dNgGBTmcaLp862lbmbLLFAtAmYB/V636Boec3pmaxv20A4xNcLMbVpJqJ5aD5PfjVbsDAw
 N7jrDm/UoDx8PMcBSTAvvbf/F0K+mhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-AuivwUP1N2G1ip34BlGViA-1; Mon, 10 May 2021 14:58:32 -0400
X-MC-Unique: AuivwUP1N2G1ip34BlGViA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9639107ACCA;
 Mon, 10 May 2021 18:58:31 +0000 (UTC)
Received: from work-vm (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7A860BF1;
 Mon, 10 May 2021 18:58:17 +0000 (UTC)
Date: Mon, 10 May 2021 19:58:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC] migrate/ram: remove "ram_bulk_stage" and "fpo_enabled"
Message-ID: <YJmCR2N0KzZ9wvVx@work-vm>
References: <20210216105039.40680-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210216105039.40680-1-david@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Juan Quintela <quintela@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
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

I think you're right here, so (at long last) queued.
I did read the comments on 6eeb63f which added the FPO flag, and I still
think you're right.

> Regarding XBZRLE (implicitly handled via "ram_bulk_stage = false" right
> now), there is now a slight change in behavior:
> - Colo: When starting, it will be disabled (was implicitly enabled)
>   until the first round actually finishes.

Was it or did they see a bulk stage again?
I can imagine that XBZRLE might be useful for COLO if subsequent rounds
of synchornisation finds pages that change but not much.

> - Free page hinting: When starting, XBZRLE will be disabled (was implicitly
>   enabled) until the first round actually finished.

But the XBZRLE cache would be empty anyway on that first round?

> - Snapshots: When starting, XBZRLE will be disabled. We essentially only
>   do a single run, so I guess it will never actually get disabled.
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

I think it's mostly due to there being no benefit (and a lot of cost) in
doing xbzrle during the first round.

Dave

> ---
>  hw/virtio/virtio-balloon.c |  4 +-
>  hw/virtio/virtio-mem.c     |  3 --
>  include/migration/misc.h   |  1 -
>  migration/ram.c            | 78 +++++++++-----------------------------
>  4 files changed, 18 insertions(+), 68 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e770955176..d162b89603 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -659,9 +659,6 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
>      }
>  
>      switch (pnd->reason) {
> -    case PRECOPY_NOTIFY_SETUP:
> -        precopy_enable_free_page_optimization();
> -        break;
>      case PRECOPY_NOTIFY_BEFORE_BITMAP_SYNC:
>          virtio_balloon_free_page_stop(dev);
>          break;
> @@ -681,6 +678,7 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
>           */
>          virtio_balloon_free_page_done(dev);
>          break;
> +    case PRECOPY_NOTIFY_SETUP:
>      case PRECOPY_NOTIFY_COMPLETE:
>          break;
>      default:
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 99d0712195..c7d261ffe7 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -1063,9 +1063,6 @@ static int virtio_mem_precopy_notify(NotifierWithReturn *n, void *data)
>      PrecopyNotifyData *pnd = data;
>  
>      switch (pnd->reason) {
> -    case PRECOPY_NOTIFY_SETUP:
> -        precopy_enable_free_page_optimization();
> -        break;
>      case PRECOPY_NOTIFY_AFTER_BITMAP_SYNC:
>          virtio_mem_precopy_exclude_unplugged(vmem);
>          break;
> diff --git a/include/migration/misc.h b/include/migration/misc.h
> index bccc1b6b44..69c7e7e14b 100644
> --- a/include/migration/misc.h
> +++ b/include/migration/misc.h
> @@ -37,7 +37,6 @@ void precopy_infrastructure_init(void);
>  void precopy_add_notifier(NotifierWithReturn *n);
>  void precopy_remove_notifier(NotifierWithReturn *n);
>  int precopy_notify(PrecopyNotifyReason reason, Error **errp);
> -void precopy_enable_free_page_optimization(void);
>  
>  void ram_mig_init(void);
>  void qemu_guest_free_page_hint(void *addr, size_t len);
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..7394a9c414 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -313,10 +313,6 @@ struct RAMState {
>      ram_addr_t last_page;
>      /* last ram version we have seen */
>      uint32_t last_version;
> -    /* We are in the first round */
> -    bool ram_bulk_stage;
> -    /* The free page optimization is enabled */
> -    bool fpo_enabled;
>      /* How many times we have dirty too many pages */
>      int dirty_rate_high_cnt;
>      /* these variables are used for bitmap sync */
> @@ -332,6 +328,8 @@ struct RAMState {
>      uint64_t xbzrle_pages_prev;
>      /* Amount of xbzrle encoded bytes since the beginning of the period */
>      uint64_t xbzrle_bytes_prev;
> +    /* Start using XBZRLE (e.g., after the first round). */
> +    bool xbzrle_enabled;
>  
>      /* compression statistics since the beginning of the period */
>      /* amount of count that no free thread to compress data */
> @@ -385,15 +383,6 @@ int precopy_notify(PrecopyNotifyReason reason, Error **errp)
>      return notifier_with_return_list_notify(&precopy_notifier_list, &pnd);
>  }
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
>  uint64_t ram_bytes_remaining(void)
>  {
>      return ram_state ? (ram_state->migration_dirty_pages * TARGET_PAGE_SIZE) :
> @@ -666,7 +655,7 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
>   */
>  static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
>  {
> -    if (rs->ram_bulk_stage || !migrate_use_xbzrle()) {
> +    if (!rs->xbzrle_enabled) {
>          return;
>      }
>  
> @@ -794,23 +783,12 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
>  {
>      unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
>      unsigned long *bitmap = rb->bmap;
> -    unsigned long next;
>  
>      if (ramblock_is_ignored(rb)) {
>          return size;
>      }
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
>  }
>  
>  static inline bool migration_bitmap_clear_dirty(RAMState *rs,
> @@ -1188,8 +1166,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss, bool last_stage)
>      trace_ram_save_page(block->idstr, (uint64_t)offset, p);
>  
>      XBZRLE_cache_lock();
> -    if (!rs->ram_bulk_stage && !migration_in_postcopy() &&
> -        migrate_use_xbzrle()) {
> +    if (rs->xbzrle_enabled && !migration_in_postcopy()) {
>          pages = save_xbzrle_page(rs, &p, current_addr, block,
>                                   offset, last_stage);
>          if (!last_stage) {
> @@ -1389,7 +1366,10 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>              pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
>              /* Flag that we've looped */
>              pss->complete_round = true;
> -            rs->ram_bulk_stage = false;
> +            /* After the first round, enable XBZRLE. */
> +            if (migrate_use_xbzrle()) {
> +                rs->xbzrle_enabled = true;
> +            }
>          }
>          /* Didn't find anything this time, but try again on the new block */
>          *again = true;
> @@ -1752,14 +1732,6 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>      }
>  
>      if (block) {
> -        /*
> -         * As soon as we start servicing pages out of order, then we have
> -         * to kill the bulk stage, since the bulk stage assumes
> -         * in (migration_bitmap_find_and_reset_dirty) that every page is
> -         * dirty, that's no longer true.
> -         */
> -        rs->ram_bulk_stage = false;
> -
>          /*
>           * We want the background search to continue from the queued page
>           * since the guest is likely to want other pages near to the page
> @@ -1872,15 +1844,15 @@ static bool save_page_use_compression(RAMState *rs)
>      }
>  
>      /*
> -     * If xbzrle is on, stop using the data compression after first
> -     * round of migration even if compression is enabled. In theory,
> -     * xbzrle can do better than compression.
> +     * If xbzrle is enabled (e.g., after first round of migration), stop
> +     * using the data compression. In theory, xbzrle can do better than
> +     * compression.
>       */
> -    if (rs->ram_bulk_stage || !migrate_use_xbzrle()) {
> -        return true;
> +    if (rs->xbzrle_enabled) {
> +        return false;
>      }
>  
> -    return false;
> +    return true;
>  }
>  
>  /*
> @@ -2187,8 +2159,7 @@ static void ram_state_reset(RAMState *rs)
>      rs->last_sent_block = NULL;
>      rs->last_page = 0;
>      rs->last_version = ram_list.version;
> -    rs->ram_bulk_stage = true;
> -    rs->fpo_enabled = false;
> +    rs->xbzrle_enabled = false;
>  }
>  
>  #define MAX_WAIT 50 /* ms, half buffered_file limit */
> @@ -2672,15 +2643,7 @@ static void ram_state_resume_prepare(RAMState *rs, QEMUFile *out)
>      /* This may not be aligned with current bitmaps. Recalculate. */
>      rs->migration_dirty_pages = pages;
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
>      /* Update RAMState cache of output QEMUFile */
>      rs->f = out;
> @@ -3298,16 +3261,9 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
>      qemu_mutex_unlock(&decomp_done_lock);
>  }
>  
> - /*
> -  * we must set ram_bulk_stage to false, otherwise in
> -  * migation_bitmap_find_dirty the bitmap will be unused and
> -  * all the pages in ram cache wil be flushed to the ram of
> -  * secondary VM.
> -  */
>  static void colo_init_ram_state(void)
>  {
>      ram_state_init(&ram_state);
> -    ram_state->ram_bulk_stage = false;
>  }
>  
>  /*
> -- 
> 2.29.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


