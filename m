Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E837B9E2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:02:09 +0200 (CEST)
Received: from localhost ([::1]:57760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lglgs-0004sb-Aa
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lglfD-0003yr-Fc
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lglf9-0007V6-6a
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620813618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4t+SFTZ/GD7EFsx/GbS7pvR9Ui8/Bkn5qbVAYerIrVE=;
 b=C9j0kotrHKnWyJC7L12tFUhLff5RCGlzkrcjkq2atFwJJBgUGYhRDYAPoyaw9HzctquBQg
 0bvo618eulI2ndBTzOrjDz4scCysuxDmjlTjXEF0gc8FllImWP5YzKdR1pH0USUUDVODwg
 ueEwG9cT6dTy5Cv8wPZAemuH/4S2PQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-7cLusVHXP2q_DvtdTicstg-1; Wed, 12 May 2021 06:00:03 -0400
X-MC-Unique: 7cLusVHXP2q_DvtdTicstg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F389FC8E;
 Wed, 12 May 2021 10:00:02 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8C51059591;
 Wed, 12 May 2021 09:59:55 +0000 (UTC)
Date: Wed, 12 May 2021 10:59:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 21/33] qemu-socket: pass monitor link to socket_get_fd
 directly
Message-ID: <YJunGNZSSBVq236l@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-22-vsementsov@virtuozzo.com>
 <YH1OuUYuLYkHY2ni@redhat.com> <YJuic4P8LxL2K3SQ@rvkaganb.lan>
MIME-Version: 1.0
In-Reply-To: <YJuic4P8LxL2K3SQ@rvkaganb.lan>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 12:40:03PM +0300, Roman Kagan wrote:
> On Mon, Apr 19, 2021 at 10:34:49AM +0100, Daniel P. Berrangé wrote:
> > On Fri, Apr 16, 2021 at 11:08:59AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > Detecting monitor by current coroutine works bad when we are not in
> > > coroutine context. And that's exactly so in nbd reconnect code, where
> > > qio_channel_socket_connect_sync() is called from thread.
> > > 
> > > Add a possibility to pass monitor by hand, to be used in the following
> > > commit.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > ---
> > >  include/io/channel-socket.h    | 20 ++++++++++++++++++++
> > >  include/qemu/sockets.h         |  2 +-
> > >  io/channel-socket.c            | 17 +++++++++++++----
> > >  tests/unit/test-util-sockets.c | 16 ++++++++--------
> > >  util/qemu-sockets.c            | 10 +++++-----
> > >  5 files changed, 47 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> > > index e747e63514..6d0915420d 100644
> > > --- a/include/io/channel-socket.h
> > > +++ b/include/io/channel-socket.h
> > > @@ -78,6 +78,23 @@ qio_channel_socket_new_fd(int fd,
> > >                            Error **errp);
> > >  
> > >  
> > > +/**
> > > + * qio_channel_socket_connect_sync_mon:
> > > + * @ioc: the socket channel object
> > > + * @addr: the address to connect to
> > > + * @mon: current monitor. If NULL, it will be detected by
> > > + *       current coroutine.
> > > + * @errp: pointer to a NULL-initialized error object
> > > + *
> > > + * Attempt to connect to the address @addr. This method
> > > + * will run in the foreground so the caller will not regain
> > > + * execution control until the connection is established or
> > > + * an error occurs.
> > > + */
> > > +int qio_channel_socket_connect_sync_mon(QIOChannelSocket *ioc,
> > > +                                        SocketAddress *addr,
> > > +                                        Monitor *mon,
> > > +                                        Error **errp);
> > 
> > I don't really like exposing the concept of the QEMU monitor in
> > the IO layer APIs. IMHO these ought to remain completely separate
> > subsystems from the API pov,
> 
> Agreed. 
> 
> > and we ought to fix this problem by
> > making monitor_cur() work better in the scenario required.
> 
> Would it make sense instead to resolve the fdstr into actual file
> descriptor number in the context where monitor_cur() works and makes
> sense, prior to passing it to the connection thread?

Yes, arguably the root problem is caused by the util/qemu-sockets.c
code directly referring to the current monitor. This has resultde in
the slightly strange scenario where we have two distinct semantics
for the 'fd' SocketAddressType

 @fd: decimal is for file descriptor number, otherwise a file descriptor name.
      Named file descriptors are permitted in monitor commands, in combination
      with the 'getfd' command. Decimal file descriptors are permitted at
      startup or other contexts where no monitor context is active.

Now these distinct semantics kinda make sense from the POV of the
management application, but we've let the dual semantics propagate
all the way down our I/O stack.

Folowing your idea, we could have  'socket_address_resolve_monitor_fd'
method which takes a 'SocketAddress' and returns a new 'SocketAddress'
with the real FD filled in.  We then call this method in any codepath
which is getting a 'SocketAddress' struct from the monitor.

The util/qemu-sockets.c code then only has to think about real FDs,
and the monitor_get_fd() call only occurs right at the top level.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


