Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B641C5F75AF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 10:57:56 +0200 (CEST)
Received: from localhost ([::1]:54870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjB5-0006Op-BT
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 04:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogj2N-00036h-04
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogj2K-0002zj-Ce
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665132531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VRAbd6ZL48bQT4Lzrynbs2hww7QTMtxX+KANV0rYZ7A=;
 b=e7phxmCiw9CbYy+csQLK8WKgZfJ9D+7MrtZzhMPFwOCDD9GWtFpDqwMp/cR8UclC55vF8P
 njeblu7p8vEfrnIpYqFmbQRwLPz4xXl2ECUD/C2wHZLkHUks+MdN2Ohjz1oJ+tHNvHCzw4
 PeSizFBXYhE1N+pdP2N14vPlp8auFYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-9t1WI16lPnSCrEiicq9d1Q-1; Fri, 07 Oct 2022 04:48:46 -0400
X-MC-Unique: 9t1WI16lPnSCrEiicq9d1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E654811E87;
 Fri,  7 Oct 2022 08:48:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA8B22024CBB;
 Fri,  7 Oct 2022 08:48:45 +0000 (UTC)
Date: Fri, 7 Oct 2022 10:48:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/3] block-backend: Update ctx immediately after root
Message-ID: <Yz/n7Pkb4ePJhWwv@redhat.com>
References: <20220923125227.300202-1-hreitz@redhat.com>
 <20220923125227.300202-3-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923125227.300202-3-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.09.2022 um 14:52 hat Hanna Reitz geschrieben:
> blk_get_aio_context() asserts that blk->ctx is always equal to the root
> BDS's context (if there is a root BDS).  Therefore,
> blk_do_set_aio_context() must update blk->ctx immediately after the root
> BDS's context has changed.
> 
> Without this patch, the next patch would break iotest 238, because
> bdrv_drained_begin() (called by blk_do_set_aio_context()) may then
> invoke bdrv_child_get_parent_aio_context() on the root child, i.e.
> blk_get_aio_context().  However, by this point, blk->ctx would not have
> been updated and thus differ from the root node's context.  This patch
> fixes that.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/block-backend.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index d4a5df2ac2..abdb5ff5af 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -2156,6 +2156,7 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
>                  return ret;
>              }
>          }
> +        blk->ctx = new_context;
>          if (tgm->throttle_state) {
>              bdrv_drained_begin(bs);
>              throttle_group_detach_aio_context(tgm);
> @@ -2164,9 +2165,10 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
>          }
>  
>          bdrv_unref(bs);
> +    } else {
> +        blk->ctx = new_context;
>      }
>  
> -    blk->ctx = new_context;
>      return 0;
>  }

Makes sense. Maybe in the first branch a comment wouldn't hurt (like
"make blk->ctx consistent with the root node again before any other
operations like drain").

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


