Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A12D2E3A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:29:21 +0100 (CET)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmevY-00078L-ST
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmejh-0005dz-Nn
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmejf-00006H-8H
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607440619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hF/3WGR1gfGgcxHwap4FN8pJ8NkfeS5SnSoV69Ao78I=;
 b=OJcbHL/rMkj9cserZySfGQVYtmTRhVn01NmNZ+3fIohE10YoaRs3dOuI6s9s/QwAn6xK/t
 NZx8HoXytFa2Ex/wM45UanmZWh4CRVl7Fncho67S9ioXIturG1ci+KN7/CWAmyqR0quJAX
 N+jY1IG8bnNjWySylePjb+kvqHiqNDc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-DM6tcudzMC2w2l2PmmjXuQ-1; Tue, 08 Dec 2020 10:16:57 -0500
X-MC-Unique: DM6tcudzMC2w2l2PmmjXuQ-1
Received: by mail-qk1-f197.google.com with SMTP id l7so15663199qkl.16
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 07:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hF/3WGR1gfGgcxHwap4FN8pJ8NkfeS5SnSoV69Ao78I=;
 b=nciavVXMbjEJZ0KpZa8Eh3WjXD0LIk0gJJnMzgeyL8SdV0BadDH4NcBg3p4y+QD70G
 Yu/gErrXxOf6qDYx7LqtlJmfJDmh4M6cZQv3KXfgPWL6OLTn+BklsEPflW/+vxawSfZj
 kz7Z6xgHLEnYXh0AHs4AZ8haU/5P6dro308GZfu/dn/tTgoBn0v/1zvvClmTtg6Kl3a/
 c4LrEfTG9gp0gnorvUf+7tG+PDzXwRvkUnl8t3EVvnT/HfcCdFM1CAzh6qVqhlcUH9HM
 TsFbC3Ov9hWBM5aV4WpoBQkQ4bPH9gZtgIFgNW0ag1R6IwgLkcQ4Vtq0YkZJf0Jo5RTn
 0Wzw==
X-Gm-Message-State: AOAM533XHADTybj68NCZ3Gm2PAs/9OgogXTu0/fC77Qm3ucqLthExozQ
 mt9OeS7Z7awvzlxLfZvLY3sg2PLpyycelV/tw81mTn0swb+nM5nbeLqrEh/Vjylipi5BESxLauq
 ExeyWhFH9oVTB69o=
X-Received: by 2002:a05:6214:aa1:: with SMTP id
 ew1mr26888678qvb.55.1607440616714; 
 Tue, 08 Dec 2020 07:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9Aonl74IM4DTRp3SJTn8hBs7IFc1yJESk/i88ZvtEpFQrXcn8VE/NxrTN4UCsEkIFT0XRZw==
X-Received: by 2002:a05:6214:aa1:: with SMTP id
 ew1mr26888643qvb.55.1607440616455; 
 Tue, 08 Dec 2020 07:16:56 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id b3sm14588751qkf.74.2020.12.08.07.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 07:16:55 -0800 (PST)
Date: Tue, 8 Dec 2020 10:16:54 -0500
From: Peter Xu <peterx@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
Message-ID: <20201208151654.GA6432@xz-x1>
References: <20201208114013.875-1-yuzenghui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201208114013.875-1-yuzenghui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Zenghui,

On Tue, Dec 08, 2020 at 07:40:13PM +0800, Zenghui Yu wrote:
> The kernel KVM_CLEAR_DIRTY_LOG interface has align requirement on both the
> start and the size of the given range of pages. We have been careful to
> handle the unaligned cases when performing CLEAR on one slot. But it seems
> that we forget to take the unaligned *size* case into account when
> preparing bitmap for the interface, and we may end up clearing dirty status
> for pages outside of [start, start + size).

Thanks for the patch, though my understanding is that this is not a bug.

Please have a look at kvm_memslot_init_dirty_bitmap() where we'll allocate the
dirty bitmap to be aligned to 8 bytes (assuming that's the possible max of the
value sizeof(unsigned long)).  That exactly covers 64 pages.

So here as long as start_delta==0 (so the value of "bmap_npages - size / psize"
won't really matter a lot, imho), then we'll definitely have KVMSlot.dirty_bmap
long enough to cover the range we'd like to clear.

Note that the size of KVMSlot.dirty_bmap can be bigger than the actually size
of the kvm memslot, however since kvm_memslot_init_dirty_bitmap() initialized
it to all zero so the extra bits will always be zero for the whole lifecycle of
the vm/bitmap.

Thanks,

> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  accel/kvm/kvm-all.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index bed2455ca5..05d323ba1f 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -747,7 +747,7 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>      assert(bmap_start % BITS_PER_LONG == 0);
>      /* We should never do log_clear before log_sync */
>      assert(mem->dirty_bmap);
> -    if (start_delta) {
> +    if (start_delta || bmap_npages - size / psize) {
>          /* Slow path - we need to manipulate a temp bitmap */
>          bmap_clear = bitmap_new(bmap_npages);
>          bitmap_copy_with_src_offset(bmap_clear, mem->dirty_bmap,
> @@ -760,7 +760,10 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>          bitmap_clear(bmap_clear, 0, start_delta);
>          d.dirty_bitmap = bmap_clear;
>      } else {
> -        /* Fast path - start address aligns well with BITS_PER_LONG */
> +        /*
> +         * Fast path - both start and size align well with BITS_PER_LONG
> +         * (or the end of memory slot)
> +         */
>          d.dirty_bitmap = mem->dirty_bmap + BIT_WORD(bmap_start);
>      }
>  
> -- 
> 2.19.1
> 
> 

-- 
Peter Xu


