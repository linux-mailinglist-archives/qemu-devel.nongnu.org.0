Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA86494008
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:37:43 +0100 (CET)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFq0-0007le-0f
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nAFnU-0006YO-VV
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nAFnR-00016f-IE
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642617300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sacGJZ247avv46TG2x2mz1xZdOvHEo1HA6CPSiYavec=;
 b=KJzfqrTYQ/trRc11JzYriZlldMraQwkGaTaaP0xLjhgFRzUts4sl5ke8cEs7rx+87DKgAN
 bRXM/TWq0sDKz66NtNSXb0wAqJUsSm8SVZh74B9mFUawwpqqhF99hEQjWU6N3ihSxqnY+T
 Qn7N25xQcyKloFtGe1kG7Bs/C/Qx52Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-YH0eX-IGNwip0mZf6eZiuA-1; Wed, 19 Jan 2022 13:34:57 -0500
X-MC-Unique: YH0eX-IGNwip0mZf6eZiuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8238343CB;
 Wed, 19 Jan 2022 18:34:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB61C8794B;
 Wed, 19 Jan 2022 18:34:43 +0000 (UTC)
Date: Wed, 19 Jan 2022 19:34:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 28/31] block.c: assert BQL lock held in
 bdrv_co_invalidate_cache
Message-ID: <YehZwkGVPK6phrc2@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-29-eesposit@redhat.com>
 <56deaef1-6a4e-c544-9916-42a20cc20c7a@redhat.com>
 <9ca5c434-ddf6-2ed3-08ae-92da5fc98013@redhat.com>
 <b1e190b3-7466-0d4e-554b-bd9d4ce5a43e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b1e190b3-7466-0d4e-554b-bd9d4ce5a43e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.12.2021 um 13:20 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> On 17/12/2021 17:38, Emanuele Giuseppe Esposito wrote:
> > 
> > 
> > On 17/12/2021 12:04, Hanna Reitz wrote:
> > > On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
> > > > bdrv_co_invalidate_cache is special: it is an I/O function,
> > > 
> > > I still don’t believe it is, but well.
> > > 
> > > (Yes, it is called by a test in an iothread, but I believe we’ve
> > > seen that the tests simply sometimes test things that shouldn’t be
> > > allowed.)
> > > 
> > > > but uses the block layer permission API, which is GS.
> > > > 
> > > > Because of this, we can assert that either the function is
> > > > being called with BQL held, and thus can use the permission API,
> > > > or make sure that the permission API is not used, by ensuring that
> > > > bs (and parents) .open_flags does not contain BDRV_O_INACTIVE.
> > > > 
> > > > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > > ---
> > > >   block.c | 26 ++++++++++++++++++++++++++
> > > >   1 file changed, 26 insertions(+)
> > > > 
> > > > diff --git a/block.c b/block.c
> > > > index a0309f827d..805974676b 100644
> > > > --- a/block.c
> > > > +++ b/block.c
> > > > @@ -6574,6 +6574,26 @@ void bdrv_init_with_whitelist(void)
> > > >       bdrv_init();
> > > >   }
> > > > +static bool bdrv_is_active(BlockDriverState *bs)
> > > > +{
> > > > +    BdrvChild *parent;
> > > > +
> > > > +    if (bs->open_flags & BDRV_O_INACTIVE) {
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    QLIST_FOREACH(parent, &bs->parents, next_parent) {
> > > > +        if (parent->klass->parent_is_bds) {
> > > > +            BlockDriverState *parent_bs = parent->opaque;
> > > 
> > > This looks like a really bad hack to me.  We purposefully have made
> > > the parent link opaque so that a BDS cannot easily reach its
> > > parents.  All accesses should go through BdrvChildClass methods.
> > > 
> > > I also don’t understand why we need to query parents at all.  The
> > > only fact that determines whether the current BDS will have its
> > > permissions changed is whether the BDS itself is active or
> > > inactive.  Sure, we’ll invoke bdrv_co_invalidate_cache() on the
> > > parents, too, but then we could simply let the assertion fail there.
> > > 
> > > > +            if (!bdrv_is_active(parent_bs)) {
> > > > +                return false;
> > > > +            }
> > > > +        }
> > > > +    }
> > > > +
> > > > +   return true;
> > > > +}
> > > > +
> > > >   int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState
> > > > *bs, Error **errp)
> > > >   {
> > > >       BdrvChild *child, *parent;
> > > > @@ -6585,6 +6605,12 @@ int coroutine_fn
> > > > bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
> > > >           return -ENOMEDIUM;
> > > >       }
> > > > +    /*
> > > > +     * No need to muck with permissions if bs is active.
> > > > +     * TODO: should activation be a separate function?
> > > > +     */
> > > > +    assert(qemu_in_main_thread() || bdrv_is_active(bs));
> > > > +
> > > 
> > > I don’t understand this, really.  It looks to me like “if you don’t
> > > call this in the main thread, this better be a no-op”, i.e., you
> > > must never call this function in an I/O thread if you really want to
> > > use it.  I.e. what I’d classify as a GS function.
> > > 
> > > It sounds like this is just a special case for said test, and
> > > special-casing code for tests sounds like a bad idea.
> > 
> > Ok, but trying to leave just the qemu_in_main_thread() assertion makes
> > test 307 (./check 307) fail.
> > I am actually not sure on why it fails, but I am sure it is because of
> > the assertion, since without it it passes.
> > 
> > I tried with gdb (./check -gdb 307 on one terminal and
> > gdb -iex "target remote localhost:12345"
> > in another) but it points me to this below, which I think is the ndb
> > server getting the socket closed (because on the other side it crashed),
> > and not the actual error.
> > 
> > 
> > Thread 1 "qemu-system-x86" received signal SIGPIPE, Broken pipe.
> > 0x00007ffff68af54d in sendmsg () from target:/lib64/libc.so.6
> > (gdb) bt
> > #0  0x00007ffff68af54d in sendmsg () from target:/lib64/libc.so.6
> > #1  0x0000555555c13cc9 in qio_channel_socket_writev (ioc=<optimized
> > out>, iov=0x5555569a4870, niov=1, fds=0x0, nfds=<optimized out>,
> > errp=0x0)
> >      at ../io/channel-socket.c:561
> > #2  0x0000555555c19b18 in qio_channel_writev_full_all
> > (ioc=0x55555763b800, iov=iov@entry=0x7fffe8dffd80, niov=niov@entry=1,
> > fds=fds@entry=0x0,
> >      nfds=nfds@entry=0, errp=errp@entry=0x0) at ../io/channel.c:240
> > #3  0x0000555555c19bd2 in qio_channel_writev_all (errp=0x0, niov=1,
> > iov=0x7fffe8dffd80, ioc=<optimized out>) at ../io/channel.c:220
> > #4  qio_channel_write_all (ioc=<optimized out>,
> > buf=buf@entry=0x7fffe8dffdd0 "", buflen=buflen@entry=20,
> > errp=errp@entry=0x0) at ../io/channel.c:330
> > #5  0x0000555555c27e75 in nbd_write (errp=0x0, size=20,
> > buffer=0x7fffe8dffdd0, ioc=<optimized out>) at ../nbd/nbd-internal.h:71
> > #6  nbd_negotiate_send_rep_len (client=client@entry=0x555556f60930,
> > type=type@entry=1, len=len@entry=0, errp=errp@entry=0x0) at
> > ../nbd/server.c:203
> > #7  0x0000555555c29db1 in nbd_negotiate_send_rep (errp=0x0, type=1,
> > client=0x555556f60930) at ../nbd/server.c:211
> > --Type <RET> for more, q to quit, c to continue without paging--
> > #8  nbd_negotiate_options (errp=0x7fffe8dffe88, client=<optimized out>)
> > at ../nbd/server.c:1224
> > #9  nbd_negotiate (errp=0x7fffe8dffe88, client=<optimized out>) at
> > ../nbd/server.c:1340
> > #10 nbd_co_client_start (opaque=<optimized out>) at ../nbd/server.c:2715
> > #11 0x0000555555d70423 in coroutine_trampoline (i0=<optimized out>,
> > i1=<optimized out>) at ../util/coroutine-ucontext.c:173
> > #12 0x00007ffff67f3820 in ?? () from target:/lib64/libc.so.6
> > #13 0x00007fffffffca80 in ?? ()
> > 
> 
> Ok the reason for this is line 89 of tests/qemu-iotests/307:
> 
> # Should ignore the iothread conflict, but then fail because of the
> # permission conflict (and not crash)
> vm.qmp_log('block-export-add', id='export1', type='nbd', node_name='null',
>                iothread='iothread1', fixed_iothread=False, writable=True)
> 
> This calls qmp_block_export_add() and then blk_exp_add(), that calls
> bdrv_invalidate_cache().
> Both functions are running in the main thread, but then
> bdrv_invalidate_cache invokes bdrv_co_invalidate_cache() as a coroutine in
> the AioContext of the given bs, so not the main loop.
> 
> So Hanna, what should we do here? This seems very similar to the discussion
> in patch 22, ie run blockdev-create (in this case block-export-add, which
> seems similar?) involving nodes in I/O threads.

My gut feeling is that the bug is that we're entering coroutine context
in the node's iothread too early. I think the only place where we really
need it is the bs->drv->bdrv_co_invalidate_cache() call.

In fact, not only permission code, but also parent->klass->activate()
must be run in the main thread. The only implementation of the callback
is blk_root_activate(), and it calls some permissions functions, too,
but also qemu_add_vm_change_state_handler(), which doesn't look thread
safe. Unlikely to ever cause problems and if it does, it won't be
reproducible, but still a bug.

So if we go back to a bdrv_invalidate_cache() that does all the graph
manipulations (and asserts that we're in the main loop) and then have a
much smaller bdrv_co_invalidate_cache() that basically just calls into
the driver, would that solve the problem?

Kevin


