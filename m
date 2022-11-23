Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A4D6365DB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:31:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsdi-0002ZL-Ni; Wed, 23 Nov 2022 11:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxsdV-0002Ys-Ou
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:30:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxsdT-0008Af-Gu
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669220984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VpAjFX8Yhx8jZ1jWGsb3rlXZftesHGeetU63FvRHOms=;
 b=S5cMG2H+/iRyzAggTBYnX+L5LCIge1+jWFC8Qal1/oqwSEwmdghZxPKQzZSg5C3ojcqo0Y
 ZpJzmMZB6ihX7BmK4V84MRGfkeZaFKZBpPcVaHNXtQ7LJ1ypbF1/3FNVPZTdge5D884WPb
 UIbIFdo5LHDqfBoEIwD9848LjoLYtQQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1--otQDQVFOXal0_hr8P6zQw-1; Wed, 23 Nov 2022 11:29:39 -0500
X-MC-Unique: -otQDQVFOXal0_hr8P6zQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564533813F22;
 Wed, 23 Nov 2022 16:29:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D48DC492B0B;
 Wed, 23 Nov 2022 16:29:36 +0000 (UTC)
Date: Wed, 23 Nov 2022 17:29:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [PATCH v5 01/15] block-io: introduce coroutine_fn duplicates for
 bdrv_common_block_status_above callers
Message-ID: <Y35KbUvGsfEmT9ka@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
 <20221123114227.85757-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123114227.85757-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 23.11.2022 um 12:42 hat Emanuele Giuseppe Esposito geschrieben:
> bdrv_common_block_status_above() is a g_c_w, and it is being called by
> many "wrapper" functions like bdrv_is_allocated(),
> bdrv_is_allocated_above() and bdrv_block_status_above().
> 
> Because we want to eventually split the coroutine from non-coroutine
> case in g_c_w, create duplicate wrappers that take care of directly
> calling the same coroutine functions called in the g_c_w.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/io.c               | 64 ++++++++++++++++++++++++++++++++++++++--
>  include/block/block-io.h | 15 ++++++++++
>  2 files changed, 76 insertions(+), 3 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 38e57d1f67..1bc05c8282 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2533,6 +2533,19 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
>      return ret;
>  }
>  
> +int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
> +                                            BlockDriverState *base,
> +                                            int64_t offset, int64_t bytes,
> +                                            int64_t *pnum, int64_t *map,
> +                                            BlockDriverState **file)
> +{
> +    IO_CODE();
> +    /* If QEMU_IN_COROUTINE() fails, use bdrv_block_status_above() */
> +    QEMU_IN_COROUTINE();

This is an obvious patch order problem: The macro doesn't even exist
yet.

As I said, personally, I don't feel like putting QEMU_IN_COROUTINE()
assertions into every coroutine_fn is a useful thing to do. Static
analysis (maybe even with something vrc based in 'make check'? Paolo,
would this be realistic?) seems much preferable. But I'd like to hear
other opinions on this, too.

I feel the same way about the comment. Yes, of course, if you're not in
a coroutine, don't call the _co variant of a function, but the one
without it. But that goes without saying, doesn't it?

> +    return bdrv_co_common_block_status_above(bs, base, false, true, offset,
> +                                             bytes, pnum, map, file, NULL);
> +}

Apart from these considerations the patch looks right.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


