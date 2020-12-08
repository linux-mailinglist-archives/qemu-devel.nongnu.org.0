Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1362D3145
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:40:12 +0100 (CET)
Received: from localhost ([::1]:39202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgyB-00072e-JV
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmgvn-0005jP-VE
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:37:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmgvf-0002fg-98
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607449053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZY45SDgRK86Efcgr2vGQDyMAzqlWv+yes2AqqWvgKc4=;
 b=jIDzycnon/R5aK3NzfZQuvQgyUFQkwfWSfBosFIc+OsSw38F2uYh47wsTUbgoQvPYej5wV
 iQgCntZcYsAVHe7E27J8Wd5Ab51glw5N5sgzCln+6xj306EUyjB9n+B7uLIb4OehhA2vKd
 /tk6eBb1cazcd7hTDTPALohK1ViywgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-Ofmv3mP3NMOJ_ay83xeM0g-1; Tue, 08 Dec 2020 12:37:31 -0500
X-MC-Unique: Ofmv3mP3NMOJ_ay83xeM0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FDD31005504;
 Tue,  8 Dec 2020 17:37:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4B641F41B;
 Tue,  8 Dec 2020 17:37:21 +0000 (UTC)
Date: Tue, 8 Dec 2020 18:37:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/3] block: Fix deadlock in bdrv_co_yield_to_drain()
Message-ID: <20201208173720.GC24068@merkur.fritz.box>
References: <20201203172311.68232-1-kwolf@redhat.com>
 <20201203172311.68232-4-kwolf@redhat.com>
 <c8856d43-a039-6bd5-a0cf-bacc26d6dd64@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <c8856d43-a039-6bd5-a0cf-bacc26d6dd64@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Am 08.12.2020 um 16:33 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 03.12.2020 20:23, Kevin Wolf wrote:
> > If bdrv_co_yield_to_drain() is called for draining a block node that
> > runs in a different AioContext, it keeps that AioContext locked while it
> > yields and schedules a BH in the AioContext to do the actual drain.
> > 
> > As long as executing the BH is the very next thing the event loop of the
> 
> s/thing the event/thing in the event/
> 
> (I've reread several times to understand :)

Oops, thanks.

"...the next thing that the event loop _does_" is actually what I had in
mind.

> > node's AioContext, this actually happens to work, but when it tries to
> > execute something else that wants to take the AioContext lock, it will
> > deadlock. (In the bug report, this other thing is a virtio-scsi device
> > running virtio_scsi_data_plane_handle_cmd().)
> > 
> > Instead, always drop the AioContext lock across the yield and reacquire
> > it only when the coroutine is reentered. The BH needs to unconditionally
> > take the lock for itself now.
> > 
> > This fixes the 'block_resize' QMP command on a block node that runs in
> > an iothread.
> > 
> > Cc: qemu-stable@nongnu.org
> > Fixes: eb94b81a94bce112e6b206df846c1551aaf6cab6
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1903511
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> I don't feel myself good enough in aio contexts acquiring and
> switching, to see any side effects. At least I don't see any obvious
> mistakes, so my weak:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> Note, I looked through the callers:
> 
> bdrv_do_drained_begin/end should be ok, as their normal usage is to
> start/end drained section under acquired aio context, so it seems
> correct to temporary release the context. Still I didn't check all
> drained sections in the code.
> 
> bdrv_drain_all_begin seems OK too (we just wait until everything is
> drained, not bad to temporary release the lock). Still I don't see any
> call of it from coroutine context.

The good thing there is that BDRV_POLL_WHILE() drops the lock anyway, so
at least for all callers of bdrv_do_drained_begin() that pass poll=true,
we know that they are fine with releasing the lock temporarily.

There are two callers that pass false: The recursive call inside the
function itself, and bdrv_drain_all_begin(). We know that both will poll
later, so they always release the lock at least once.

For ending the drain section, there is bdrv_drained_end_no_poll(), which
is only called in bdrv_child_cb_drained_end(), i.e. an implementation of
BdrvChildClass.drained_end. This is only called recursively in the
context of a polling drain_end, which already drops the lock.

So I think we don't introduce any cases of dropping the lock where this
wouldn't have happened before.

Kevin


