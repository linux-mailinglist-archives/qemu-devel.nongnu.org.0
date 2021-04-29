Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612CF36EA89
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:33:00 +0200 (CEST)
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5ql-0002ca-Fl
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc5Sg-0000zC-BU
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc5Sc-0001YW-V9
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619698082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypqR0WE68qcmVae7LHCGttafrX9NPeYuhnKZMbxnH04=;
 b=BRUF7hE+onjDKTC9NJLHhAPeJYgM4j8Xi5+3m6+YRQJt/sq/+7hwXpgEYu6OtIGSVGQWII
 Gkp25qkEdp02zzyU64eEkxw4wKXWX+eJ2Ug4f22g4MVlaajvmYLAsViK5/72t1EUEcyg2b
 Gx39ENyqY0KoKKNyJsSPadDbScnKicY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-B7bO6CFnOcum69kyBU3Dow-1; Thu, 29 Apr 2021 08:07:59 -0400
X-MC-Unique: B7bO6CFnOcum69kyBU3Dow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 511D518B9F4C;
 Thu, 29 Apr 2021 12:07:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2AF318A79;
 Thu, 29 Apr 2021 12:07:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BCB9113525D; Thu, 29 Apr 2021 14:07:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth> <YIL0Ehmfgc1J9Ci9@redhat.com>
 <20210423185408.6d5d14f0@redhat.com> <YIa4iGzTl+ecfbzH@redhat.com>
 <20210427235229.5cf8711c@elisabeth> <YIkkqZHfMDAUlitX@redhat.com>
Date: Thu, 29 Apr 2021 14:07:56 +0200
In-Reply-To: <YIkkqZHfMDAUlitX@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 28 Apr 2021 10:02:33 +0100")
Message-ID: <87o8dxb8f7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Stefano Brivio <sbrivio@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Apr 27, 2021 at 11:52:29PM +0200, Stefano Brivio wrote:
>> On Mon, 26 Apr 2021 13:56:40 +0100
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> > The pain we're feeling is largely because the design of the net
>> > option syntax is one of the oldest parts of QEMU and has only
>> > been very partially improved upon. It is certainly not using
>> > QAPI best practice, if we look at this:
>> >=20
>> >   { 'struct': 'NetdevSocketOptions',
>> >     'data': {
>> >       '*fd':        'str',
>> >       '*listen':    'str',
>> >       '*connect':   'str',
>> >       '*mcast':     'str',
>> >       '*localaddr': 'str',
>> >       '*udp':       'str' } }
>> >=20
>> > Then some things come to mind
>> >=20
>> >  - We're not provinding a way to say what kind of "fd" is
>> >    passed in - is it a UDP/TCP FD, is it a listener or
>> >    client FD, is it unicast or multicast FD. Though QEMU
>> >    can interogate the socket to discover this I guess.
>>=20
>> Some form of probing was already added in commit 894022e61601 ("net:
>> check if the file descriptor is valid before using it"). Does qemu need
>> to care, though, once the socket is connected? That is, what would it
>> do with that information?
>
> The only thing it really has to care about is the distinction between
> a listener socket and a data socket.
>
>> >  - All of the properties there except "fd" are encoding two values
>> >    in a single property - address + port. This is an anti-pattern

Yes.

More anti-patterns:

      - Of multiple, nominally optional members, you must provide
        exactly one: listen, connect, mcast, udp.

      - Nominally optional member may only be provided together with
        another optional member: localaddr with mcast or udp.

      - Nominally optional member may be mandatory: localaddr with udp.

Such things can't always be avoided.  But they should always make you
think whether you could avoid them with judicious use of union types.

>> >  - No support for ipv4=3Don|off and ipv6=3Don|off flags to control
>> >    dual-stack usage.
>>=20
>> I wonder if this needs to be explicit -- it might simply derive from
>> addressing.
>
> This is explicitly everywhere we use sockets in QEMU - it is part
> of the SocketAddress QAPI schema.
>
> Consider an address "::", this is an IPv6 address, but depending on
> how you configure the socket it can accept either IPv6-only or both
> IPv6 and IPv4 incoming connections.
>
> If passing a hostname instead of a raw address, then  the ipv4/ipv6
> flags control whether we use all the returned DNS entries.

Yes.

>> > The "right" way to fix most of this long term is a radical change
>> > to introduce use of the SocketAddress struct.
>> >=20
>> > I could envisage something like this
>> >=20
>> >   { 'enum': 'NetdevSocketMode',
>> >     'data':  ['dgram', 'client', 'server'] }

I understand 'dgram' asks for passing SOCK_DGRAM to socket().  There are
no SOCK_CLIENT, SOCK_SERVER.  I guess they mean active SOCK_STREAM,
i.e. connect(), vs. passive SOCK_STREAM, i.e. listen().  In short:

    SOCK_DGRAM              'dgram'
    SOCK_STREAM, active     'client'
    SOCK_STREAM, passive    'server'

If we add another connection-based type, say SOCK_SEQPACKET, do we get
to pick names for

    SOCK_SEQPACKET, active  ???
    SOCK_SEQPACKET, passive ???

Encoding type and, if applicable, is-active in a single enum may or may
not be a good idea.

>> >=20
>> >   { 'struct': 'NetdevSocketOptions',
>> >     'data': {
>> >       'addr':      'SocketAddress',
>> >       '*localaddr': 'SocketAddress',
>> >       '*mode':      'NetdevSocketMode' } }
>> >=20
>> >=20
>> >  - A TCP client
>> >=20
>> >       addr.type =3D inet
>> >       addr.host =3D 192.168.1.1
>> >       mode =3D client
>> >
>> >  - A TCP server on all interfaces
>> >=20
>> >       addr.type =3D inet
>> >       addr.host =3D=20
>> >       mode =3D server
>> >=20
>> >  - A TCP server on a specific interface
>> >=20
>> >       addr.type =3D inet
>> >       addr.host =3D 192.168.1.1
>> >       mode =3D server
>> >=20
>> >  - A TCP server on all interfaces, without IPv4
>> >=20
>> >       addr.type =3D inet
>> >       addr.host =3D=20
>> >       addr.has_ipv4 =3D true
>> >       addr.ipv4 =3D false
>> >       mode =3D server
>>=20
>> ...perhaps it would be more consistent with other consolidated
>> practices to have addr.type =3D inet | inet6... and perhaps call it
>> addr.family.

Uh, "family": "fd" would be odd, wouldn't it?

Reminder:

    { 'union': 'SocketAddress',
      'base': { 'type': 'SocketAddressType' },
      'discriminator': 'type',
      'data': { 'inet': 'InetSocketAddress',
                'unix': 'UnixSocketAddress',
                'vsock': 'VsockSocketAddress',
                'fd': 'String' } }

>> Also, for "mode" (that could be called "type" to reflect
>> parameters for socket(2)), we should probably support SOCK_SEQPACKET as
>> well ("seq"?).

Well, 'mode' is more than just the socket type, it also includes
is-active for certain socket types.

> The naming I use here is determined by the QAPI 'SocketAddress'
> struct which has a 'type' field, and separate 'ipv4' and 'ipv6'
> flags.
>
>>=20
>> >  - A UDP unicast transport
>> >=20
>> >       addr.type =3D inet
>> >       addr.host =3D 192.168.1.1
>> >       mode =3D dgram
>> >=20
>> >  - A UDP unicast transport with local addr
>> >=20
>> >       addr.type =3D inet
>> >       addr.host =3D 192.168.1.1
>> >       localaddr.type =3D inet
>> >       localaddr.host =3D 192.168.1.2
>> >       mode =3D dgram
>> >=20
>> >  - A UDP multicast transport
>> >=20
>> >      addr.type =3D inet
>> >      addr.host =3D 224.0.23.166
>> >      mode =3D dgram
>> >=20
>> >  - A UNIX stream client
>> >=20
>> >       addr.type =3D unix
>> >       addr.path =3D /some/socket
>> >       mode =3D client
>> >=20
>> >  - A UNIX stream server
>> >=20
>> >       addr.type =3D unix
>> >       addr.path =3D /some/socket
>> >       mode =3D server
>> >=20
>> >  - A UNIX dgram transport
>> >=20
>> >       addr.type =3D unix
>> >       addr.path =3D /some/socket
>> >       mode =3D dgram

What about

           addr.type =3D fd
           addr.fd =3D some-fd
           mode =3D dgram

If the file descriptor has the right type, isn't "mode" redundant?  And
what if it doesn't?

>> >=20
>> >=20
>> > Now, of course you're just interested in adding UNIX socket support.
>> >=20
>> > This design I've outlined above is very much "boiling the ocean".
>> > Thus I'm not requesting you implement this, unless you have a strong
>> > desire to get heavily involved in some QEMU refactoring work.
>>=20
>> I don't really have a strong desire to do that, but to my naive eyes it
>> doesn't look that complicated, I'll give it a try.
>
> The hard bit is always the backwards compatibility for existing usage....
>
>
>> > The key question is whether we try to graft UNIX socket support onto
>> > the existing args ("connect"/"listen") or try to do something more
>> > explicit.
>> >=20
>> > Given the desire to have both dgram + stream support, I'd be inclined
>> > to do something more explicit, that's slightly more aligned with a
>> > possible future best praactice QAPI design
>> >=20
>> >=20
>> > IOW, we could take a simplified variant of the above as follows:
>> >=20
>> >=20
>> >   { 'enum': 'NetdevSocketMode',
>> >     'data':  ['dgram', 'client', 'server'] }
>> >=20
>> >   { 'struct': 'NetdevSocketOptions',
>> >     'data': {
>> >       '*fd':        'str',
>> >       '*listen':    'str',
>> >       '*connect':   'str',
>> >       '*mcast':     'str',
>> >       '*localaddr': 'str',
>> >       '*udp':       'str',
>> >       '*path':      'str' } }
>> >       '*localpath': 'str' } }
>> >=20
>> >=20
>> > Cli examples:
>> >=20
>> >  * Unix stream client
>> >=20
>> >   -netdev socket,path=3D/wibble,mode=3Dclient
>> >=20
>> >  * Unix stream server
>> > =20
>> >   -netdev socket,path=3D/wibble,mode=3Dserver
>> >=20
>> >  * Unix datagram=20
>> >=20
>> >   -netdev socket,path=3D/wibble,mode=3Ddgram
>> >   -netdev socket,path=3D/wibble,localpath=3D/fish,mode=3Ddgram
>>=20
>> I think this looks reasonable, I'm not sure about "localpath",
>> because also /wibble is local in some sense.
>
> "local" as in local to the process, rather than "local" as in
> local to the host.

I'm confused.  Is this related to the socket's address (think
getsockname()) vs. the peer's address (think getpeername())?

>> I don't know what would be a good implementation practice to keep the
>> current options available -- should this be done with some new code
>> that applies a translation to the new parameters?
>
> At the CLI parser side we'd just do translation to the new QAPI style
> usually, but I'm not sure how to handle the existing QAPI stuff though.
>
> Perhaps just add new fields to "NetdevSocketOptions" and deprecate
> existing ones that become obsolete.

This is always possible.  At best, it remains just as ugly as it is now.

> The only other alternative is a parallel type to completely obsolete
> NetdevSocketOptions,

Probably the only way to get a "modern" interface.  Whether it's worth
the effort is hard to tell.

>                      but I'm not sure what we'd call that.

If we can come up with a better backend name than "socket", it's easy:
NetdevBetterNameOptions.

> I had added Markus / Eric to CC to get advice on QAPI side here..

Hope I could help at least a little.


