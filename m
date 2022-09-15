Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8489B5BA0FD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 20:52:57 +0200 (CEST)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYtyq-00042l-63
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 14:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYtw9-000177-8h
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 14:50:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYtw5-00066J-Jg
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 14:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663267804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gGSn3Sa35PcoRjO+2oFPypK5KHekkqBlbh1JF8O+5kc=;
 b=P5yo0d+mSRAmMpKNbzQMMFz7+WdImUBB9C186DmN0ScFqx1unfZz7J/r6EjZrvcYc1nK0u
 b8ERGK9iZBy2twKVT2R0DUb8s/nDICLfMtIak3tDrYHQIQ48Pvosf3BY45XCsTN+b9BS9B
 mIKfcSi8R+unc8oz0gnZw4HcBeq/H0c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-G1m8RVFrPz6TnK8ZEZgFKQ-1; Thu, 15 Sep 2022 14:50:03 -0400
X-MC-Unique: G1m8RVFrPz6TnK8ZEZgFKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v190-20020a1cacc7000000b003b4ab30188fso1631325wme.2
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 11:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gGSn3Sa35PcoRjO+2oFPypK5KHekkqBlbh1JF8O+5kc=;
 b=UU43FYDRQDZ+G+YeC/Uh4hZkIPz7fQqIPFbu8t8hK0FIMNOwb++mQb+SzDsEytx5Hq
 cv0bQ5Zf9FjMfqPdAziiBjrDR0m1x1ZH8H4MCBGFRck7iN6GXPx5wWV5dZkzuygDq/yD
 YFXmUWTwZvn6WA983sySvWlLF6HCc1cMDi6ki3+ZzD4CcBsQMg7e+vcfxFPJNkZeb+mf
 iX+Wnh3yGvGf1EsOZaVTyyRIZlumEJ+OOXRmS6VZUhsU4IBrbLfdII+azFTvJgoBAZK8
 A0jzv8wHbwO/YZLGONxnLGkq/cy5RsYUPJTaVfi+mC8Ml+p85jWRpm6FNCC9xkaD+E29
 ZoBw==
X-Gm-Message-State: ACrzQf3PliYMV4wq9mpA9J88JIBgZKyA7CrvOvaFD6mUtzdVf+SlyQhP
 swsZCMrsA6drL/fKyMAohMoCSJDoeVI900wp6d4PJNyfAmZvHR7sA07LR+CNeYJJJDE4rknGZkq
 CTNNruTJB/1ZeF3w=
X-Received: by 2002:a05:6000:1547:b0:22a:dcbe:14a3 with SMTP id
 7-20020a056000154700b0022adcbe14a3mr183748wry.502.1663267800623; 
 Thu, 15 Sep 2022 11:50:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Tzk5vPSj6pH2QniSmL50KcML0gc/Ae51DQO3FKpJqDebjC5mPKDcxn6q9ZySElBkU3EIVbw==
X-Received: by 2002:a05:6000:1547:b0:22a:dcbe:14a3 with SMTP id
 7-20020a056000154700b0022adcbe14a3mr183728wry.502.1663267800350; 
 Thu, 15 Sep 2022 11:50:00 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b00225307f43fbsm3302179wrr.44.2022.09.15.11.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 11:49:59 -0700 (PDT)
Date: Thu, 15 Sep 2022 19:49:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 01/13] migration: Use non-atomic ops for clear log
 bitmap
Message-ID: <YyNz1Z2etCS/NtlT@work-vm>
References: <20220829165659.96046-1-peterx@redhat.com>
 <20220829165659.96046-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829165659.96046-2-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Since we already have bitmap_mutex to protect either the dirty bitmap or
> the clear log bitmap, we don't need atomic operations to set/clear/test on
> the clear log bitmap.  Switching all ops from atomic to non-atomic
> versions, meanwhile touch up the comments to show which lock is in charge.
> 
> Introduced non-atomic version of bitmap_test_and_clear_atomic(), mostly the
> same as the atomic version but simplified a few places, e.g. dropped the
> "old_bits" variable, and also the explicit memory barriers.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Can you update the comment in ramblock.h above clear_bmap to say it's
always updated under that lock.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/exec/ram_addr.h | 11 +++++-----
>  include/qemu/bitmap.h   |  1 +
>  util/bitmap.c           | 45 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index f3e0c78161..5092a2e0ff 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -42,7 +42,8 @@ static inline long clear_bmap_size(uint64_t pages, uint8_t shift)
>  }
>  
>  /**
> - * clear_bmap_set: set clear bitmap for the page range
> + * clear_bmap_set: set clear bitmap for the page range.  Must be with
> + * bitmap_mutex held.
>   *
>   * @rb: the ramblock to operate on
>   * @start: the start page number
> @@ -55,12 +56,12 @@ static inline void clear_bmap_set(RAMBlock *rb, uint64_t start,
>  {
>      uint8_t shift = rb->clear_bmap_shift;
>  
> -    bitmap_set_atomic(rb->clear_bmap, start >> shift,
> -                      clear_bmap_size(npages, shift));
> +    bitmap_set(rb->clear_bmap, start >> shift, clear_bmap_size(npages, shift));
>  }
>  
>  /**
> - * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set
> + * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set.
> + * Must be with bitmap_mutex held.
>   *
>   * @rb: the ramblock to operate on
>   * @page: the page number to check
> @@ -71,7 +72,7 @@ static inline bool clear_bmap_test_and_clear(RAMBlock *rb, uint64_t page)
>  {
>      uint8_t shift = rb->clear_bmap_shift;
>  
> -    return bitmap_test_and_clear_atomic(rb->clear_bmap, page >> shift, 1);
> +    return bitmap_test_and_clear(rb->clear_bmap, page >> shift, 1);
>  }
>  
>  static inline bool offset_in_ramblock(RAMBlock *b, ram_addr_t offset)
> diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
> index 82a1d2f41f..3ccb00865f 100644
> --- a/include/qemu/bitmap.h
> +++ b/include/qemu/bitmap.h
> @@ -253,6 +253,7 @@ void bitmap_set(unsigned long *map, long i, long len);
>  void bitmap_set_atomic(unsigned long *map, long i, long len);
>  void bitmap_clear(unsigned long *map, long start, long nr);
>  bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr);
> +bool bitmap_test_and_clear(unsigned long *map, long start, long nr);
>  void bitmap_copy_and_clear_atomic(unsigned long *dst, unsigned long *src,
>                                    long nr);
>  unsigned long bitmap_find_next_zero_area(unsigned long *map,
> diff --git a/util/bitmap.c b/util/bitmap.c
> index f81d8057a7..8d12e90a5a 100644
> --- a/util/bitmap.c
> +++ b/util/bitmap.c
> @@ -240,6 +240,51 @@ void bitmap_clear(unsigned long *map, long start, long nr)
>      }
>  }
>  
> +bool bitmap_test_and_clear(unsigned long *map, long start, long nr)
> +{
> +    unsigned long *p = map + BIT_WORD(start);
> +    const long size = start + nr;
> +    int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
> +    unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
> +    bool dirty = false;
> +
> +    assert(start >= 0 && nr >= 0);
> +
> +    /* First word */
> +    if (nr - bits_to_clear > 0) {
> +        if ((*p) & mask_to_clear) {
> +            dirty = true;
> +        }
> +        *p &= ~mask_to_clear;
> +        nr -= bits_to_clear;
> +        bits_to_clear = BITS_PER_LONG;
> +        p++;
> +    }
> +
> +    /* Full words */
> +    if (bits_to_clear == BITS_PER_LONG) {
> +        while (nr >= BITS_PER_LONG) {
> +            if (*p) {
> +                dirty = true;
> +                *p = 0;
> +            }
> +            nr -= BITS_PER_LONG;
> +            p++;
> +        }
> +    }
> +
> +    /* Last word */
> +    if (nr) {
> +        mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
> +        if ((*p) & mask_to_clear) {
> +            dirty = true;
> +        }
> +        *p &= ~mask_to_clear;
> +    }
> +
> +    return dirty;
> +}
> +
>  bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr)
>  {
>      unsigned long *p = map + BIT_WORD(start);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


