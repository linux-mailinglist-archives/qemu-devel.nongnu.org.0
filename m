Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBEC552332
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:55:57 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lcy-00008y-BI
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3LZS-0004fd-39
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3LZN-0001E0-B9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655747532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J50kgS/p8+aQDLvC9/SALRfBgSuVco2jQmallf7JF0A=;
 b=HATAawmXVjVhC3HZ2VORf1xfZvPXfIfcyQ9cl0CbhCMMBPRuBwlm3IUZSgAxw8bgyeZyAQ
 PWqLeKv8nLL9v8Z4lwfhUZUZ6H2KUoV11hJC4p619Fa6Rw4xVdwWhX4Om3XrnTAIjgp553
 hn3vgt5C2A0nK290oDpxcfDy+uoN9jQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-vOgig0B2Mhe_B9bgKdcXGw-1; Mon, 20 Jun 2022 13:52:08 -0400
X-MC-Unique: vOgig0B2Mhe_B9bgKdcXGw-1
Received: by mail-qv1-f69.google.com with SMTP id
 e10-20020a0ce3ca000000b004702b8819beso8240642qvl.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J50kgS/p8+aQDLvC9/SALRfBgSuVco2jQmallf7JF0A=;
 b=VAKG7VSzSAF76kiJOht1U6bz/stDkDhnq9PJnkDghTiMWv4Fh0qsUcpXrUSqg6k7Cy
 vvOePqjJFsO0aJNtC8GvI0qNpARqXe/sQ7LJJ4WXdXNrjtop69g0jvlMiVxhLdsuvz0e
 I0F6cb88l5NvWIAOagn3jq5cqavLdAKRApuxySrn1jVAlpFG+xM2GY/chime8fdcPf8J
 R6H1xIJ7orDG8NP0qmFSL+WGR2xqwY0SjcVaj0bgprmoEEBcJGYvB9z/3AdFGaNWEM9l
 p8q0fGXHjH7AJVuIQeT4FrEebWucmBbp1HpOm1Cy2wyliu6t7pwhdEin+3jBQAdksbpz
 Hq2Q==
X-Gm-Message-State: AJIora/HY2LEUZBXIpxSD5Iv9HX/iT18nrNIyqdw77Jp0GzedioNxhwJ
 pAGSVn/MBYBa65DHG3QZVlFQxeAa7Ga90PSTlW9k62NPPGtuSoXCxJjr+eTWdakoSiCeiqQpi7a
 S12mBmWTSSb/iqy8=
X-Received: by 2002:a05:620a:4310:b0:6ac:f9df:178d with SMTP id
 u16-20020a05620a431000b006acf9df178dmr5037838qko.773.1655747527673; 
 Mon, 20 Jun 2022 10:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u77YicGqRSdi9flx2n8AsKwbLLVZdRhRfhZCVwEqWln0wYyH2nTJMeS/qeJoHE28mOAe7ZeA==
X-Received: by 2002:a05:620a:4310:b0:6ac:f9df:178d with SMTP id
 u16-20020a05620a431000b006acf9df178dmr5037823qko.773.1655747527309; 
 Mon, 20 Jun 2022 10:52:07 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 c135-20020a379a8d000000b006a6c552736asm12704429qke.119.2022.06.20.10.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 10:52:06 -0700 (PDT)
Message-ID: <7eb9f5a3-5166-ee8d-86f8-1d05770331f6@redhat.com>
Date: Mon, 20 Jun 2022 19:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v3 04/11] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20220620101828.518865-1-lvivier@redhat.com>
 <20220620101828.518865-5-lvivier@redhat.com> <874k0fz7gg.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <874k0fz7gg.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
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

On 20/06/2022 17:21, Markus Armbruster wrote:
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
>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>> ---
>>   hmp-commands.hx |   2 +-
>>   net/clients.h   |   6 +
>>   net/dgram.c     | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   net/hub.c       |   2 +
>>   net/meson.build |   2 +
>>   net/net.c       |  19 +-
>>   net/stream.c    | 425 ++++++++++++++++++++++++++++++++
>>   qapi/net.json   |  40 ++-
>>   qemu-options.hx |  12 +
>>   9 files changed, 1133 insertions(+), 5 deletions(-)
>>   create mode 100644 net/dgram.c
>>   create mode 100644 net/stream.c
>>
...
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

Done

...

>> diff --git a/net/net.c b/net/net.c
>> index c337d3d753fe..440957b272ee 100644
>> --- a/net/net.c
>> +++ b/net/net.c
...
>> @@ -1612,7 +1617,19 @@ void net_init_clients(void)
>>    */
>>   static bool netdev_is_modern(const char *optarg)
>>   {
>> -    return false;
>> +    QDict *args;
>> +    const char *type;
>> +    bool is_modern;
>> +
>> +    args = keyval_parse(optarg, "type", NULL, NULL);
>> +    if (!args) {
>> +        return false;
>> +    }
>> +    type = qdict_get_try_str(args, "type");
>> +    is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>> +    qobject_unref(args);
>> +
>> +    return is_modern;
>>   }
> 
> You could use g_autoptr here:
> 
>         g_autoptr(QDict) args = NULL;
>         const char *type;
>         bool is_modern;
> 
>         args = keyval_parse(optarg, "type", NULL, NULL);
>         if (!args) {
>             return false;
>         }
>         type = qdict_get_try_str(args, "type");
>         return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
> 
> Matter of taste; you decide.

Looks good. We already had some series to convert existing code to g_autoptr(), so it 
seems the way to do.

> 
> Now recall how this function is used: it decides whether to parse the
> modern way (with qobject_input_visitor_new_str()) or the traditional way
> (with qemu_opts_parse_noisily()).
> 
> qemu_opts_parse_noisily() parses into a QemuOpts, for later use with the
> opts visitor.
> 
> qobject_input_visitor_new_str() supports both dotted keys and JSON.  The
> former is parsed with keyval_parse(), the latter with
> qobject_from_json().  It returns the resulting parse tree wrapped in a
> suitable QAPI input visitor.
> 
> Issue 1: since we get there only when keyval_parse() succeeds, JSON is
> unreachable.  Reproducer:
> 
>      $ qemu-system-x86_64 -netdev '{"id":"foo"}'
>      upstream-qemu: -netdev {"id":"foo"}: Parameter 'id' is missing
> 
> This is parsed with qemu_opts_parse_noisily(), resulting in a QemuOpts
> with a single option 'type' with value '{"id":"foo"}'.  The error
> message comes from the opts visitor.
> 
> To fix this, make netdev_is_modern() return true when optarg[0] == '{'.
> This matches how qobject_input_visitor_new_str() recognizes JSON.

OK

> 
> Issue 2: when keyval_parse() detects an error, we throw it away and fall
> back to QemuOpts.  This is commonly what we want.  But not always.  For
> instance:
> 
>      $ qemu-system-x86_64 -netdev 'type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off'
> 
> Note the typo "ipv4-off" instead of ipv4=off.  The error reporting is crap:
> 
>      qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: warning: short-form boolean option 'addr.ipv4-off' deprecated
>      Please use addr.ipv4-off=on instead
>      qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: Parameter 'type' is missing
> 
> We get this because netdev_is_modern() guesses wrongly: keyval_parse()
> fails with the perfectly reasonable error message "Expected '=' after
> parameter 'addr.ipv4-off'", but netdev_is_modern() ignores the error,
> and fails.  We fall back to QemuOpts, and confusion ensues.
> 
> I'm not sure we can do much better with reasonable effort.  If we decide
> to accept this behavior, it should be documented at least in the source
> code.

What about using modern syntax by default?

     args = keyval_parse(optarg, "type", NULL, NULL);
     if (!args) {
         /* cannot detect the syntax, use new style syntax */
         return true;
     }

>>   
>>   /*
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

Done

...
>> diff --git a/qapi/net.json b/qapi/net.json
>> index d6f7cfd4d656..5f72995b1d24 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
...
>> @@ -566,6 +567,37 @@
>>       '*isolated':  'bool' },
>>     'if': 'CONFIG_VMNET' }
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
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'NetdevDgramOptions',
>> +  'data': {
>> +    '*local':  'SocketAddress',
>> +    '*remote': 'SocketAddress' } }
> 
> In review of v2, I inquired about behavior when members are absent.
> You wrote:
> 
>      The code checks there is at least one of these options and reports an error if not.
> 
>      if remote address is present and it's a multicast address, local address is optional.
> 
>      otherwise local address is required and remote address is optional.
> 
> Please work that into the doc comment.

OK

> 
>> +
>>   ##
>>   # @NetClientDriver:
>>   #
>> @@ -579,9 +611,9 @@
>>   #        @vmnet-bridged since 7.1
>>   ##
>>   { 'enum': 'NetClientDriver',
>> -  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
>> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
>> -            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>> +  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream',
>> +            'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user',
>> +            'vhost-vdpa', { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>>               { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
>>               { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
> 
> Opportunity to put vmnet-host on its own line for readability.
> 

OK

Thanks,
Laurent


