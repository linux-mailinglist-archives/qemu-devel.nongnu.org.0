Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3891E521112
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:36:55 +0200 (CEST)
Received: from localhost ([::1]:35352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMIX-0007JN-95
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noM51-00066h-Sd
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:22:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noM4z-00009h-TW
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652174573;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Fi29A1PNImj/Zs1NCYFIyGxrWPPCjS8j6ygLi5O7Zc=;
 b=Zom5LSE+lb1Og0Z/F3Ac4NAch0eu9uvVTWGf8ZKMcmWDuo+7g2UVW8iXxr1vUxA3DDzcJW
 wVNxM70J2TMjHkMC5MX5euCJal5DzkUdEKw0TF8g3arVRn9lH+pLs0QAUMakjj1BJhhFKr
 +p7Fyx324HfmPZIPMnlz2RxUUEMLHf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-LVRgCw-1OA-xAea-efbGgw-1; Tue, 10 May 2022 05:22:52 -0400
X-MC-Unique: LVRgCw-1OA-xAea-efbGgw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DADF08015BA;
 Tue, 10 May 2022 09:22:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0879F416553;
 Tue, 10 May 2022 09:22:50 +0000 (UTC)
Date: Tue, 10 May 2022 10:22:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 0/6] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <Ynou6ASuaaP9aVCB@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <Ynohv8LzGG1vLy9N@redhat.com> <20220510105908.607c4de7@elisabeth>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510105908.607c4de7@elisabeth>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10, 2022 at 10:59:08AM +0200, Stefano Brivio wrote:
> On Tue, 10 May 2022 09:26:39 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Mon, May 09, 2022 at 07:36:12PM +0200, Laurent Vivier wrote:
> > > "-netdev socket" only supports inet sockets.
> > > 
> > > It's not a complex task to add support for unix sockets, but
> > > the socket netdev parameters are not defined to manage well unix
> > > socket parameters.
> > > 
> > > As discussed in:
> > > 
> > >   "socket.c added support for unix domain socket datagram transport"
> > >   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> > > 
> > > This series adds support of unix socket type using SocketAddress QAPI structure.
> > > 
> > > A new netdev backend "socket-ng" is added, that is barely a copy of "socket"
> > > backend but it uses the SocketAddress QAPI to provide socket parameters.
> > > And then it also implement unix sockets (TCP and UDP).  
> > 
> > So pulling in the QAPI from patch 2
> > 
> >    { 'enum': 'NetdevSocketNGMode',
> >      'data':  [ 'dgram', 'server', 'client' ] }
> > 
> >    { 'struct': 'NetdevSocketNGOptions',
> >      'data': {
> >        'mode':    'NetdevSocketNGMode',
> >        '*addr':   'SocketAddress',
> >        '*remote': 'SocketAddress',
> >        '*local':  'SocketAddress' } }
> > 
> > > Some examples of CLI syntax:
> > > 
> > >   for TCP:
> > > 
> > >   -netdev socket-ng,id=socket0,mode=server,addr.type=inet,addr.host=localhost,addr.port=1234
> > >   -netdev socket-ng,id=socket0,mode=client,addr.type=inet,addr.host=localhost,addr.port=1234
> > > 
> > >   -netdev socket-ng,id=socket0,mode=dgram,\
> > >           local.type=inet,local.host=localhost,local.port=1234,\
> > >           remote.type=inet,remote.host=localhost,remote.port=1235
> > > 
> > >   for UNIX:
> > > 
> > >   -netdev socket-ng,id=socket0,mode=server,addr.type=unix,addr.path=/tmp/qemu0
> > >   -netdev socket-ng,id=socket0,mode=client,addr.type=unix,addr.path=/tmp/qemu0
> > > 
> > >   -netdev socket-ng,id=socket0,mode=dgram,\
> > >           local.type=unix,local.path=/tmp/qemu0,\
> > >           remote.type=unix,remote.path=/tmp/qemu1
> > > 
> > >   for FD:
> > > 
> > >   -netdev socket-ng,id=socket0,mode=server,addr.type=fd,addr.str=4
> > >   -netdev socket-ng,id=socket0,mode=client,addr.type=fd,addr.str=5
> > > 
> > >   -netdev socket-ng,id=socket0,mode=dgram,local.type=fd,addr.str=4  
> > 
> >                                                           ^^^ local.str=4
> > 
> > I notice that in all these examples, mode=client/server always use
> > the 'addr' field, and mode=dgram always uses the 'local'/'remote'
> > fields. IOW, there is almost no commonality between the dgram scenario
> > and the stream scenario, which feels sub-optimal.
> > 
> > Two alternatives come to mind
> > 
> >  - mode=client could use 'remote' and mode=server could use 'local',
> >    removing the 'addr' field entirely
> 
> To me, "mode is client, address is x" sounds more intuitive than "mode
> is client, remote is x". I mean, of course it's the remote address --
> that's a bit redundant.
> 
> >  - Have completely separate backends, ie '-netdev stream' for
> >    client/server TCP/UNIX sockets, and '-netdev dgram' for UDP
> >    sockets, removing 'mode' field.
> 
> ...this won't work, though, because UNIX domain sockets can be
> stream-oriented or datagram-oriented.

Sure it can work, both the 'stream' and 'dgram' backends would
allow the full range of addr types as they're independant config
dimensions


    -netdev stream,server=no,addr.type=inet,addr.host=localhost,addr.port=1234
    -netdev stream,server=no,addr.type=unix,addr.path=/some/stream/sock


    -netdev dgram,id=ndev0,\
            local.type=inet,local.host=localhost,local.port=1234,\
            remote.type=inet,remote.host=localhost,remote.port=1235
    -netdev dgram,id=ndev0,\
            local.type=unix,local.path=/some/dgram/sock0,
            remote.type=unix,remote.path=/some/dgram/sock1


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


