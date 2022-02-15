Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A034B7A6E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:26:22 +0100 (CET)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6H7-00083O-4T
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:26:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK67d-0007k1-6d
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:16:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK67T-0007tV-VP
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644963377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MHwszGIlkgyLVAvksQifdb5i+WB35POGxmWqgxdVISw=;
 b=bIiCikdqlumjmko4R75hTuiqF5nahzWHjdUSO1m6vmFqNHKRsaiR8RLMqvvG0M3a/ahXAh
 Oicv6bvFvJE4OYdae27NfYsPnCRAb1+Tha3AP0i+21gHx9Q/4+APA55/Sha1OHaHMrugjj
 Xz/NX+mOB6ITuko4s0AaHeJxWeE6oKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-HDYFnPQENzu4Y4FC7Ovluw-1; Tue, 15 Feb 2022 17:16:16 -0500
X-MC-Unique: HDYFnPQENzu4Y4FC7Ovluw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DD051006AA3;
 Tue, 15 Feb 2022 22:16:15 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 500164D703;
 Tue, 15 Feb 2022 22:16:14 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:16:12 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/3] block: Make bdrv_refresh_limits() non-recursive
Message-ID: <20220215221612.uyosdgun5k34metf@redhat.com>
References: <20220215135727.28521-1-hreitz@redhat.com>
 <20220215135727.28521-2-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215135727.28521-2-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 02:57:25PM +0100, Hanna Reitz wrote:
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
> 
> If this case is impossible, then we will not need to recurse down in
> bdrv_refresh_limits().  Every node's limits are initialized in
> bdrv_open_driver(), and are refreshed whenever its children change.
> We want to use the childrens' limits to get some initial default, but we
> can just take them, we do not need to refresh them.
> 
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

Long explanation, but very helpful.

> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1879437
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/io.c | 4 ----
>  1 file changed, 4 deletions(-)

And deceptively simple fix!

Reviewed-by: Eric Blake <eblake@redhat.com>

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
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


