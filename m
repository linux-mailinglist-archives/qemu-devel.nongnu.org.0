Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2C3C75F6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 19:50:47 +0200 (CEST)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3MYQ-0005UY-SW
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 13:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3MX3-00048V-8c
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3MX1-0003Y9-8d
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626198558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fV1nPO1knmqZBhBcyZfREFWi8lmcKl6osod6nBR3Gw=;
 b=JmnXecOUJ8jSeivkZVziMrHD3aSw+XtiR/RVwODoLmC/fIKxn6CgMO96vqlHK+TCDmV3o6
 ZVsBZgIr8kDJ3/x22pwKjZyQJuSYwsnzjQJA84crHvKR055gGdbNM9yaqlzRYBI9X5Aul2
 X5dqD3/jb+vaeYI7ZfScPIFyrtDuEmE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-4k8JKr3jPdGn51Hfqy12gg-1; Tue, 13 Jul 2021 13:49:17 -0400
X-MC-Unique: 4k8JKr3jPdGn51Hfqy12gg-1
Received: by mail-qv1-f69.google.com with SMTP id
 t15-20020a056214036fb02902dc72b5283dso12371647qvu.23
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 10:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1fV1nPO1knmqZBhBcyZfREFWi8lmcKl6osod6nBR3Gw=;
 b=BKDv7B9TnOk665kZEOEQcL0wE71LmovNAK6n8RQiwluZbaMnDqmqwk6CpKf6Jimbs5
 0r7OfxfjkMIE70zQyfr8R6eewOkyyjpTT0qqqesJ9lVQQ6q13mS6g9vDK2/SURHrKlyb
 QsyzsFtxnGm8plaoYshKMZYVd4YEQ6odYNjrsaDSzsmwmMk+m4GtuKBUZS29Ej8AoFRj
 jwX4pIYZeMU/qOri6T606ZK0N9WSdEyRogXNQwPTQlpn1yOIHlToxOeoe/2eTx9TEyBs
 OU0XNCZ94HE3WiG1quIZtXked1YMqT7m9RgGteD5uArK5e+giyANg7JkxwsghZTOR9V9
 4GhQ==
X-Gm-Message-State: AOAM530ddrKNlVkuDi3s0Oiffxo4TgOseVswz+n3ad6M/5iKJYjOFfDr
 LGunYkddbwrhxE9SthgI+LNPg/qArXwfxYu6LKqUnJEXQlLBloxX+xW1V8rCUtY3kOOJhLhn4+O
 hMqqBmTN8yU9CaQo=
X-Received: by 2002:a05:6214:846:: with SMTP id
 dg6mr6185088qvb.9.1626198557005; 
 Tue, 13 Jul 2021 10:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx89NCOBzUtwx7e97DtgcFzMrMXGaiyAzeGVGkw4TEuamzzVlSXqzj+JcKZrXVd1uo9LS6+eA==
X-Received: by 2002:a05:6214:846:: with SMTP id
 dg6mr6185071qvb.9.1626198556835; 
 Tue, 13 Jul 2021 10:49:16 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o13sm8294172qkg.124.2021.07.13.10.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 10:49:15 -0700 (PDT)
Date: Tue, 13 Jul 2021 13:49:14 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v2 2/3] memory: introduce DirtyRateIncreasedPages and
 util function
Message-ID: <YO3SGiua/OCGViJk@t490s>
References: <cover.1626108969.git.huangy81@chinatelecom.cn>
 <c27c904f46644f29ef3bae9e9e1205aa3a666fd3.1626108969.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <c27c904f46644f29ef3bae9e9e1205aa3a666fd3.1626108969.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Tue, Jul 13, 2021 at 12:56:51AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> introduce DirtyRateIncreasedPages to stat the increased dirty pages
> during the calculation time along with ramblock_sync_dirty_bitmap.
> 
> introduce util functions to setup the DIRTY_MEMORY_MIGRATION
> dirty bits for the convenience of tracking dirty bitmap when
> calculating dirtyrate.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/exec/ram_addr.h | 87 ++++++++++++++++++++++++++++++++++++++++++++-----
>  softmmu/physmem.c       | 35 ++++++++++++++++++++
>  2 files changed, 113 insertions(+), 9 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 45c9132..c47d1a7 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -26,6 +26,8 @@
>  #include "exec/ramlist.h"
>  #include "exec/ramblock.h"
>  
> +static uint64_t DirtyRateIncreasedPages = 0;

This looks odd already itself; per my understanding defining a static in a
header file will define one variable for each .c file including it.  This could
lead to each .c file increase its own variable and other .c files read zeros, iiuc.

If we need a global we should define it in a .c file and here we define with
"extern" to reference it in other .c files.

> +
>  /**
>   * clear_bmap_size: calculate clear bitmap size
>   *
> @@ -422,6 +424,9 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
>                                                ram_addr_t length,
>                                                unsigned client);
>  
> +void cpu_physical_memory_dirtyrate_clear_bit(ram_addr_t start,
> +                                             ram_addr_t length);
> +
>  DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
>      (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client);
>  
> @@ -449,6 +454,8 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>      uint64_t num_dirty = 0;
>      unsigned long *dest = rb->bmap;
>  
> +    assert(global_dirty_tracking);
> +
>      /* start address and length is aligned at the start of a word? */
>      if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) ==
>           (start + rb->offset) &&
> @@ -466,12 +473,20 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>  
>          for (k = page; k < page + nr; k++) {
>              if (src[idx][offset]) {
> -                unsigned long bits = qatomic_xchg(&src[idx][offset], 0);
> -                unsigned long new_dirty;
> -                new_dirty = ~dest[k];
> -                dest[k] |= bits;
> -                new_dirty &= bits;
> -                num_dirty += ctpopl(new_dirty);
> +                unsigned long bits;
> +                if (global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
> +                    bits = qatomic_read(&src[idx][offset]);
> +                    DirtyRateIncreasedPages += ctpopl(bits);
> +                }
> +
> +                if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
> +                    unsigned long new_dirty;
> +                    bits = qatomic_xchg(&src[idx][offset], 0);
> +                    new_dirty = ~dest[k];
> +                    dest[k] |= bits;
> +                    new_dirty &= bits;
> +                    num_dirty += ctpopl(new_dirty);
> +                }
>              }
>  
>              if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {

Please see my other reply in previous version's cover letter.

IMHO cpu_physical_memory_sync_dirty_bitmap() should be kept untouched.  Then
below functions are not needed either.

Thanks,

> @@ -500,9 +515,15 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>                          start + addr + offset,
>                          TARGET_PAGE_SIZE,
>                          DIRTY_MEMORY_MIGRATION)) {
> -                long k = (start + addr) >> TARGET_PAGE_BITS;
> -                if (!test_and_set_bit(k, dest)) {
> -                    num_dirty++;
> +                if (global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
> +                    DirtyRateIncreasedPages++;
> +                }
> +
> +                if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
> +                    long k = (start + addr) >> TARGET_PAGE_BITS;
> +                    if (!test_and_set_bit(k, dest)) {
> +                        num_dirty++;
> +                    }
>                  }
>              }
>          }
> @@ -510,5 +531,53 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>  
>      return num_dirty;
>  }
> +
> +static inline
> +void cpu_physical_memory_dirtyrate_clear_dirty_bits(RAMBlock *rb)
> +{
> +    ram_addr_t addr;
> +    ram_addr_t length = rb->used_length;
> +    unsigned long word = BIT_WORD(rb->offset >> TARGET_PAGE_BITS);
> +
> +    /* start address and length is aligned at the start of a word? */
> +    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) == rb->offset &&
> +        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
> +        int k;
> +        int nr = BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
> +        unsigned long * const *src;
> +        unsigned long idx = (word * BITS_PER_LONG) / DIRTY_MEMORY_BLOCK_SIZE;
> +        unsigned long offset = BIT_WORD((word * BITS_PER_LONG) %
> +                                        DIRTY_MEMORY_BLOCK_SIZE);
> +
> +        src = qatomic_rcu_read(
> +                &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
> +
> +        for (k = 0; k < nr; k++) {
> +            if (src[idx][offset]) {
> +                qatomic_set(&src[idx][offset], 0);
> +            }
> +            if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
> +                offset = 0;
> +                idx++;
> +            }
> +        }
> +    } else {
> +        ram_addr_t offset = rb->offset;
> +
> +        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
> +            cpu_physical_memory_dirtyrate_clear_bit(addr + offset,
> +                                                    TARGET_PAGE_SIZE);
> +        }
> +    }
> +
> +    return;
> +}
> +
> +static inline
> +void cpu_physical_memory_dirtyrate_reset_protect(RAMBlock *rb)
> +{
> +    memory_region_clear_dirty_bitmap(rb->mr, 0, rb->used_length);
> +    cpu_physical_memory_dirtyrate_clear_dirty_bits(rb);
> +}
>  #endif
>  #endif
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3c1912a..67cff31 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1068,6 +1068,41 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
>      return dirty;
>  }
>  
> +void cpu_physical_memory_dirtyrate_clear_bit(ram_addr_t start,
> +                                             ram_addr_t length)
> +{
> +    DirtyMemoryBlocks *blocks;
> +    unsigned long end, page;
> +    RAMBlock *ramblock;
> +
> +    if (length == 0) {
> +        return;
> +    }
> +
> +    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
> +    page = start >> TARGET_PAGE_BITS;
> +
> +    WITH_RCU_READ_LOCK_GUARD() {
> +        blocks =
> +            qatomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]);
> +        ramblock = qemu_get_ram_block(start);
> +        /* Range sanity check on the ramblock */
> +        assert(start >= ramblock->offset &&
> +               start + length <= ramblock->offset + ramblock->used_length);
> +        while (page < end) {
> +            unsigned long idx = page / DIRTY_MEMORY_BLOCK_SIZE;
> +            unsigned long offset = page % DIRTY_MEMORY_BLOCK_SIZE;
> +            unsigned long num = MIN(end - page,
> +                                    DIRTY_MEMORY_BLOCK_SIZE - offset);
> +
> +            clear_bit(num, blocks->blocks[idx]);
> +            page += num;
> +        }
> +    }
> +
> +    return;
> +}
> +
>  DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
>      (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client)
>  {
> -- 
> 1.8.3.1
> 

-- 
Peter Xu


