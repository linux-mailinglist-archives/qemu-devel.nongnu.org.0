Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72858796E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:57:24 +0200 (CEST)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIniN-0006HT-DB
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oInQ2-00010v-Px
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oInP6-00011Y-E9
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659429446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zdtVqFbMCACeS09fM6E0mpw7wvxfWXyalTKEfKdvopo=;
 b=bQqH7UWKLkg3nCbFR0I35w4PHagYcnDDcRFElH8YaFqxcvAWdWSOG7wGK2EFM5mc7cTuxY
 jPXVBWt1KYVyV2h6JqTJ5OeoOQSXMc6kdQWWtk9CRvAVj20cipIVgKIjASJ7+7GYlGT4XQ
 avCVqAo/43vrjMyzLFGWpRzD7y839+A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-mjBsib2wN8GAHldJbdxtZQ-1; Tue, 02 Aug 2022 04:37:25 -0400
X-MC-Unique: mjBsib2wN8GAHldJbdxtZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A59E3C02B84
 for <qemu-devel@nongnu.org>; Tue,  2 Aug 2022 08:37:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C687B2026D64;
 Tue,  2 Aug 2022 08:37:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 891A621E6930; Tue,  2 Aug 2022 10:37:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Stefano Brivio
 <sbrivio@redhat.com>
Subject: Re: [PATCH v7 05/14] qapi: net: add stream and dgram netdevs
References: <20220722190442.301310-1-lvivier@redhat.com>
 <20220722190442.301310-6-lvivier@redhat.com>
Date: Tue, 02 Aug 2022 10:37:23 +0200
In-Reply-To: <20220722190442.301310-6-lvivier@redhat.com> (Laurent Vivier's
 message of "Fri, 22 Jul 2022 21:04:33 +0200")
Message-ID: <874jyvujlo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
> with the traditional way, the "type" field of netdev structure collides with
> the "type" field of SocketAddress and prevents the correct evaluation of the
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
> index 75ba2cb98901..a7506a40ff12 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
>  
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
>  
>  ##
>  # @set_link:
> @@ -573,6 +574,61 @@
>      '*isolated':  'bool' },
>    'if': 'CONFIG_VMNET' }
>  
> +##
> +# @NetdevStreamOptions:
> +#
> +# Configuration info for stream socket netdev
> +#
> +# @addr: socket address to listen on (server=true)
> +#        or connect to (server=false)
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
> +# The code checks there is at least one of these options and reports an error
> +# if not. If remote address is present and it's a multicast address, local
> +# address is optional. Otherwise local address is required and remote address
> +# is optional.
> +#
> +# .. table:: Valid parameters combination table
> +#    :widths: auto
> +#
> +#    =============  ========  =====
> +#    remote         local     okay?
> +#    =============  ========  =====
> +#    absent         absent    no
> +#    absent         not fd    no
> +#    absent         fd        yes
> +#    multicast      absent    yes
> +#    multicast      present   yes
> +#    not multicast  absent    no
> +#    not multicast  present   yes
> +#    =============  ========  =====

Looks good now.

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
> @@ -586,8 +642,9 @@
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
> @@ -617,6 +674,8 @@
>      'tap':      'NetdevTapOptions',
>      'l2tpv3':   'NetdevL2TPv3Options',
>      'socket':   'NetdevSocketOptions',
> +    'stream':   'NetdevStreamOptions',
> +    'dgram':    'NetdevDgramOptions',
>      'vde':      'NetdevVdeOptions',
>      'bridge':   'NetdevBridgeOptions',
>      'hubport':  'NetdevHubPortOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 79e00916a11f..170117e1adf0 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2726,6 +2726,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>      "                configure a network backend to connect to another network\n"
>      "                using an UDP tunnel\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
> +    "                configure a network backend to connect to another network\n"
> +    "                using a socket connection in stream mode.\n"
> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=fd,local.str=h]\n"
> +    "                configure a network backend to connect to a multicast maddr and port\n"
> +    "                use ``local.host=addr`` to specify the host address to send packets from\n"
> +    "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
> +    "-netdev dgram,id=str,local.type=fd,local.str=h\n"
> +    "                configure a network backend to connect to another network\n"
> +    "                using an UDP tunnel\n"
>  #ifdef CONFIG_VDE
>      "-netdev vde,id=str[,sock=socketpath][,port=n][,group=groupname][,mode=octalmode]\n"
>      "                configure a network backend to connect to port 'n' of a vde switch\n"

I had a few questions on this part in review of v6.  Care to reply
there?


