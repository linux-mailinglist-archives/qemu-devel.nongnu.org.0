Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD235A147
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:39:34 +0200 (CEST)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsIG-0003v5-JN
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUsH9-00033C-1c; Fri, 09 Apr 2021 10:38:23 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:47356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUsH1-0005Mx-7q; Fri, 09 Apr 2021 10:38:20 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 88C102E168B;
 Fri,  9 Apr 2021 17:38:06 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 RRVrLVRJuz-c608ub5l; Fri, 09 Apr 2021 17:38:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617979086; bh=196pV6BGNQR7tAH9Nhj/sw2xg+Jj+aD1Ow4VjOERN6w=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=JUNloouatcARaKv/xDfOEWCZ3edwP13zTfwgMdauBIp+s14MNqvipyGKZjurq2oV9
 MpQKUrUOSaNvaFkfkVyATwkWBwZrMMsR4g87KO3JRJQTWOuTGye483vo6Cqbx8VXVE
 YmcobTYia/NXBEt74EfdcVFtHjrmzni8wrG6E/zA=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 iC5OLSH5G8-c5oq7Fha; Fri, 09 Apr 2021 17:38:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 9 Apr 2021 17:38:00 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 03/10] util/async: aio_co_enter(): do aio_co_schedule
 in general case
Message-ID: <YHBmyJ8atP4tzh/C@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-4-vsementsov@virtuozzo.com>
 <YG8nNsQE+AQQj8gZ@rvkaganb.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG8nNsQE+AQQj8gZ@rvkaganb.lan>
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 06:54:30PM +0300, Roman Kagan wrote:
> On Thu, Apr 08, 2021 at 05:08:20PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > With the following patch we want to call aio_co_wake() from thread.
> > And it works bad.
> > Assume we have no iothreads.
> > Assume we have a coroutine A, which waits in the yield point for external
> > aio_co_wake(), and no progress can be done until it happen.
> > Main thread is in blocking aio_poll() (for example, in blk_read()).
> > 
> > Now, in a separate thread we do aio_co_wake(). It calls  aio_co_enter(),
> > which goes through last "else" branch and do aio_context_acquire(ctx).
> > 
> > Now we have a deadlock, as aio_poll() will not release the context lock
> > until some progress is done, and progress can't be done until
> > aio_co_wake() wake the coroutine A. And it can't because it wait for
> > aio_context_acquire().
> > 
> > Still, aio_co_schedule() works well in parallel with blocking
> > aio_poll(). So let's use it in generic case and drop
> > aio_context_acquire/aio_context_release branch from aio_co_enter().
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> >  util/async.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> > 
> > diff --git a/util/async.c b/util/async.c
> > index 674dbefb7c..f05b883a39 100644
> > --- a/util/async.c
> > +++ b/util/async.c
> > @@ -614,19 +614,12 @@ void aio_co_wake(struct Coroutine *co)
> >  
> >  void aio_co_enter(AioContext *ctx, struct Coroutine *co)
> >  {
> > -    if (ctx != qemu_get_current_aio_context()) {
> > -        aio_co_schedule(ctx, co);
> > -        return;
> > -    }
> > -
> > -    if (qemu_in_coroutine()) {
> > +    if (ctx == qemu_get_current_aio_context() && qemu_in_coroutine()) {
> >          Coroutine *self = qemu_coroutine_self();
> >          assert(self != co);
> >          QSIMPLEQ_INSERT_TAIL(&self->co_queue_wakeup, co, co_queue_next);
> >      } else {
> > -        aio_context_acquire(ctx);
> > -        qemu_aio_coroutine_enter(ctx, co);
> > -        aio_context_release(ctx);
> > +        aio_co_schedule(ctx, co);
> >      }
> >  }
> 
> I'm fine with the change, but I find the log message to be a bit
> confusing (although correct).  AFAICS the problem is that calling
> aio_co_enter from a thread which has no associated aio_context works
> differently compared to calling it from a proper iothread: if the target
> context was qemu_aio_context, an iothread would just schedule the
> coroutine there, while a "dumb" thread would try lock the context
> potentially resulting in a deadlock.  This patch makes "dumb" threads
> and iothreads behave identically when entering a coroutine on a foreign
> context.
> 
> You may want to rephrase the log message to that end.
> 
> Anyway
> 
> Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

I was too quick to reply.  Turns out this patch breaks a lot of stuff;
apparently the original behavior is relied upon somewhere.
In particular, in iotest 008 basic checks with '--aio threads' fail due
to the device being closed before the operation is performed, so the
latter returns with -ENOMEDIUM:

# .../qemu-io --cache writeback --aio threads -f qcow2 \
	-c 'aio_read -P 0xa 0 128M' .../scratch/t.qcow2 -T blk_\*
blk_root_attach child 0x560e9fb65a70 blk 0x560e9fb647b0 bs 0x560e9fb5f4b0
blk_root_detach child 0x560e9fb65a70 blk 0x560e9fb647b0 bs 0x560e9fb5f4b0
blk_root_attach child 0x560e9fb65a70 blk 0x560e9fb4c420 bs 0x560e9fb581a0
blk_root_detach child 0x560e9fb65a70 blk 0x560e9fb4c420 bs 0x560e9fb581a0
blk_co_preadv blk 0x560e9fb4c420 bs (nil) offset 0 bytes 134217728 flags 0x0
readv failed: No medium found

Let's drop this and get back to the original scheme with wakeup via BH.
It'll look just as nice, but won't touch the generic infrastructure with
unpredictable consequences.

Thanks,
Roman.

