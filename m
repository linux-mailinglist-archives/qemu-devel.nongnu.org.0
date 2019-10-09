Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0231D19A5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 22:37:15 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIIhu-0003SO-86
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 16:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIGfg-0005vV-89
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 14:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIGfe-0007kG-Rd
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 14:26:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47500)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIGfY-0007fq-KL; Wed, 09 Oct 2019 14:26:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBA8F10DCC9D;
 Wed,  9 Oct 2019 18:26:39 +0000 (UTC)
Received: from [10.3.116.162] (ovpn-116-162.phx2.redhat.com [10.3.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE9B210016EB;
 Wed,  9 Oct 2019 18:26:36 +0000 (UTC)
Subject: Re: [PATCH 09/10] nbd/server: use bdrv_dirty_bitmap_next_dirty_area
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20190930151502.7829-1-vsementsov@virtuozzo.com>
 <20190930151502.7829-10-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <59fa171e-f885-620e-4dfd-e690e7906928@redhat.com>
Date: Wed, 9 Oct 2019 13:26:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190930151502.7829-10-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Wed, 09 Oct 2019 18:26:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/19 10:15 AM, Vladimir Sementsov-Ogievskiy wrote:
> Use bdrv_dirty_bitmap_next_dirty_area for bitmap_to_extents. Since
> bdrv_dirty_bitmap_next_dirty_area is very accurate in its interface,
> we'll never exceed requested region with last chunk. So, we don't need
> dont_fragment, and bitmap_to_extents() interface becomes clean enough
> to not require any comment.

Comments are a useful style, even if functions seem trivial.

When req_one is in effect, we have to stop at the requested length. 
When req_one is not in effect, the NBD spec does not require us to stop 
until the next change in extent status, but also does not force us to 
continue past.  So this change is fine from the protocol standpoint.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   nbd/server.c | 58 ++++++++++++++++------------------------------------
>   1 file changed, 18 insertions(+), 40 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index cc63d8ad21..edbdb1b6b6 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2023,57 +2023,35 @@ static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
>       return nbd_co_send_extents(client, handle, ea, last, context_id, errp);
>   }
>   
> -/*
> - * Populate @ea from a dirty bitmap. Unless @dont_fragment, the
> - * final extent may exceed the original @length.
> - */

I would have kept the first sentence, and dropped only the second.

>   static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
>                                 uint64_t offset, uint64_t length,
> -                              NBDExtentArray *ea, bool dont_fragment)
> +                              NBDExtentArray *es)
>   {
> -    uint64_t begin = offset, end = offset;
> -    uint64_t overall_end = offset + length;
> -    BdrvDirtyBitmapIter *it;
> -    bool dirty;
> +    int64_t start, dirty_start, dirty_count;
> +    int64_t end = offset + length;
> +    bool full = false;
>   
>       bdrv_dirty_bitmap_lock(bitmap);

> +    for (start = offset;
> +         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end, INT32_MAX,
> +                                           &dirty_start, &dirty_count);
> +         start = dirty_start + dirty_count)
> +    {
> +        if ((nbd_extent_array_add(es, dirty_start - start, 0) < 0) ||
> +            (nbd_extent_array_add(es, dirty_count, NBD_STATE_DIRTY) < 0))

As long as bdrv_dirty_bitmap_next_dirty_area works correctly, this 
should work regardless of whether start is dirty or clean (if dirty, the 
first call will be a 0-length no-op).


> +        {
> +            full = true;
>               break;
>           }
> -        begin = end;
> -        dirty = next_dirty;
>       }
>   
> -    bdrv_dirty_iter_free(it);
> +    if (!full) {
> +        /* last non dirty extent */
> +        nbd_extent_array_add(es, end - start, 0);
> +    }

Losing the possibility of reporting beyond the end of the original 
request (when req_one is not in force) is not fatal (it might make some 
clients less efficient when walking the entire disk, but qemu as a 
client isn't currently taking advantage of NBD's permission to return 
extra length).

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

