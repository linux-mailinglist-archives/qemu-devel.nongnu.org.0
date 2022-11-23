Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1363660F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxspt-0000Cl-Ew; Wed, 23 Nov 2022 11:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxspr-0000CK-Ct
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxspp-0003sO-OL
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669221772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DITfc/oGXVA5pQWD9RRl23JEmBzvgxu/pe+Z46f0Pqk=;
 b=LvdQFrC1v465l59rkldTRb/ICtlYmSQZEkfNVfMRSIhx2CkAVueE9po7xBWywPgXbt7zBt
 k28wXmFniTRt4dduzKvp+9gXvcc/b6IvYgs9H4uO9R8sIfh0xtk4o6RSIXU9zhog9CNj3n
 pqCxy4g/sEQ0PKOeS6pkmh/Wi21VTAs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-K45omDTQNHOtF6IZTDAyzg-1; Wed, 23 Nov 2022 11:42:41 -0500
X-MC-Unique: K45omDTQNHOtF6IZTDAyzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFA6B802C17;
 Wed, 23 Nov 2022 16:42:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B15562166B26;
 Wed, 23 Nov 2022 16:42:38 +0000 (UTC)
Date: Wed, 23 Nov 2022 17:42:35 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 04/15] block-backend: replace bdrv_*_above with
 blk_*_above
Message-ID: <Y35Ne0Er8IrXIsYJ@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
 <20221123114227.85757-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123114227.85757-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 23.11.2022 um 12:42 hat Emanuele Giuseppe Esposito geschrieben:
> Avoid mixing bdrv_* functions with blk_*, so create blk_* counterparts
> for bdrv_block_status_above and bdrv_is_allocated_above.
> 
> Note that since bdrv_block_status_above only calls the g_c_w function
> bdrv_common_block_status_above and is marked as coroutine_fn, call
> directly bdrv_co_common_block_status_above() to avoid using a g_c_w.

This sentence is a bit confusing, because it talks about the blk_* side
of things, but doesn't mention it at all.

The same argument is true for is_allocated.

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c             | 21 ++++++++++++++++++++
>  block/commit.c                    |  4 ++--
>  include/sysemu/block-backend-io.h |  9 +++++++++
>  nbd/server.c                      | 32 +++++++++++++++----------------
>  4 files changed, 48 insertions(+), 18 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 742efa7955..03bed68e4f 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1424,6 +1424,27 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
>      return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
>  }
>  
> +int coroutine_fn blk_co_block_status_above(BlockBackend *blk,
> +                                           BlockDriverState *base,
> +                                           int64_t offset, int64_t bytes,
> +                                           int64_t *pnum, int64_t *map,
> +                                           BlockDriverState **file)
> +{
> +    IO_CODE();
> +    return bdrv_co_block_status_above(blk_bs(blk), base, offset, bytes, pnum,
> +                                      map, file);
> +}
> +
> +int coroutine_fn blk_is_allocated_above(BlockBackend *blk,

Any reason why you renamed only blk_co_block_status_above(), but not
this one into blk_co_is_allocated_above()?

> +                                        BlockDriverState *base,
> +                                        bool include_base, int64_t offset,
> +                                        int64_t bytes, int64_t *pnum)
> +{
> +    IO_CODE();
> +    return bdrv_co_is_allocated_above(blk_bs(blk), base, include_base, offset,
> +                                      bytes, pnum);
> +}

Kevin


