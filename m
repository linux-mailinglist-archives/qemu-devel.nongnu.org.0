Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11212552D6D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:53:02 +0200 (CEST)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Zd7-0007WA-5F
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3ZZf-00048k-L7
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3ZZd-0007Yi-Go
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655801364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uzvH7LmOBLUNKgik5UC4wg3zpJPHicC/s9WfzEnNpZg=;
 b=HS5bQ15Mf8d7Xbw2hRHkKiPVV/5jfrTIoxprQv9pPRdokFw4Dn1CrHV4ir4s2Qiu7wbu7f
 QeKXWUi6PDnoMRHuf44BHiOx0vehDu1kkD5TawtrLMAna88sk5VwbeKMd6A7JARlua8HmG
 RajzNp8iYBY2zXeaSYCHODmWOvozTwI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-jQ-8_d33MQS8_6AinfB7rg-1; Tue, 21 Jun 2022 04:49:23 -0400
X-MC-Unique: jQ-8_d33MQS8_6AinfB7rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D13A8185A79C
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:49:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E39D2166B26;
 Tue, 21 Jun 2022 08:49:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 476D121E688E; Tue, 21 Jun 2022 10:49:21 +0200 (CEST)
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
Date: Tue, 21 Jun 2022 10:49:21 +0200
In-Reply-To: <7eb9f5a3-5166-ee8d-86f8-1d05770331f6@redhat.com> (Laurent
 Vivier's message of "Mon, 20 Jun 2022 19:52:01 +0200")
Message-ID: <87tu8ev1ta.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> On 20/06/2022 17:21, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> Copied from socket netdev file and modified to use SocketAddress
>>> to be able to introduce new features like unix socket.
>>>
>>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>>> according to the IP address type.
>>> "listen" and "connect" modes are managed by stream netdev. An optional
>>> parameter "server" defines the mode (server by default)
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>>> ---

[...]

>>> diff --git a/net/net.c b/net/net.c
>>> index c337d3d753fe..440957b272ee 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
> ...
>>> @@ -1612,7 +1617,19 @@ void net_init_clients(void)
>>>    */
>>>   static bool netdev_is_modern(const char *optarg)
>>>   {
>>> -    return false;
>>> +    QDict *args;
>>> +    const char *type;
>>> +    bool is_modern;
>>> +
>>> +    args = keyval_parse(optarg, "type", NULL, NULL);
>>> +    if (!args) {
>>> +        return false;
>>> +    }
>>> +    type = qdict_get_try_str(args, "type");
>>> +    is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>>> +    qobject_unref(args);
>>> +
>>> +    return is_modern;
>>>   }
>> 
>> You could use g_autoptr here:
>> 
>>         g_autoptr(QDict) args = NULL;
>>         const char *type;
>>         bool is_modern;
>> 
>>         args = keyval_parse(optarg, "type", NULL, NULL);
>>         if (!args) {
>>             return false;
>>         }
>>         type = qdict_get_try_str(args, "type");
>>         return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>> 
>> Matter of taste; you decide.
>
> Looks good. We already had some series to convert existing code to g_autoptr(), so it 
> seems the way to do.
>
>> 
>> Now recall how this function is used: it decides whether to parse the
>> modern way (with qobject_input_visitor_new_str()) or the traditional way
>> (with qemu_opts_parse_noisily()).
>> 
>> qemu_opts_parse_noisily() parses into a QemuOpts, for later use with the
>> opts visitor.
>> 
>> qobject_input_visitor_new_str() supports both dotted keys and JSON.  The
>> former is parsed with keyval_parse(), the latter with
>> qobject_from_json().  It returns the resulting parse tree wrapped in a
>> suitable QAPI input visitor.
>> 
>> Issue 1: since we get there only when keyval_parse() succeeds, JSON is
>> unreachable.  Reproducer:
>> 
>>      $ qemu-system-x86_64 -netdev '{"id":"foo"}'
>>      upstream-qemu: -netdev {"id":"foo"}: Parameter 'id' is missing
>> 
>> This is parsed with qemu_opts_parse_noisily(), resulting in a QemuOpts
>> with a single option 'type' with value '{"id":"foo"}'.  The error
>> message comes from the opts visitor.
>> 
>> To fix this, make netdev_is_modern() return true when optarg[0] == '{'.
>> This matches how qobject_input_visitor_new_str() recognizes JSON.
>
> OK
>
>> 
>> Issue 2: when keyval_parse() detects an error, we throw it away and fall
>> back to QemuOpts.  This is commonly what we want.  But not always.  For
>> instance:
>> 
>>      $ qemu-system-x86_64 -netdev 'type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off'
>> 
>> Note the typo "ipv4-off" instead of ipv4=off.  The error reporting is crap:
>> 
>>      qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: warning: short-form boolean option 'addr.ipv4-off' deprecated
>>      Please use addr.ipv4-off=on instead
>>      qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: Parameter 'type' is missing
>> 
>> We get this because netdev_is_modern() guesses wrongly: keyval_parse()
>> fails with the perfectly reasonable error message "Expected '=' after
>> parameter 'addr.ipv4-off'", but netdev_is_modern() ignores the error,
>> and fails.  We fall back to QemuOpts, and confusion ensues.
>> 
>> I'm not sure we can do much better with reasonable effort.  If we decide
>> to accept this behavior, it should be documented at least in the source
>> code.
>
> What about using modern syntax by default?
>
>      args = keyval_parse(optarg, "type", NULL, NULL);
>      if (!args) {
>          /* cannot detect the syntax, use new style syntax */
>          return true;
>      }

As is, netdev_is_modern() has three cases:

1. keyval_parse() fails

2. keyval_parse() succeeds, but value of @type is not modern

3. keyval_parse() succeeds, and value of @type is modern

In case 3. we're sure, because even if qemu_opts_parse_noisily() also
succeeded, it would result in the same value of @type.

In case 2, assuming traditional seems reasonable.  The assumption can be
wrong when the user intends modern, but fat-fingers the type=T part.

In case 1, we know nothing.

Guessing modern is wrong when the user intends traditional.  This
happens when a meant-to-be-traditional @optarg also parses as modern.
Quite possible.

Guessing traditional is wrong when the user intends modern.  This
happens when a meant-to-be-modern @optarg fails to parse as modern,
i.e. whenever the user screws up modern syntax.

Which guess is less bad?  I'm not sure.  Thoughts?

Note that additionally checking whether qemu_opts_parse() succeeds would
be next to useless, since qemu_opts_parse() accepts pretty much
anything.

[...]


