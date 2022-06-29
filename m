Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C70755FE6A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 13:22:32 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6VmB-0000ms-3p
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 07:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6VkL-0007ws-Hz
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6VkE-0000TK-8Q
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656501629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQWdXFFmV0uyBiHGX3kC1X4p0LljszbffyWdUaL8f9A=;
 b=HzrELF7b05TFjWawOTwO1djWPXw0Z5gh2oRpofE/CPLIWGaApt3fgI5bVymxxcCs6NzatQ
 J/lMFSd5554bGyrfJcuZlWh8HVGlie1OSm5ViHNXqqZnN/kqwZbQq0mqsiKW5np+cL/2JC
 gE3u6WOnSrRfuvk6TUiUleenQ50Bjcc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-7bBNx023OD-fVcbamqpZFA-1; Wed, 29 Jun 2022 07:20:27 -0400
X-MC-Unique: 7bBNx023OD-fVcbamqpZFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4FA811E75
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 11:20:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D6EA1121314;
 Wed, 29 Jun 2022 11:20:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2925821E690D; Wed, 29 Jun 2022 13:20:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Stefano Brivio
 <sbrivio@redhat.com>
Subject: Re: [PATCH v5 05/12] qapi: net: add stream and dgram netdevs
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-6-lvivier@redhat.com>
Date: Wed, 29 Jun 2022 13:20:26 +0200
In-Reply-To: <20220627154749.871943-6-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 27 Jun 2022 17:47:42 +0200")
Message-ID: <875ykjhg1x.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Only some address types are valid, as discussed in review of v4.
Shouldn't we document that here?

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
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'NetdevDgramOptions',
> +  'data': {
> +    '*local':  'SocketAddress',
> +    '*remote': 'SocketAddress' }=C2=A0}

Hard to see, but the space in "}=C2=A0}" is funny: it's U+00A0
(NO-BREAK-SPACE) encoded in UTF-8.  Make it a plain old space, please.

Only some combinations of address types are valid, as discussed in
review of v4.  Shouldn't we document that here?

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
> index 377d22fbd82f..2be0cbd2549b 100644
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
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dinet,local.host=3Daddr]\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dfd,local.str=3Dh]\n"
> +    "                configure a network backend to connect to a multica=
st maddr and port\n"
> +    "                use 'local.host=3Daddr' to specify the host address=
 to send packets from\n"

I think we use ``local.host=3Daddr`` markup.

> +    "-netdev dgram,id=3Dstr,local.type=3Dinet,local.host=3Daddr,local.po=
rt=3Dport[,remote.type=3Dinet,remote.host=3Daddr,remote.port=3Dport]\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dfd,local.str=3Dh\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using an UDP tunnel\n"
>  #ifdef CONFIG_VDE
>      "-netdev vde,id=3Dstr[,sock=3Dsocketpath][,port=3Dn][,group=3Dgroupn=
ame][,mode=3Doctalmode]\n"
>      "                configure a network backend to connect to port 'n' =
of a vde switch\n"

I intend to look at this again after we decide what to do about the doc
comments in net.json.


