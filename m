Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D55B5EBEA6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:31:24 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6vz-0008KI-BX
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od6jf-0002lp-Id
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:18:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od6jb-0001gg-ES
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664270314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gC/uijryF+3efejwXgHTBWROp8FpDTWBHT74vDSgZSc=;
 b=XWNuFnzuhNgLnV0utmICLwBz1d6BlDjpKXYE9CFKAQxgNNHAXECO/gWKP7LruYZ45TIQ2f
 3Ew5DWNUCpos54z8YoZPBukX4UPmTqvdv/olggvLHIwtHifn7dGuc3wfGuFvi0M7HhXLoH
 SLdVejmoVHKLpfanvS4kMLpJpld0fAA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-LJCes0MvOqy0Ojaj-4Sxqg-1; Tue, 27 Sep 2022 05:18:31 -0400
X-MC-Unique: LJCes0MvOqy0Ojaj-4Sxqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E29923C10697;
 Tue, 27 Sep 2022 09:18:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3D690A1C;
 Tue, 27 Sep 2022 09:18:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E05D21E691D; Tue, 27 Sep 2022 11:18:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Jason Wang <jasowang@redhat.com>,  Greg Kurz
 <groug@kaod.org>,  David Gibson <david@gibson.dropbear.id.au>,  Thomas
 Huth <thuth@redhat.com>,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Stefano Brivio
 <sbrivio@redhat.com>
Subject: Re: [PATCH v9 05/16] qapi: net: add stream and dgram netdevs
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-6-lvivier@redhat.com>
Date: Tue, 27 Sep 2022 11:18:29 +0200
In-Reply-To: <20220926195048.487915-6-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 26 Sep 2022 21:50:37 +0200")
Message-ID: <87zgelkwey.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> ---
>  hmp-commands.hx |   2 +-
>  net/clients.h   |   6 +
>  net/dgram.c     | 542 ++++++++++++++++++++++++++++++++++++++++++++++++
>  net/hub.c       |   2 +
>  net/meson.build |   2 +
>  net/net.c       |  30 ++-
>  net/stream.c    | 423 +++++++++++++++++++++++++++++++++++++
>  qapi/net.json   |  63 +++++-
>  qemu-options.hx |  12 ++
>  9 files changed, 1078 insertions(+), 4 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8ab8000acd9e..da40a7eb04ed 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1276,7 +1276,7 @@ ERST
>      {
>          .name       = "netdev_add",
>          .args_type  = "netdev:O",
> -        .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user"
> +        .params     = "[user|tap|socket|stream|dgram|vde|bridge|hubport|netmap|vhost-user"
>  #ifdef CONFIG_VMNET
>                        "|vmnet-host|vmnet-shared|vmnet-bridged"
>  #endif
> diff --git a/net/clients.h b/net/clients.h

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index dd088c09c509..e02e8001a000 100644
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
> +# if not.

Can we drop this sentence?

>            If remote address is present and it's a multicast address, local
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
> +#
> +# Since: 7.1
> +##

My networking fu is not strong enough to suggest further improvements.
So let's go with what we have here.

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
> index d8b5ce5b4354..8c765f345da8 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2734,6 +2734,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>      "                configure a network backend to connect to another network\n"
>      "                using an UDP tunnel\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"

Not this patch's fault: using String for SocketAddress member @fd was a
mistake, because the resulting UI is bad: addr.str tells me nothing.
str.name would have been better.  Commit 5be8c759f0 "qapi: add socket
address types" (v1.3.0).

Commit 1723d6b1cf "sockets: allow SocketAddress 'fd' to reference
numeric file descriptors" (v2.12.0) made it worse: it overloaded the
name so that decimal means numeric file descriptor.  It should be an
alternate of string file descriptor name and int file descriptor number.
Except keyval_parse() killed that use of alternates (commit c0644771eb
"qapi: Reject alternates that can't work with keyval_parse()",
v2.10.0-rc0).  Sigh, too complicated to have nice things.

Back to this patch.  "addr.str=h" could perhaps be improved to
"=fd-name-or-number" or "=file-descriptor".  Even "=fd" would be better,
I think.

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

I should probably try to match these cases to the table in the QAPI
schema doc comment.  But that would be like, uh, work.

>  #ifdef CONFIG_VDE
>      "-netdev vde,id=str[,sock=socketpath][,port=n][,group=groupname][,mode=octalmode]\n"
>      "                configure a network backend to connect to port 'n' of a vde switch\n"

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


