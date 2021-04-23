Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92130369781
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:57:55 +0200 (CEST)
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZz7q-0001ja-Lf
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZz4V-0008Ko-AO
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lZz4K-0008Ar-Bk
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619196854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFmKihOZ13MtuisFQ6/Ztg0w1zdx/xt6O5SsoVc+DmA=;
 b=UOZpogtoyGEhwr0UgAiFUESqpQSVua4ta9oYXxIS0Z8WIAjlM43q2+tX1A1Kr8SuIpQCsQ
 eKkqMzwGqyU1DdB5vZ5kCPenmrnOk6mvWmHslcDAKzO4mlqEPOH3V+iHdO/tg+vpfpLWHb
 p6CSkfZOagEzc4vz1lcGqXtvS/bft6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Vyvrez5QOa2czRIQ1rYHDw-1; Fri, 23 Apr 2021 12:54:12 -0400
X-MC-Unique: Vyvrez5QOa2czRIQ1rYHDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B812383DD20;
 Fri, 23 Apr 2021 16:54:11 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.36.110.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 527B060C4A;
 Fri, 23 Apr 2021 16:54:11 +0000 (UTC)
Received: from localhost (238-055-210-188.ip-addr.inexio.net [188.210.55.238])
 by maya.cloud.tilaa.com (Postfix) with ESMTPSA id 880DE4009B;
 Fri, 23 Apr 2021 18:54:10 +0200 (CEST)
Date: Fri, 23 Apr 2021 18:54:08 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <20210423185408.6d5d14f0@redhat.com>
In-Reply-To: <YIL0Ehmfgc1J9Ci9@redhat.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth> <YIL0Ehmfgc1J9Ci9@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 17:21:38 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Apr 23, 2021 at 05:29:40PM +0200, Stefano Brivio wrote:
> > Hi Ralph,
> >=20
> > On Fri, 23 Apr 2021 08:56:48 +0200
> > Ralph Schmieder <ralph.schmieder@gmail.com> wrote:
> >  =20
> > > Hey...  new to this list.  I was looking for a way to use Unix domain
> > > sockets as a network transport between local VMs.
> > >=20
> > > I'm part of a team where we run dozens if not hundreds of VMs on a
> > > single compute instance which are highly interconnected.
> > >=20
> > > In the current implementation, I use UDP sockets (e.g. something like=
=20
> > >=20
> > > -netdev
> > > id=3Dbla,type=3Dsocket,udp=3Dlocalhost:1234,localaddr=3Dlocalhost:567=
8)=20
> > >=20
> > > which works great.
> > >=20
> > > The downside of this approach is that I need to keep track of all the
> > > UDP ports in use and that there's a potential for clashes.  Clearly,
> > > having Unix domain sockets where I could store the sockets in the
> > > VM's directory would be much easier to manage.
> > >=20
> > > However, even though there is some AF_UNIX support in net/socket.c,
> > > it's
> > >=20
> > > - not configurable
> > > - it doesn't work =20
> >=20
> > I hate to say this, but I've been working on something very similar
> > just in the past days, with the notable difference that I'm using
> > stream-oriented AF_UNIX sockets instead of datagram-oriented.
> >=20
> > I have a similar use case, and after some experiments I picked a
> > stream-oriented socket over datagram-oriented because:
> >=20
> > - overhead appears to be the same
> >=20
> > - message boundaries make little sense here -- you already have a
> >   32-bit vnet header with the message size defining the message
> >   boundaries
> >=20
> > - datagram-oriented AF_UNIX sockets are actually reliable and there's
> >   no packet reordering on Linux, but this is not "formally" guaranteed
> >=20
> > - it's helpful for me to know when a qemu instance disconnects for any
> >   reason =20
>=20
> The current IP socket impl for the net socket backend uses SOCK_DGRAM,
> so from a consistency POV it feels sensible todo the same for UNIX
> sockets too.

That's just for UDP though -- it also supports TCP with the "connect=3D"
parameter, and given that a stream-oriented AF_UNIX socket behaves very
similarly, I recycled that parameter and just extended that bit of
documentation.

> None the less, your last point in particular about wanting to know
> about disconnects feels valid, and if its useful to you for UNIX
> sockets, then it ought to be useful for IP sockets too.
>=20
> IOW, I wonder if  we should use DGRAM for UNIX sockets too by default
> to match current behaviour, but then also add a CLI option that allows
> choice of DGRAM vs STREAM, and wire that up for IP & UNIX sockets.

The choice would only apply to AF_UNIX (that is, not to TCP and UDP).

The current situation isn't entirely consistent, because for TCP you
have "connect=3D", for UDP it's "udp=3D" or "mcast=3D", and I'm extending t=
he
"connect=3D" case to support stream-oriented AF_UNIX, which I think is
consistent.

However, to have it symmetric for the datagram-oriented case
(UDP and AF_UNIX), ideally it should be changed to
"dgram=3Dhost:port|path" -- which I guess we can't do.

I see two alternatives:

1.
  - "connect=3D" (TCP only)
  - "unix=3Dpath,type=3Ddgram|stream"
  - "udp=3D" (UDP only)

2.
  - "connect=3D" (TCP and AF_UNIX stream)
  - "unix_dgram=3D"
  - "udp=3D" (UDP only)

The major thing I like of 2. is that we save some code and a further
option, but other than that I don't have a strong preference.

--=20
Stefano


