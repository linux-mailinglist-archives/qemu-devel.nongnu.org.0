Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B6C568B23
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 16:24:12 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o95wp-0008OC-0Y
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 10:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o95vu-0007ez-Oo
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 10:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o95vq-0002de-7a
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 10:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657117389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deCaps84aryyD0CVrZkmpvW6bfGfeKXAidOimZ0pGpQ=;
 b=I/8mFE5E3ETPkqTvOoXHtvikS/rKBtd8mcpaY5BEq4YAjaZMvBhdMHDoqrG1cBdkb4CIZh
 29rte3l3/BdrpRj1CN4UUDxdekgLYuvPtYAfagDPf1OE9P7d2jp6nuVb6NR0QOPw9ZZacd
 Esdv6faqHAEeqfp6F16H22ORyujXzCM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-z_AF1VRoNJmmUpKQCa9nPw-1; Wed, 06 Jul 2022 10:23:01 -0400
X-MC-Unique: z_AF1VRoNJmmUpKQCa9nPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5F279693A0
 for <qemu-devel@nongnu.org>; Wed,  6 Jul 2022 14:23:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6304E2EF97;
 Wed,  6 Jul 2022 14:23:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3307F21E690D; Wed,  6 Jul 2022 16:23:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Jason
 Wang <jasowang@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v6 05/13] qapi: net: add stream and dgram netdevs
References: <20220706062847.1396719-1-lvivier@redhat.com>
 <20220706062847.1396719-6-lvivier@redhat.com>
Date: Wed, 06 Jul 2022 16:23:00 +0200
In-Reply-To: <20220706062847.1396719-6-lvivier@redhat.com> (Laurent Vivier's
 message of "Wed, 6 Jul 2022 08:28:39 +0200")
Message-ID: <87mtdml3qz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Laurent Vivier <lvivier@redhat.com> writes:

> Copied from socket netdev file and modified to use SocketAddress
> to be able to introduce new features like unix socket.
>
> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
> according to the IP address type.
> "listen" and "connect" modes are managed by stream netdev. An optional
> parameter "server" defines the mode (server by default)
>
> The two new types need to be parsed the modern way with -netdev, because
> with the traditional way, the "type" field of netdev structure collides w=
ith
> the "type" field of SocketAddress and prevents the correct evaluation of =
the
> command line option. Moreover the traditional way doesn't allow to use
> the same type (SocketAddress) several times with the -netdev option
> (needed to specify "local" and "remote" addresses).
>
> The previous commit paved the way for parsing the modern way, but
> omitted one detail: how to pick modern vs. traditional, in
> netdev_is_modern().
>
> We want to pick based on the value of parameter "type".  But how to
> extract it from the option argument?
>
> Parsing the option argument, either the modern or the traditional way,
> extracts it for us, but only if parsing succeeds.
>
> If parsing fails, there is no good option.  No matter which parser we
> pick, it'll be the wrong one for some arguments, and the error
> reporting will be confusing.
>
> Fortunately, the traditional parser accepts *anything* when called in
> a certain way.  This maximizes our chance to extract the value of
> "type", and in turn minimizes the risk of confusing error reporting.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index 9af11e9a3bb2..4c5245321947 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
>=20=20
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
>=20=20
>  ##
>  # @set_link:
> @@ -566,6 +567,57 @@
>      '*isolated':  'bool' },
>    'if': 'CONFIG_VMNET' }
>=20=20
> +##
> +# @NetdevStreamOptions:
> +#
> +# Configuration info for stream socket netdev
> +#
> +# @addr: socket address to listen on (server=3Dtrue)
> +#        or connect to (server=3Dfalse)
> +# @server: create server socket (default: true)
> +#
> +# Only SocketAddress types 'inet' and 'fd' are supported.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'NetdevStreamOptions',
> +  'data': {
> +    'addr':   'SocketAddress',
> +    '*server': 'bool' } }
> +
> +##
> +# @NetdevDgramOptions:
> +#
> +# Configuration info for datagram socket netdev.
> +#
> +# @remote: remote address
> +# @local: local address
> +#
> +# Only SocketAddress types 'inet' and 'fd' are supported.
> +#
> +# The code checks there is at least one of these options and reports an =
error
> +# if not. If remote address is present and it's a multicast address, loc=
al
> +# address is optional. Otherwise local address is required and remote ad=
dress
> +# is optional.
> +#
> +# Valid parameters combination table:
> +#
> +#    @remote         @local      |   okay?
> +#    ----------------------------+--------
> +#    absent          absent      |   no
> +#    absent          present     |   yes
> +#    multicast       absent      |   yes
> +#    multicast       present     |   yes
> +#    not multicast   absent      |   no
> +#    not multicast   present     |   yes

You need to use suitable markup for the table.  As is, it comes out like

    remote local | okay? =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94-+=E2=80=94=E2=80=94=E2=80=93 absent absen=
t | no absent present | yes multicast absent | yes multicast present | yes =
not multicast absent | no not multicast present | yes

in formatted documentation.

Possibly useful: https://pandemic-overview.readthedocs.io/en/latest/myGuide=
s/reStructuredText-Tables-Examples.html

I created this table in my review of v4 to double-check I got the doc
text.  Keep it only if *you* think it's useful.  Feel free to delete it.

> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'NetdevDgramOptions',
> +  'data': {
> +    '*local':  'SocketAddress',
> +    '*remote': 'SocketAddress' } }
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -579,8 +631,9 @@
>  #        @vmnet-bridged since 7.1
>  ##
>  { 'enum': 'NetClientDriver',
> -  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream',
> +            'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user',
> +            'vhost-vdpa',
>              { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>              { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
>              { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
> @@ -610,6 +663,8 @@
>      'tap':      'NetdevTapOptions',
>      'l2tpv3':   'NetdevL2TPv3Options',
>      'socket':   'NetdevSocketOptions',
> +    'stream':   'NetdevStreamOptions',
> +    'dgram':    'NetdevDgramOptions',
>      'vde':      'NetdevVdeOptions',
>      'bridge':   'NetdevBridgeOptions',
>      'hubport':  'NetdevHubPortOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd82f..215a2615f13f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2722,6 +2722,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev socket,id=3Dstr[,fd=3Dh][,udp=3Dhost:port][,localaddr=3Dhos=
t:port]\n"
>      "                configure a network backend to connect to another n=
etwork\n"
>      "                using an UDP tunnel\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dinet,addr.hos=
t=3Dhost,addr.port=3Dport\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dfd,addr.str=
=3Dh\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using a socket connection in stream mode.\n"

This part needs to match NetdevStreamOptions above.

Missing here: the optional members of InetSocketAddress: numeric, to,
ipv4, ...  Do we care?

The next part needs to match NetdevDgramOptions above.

> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dinet,local.host=3Daddr]\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dfd,local.str=3Dh]\n"
> +    "                configure a network backend to connect to a multica=
st maddr and port\n"
> +    "                use ``local.host=3Daddr`` to specify the host addre=
ss to send packets from\n"

I figure this covers table rows

   #    @remote         @local      |   okay?
   #    ----------------------------+--------
   #    multicast       absent      |   yes
   #    multicast       present     |   yes

for remote.type=3Dinet and any local.type.

What about remote.type=3Dfd?

> +    "-netdev dgram,id=3Dstr,local.type=3Dinet,local.host=3Daddr,local.po=
rt=3Dport[,remote.type=3Dinet,remote.host=3Daddr,remote.port=3Dport]\n"

I figure this covers table rows

    #    absent          present     |   yes
    #    not multicast   present     |   yes

for *.type=3Dinet.

> +    "-netdev dgram,id=3Dstr,local.type=3Dfd,local.str=3Dh\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using an UDP tunnel\n"

I figure this covers table row

   #    absent          present     |   yes

for local.type=3Dfd.

Together, they cover table row

    #    absent          present     |   yes

for any local.type.  Good.

Table row

    #    not multicast   present     |   yes

is only covered for *.type=3Dinet.  Could either of the types be fd?

>  #ifdef CONFIG_VDE
>      "-netdev vde,id=3Dstr[,sock=3Dsocketpath][,port=3Dn][,group=3Dgroupn=
ame][,mode=3Doctalmode]\n"
>      "                configure a network backend to connect to port 'n' =
of a vde switch\n"


