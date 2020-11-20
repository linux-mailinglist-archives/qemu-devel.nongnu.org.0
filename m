Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A0E2BB0F3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:51:38 +0100 (CET)
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9dJ-0002q3-RH
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kg9bb-0001PT-HC
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kg9bW-00035r-7v
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605890984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93jrunEDxs1oW5kUEsxiISoOTMbEeOjUH9xuez3O+CE=;
 b=RsyOZ0LbEKkuNnXUuTSoTqRK1BaJK68oisLJYHjIo+vbA3JOjzkPlYjWLXtm2PB3VOk3BS
 OYmSaZehGpbETelFWvvlJf0RQmn/sKnw+encJlMcgPVFInYQC2i2rGoDEItO+Df/yDN1is
 N7/Mahtcx3j3ttuVDbPK8HyS46x0hKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-eiyCLJamNSipztBSZiuE4g-1; Fri, 20 Nov 2020 11:49:42 -0500
X-MC-Unique: eiyCLJamNSipztBSZiuE4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CFF918B62B5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 16:49:42 +0000 (UTC)
Received: from [10.10.119.92] (ovpn-119-92.rdu2.redhat.com [10.10.119.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC8C19726;
 Fri, 20 Nov 2020 16:49:41 +0000 (UTC)
Subject: Re: QMP and the 'id' parameter
To: Markus Armbruster <armbru@redhat.com>
References: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
 <87361h20kd.fsf@dusky.pond.sub.org>
 <ab509dba-7cd8-aaed-7ded-9dd82c040b6d@redhat.com>
 <874klwqowa.fsf@dusky.pond.sub.org>
 <01fc83b3-0f80-9960-fff3-ecf5b1740b76@redhat.com>
 <87y2iw5nqw.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d07468f4-9332-f47a-2762-14f81bfcc0c5@redhat.com>
Date: Fri, 20 Nov 2020 11:49:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87y2iw5nqw.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 5:25 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
>> On 11/11/20 3:27 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>> On 11/10/20 1:22 AM, Markus Armbruster wrote:
>>>>> John Snow <jsnow@redhat.com> writes:

> 
> If you find yourself in a situation where an error class would
> definitely be useful, we should talk about providing you one.
> 

OK, thanks. I just wanted to check there wasn't a stronger opposition 
than I was aware of. I only vaguely knew they were "on the way out."

>>> QGA has a special case, but you probably don't want to know.
>>
>> I do want to know, unfortunately. A good QMP client should likely
>> support both targets.
> 
> QGA has a few commands that send *nothing* on success.
> 
> qapi-code-gen.txt explains:
> 
>      Normally, the QAPI schema is used to describe synchronous exchanges,
>      where a response is expected.  But in some cases, the action of a
>      command is expected to change state in a way that a successful
>      response is not possible (although the command will still return an
>      error object on failure).  When a successful reply is not possible,
>      the command definition includes the optional member 'success-response'
>      with boolean value false.  So far, only QGA makes use of this member.
> 
> qmp-spec.txt neglects to cover this special case.
> 

Oh, I see. That's fun!

(Was it not possible to have the client send an ACK response that 
doesn't indicate success, but just signals receipt? Semantically, it 
would be the difference between do-x and start-x as a command.)

>>> Even though counting responses is a workable way to map responses back
>>> to requests, I recommend to either have at most one request in flight
>>> (so no counting is necessary), or to add IDs to all requests (so
>>> counting isn't necessary as long as you get the syntax right enough to
>>> avoid the ID-less errors discussed above).
>>
>> I am taking this approach. I still need some error handling for the
>> case that an incoming response cannot be routed to the correct pending
>> queue.
>>
>> The QMP spec states that if I get an ID and I don't recognize it, I am
>> free to drop the response on the floor (So I have done so),
> 
> Should not happen.  When it does, something is wrong, possibly seriously
> wrong.
> 

Yep, I agree.

(In my client library: I have decided to enforce string IDs and not 
allow the caller to specify their own. Though we allow arbitrary objects 
to be used as an ID, being able to compare more complex objects seems 
more prone to failure than a simple string.)

> One possible scenario: ID got corrupted on the way from client via
> server back to the client.  The response with the uncorrupted ID will
> never come.  Other responses and events may still arrive fine.
> 
> Two recovery strategies:
> 
> 1. Drop the unexpected response, carry on.  If commands are in flight,
>     be prepared for missing responses.
> 
> 2. Give up, close connection.
> 
> Pick the strategy that best fits your client's needs.
> 

Dropping it on the floor seems fine for now, the spec says I can! :)

The most realistic scenario for this outside of catastrophic error is 
that a client sends a command, but then times out waiting for a 
response. Later, the response arrives -- but that context has already 
come and gone, so there's nowhere to route the message to.

Effectively, an orphaned reply. I suppose I could always stash them in 
an orphaned queue and a very, very rigorous client could check the 
orphaned queue if something winds up in there, but I suspect most 
clients would actually be just as happy to let it fall on the floor.

>>                                                              but I need
>> to handle the case that I see a response with no ID at all.
> 
> Should not happen as long as the client sends syntactically sane input.
> When it does, something is wrong, possibly seriously wrong.
> 
>> Perhaps the easiest, and most sensible thing to do, is to declare this
>> a catastrophic failure and move the QMP connection into an error
>> state, invalidate the whole queue, and disconnect.
>>
>> (And then maybe some of the commands you issued got processed, maybe
>> they didn't. I guess it's up to the application driving the library to
>> query around to find out what happened.)
> 
> Again, two recovery strategies:
> 
> 1. Drop the unexpected response, carry on.  If commands are in flight,
>     be prepared for missing responses.  The server's JSON parser may now
>     be in a state where it can't parse additional commands.  You may want
>     to provoke a lexical error to force it into known-good state, as
>     explained below.
> 
> 2. Give up, close connection.
> 

2 is easier for now. 1 involves some more advanced recovery logic, but 
as you say: something is wrong, possibly seriously wrong.

>> I see. So OOB commands don't execute in parallel, and when they "jump
>> the queue", further executions are not received. Right?
> 
> Right.  It's "out of band", not "in parallel".
> 

OK. Naively I thought that new OOB commands would continue to be 
processed "out of band", but it's fine if that capacity is finite.

>> Conceptually, then: There's one input queue and two pending execution
>> slots. One slot is for OOB commands, and the other slot is for
>> traditional commands.
>>
>> The input queue is FIFO, and when we pull a request from the queue, it
>> occupies one of the conceptual slots (normal/oob). If the slot for
>> this command type is already occupied, we block until it's free.
>>
>> Is that the correct mental model? (Even if it's not really even
>> vaguely correct, details-wise.)
> 
> Almost.
> 
> Consider
> 
>      - Send execute A
>      - Send execute B
>      - Send exec-oob C
>      - Send execute D
> 

[...]

> The I/O thread receives in-band A, and puts it into the empty in-band
> queue.
> 
> The I/O thread receives in-band B, and puts it into the non-full in-band
> queue.
> 
> The I/O thread receives out-of-band C, and exectutes it right away.
> 

Ah, I see where I went wrong. OK, it's crystal clear now.

> The I/O thread receives in-band C, and puts it into the non-full in-band
> queue.
> 
> Meanwhile, the main thread takes in-band A out of the queue, and starts
> executing it.  A takes its own sweet time.
> 
> Only if the client has more in-band commands in flight than the in-band
> queue can hold, the I/O thread encounters a full queue and suspends
> reading.
> 
> qmp-spec.txt:
> 
>      If the client sends in-band commands faster than the server can
>      execute them, the server will stop reading the requests from the QMP
>      channel until the request queue length is reduced to an acceptable
>      range.
> 
> The queue length should probably be specified here.  It's 8.
> 

Oh! That's very helpful to know, actually. If you write a patch to amend 
the language of the doc, I will give you my R-B.

> The server limits the in-band request queue length for the same
> robustness reasons it limits JSON token length, token count and nesting
> depth: to not let a malfunctioning client make it consume unlimited
> amounts of memory.  Hole (kind of): it doesn't limit output queue
> length.
> 

Understood!

>> Is there a reason to not always use \xFF ?
> 
> It's invalid UTF-8.
> 
> "Older versions" should probably read "ancient versions" by now.  I
> don't remember offhand which commit fixed the JSON parser to do the
> right thing in all states.
> 

I suppose right now I don't have any code that tries to unjam the 
parser, so I suppose it doesn't matter.

If it did, I guess I would just try to assume that I was allowed to use 
the newer method and too-bad to folks trying to talk to ancient stuff.

>>>>> Questions?
>>>> A few :)
>>> More?
>> None of tremendous import, I think, by now. Maybe the GQA stuff, but
>> that can be later.
> Still more?

Where does matter come from? If energy cannot be created or destroyed, 
how did it come to be?


