Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02B2D2FC5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:35:24 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfxT-0000uh-Bk
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmftE-0007sM-Uv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:31:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmftA-000259-Ld
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607445055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zTUjzM5gqH1fG+qW3jFZKtlutKE8PaPYqw+LGUokGgY=;
 b=PSdfIUORLHCOTLA5NjGLMsgH1RUikhe1SsDVq+e2iMFbcVAqaD9QieeYpv1sqBA4lI/o28
 3jHJNxzDAcdGJJzWjODNcdlYkBiTyH31SKJ7yvXt7mDtVglZu1rUnlzRuymQZePAKlxEAj
 tLvQz54MaKtYgZxsGrF+wsszhtuxRqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-cKhCkLJbOcqhotINb5yyTg-1; Tue, 08 Dec 2020 11:30:53 -0500
X-MC-Unique: cKhCkLJbOcqhotINb5yyTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0071083EBF;
 Tue,  8 Dec 2020 16:30:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19C4460877;
 Tue,  8 Dec 2020 16:30:46 +0000 (UTC)
Date: Tue, 8 Dec 2020 17:30:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/3] block: Fix locking in qmp_block_resize()
Message-ID: <20201208163045.GB6392@merkur.fritz.box>
References: <20201203172311.68232-1-kwolf@redhat.com>
 <20201203172311.68232-3-kwolf@redhat.com>
 <b0ad26a7-7db2-86bd-7001-f360ccf3b20e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b0ad26a7-7db2-86bd-7001-f360ccf3b20e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mreitz@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.12.2020 um 15:46 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 03.12.2020 20:23, Kevin Wolf wrote:
> > The drain functions assume that we hold the AioContext lock of the
> > drained block node. Make sure to actually take the lock.
> > 
> > Cc: qemu-stable@nongnu.org
> > Fixes: eb94b81a94bce112e6b206df846c1551aaf6cab6
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   blockdev.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/blockdev.c b/blockdev.c
> > index 229d2cce1b..0535a8dc9e 100644
> > --- a/blockdev.c
> > +++ b/blockdev.c
> > @@ -2481,13 +2481,16 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
> >           return;
> >       }
> > +    bdrv_co_lock(bs);
> >       bdrv_drained_begin(bs);
> > +    bdrv_co_unlock(bs);
> > +
> >       old_ctx = bdrv_co_enter(bs);
> >       blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
> >       bdrv_co_leave(bs, old_ctx);
> > -    bdrv_drained_end(bs);
> >       bdrv_co_lock(bs);
> > +    bdrv_drained_end(bs);
> >       blk_unref(blk);
> >       bdrv_co_unlock(bs);
> >   }
> > 
> 
> Can't we just do
> 
>     old_ctx = bdrv_co_enter(bs);
> 
>     bdrv_drained_begin(bs);
>     blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
>     bdrv_drained_end(bs);
>     blk_unref(blk);
> 
>     bdrv_co_leave(bs, old_ctx);
> 
> 
> ? This way we have one acquire/release section instead of three in a
> row.. But then we probably need addition bdrv_ref/bdrv_unref, to not
> crash with final bdrv_co_leave after blk_unref.

That was my first attempt, but bdrv_co_enter()/leave() increase
bs->in_flight, so the drain would deadlock.

> Also, preexisting, but it seems not good that coroutine_fn
> qmp_block_resize is called from non-coroutine hmp_block_resize()

hmp_block_resize() is actually in coroutine context, commit eb94b81a
only forgot to add a coroutine_fn marker to it.

> anyway:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks!

Kevin


