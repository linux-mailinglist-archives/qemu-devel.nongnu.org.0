Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AED55BAB5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 17:31:35 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5qi5-0002mw-Vz
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 11:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5qgA-0001ry-To
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5qg7-0002jP-PE
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 11:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656343770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=896YTscZN/tanKw2V1Khos/5BJ1OmVnODqGrxP7MPrE=;
 b=MA/U1XSlKbBqNJs0I79gF1q+Mbrv/D3QzZG0OVnyG6mx18CmBW0VFGYBySzQuCwtlOKuFV
 e2tqpKhPvOdkMkGkNU9mQLqMNbcrum6jttMTIWvtEUdoNRdBi9WwxiRK+7SEm5Xp8zGvM4
 J6AkdGXs/tpjfqAC6QSY/zSBYvQd3sA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-e8MeXk7gMoGGJo7E0ZQAfg-1; Mon, 27 Jun 2022 11:29:29 -0400
X-MC-Unique: e8MeXk7gMoGGJo7E0ZQAfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B36353C11C60
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:29:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 880AD1410F3B;
 Mon, 27 Jun 2022 15:29:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D707921E690D; Mon, 27 Jun 2022 17:29:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Andrea Bolognani <abologna@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
References: <20220617121932.249381-1-victortoso@redhat.com>
 <87fsjq60gm.fsf@pond.sub.org>
 <20220627124839.fliskdn4twbazqqk@tapioca>
Date: Mon, 27 Jun 2022 17:29:26 +0200
In-Reply-To: <20220627124839.fliskdn4twbazqqk@tapioca> (Victor Toso's message
 of "Mon, 27 Jun 2022 14:48:39 +0200")
Message-ID: <87sfnq15wp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Victor Toso <victortoso@redhat.com> writes:

> Hi Markus,
>
> On Mon, Jun 27, 2022 at 09:15:53AM +0200, Markus Armbruster wrote:
>> Victor Toso <victortoso@redhat.com> writes:
>> 
>> > Hi,
>> >
>> > This is the second iteration of RFC v1:
>> >   https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00226.html
>> >
>> >
>> > # What this is about?
>> >
>> > To generate a simple Golang interface that could communicate with QEMU
>> > over QMP. The Go code that is generated is meant to be used as the bare
>> > bones to exchange QMP messages.
>> >
>> > The goal is to have this as a Go module in QEMU gitlab namespace,
>> > similar to what have been done to pyhon-qemu-qmp
>> >   https://gitlab.com/qemu-project/python-qemu-qmp
>> 
>> Aspects of review:
>> 
>> (1) Impact on common code, if any
>> 
>>     I care, because any messes made there are likely to affect me down
>>     the road.
>
> For the first version of the Go generated interface, my goal is
> to have something that works and can be considered alpha to other
> Go projects.
>
> With this first version, I don't want to bring huge changes to
> the python library or to the QAPI spec and its usage in QEMU.
> Unless someone finds that a necessity.
>
> So I hope (1) is simple :)
>
>> (2) The generated Go code
>> 
>>     Is it (close to) what we want long term?  If not, is it good enough
>>     short term, and how could we make necessary improvements?
>> 
>>     I'd prefer to leave this to folks who actually know their Go.
>> (3) General Python sanity
>> 
>>     We need eyes, but not necessarily mine.  Any takers?
>> 
>> [...]
>> 
>> >  scripts/qapi/golang.py | 765 +++++++++++++++++++++++++++++++++++++++++
>> >  scripts/qapi/main.py   |   2 +
>> >  2 files changed, 767 insertions(+)
>> >  create mode 100644 scripts/qapi/golang.py
>> 
>> This adds a new generator and calls it from generate(), i.e.
>> review aspect (1) is empty.  "Empty" is a quick & easy way to
>> get my ACK!
>> 
>> No tests?
>
> I've added tests but on the qapi-go module, those are the files
> with _test.go prefix on them. Example for commands:
>
>     https://gitlab.com/victortoso/qapi-go/-/blob/main/pkg/qapi/commands_test.go
>
> Should the generator itself have tests or offloading that to the
> qapi-go seems reasonable?

Offloading may be reasonable, but how am I to run the tests then?
Documentation should tell me.

We have roughly three kinds of tests so far:

1. Front end tests in tests/qapi-schema

2. Unit tests in tests/unit/

   To find them:

        $ git-grep '#include ".*qapi-.*\.h"' tests/unit/

3. Many tests talking QMP in tests/qtest/

Since you leave the front end alone, you don't need the first kind.

The other two kinds are less clear.

>> No documentation?
>
> Yes, this iteration removed the documentation of the generated
> types. I'm a bit sad about that. I want to consume the
> documentation in the QAPI files to provide the latest info from
> types/fields but we can't 'copy' it, the only solution is 'refer'
> to it with hyperlink, which I haven't done yet.

Two kinds of documentation: generated documentation for the generated Go
code, and documentation about the generator.  I was thinking of the
latter.  Specifically, docs/devel/qapi-code-gen.rst section "Code
generation".  Opinions on its usefulness differ.  I like it.


