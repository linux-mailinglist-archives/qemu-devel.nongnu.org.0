Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D14229BB5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 17:44:57 +0200 (CEST)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyGvQ-0001Fb-Op
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 11:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyGuI-0000bF-5e
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 11:43:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30168
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyGuE-0006UW-T2
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 11:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595432621;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBZuz4PamwW8P8svm5J786dpG5EbNik7pqbf0eImoak=;
 b=NF5egOxkSIcLJib6Hy/1PCPdZRkpGqft2QomSmlTBTU3vslmXafP9UdwUCnhwP9wAiw+hv
 8Avhq5q5Z24HXgdSFY+uS/5N5PT7ya4l40Jsn7/nSRtRAj8C7+qLiPczqXA84ThpQfFJTH
 sMkMZfUUmwJQk9XgQzn9XVVQyifHEnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-PAl53uudNlORoY6865dMlg-1; Wed, 22 Jul 2020 11:43:35 -0400
X-MC-Unique: PAl53uudNlORoY6865dMlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9164F1005510;
 Wed, 22 Jul 2020 15:43:34 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AEF35D9D3;
 Wed, 22 Jul 2020 15:43:27 +0000 (UTC)
Date: Wed, 22 Jul 2020 16:43:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/4] io/channel-socket: implement non-blocking connect
Message-ID: <20200722154324.GP2324845@redhat.com>
References: <20200720180715.10521-4-vsementsov@virtuozzo.com>
 <20200720182923.GP643836@redhat.com>
 <840b762e-1ce1-af25-2ea0-b8cfdedba0d4@virtuozzo.com>
 <20200722112104.GC2324845@redhat.com>
 <cd5058fe-20d4-615e-8489-a30ac54d57de@virtuozzo.com>
 <20200722125303.GI2324845@redhat.com>
 <71bd9b95-6db6-bfaa-729e-df9d1493e5b7@virtuozzo.com>
 <46847ccc-22d0-59b9-6c43-16cb6af4b078@virtuozzo.com>
 <20200722152140.GO2324845@redhat.com>
 <ebc8409a-7387-8cb4-cc37-8b2df580863b@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <ebc8409a-7387-8cb4-cc37-8b2df580863b@virtuozzo.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:27:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 22, 2020 at 06:40:10PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 22.07.2020 18:21, Daniel P. Berrangé wrote:
> > On Wed, Jul 22, 2020 at 06:04:53PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 22.07.2020 16:47, Vladimir Sementsov-Ogievskiy wrote:
> > > > 22.07.2020 15:53, Daniel P. Berrangé wrote:
> > > > > On Wed, Jul 22, 2020 at 03:43:54PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > > 22.07.2020 14:21, Daniel P. Berrangé wrote:
> > > > > > > On Wed, Jul 22, 2020 at 02:00:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > > > > 20.07.2020 21:29, Daniel P. Berrangé wrote:
> > > > > > > > > On Mon, Jul 20, 2020 at 09:07:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > > > > > > Utilize new socket API to make a non-blocking connect for inet sockets.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > > > > > > > > ---
> > > > > > > > > >      include/io/channel-socket.h | 14 +++++++
> > > > > > > > > >      io/channel-socket.c         | 74 +++++++++++++++++++++++++++++++++++++
> > > > > > > > > >      2 files changed, 88 insertions(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> > > > > > > > > > index 777ff5954e..82e868bc02 100644
> > > > > > > > > > --- a/include/io/channel-socket.h
> > > > > > > > > > +++ b/include/io/channel-socket.h
> > > > > > > > > > @@ -94,6 +94,20 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> > > > > > > > > >                                          SocketAddress *addr,
> > > > > > > > > >                                          Error **errp);
> > > > > > > > > > +/**
> > > > > > > > > > + * qio_channel_socket_connect_non_blocking_sync:
> > > > > > > > > > + * @ioc: the socket channel object
> > > > > > > > > > + * @addr: the address to connect to
> > > > > > > > > > + * @errp: pointer to a NULL-initialized error object
> > > > > > > > > > + *
> > > > > > > > > > + * Attempt to connect to the address @addr using non-blocking mode of
> > > > > > > > > > + * the socket. Function is synchronous, but being called from
> > > > > > > > > > + * coroutine context will yield during connect operation.
> > > > > > > > > > + */
> > > > > > > > > > +int qio_channel_socket_connect_non_blocking_sync(QIOChannelSocket *ioc,
> > > > > > > > > > +                                                 SocketAddress *addr,
> > > > > > > > > > +                                                 Error **errp);
> > > > > > > > > > +
> > > > > > > > > >      /**
> > > > > > > > > >       * qio_channel_socket_connect_async:
> > > > > > > > > >       * @ioc: the socket channel object
> > > > > > > > > > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > > > > > > > > > index e1b4667087..076de7578a 100644
> > > > > > > > > > --- a/io/channel-socket.c
> > > > > > > > > > +++ b/io/channel-socket.c
> > > > > > > > > > @@ -22,6 +22,7 @@
> > > > > > > > > >      #include "qapi/error.h"
> > > > > > > > > >      #include "qapi/qapi-visit-sockets.h"
> > > > > > > > > >      #include "qemu/module.h"
> > > > > > > > > > +#include "qemu/sockets.h"
> > > > > > > > > >      #include "io/channel-socket.h"
> > > > > > > > > >      #include "io/channel-watch.h"
> > > > > > > > > >      #include "trace.h"
> > > > > > > > > > @@ -29,6 +30,8 @@
> > > > > > > > > >      #define SOCKET_MAX_FDS 16
> > > > > > > > > > +static int qio_channel_socket_close(QIOChannel *ioc, Error **errp);
> > > > > > > > > > +
> > > > > > > > > >      SocketAddress *
> > > > > > > > > >      qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
> > > > > > > > > >                                           Error **errp)
> > > > > > > > > > @@ -157,6 +160,77 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> > > > > > > > > >          return 0;
> > > > > > > > > >      }
> > > > > > > > > > +static int qio_channel_inet_connect_non_blocking_sync(QIOChannelSocket *ioc,
> > > > > > > > > > +        InetSocketAddress *addr, Error **errp)
> > > > > > > > > > +{
> > > > > > > > > > +    Error *local_err = NULL;
> > > > > > > > > > +    struct addrinfo *infos, *info;
> > > > > > > > > > +    int sock = -1;
> > > > > > > > > > +
> > > > > > > > > > +    infos = inet_parse_connect_saddr(addr, errp);
> > > > > > > > > > +    if (!infos) {
> > > > > > > > > > +        return -1;
> > > > > > > > > > +    }
> > > > > > > > > 
> > > > > > > > > This call is blocking since it calls getaddrinfo whose design
> > > > > > > > > offers no ability todo non-blocking DNS lookups. Given this
> > > > > > > > > call, ...
> > > > > > > > 
> > > > > > > > Oh, that's bad, thanks for taking a look on that early stage!
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > +
> > > > > > > > > > +    for (info = infos; info != NULL; info = info->ai_next) {
> > > > > > > > > > +        bool in_progress;
> > > > > > > > > > +
> > > > > > > > > > +        error_free(local_err);
> > > > > > > > > > +        local_err = NULL;
> > > > > > > > > > +
> > > > > > > > > > +        sock = inet_connect_addr(addr, info, false, &in_progress, &local_err);
> > > > > > > > > > +        if (sock < 0) {
> > > > > > > > > > +            continue;
> > > > > > > > > > +        }
> > > > > > > > > > +
> > > > > > > > > > +        if (qio_channel_socket_set_fd(ioc, sock, &local_err) < 0) {
> > > > > > > > > > +            close(sock);
> > > > > > > > > > +            continue;
> > > > > > > > > > +        }
> > > > > > > > > > +
> > > > > > > > > > +        if (in_progress) {
> > > > > > > > > > +            if (qemu_in_coroutine()) {
> > > > > > > > > > +                qio_channel_yield(QIO_CHANNEL(ioc), G_IO_OUT);
> > > > > > > > > > +            } else {
> > > > > > > > > > +                qio_channel_wait(QIO_CHANNEL(ioc), G_IO_OUT);
> > > > > > > > > > +            }
> > > > > > > > > 
> > > > > > > > > ...this is offering false assurances of being non-blocking.
> > > > > > > > > 
> > > > > > > > > If we don't want the current thread to be blocked then we
> > > > > > > > > need to be using the existing qio_channel_socket_connect_async
> > > > > > > > > method or similar. It uses a throw away background thread to
> > > > > > > > > run the connection attempt, and then reports completion back
> > > > > > > > > later, thus avoiding the getaddrinfo design flaw for the callers.
> > > > > > > > > 
> > > > > > > > > I explicitly didn't want to add an method like the impl in this
> > > > > > > > > patch, because getaddrinfo dooms it and we already had bugs in
> > > > > > > > > the pre-QIOChannel code where QEMU thought it was non-blocking
> > > > > > > > > but wasn't due to getaddrinfo lookups.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > IIUC, the main appeal of this method is that the non-blocking
> > > > > > > > > nature is hidden from the caller who can continue to treat it
> > > > > > > > > as a synchronous call and have the coroutine magic happen in
> > > > > > > > > behind the scenes.
> > > > > > > > > 
> > > > > > > > > IOW, What's needed is a simple way to run the operation in a
> > > > > > > > > thread, and sleep for completion while having the coroutine
> > > > > > > > > yield.
> > > > > > > > > 
> > > > > > > > > I think this could likely be achieved with QIOTask with an
> > > > > > > > > alternate impl of the qio_task_wait_thread() method that is
> > > > > > > > > friendly to coroutines instead of being based on pthread
> > > > > > > > > condition variable waits.
> > > > > > > > 
> > > > > > > > The most simple thing is just run qio_channel_socket_connect_sync in
> > > > > > > > a thread with help of thread_pool_submit_co() which is coroutine-friendly.
> > > > > > > > And this don't need any changes in io/channel.
> > > > > > > > 
> > > > > > > > Actually, I've started with such design, but decided that better use
> > > > > > > > non-blocking connect to not deal with cancelling the connecting thread
> > > > > > > > on shutdown.
> > > > > > > > 
> > > > > > > > I think, I'll resend based on thread_pool_submit_co().
> > > > > > > > 
> > > > > > > > ===
> > > > > > > > 
> > > > > > > > Hmm, there is async getaddrinfo_a function.. What do you think of it?
> > > > > > > 
> > > > > > > It isn't portable, glibc only.
> > > > > > > 
> > > > > > > > But seems simpler to use a thread than move to async interfaces everywhere.
> > > > > > > 
> > > > > > > 
> > > > > > 
> > > > > > Hmm.. Still, on shutdown, how to cancel this connect and getaddrinfo ? I'm not sure
> > > > > > how much time may getaddrinfo take, but connect can take about a minute. It's not really
> > > > > > good to wait for it on shutdown.
> > > > > 
> > > > > The intention was that if you don't want to carry on waiting for the
> > > > > async operation to complete you just give and pretend it no longer
> > > > > exists. Eventually it will fail or complete and the thread will exit.
> > > > > The only important thing there is making sure that the callback you
> > > > > are passing to the _async() method can cope with the cleanup when the
> > > > > work eventually completes, even if you've given up.
> > > > > 
> > > > 
> > > > At least it's not possible with thread_pool_submit_co as I wanted, because underlying
> > > > thread pool waits for all its threads to complete on exit.
> > > > 
> > > > 
> > > 
> > > 
> > > I'm trying to use qio_channel_socket_connect_async().. But callback
> > > is not called.
> > > 
> > > How to make it be executed? In tests/test-io-channel-socket.c it's
> > > done by g_main_loop_new .. g_main_loop_run. But I need to yield.
> > > socket_start_outgoing_migration uses qio_channel_socket_connect_async
> > > as well, but is not doing any magic with g_main_loop. But it works. How?
> > 
> > The _async() impls uses  qio_task_run_in_thread to spawn the background
> > thread. When the thread finishes, it uses g_idle_add to invoke the
> > callback so that it runs in the context of the main thread, not the
> > background thread. So something needs to be running the main loop
> > in QEMU.
> 
> I came to same idea. But still, I don't see where g_main_loop is
> run inside qemu_main_loop(). Only iothread_run() does it. But
> what if we don't have iothreads?

There's no requirement to use g_main_loop, what matters is actually
that something runs the default GMainContext.  qemu_main_loop
satisfies this.

If you have a different GMainLoop that you want to use, then you
can pass its GMainContext into the _async() functions, and the
result will get dispatched from whatever thread runs that
GMainContext/GMainLoop. So you could use this to get the callback
to be invoked in your iothread context if that's desirable. If
a NULL GMainContext is passed to _async(), then the callback is
dispatched from qemu_main_loop() thread.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


