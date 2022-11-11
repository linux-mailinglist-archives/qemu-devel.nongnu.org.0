Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB1625FDF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 17:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otXIh-0007GC-Os; Fri, 11 Nov 2022 11:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otXIb-0007Fg-Lm
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:54:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otXIa-0008Fl-3e
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668185673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BgSMyecpdjcve5jvMTZmGBHWDho5+PadRDOxdWJTFbM=;
 b=B1t5LkvjdiqDLGB5ug7ONjU59j5rY3p5qGdqC0zMI9+xBJh1KMdqyY011UqFg2kdd/6dW5
 fWXcrCyh/qTp9ssW8PvPTBtxRFUBbMY8HTllImR9mKPkmqvfg6IB+lzaOYw1laUC2ZlsGP
 Qxr2V/XZQBcSLF7h26G0Kq5uQFyyxFU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-jXvj7D6IPvaO137EDikeWg-1; Fri, 11 Nov 2022 11:54:30 -0500
X-MC-Unique: jXvj7D6IPvaO137EDikeWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA9FC101A54E;
 Fri, 11 Nov 2022 16:54:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E5101415127;
 Fri, 11 Nov 2022 16:54:28 +0000 (UTC)
Date: Fri, 11 Nov 2022 17:54:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 06/13] block: Drain invidual nodes during reopen
Message-ID: <Y259Avl8KeoGyB2e@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-7-kwolf@redhat.com>
 <18167aa9-e9e6-ea2c-ad96-68a7c972a371@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18167aa9-e9e6-ea2c-ad96-68a7c972a371@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Am 09.11.2022 um 17:00 hat Vladimir Sementsov-Ogievskiy geschrieben:
> In subject: individual
> 
> On 11/8/22 15:37, Kevin Wolf wrote:
> > bdrv_reopen() and friends use subtree drains as a lazy way of covering
> > all the nodes they touch. Turns out that this lazy way is a lot more
> > complicated than just draining the nodes individually, even not
> > accounting for the additional complexity in the drain mechanism itself.
> > 
> > Simplify the code by switching to draining the individual nodes that are
> > already managed in the BlockReopenQueue anyway.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   block.c             | 11 ++++-------
> >   block/replication.c |  6 ------
> >   blockdev.c          | 13 -------------
> >   3 files changed, 4 insertions(+), 26 deletions(-)
> > 
> 
> [..]
> 
> >       bdrv_reopen_queue_free(queue);
> > -    for (p = drained; p; p = p->next) {
> > -        BlockDriverState *bs = p->data;
> > -        AioContext *ctx = bdrv_get_aio_context(bs);
> > -
> > -        aio_context_acquire(ctx);
> 
> In bdrv_reopen_queue_free() we don't have this acquire()/release()
> pair around bdrv_drained_end(). We don't need it anymore?

Good catch, I think we do.

Reopen is a bit messy with AioContext locks. I think the rule is
supposed to be that bdrv_reopen_queue() requires that the lock for
bs->aio_context is held, and bdrv_reopen_multiple() requires that no
AioContext lock is held, right?

Because the former is not actually true: qmp_blockdev_reopen() and the
'replication' block driver do indeed take the lock, but bdrv_reopen()
drops it for both functions!

So I think we also need an additional fix for bdrv_reopen() to drop the
lock only after calling bdrv_reopen_queue(). It may not have made a
difference before, but now that we call bdrv_drained_begin() in it, it
seems important.

Kevin


