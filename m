Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451936CDFF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 23:54:29 +0200 (CEST)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbVf2-00032X-IT
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 17:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lbVdL-0002C9-1o
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lbVdH-0002Yt-74
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619560358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPjxD6r1IOsye7pWITJrV1H5Ypup1+gWB66tOk0Ydlg=;
 b=OopiC11MS1ritWh5Tj3oHtV2H9RMk2ghX+hTjWZyUxSxxALwtPY3btn7QH4V86So1U1pcv
 YcZJn7hnHyVDAoBhQZw40UnQrnD2BeaqxaF80quBFuSqzUaSDk9gzTAUC9NQVk7i5pDLu6
 pELyY+i72tkaXm5qQebCng+EhLNocA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-k5sqVeuFPvCSE1zGqR2hOg-1; Tue, 27 Apr 2021 17:52:34 -0400
X-MC-Unique: k5sqVeuFPvCSE1zGqR2hOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4257E8042B3;
 Tue, 27 Apr 2021 21:52:33 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.36.110.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C88029AAE;
 Tue, 27 Apr 2021 21:52:31 +0000 (UTC)
Received: from elisabeth (011-177-165-046.ip-addr.inexio.net [46.165.177.11])
 by maya.cloud.tilaa.com (Postfix) with ESMTPSA id 3C23E40098;
 Tue, 27 Apr 2021 23:52:30 +0200 (CEST)
Date: Tue, 27 Apr 2021 23:52:29 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <20210427235229.5cf8711c@elisabeth>
In-Reply-To: <YIa4iGzTl+ecfbzH@redhat.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth> <YIL0Ehmfgc1J9Ci9@redhat.com>
 <20210423185408.6d5d14f0@redhat.com> <YIa4iGzTl+ecfbzH@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 13:56:40 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Apr 23, 2021 at 06:54:08PM +0200, Stefano Brivio wrote:
> > On Fri, 23 Apr 2021 17:21:38 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote: =20
> > > The current IP socket impl for the net socket backend uses SOCK_DGRAM=
,
> > > so from a consistency POV it feels sensible todo the same for UNIX
> > > sockets too. =20
> >=20
> > That's just for UDP though -- it also supports TCP with the "connect=3D=
"
> > parameter, and given that a stream-oriented AF_UNIX socket behaves very
> > similarly, I recycled that parameter and just extended that bit of
> > documentation.
> >  =20
> > > None the less, your last point in particular about wanting to know
> > > about disconnects feels valid, and if its useful to you for UNIX
> > > sockets, then it ought to be useful for IP sockets too.
> > >=20
> > > IOW, I wonder if  we should use DGRAM for UNIX sockets too by default
> > > to match current behaviour, but then also add a CLI option that allow=
s
> > > choice of DGRAM vs STREAM, and wire that up for IP & UNIX sockets. =
=20
> >=20
> > The choice would only apply to AF_UNIX (that is, not to TCP and UDP).
> >=20
> > The current situation isn't entirely consistent, because for TCP you
> > have "connect=3D", for UDP it's "udp=3D" or "mcast=3D", and I'm extendi=
ng the
> > "connect=3D" case to support stream-oriented AF_UNIX, which I think is
> > consistent.
> >=20
> > However, to have it symmetric for the datagram-oriented case
> > (UDP and AF_UNIX), ideally it should be changed to
> > "dgram=3Dhost:port|path" -- which I guess we can't do.
> >=20
> > I see two alternatives:
> >=20
> > 1.
> >   - "connect=3D" (TCP only)
> >   - "unix=3Dpath,type=3Ddgram|stream"
> >   - "udp=3D" (UDP only) =20
>=20
> This doesn't work when you need the UNIX server to be a
> listener socket, as we've no way to express that, without
> adding yet another parameter.

Ah, right.

> > 2.
> >   - "connect=3D" (TCP and AF_UNIX stream)
> >   - "unix_dgram=3D"
> >   - "udp=3D" (UDP only) =20
>=20
> Also needs
>=20
>    "listen=3D" (TCP and AF_UNIX stream)

Yes, I forgot about this here, but it's actually already in my patch
(see the changes to net_socket_listen_init() and documentation).

> "udp" has a corresponding optional "localaddr" for the sending
> address.
>=20
> Also overloading "connect" means we have to parse the value
> to guess whether its a UNIX path or a IP addr:port pair.
>=20
> I doubt people will have UNIX paths called "127.0.0.1:3333"
> but if we can avoid such ambiguity by design, it is better.

Agreed... I didn't actually consider that.

> > The major thing I like of 2. is that we save some code and a further
> > option, but other than that I don't have a strong preference. =20
>=20
> The pain we're feeling is largely because the design of the net
> option syntax is one of the oldest parts of QEMU and has only
> been very partially improved upon. It is certainly not using
> QAPI best practice, if we look at this:
>=20
>   { 'struct': 'NetdevSocketOptions',
>     'data': {
>       '*fd':        'str',
>       '*listen':    'str',
>       '*connect':   'str',
>       '*mcast':     'str',
>       '*localaddr': 'str',
>       '*udp':       'str' } }
>=20
> Then some things come to mind
>=20
>  - We're not provinding a way to say what kind of "fd" is
>    passed in - is it a UDP/TCP FD, is it a listener or
>    client FD, is it unicast or multicast FD. Though QEMU
>    can interogate the socket to discover this I guess.

Some form of probing was already added in commit 894022e61601 ("net:
check if the file descriptor is valid before using it"). Does qemu need
to care, though, once the socket is connected? That is, what would it
do with that information?

>  - All of the properties there except "fd" are encoding two values
>    in a single property - address + port. This is an anti-pattern
>=20
>  - No support for ipv4=3Don|off and ipv6=3Don|off flags to control
>    dual-stack usage.

I wonder if this needs to be explicit -- it might simply derive from
addressing.

>  - Redundancy of separate parameters for "mcast" and "udp" when
>    it is distinguishable based on the address given AFAIR.

Strictly speaking, for IPv4, addresses are reserved for multicast usage
(by RFC 5771), but as far as I can tell, also other addresses could
legitimately be used for multicast. I've never seen that in practice
and it's unlikely to be of any use, though.

For IPv6, things seem to be defined more strictly (RFC 5771 and
updates).

All in all, yes, I guess inferring this from the address would make the
usage more practical.

>  - No support for UNIX sockets
>=20
>=20
> The "right" way to fix most of this long term is a radical change
> to introduce use of the SocketAddress struct.
>=20
> I could envisage something like this
>=20
>   { 'enum': 'NetdevSocketMode',
>     'data':  ['dgram', 'client', 'server'] }
>=20
>   { 'struct': 'NetdevSocketOptions',
>     'data': {
>       'addr':      'SocketAddress',
>       '*localaddr': 'SocketAddress',
>       '*mode':      'NetdevSocketMode' } }
>=20
>=20
>  - A TCP client
>=20
>       addr.type =3D inet
>       addr.host =3D 192.168.1.1
>       mode =3D client
>
>  - A TCP server on all interfaces
>=20
>       addr.type =3D inet
>       addr.host =3D=20
>       mode =3D server
>=20
>  - A TCP server on a specific interface
>=20
>       addr.type =3D inet
>       addr.host =3D 192.168.1.1
>       mode =3D server
>=20
>  - A TCP server on all interfaces, without IPv4
>=20
>       addr.type =3D inet
>       addr.host =3D=20
>       addr.has_ipv4 =3D true
>       addr.ipv4 =3D false
>       mode =3D server

...perhaps it would be more consistent with other consolidated
practices to have addr.type =3D inet | inet6... and perhaps call it
addr.family.

Also, for "mode" (that could be called "type" to reflect
parameters for socket(2)), we should probably support SOCK_SEQPACKET as
well ("seq"?).

>  - A UDP unicast transport
>=20
>       addr.type =3D inet
>       addr.host =3D 192.168.1.1
>       mode =3D dgram
>=20
>  - A UDP unicast transport with local addr
>=20
>       addr.type =3D inet
>       addr.host =3D 192.168.1.1
>       localaddr.type =3D inet
>       localaddr.host =3D 192.168.1.2
>       mode =3D dgram
>=20
>  - A UDP multicast transport
>=20
>      addr.type =3D inet
>      addr.host =3D 224.0.23.166
>      mode =3D dgram
>=20
>  - A UNIX stream client
>=20
>       addr.type =3D unix
>       addr.path =3D /some/socket
>       mode =3D client
>=20
>  - A UNIX stream server
>=20
>       addr.type =3D unix
>       addr.path =3D /some/socket
>       mode =3D server
>=20
>  - A UNIX dgram transport
>=20
>       addr.type =3D unix
>       addr.path =3D /some/socket
>       mode =3D dgram
>=20
>=20
> Now, of course you're just interested in adding UNIX socket support.
>=20
> This design I've outlined above is very much "boiling the ocean".
> Thus I'm not requesting you implement this, unless you have a strong
> desire to get heavily involved in some QEMU refactoring work.

I don't really have a strong desire to do that, but to my naive eyes it
doesn't look that complicated, I'll give it a try.

> The key question is whether we try to graft UNIX socket support onto
> the existing args ("connect"/"listen") or try to do something more
> explicit.
>=20
> Given the desire to have both dgram + stream support, I'd be inclined
> to do something more explicit, that's slightly more aligned with a
> possible future best praactice QAPI design
>=20
>=20
> IOW, we could take a simplified variant of the above as follows:
>=20
>=20
>   { 'enum': 'NetdevSocketMode',
>     'data':  ['dgram', 'client', 'server'] }
>=20
>   { 'struct': 'NetdevSocketOptions',
>     'data': {
>       '*fd':        'str',
>       '*listen':    'str',
>       '*connect':   'str',
>       '*mcast':     'str',
>       '*localaddr': 'str',
>       '*udp':       'str',
>       '*path':      'str' } }
>       '*localpath': 'str' } }
>=20
>=20
> Cli examples:
>=20
>  * Unix stream client
>=20
>   -netdev socket,path=3D/wibble,mode=3Dclient
>=20
>  * Unix stream server
> =20
>   -netdev socket,path=3D/wibble,mode=3Dserver
>=20
>  * Unix datagram=20
>=20
>   -netdev socket,path=3D/wibble,mode=3Ddgram
>   -netdev socket,path=3D/wibble,localpath=3D/fish,mode=3Ddgram

I think this looks reasonable, I'm not sure about "localpath",
because also /wibble is local in some sense.

I don't know what would be a good implementation practice to keep the
current options available -- should this be done with some new code
that applies a translation to the new parameters?

--=20
Stefano


