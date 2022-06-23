Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8AB557AB5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:52:23 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4MJq-0006tF-Cw
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4MH2-000567-7l
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4MGy-0006Rq-Ey
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655988561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/94EaCp009IMm2MuHP6zArzDI/YYTGO1fxkewibM1lA=;
 b=JS65w+rraN4OE/Z32Plpt7gZHssqIUldfGW6YNpeSZV5JQAsFr5AcfdAQBNt58cIxqjjXr
 NCScRTMO7/hR61X1R5jfjX9B0p1cHJXsiWQkAwZCgFASu/2zz35LXODYxk0PP6aaSnsd7p
 Yq+7Pu+EugVP+Zp9KFn76WzsCKkQ+U8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-9vtXs7GAOfu2GfR0Ly9C5w-1; Thu, 23 Jun 2022 08:49:20 -0400
X-MC-Unique: 9vtXs7GAOfu2GfR0Ly9C5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 240C780D3C0
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 12:49:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D73CC2166B26;
 Thu, 23 Jun 2022 12:49:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A347E21E690D; Thu, 23 Jun 2022 14:49:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v3 04/11] qapi: net: add stream and dgram netdevs
References: <20220620101828.518865-1-lvivier@redhat.com>
 <20220620101828.518865-5-lvivier@redhat.com>
 <874k0fz7gg.fsf@pond.sub.org>
 <7eb9f5a3-5166-ee8d-86f8-1d05770331f6@redhat.com>
 <87tu8ev1ta.fsf@pond.sub.org>
 <efce9c42-77f4-a2c0-e379-fc8b71e8e191@redhat.com>
 <87fsjwncmd.fsf@pond.sub.org>
 <21b7263e-a4d9-8cf8-575d-0c309c46876e@redhat.com>
Date: Thu, 23 Jun 2022 14:49:09 +0200
In-Reply-To: <21b7263e-a4d9-8cf8-575d-0c309c46876e@redhat.com> (Laurent
 Vivier's message of "Wed, 22 Jun 2022 18:18:50 +0200")
Message-ID: <87bkujh7ei.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

> On 22/06/2022 13:47, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> On 21/06/2022 10:49, Markus Armbruster wrote:
>>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>>
>>>>> On 20/06/2022 17:21, Markus Armbruster wrote:
>>>>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>>>>
>>>>>>> Copied from socket netdev file and modified to use SocketAddress
>>>>>>> to be able to introduce new features like unix socket.
>>>>>>>
>>>>>>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>>>>>>> according to the IP address type.
>>>>>>> "listen" and "connect" modes are managed by stream netdev. An optional
>>>>>>> parameter "server" defines the mode (server by default)
>>>>>>>
>>>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>>>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> diff --git a/net/net.c b/net/net.c
>>>>>>> index c337d3d753fe..440957b272ee 100644
>>>>>>> --- a/net/net.c
>>>>>>> +++ b/net/net.c
>>>>> ...
>>>>>>> @@ -1612,7 +1617,19 @@ void net_init_clients(void)
>>>>>>>      */
>>>>>>>     static bool netdev_is_modern(const char *optarg)
>>>>>>>     {
>>>>>>> -    return false;
>>>>>>> +    QDict *args;
>>>>>>> +    const char *type;
>>>>>>> +    bool is_modern;
>>>>>>> +
>>>>>>> +    args = keyval_parse(optarg, "type", NULL, NULL);
>>>>>>> +    if (!args) {
>>>>>>> +        return false;
>>>>>>> +    }
>>>>>>> +    type = qdict_get_try_str(args, "type");
>>>>>>> +    is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>>>>>>> +    qobject_unref(args);
>>>>>>> +
>>>>>>> +    return is_modern;
>>>>>>>     }
>>>>>>
>>>>>> You could use g_autoptr here:
>>>>>>
>>>>>>           g_autoptr(QDict) args = NULL;
>>>>>>           const char *type;
>>>>>>           bool is_modern;
>>>>>>
>>>>>>           args = keyval_parse(optarg, "type", NULL, NULL);
>>>>>>           if (!args) {
>>>>>>               return false;
>>>>>>           }
>>>>>>           type = qdict_get_try_str(args, "type");
>>>>>>           return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>>>>>>
>>>>>> Matter of taste; you decide.
>>>>>
>>>>> Looks good. We already had some series to convert existing code to g_autoptr(), so it
>>>>> seems the way to do.
>>>>>
>>>>>>
>>>>>> Now recall how this function is used: it decides whether to parse the
>>>>>> modern way (with qobject_input_visitor_new_str()) or the traditional way
>>>>>> (with qemu_opts_parse_noisily()).
>>>>>>
>>>>>> qemu_opts_parse_noisily() parses into a QemuOpts, for later use with the
>>>>>> opts visitor.
>>>>>>
>>>>>> qobject_input_visitor_new_str() supports both dotted keys and JSON.  The
>>>>>> former is parsed with keyval_parse(), the latter with
>>>>>> qobject_from_json().  It returns the resulting parse tree wrapped in a
>>>>>> suitable QAPI input visitor.
>>>>>>
>>>>>> Issue 1: since we get there only when keyval_parse() succeeds, JSON is
>>>>>> unreachable.  Reproducer:
>>>>>>
>>>>>>        $ qemu-system-x86_64 -netdev '{"id":"foo"}'
>>>>>>        upstream-qemu: -netdev {"id":"foo"}: Parameter 'id' is missing
>>>>>>
>>>>>> This is parsed with qemu_opts_parse_noisily(), resulting in a QemuOpts
>>>>>> with a single option 'type' with value '{"id":"foo"}'.  The error
>>>>>> message comes from the opts visitor.
>>>>>>
>>>>>> To fix this, make netdev_is_modern() return true when optarg[0] == '{'.
>>>>>> This matches how qobject_input_visitor_new_str() recognizes JSON.
>>>>>
>>>>> OK
>>>>>
>>>>>>
>>>>>> Issue 2: when keyval_parse() detects an error, we throw it away and fall
>>>>>> back to QemuOpts.  This is commonly what we want.  But not always.  For
>>>>>> instance:
>>>>>>
>>>>>>        $ qemu-system-x86_64 -netdev 'type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off'
>>>>>>
>>>>>> Note the typo "ipv4-off" instead of ipv4=off.  The error reporting is crap:
>>>>>>
>>>>>>        qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: warning: short-form boolean option 'addr.ipv4-off' deprecated
>>>>>>        Please use addr.ipv4-off=on instead
>>>>>>        qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: Parameter 'type' is missing
>>>>>>
>>>>>> We get this because netdev_is_modern() guesses wrongly: keyval_parse()
>>>>>> fails with the perfectly reasonable error message "Expected '=' after
>>>>>> parameter 'addr.ipv4-off'", but netdev_is_modern() ignores the error,
>>>>>> and fails.  We fall back to QemuOpts, and confusion ensues.
>>>>>>
>>>>>> I'm not sure we can do much better with reasonable effort.  If we decide
>>>>>> to accept this behavior, it should be documented at least in the source
>>>>>> code.
>>>>>
>>>>> What about using modern syntax by default?
>>>>>
>>>>>        args = keyval_parse(optarg, "type", NULL, NULL);
>>>>>        if (!args) {
>>>>>            /* cannot detect the syntax, use new style syntax */
>>>>>            return true;
>>>>>        }
>>>>
>>>> As is, netdev_is_modern() has three cases:
>>>>
>>>> 1. keyval_parse() fails
>>>>
>>>> 2. keyval_parse() succeeds, but value of @type is not modern
>>>>
>>>> 3. keyval_parse() succeeds, and value of @type is modern
>>>>
>>>> In case 3. we're sure, because even if qemu_opts_parse_noisily() also
>>>> succeeded, it would result in the same value of @type.
>>>>
>>>> In case 2, assuming traditional seems reasonable.  The assumption can be
>>>> wrong when the user intends modern, but fat-fingers the type=T part.
>>>>
>>>> In case 1, we know nothing.
>>>>
>>>> Guessing modern is wrong when the user intends traditional.  This
>>>> happens when a meant-to-be-traditional @optarg also parses as modern.
>>>> Quite possible.
>>>
>>> I don't see why keyval_parse() fails in this case. Any example?
>> 
>> Brain cramp on my part, I'm afraid %-}  Let me start over.
>> 
>> Guessing modern is wrong when the user intends traditional.  Two
>> sub-cases then:
>> 
>> * @optarg parses fine as traditional.  For instance,
>> 
>>      $ qemu-system-x86_64 -netdev type=user,id=foo,ipv4
>> 
>>    parses with a warning:
>> 
>>      option 'ipv4' deprecated
>>      Please use ipv4=on instead
>> 
>>    This is how current master behaves.
>> 
>>    Guessing modern makes this fail instead:
>> 
>>      qemu-system-x86_64: -netdev type=user,id=foo,ipv4: Expected '=' after parameter 'ipv4'
>> 
>>    Regression.
>> 
>> * @optarg fails to parse traditional, too.  The error reporting is for
>>    modern even though the user intends traditional.  Can be misleading.
>>    Example:
>> 
>>      $ qemu-system-x86_64 -netdev type=user,id=_,ipv4
>> 
>>    Current master:
>> 
>>      qemu-system-x86_64: -netdev type=user,id=_,ipv4: Parameter 'id' expects an identifier
>>      Identifiers consist of letters, digits, '-', '.', '_', starting with a letter.
>> 
>>    Guessing modern instead:
>> 
>>      qemu-system-x86_64: -netdev type=user,id=_,ipv4: Expected '=' after parameter 'ipv4'
>> 
>>    This should be rare in practice, as traditional parsing detects very
>>    few errors.
>> 
>>>> Guessing traditional is wrong when the user intends modern.  This
>>>> happens when a meant-to-be-modern @optarg fails to parse as modern,
>>>> i.e. whenever the user screws up modern syntax.
>>>
>>> This one is the example you gave (ipv4-off)
>> 
>> Two sub-cases then:
>> 
>> * @optarg parses fine as traditional.  The parse result is unlikely to
>>    make sense, though.  For instance,
>> 
>>      $ qemu-system-x86_64 -netdev type=stream,id=foo,server
>> 
>>    parses with a warning:
>> 
>>      qemu-system-x86_64: -netdev type=stream,id=foo,server: warning: short-form boolean option 'server' deprecated
>>      Please use server=on instead
>> 
>>    But the result fails in the opts visitor:
>> 
>>      qemu-system-x86_64: -netdev type=stream,id=foo,server: Parameter 'type' is missing
>> 
>>    In this case, we're better off with guessing modern:
>> 
>>      qemu-system-x86_64: -netdev type=stream,id=foo,server: Expected '=' after parameter
>> 
>> * @optarg fails to parse traditional, too.  The error reporting is for
>>    traditional even though the user intends modern.  Can be misleading.
>> 
>>    This is my ipv4-off example.
>> 
>> Can't win.  Parsers simply don't compose that way.
>> 
>>>> Which guess is less bad?  I'm not sure.  Thoughts?
>>>
>>> Perhaps we can simply fail if keyval_parse() fails?
>>>
>>> something like:
>>>
>>>       args = keyval_parse(optarg, "type", NULL, &error_fatal);
>>>       type = qdict_get_try_str(args, "type");
>>>       return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>> 
>> This rejects working option arguments that don't also parse as modern,
>> such as "-netdev type=user,id=foo,ipv4".
>> 
>> Guessing traditional seems to be the least bad solution so far.
>> 
>> Supporting both traditional and modern syntax in an option argument is a
>> swamp.  Can we bypass it somehow?
>> 
>> -object uses traditional QemuOpts parsing for key=value,..., and modern
>> parsing for JSON.  Sticking to traditional sidesteps compatibility
>> issues.  But you have to use JSON for things traditional can't express.
>> 
>> Thoughts?
>> 
>
> I don't want to force user to switch to JSON to ease move from "-netdev socket" to 
> "-netdev stream" and "-netdev dgram".
> But I need to be able to parse SocketAddress to specify unix and inet socket address.

That's fair.

> As we want to keep the same behavior on error cases (it's what I understand from your 
> analysis),

We must not break working usage.

We may change how erroneous usage fails, but we should try to avoid bad
error reporting.  Common errors are more important here.  Whether they
are in existing or in new options doesn't matter.

>            perhaps we can rely on traditional mechanism to detect the type: qemu_opts_parse()?
>
> bool netdev_is_modern(const char *optarg)
> {
>      QemuOpts *opts;
>      bool is_modern;
>      const char *type;
>      static QemuOptsList dummy_opts = {
>          .name = "netdev",
>          .implied_opt_name = "type",
>          .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
>          .desc = { { } },
>      };
>
>      if (optarg[0] == '{') {
>          return true;
>      }
>
>      opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
>      type = qemu_opt_get(opts, "type");
>      is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>
>      qemu_opts_reset(&dummy_opts);
>
>      return is_modern;
> }
>
> The errors are directly reported by qemu_opts_parse(..., &error_fatal), and are the ones 
> expected in the traditional case.
>
> But the error reported for the modern case are not correct anymore.
>
> I really don't think there is a good solution to our problem.
>
> We must accept an incorrect error report in one of these cases.
>
> To not break existing error report seems to be the way to go (qemu_opt_parse()).

I'm not sure about passing &error_fatal to qemu_opts_parse().  Let's
examine the possible errors.

qemu_opts_parse() calls opts_parse().

opts_parse() extracts the value of parameter "id" with opts_parse_id().

It then creates a QemuOpts with qemu_opts_create().  Errors:

* "Invalid parameter 'id'" is impossible since !dummy_opts.merge_lists.

* "Parameter "id" expects an identifier" when value of "id" is not
  wellformed.

* "Duplicate ID 'FOO' for netdev" is impossible since @dummy_opts is
  always empty.

It then parses for real with opts_do_parse().  Errors can only come from
opt_validate():

* "Invalid parameter 'FOO'" is impossible since
  opts_accepts_any(&dummy_opts)

* a bunch from qemu_opt_parse(), all impossible since !dummy_opt.desc.

Conclusion: can only error out when value of "id" is not wellformed.

Detecting this error is counter-productive here, because it masks the
value of "type", which is what we're after.

Better, I think: use opts_do_parse() directly.  Something like

    opts = qemu_opts_create(&dummy_opts, NULL, false, &error_abort);
    qemu_opts_do_parse(opts, optarg, dummy_opts.implied_opt_name,
                       &error_abort);
    type = qemu_opt_get(opts, "type");

Note this cannot fail.  It may be unable to extract the value of type if
the user messes up badly enough.  We then assume traditional syntax.
Least bad option so far, I think.

For once, QemuOpts having basically no syntax checks comes it handy.
I'm surprised.


