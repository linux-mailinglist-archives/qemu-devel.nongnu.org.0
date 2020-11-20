Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788392BA76C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:28:34 +0100 (CET)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3eb-00044W-F0
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg3bU-0001uQ-7j
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:25:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg3bR-0001vi-Cr
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605867916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V+17FckQfXFQoCCSdj0cgV0ALFlSi8xKj8YDKs4SwhM=;
 b=RvHCgc5i9+StjDRnj2hEWte/ixJOXFk3ZHYr1LiQWb4iUgYw004LklOCwuzdh6nY6yCYY+
 miDNFe2ybEcckSFTLpXemOYh0hVqSXNoUsOa1lwL9oYF7ieulRrL8aeD9NiTGSb4VlHFev
 jN7W5QPbcXqmZuaucNe2NbXWTRA2V9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-X94F5SUXOI-kS73OxEm8pw-1; Fri, 20 Nov 2020 05:25:14 -0500
X-MC-Unique: X94F5SUXOI-kS73OxEm8pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEA80801B14
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 10:25:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F3D10016F7;
 Fri, 20 Nov 2020 10:25:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D5FC711358BA; Fri, 20 Nov 2020 11:25:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: QMP and the 'id' parameter
References: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
 <87361h20kd.fsf@dusky.pond.sub.org>
 <ab509dba-7cd8-aaed-7ded-9dd82c040b6d@redhat.com>
 <874klwqowa.fsf@dusky.pond.sub.org>
 <01fc83b3-0f80-9960-fff3-ecf5b1740b76@redhat.com>
Date: Fri, 20 Nov 2020 11:25:11 +0100
In-Reply-To: <01fc83b3-0f80-9960-fff3-ecf5b1740b76@redhat.com> (John Snow's
 message of "Thu, 19 Nov 2020 19:22:09 -0500")
Message-ID: <87y2iw5nqw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

John Snow <jsnow@redhat.com> writes:

> On 11/11/20 3:27 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 11/10/20 1:22 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> The QMP specification states:
>>>>>
>>>>>> NOTE: Some errors can occur before the Server is able to read the "id"
>>>>>> member, in these cases the "id" member will not be part of the error
>>>>>> response, even if provided by the client.
>>>>>
>>>>> I am assuming this case ONLY occurs for Parse errors:
>>>>>
>>>>> {'class': 'GenericError', 'desc': 'JSON parse error, expecting value'}
>>>>
>>>> There are more "desc" possible, actually.
>>>>
>>>> The JSON parser gets fed chunks of input, and calls a callback for every
>>>> full JSON value, and on parse error.
>>>>
>>>> QMP's callback is handle_qmp_command().  Parameter @req is the parsed
>>>> JSON value, parameter @err is the (parse) error object, and exactly one
>>>> of them is non-null.
>>>>
>>>> 1. Parse error
>>>>
>>>> If @err, we send an error response for it.  It never has "id".  See
>>>> qmp_error_response() caller monitor_qmp_dispatcher_co().  The possible
>>>> @err are:
>>>>
>>>>       $ grep error_setg qobject/json-*[ch]
>>>>       qobject/json-parser.c:    error_setg(&ctxt->err, "JSON parse error, %s", message);
>>>>
>>>> This is a syntax error.
>>>>
>>>> Search for parse_error() to see the possible @message patterns.
>>>>
>>>>       qobject/json-streamer.c:        error_setg(&err, "JSON parse error, stray '%s'", input->str);
>>>>
>>>> This is a lexical error.
>>>>
>>>>       qobject/json-streamer.c:        error_setg(&err, "JSON token size limit exceeded");
>>>>       qobject/json-streamer.c:        error_setg(&err, "JSON token count limit exceeded");
>>>>       qobject/json-streamer.c:        error_setg(&err, "JSON nesting depth limit exceeded");
>>>>
>>>> These are (intentional) parser limits.
>>>>
>>>> 2. Successful parse
>>>>
>>>> If @req, it's a successful parse.
>>>>
>>>> If @req is not a JSON object, there is no "id".  qmp_dispatch() reports
>>>>
>>>>           error_setg(&err, "QMP input must be a JSON object");
>>>>
>>>> If @req is a JSON object, it has "id" exactly when the client supplied
>>>> one.  The response mirrors @req's "id".  See qmp_error_response() caller
>>>> qmp_dispatch().
>>>>
>>>
>>> That's very helpful, thank you. So in summary, the possibilities are:
>>>
>>> 1. syntax error (with several descriptions)
>>> 2. lexical error (with several descriptions, templated from one message)
>>> 3. lexical limitation (with several descriptions)
>>
>> Nitpick: parser limitation.  Nesting depth is not lexical :)
>> 
>>> 4. grammatical error ("QMP input must be a JSON object")
>>
>> We got two layers of syntax: QAPI schema above JSON.  The JSON layer
>> builds JSON from characters, the QAPI schema layer builds QAPI schema
>> from JSON.
>>
>> Errors 1-3 are for the JSON layer.
>>
>> Error 4 is a QAPI schema syntax error.  The qobject input visitor
>> reports more of them.  Error 4 is special only because it's the only one
>> where the JSON cannot have an ID.  All the other QAPI schema syntax
>> errors can have an ID.
>> 
>>> (I know we have declared the error_class passe and we now prefer
>>> "generic_error", but I lack the history lesson on why we do that.
>>
>> The initial design had "rich" error objects, basically:
>> 
>> * An error QDict with a string "class" member and arbitrary data in a
>>   QDict "data" member
>> 
>>   To build a QMP error response, add the command's ID (if any) to the
>>   error QDict, and serialize to JSON.
>> 
>> * A pointer into a table of pairs (JSON template string, human-friendly
>>   template string).  More on the use of JSON template strings below.
>> 
>>   To build a human-friendly error message, interpolate the members of
>>   the data QDict into the human-friendly template.
>> 
>> Say you're writing a piece of code.  Among many other things, there are
>> a few errors to report.  You get to drop what you're doing, and do a
>> three step dance:
>> 
>> 1. Define a QERR_YOUR_NEW_ERROR macro that expands into a JSON template
>> for the error QDict.  These are all in one place, which is included all
>> over the place.  Merge conflicts galore.
>> 
>> 2. Add a table entry mapping QERR_YOUR_NEW_ERROR to the human-friendly
>> template.
>> 
>> 3. Call the error function, passing QERR_YOUR_NEW_ERROR template and the
>> arguments.  The arguments must match the template.  This builds the
>> error QDict from template and the arguments, and looks up the template
>> in the table.
>> 
>> I strenuously objected to this.  In the end, all I could accomplish was
>> the inclusion of the human-friendly message in the QMP error response.
>> 
>> I (correctly) predicted two issues:
>> 
>> 1. Error classes multiplied.  Not quite like rabbits, but bad enough to
>> be confusing.  Most of them were undocumented and of absolutely no use
>> to QMP clients.
>> 
>> 2. The three step dance proved bothersome, and people frequently took
>> the obvious shortcut: instead of defining a new error that fits the
>> situation, reuse some existing error.  Even when it doesn't quite fit.
>> Error message quality went into the toilet.
>> 
>> After a few years of this, I went in with an axe, and nobody objected.
>> 
>> Among the stuff I axed were most error classes.  I spared only the ones
>> that were documented and plausibly useful to some QMP client.
>>
>>> Wouldn't the error_class here be helpful for interpreting the response?
>>> It helps differentiate between 'The RPC call was received' vs 'The RPC
>>> call was received, but failed.' which may have semantic differences for
>>> who wants to consume the error: the QMP library itself, or the user
>>> making the RPC call. No?)
>>
>> Can we have more error classes?  Yes, if they are documented and
>> definitely useful to some QMP client that matters.
>> 
>
> OK, understood. It makes sense. I can see how semantic error classes
> would be a nuisance for a program as large as QEMU. However, making a 
> distinction between errors at the JSON/QMP grammar level vs those at
> the QAPI level might be useful*.
>
> (*Maybe. A client library may wish to route errors differently based
> on if it's the "user's fault" or the "library's fault". However, an
> error with no ID is in the realm of "Not the user's fault". We can get
> by without it being explicit, but I still wonder if it'd be "Nice".)

If you find yourself in a situation where an error class would
definitely be useful, we should talk about providing you one.

>>>>> And I am assuming, in the context of a client that /always/ sets an
>>>>> 'id' for its execute statements, that this means that any error
>>>>> response we receive without an 'id' field *must* be associated with
>>>>> the most-recently-sent command.
>>>>
>>>> Only if the client keeps no more than one command in flight.
>>>>
>>>
>>> OK, so without engaging the OOB capability, we receive responses
>>> strictly in a FIFO manner, always.
>>>
>>> So if we have:
>>>
>>> Send exec A, Send exec B, Send exec C
>>>
>>> and then we receive an error response with no ID attached, we know it
>>> must be "A" that errored. Correct?
>> 
>> Correct.
>> 
>> QGA has a special case, but you probably don't want to know.
>
> I do want to know, unfortunately. A good QMP client should likely
> support both targets.

QGA has a few commands that send *nothing* on success.

qapi-code-gen.txt explains:

    Normally, the QAPI schema is used to describe synchronous exchanges,
    where a response is expected.  But in some cases, the action of a
    command is expected to change state in a way that a successful
    response is not possible (although the command will still return an
    error object on failure).  When a successful reply is not possible,
    the command definition includes the optional member 'success-response'
    with boolean value false.  So far, only QGA makes use of this member.

qmp-spec.txt neglects to cover this special case.

>> Even though counting responses is a workable way to map responses back
>> to requests, I recommend to either have at most one request in flight
>> (so no counting is necessary), or to add IDs to all requests (so
>> counting isn't necessary as long as you get the syntax right enough to
>> avoid the ID-less errors discussed above).
>
> I am taking this approach. I still need some error handling for the
> case that an incoming response cannot be routed to the correct pending
> queue.
>
> The QMP spec states that if I get an ID and I don't recognize it, I am
> free to drop the response on the floor (So I have done so),

Should not happen.  When it does, something is wrong, possibly seriously
wrong.

One possible scenario: ID got corrupted on the way from client via
server back to the client.  The response with the uncorrupted ID will
never come.  Other responses and events may still arrive fine.

Two recovery strategies:

1. Drop the unexpected response, carry on.  If commands are in flight,
   be prepared for missing responses.

2. Give up, close connection.

Pick the strategy that best fits your client's needs.

>                                                             but I need 
> to handle the case that I see a response with no ID at all.

Should not happen as long as the client sends syntactically sane input.
When it does, something is wrong, possibly seriously wrong.  

> Perhaps the easiest, and most sensible thing to do, is to declare this
> a catastrophic failure and move the QMP connection into an error
> state, invalidate the whole queue, and disconnect.
>
> (And then maybe some of the commands you issued got processed, maybe
> they didn't. I guess it's up to the application driving the library to 
> query around to find out what happened.)

Again, two recovery strategies:

1. Drop the unexpected response, carry on.  If commands are in flight,
   be prepared for missing responses.  The server's JSON parser may now
   be in a state where it can't parse additional commands.  You may want
   to provoke a lexical error to force it into known-good state, as
   explained below.

2. Give up, close connection.

>>>> Command responses get sent strictly in order (even parse errors), except
>>>> for commands executed out-of-band.
>>>>
>>>> If the client sends N JSON values, and only then reads responses, and
>>>> there are no parse errors, then it'll get N responses.  The i-th
>>>> response is for the i-th JSON value, except responses to OOB command may
>>>> "jump the queue".
>>>>
>>>
>>> Let's assume now that A, B, and C are *all* OOB commands:
>>>
>>> - Send exec-oob A
>>> - Send exec-oob B
>>> - Send exec-oob C
>>>
>>> My client now reads an error message that has no ID attached. Which
>>> command execution was this associated with?
>>>
>>> Is it necessarily "A" if we have not yet received any other response?
>> 
>> In this case, it can only be "A", because exec-oob is executed right
>> away, which means multiple exec-oob are executed in order, one after the
>> other.
>
> I see. So OOB commands don't execute in parallel, and when they "jump
> the queue", further executions are not received. Right?

Right.  It's "out of band", not "in parallel".

>> More interesting example:
>> 
>>    - Send execute A
>>    - Send exec-oob B
>> 
>> First, consider the "no errors" case.  The first respone may be for A
>> or, if B managed to jump the queue, for B.
>> 
>> How?  The I/O thread receives A, sends it to the main loop, receives B,
>> executes it right away, and sends its result.
>> 
>> Meanwhile, the main loop receives A, executes it and sends the result.
>> 
>> Everything is received in the order it is sent.
>
> Conceptually, then: There's one input queue and two pending execution
> slots. One slot is for OOB commands, and the other slot is for 
> traditional commands.
>
> The input queue is FIFO, and when we pull a request from the queue, it
> occupies one of the conceptual slots (normal/oob). If the slot for
> this command type is already occupied, we block until it's free.
>
> Is that the correct mental model? (Even if it's not really even
> vaguely correct, details-wise.)

Almost.

Consider

    - Send execute A
    - Send execute B
    - Send exec-oob C
    - Send execute D

What would happen in the server in this model?

The I/O thread receives in-band A, and puts it into the empty in-band
slot.

Now the I/O thread doesn't want to receive anything, because if it
receives an in-band command, it can't do anything with it.  So it
suspends reading.

The main thread takes in-band A out of the slot (resuming reading), and
starts executing it.  A takes its own sweet time.

The I/O thread receives in-band B, and puts it into the empty in-band
slot, and suspends reading.

Eventually, A terminates.  The main thread takes in-band B out of the
slot (resuming reading), and starts executing it.

The I/O thread receives out-of-band C, and puts it into the out-of-band
slot.  Note that we don't read, let alone execute C until after A is
done.  Out-of-band commands can jump the queue, but not exactly far.


More accurate model: in-band commands go into a length-limited queue,
out-of-band commands get executed immediately.

What happens in the server in this model?

The I/O thread receives in-band A, and puts it into the empty in-band
queue.

The I/O thread receives in-band B, and puts it into the non-full in-band
queue.

The I/O thread receives out-of-band C, and exectutes it right away.

The I/O thread receives in-band C, and puts it into the non-full in-band
queue.

Meanwhile, the main thread takes in-band A out of the queue, and starts
executing it.  A takes its own sweet time.

Only if the client has more in-band commands in flight than the in-band
queue can hold, the I/O thread encounters a full queue and suspends
reading.

qmp-spec.txt:

    If the client sends in-band commands faster than the server can
    execute them, the server will stop reading the requests from the QMP
    channel until the request queue length is reduced to an acceptable
    range.

The queue length should probably be specified here.  It's 8.

The server limits the in-band request queue length for the same
robustness reasons it limits JSON token length, token count and nesting
depth: to not let a malfunctioning client make it consume unlimited
amounts of memory.  Hole (kind of): it doesn't limit output queue
length.

>> The two threads race to send result.  That's a feature: it enables B to
>> jump the queue.
>> 
>> But what about ID-less errors?  Never fear, we actually thought this
>> out.
>
> I trusted that you did!
>
>> The I/O thread needs to parse QMP input some to be able to recognize
>> exec-oob.  Any parse errors are sent to the main loop, just like
>> requests.  The main loop receives and processes in order.  Errors it
>> simply sends, requests it executes, then sends the result.
>> 
>> This ensures that ID-less errors can never jump the queue.
>
> OK, understood. Essentially, parse errors for OOB commands lose their
> "queue-jumping" ability (Or, I suppose, they never *gain* it.) They're 
> traditional commands until proven otherwise. If we can prove
> otherwise, we already know it isn't a parsing error.

Correct!

>>>> With parse errors, it can get a different number of responses.
>>>>
>>>
>>> Oh, uhm -- if the parse error was bad enough that it didn't even notice
>>> we sent it three commands, right?
>> 
>> Yes.
>> 
>> What can a parser do after detecting an error?  Error recovery is
>> fundamentally guesswork.  The art has a substantial body of lore on
>> minimizing error cascades.  The basic technique is to silently skip
>> tokens until a some promising point, then resume parsing in a suitably
>> altered parser state.
>> 
>> Our error recovery is simplistic.  Happy to explain it in detail if
>> you're curious.  I figure you're more interested in practical advice
>> today.  docs/interop/qmp-spec.txt section has some:
>
> Little bit of both, really. I thank you for your time so far.
>
>>      2.6 Forcing the JSON parser into known-good state
>>      -------------------------------------------------
>>      Incomplete or invalid input can leave the server's JSON parser in a
>>      state where it can't parse additional commands.  To get it back into
>>      known-good state, the client should provoke a lexical error.
>> 
>>      The cleanest way to do that is sending an ASCII control character
>>      other than '\t' (horizontal tab), '\r' (carriage return), or '\n' (new
>>      line).
>> 
>>      Sadly, older versions of QEMU can fail to flag this as an error.  If a
>>      client needs to deal with them, it should send a 0xFF byte.
>
> Is there a reason to not always use \xFF ?

It's invalid UTF-8.

"Older versions" should probably read "ancient versions" by now.  I
don't remember offhand which commit fixed the JSON parser to do the
right thing in all states.

>>> we sent it three commands, right? ... So if we see a parse error, we
>>> might not know which, if any, of our queued commands were seen or can
>>> still expect a response.
>>>
>>> That seems difficult to code around, unless I misunderstand.
>> 
>> "Doctor, it hurts when I send QMP input that isn't even JSON!"
>
> Haha. I don't endeavor to keep causing parser errors.
>
>>> (Every parser error I receive -- which I can "guess" that it's a parser
>>> error by the lack of an 'id' field, potentially invalidates the entire
>>> queue?)
>> 
>> Yes, with stress on "potentially".  How much gets thrown away depends on
>> the error.  You know for sure only when you receive a reply with an ID.
>> 
>>>> Questions?
>>>>
>>>
>>> A few :)
>> 
>> More?
>
> None of tremendous import, I think, by now. Maybe the GQA stuff, but
> that can be later.

Still more?


