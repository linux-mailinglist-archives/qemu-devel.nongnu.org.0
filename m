Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED724CC351
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:58:23 +0100 (CET)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPomU-0005g9-OA
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nPoky-00046O-Q1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nPoku-0002oP-EC
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646326602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nQJyUVVWB+vgL3E8ds05Bxt2Udu0h8vTN0U7tV5/IoA=;
 b=TGmIJpZB+ap22Gvolg6eF+F5J0fTkgYfIZrNW6BWpx3oQ9jcS3mJg+wjOfdsmuj10qSKXY
 kZIh5f/HmB8L/87iktywolpBljdU9pVKAw7lYE8PjO9BoOW/wbTZp573vBuQ+A3cGn9DCh
 0Iga9C21fVpIw1eK5RtX/QG3sH7dnGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-2jZmoxSuNUy1zTLRBfozdg-1; Thu, 03 Mar 2022 11:56:41 -0500
X-MC-Unique: 2jZmoxSuNUy1zTLRBfozdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA2F01091DA0;
 Thu,  3 Mar 2022 16:56:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F53980000;
 Thu,  3 Mar 2022 16:56:28 +0000 (UTC)
Date: Thu, 3 Mar 2022 17:56:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 1/3] block: Make bdrv_refresh_limits() non-recursive
Message-ID: <YiDzOnUmNYy9sABR@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
 <20220216105355.30729-2-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216105355.30729-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2022 um 11:53 hat Hanna Reitz geschrieben:
> bdrv_refresh_limits() recurses down to the node's children.  That does
> not seem necessary: When we refresh limits on some node, and then
> recurse down and were to change one of its children's BlockLimits, then
> that would mean we noticed the changed limits by pure chance.  The fact
> that we refresh the parent's limits has nothing to do with it, so the
> reason for the change probably happened before this point in time, and
> we should have refreshed the limits then.
> 
> On the other hand, we do not have infrastructure for noticing that block
> limits change after they have been initialized for the first time (this
> would require propagating the change upwards to the respective node's
> parents), and so evidently we consider this case impossible.

I like your optimistic approach, but my interpretation would have been
that this is simply a bug. ;-)

blockdev-reopen allows changing options that affect the block limits
(most importantly probably request_alignment), so this should be
propagated to the parents. I think we'll actually not see failures if we
forget to do this, but parents can either advertise excessive alignment
requirements or they may run into RMW when accessing the child, so this
would only affect performance. This is probably why nobody reported it
yet.

> If this case is impossible, then we will not need to recurse down in
> bdrv_refresh_limits().  Every node's limits are initialized in
> bdrv_open_driver(), and are refreshed whenever its children change.
> We want to use the childrens' limits to get some initial default, but
> we can just take them, we do not need to refresh them.

I think even if we need to propagate to the parents, we still don't need
to propagate to the children because the children have already been
refreshed by whatever changed their options (like bdrv_reopen_commit()).
And parent limits don't influence the child limits at all.

So this patch looks good to me, just not the reasoning.

Kevin

> The problem with recursing is that bdrv_refresh_limits() is not atomic.
> It begins with zeroing BDS.bl, and only then sets proper, valid limits.
> If we do not drain all nodes whose limits are refreshed, then concurrent
> I/O requests can encounter invalid request_alignment values and crash
> qemu.  Therefore, a recursing bdrv_refresh_limits() requires the whole
> subtree to be drained, which is currently not ensured by most callers.
> 
> A non-recursive bdrv_refresh_limits() only requires the node in question
> to not receive I/O requests, and this is done by most callers in some
> way or another:
> - bdrv_open_driver() deals with a new node with no parents yet
> - bdrv_set_file_or_backing_noperm() acts on a drained node
> - bdrv_reopen_commit() acts only on drained nodes
> - bdrv_append() should in theory require the node to be drained; in
>   practice most callers just lock the AioContext, which should at least
>   be enough to prevent concurrent I/O requests from accessing invalid
>   limits
> 
> So we can resolve the bug by making bdrv_refresh_limits() non-recursive.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1879437
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/io.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 4e4cb556c5..c3e7301613 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -189,10 +189,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
>      QLIST_FOREACH(c, &bs->children, next) {
>          if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
>          {
> -            bdrv_refresh_limits(c->bs, tran, errp);
> -            if (*errp) {
> -                return;
> -            }
>              bdrv_merge_limits(&bs->bl, &c->bs->bl);
>              have_limits = true;
>          }
> -- 
> 2.34.1
> 


