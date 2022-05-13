Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E3526155
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 13:47:31 +0200 (CEST)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npTlZ-0001na-M5
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 07:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npTiV-0000xx-GD
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npTiS-0008OZ-Dl
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652442254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NcqXPT4kfc4aU1VYXgHoO21ZNKz2jyW65ErDTIIqPqc=;
 b=HddJYUtJgWnqZwVpXsnvAi2fEAcHxo9K/pIjFzjZGO7BO9aXU5vyaaSoy5cePl7uhsYTC1
 aahfr23g90bEbXbj0SGK8Xls0LeLEf+qkNH9o0i8wneBCPGpVqboydIefsjz6iXRE6ZXXA
 LmVAwzYlujTQZRZuvNEx1rEVMo+iB/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-OK2O-uFWNCy7GvpytaJtyA-1; Fri, 13 May 2022 07:44:13 -0400
X-MC-Unique: OK2O-uFWNCy7GvpytaJtyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F9BB38349C3
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 11:44:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D49D1121331;
 Fri, 13 May 2022 11:44:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C1CEC21E690D; Fri, 13 May 2022 13:44:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 3/8] qapi: net: add stream and dgram netdevs
References: <20220512080932.735962-1-lvivier@redhat.com>
 <20220512080932.735962-4-lvivier@redhat.com>
Date: Fri, 13 May 2022 13:44:11 +0200
In-Reply-To: <20220512080932.735962-4-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 12 May 2022 10:09:27 +0200")
Message-ID: <87fsld1wtw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
> ---
>  hmp-commands.hx |   2 +-
>  net/clients.h   |   6 +
>  net/dgram.c     | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>  net/hub.c       |   2 +
>  net/meson.build |   2 +
>  net/net.c       |  24 +-
>  net/stream.c    | 425 ++++++++++++++++++++++++++++++++
>  qapi/net.json   |  38 ++-
>  8 files changed, 1125 insertions(+), 4 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 03e6a73d1f55..172dbab1dfed 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1269,7 +1269,7 @@ ERST
>      {
>          .name       = "netdev_add",
>          .args_type  = "netdev:O",
> -        .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
> +        .params     = "[user|tap|socket|stream|dgram|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
>          .help       = "add host network device",
>          .cmd        = hmp_netdev_add,
>          .command_completion = netdev_add_completion,

Does qemu-options.hx need an update, too?

> diff --git a/net/clients.h b/net/clients.h
> index 92f9b59aedce..c1b51d79b147 100644
> --- a/net/clients.h
> +++ b/net/clients.h
> @@ -40,6 +40,12 @@ int net_init_hubport(const Netdev *netdev, const char *name,
>  int net_init_socket(const Netdev *netdev, const char *name,
>                      NetClientState *peer, Error **errp);
>  
> +int net_init_stream(const Netdev *netdev, const char *name,
> +                    NetClientState *peer, Error **errp);
> +
> +int net_init_dgram(const Netdev *netdev, const char *name,
> +                   NetClientState *peer, Error **errp);
> +
>  int net_init_tap(const Netdev *netdev, const char *name,
>                   NetClientState *peer, Error **errp);
>  
> diff --git a/net/dgram.c b/net/dgram.c
> new file mode 100644
> index 000000000000..aa4240501ed0
> --- /dev/null
> +++ b/net/dgram.c
> @@ -0,0 +1,630 @@
> +/*
> + * QEMU System Emulator
> + *
> + * Copyright (c) 2003-2008 Fabrice Bellard
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

Blank line here, please.

Why not GPLv2+?

> +#include "qemu/osdep.h"

[...]

> diff --git a/net/net.c b/net/net.c
> index 2aab7167316c..fd6b30a10c57 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1015,6 +1015,8 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>  #endif
>          [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
>          [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
> +        [NET_CLIENT_DRIVER_STREAM]    = net_init_stream,
> +        [NET_CLIENT_DRIVER_DGRAM]     = net_init_dgram,
>  #ifdef CONFIG_VDE
>          [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
>  #endif
> @@ -1097,6 +1099,8 @@ void show_netdevs(void)
>      int idx;
>      const char *available_netdevs[] = {
>          "socket",
> +        "stream",
> +        "dgram",
>          "hubport",
>          "tap",
>  #ifdef CONFIG_SLIRP
> @@ -1606,7 +1610,25 @@ int net_init_clients(Error **errp)
>   */
>  static bool netdev_is_modern(const char *optarg)
>  {
> -    return false;
> +    static QemuOptsList dummy_opts = {
> +        .name = "netdev",
> +        .implied_opt_name = "type",
> +        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
> +        .desc = { { } },
> +    };
> +    const char *netdev;
> +    QemuOpts *opts;
> +    bool is_modern;
> +
> +    opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
> +    netdev = qemu_opt_get(opts, "type");
> +
> +    is_modern = strcmp(netdev, "stream") == 0 ||
> +                strcmp(netdev, "dgram") == 0;

Crashes when user neglects to pass "type".
> +
> +    qemu_opts_reset(&dummy_opts);
> +
> +    return is_modern;
>  }

Reminder: netdev_is_modern() governs whether to use QemuOpts + opts
visitor or qobject_input_visitor_new_str().

To decide, it uses QemuOpts with a dummy QemuOptsList.

Since we parse errors are fatal here, new syntax must also parse fine as
QemuOpts.  Undesirable, I think.

Cleaner, I think:

    args = keyval_parse(optarg, "type", NULL, NULL);
    if (!args) {
        return false;
    }
    type = qdict_get_try_str(args, "type");
    return !g_strcmp0(type, "dgram") || !g_strcmp0(type, "stream");

Not even compile-tested.

Still probematic: syntax error reporting.  When keyval_parse() fails
here, we use QemuOpts, and therefore get QemuOpts syntax errors.  I fear
that could be quite confusing.

>  
>  int net_client_parse(QemuOptsList *opts_list, const char *optarg)
> diff --git a/net/stream.c b/net/stream.c
> new file mode 100644
> index 000000000000..fdc97ee43a56
> --- /dev/null
> +++ b/net/stream.c
> @@ -0,0 +1,425 @@
> +/*
> + * QEMU System Emulator
> + *
> + * Copyright (c) 2003-2008 Fabrice Bellard
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

Blank line here, please.

Why not GPLv2+?

> +#include "qemu/osdep.h"

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index b92f3f5fb444..eef288886e1b 100644
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
> @@ -452,6 +453,37 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
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

Defaults?

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
> @@ -462,8 +494,8 @@
>  #        @vhost-vdpa since 5.1
>  ##
>  { 'enum': 'NetClientDriver',
> -  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream', 'dgram',
> +            'vde', 'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }

Long lines.
>  
>  ##
>  # @Netdev:
> @@ -487,6 +519,8 @@
>      'tap':      'NetdevTapOptions',
>      'l2tpv3':   'NetdevL2TPv3Options',
>      'socket':   'NetdevSocketOptions',
> +    'stream':   'NetdevStreamOptions',
> +    'dgram':    'NetdevDgramOptions',
>      'vde':      'NetdevVdeOptions',
>      'bridge':   'NetdevBridgeOptions',
>      'hubport':  'NetdevHubPortOptions',


