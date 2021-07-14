Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840333C82D0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:29:18 +0200 (CEST)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3c8j-0006h4-J4
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3c7V-0005oR-N1
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3c7S-00065r-Im
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626258477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FceFy/gWS5PYvkmNU6vh513J3ohHvBTd38qgaKDnq9k=;
 b=ID7ewY4jVTAo6y9eRiCZ3yIsxXBsY/Qfo3cI/v/OAvQMqDwW5OZaZE1Vi9KtYx5G1g70iL
 /z4rM+QZVmJpgYwc+phV3gwC5wxizCc5iAioT4QazB3rAANHPs3vXX98hH7BKI5E60OgAF
 MRsOONSvvfT7fmuZS9JhYMLb3XrrDKI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-VDBdPIONMZmwgle3Cyh1cw-1; Wed, 14 Jul 2021 06:27:55 -0400
X-MC-Unique: VDBdPIONMZmwgle3Cyh1cw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a4-20020a0560001884b02901401e436a18so1259747wri.21
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FceFy/gWS5PYvkmNU6vh513J3ohHvBTd38qgaKDnq9k=;
 b=coQNqOuWYdnySaZM1z3sZUuTZao/PDpSnUzJfcsPBHYWCUNe87tQnK3qNluMnLE5ez
 ponHMDDxbxcigKkImt7x6bV1ca+lRaIrpF1CN0/+zGWN8c1iW0vpOJbMboaYbFj9g/r7
 YlMxu0KqXnsmh9yffJhp7r2zLnDVviFt3cj4IeJOzktFVlzIK5WAIErTsQQeY3LHNJ9V
 z+n2hBH/AduKfBGBQJZWKILsNvZS9ri4K6IO06Mya9d+UFdh4J+nA7SvuaIUFHMNe3Br
 EBUo1vbEjd/HMeJrzFgr6UixrkH6lNYPPOmDFYzsDIcFy5V/ngLtn/zSjm4/YBEExK+L
 X8SQ==
X-Gm-Message-State: AOAM533elaQltP/u95+rfq7rmF9CKXel19dot0Cg87K2LdEPLqFFxMyG
 aAMlNUGTxRCYVlnrI9Wf75Yh7eBF3pDS/C15gR7Ou29XQwuWn2uWThqInSD/uAQJg7jA1uFdTet
 fCrxDoabwdoFGL6g=
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr3194570wmo.91.1626258474158; 
 Wed, 14 Jul 2021 03:27:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJeRL2TzAcnTB/wLOs+vuvUV/lkfRRM/OME42gUDUoKHJSFzk04q+aTifOxw4iv4GBfj2ssQ==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr3194548wmo.91.1626258473936; 
 Wed, 14 Jul 2021 03:27:53 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id f82sm4766490wmf.25.2021.07.14.03.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:27:53 -0700 (PDT)
Date: Wed, 14 Jul 2021 06:27:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH v1] migration: clear the memory region dirty bitmap when
 skipping free pages
Message-ID: <20210714062715-mutt-send-email-mst@kernel.org>
References: <20210714075104.397484-1-wei.w.wang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210714075104.397484-1-wei.w.wang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: peterx@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 03:51:04AM -0400, Wei Wang wrote:
> When skipping free pages, their corresponding dirty bits in the memory
> region dirty bitmap need to be cleared. Otherwise the skipped pages will
> be sent in the next round after the migration thread syncs dirty bits
> from the memory region dirty bitmap.
> 
> migration_clear_memory_region_dirty_bitmap_range is put outside the
> bitmap_mutex, becasue

because?

> memory_region_clear_dirty_bitmap is possible to block
> on the kvm slot mutex (don't want holding bitmap_mutex while blocked on
> another mutex), and clear_bmap_test_and_clear uses atomic operation.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Reported-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> ---
>  capstone        |  2 +-

Seems unnecessary.

>  migration/ram.c | 73 +++++++++++++++++++++++++++++++++++++------------
>  slirp           |  2 +-
>  ui/keycodemapdb |  2 +-

These too.

>  4 files changed, 58 insertions(+), 21 deletions(-)
> 
> diff --git a/capstone b/capstone
> index f8b1b83301..22ead3e0bf 160000
> --- a/capstone
> +++ b/capstone
> @@ -1 +1 @@
> -Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
> +Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
> diff --git a/migration/ram.c b/migration/ram.c
> index 88ff34f574..c44c6e2fed 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -789,6 +789,51 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
>      return find_next_bit(bitmap, size, start);
>  }
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
> +
> +    for (i = 0; i < nchunks; i++) {
> +        page_to_clear = start + i * chunk_pages;
> +        migration_clear_memory_region_dirty_bitmap(rs, rb, page_to_clear);
> +    }
> +}
> +
>  static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>                                                  RAMBlock *rb,
>                                                  unsigned long page)
> @@ -805,26 +850,9 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>       * the page in the chunk we clear the remote dirty bitmap for all.
>       * Clearing it earlier won't be a problem, but too late will.
>       */
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
>      ret = test_and_clear_bit(page, rb->bmap);
> -
>      if (ret) {
>          rs->migration_dirty_pages--;
>      }
> @@ -2742,6 +2770,15 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
>          start = offset >> TARGET_PAGE_BITS;
>          npages = used_len >> TARGET_PAGE_BITS;
>  
> +        /*
> +         * The skipped free pages are equavelent to be sent from clear_bmap's
> +         * perspective, so clear the bits from the memory region bitmap which
> +         * are initially set. Otherwise those skipped pages will be sent in
> +         * the next round after syncing from the memory region bitmap.
> +         */
> +        migration_clear_memory_region_dirty_bitmap_range(ram_state, block,
> +                                                         start, npages);
> +
>          qemu_mutex_lock(&ram_state->bitmap_mutex);
>          ram_state->migration_dirty_pages -=
>                        bitmap_count_one_with_offset(block->bmap, start, npages);
> diff --git a/slirp b/slirp
> index 8f43a99191..2faae0f778 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 2faae0f778f818fadc873308f983289df697eb93
> diff --git a/ui/keycodemapdb b/ui/keycodemapdb
> index 6119e6e19a..320f92c36a 160000
> --- a/ui/keycodemapdb
> +++ b/ui/keycodemapdb
> @@ -1 +1 @@
> -Subproject commit 6119e6e19a050df847418de7babe5166779955e4
> +Subproject commit 320f92c36a80bfafc5d57834592a7be5fd79f104
> -- 
> 2.25.1


