Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E24521208
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:19:38 +0200 (CEST)
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMxt-0007Y1-Ou
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noMo3-0007gv-8F
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noMo1-0007bb-6N
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652177364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geOVZd09nZa7RaMIkgGcfC1tvhySFIN14mK/irSpO60=;
 b=RtNwuI0k35IasGW3zxXReHWHlvN29BoOH77gh3EDrSjQeSDdB4KSi+Ih7tPYYM2aIWCOFy
 nexD9PslE83sxvFMqnRKITqxnU/hq0HZ29gED5cDxkZzVYihEKhPxWPhvEwVTHLbGEJbT3
 6SQQ/ennusizkwwwgyCrMO8nhcaisgM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-OBb4w8nAPcSox93ZXcg2Yw-1; Tue, 10 May 2022 06:09:23 -0400
X-MC-Unique: OBb4w8nAPcSox93ZXcg2Yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E1D801210;
 Tue, 10 May 2022 10:09:22 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ADB12026985;
 Tue, 10 May 2022 10:09:22 +0000 (UTC)
Date: Tue, 10 May 2022 12:09:18 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, Ralph
 Schmieder <ralph.schmieder@gmail.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [RFC PATCH 0/6] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <20220510120910.3fe16689@elisabeth>
In-Reply-To: <Ynou6ASuaaP9aVCB@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <Ynohv8LzGG1vLy9N@redhat.com> <20220510105908.607c4de7@elisabeth>
 <Ynou6ASuaaP9aVCB@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 May 2022 10:22:48 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, May 10, 2022 at 10:59:08AM +0200, Stefano Brivio wrote:
> > On Tue, 10 May 2022 09:26:39 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Mon, May 09, 2022 at 07:36:12PM +0200, Laurent Vivier wrote: =20
> > > > "-netdev socket" only supports inet sockets.
> > > >=20
> > > > It's not a complex task to add support for unix sockets, but
> > > > the socket netdev parameters are not defined to manage well unix
> > > > socket parameters.
> > > >=20
> > > > As discussed in:
> > > >=20
> > > >   "socket.c added support for unix domain socket datagram transport"
> > > >   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E=
67BE60@gmail.com/
> > > >=20
> > > > This series adds support of unix socket type using SocketAddress QA=
PI structure.
> > > >=20
> > > > A new netdev backend "socket-ng" is added, that is barely a copy of=
 "socket"
> > > > backend but it uses the SocketAddress QAPI to provide socket parame=
ters.
> > > > And then it also implement unix sockets (TCP and UDP).   =20
> > >=20
> > > So pulling in the QAPI from patch 2
> > >=20
> > >    { 'enum': 'NetdevSocketNGMode',
> > >      'data':  [ 'dgram', 'server', 'client' ] }
> > >=20
> > >    { 'struct': 'NetdevSocketNGOptions',
> > >      'data': {
> > >        'mode':    'NetdevSocketNGMode',
> > >        '*addr':   'SocketAddress',
> > >        '*remote': 'SocketAddress',
> > >        '*local':  'SocketAddress' } }
> > >  =20
> > > > Some examples of CLI syntax:
> > > >=20
> > > >   for TCP:
> > > >=20
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dserver,addr.type=3Dinet,add=
r.host=3Dlocalhost,addr.port=3D1234
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dclient,addr.type=3Dinet,add=
r.host=3Dlocalhost,addr.port=3D1234
> > > >=20
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Ddgram,\
> > > >           local.type=3Dinet,local.host=3Dlocalhost,local.port=3D123=
4,\
> > > >           remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D=
1235
> > > >=20
> > > >   for UNIX:
> > > >=20
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dserver,addr.type=3Dunix,add=
r.path=3D/tmp/qemu0
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dclient,addr.type=3Dunix,add=
r.path=3D/tmp/qemu0
> > > >=20
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Ddgram,\
> > > >           local.type=3Dunix,local.path=3D/tmp/qemu0,\
> > > >           remote.type=3Dunix,remote.path=3D/tmp/qemu1
> > > >=20
> > > >   for FD:
> > > >=20
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dserver,addr.type=3Dfd,addr.=
str=3D4
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dclient,addr.type=3Dfd,addr.=
str=3D5
> > > >=20
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Ddgram,local.type=3Dfd,addr.=
str=3D4   =20
> > >=20
> > >                                                           ^^^ local.s=
tr=3D4
> > >=20
> > > I notice that in all these examples, mode=3Dclient/server always use
> > > the 'addr' field, and mode=3Ddgram always uses the 'local'/'remote'
> > > fields. IOW, there is almost no commonality between the dgram scenario
> > > and the stream scenario, which feels sub-optimal.
> > >=20
> > > Two alternatives come to mind
> > >=20
> > >  - mode=3Dclient could use 'remote' and mode=3Dserver could use 'loca=
l',
> > >    removing the 'addr' field entirely =20
> >=20
> > To me, "mode is client, address is x" sounds more intuitive than "mode
> > is client, remote is x". I mean, of course it's the remote address --
> > that's a bit redundant.
> >  =20
> > >  - Have completely separate backends, ie '-netdev stream' for
> > >    client/server TCP/UNIX sockets, and '-netdev dgram' for UDP
> > >    sockets, removing 'mode' field. =20

Well, this ^^^ is one thing ('-netdev stream' for UNIX sockets),

> > ...this won't work, though, because UNIX domain sockets can be
> > stream-oriented or datagram-oriented. =20
>=20
> Sure it can work, both the 'stream' and 'dgram' backends would
> allow the full range of addr types as they're independant config
> dimensions
>=20
>=20
>     -netdev stream,server=3Dno,addr.type=3Dinet,addr.host=3Dlocalhost,add=
r.port=3D1234
>     -netdev stream,server=3Dno,addr.type=3Dunix,addr.path=3D/some/stream/=
sock
>=20
>=20
>     -netdev dgram,id=3Dndev0,\
>             local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234,\
>             remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1235
>     -netdev dgram,id=3Dndev0,\
>             local.type=3Dunix,local.path=3D/some/dgram/sock0,
>             remote.type=3Dunix,remote.path=3D/some/dgram/sock1

...and this ('-netdev dgram' for UNIX sockets) is another one. :)

Indeed they're independent though, so I also prefer this version (with
the details Laurent just provided).

--=20
Stefano


