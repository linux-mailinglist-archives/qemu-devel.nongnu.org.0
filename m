Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2B230DD73
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:03:16 +0100 (CET)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JgZ-0002ZY-TU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l7Je1-0001Jm-3y; Wed, 03 Feb 2021 10:00:37 -0500
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:47724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l7Jdw-0000Ep-AL; Wed, 03 Feb 2021 10:00:35 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 3FB642E14DE;
 Wed,  3 Feb 2021 18:00:26 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 khkBx7bRYC-0O08pajq; Wed, 03 Feb 2021 18:00:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1612364426; bh=VOm7AS6hywWWWtOPO4YKz7cOOAFaleY3jve9jh6YOD4=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=sL/tdMEJ3R8S+r1gIVVQro/Hg6d4QnJpXtnljZsTHUMW2dJjtUar45gMoH23BpY0B
 RyXlVAU368YcT5YVJ9aBc9Br0Nw3zfwaRJUOnA7QKTfumGa+EsOWw7Ftf+2IK1Amhx
 k7RLqgw6djuO0s6NfeGbvY5To/XVpzN60rrSwUTc=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:316::1:11])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 UV2IDMYmnS-0Oo0p9pU; Wed, 03 Feb 2021 18:00:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 3 Feb 2021 18:00:20 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/4] block/nbd: fix drain dead-lock because of nbd
 reconnect-delay
Message-ID: <20210203150020.GE2786@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, den@openvz.org
References: <20200903190301.367620-1-vsementsov@virtuozzo.com>
 <20200903190301.367620-2-vsementsov@virtuozzo.com>
 <20210203105305.GA113539@rvkaganb.lan>
 <903d9c6f-b6ed-cff7-b2d3-29945165f6d0@virtuozzo.com>
 <20210203142140.GD2786@rvkaganb.lan>
 <e4387e05-4963-e335-3002-ddbbcf5aaf82@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4387e05-4963-e335-3002-ddbbcf5aaf82@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 05:44:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 03.02.2021 17:21, Roman Kagan wrote:
> > On Wed, Feb 03, 2021 at 04:10:41PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 03.02.2021 13:53, Roman Kagan wrote:
> > > > On Thu, Sep 03, 2020 at 10:02:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > We pause reconnect process during drained section. So, if we have some
> > > > > requests, waiting for reconnect we should cancel them, otherwise they
> > > > > deadlock the drained section.
> > > > > 
> > > > > How to reproduce:
> > > > > 
> > > > > 1. Create an image:
> > > > >      qemu-img create -f qcow2 xx 100M
> > > > > 
> > > > > 2. Start NBD server:
> > > > >      qemu-nbd xx
> > > > > 
> > > > > 3. Start vm with second nbd disk on node2, like this:
> > > > > 
> > > > >     ./build/x86_64-softmmu/qemu-system-x86_64 -nodefaults -drive \
> > > > >        file=/work/images/cent7.qcow2 -drive \
> > > > >        driver=nbd,server.type=inet,server.host=192.168.100.5,server.port=10809,reconnect-delay=60 \
> > > > >        -vnc :0 -m 2G -enable-kvm -vga std
> > > > > 
> > > > > 4. Access the vm through vnc (or some other way?), and check that NBD
> > > > >      drive works:
> > > > > 
> > > > >      dd if=/dev/sdb of=/dev/null bs=1M count=10
> > > > > 
> > > > >      - the command should succeed.
> > > > > 
> > > > > 5. Now, kill the nbd server, and run dd in the guest again:
> > > > > 
> > > > >      dd if=/dev/sdb of=/dev/null bs=1M count=10
> > > > > 
> > > > > Now Qemu is trying to reconnect, and dd-generated requests are waiting
> > > > > for the connection (they will wait up to 60 seconds (see
> > > > > reconnect-delay option above) and than fail). But suddenly, vm may
> > > > > totally hang in the deadlock. You may need to increase reconnect-delay
> > > > > period to catch the dead-lock.
> > > > > 
> > > > > VM doesn't respond because drain dead-lock happens in cpu thread with
> > > > > global mutex taken. That's not good thing by itself and is not fixed
> > > > > by this commit (true way is using iothreads). Still this commit fixes
> > > > > drain dead-lock itself.
> > > > > 
> > > > > Note: probably, we can instead continue to reconnect during drained
> > > > > section. To achieve this, we may move negotiation to the connect thread
> > > > > to make it independent of bs aio context. But expanding drained section
> > > > > doesn't seem good anyway. So, let's now fix the bug the simplest way.
> > > > > 
> > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > > ---
> > > > >    block/nbd.c | 5 +++++
> > > > >    1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/block/nbd.c b/block/nbd.c
> > > > > index 9daf003bea..912ea27be7 100644
> > > > > --- a/block/nbd.c
> > > > > +++ b/block/nbd.c
> > > > > @@ -242,6 +242,11 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
> > > > >        }
> > > > >        nbd_co_establish_connection_cancel(bs, false);
> > > > > +
> > > > > +    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
> > > > > +        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
> > > > > +        qemu_co_queue_restart_all(&s->free_sema);
> > > > > +    }
> > > > >    }
> > > > >    static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
> > > > 
> > > > This basically defeats the whole purpose of reconnect: if the nbd client
> > > > is trying to reconnect, drain effectively cancels that and makes all
> > > > in-flight requests to complete with an error.
> > > > 
> > > > I'm not suggesting to revert this patch (it's now in the tree as commit
> > > > 8c517de24a), because the deadlock is no better, but I'm afraid the only
> > > > real fix is to implement reconnect during the drain section.  I'm still
> > > > trying to get my head around it so no patch yet, but I just wanted to
> > > > bring this up in case anybody beats me to it.
> > > > 
> > > 
> > > 
> > > What do you mean by "reconnect during drained section"? Trying to
> > > establish the connection? Or keeping in-flight requests instead of
> > > cancelling them? We can't keep in-flight requests during drained
> > > section, as it's the whole sense of drained-section: no in-flight
> > > requests. So we'll have to wait for them at drain_begin (waiting up to
> > > reconnect-delay, which doesn't seem good and triggers dead-lock for
> > > non-iothread environment) or just cancel them..
> > > 
> > > Do you argue that waiting on drained-begin is somehow better than
> > > cancelling?
> > 
> > Sorry I should have used more accurate wording to be clear.
> > 
> > Yes, my point is that canceling the requests on entry to a drained
> > section is incorrect.  And no, it doesn't matter if it can be long:
> > that's the price you pay for doing the drain.  Think of reconnect as a
> > special case of a slow connection: if an nbd reply from the server is
> > delayed for whatever reason without dropping the connection, you have to
> > wait here, too.  (In fact, reconnect is even slightly better here since
> > it has a configurable finite timeout while the message delay does not
> > AFAIK.)
> > 
> > Does it make sense?
> 
> Hmm, yes..
> 
> But then we should fix the original deadlock some other way.

Exactly.

> Probably it will be possible only by using iothread for nbd node (I
> failed to find original thread where someone said that iothreads is a
> solution). And than we can do cancel in nbd_client_co_drain_begin()
> only if bs doesn't have a separate iothread.

Without this commit, I see qemu hang with nbd in an iothread, too.  I'll
double-check if it's that very same deadlock or something else.

Thanks,
Roman.

