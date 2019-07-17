Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C666B99E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 11:57:57 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnghB-0004Nr-1W
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 05:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44939)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hnggx-0003wT-BQ
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:57:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hnggw-0002Kq-5t
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:57:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43306)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>)
 id 1hnggv-0002HY-Tc; Wed, 17 Jul 2019 05:57:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ADC5D307D86F;
 Wed, 17 Jul 2019 09:57:39 +0000 (UTC)
Received: from redhat.com (ovpn-120-247.rdu2.redhat.com [10.10.120.247])
 by smtp.corp.redhat.com (Postfix) with SMTP id 30E2A5D9D5;
 Wed, 17 Jul 2019 09:57:32 +0000 (UTC)
Date: Wed, 17 Jul 2019 05:57:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190717054727-mutt-send-email-mst@kernel.org>
References: <20190717084255.17173-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717084255.17173-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 17 Jul 2019 09:57:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.1] virtio-balloon: fix QEMU crashes
 on pagesize > BALLOON_PAGE_SIZE
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 17, 2019 at 10:42:55AM +0200, David Hildenbrand wrote:
> We are using the wrong functions to set/clear bits, effectively touching
> multiple bits, writing out of range of the bitmap, resulting in memory
> corruptions. We have to use set_bit()/clear_bit() instead.
> 
> Can easily be reproduced by starting a qemu guest on hugetlbfs memory,
> inflating the balloon. QEMU crashes. This never could have worked
> properly - especially, also pages would have been discarded when the
> first sub-page would be inflated (the whole bitmap would be set).
> 
> While testing I realized, that on hugetlbfs it is pretty much impossible
> to discard a page - the guest just frees the 4k sub-pages in random order
> most of the time. I was only able to discard a hugepage a handful of
> times - so I hope that now works correctly.
> 
> Fixes: ed48c59875b6 ("virtio-balloon: Safely handle BALLOON_PAGE_SIZE <
>                      host page size")
> Fixes: b27b32391404 ("virtio-balloon: Fix possible guest memory corruption
>                      with inflates & deflates")
> Cc: qemu-stable@nongnu.org #v4.0.0
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/virtio-balloon.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e85d1c0d5c..669067d661 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -94,9 +94,8 @@ static void balloon_inflate_page(VirtIOBalloon *balloon,
>          balloon->pbp->base = host_page_base;
>      }
>  
> -    bitmap_set(balloon->pbp->bitmap,
> -               (ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
> -               subpages);
> +    set_bit((ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
> +            balloon->pbp->bitmap);
>  
>      if (bitmap_full(balloon->pbp->bitmap, subpages)) {
>          /* We've accumulated a full host page, we can actually discard
> @@ -140,9 +139,8 @@ static void balloon_deflate_page(VirtIOBalloon *balloon,
>           * for a guest to do this in practice, but handle it anyway,
>           * since getting it wrong could mean discarding memory the
>           * guest is still using. */
> -        bitmap_clear(balloon->pbp->bitmap,
> -                     (ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
> -                     subpages);
> +        clear_bit((ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
> +                  balloon->pbp->bitmap);
>  
>          if (bitmap_empty(balloon->pbp->bitmap, subpages)) {
>              g_free(balloon->pbp);

I also started to wonder about this:

    if (!balloon->pbp) {
        /* Starting on a new host page */
        size_t bitlen = BITS_TO_LONGS(subpages) * sizeof(unsigned long);
        balloon->pbp = g_malloc0(sizeof(PartiallyBalloonedPage) + bitlen);
        balloon->pbp->rb = rb;
        balloon->pbp->base = host_page_base;
    }

Is keeping a pointer to a ram block like this safe? what if the ramblock
gets removed?


> -- 
> 2.21.0

