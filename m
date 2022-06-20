Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29145518A3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:18:56 +0200 (CEST)
Received: from localhost ([::1]:40216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GMp-0006kV-9t
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3GE0-00055b-Te
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3GDy-0005Hc-9F
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655726985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HeMhmdKsQDLyZntP2vHqr78q6h5gHWjeaiCs6lU8N8=;
 b=ggAIb6Mt5Jz024w00jcbEEMvkd/HLBvGCqAAMpb3c92xzhAYa76j6NXkgzadU0uJfnozmh
 N5JooVoHqBaOq2TuJGq5DJxYhlxt3S73Z5CjBB9aOMV/T7GgYMnPSPcUOEB1qDBvX5zPaJ
 YHXvs09NNt3XZcVZUkG4rYQe4eNE4dk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-KUFrdnMMMN66Sks4L6ax0g-1; Mon, 20 Jun 2022 08:09:44 -0400
X-MC-Unique: KUFrdnMMMN66Sks4L6ax0g-1
Received: by mail-qk1-f197.google.com with SMTP id
 r6-20020a05620a298600b006a98e988ba4so12863314qkp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 05:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7HeMhmdKsQDLyZntP2vHqr78q6h5gHWjeaiCs6lU8N8=;
 b=6fKUMkvx0PH6/Da9SAZvX8fvZa3T1QF3RQhJoquQIC3Dwn4f5obRaNI54sPXaf1n14
 b175i0zi0bRd8huuNuwautUK2Fbj3ws1l0BFGLeTBt+/6OaDK0MXdCkeiPdO4yYIBoCq
 1IHV8PTNA7jD9ZT3cA5TI4PmZvJeHt69ejixF6iKayVlForHb2UQZmNjD/CRrgLPi+pI
 addZPbXn1dwJHQQeTr6jV+jf1tBZDuroS6OLHO3uAJMjBfuj2dQJEVlaad7v1q0iFhp7
 ikFF1cV+5grXS/UHJWd6NUG26sSQda3YQUIZuU2uS+Qd5eO+6q+AEVyLmXBq1nBqFUPh
 CHjQ==
X-Gm-Message-State: AJIora/wowfAbF7jcfsHg6uh1OvWfuTaLEZGzCceIvEiDp8Pi16k/I46
 X/bqIVfSyLqbSzOB6qXVVZR632nOpc2+mkmiwbYc1loTs4RSALjtqFge2JqDhzJlyGzxYiOH7Fy
 J4SPEhdPX3wnG5oI=
X-Received: by 2002:a37:66d6:0:b0:6a6:bdb9:cfba with SMTP id
 a205-20020a3766d6000000b006a6bdb9cfbamr16050546qkc.566.1655726983385; 
 Mon, 20 Jun 2022 05:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaS9RXxDxEopvKI01YmWJJgswn94YF/niB0BhaqfLfzYEkusmHFgVJpcGekHMcl/DHxs9Vgw==
X-Received: by 2002:a37:66d6:0:b0:6a6:bdb9:cfba with SMTP id
 a205-20020a3766d6000000b006a6bdb9cfbamr16050522qkc.566.1655726983086; 
 Mon, 20 Jun 2022 05:09:43 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a0c4c00b006a760640118sm11692549qki.27.2022.06.20.05.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 05:09:42 -0700 (PDT)
Message-ID: <cdf2736f-5e10-91a0-13aa-92d3e4838bae@redhat.com>
Date: Mon, 20 Jun 2022 14:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v2 3/8] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220512080932.735962-1-lvivier@redhat.com>
 <20220512080932.735962-4-lvivier@redhat.com> <87fsld1wtw.fsf@pond.sub.org>
 <a2a0124d-5065-3c1e-9c84-8b6d92addfae@redhat.com>
 <87bkuugnet.fsf@pond.sub.org>
 <a31f2370-71dc-4623-9966-eeab52b2632d@redhat.com>
 <87tu8f1swo.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87tu8f1swo.fsf@pond.sub.org>
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

On 20/06/2022 13:22, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 15/06/2022 13:46, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> On 13/05/2022 13:44, Markus Armbruster wrote:
>>>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>>>
>>>>>> Copied from socket netdev file and modified to use SocketAddress
>>>>>> to be able to introduce new features like unix socket.
>>>>>>
>>>>>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>>>>>> according to the IP address type.
>>>>>> "listen" and "connect" modes are managed by stream netdev. An optional
>>>>>> parameter "server" defines the mode (server by default)
>>>>>>
>>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>>> ---
>>>>>>     hmp-commands.hx |   2 +-
>>>>>>     net/clients.h   |   6 +
>>>>>>     net/dgram.c     | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>     net/hub.c       |   2 +
>>>>>>     net/meson.build |   2 +
>>>>>>     net/net.c       |  24 +-
>>>>>>     net/stream.c    | 425 ++++++++++++++++++++++++++++++++
>>>>>>     qapi/net.json   |  38 ++-
>>>>>>     8 files changed, 1125 insertions(+), 4 deletions(-)
>>>>>>     create mode 100644 net/dgram.c
>>>>>>     create mode 100644 net/stream.c
>>>>>>
>> ...
>>>>>> diff --git a/net/net.c b/net/net.c
>>>>>> index 2aab7167316c..fd6b30a10c57 100644
>>>>>> --- a/net/net.c
>>>>>> +++ b/net/net.c
>>>>>> @@ -1015,6 +1015,8 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>>>>>>     #endif
>>>>>>             [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
>>>>>>             [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
>>>>>> +        [NET_CLIENT_DRIVER_STREAM]    = net_init_stream,
>>>>>> +        [NET_CLIENT_DRIVER_DGRAM]     = net_init_dgram,
>>>>>>     #ifdef CONFIG_VDE
>>>>>>             [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
>>>>>>     #endif
>>>>>> @@ -1097,6 +1099,8 @@ void show_netdevs(void)
>>>>>>         int idx;
>>>>>>         const char *available_netdevs[] = {
>>>>>>             "socket",
>>>>>> +        "stream",
>>>>>> +        "dgram",
>>>>>>             "hubport",
>>>>>>             "tap",
>>>>>>     #ifdef CONFIG_SLIRP
>>>>>> @@ -1606,7 +1610,25 @@ int net_init_clients(Error **errp)
>>>>>>      */
>>>>>>     static bool netdev_is_modern(const char *optarg)
>>>>>>     {
>>>>>> -    return false;
>>>>>> +    static QemuOptsList dummy_opts = {
>>>>>> +        .name = "netdev",
>>>>>> +        .implied_opt_name = "type",
>>>>>> +        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
>>>>>> +        .desc = { { } },
>>>>>> +    };
>>>>>> +    const char *netdev;
>>>>>> +    QemuOpts *opts;
>>>>>> +    bool is_modern;
>>>>>> +
>>>>>> +    opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
>>>>>> +    netdev = qemu_opt_get(opts, "type");
>>>>>> +
>>>>>> +    is_modern = strcmp(netdev, "stream") == 0 ||
>>>>>> +                strcmp(netdev, "dgram") == 0;
>>>>>
>>>>> Crashes when user neglects to pass "type".
>>>>
>>>> I think "type" is always passed because of the '.implied_opt_name = "type"'. Am I wrong?
>>>
>>> .implied_opt_name = "type" lets you shorten "type=T,..." to "T,...".  It
>>> doesn't make key "type" mandatory.  "-netdev id=foo" is still permitted.
>>> Even "-netdev ''" is.
>>
>>
>> In fact type is checked before by QAPI definition:
>>
>> { 'union': 'Netdev',
>>     'base': { 'id': 'str', 'type': 'NetClientDriver' },
>>     'discriminator': 'type',
>> ...
>>
>> As it's the discriminator it must be there.
>>
>>     $ qemu-system-x86_64 -netdev id=foo
>>     qemu-system-x86_64: -netdev id=foo: Parameter 'type' is missing
> 
> It does crash for me:
> 
>      (gdb) bt
>      #0  0x00007ffff4d25dcb in __strcmp_avx2 () at /lib64/libc.so.6
>      #1  0x0000555555b4574b in netdev_is_modern (optarg=0x7fffffffe2ae "id=foo")
>          at ../net/net.c:1626
>      #2  0x0000555555b457ad in net_client_parse
>          (opts_list=0x555556563780 <qemu_netdev_opts>, optarg=0x7fffffffe2ae "id=foo") at ../net/net.c:1636
>      #3  0x0000555555ad98de in qemu_init (argc=3, argv=0x7fffffffdf08, envp=0x0)
>          at ../softmmu/vl.c:2901
>      #4  0x0000555555842c01 in qemu_main (argc=3, argv=0x7fffffffdf08, envp=0x0)
>          at ../softmmu/main.c:35
>      #5  0x0000555555842c37 in main (argc=3, argv=0x7fffffffdf08)
>          at ../softmmu/main.c:45
>      (gdb) up
>      #1  0x0000555555b4574b in netdev_is_modern (optarg=0x7fffffffe2ae "id=foo")
>          at ../net/net.c:1626
>      1626	    is_modern = strcmp(netdev, "stream") == 0 ||
>      (gdb) p netdev
>      $1 = 0x0
> 
> This is
> 
>       https://github.com/patchew-project/qemu tags/patchew/20220512080932.735962-1-lvivier@redhat.com
> 
> I suspect you tested with your v3, which doesn't crash for me, either.
> 

Yes, thank you. So this is fixed now :)

Laurent


