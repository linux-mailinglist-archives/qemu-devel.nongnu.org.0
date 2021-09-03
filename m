Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FAB40074A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:09:51 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGRb-0002X0-2a
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMGKd-0007PL-2B
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMGKa-0001mT-5y
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630702954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ouBlstdag8VA9kw0/WzlMkfTNQqLHD+2ir55Bzylu4=;
 b=TC20Q5BVKS1sZZ2TyEoVTv/A0ZkUH5U69qhLUMCDuNFL7VIttC5Tx/dbEMAmACpbYT2rlM
 fe/bNgzsnv8nsJDZV45rL0j9Gyl3r1GXeYXp1X9t72KsH0XooY4W4x5H3FTZzKFomaTfm6
 8uuPZjpbmFpoHEcDwU66y1N7nDkqsJ0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-mR4WoTvkM7KVrXlhHbzpKg-1; Fri, 03 Sep 2021 17:02:32 -0400
X-MC-Unique: mR4WoTvkM7KVrXlhHbzpKg-1
Received: by mail-qk1-f200.google.com with SMTP id
 p23-20020a05620a22f700b003d5ac11ac5cso1073359qki.15
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6ouBlstdag8VA9kw0/WzlMkfTNQqLHD+2ir55Bzylu4=;
 b=Cvfxey8ujxD8yeBdYBUxIXlq7/97y06fzHf5yuGY+jcWjI2NRlbeDpeg5ifmLoc73S
 YvPGG33rJMe98P512UMdtmlVy1TDT04E3jpHBoi702ZLQFX5zbMWU3jMyhi2FCdn85pm
 BcZBkZX1RjOeMOF7oJgrWVU0vIps+5lAMtWGCQyiDs4TGDnEjx0oM9yTmVVyeN0pxa3W
 obqbSNKtHJMIwenM0/Lz+Dj5/7SKxpNAvo7zJA0vOE2LIOVzysS0sVKi6RTsi5Sc56Uy
 NOf7sgnlaOlirshoVyyRDm5PcYaLD89SvPdaPP0N9cRn9NURq6KOU4eReC8J9g4wgPet
 KxbA==
X-Gm-Message-State: AOAM5335RSGWJ2le7dKpGkWjrpLCQdm8nrltPHGERHGHvsPOSeECIpd3
 h70rYPCAEjN228ldi7DYjCntDY1TQbAbGY59cWk8RRv1Xkoldx8Mnguu2MTbIRd0RoaN1+Rx67m
 37tuKR+SFZnJeMQU=
X-Received: by 2002:a05:620a:15a6:: with SMTP id
 f6mr798936qkk.246.1630702951800; 
 Fri, 03 Sep 2021 14:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvtsu/vaOEByMSr5GljKu/0Qr5GIS9FKN34PHvU7mmVp4bjeKP5Xgkl2c5CWp4pa2pufBSZA==
X-Received: by 2002:a05:620a:15a6:: with SMTP id
 f6mr798920qkk.246.1630702951550; 
 Fri, 03 Sep 2021 14:02:31 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id i16sm322785qtq.52.2021.09.03.14.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:02:30 -0700 (PDT)
Date: Fri, 3 Sep 2021 17:02:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH] physmem: Do not allow unprivileged device map
 privileged memory
Message-ID: <YTKNZcSh0+EN/dzY@t490s>
References: <20210903153820.686913-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903153820.686913-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 05:38:20PM +0200, Philippe Mathieu-Daudé wrote:
> Since commits cc05c43ad94..42874d3a8c6 ("memory: Define API for
> MemoryRegionOps to take attrs and return status") the Memory API
> returns a zero (MEMTX_OK) response meaning success, anything else
> indicating a failure.
> 
> In commits c874dc4f5e8..2f7b009c2e7 ("Make address_space_map() take
> a MemTxAttrs argument") we updated the AddressSpace and FlatView
> APIs but forgot to check the returned value by the FlatView from
> the MemoryRegion.
> 
> Adjust that now, only returning a non-NULL address if the transaction
> succeeded with the requested memory attributes.
> 
> Reported-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> RFC because this could become a security issue in a core component,
>     however currently all callers pass MEMTXATTRS_UNSPECIFIED.

Could you share more on the implications?

MEMTXATTRS_UNSPECIFIED shouldn't be the only factor to fail flatview_read(), or
is it?  I think the change looks mostly right, but I've no knowledge on the
context of the problems..

> ---
>  include/exec/memory.h |  3 ++-
>  softmmu/physmem.c     | 16 ++++++++++------
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317f..488d2ecdd09 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2706,7 +2706,8 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr, hwaddr len,
>   *
>   * May map a subset of the requested range, given by and returned in @plen.
>   * May return %NULL and set *@plen to zero(0), if resources needed to perform
> - * the mapping are exhausted.
> + * the mapping are exhausted or if the physical memory region is not accessible
> + * for the requested memory attributes.
>   * Use only for reads OR writes - not for read-modify-write operations.
>   * Use cpu_register_map_client() to know when retrying the map operation is
>   * likely to succeed.

You didn't touch up the comments above address_space_map() in physmem.c, but
instead maybe we can just remove the .c one and only keep the .h one; there's
some duplication and .h should be the most to reference.

> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 23e77cb7715..802c339f6d2 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3188,15 +3188,19 @@ void *address_space_map(AddressSpace *as,
>          /* Avoid unbounded allocations */
>          l = MIN(l, TARGET_PAGE_SIZE);
>          bounce.buffer = qemu_memalign(TARGET_PAGE_SIZE, l);
> +
> +        if (!is_write) {
> +            if (flatview_read(fv, addr, attrs, bounce.buffer, l) != MEMTX_OK) {
> +                qemu_vfree(bounce.buffer);
> +                *plen = 0;

Maybe also:

                   qatomic_mb_set(&bounce.in_use, false);

?

(I'm wondering whether atomic is needed here if we only have one buffer anyway
 and we're with bql; a different matter anyway)

> +                return NULL;
> +            }
> +        }
> +
>          bounce.addr = addr;
>          bounce.len = l;
> -
> -        memory_region_ref(mr);

This line move seems to be unnecessary.

>          bounce.mr = mr;
> -        if (!is_write) {
> -            flatview_read(fv, addr, MEMTXATTRS_UNSPECIFIED,
> -                               bounce.buffer, l);
> -        }
> +        memory_region_ref(mr);
>  
>          *plen = l;
>          return bounce.buffer;
> -- 
> 2.31.1
> 

-- 
Peter Xu


