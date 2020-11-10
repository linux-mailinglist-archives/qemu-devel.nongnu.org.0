Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A572ADC37
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:34:14 +0100 (CET)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWax-0001UO-KD
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kcWZw-0000xU-KF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:33:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kcWZs-0005O3-1M
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605025981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0OfhGpnfhxDT6x5gr26YPVJZF5s4k+GFGccpqMiaYA=;
 b=E0NwEBLXUOmjG9AfldCEbQ+ZKfUF+YTf5qTNqDDvHaK9s6o+oO0KldBniMQm7MQ9onfpmW
 kUtVPJdI+o7cekvk6AnPsp7U9nnb8JDxPnvT9n/pAoabhrsJw9D264A3nMAs01JUYTSS9Z
 t/Bfd42bfote2dN6Kzsx+McZJIKK18Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-U6zl0YykNk6YgqFWSu_y7Q-1; Tue, 10 Nov 2020 11:32:59 -0500
X-MC-Unique: U6zl0YykNk6YgqFWSu_y7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF95A879523
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 16:32:58 +0000 (UTC)
Received: from [10.10.113.61] (ovpn-113-61.rdu2.redhat.com [10.10.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 544075B4A0;
 Tue, 10 Nov 2020 16:32:58 +0000 (UTC)
Subject: Re: QMP and the 'id' parameter
To: Markus Armbruster <armbru@redhat.com>
References: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
 <87361h20kd.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <ab509dba-7cd8-aaed-7ded-9dd82c040b6d@redhat.com>
Date: Tue, 10 Nov 2020 11:32:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87361h20kd.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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

On 11/10/20 1:22 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> The QMP specification states:
>>
>>> NOTE: Some errors can occur before the Server is able to read the "id"
>>> member, in these cases the "id" member will not be part of the error
>>> response, even if provided by the client.
>>
>> I am assuming this case ONLY occurs for Parse errors:
>>
>> {'class': 'GenericError', 'desc': 'JSON parse error, expecting value'}
> 
> There are more "desc" possible, actually.
> 
> The JSON parser gets fed chunks of input, and calls a callback for every
> full JSON value, and on parse error.
> 
> QMP's callback is handle_qmp_command().  Parameter @req is the parsed
> JSON value, parameter @err is the (parse) error object, and exactly one
> of them is non-null.
> 
> 1. Parse error
> 
> If @err, we send an error response for it.  It never has "id".  See
> qmp_error_response() caller monitor_qmp_dispatcher_co().  The possible
> @err are:
> 
>      $ grep error_setg qobject/json-*[ch]
>      qobject/json-parser.c:    error_setg(&ctxt->err, "JSON parse error, %s", message);
> 
> This is a syntax error.
> 
> Search for parse_error() to see the possible @message patterns.
> 
>      qobject/json-streamer.c:        error_setg(&err, "JSON parse error, stray '%s'", input->str);
> 
> This is a lexical error.
> 
>      qobject/json-streamer.c:        error_setg(&err, "JSON token size limit exceeded");
>      qobject/json-streamer.c:        error_setg(&err, "JSON token count limit exceeded");
>      qobject/json-streamer.c:        error_setg(&err, "JSON nesting depth limit exceeded");
> 
> These are (intentional) parser limits.
> 
> 2. Successful parse
> 
> If @req, it's a successful parse.
> 
> If @req is not a JSON object, there is no "id".  qmp_dispatch() reports
> 
>          error_setg(&err, "QMP input must be a JSON object");
> 
> If @req is a JSON object, it has "id" exactly when the client supplied
> one.  The response mirrors @req's "id".  See qmp_error_response() caller
> qmp_dispatch().
> 

That's very helpful, thank you. So in summary, the possibilities are:

1. syntax error (with several descriptions)
2. lexical error (with several descriptions, templated from one message)
3. lexical limitation (with several descriptions)
4. grammatical error ("QMP input must be a JSON object")

(I know we have declared the error_class passe and we now prefer 
"generic_error", but I lack the history lesson on why we do that. 
Wouldn't the error_class here be helpful for interpreting the response? 
It helps differentiate between 'The RPC call was received' vs 'The RPC 
call was received, but failed.' which may have semantic differences for 
who wants to consume the error: the QMP library itself, or the user 
making the RPC call. No?)

>> And I am assuming, in the context of a client that /always/ sets an
>> 'id' for its execute statements, that this means that any error
>> response we receive without an 'id' field *must* be associated with
>> the most-recently-sent command.
> 
> Only if the client keeps no more than one command in flight.
> 

OK, so without engaging the OOB capability, we receive responses 
strictly in a FIFO manner, always.

So if we have:

Send exec A, Send exec B, Send exec C

and then we receive an error response with no ID attached, we know it 
must be "A" that errored. Correct?

> Command responses get sent strictly in order (even parse errors), except
> for commands executed out-of-band.
> 
> If the client sends N JSON values, and only then reads responses, and
> there are no parse errors, then it'll get N responses.  The i-th
> response is for the i-th JSON value, except responses to OOB command may
> "jump the queue".
> 

Let's assume now that A, B, and C are *all* OOB commands:

- Send exec-oob A
- Send exec-oob B
- Send exec-oob C

My client now reads an error message that has no ID attached. Which 
command execution was this associated with?

Is it necessarily "A" if we have not yet received any other response?

> With parse errors, it can get a different number of responses.
> 

Oh, uhm -- if the parse error was bad enough that it didn't even notice 
we sent it three commands, right? ... So if we see a parse error, we 
might not know which, if any, of our queued commands were seen or can 
still expect a response.

That seems difficult to code around, unless I misunderstand.

(Every parser error I receive -- which I can "guess" that it's a parser 
error by the lack of an 'id' field, potentially invalidates the entire 
queue?)

> Questions?
> 

A few :)


