Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76950551783
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:38:22 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FjZ-0000mu-Jn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3FU8-0008Pn-Tw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3FU3-0003uy-Rp
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655724138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUV7MN8FZ3qzi2Fn3CJgAc1Z9hCiaLrBau2et0zAgdM=;
 b=TZV7jNqeHXBeaZwWxythILGm+y6qjbWqkQHVE5VvGa7vHUpgBI74yOjtm046J7czSHwNV0
 XuY+EnO8482XVui59wDFRrVclHKCLLytmKtW2ZGkrW4YaJh8n0TYfBCD3pUr8cL0MovJPx
 0Yhij/b3TsWkNGjvdk8UnhFujmjuxV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-X-iQ72Z8PXeV23lQqDDO4w-1; Mon, 20 Jun 2022 07:22:17 -0400
X-MC-Unique: X-iQ72Z8PXeV23lQqDDO4w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A173811E84
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 11:22:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFF7492C3B;
 Mon, 20 Jun 2022 11:22:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8521D21E688E; Mon, 20 Jun 2022 13:22:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 3/8] qapi: net: add stream and dgram netdevs
References: <20220512080932.735962-1-lvivier@redhat.com>
 <20220512080932.735962-4-lvivier@redhat.com>
 <87fsld1wtw.fsf@pond.sub.org>
 <a2a0124d-5065-3c1e-9c84-8b6d92addfae@redhat.com>
 <87bkuugnet.fsf@pond.sub.org>
 <a31f2370-71dc-4623-9966-eeab52b2632d@redhat.com>
Date: Mon, 20 Jun 2022 13:22:15 +0200
In-Reply-To: <a31f2370-71dc-4623-9966-eeab52b2632d@redhat.com> (Laurent
 Vivier's message of "Mon, 20 Jun 2022 11:12:15 +0200")
Message-ID: <87tu8f1swo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

> On 15/06/2022 13:46, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> On 13/05/2022 13:44, Markus Armbruster wrote:
>>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>>
>>>>> Copied from socket netdev file and modified to use SocketAddress
>>>>> to be able to introduce new features like unix socket.
>>>>>
>>>>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>>>>> according to the IP address type.
>>>>> "listen" and "connect" modes are managed by stream netdev. An optional
>>>>> parameter "server" defines the mode (server by default)
>>>>>
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>> ---
>>>>>    hmp-commands.hx |   2 +-
>>>>>    net/clients.h   |   6 +
>>>>>    net/dgram.c     | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>    net/hub.c       |   2 +
>>>>>    net/meson.build |   2 +
>>>>>    net/net.c       |  24 +-
>>>>>    net/stream.c    | 425 ++++++++++++++++++++++++++++++++
>>>>>    qapi/net.json   |  38 ++-
>>>>>    8 files changed, 1125 insertions(+), 4 deletions(-)
>>>>>    create mode 100644 net/dgram.c
>>>>>    create mode 100644 net/stream.c
>>>>>
> ...
>>>>> diff --git a/net/net.c b/net/net.c
>>>>> index 2aab7167316c..fd6b30a10c57 100644
>>>>> --- a/net/net.c
>>>>> +++ b/net/net.c
>>>>> @@ -1015,6 +1015,8 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>>>>>    #endif
>>>>>            [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
>>>>>            [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
>>>>> +        [NET_CLIENT_DRIVER_STREAM]    = net_init_stream,
>>>>> +        [NET_CLIENT_DRIVER_DGRAM]     = net_init_dgram,
>>>>>    #ifdef CONFIG_VDE
>>>>>            [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
>>>>>    #endif
>>>>> @@ -1097,6 +1099,8 @@ void show_netdevs(void)
>>>>>        int idx;
>>>>>        const char *available_netdevs[] = {
>>>>>            "socket",
>>>>> +        "stream",
>>>>> +        "dgram",
>>>>>            "hubport",
>>>>>            "tap",
>>>>>    #ifdef CONFIG_SLIRP
>>>>> @@ -1606,7 +1610,25 @@ int net_init_clients(Error **errp)
>>>>>     */
>>>>>    static bool netdev_is_modern(const char *optarg)
>>>>>    {
>>>>> -    return false;
>>>>> +    static QemuOptsList dummy_opts = {
>>>>> +        .name = "netdev",
>>>>> +        .implied_opt_name = "type",
>>>>> +        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
>>>>> +        .desc = { { } },
>>>>> +    };
>>>>> +    const char *netdev;
>>>>> +    QemuOpts *opts;
>>>>> +    bool is_modern;
>>>>> +
>>>>> +    opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
>>>>> +    netdev = qemu_opt_get(opts, "type");
>>>>> +
>>>>> +    is_modern = strcmp(netdev, "stream") == 0 ||
>>>>> +                strcmp(netdev, "dgram") == 0;
>>>>
>>>> Crashes when user neglects to pass "type".
>>>
>>> I think "type" is always passed because of the '.implied_opt_name = "type"'. Am I wrong?
>> 
>> .implied_opt_name = "type" lets you shorten "type=T,..." to "T,...".  It
>> doesn't make key "type" mandatory.  "-netdev id=foo" is still permitted.
>> Even "-netdev ''" is.
>
>
> In fact type is checked before by QAPI definition:
>
> { 'union': 'Netdev',
>    'base': { 'id': 'str', 'type': 'NetClientDriver' },
>    'discriminator': 'type',
> ...
>
> As it's the discriminator it must be there.
>
>    $ qemu-system-x86_64 -netdev id=foo
>    qemu-system-x86_64: -netdev id=foo: Parameter 'type' is missing

It does crash for me:

    (gdb) bt
    #0  0x00007ffff4d25dcb in __strcmp_avx2 () at /lib64/libc.so.6
    #1  0x0000555555b4574b in netdev_is_modern (optarg=0x7fffffffe2ae "id=foo")
        at ../net/net.c:1626
    #2  0x0000555555b457ad in net_client_parse
        (opts_list=0x555556563780 <qemu_netdev_opts>, optarg=0x7fffffffe2ae "id=foo") at ../net/net.c:1636
    #3  0x0000555555ad98de in qemu_init (argc=3, argv=0x7fffffffdf08, envp=0x0)
        at ../softmmu/vl.c:2901
    #4  0x0000555555842c01 in qemu_main (argc=3, argv=0x7fffffffdf08, envp=0x0)
        at ../softmmu/main.c:35
    #5  0x0000555555842c37 in main (argc=3, argv=0x7fffffffdf08)
        at ../softmmu/main.c:45
    (gdb) up
    #1  0x0000555555b4574b in netdev_is_modern (optarg=0x7fffffffe2ae "id=foo")
        at ../net/net.c:1626
    1626	    is_modern = strcmp(netdev, "stream") == 0 ||
    (gdb) p netdev
    $1 = 0x0

This is

     https://github.com/patchew-project/qemu tags/patchew/20220512080932.735962-1-lvivier@redhat.com 

I suspect you tested with your v3, which doesn't crash for me, either.

[...]


