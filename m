Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5232B54BCEC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:44:34 +0200 (CEST)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1EKu-0005MV-Vq
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o1EIz-0004cy-CF
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o1EIu-0004UM-NP
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655242946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asEK8bqrO8wXwKTCZRpuKq8coJ+F1ydpma2RVLN27GQ=;
 b=YtWIyAl7oWKRXRZMVNsJVbhdSn9c8Ee7FstgZDHjIspBaqNvmGjWMoAWJ5own7qXU9BZ/j
 Jtd7CMwsptzCQffhBAqlQSodewuYc9cbITSI/B1TNJXoy4jppOKHZjEp0f6C9xt5gNCum3
 PRFGxzvPkoFhyKPvPCz9coCcfTqj/Vk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-6uDh77pPM3y7X02ll1OokA-1; Tue, 14 Jun 2022 17:42:25 -0400
X-MC-Unique: 6uDh77pPM3y7X02ll1OokA-1
Received: by mail-qv1-f72.google.com with SMTP id
 kl30-20020a056214519e00b0046d8f1cd655so6816308qvb.19
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=asEK8bqrO8wXwKTCZRpuKq8coJ+F1ydpma2RVLN27GQ=;
 b=viwXmAnlQqmSG971Fp94q6liqH9DWOZAaUmfGWnbnLV5/HMzGZl9xrraZtNzmkEz6r
 16GsAOwlOUeah8nKWwr7zPlXG0buJYF4KMVLuh8Q9HniyowM42DI+3z5gWP4//V5jzSY
 JXFUlTV+GFniTynBuzzCP3GVS1BNKssAnnnU3wB/UbPuYwZzjNRHWW/ZtBJidjpx0PSo
 P5mj/1UKuTa2mFx8H9ZzsAviqigFBAcB3LW21Ckm9amvYIIRjIimV33mDlPheO0AwiJd
 DXHYgCxXmiUgZ4LyW0e4o0onLQFEeXLB38WolbxiFlBKoo/7tf0H792ytldIz01C9H1V
 pKCQ==
X-Gm-Message-State: AJIora8pn80w3ex3QIbEXvSXbSjsESBE7t51TalcaxjdQXnY/ao58TaS
 87/6OTkC2buDP2gGYYt7I/WDDOsHXi2aeBZBGAmKYw2DLNygyAaiIZVYz2wUrklerBDjdvIKUZp
 XHZaaFZZw+ptCvas=
X-Received: by 2002:a05:6214:410d:b0:467:d399:251c with SMTP id
 kc13-20020a056214410d00b00467d399251cmr5273834qvb.122.1655242944971; 
 Tue, 14 Jun 2022 14:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sIlB5QT130CsjSH0+bmkgnIntb3fCCqOG+9FlElxjVUYs20eWWFr6NK3SZ5mnOh4w6a18wnQ==
X-Received: by 2002:a05:6214:410d:b0:467:d399:251c with SMTP id
 kc13-20020a056214410d00b00467d399251cmr5273816qvb.122.1655242944531; 
 Tue, 14 Jun 2022 14:42:24 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a05620a415300b006a6ad90a117sm11204613qko.105.2022.06.14.14.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 14:42:24 -0700 (PDT)
Message-ID: <a2a0124d-5065-3c1e-9c84-8b6d92addfae@redhat.com>
Date: Tue, 14 Jun 2022 23:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v2 3/8] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220512080932.735962-1-lvivier@redhat.com>
 <20220512080932.735962-4-lvivier@redhat.com> <87fsld1wtw.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87fsld1wtw.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13/05/2022 13:44, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> Copied from socket netdev file and modified to use SocketAddress
>> to be able to introduce new features like unix socket.
>>
>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>> according to the IP address type.
>> "listen" and "connect" modes are managed by stream netdev. An optional
>> parameter "server" defines the mode (server by default)
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   hmp-commands.hx |   2 +-
>>   net/clients.h   |   6 +
>>   net/dgram.c     | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   net/hub.c       |   2 +
>>   net/meson.build |   2 +
>>   net/net.c       |  24 +-
>>   net/stream.c    | 425 ++++++++++++++++++++++++++++++++
>>   qapi/net.json   |  38 ++-
>>   8 files changed, 1125 insertions(+), 4 deletions(-)
>>   create mode 100644 net/dgram.c
>>   create mode 100644 net/stream.c
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 03e6a73d1f55..172dbab1dfed 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1269,7 +1269,7 @@ ERST
>>       {
>>           .name       = "netdev_add",
>>           .args_type  = "netdev:O",
>> -        .params     = "[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
>> +        .params     = "[user|tap|socket|stream|dgram|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,...]",
>>           .help       = "add host network device",
>>           .cmd        = hmp_netdev_add,
>>           .command_completion = netdev_add_completion,
> 
> Does qemu-options.hx need an update, too?

Done

> 
>> diff --git a/net/clients.h b/net/clients.h
>> index 92f9b59aedce..c1b51d79b147 100644
>> --- a/net/clients.h
>> +++ b/net/clients.h
>> @@ -40,6 +40,12 @@ int net_init_hubport(const Netdev *netdev, const char *name,
>>   int net_init_socket(const Netdev *netdev, const char *name,
>>                       NetClientState *peer, Error **errp);
>>   
>> +int net_init_stream(const Netdev *netdev, const char *name,
>> +                    NetClientState *peer, Error **errp);
>> +
>> +int net_init_dgram(const Netdev *netdev, const char *name,
>> +                   NetClientState *peer, Error **errp);
>> +
>>   int net_init_tap(const Netdev *netdev, const char *name,
>>                    NetClientState *peer, Error **errp);
>>   
>> diff --git a/net/dgram.c b/net/dgram.c
>> new file mode 100644
>> index 000000000000..aa4240501ed0
>> --- /dev/null
>> +++ b/net/dgram.c
>> @@ -0,0 +1,630 @@
>> +/*
>> + * QEMU System Emulator
>> + *
>> + * Copyright (c) 2003-2008 Fabrice Bellard
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
> 
> Blank line here, please.
> 
> Why not GPLv2+?

I've kept the original text copied from net/socket.c, but I can move this to GPL2+

> 
>> +#include "qemu/osdep.h"
> 
> [...]
> 
>> diff --git a/net/net.c b/net/net.c
>> index 2aab7167316c..fd6b30a10c57 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -1015,6 +1015,8 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>>   #endif
>>           [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
>>           [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
>> +        [NET_CLIENT_DRIVER_STREAM]    = net_init_stream,
>> +        [NET_CLIENT_DRIVER_DGRAM]     = net_init_dgram,
>>   #ifdef CONFIG_VDE
>>           [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
>>   #endif
>> @@ -1097,6 +1099,8 @@ void show_netdevs(void)
>>       int idx;
>>       const char *available_netdevs[] = {
>>           "socket",
>> +        "stream",
>> +        "dgram",
>>           "hubport",
>>           "tap",
>>   #ifdef CONFIG_SLIRP
>> @@ -1606,7 +1610,25 @@ int net_init_clients(Error **errp)
>>    */
>>   static bool netdev_is_modern(const char *optarg)
>>   {
>> -    return false;
>> +    static QemuOptsList dummy_opts = {
>> +        .name = "netdev",
>> +        .implied_opt_name = "type",
>> +        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
>> +        .desc = { { } },
>> +    };
>> +    const char *netdev;
>> +    QemuOpts *opts;
>> +    bool is_modern;
>> +
>> +    opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
>> +    netdev = qemu_opt_get(opts, "type");
>> +
>> +    is_modern = strcmp(netdev, "stream") == 0 ||
>> +                strcmp(netdev, "dgram") == 0;
> 
> Crashes when user neglects to pass "type".

I think "type" is always passed because of the '.implied_opt_name = "type"'. Am I wrong?


>> +
>> +    qemu_opts_reset(&dummy_opts);
>> +
>> +    return is_modern;
>>   }
> 
> Reminder: netdev_is_modern() governs whether to use QemuOpts + opts
> visitor or qobject_input_visitor_new_str().
> 
> To decide, it uses QemuOpts with a dummy QemuOptsList.
> 
> Since we parse errors are fatal here, new syntax must also parse fine as
> QemuOpts.  Undesirable, I think.
> 
> Cleaner, I think:
> 
>      args = keyval_parse(optarg, "type", NULL, NULL);
>      if (!args) {
>          return false;
>      }
>      type = qdict_get_try_str(args, "type");
>      return !g_strcmp0(type, "dgram") || !g_strcmp0(type, "stream");
> 
> Not even compile-tested.

ok, I try that.

> Still probematic: syntax error reporting.  When keyval_parse() fails
> here, we use QemuOpts, and therefore get QemuOpts syntax errors.  I fear
> that could be quite confusing.
> 
>>   
>>   int net_client_parse(QemuOptsList *opts_list, const char *optarg)
>> diff --git a/net/stream.c b/net/stream.c
>> new file mode 100644
>> index 000000000000..fdc97ee43a56
>> --- /dev/null
>> +++ b/net/stream.c
>> @@ -0,0 +1,425 @@
>> +/*
>> + * QEMU System Emulator
>> + *
>> + * Copyright (c) 2003-2008 Fabrice Bellard
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
> 
> Blank line here, please.
> 
> Why not GPLv2+?

As above.

> 
>> +#include "qemu/osdep.h"
> 
> [...]
> 
>> diff --git a/qapi/net.json b/qapi/net.json
>> index b92f3f5fb444..eef288886e1b 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -7,6 +7,7 @@
>>   ##
>>   
>>   { 'include': 'common.json' }
>> +{ 'include': 'sockets.json' }
>>   
>>   ##
>>   # @set_link:
>> @@ -452,6 +453,37 @@
>>       '*vhostdev':     'str',
>>       '*queues':       'int' } }
>>   
>> +##
>> +# @NetdevStreamOptions:
>> +#
>> +# Configuration info for stream socket netdev
>> +#
>> +# @addr: socket address to listen on (server=true)
>> +#        or connect to (server=false)
>> +# @server: create server socket (default: true)
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'NetdevStreamOptions',
>> +  'data': {
>> +    'addr':   'SocketAddress',
>> +    '*server': 'bool' } }
>> +
>> +##
>> +# @NetdevDgramOptions:
>> +#
>> +# Configuration info for datagram socket netdev.
>> +#
>> +# @remote: remote address
>> +# @local: local address
> 
> Defaults?

We can't have a default because for multicast default is remoTe, and for unicast default 
is local.

> 
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'NetdevDgramOptions',
>> +  'data': {
>> +    '*local':  'SocketAddress',
>> +    '*remote': 'SocketAddress' } }
>> +
>>   ##
>>   # @NetClientDriver:
>>   #
>> @@ -462,8 +494,8 @@
>>   #        @vhost-vdpa since 5.1
>>   ##
>>   { 'enum': 'NetClientDriver',
>> -  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
>> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
>> +  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream', 'dgram',
>> +            'vde', 'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> 
> Long lines.

ok

>>   
>>   ##
>>   # @Netdev:
>> @@ -487,6 +519,8 @@
>>       'tap':      'NetdevTapOptions',
>>       'l2tpv3':   'NetdevL2TPv3Options',
>>       'socket':   'NetdevSocketOptions',
>> +    'stream':   'NetdevStreamOptions',
>> +    'dgram':    'NetdevDgramOptions',
>>       'vde':      'NetdevVdeOptions',
>>       'bridge':   'NetdevBridgeOptions',
>>       'hubport':  'NetdevHubPortOptions',
> 

Thanks,
Laurent


