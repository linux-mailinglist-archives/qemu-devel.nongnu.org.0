Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E43AB78C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:31:06 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lttyz-00086h-Ec
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lttxA-0007MZ-Cl
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lttx8-00039d-Cp
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623943749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcBSxuYQ5LvY0M3zDBLdMN46yaj3YbmACLhgS6HtYgg=;
 b=Trenwr8MduaReBGy+dmccd2/8DoDHlF9t4d0gUszZ/FlnTzqsqQVTKXSOn0fgWCHuVOE+l
 YBvIFijMRFPj+aM4KwQ7l3dl4WzHxx8I7kmFv6y1PyrFDZ8h5YtIxHD6a95iVQN0nctJDH
 +kQZbhw4YNpD9vpCOk+p3TClr+fJEwU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-TikT4rOUNLy-aUsk0vNhag-1; Thu, 17 Jun 2021 11:29:08 -0400
X-MC-Unique: TikT4rOUNLy-aUsk0vNhag-1
Received: by mail-qv1-f72.google.com with SMTP id
 g17-20020a0caad10000b029021886e075f0so1052774qvb.15
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vcBSxuYQ5LvY0M3zDBLdMN46yaj3YbmACLhgS6HtYgg=;
 b=t3AJ0bNh331APMViL/WPbl1zZsTJFaFTZzdv/hIvFbocUZJkDvxYVBgBa4OTOD0QX9
 w/24EA5joif1KxCnRVz0sxfv8DIM93KI2o7lBpi/+7i8lUFi/PqJUmKpqBPPl0I1pA8E
 /gyGAIs9iZOBaym/KRfvnxkaFisHbyuKNdUXdZUNi2voRqucWlQequZqrqmn2r2Id2LO
 4gYa8olFVI275xyR8O8Ar3385/2gHVYTz/5zwUGzuks2mqOcP9mTrEVgGGg9o20T6lJP
 jWYELqqZHIR3fCl4A4y+aKyxjxjBKPlwjTQmMz3Pe6Be1Nq3g6qVH5320Mx4lTRW6Mhn
 TP+A==
X-Gm-Message-State: AOAM533iQc08t+C5ekbRaHrn6yfmr/vAWsN4P1rEUr6s59CM/lgjb8Qb
 Nk+2/u7+heivsdEZyqFio4Es3wXc2sssvKW0p4KqY7s5LQgtL7nILk9CyOYmGaQBeBBZjYnYb21
 bYInPqWcD57/haH4=
X-Received: by 2002:ac8:5716:: with SMTP id 22mr5593679qtw.82.1623943748070;
 Thu, 17 Jun 2021 08:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVPCo1OVCOGwY6Chxn6dDRuQ1DNxP9Sk4cbxQziW0L2bPpziZgj+EWD5zxlcGz+pqVsjwxZQ==
X-Received: by 2002:ac8:5716:: with SMTP id 22mr5593657qtw.82.1623943747866;
 Thu, 17 Jun 2021 08:29:07 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v16sm1944710qkj.10.2021.06.17.08.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:29:07 -0700 (PDT)
Date: Thu, 17 Jun 2021 11:29:06 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 3/7] memory: make global_dirty_tracking a bitmask
Message-ID: <YMtqQgQ/Od4VoQs4@t490s>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
 <84315f2dc01b4a2b50e280686043b7649abb98bf.1623938622.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <84315f2dc01b4a2b50e280686043b7649abb98bf.1623938622.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 10:12:04PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> dirty rate measurement may start or stop dirty tracking during
> calculation. this conflict with migration because stop dirty
> tracking make migration leave dirty pages out then that'll be
> a problem.
> 
> make global_dirty_tracking a bitmask can let both migration and
> dirty rate measurement work fine. introduce GLOBAL_DIRTY_MIGRATION
> and GLOBAL_DIRTY_DIRTY_RATE to distinguish what current dirty
> tracking aims for, migration or dirty rate.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/exec/memory.h | 18 +++++++++++++++---
>  migration/ram.c       |  8 ++++----
>  softmmu/memory.c      | 32 +++++++++++++++++++++++---------
>  softmmu/trace-events  |  1 +
>  4 files changed, 43 insertions(+), 16 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index cc0e549..63694dc 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -55,7 +55,15 @@ static inline void fuzz_dma_read_cb(size_t addr,
>  }
>  #endif
>  
> -extern bool global_dirty_tracking;
> +/* Possible bits for global_dirty_log */
> +
> +/* Dirty tracking enabled because migration is running */
> +#define GLOBAL_DIRTY_MIGRATION  (1U << 0)
> +
> +/* Dirty tracking enabled because measuring dirty rate */
> +#define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
> +
> +extern unsigned int global_dirty_tracking;
>  
>  typedef struct MemoryRegionOps MemoryRegionOps;
>  
> @@ -2099,13 +2107,17 @@ void memory_listener_unregister(MemoryListener *listener);
>  
>  /**
>   * memory_global_dirty_log_start: begin dirty logging for all regions
> + *
> + * @flags: purpose of starting dirty log, migration or dirty rate
>   */
> -void memory_global_dirty_log_start(void);
> +void memory_global_dirty_log_start(unsigned int flags);
>  
>  /**
>   * memory_global_dirty_log_stop: end dirty logging for all regions
> + *
> + * @flags: purpose of stopping dirty log, migration or dirty rate
>   */
> -void memory_global_dirty_log_stop(void);
> +void memory_global_dirty_log_stop(unsigned int flags);
>  
>  void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled);
>  
> diff --git a/migration/ram.c b/migration/ram.c
> index 60ea913..9ce31af 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2190,7 +2190,7 @@ static void ram_save_cleanup(void *opaque)
>          /* caller have hold iothread lock or is in a bh, so there is
>           * no writing race against the migration bitmap
>           */
> -        memory_global_dirty_log_stop();
> +        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
>      }
>  
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> @@ -2652,7 +2652,7 @@ static void ram_init_bitmaps(RAMState *rs)
>          ram_list_init_bitmaps();
>          /* We don't use dirty log with background snapshots */
>          if (!migrate_background_snapshot()) {
> -            memory_global_dirty_log_start();
> +            memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
>              migration_bitmap_sync_precopy(rs);
>          }
>      }
> @@ -3393,7 +3393,7 @@ void colo_incoming_start_dirty_log(void)
>              /* Discard this dirty bitmap record */
>              bitmap_zero(block->bmap, block->max_length >> TARGET_PAGE_BITS);
>          }
> -        memory_global_dirty_log_start();
> +        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
>      }
>      ram_state->migration_dirty_pages = 0;
>      qemu_mutex_unlock_ramlist();
> @@ -3405,7 +3405,7 @@ void colo_release_ram_cache(void)
>  {
>      RAMBlock *block;
>  
> -    memory_global_dirty_log_stop();
> +    memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>          g_free(block->bmap);
>          block->bmap = NULL;
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 5682053..432cec8 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -39,7 +39,7 @@
>  static unsigned memory_region_transaction_depth;
>  static bool memory_region_update_pending;
>  static bool ioeventfd_update_pending;
> -bool global_dirty_tracking;
> +unsigned int global_dirty_tracking;
>  
>  static QTAILQ_HEAD(, MemoryListener) memory_listeners
>      = QTAILQ_HEAD_INITIALIZER(memory_listeners);
> @@ -2659,14 +2659,19 @@ void memory_global_after_dirty_log_sync(void)
>  
>  static VMChangeStateEntry *vmstate_change;
>  
> -void memory_global_dirty_log_start(void)
> +void memory_global_dirty_log_start(unsigned int flags)
>  {
>      if (vmstate_change) {
>          qemu_del_vm_change_state_handler(vmstate_change);
>          vmstate_change = NULL;
>      }
>  
> -    global_dirty_tracking = true;
> +#define  GLOBAL_DIRTY_MASK  (0x3)

I should raised this earlier... but I think better move this macro to the
defines of the bits.

> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
> +    assert(!(global_dirty_tracking & flags));
> +    global_dirty_tracking |= flags;
> +
> +    trace_global_dirty_changed(global_dirty_tracking);
>  
>      MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
>  
> @@ -2676,9 +2681,13 @@ void memory_global_dirty_log_start(void)
>      memory_region_transaction_commit();
>  }
>  
> -static void memory_global_dirty_log_do_stop(void)
> +static void memory_global_dirty_log_do_stop(unsigned int flags)
>  {
> -    global_dirty_tracking = false;
> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
> +    assert((global_dirty_tracking & flags) == flags);
> +    global_dirty_tracking &= ~flags;
> +
> +    trace_global_dirty_changed(global_dirty_tracking);
>  
>      /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
>      memory_region_transaction_begin();
> @@ -2691,8 +2700,10 @@ static void memory_global_dirty_log_do_stop(void)
>  static void memory_vm_change_state_handler(void *opaque, bool running,
>                                             RunState state)
>  {
> +    unsigned int *flags = opaque;
>      if (running) {
> -        memory_global_dirty_log_do_stop();
> +        memory_global_dirty_log_do_stop(*flags);
> +        g_free(opaque);
>  
>          if (vmstate_change) {
>              qemu_del_vm_change_state_handler(vmstate_change);
> @@ -2701,18 +2712,21 @@ static void memory_vm_change_state_handler(void *opaque, bool running,
>      }
>  }
>  
> -void memory_global_dirty_log_stop(void)
> +void memory_global_dirty_log_stop(unsigned int flags)
>  {
> +    unsigned int *opaque = NULL;
>      if (!runstate_is_running()) {
>          if (vmstate_change) {
>              return;
>          }
> +        opaque = g_malloc0(sizeof(opaque));
> +        *opaque = flags;

Here the flags can be directly casted into a "void *" so we could avoid
malloc/free.  You call..

I also still think it's easier to squash previous renaming patch into this one.

Thanks,

>          vmstate_change = qemu_add_vm_change_state_handler(
> -                                memory_vm_change_state_handler, NULL);
> +                         memory_vm_change_state_handler, opaque);
>          return;
>      }
>  
> -    memory_global_dirty_log_do_stop();
> +    memory_global_dirty_log_do_stop(flags);
>  }

-- 
Peter Xu


