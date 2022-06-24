Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B05596EB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:42:59 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fq5-0007hO-NL
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4fp5-0006hS-7O
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4fp1-0000D9-4c
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656063703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksx4XId3GQWbtzz0QtV4pD0p2upZc0OPbY2EnV7RREg=;
 b=cAxpyQhd3wBeE39d+0XcLF60CtawuYbHNvL3dz0VE8MuowuRJ/B+1VO7q/7PeM8YZzzvqb
 aGMkoh7iSlIFbegx5p8bjESu9oNvrOX4OjrXzyJlRYybxO3sjclobxe0+zMT0PbUJ5QVeL
 sdeIllNNuxQkIumXaOJI/HLoYQp0DGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-dqc6XXZLPLmLk-D0nC40rg-1; Fri, 24 Jun 2022 05:41:41 -0400
X-MC-Unique: dqc6XXZLPLmLk-D0nC40rg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A0C6801E67
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:41:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08EBF492CA5;
 Fri, 24 Jun 2022 09:41:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8172721E690D; Fri, 24 Jun 2022 11:41:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v4 04/11] qapi: net: add stream and dgram netdevs
References: <20220623155317.675932-1-lvivier@redhat.com>
 <20220623155317.675932-5-lvivier@redhat.com>
Date: Fri, 24 Jun 2022 11:41:39 +0200
In-Reply-To: <20220623155317.675932-5-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 23 Jun 2022 17:53:10 +0200")
Message-ID: <87a6a2bdpo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> ---

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index d6f7cfd4d656..32a9b1a5ac6c 100644
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
> @@ -566,6 +567,42 @@
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
> +# The code checks there is at least one of these options and reports an =
error
> +# if not. If remote address is present and it's a multicast address, loc=
al
> +# address is optional. Otherwise local address is required and remote ad=
dress
> +# is optional.

I need to make a table to understand this.


    @remote         @local      |   okay?
    ----------------------------+--------
    absent          present     |   yes
    multicast       absent      |   yes
    multicast       present     |   yes
    not multicast   absent      |   no
    not multicast   present     |   yes

Correct?

> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'NetdevDgramOptions',
> +  'data': {
> +    '*local':  'SocketAddress',
> +    '*remote': 'SocketAddress' }=C2=A0}
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -579,8 +616,9 @@
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
> @@ -610,6 +648,8 @@
>      'tap':      'NetdevTapOptions',
>      'l2tpv3':   'NetdevL2TPv3Options',
>      'socket':   'NetdevSocketOptions',
> +    'stream':   'NetdevStreamOptions',
> +    'dgram':    'NetdevDgramOptions',
>      'vde':      'NetdevVdeOptions',
>      'bridge':   'NetdevBridgeOptions',
>      'hubport':  'NetdevHubPortOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd82f..03d58da6f8ed 100644
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

This shows -netdev stream with address types 'inet' and 'fd' only.  Are
address types 'unix' and and 'vsock' rejected?

> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dinet,local.host=3Daddr]\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dfd,local.str=3Dh]\n"
> +    "                configure a network backend to connect to a multica=
st maddr and port\n"
> +    "                use 'local.host=3Daddr' to specify the host address=
 to send packets from\n"

I think we use ``local.host=3Daddr`` markup.

Since this part is about multicast, only remote.type=3Dinet makes sense
(other types can't be multicast).

Are local address types 'unix' and 'vsock' rejected?

> +    "-netdev dgram,id=3Dstr,local.type=3Dinet,local.host=3Dhost,local.po=
rt=3Dport[,remote.type=3Dinet,remote.host=3Dhost,remote.port=3Dport]\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dfd,local.str=3Dh\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using an UDP tunnel\n"

Is this unicast only?

Are other combinations of local.type and remote.type rejected?

>  #ifdef CONFIG_VDE
>      "-netdev vde,id=3Dstr[,sock=3Dsocketpath][,port=3Dn][,group=3Dgroupn=
ame][,mode=3Doctalmode]\n"
>      "                configure a network backend to connect to port 'n' =
of a vde switch\n"


