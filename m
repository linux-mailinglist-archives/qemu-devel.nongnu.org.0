Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E585A80D1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:01:54 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTPE1-0002M0-81
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTP9m-0005xQ-Ps
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTP9j-0001PI-TD
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661957845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wa7ujc7M0yZd7Cly3nWkxnmKzsyqwn7nj9+C1cFO78Y=;
 b=SSBJUZHdDcMaUmJawyFfOnSh1KYax569+Rf0zu86KFMzeB0iLKb5rlvh64d64rmLezgD3/
 iJmRKLmdIuX+jyobsl3Jg+wxQJliFcwuwgcIoPtYPNqy4NnhboNVAF4LpCJq30mzJG5uEr
 dYmDNmbiUmNsBHf8WG1A2CnDmCUm4EA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-Im02CDTkMJ-jR1yiYbF1XQ-1; Wed, 31 Aug 2022 10:57:22 -0400
X-MC-Unique: Im02CDTkMJ-jR1yiYbF1XQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 155991C06ED5;
 Wed, 31 Aug 2022 14:57:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD30F2026D4C;
 Wed, 31 Aug 2022 14:57:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6AF921E6900; Wed, 31 Aug 2022 16:57:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 16/16] RFC: add a generator for qapi's examples
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-17-victortoso@redhat.com>
 <87ilm8aafh.fsf@pond.sub.org>
 <20220831133255.os2xaxtkolbvmcq5@tapioca>
Date: Wed, 31 Aug 2022 16:57:20 +0200
In-Reply-To: <20220831133255.os2xaxtkolbvmcq5@tapioca> (Victor Toso's message
 of "Wed, 31 Aug 2022 15:32:55 +0200")
Message-ID: <87sflc5ulr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> On Wed, Aug 31, 2022 at 02:01:54PM +0200, Markus Armbruster wrote:
>> Victor Toso <victortoso@redhat.com> writes:
>>
>> > The goal of this generator is to validate QAPI examples and transform
>> > them into a format that can be used for 3rd party applications to
>> > validate their QAPI/QMP introspection.
>> >
>> > For each Example section, we parse server and client messages into a
>> > python dictionary. This step alone has found several ill formatted
>> > JSON messages in the examples.
>> >
>> > The generator outputs another JSON file with all the examples in the
>> > QAPI module that they came from. This can be used to validate the
>> > introspection between QAPI/QMP to language bindings.
>> >
>> > When used with the POC qapi-go branch, we have found bad QMP messages
>> > with wrong member names, mandatory members that were missing and
>> > optional members that were being set with null (not needed).
>> >
>> > A simple example of the output format is:
>> >
>> >  { "examples": [
>> >    {
>> >      "id": "ksuxwzfayw",
>> >      "client": [
>> >      {
>> >        "sequence-order": 1
>> >        "message-type": "command",
>> >        "message":
>> >        { "arguments":
>> >          { "device": "scratch", "size": 1073741824 },
>> >          "execute": "block_resize"
>> >        },
>> >     } ],
>> >     "server": [
>> >     {
>> >       "sequence-order": 2
>> >       "message-type": "return",
>> >       "message": { "return": {} },
>> >     } ]
>> >     }
>> >   ] }
>> >
>> > If this idea seems reasonable, we can add python-qemu-qmp to validate
>> > each message at generation time already.
>> >
>> > Signed-off-by: Victor Toso <victortoso@redhat.com>
>>
>> If I understand you correctly, there are two benefits:
>>
>> 1. Mechanical syntax check for examples
>>
>>    Love it.
>
> Not just JSON syntax but can be extend to the introspection
> layer. Errors like wrong member names would fail while parsing
> the examples (issues such as fixed by patches 11 and 13/16 should
> not happen anymore).

It's also a mechanical check against the schema.  Still love it :)

>> 2. Can extract examples for use as test cases
>>
>>    Sounds good to me.  Possible redundancy with existing tests.
>>    Probably nothing to worry about.
>>
>>    Can you explain in a bit more detail how the extracted data
>>    is (to be) used?
>
> Sure.
>
> The Golang test that consumes this is 152 lines of code [0]. The
> idea is that we can use the examples to feed Golang unmarshalling
> code and then marshall it back to JSON and compare input JSON
> with output JSON and see that their content matches.
>
> [0] https://gitlab.com/victortoso/qapi-go/-/blob/wip-v3/test/examples_test.go
>
> I have generated the examples with this patch series and stored
> the output here [1]
>
> [1] https://gitlab.com/victortoso/qapi-go/-/tree/wip-v3/test/data/examples
>
> The examples are QMP messages that are either sent by Client "->"
> or sent by Server "<-". The order matters so I take the order set
> in the examples and store it as "sequence-order".
>
> In the Go test code, I follow the sequence-order. One example of
> this being useful is that we know which Return type to expect
> after a Command is issued.
>
> I've also included metadata about the type of message, which is
> one of three options: command, event or return. (Errors are
> return too).
>
> This is important because it makes the tests very easy to write.
> Different Unmarshal/Marshal code can be set in the code block of
> the specific message type.
>
> --
>
> The things that makes me quite excited with this idea are:
>
>  1. We have valid functional examples documented. If the examples
>     break, we would have the software in place to know it (plug
>     to ci or some other ninja check seems reasonable to me)
>
>  2. Developers should get more interested in documenting examples
>     as that alone is is a valid test case, even if only useful
>     for language binding's syntax.

Thanks!  Would you like to work some of this into your commit message?


