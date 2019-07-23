Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2F71469
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 10:52:56 +0200 (CEST)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpqXX-0003Qe-Tc
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 04:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37223)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hpqXL-0002xR-Oc
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 04:52:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hpqXK-0007af-NA
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 04:52:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hpqXI-0007Yn-Dw; Tue, 23 Jul 2019 04:52:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E5E5308FBB4;
 Tue, 23 Jul 2019 08:52:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-32.ams2.redhat.com
 [10.36.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 719871001B12;
 Tue, 23 Jul 2019 08:52:38 +0000 (UTC)
Date: Tue, 23 Jul 2019 10:52:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190723085236.GA5296@localhost.localdomain>
References: <20190722133054.21781-1-mreitz@redhat.com>
 <20190722133054.21781-3-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722133054.21781-3-mreitz@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 23 Jul 2019 08:52:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1 2/2] block: Only the main loop can
 change AioContexts
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.07.2019 um 15:30 hat Max Reitz geschrieben:
> bdrv_set_aio_context_ignore() can only work in the main loop:
> bdrv_drained_begin() only works in the main loop and the node's (old)
> AioContext; and bdrv_drained_end() really only works in the main loop
> and the node's (new) AioContext (contrary to its current comment, which
> is just wrong).
> 
> Consequentially, bdrv_set_aio_context_ignore() must be called from the
> main loop.  Luckily, assuming that we can make block graph changes only
> from the main loop as well, all its callers do that already.
> 
> Note that changing a node's context in a sense is an operation that
> changes the block graph, so it actually makes sense to require this
> function to be called from the main loop.
> 
> Also, fix bdrv_drained_end()'s description.  You can only use it from
> the main loop or the node's AioContext, and in the latter case, the
> whole subtree must be in the same context.
> 
> Fixes: e037c09c78520cbdb6da7cfc6ad0256d5870b814
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  include/block/block.h |  8 +++-----
>  block.c               | 13 ++++++++-----
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index 60f00479e0..50a07c1c33 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -667,11 +667,9 @@ void bdrv_subtree_drained_begin(BlockDriverState *bs);
>   *
>   * This polls @bs's AioContext until all scheduled sub-drained_ends
>   * have settled.  On one hand, that may result in graph changes.  On
> - * the other, this requires that all involved nodes (@bs and all of
> - * its parents) are in the same AioContext, and that the caller has
> - * acquired it.
> - * If there are any nodes that are in different contexts from @bs,
> - * these contexts must not be acquired.
> + * the other, this requires that the caller either runs in the main
> + * loop; or that all involved nodes (@bs and all of its parents) are
> + * in the caller's AioContext.
>   */
>  void bdrv_drained_end(BlockDriverState *bs);

I think you are right about the requirement that bdrv_drained_end() is
only called from the main or the BDS AioContext, which is a requirement
that directly comes from AIO_WAIT_WHILE().

However, I don't see why we have requirements on the AioContext of the
parent nodes (or any other nodes), except possibly not holding their
lock.  We don't poll their context, so it shouldn't matter in which
context they are?

Kevin

