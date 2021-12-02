Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A6466006
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 09:55:34 +0100 (CET)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mshsK-0003ic-UT
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 03:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mshr0-0002JW-0i
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 03:54:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mshqW-0007k1-5N
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 03:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638435212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6UZurwShqPdMDchm1mPQu9rJqlp+WWeLlPkbRGqAJQ=;
 b=FeJuS6x7sV09btIFbgIuZe52Q7ikWl6iXZWbWVWwccNlSk2pT6zgF90ROjix7lwGiXCwfV
 Mi7EwNHL3ydBG4nx9TPHSxXHl94P//OPVYvSXWdwkTsBLP7SxgJU0NNEsf+mVM3sD6eRZV
 a375/LaoXWy4KMIWhgUMSoYe6nRi4AE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123-4Xq0KsatMP2vqJa961aTdw-1; Thu, 02 Dec 2021 03:53:28 -0500
X-MC-Unique: 4Xq0KsatMP2vqJa961aTdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 783B8363A7;
 Thu,  2 Dec 2021 08:53:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 695A95FC22;
 Thu,  2 Dec 2021 08:53:25 +0000 (UTC)
Date: Thu, 2 Dec 2021 08:53:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO
 exits cleanly in some corner case
Message-ID: <YaiJgpEahjc1OyR4@redhat.com>
References: <20211201075427.155702-1-lei.rao@intel.com>
 <Yac8B76dAulyx+2T@redhat.com>
 <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
 <a1706788-2f28-9948-f68f-a6fd51b81fa3@virtuozzo.com>
 <836f8fe3-5262-d179-a66a-325935ec7005@intel.com>
MIME-Version: 1.0
In-Reply-To: <836f8fe3-5262-d179-a66a-325935ec7005@intel.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 01:14:47PM +0800, Rao, Lei wrote:
> Sorry, resending with correct indentation and quoting.
> 
> On 12/1/2021 10:27 PM, Vladimir Sementsov-Ogievskiy wrote:
> > 01.12.2021 12:48, Rao, Lei wrote:
> > > 
> > > 
> > > -----Original Message-----
> > > From: Daniel P. Berrangé <berrange@redhat.com>
> > > Sent: Wednesday, December 1, 2021 5:11 PM
> > > To: Rao, Lei <lei.rao@intel.com>
> > > Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
> > > Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
> > > 
> > > On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
> > > >      We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
> > > >      The patch fixes as follow:
> > > >          #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> > > >          #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
> > > >          #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
> > > >          #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
> > > >          #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
> > > >          #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
> > > >          #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
> > > >          #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
> > > >          #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
> > > >          #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
> > > >              at qapi/qmp-dispatch.c:132
> > > >          #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
> > > >          #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
> > > >          #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
> > > >          #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
> > > >          #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
> > > >          #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
> > > >          #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
> > > >          #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > > >          #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
> > > >          #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
> > > >          #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
> > > >          #21 0x00005563d658f5ed in main_loop () at vl.c:1814
> > > >          #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
> > > > envp=0x7fff3cf5c2b8) at vl.c:450
> > > > 
> > > >      From the call trace, we can see that the QEMU main thread is waiting for the in_flight return to zero. But the in_filght never reaches 0.
> > > >      After analysis, the root cause is that the coroutine of NBD was not awakened. Although this bug was found in the COLO test, I think this is a
> > > >      universal problem in the QIO module. This issue also affects other modules depending on QIO such as NBD. We dump the following data:
> > > >      $2 = {
> > > >        in_flight = 2,
> > > >        state = NBD_CLIENT_QUIT,
> > > >        connect_status = 0,
> > > >        connect_err = 0x0,
> > > >        wait_in_flight = false,
> > > >        requests = {{
> > > >            coroutine = 0x0,
> > > >            offset = 273077071872,
> > > >            receiving = false,
> > > >          }, {
> > > >            coroutine = 0x7f1164571df0,
> > > >            offset = 498792529920,
> > > >            receiving = false,
> > > >          }, {
> > > >            coroutine = 0x0,
> > > >            offset = 500663590912,
> > > >            receiving = false,
> > > >          }, {
> > > >            ...
> > > >          } },
> > > >        reply = {
> > > >          simple = {
> > > >            magic = 1732535960,
> > > >            error = 0,
> > > >            handle = 0
> > > >          },
> > > >          structured = {
> > > >            magic = 1732535960,
> > > >            flags = 0,
> > > >            type = 0,
> > > >            handle = 0,
> > > >            length = 0
> > > >          },
> > > >          {
> > > >            magic = 1732535960,
> > > >            _skip = 0,
> > > >            handle = 0
> > > >          }
> > > >        },
> > > >        bs = 0x7f11640e2140,
> > > >        reconnect_delay = 0,
> > > >        saddr = 0x7f11640e1f80,
> > > >        export = 0x7f11640dc560 "parent0",
> > > >      }
> > > >      From the data, we can see the coroutine of NBD does not exit normally when killing the NBD server(we kill the Secondary VM in the COLO stress test).
> > > >      Then it will not execute in_flight--. So, the QEMU main thread will hang here. Further analysis, I found the coroutine of NBD will yield
> > > >      in nbd_send_request() or qio_channel_write_all() in nbd_co_send_request. By the way, the yield is due to the kernel return EAGAIN(under the stress test).
> > > >      However, NBD didn't know it would yield here. So, the nbd_recv_coroutines_wake won't wake it up because req->receiving is false. if the NBD server
> > > >      is terminated abnormally at the same time. The G_IO_OUT will be invalid, the coroutine will never be awakened. In addition, the s->ioc will be released
> > > >      immediately. if we force to wake up the coroutine of NBD, access to the ioc->xxx will cause segment fault. Finally, I add a state named force_quit to
> > > >      the QIOChannel to ensure that QIO will exit immediately. And I add the function of qio_channel_coroutines_wake to wake it up.
> > 
> > If qio_channel_shutdown() can't kill request that is in qio_channel_write_all() - it's not a reponsibility of nbd driver, qio channel layer should take care of this..
> > 
> > Or, you probably need some keep-alive settings set up.
> > 
> > > > 
> > > > Signed-off-by: Lei Rao <lei.rao@intel.com>
> > > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > > ---
> > > >   block/nbd.c          |  5 +++++
> > > >   include/io/channel.h | 19 +++++++++++++++++++
> > > >   io/channel.c         | 22 ++++++++++++++++++++++
> > > >   3 files changed, 46 insertions(+)
> > > > 
> > > > diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
> > > > 100644
> > > > --- a/block/nbd.c
> > > > +++ b/block/nbd.c
> > > > @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
> > > >       assert(!s->in_flight);
> > > >       if (s->ioc) {
> > > > +        qio_channel_set_force_quit(s->ioc, true);
> > > > +        qio_channel_coroutines_wake(s->ioc);
> > > >           qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
> > > > NULL);
> > > 
> > > Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
> > > poll() loop. We shouldn't need to add a second way to break out of the poll().
> > > 
> > > Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
> > > It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
> > > nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
> > > 
> > 
> > What do you mean by "the NBD coroutine" and by "forcibly wake up"?
> > 
> > In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.
> > 
> > Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.
> > 
> > Also, there is good mechanism to debug coroutines in gdb:
> > 
> > source scripts/qemu-gdb.py
> > qemu coroutine <coroutine pointer>
> > 
> > - it will dump stack trace of a coroutine, it may help.
> > 
> > Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.
> 
> I am sorry for the unclear description. The NBD coroutine means the request coroutines.
> 
> About "the forcibly wake up" I just set the receiving to true before qio_channel_writev_all() in nbd_co_send_request()
> to ensure that the request coroutines can be awakened by nbd_recv_coroutine_wake_one(). But that's just a test.
> 
> The issue is, only waking up the request coroutine or shutdown the QIO is not enough because there will be a synchronization issue.
> For example, When the NBD request coroutine is awakened in qio_channel_writev_full_all(), it will continue to access the ioc->xxx,
> but the ioc has been set to NULL in nbd_co_do_establish_connection(); it will cause segment fault.

That is a serious bug. Nothing is permitted to free the QIOChannel while a
qio_channel_writev_full_all API call (or any other I/O call is in progress).

If multiple threads are involved, then each needs to be holding a reference
the QIOChannel to stop it being freed while in use.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


