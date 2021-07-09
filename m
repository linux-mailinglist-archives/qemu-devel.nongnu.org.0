Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB53C2902
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 20:27:27 +0200 (CEST)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1vDi-0001o2-Qs
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 14:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1vCU-0000NB-9a
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1vCP-0006Yn-1A
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625855164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DV2rbmRUe69ShaICIBPHnjo67qMvctULrVgnxhNHG8=;
 b=FWQZKdlsbpwDuMQGm29wbmzbDB307SWFxbZH12VoiOYH/TsqLyQUQGFcxWVW6EkxgKkrzR
 RtB28Wqm+xj0P2XmtBtBY9q44LLccUl/7+zr13FFyAYPV6wHh9KKsHcDOLJdiNAp4Kcapu
 GpsC5v6aNAUxB5oNuaVQLQMeauqnjkE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-XPxWsYH5PlSj0C2xVQehPg-1; Fri, 09 Jul 2021 14:26:02 -0400
X-MC-Unique: XPxWsYH5PlSj0C2xVQehPg-1
Received: by mail-qt1-f199.google.com with SMTP id
 i9-20020ac871c90000b0290252173fe79cso3877991qtp.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 11:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1DV2rbmRUe69ShaICIBPHnjo67qMvctULrVgnxhNHG8=;
 b=qfu1FTVvP9Fk6zHH0YKYGdjZcXhqaCIjYQ3ZKvwiI0E3NXxBU0lp9yS2MuxXLSicvq
 dpIDrcEMWBpxqCnFsjKa5Te/XA2Jki/z1MO9bdiFIouDKklNHLJ86uZ6CvCqWi/0BQCd
 1Y0T+hhN+vb1yodXCFnErzYzIvX1Ee/y+5N/8reZ1vaiHr1zMO3CvCPUGUTERdalRZen
 M4aHG03N3L0N8aKBfb5mjHO4p5fWb20+YNZvNZOxYTFfPAsete1IRqPvt1XX7TCWk61t
 gY4Yg/0tnfrrlxaVkGjirMqYkWi1q69WCZZ8Yh9LiL1wITmWNBtNu5rTDGTGS0vOgQew
 nHhw==
X-Gm-Message-State: AOAM530ql4stYISb5f+7F+QM5HBdq8Zr9h8/rKVDlrt93QUouA+45rQj
 JBErILZDSrD93QMhGkslVNJ7yJT+Xiw4YXvZEyWKiS6841RNwNZ6gH4UzxWV++5kkvznODzdRx2
 ljjQCPk8ev6q/3LI=
X-Received: by 2002:a05:620a:31a6:: with SMTP id
 bi38mr36721719qkb.140.1625855162359; 
 Fri, 09 Jul 2021 11:26:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY8ia3IyHUF5NfsGRjpMdeS9K2juXXIWNo1P7aDaAAFc2QdA3uD2mHhiSGb3UmYhSGlW9TDA==
X-Received: by 2002:a05:620a:31a6:: with SMTP id
 bi38mr36721696qkb.140.1625855162100; 
 Fri, 09 Jul 2021 11:26:02 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j3sm2497277qth.63.2021.07.09.11.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 11:26:01 -0700 (PDT)
Date: Fri, 9 Jul 2021 14:26:00 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH 3/4] memory: introduce DIRTY_MEMORY_DIRTY_RATE dirty bits
 functions
Message-ID: <YOiUuECbNs2WrS4A@t490s>
References: <cover.1624771216.git.huangy81@chinatelecom.cn>
 <a7553a5899b70d50afa04e06597967e20ae41873.1624771216.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <a7553a5899b70d50afa04e06597967e20ae41873.1624771216.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sun, Jun 27, 2021 at 01:38:16PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> introduce util functions to setup the DIRTY_MEMORY_DIRTY_RATE
> dirty bits for the convenience of tracking dirty bitmap when
> calculating dirtyrate.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/exec/ram_addr.h | 121 ++++++++++++++++++++++++++++++++++++++++++++++++
>  softmmu/physmem.c       |  61 ++++++++++++++++++++++++
>  2 files changed, 182 insertions(+)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 6070a52..57dc96b 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -435,6 +435,12 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
>                                                ram_addr_t length,
>                                                unsigned client);
>  
> +void cpu_physical_memory_dirtyrate_clear_bit(ram_addr_t start,
> +                                             ram_addr_t length);
> +
> +void cpu_physical_memory_dirtyrate_reprotect_bit(ram_addr_t start,
> +                                                 ram_addr_t length);
> +
>  DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
>      (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client);
>  
> @@ -523,5 +529,120 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>  
>      return num_dirty;
>  }
> +
> +/* Called with RCU critical section */
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
> +                &ram_list.dirty_memory[DIRTY_MEMORY_DIRTY_RATE])->blocks;
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
> +/* Called with RCU critical section */
> +static inline
> +uint64_t cpu_physical_memory_dirtyrate_stat_dirty_bits(RAMBlock *rb)
> +{
> +    uint64_t dirty_pages = 0;
> +    ram_addr_t addr;
> +    ram_addr_t length = rb->used_length;
> +    unsigned long word = BIT_WORD(rb->offset >> TARGET_PAGE_BITS);
> +    unsigned long bits;
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
> +                &ram_list.dirty_memory[DIRTY_MEMORY_DIRTY_RATE])->blocks;
> +
> +        for (k = 0; k < nr; k++) {
> +            if (src[idx][offset]) {
> +                bits = qatomic_read(&src[idx][offset]);
> +                dirty_pages += ctpopl(bits);
> +            }
> +
> +            if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
> +                offset = 0;
> +                idx++;
> +            }
> +        }
> +    } else {
> +        ram_addr_t offset = rb->offset;
> +
> +        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
> +            if (cpu_physical_memory_get_dirty(offset + addr,
> +                                              TARGET_PAGE_SIZE,
> +                                              DIRTY_MEMORY_DIRTY_RATE)) {
> +                dirty_pages++;
> +            }
> +        }
> +    }
> +
> +    return dirty_pages;
> +}

If my understanding in the cover letter was correct, all codes until here can
be dropped if without the extra bitmap.

> +
> +static inline
> +void cpu_physical_memory_dirtyrate_reset_protect(RAMBlock *rb)
> +{
> +    ram_addr_t addr;
> +    ram_addr_t length = rb->used_length;
> +    unsigned long word = BIT_WORD(rb->offset >> TARGET_PAGE_BITS);
> +
> +    /* start address and length is aligned at the start of a word? */
> +    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) == rb->offset &&
> +        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
> +        memory_region_clear_dirty_bitmap(rb->mr, 0, length);
> +    } else {
> +        ram_addr_t offset = rb->offset;
> +
> +        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
> +            cpu_physical_memory_dirtyrate_reprotect_bit(offset + addr,
> +                                                        TARGET_PAGE_SIZE);
> +        }
> +    }
> +
> +    return;
> +}

Confused why we need this complexity.  Can we unconditionally do:

static inline
void cpu_physical_memory_dirtyrate_reset_protect(RAMBlock *rb)
{
    memory_region_clear_dirty_bitmap(rb->mr, 0, rb->used_length);
}

?

Then we can even drop the helper, maybe?

Below functions seem to be able to be dropped too if without the dirty rate
bitmap.  Then, maybe, this patch is not needed..

> +
>  #endif
>  #endif
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 9b171c9..d68649a 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1068,6 +1068,67 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
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
> +            qatomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_DIRTY_RATE]);
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
> +void cpu_physical_memory_dirtyrate_reprotect_bit(ram_addr_t start,
> +                                                 ram_addr_t length)
> +{
> +    unsigned long end, start_page;
> +    RAMBlock *ramblock;
> +    uint64_t mr_offset, mr_size;
> +
> +    if (length == 0) {
> +        return;
> +    }
> +
> +    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
> +    start_page = start >> TARGET_PAGE_BITS;
> +
> +    ramblock = qemu_get_ram_block(start);
> +    /* Range sanity check on the ramblock */
> +    assert(start >= ramblock->offset &&
> +        start + length <= ramblock->offset + ramblock->used_length);
> +
> +    mr_offset = (ram_addr_t)(start_page << TARGET_PAGE_BITS) - ramblock->offset;
> +    mr_size = (end - start_page) << TARGET_PAGE_BITS;
> +    memory_region_clear_dirty_bitmap(ramblock->mr, mr_offset, mr_size);
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


