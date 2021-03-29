Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309C34CFAA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 14:05:15 +0200 (CEST)
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqdt-0006Eu-S7
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 08:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lQqbz-0005MK-DP
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lQqbx-0006A4-IF
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617019392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jIeG0aiGJvFD417JkZYo5YrdBQIBxVr42m5szL6O52c=;
 b=YzUAg8EmE9mBbhVPctQ4/XoQ7vbCkhB0o8MSO9+8k7JgdEth9577/76LYVsGHSN8Pg/Agf
 L7TKv1UPXPVV/FHiGtO8JYN8RUOCYAjg1krhzgGsQ1fzTUkfx8Fkx7LzSJ3knJA8qxSW1E
 fxywa0osHp7wkqCmQj/xer/m9sIkHZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-0DFnNf44MVKoX6BURn9z6A-1; Mon, 29 Mar 2021 08:03:10 -0400
X-MC-Unique: 0DFnNf44MVKoX6BURn9z6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 403B3107BEFD;
 Mon, 29 Mar 2021 12:03:09 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69E8F5C582;
 Mon, 29 Mar 2021 12:03:07 +0000 (UTC)
Date: Mon, 29 Mar 2021 13:03:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH v4 08/10] Reduce the PVM stop time during Checkpoint
Message-ID: <YGHB+Pdvmwb0FgIg@work-vm>
References: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
 <1616639091-28279-9-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1616639091-28279-9-git-send-email-lei.rao@intel.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lukasstraub2@web.de, lizhijian@cn.fujitsu.com, quintela@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, chen.zhang@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* leirao (lei.rao@intel.com) wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
> 
> When flushing memory from ram cache to ram during every checkpoint
> on secondary VM, we can copy continuous chunks of memory instead of
> 4096 bytes per time to reduce the time of VM stop during checkpoint.
> 
> Signed-off-by: Lei Rao <lei.rao@intel.com>

A minor comment below, but :

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index c69a8e0..a258466 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -822,6 +822,39 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
>      return next;
>  }
>  
> +/*
> + * colo_bitmap_find_diry:find contiguous dirty pages from start
> + *
> + * Returns the page offset within memory region of the start of the contiguout
> + * dirty page
> + *
> + * @rs: current RAM state
> + * @rb: RAMBlock where to search for dirty pages
> + * @start: page where we start the search
> + * @num: the number of contiguous dirty pages
> + */
> +static inline
> +unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
> +                                     unsigned long start, unsigned long *num)
> +{
> +    unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
> +    unsigned long *bitmap = rb->bmap;
> +    unsigned long first, next;

It might be better to add the 
       *num = 0

here, which means this function always writes num

> +    if (ramblock_is_ignored(rb)) {
> +        return size;
> +    }
> +
> +    first = find_next_bit(bitmap, size, start);
> +    if (first >= size) {
> +        return first;
> +    }
> +    next = find_next_zero_bit(bitmap, size, first + 1);
> +    assert(next >= first);
> +    *num = next - first;
> +    return first;
> +}
> +
>  static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>                                                  RAMBlock *rb,
>                                                  unsigned long page)
> @@ -3666,6 +3699,8 @@ void colo_flush_ram_cache(void)
>      void *dst_host;
>      void *src_host;
>      unsigned long offset = 0;
> +    unsigned long num = 0;

that could move inside the while loop.

> +    unsigned long i = 0;

This line could move inside the 'else' clause below that uses it.

>      memory_global_dirty_log_sync();
>      WITH_RCU_READ_LOCK_GUARD() {
> @@ -3679,19 +3714,23 @@ void colo_flush_ram_cache(void)
>          block = QLIST_FIRST_RCU(&ram_list.blocks);
>  
>          while (block) {
> -            offset = migration_bitmap_find_dirty(ram_state, block, offset);
> +            offset = colo_bitmap_find_dirty(ram_state, block, offset, &num);
>  
>              if (((ram_addr_t)offset) << TARGET_PAGE_BITS
>                  >= block->used_length) {
>                  offset = 0;
> +                num = 0;
>                  block = QLIST_NEXT_RCU(block, next);
>              } else {
> -                migration_bitmap_clear_dirty(ram_state, block, offset);
> +                for (i = 0; i < num; i++) {
> +                    migration_bitmap_clear_dirty(ram_state, block, offset + i);
> +                }
>                  dst_host = block->host
>                           + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
>                  src_host = block->colo_cache
>                           + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
> -                memcpy(dst_host, src_host, TARGET_PAGE_SIZE);
> +                memcpy(dst_host, src_host, TARGET_PAGE_SIZE * num);
> +                offset += num;

I was initially confused as to why the old code didn't have an offset++
but I guess that means it just checked the bit a second time that was
just cleared.

Dave


>              }
>          }
>      }
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


