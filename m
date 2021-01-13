Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6192F54EC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:33:22 +0100 (CET)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzohd-0004JT-4n
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzofQ-0003Vv-BD
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:31:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzofM-0000SV-Qz
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610577058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbJcVNP+7gdbK1R/cDNQ8xFFCY0BwlMR0zDlKt1ICKo=;
 b=D7b9ZFbxDKkaiG9Kp7hC7b1tNEbq6rV/RNyRuLNSUgwTrqUc/tel3LtKefP0Xo8cwKkaQp
 kimTVtPPZR3sg4kEq9Yu5uaTmhsg/NeiyXaJBYO3dq42tJKT0QEU/XI+NgFLBL2vXaW/yb
 dkZpVk7jg7Fncg82YnAL5co5xnIJX58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-MWkQN0cLO1e1H1I8UQTwaQ-1; Wed, 13 Jan 2021 17:30:54 -0500
X-MC-Unique: MWkQN0cLO1e1H1I8UQTwaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B765C107ACF7;
 Wed, 13 Jan 2021 22:30:53 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A20D05D9C0;
 Wed, 13 Jan 2021 22:30:49 +0000 (UTC)
Subject: Re: [PATCH v2 06/12] qapi/source: Add builtin null-object sentinel
To: Markus Armbruster <armbru@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-7-jsnow@redhat.com>
 <878s8wyhgc.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <a486ba8b-3250-93d5-fb7f-b6a6d74d62d6@redhat.com>
Date: Wed, 13 Jan 2021 17:30:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <878s8wyhgc.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 10:39 AM, Markus Armbruster wrote:
> Spelling nitpick: s/builtin/built-in/ in the title.
> 

Sure.

> John Snow <jsnow@redhat.com> writes:
> 
>> We use None to represent an object that has no source information
>> because it's a builtin. This complicates interface typing, since many
>> interfaces expect that there is an info object available to print errors
>> with.
>>
>> Introduce a special QAPISourceInfo that represents these built-ins so
>> that if an error should so happen to occur relating to one of these
>> builtins that we will be able to print its information, and interface
>> typing becomes simpler: you will always have a source info object.
>>
>> This object will evaluate as False, so "if info" remains a valid
>> idiomatic construct.
>>
>> NB: It was intentional to not allow empty constructors or similar to
>> create "empty" source info objects; callers must explicitly invoke
>> 'builtin()' to pro-actively opt into using the sentinel. This should
>> prevent use-by-accident.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> As I pointed out in review of v1, this patch has two aspects mixed up:
> 
> 1. Represent "no source info" as special QAPISourceInfo instead of
>     None
> 
> 2. On error with "no source info", don't crash.
> 
> The first one is what de-complicates interface typing.  It's clearly
> serving this patch series' stated purpose: "static typing conversion".
> 
> The second one is not.  It sidetracks us into a design discussion that
> isn't related to static typing.  Maybe it's something we should discuss.
> Maybe the discussion will make us conclude we want to do this.  But
> letting the static typing work get delayed by that discussion would be
> stupid, and I'll do what I can to prevent that.
> 

It's not unrelated. It's about finding the most tactical incision to 
make the types as we actually use them correct from a static analysis 
context.

Maybe there's another tactical incision to make that's "smaller", for 
some perception of "smaller", but it's not unrelated.

> The stupidest possible solution that preserves the crash is adding an
> assertion right where it crashes before this patch: in
> QAPISourceInfo.__str__().  Yes, crashing in a __str__() method is not
> nice, but it's no worse than before.  Making it better than before is a
> good idea, and you're quite welcome to try, but please not in this
> series.  Add a TODO comment asking for "make it better", then sit on
> your hands.

I'm recently back from a fairly long PTO, so forgive me if I am 
forgetting something, but I am not really sure I fundamentally 
understand the nature of this critique.

Making functions not "crash" is a side-effect of making the types 
correct. I don't see it as scope-creep, it's a solution to a problem 
under active consideration.

In my reply to your earlier critique, I (think) I mentioned that I 
didn't understand the difference between:

1. An exception handler itself crashes because it received a value of 
unexpected type, or

2. The exception handler printed a message that indicates a problem with 
a built-in source definition.

In either case, QAPI didn't get built and it printed some kind of error 
spaghetti to the screen. In both cases, something much more seriously 
wrong has happened and the error message likely does not prepare the 
human user to really genuinely understand what that seriously wrong 
thing is.

I think this is an on-mission patch that improves circumstances; with 
regards to matters of taste I would see it as a lateral move at worst 
(one weird error for another weird error).

I'm left a little confused by the pushback, so I don't feel equipped to 
try and write code that addresses it.

Let's chat on IRC?

--js


