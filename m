Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215183C9BCD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 11:29:36 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3xgU-0006NQ-Om
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 05:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3xfg-0005gt-Pk
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:28:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3xfd-0004SU-1K
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626341318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3Ml8+7yrvWC4YS2sTZ2UJPZkxEfHr2uz5fi00IEgFA=;
 b=YujcL5QJnwxndb8UOHIy2ox4hxNHtmV1P6S10sYK1w/ncv2/k7GoVptmkd/LCtJBa2JzRF
 S6X/KREYmvkUl7ex6VaJX+5cFEadRNEfzQhffNCAwnA4nNB9h2+LVsNxLNMpscAciDLqJW
 hfJZ3CBTvK+GsirZdhKfgdhBKETfLYY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-BUUoy0w5PBCVbWnk9sq3Vw-1; Thu, 15 Jul 2021 05:28:37 -0400
X-MC-Unique: BUUoy0w5PBCVbWnk9sq3Vw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so3031741wrc.20
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 02:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=P3Ml8+7yrvWC4YS2sTZ2UJPZkxEfHr2uz5fi00IEgFA=;
 b=kD9Cz1zv2efxhiWWxU1zEV7Iwb6TnZ75RVyDS8dqlwb2maXSVLInk7KEDBrO1P2IrF
 BUpEbVL5WKWkXBzsfTXC7jaehCelnN1k6IUTvoCe8/eiSgH95mrT1HtkFwS9yhPjQWFa
 /KGAvQKD67ZxjN1FLx6T91YgXTwUi9XIIVZci89qbfASUrx32wlhA4Dq8BI/g1e9hHWT
 bKJ/NgwHPy7Oer81/Nt1OE7Vw6xF1WKb4rExageyCrAQfHiFdkw/GTYOnOSaTBANuQZs
 soJDruaLz1IXBTsCNa4GOnJ7HUDTfZsakCn4M4Da8D6jCQcJIy+z2o3XuCVBPT0buCBY
 P1Pw==
X-Gm-Message-State: AOAM5305lDaXQONWiqA9xc/VVTG0P/uyr5Q3rcuZq06P+q+618ZPbQQd
 FPr1X53TipajchSAKd+BJ++vdFj2AE1h6Riz6jdXKTA5Zg/OFHg30Znwg0nvOxNSwZVQQxPLCWr
 Yd+ZBrED8PGuZllU=
X-Received: by 2002:adf:f848:: with SMTP id d8mr4490847wrq.308.1626341316240; 
 Thu, 15 Jul 2021 02:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf+B+a6syGSYMuTg11vtM70ta1z8ZJK4y/q2RqT/UKR83C6xJcJOu/6YpDANvPdSe4Ic4Arw==
X-Received: by 2002:adf:f848:: with SMTP id d8mr4490820wrq.308.1626341316005; 
 Thu, 15 Jul 2021 02:28:36 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bb3.dip0.t-ipconnect.de. [79.242.59.179])
 by smtp.gmail.com with ESMTPSA id h20sm722022wmb.17.2021.07.15.02.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:28:35 -0700 (PDT)
To: Wei Wang <wei.w.wang@intel.com>, qemu-devel@nongnu.org
References: <20210715075326.421977-1-wei.w.wang@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] migration: clear the memory region dirty bitmap when
 skipping free pages
Message-ID: <2581d2a2-de9d-7937-4d71-25a33cfbce3e@redhat.com>
Date: Thu, 15 Jul 2021 11:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715075326.421977-1-wei.w.wang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: mst@redhat.com, dgilbert@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.07.21 09:53, Wei Wang wrote:
> When skipping free pages to send, their corresponding dirty bits in the
> memory region dirty bitmap need to be cleared. Otherwise the skipped
> pages will be sent in the next round after the migration thread syncs
> dirty bits from the memory region dirty bitmap.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Reported-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> ---
>   migration/ram.c | 72 ++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 54 insertions(+), 18 deletions(-)
> 
> v1->v2 changelog:
> - move migration_clear_memory_region_dirty_bitmap under bitmap_mutex as
>    we lack confidence to have it outside the lock for now.
> - clean the unnecessary subproject commit.
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b5fc454b2f..69e06b55ec 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -789,6 +789,51 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
>       return find_next_bit(bitmap, size, start);
>   }
>   
> +static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
> +                                                       RAMBlock *rb,
> +                                                       unsigned long page)
> +{
> +    uint8_t shift;
> +    hwaddr size, start;
> +
> +    if (!rb->clear_bmap || !clear_bmap_test_and_clear(rb, page)) {
> +        return;
> +    }
> +
> +    shift = rb->clear_bmap_shift;

You could initialize this right at the beginning of the function without doing any harm.

> +    /*
> +     * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
> +     * can make things easier sometimes since then start address
> +     * of the small chunk will always be 64 pages aligned so the
> +     * bitmap will always be aligned to unsigned long. We should
> +     * even be able to remove this restriction but I'm simply
> +     * keeping it.
> +     */
> +    assert(shift >= 6);
> +
> +    size = 1ULL << (TARGET_PAGE_BITS + shift);
> +    start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);

these as well as.

> +    trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
> +    memory_region_clear_dirty_bitmap(rb->mr, start, size);
> +}
> +
> +static void
> +migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
> +                                                 RAMBlock *rb,
> +                                                 unsigned long start,
> +                                                 unsigned long npages)
> +{
> +    unsigned long page_to_clear, i, nchunks;
> +    unsigned long chunk_pages = 1UL << rb->clear_bmap_shift;
> +
> +    nchunks = (start + npages) / chunk_pages - start / chunk_pages + 1;

Wouldn't you have to align the start and the end range up/down
to properly calculate the number of chunks?

The following might be better and a little easier to grasp:

unsigned long chunk_pages = 1ULL << rb->clear_bmap_shift;
unsigned long aligned_start = QEMU_ALIGN_DOWN(start, chunk_pages);
unsigned long aligned_end = QEMU_ALIGN_UP(start + npages, chunk_pages)

/*
  * Clear the clar_bmap of all covered chunks. It's sufficient to call it for
  * one page within a chunk.
  */
for (start = aligned_start, start != aligned_end, start += chunk_pages) {
     migration_clear_memory_region_dirty_bitmap(rs, rb, start);
}

> +
> +    for (i = 0; i < nchunks; i++) {
> +        page_to_clear = start + i * chunk_pages;
> +        migration_clear_memory_region_dirty_bitmap(rs, rb, page_to_clear);
> +    }
> +}
> +
>   static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>                                                   RAMBlock *rb,
>                                                   unsigned long page)
> @@ -803,26 +848,9 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>        * the page in the chunk we clear the remote dirty bitmap for all.
>        * Clearing it earlier won't be a problem, but too late will.
>        */
> -    if (rb->clear_bmap && clear_bmap_test_and_clear(rb, page)) {
> -        uint8_t shift = rb->clear_bmap_shift;
> -        hwaddr size = 1ULL << (TARGET_PAGE_BITS + shift);
> -        hwaddr start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
> -
> -        /*
> -         * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
> -         * can make things easier sometimes since then start address
> -         * of the small chunk will always be 64 pages aligned so the
> -         * bitmap will always be aligned to unsigned long.  We should
> -         * even be able to remove this restriction but I'm simply
> -         * keeping it.
> -         */
> -        assert(shift >= 6);
> -        trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
> -        memory_region_clear_dirty_bitmap(rb->mr, start, size);
> -    }
> +    migration_clear_memory_region_dirty_bitmap(rs, rb, page);
>   
>       ret = test_and_clear_bit(page, rb->bmap);
> -

unrelated change but ok for me.

>       if (ret) {
>           rs->migration_dirty_pages--;
>       }
> @@ -2741,6 +2769,14 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
>           npages = used_len >> TARGET_PAGE_BITS;
>   
>           qemu_mutex_lock(&ram_state->bitmap_mutex);
> +        /*
> +         * The skipped free pages are equavelent to be sent from clear_bmap's

s/equavelent/equivalent/

> +         * perspective, so clear the bits from the memory region bitmap which
> +         * are initially set. Otherwise those skipped pages will be sent in
> +         * the next round after syncing from the memory region bitmap.
> +         */
> +        migration_clear_memory_region_dirty_bitmap_range(ram_state, block,
> +                                                         start, npages);
>           ram_state->migration_dirty_pages -=
>                         bitmap_count_one_with_offset(block->bmap, start, npages);
>           bitmap_clear(block->bmap, start, npages);
> 

Apart from that, lgtm.

(although I find the use of "start" to describe a PFN and not an
address very confusing, but it's already in the current code ...
start_pfn or just pfn as used in the kernel would be much clearer)

-- 
Thanks,

David / dhildenb


