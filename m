Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F655512E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 18:20:42 +0200 (CEST)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o435t-0003Xd-D8
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 12:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o434G-0002Kk-26
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o434D-0006uv-Iq
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655914736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z5k+RjlFjQ8c3YlWLRfgXpkKGp/PIDAnrk7qIb1iV0=;
 b=HOTXHKTc1vQkD7uErC/RbKciSWpH05nYqRgCXFwhPl1lTEmrNJK0pW5+fh7psqYKUbR7HN
 SiZcDd7yvW0xeUR1HhXn87+BMxjhTw4G73lD5lp77R1WiUpHgZTF1BNoZfMGAz5lKi0Ugg
 X9tp78fMRchlNLCN3qU0hczWLSl22+Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-7tCIwqwkMIuZmImZ8Oy7sg-1; Wed, 22 Jun 2022 12:18:55 -0400
X-MC-Unique: 7tCIwqwkMIuZmImZ8Oy7sg-1
Received: by mail-wr1-f69.google.com with SMTP id
 bv8-20020a0560001f0800b002183c5d5c26so4197326wrb.20
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 09:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Z5k+RjlFjQ8c3YlWLRfgXpkKGp/PIDAnrk7qIb1iV0=;
 b=sIO0RGBNaisRc1ZtErwFuYpxdpqK8PENzXsUHBsJdEjALBfTN1zjCKj8lZkR4OYuob
 TYaG1eyHmskhcCmYrC0Idq/5PvWOhP7dAcekWr1LWBJI/qyUrPjtHyoXZHqsIcdYPGQJ
 rRIY4TL6d+mqPYUphPAHDReFRJ1yzGl9DMMAxaxvGUmRttUe/TUXEhdKSBtzp8NZKGcK
 G95HIWScGiZ0iUbTW84j7oF5TEcK1EwZTbyICYsT8OLmjEZdd56awyjL5XikHFGKg6ln
 nWUYuM8AJZff0mgW1ntJKrhDzQt4aAtrJBaWUSFX5U0DBXhMrRsRbdznrurh2vGnBXI5
 a33w==
X-Gm-Message-State: AOAM5310BAONJy/tsTZ0F4tH/fIUDqM8PbXFLErHS7pIpUYT0sxqspeo
 qmqohtbb4paL7Lhmj0x6I+VdY7j6nFrAwlGZDu3OwOWxnmtUmtiuIx4ZyAnT2GqovS1HLCvmo3c
 MuPB/xUEUBiYlvpU=
X-Received: by 2002:a05:600c:1906:b0:39c:7f82:3090 with SMTP id
 j6-20020a05600c190600b0039c7f823090mr47041530wmq.152.1655914734002; 
 Wed, 22 Jun 2022 09:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4K1GY1KSDRWeuW0TqBomWO8qtkAKhQ0qm9YeHjga8vCc+lsEfVKp9aNwT6So3C4dgRGVYXA==
X-Received: by 2002:a05:600c:1906:b0:39c:7f82:3090 with SMTP id
 j6-20020a05600c190600b0039c7f823090mr47041489wmq.152.1655914733541; 
 Wed, 22 Jun 2022 09:18:53 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b0039c4ff5e0a7sm23263043wmq.38.2022.06.22.09.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 09:18:52 -0700 (PDT)
Message-ID: <21b7263e-a4d9-8cf8-575d-0c309c46876e@redhat.com>
Date: Wed, 22 Jun 2022 18:18:50 +0200
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
 <7eb9f5a3-5166-ee8d-86f8-1d05770331f6@redhat.com>
 <87tu8ev1ta.fsf@pond.sub.org>
 <efce9c42-77f4-a2c0-e379-fc8b71e8e191@redhat.com>
 <87fsjwncmd.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87fsjwncmd.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 22/06/2022 13:47, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 21/06/2022 10:49, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> On 20/06/2022 17:21, Markus Armbruster wrote:
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
>>>>>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>>>>>> ---
>>>
>>> [...]
>>>
>>>>>> diff --git a/net/net.c b/net/net.c
>>>>>> index c337d3d753fe..440957b272ee 100644
>>>>>> --- a/net/net.c
>>>>>> +++ b/net/net.c
>>>> ...
>>>>>> @@ -1612,7 +1617,19 @@ void net_init_clients(void)
>>>>>>      */
>>>>>>     static bool netdev_is_modern(const char *optarg)
>>>>>>     {
>>>>>> -    return false;
>>>>>> +    QDict *args;
>>>>>> +    const char *type;
>>>>>> +    bool is_modern;
>>>>>> +
>>>>>> +    args = keyval_parse(optarg, "type", NULL, NULL);
>>>>>> +    if (!args) {
>>>>>> +        return false;
>>>>>> +    }
>>>>>> +    type = qdict_get_try_str(args, "type");
>>>>>> +    is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>>>>>> +    qobject_unref(args);
>>>>>> +
>>>>>> +    return is_modern;
>>>>>>     }
>>>>>
>>>>> You could use g_autoptr here:
>>>>>
>>>>>           g_autoptr(QDict) args = NULL;
>>>>>           const char *type;
>>>>>           bool is_modern;
>>>>>
>>>>>           args = keyval_parse(optarg, "type", NULL, NULL);
>>>>>           if (!args) {
>>>>>               return false;
>>>>>           }
>>>>>           type = qdict_get_try_str(args, "type");
>>>>>           return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>>>>>
>>>>> Matter of taste; you decide.
>>>>
>>>> Looks good. We already had some series to convert existing code to g_autoptr(), so it
>>>> seems the way to do.
>>>>
>>>>>
>>>>> Now recall how this function is used: it decides whether to parse the
>>>>> modern way (with qobject_input_visitor_new_str()) or the traditional way
>>>>> (with qemu_opts_parse_noisily()).
>>>>>
>>>>> qemu_opts_parse_noisily() parses into a QemuOpts, for later use with the
>>>>> opts visitor.
>>>>>
>>>>> qobject_input_visitor_new_str() supports both dotted keys and JSON.  The
>>>>> former is parsed with keyval_parse(), the latter with
>>>>> qobject_from_json().  It returns the resulting parse tree wrapped in a
>>>>> suitable QAPI input visitor.
>>>>>
>>>>> Issue 1: since we get there only when keyval_parse() succeeds, JSON is
>>>>> unreachable.  Reproducer:
>>>>>
>>>>>        $ qemu-system-x86_64 -netdev '{"id":"foo"}'
>>>>>        upstream-qemu: -netdev {"id":"foo"}: Parameter 'id' is missing
>>>>>
>>>>> This is parsed with qemu_opts_parse_noisily(), resulting in a QemuOpts
>>>>> with a single option 'type' with value '{"id":"foo"}'.  The error
>>>>> message comes from the opts visitor.
>>>>>
>>>>> To fix this, make netdev_is_modern() return true when optarg[0] == '{'.
>>>>> This matches how qobject_input_visitor_new_str() recognizes JSON.
>>>>
>>>> OK
>>>>
>>>>>
>>>>> Issue 2: when keyval_parse() detects an error, we throw it away and fall
>>>>> back to QemuOpts.  This is commonly what we want.  But not always.  For
>>>>> instance:
>>>>>
>>>>>        $ qemu-system-x86_64 -netdev 'type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off'
>>>>>
>>>>> Note the typo "ipv4-off" instead of ipv4=off.  The error reporting is crap:
>>>>>
>>>>>        qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: warning: short-form boolean option 'addr.ipv4-off' deprecated
>>>>>        Please use addr.ipv4-off=on instead
>>>>>        qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: Parameter 'type' is missing
>>>>>
>>>>> We get this because netdev_is_modern() guesses wrongly: keyval_parse()
>>>>> fails with the perfectly reasonable error message "Expected '=' after
>>>>> parameter 'addr.ipv4-off'", but netdev_is_modern() ignores the error,
>>>>> and fails.  We fall back to QemuOpts, and confusion ensues.
>>>>>
>>>>> I'm not sure we can do much better with reasonable effort.  If we decide
>>>>> to accept this behavior, it should be documented at least in the source
>>>>> code.
>>>>
>>>> What about using modern syntax by default?
>>>>
>>>>        args = keyval_parse(optarg, "type", NULL, NULL);
>>>>        if (!args) {
>>>>            /* cannot detect the syntax, use new style syntax */
>>>>            return true;
>>>>        }
>>>
>>> As is, netdev_is_modern() has three cases:
>>>
>>> 1. keyval_parse() fails
>>>
>>> 2. keyval_parse() succeeds, but value of @type is not modern
>>>
>>> 3. keyval_parse() succeeds, and value of @type is modern
>>>
>>> In case 3. we're sure, because even if qemu_opts_parse_noisily() also
>>> succeeded, it would result in the same value of @type.
>>>
>>> In case 2, assuming traditional seems reasonable.  The assumption can be
>>> wrong when the user intends modern, but fat-fingers the type=T part.
>>>
>>> In case 1, we know nothing.
>>>
>>> Guessing modern is wrong when the user intends traditional.  This
>>> happens when a meant-to-be-traditional @optarg also parses as modern.
>>> Quite possible.
>>
>> I don't see why keyval_parse() fails in this case. Any example?
> 
> Brain cramp on my part, I'm afraid %-}  Let me start over.
> 
> Guessing modern is wrong when the user intends traditional.  Two
> sub-cases then:
> 
> * @optarg parses fine as traditional.  For instance,
> 
>      $ qemu-system-x86_64 -netdev type=user,id=foo,ipv4
> 
>    parses with a warning:
> 
>      option 'ipv4' deprecated
>      Please use ipv4=on instead
> 
>    This is how current master behaves.
> 
>    Guessing modern makes this fail instead:
> 
>      qemu-system-x86_64: -netdev type=user,id=foo,ipv4: Expected '=' after parameter 'ipv4'
> 
>    Regression.
> 
> * @optarg fails to parse traditional, too.  The error reporting is for
>    modern even though the user intends traditional.  Can be misleading.
>    Example:
> 
>      $ qemu-system-x86_64 -netdev type=user,id=_,ipv4
> 
>    Current master:
> 
>      qemu-system-x86_64: -netdev type=user,id=_,ipv4: Parameter 'id' expects an identifier
>      Identifiers consist of letters, digits, '-', '.', '_', starting with a letter.
> 
>    Guessing modern instead:
> 
>      qemu-system-x86_64: -netdev type=user,id=_,ipv4: Expected '=' after parameter 'ipv4'
> 
>    This should be rare in practice, as traditional parsing detects very
>    few errors.
> 
>>> Guessing traditional is wrong when the user intends modern.  This
>>> happens when a meant-to-be-modern @optarg fails to parse as modern,
>>> i.e. whenever the user screws up modern syntax.
>>
>> This one is the example you gave (ipv4-off)
> 
> Two sub-cases then:
> 
> * @optarg parses fine as traditional.  The parse result is unlikely to
>    make sense, though.  For instance,
> 
>      $ qemu-system-x86_64 -netdev type=stream,id=foo,server
> 
>    parses with a warning:
> 
>      qemu-system-x86_64: -netdev type=stream,id=foo,server: warning: short-form boolean option 'server' deprecated
>      Please use server=on instead
> 
>    But the result fails in the opts visitor:
> 
>      qemu-system-x86_64: -netdev type=stream,id=foo,server: Parameter 'type' is missing
> 
>    In this case, we're better off with guessing modern:
> 
>      qemu-system-x86_64: -netdev type=stream,id=foo,server: Expected '=' after parameter
> 
> * @optarg fails to parse traditional, too.  The error reporting is for
>    traditional even though the user intends modern.  Can be misleading.
> 
>    This is my ipv4-off example.
> 
> Can't win.  Parsers simply don't compose that way.
> 
>>> Which guess is less bad?  I'm not sure.  Thoughts?
>>
>> Perhaps we can simply fail if keyval_parse() fails?
>>
>> something like:
>>
>>       args = keyval_parse(optarg, "type", NULL, &error_fatal);
>>       type = qdict_get_try_str(args, "type");
>>       return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
> 
> This rejects working option arguments that don't also parse as modern,
> such as "-netdev type=user,id=foo,ipv4".
> 
> Guessing traditional seems to be the least bad solution so far.
> 
> Supporting both traditional and modern syntax in an option argument is a
> swamp.  Can we bypass it somehow?
> 
> -object uses traditional QemuOpts parsing for key=value,..., and modern
> parsing for JSON.  Sticking to traditional sidesteps compatibility
> issues.  But you have to use JSON for things traditional can't express.
> 
> Thoughts?
> 

I don't want to force user to switch to JSON to ease move from "-netdev socket" to 
"-netdev stream" and "-netdev dgram".
But I need to be able to parse SocketAddress to specify unix and inet socket address.

As we want to keep the same behavior on error cases (it's what I understand from your 
analysis), perhaps we can rely on traditional mechanism to detect the type: qemu_opts_parse()?

bool netdev_is_modern(const char *optarg)
{
     QemuOpts *opts;
     bool is_modern;
     const char *type;
     static QemuOptsList dummy_opts = {
         .name = "netdev",
         .implied_opt_name = "type",
         .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
         .desc = { { } },
     };

     if (optarg[0] == '{') {
         return true;
     }

     opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
     type = qemu_opt_get(opts, "type");
     is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");

     qemu_opts_reset(&dummy_opts);

     return is_modern;
}

The errors are directly reported by qemu_opts_parse(..., &error_fatal), and are the ones 
expected in the traditional case.

But the error reported for the modern case are not correct anymore.

I really don't think there is a good solution to our problem.

We must accept an incorrect error report in one of these cases.

To not break existing error report seems to be the way to go (qemu_opt_parse()).

Thanks,
Laurent


