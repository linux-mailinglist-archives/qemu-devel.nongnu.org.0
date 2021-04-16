Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C7362761
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:03:55 +0200 (CEST)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSos-00078o-KU
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXSlE-0005JJ-Hi
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXSlC-00031o-2Z
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618596004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1nkhymr+6hLcTRcwTaBhRqO6hPDr9KFt/t7KAdeiO0=;
 b=AeA3ut5L4tw2HYtKZtxvAst7CtwVLf+gZdC8cEE764nUakr9tCebJO4oyhEfmyEy3Iytj/
 T5tJrg4YdeF1i+BlSwuxOoqJKu75rLjkguX6T2v0OTdme22JgBprgXBmll5vuNnbthKg5B
 TximtzTSYtAqbG0+U5fDUiRZcoI/woI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-V418an_lP52slmPdWEDTtQ-1; Fri, 16 Apr 2021 14:00:00 -0400
X-MC-Unique: V418an_lP52slmPdWEDTtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757B880A19E;
 Fri, 16 Apr 2021 17:59:59 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 878E719727;
 Fri, 16 Apr 2021 17:59:58 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] qapi/error: Repurpose QAPIError as a generic
 exception base class
To: Markus Armbruster <armbru@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-2-jsnow@redhat.com>
 <87mtu0gi6u.fsf@dusky.pond.sub.org>
 <662c4eae-f704-37b4-9d89-f3bbf9108ec2@redhat.com>
 <87im4mrchp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <545d16db-1251-2153-b36f-14ebeb3b07cb@redhat.com>
Date: Fri, 16 Apr 2021 13:59:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im4mrchp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 2:04 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 4/15/21 2:44 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> Rename QAPIError to QAPISourceError, and then create a new QAPIError
>>>> class that serves as the basis for all of our other custom exceptions.
>>>
>>> Isn't the existing QAPIError such a base class already?  Peeking
>>> ahead...  aha, your new base class is abstract.  Can you explain why we
>>> that's useful?
>>>
>>
>> Sure. The existing QAPIError class assumes that it's an error that has a
>> source location, but not all errors will. The idea is that an abstract
>> error class can be used as the ancestor for all other errors in a
>> type-safe way, such that:
>>
>> try:
>>       qapi.something_or_other()
>> except QAPIError as err:
>>       err.some_sort_of_method()
>>
>> (1) This is a type-safe construct, and
>> (2) This is sufficient to catch all errors that originate from within
>> the library, regardless of their exact type.
>>
>> Primarily, it's a ploy to get the SourceInfo stuff out of the
>> common/root exception for type safety reasons.
>>
>> (Later in the series, you'll see there's a few places where we try to
>> fake SourceInfo stuff in order to use QAPIError, by shuffling this
>> around, we allow ourselves to raise exceptions that don't need this
>> hackery.)
> 
> I think you're conflating a real issue with a non-issue.
> 
> The real issue: you want to get rid of fake QAPISourceInfo.  This isn't
> terribly important, but small cleanups count, too.  I can't see the "few
> places where we try to fake" in this series, though.  Is it in a later
> part, or am I just blind?
> 

I was mistaken, we don't fudge it except in one place, and that gets 
fixed in the parser.py series, not this one.

What I really wanted: I wanted to make the base error object something 
that doesn't have an info field at all, fake or not, so that it can be 
ubiquitously re-used as an abstract, common ancestor.

A separate issue: Sometimes, we want to raise errors that *usually* have 
source information, but *might* not sometimes, because of reasons.

So, I guess I don't really have a particularly strong technical 
justification for this anymore, beyond "following a pattern I see and 
use in other projects":

https://docs.python.org/3/tutorial/errors.html#user-defined-exceptions

"When creating a module that can raise several distinct errors, a common 
practice is to create a base class for exceptions defined by that 
module, and subclass that to create specific exception classes for 
different error conditions"

Which QAPIError does not violate, though I usually see this pattern used 
with a tabula rasa class to maximize re-use.

Some of my parser.py drafts that attempted to split out QAPIDoc using 
the Exception-chaining method we discussed on call winds up using this 
abstract class more directly, but we aren't sure we want that yet. (Or, 
we're fairly sure we want to try to delay thinking about it. I am still 
working on re-cleaning part 5.)

> The non-issue: wanting a common base class.  Yes, we want one, but we
> already got one: QAPIError.
> 
> I think the commit message should explain the real issue more clearly,
> without confusing readers with the non-issue.
> 
> Makes sense?
> 

I'll spend a few minutes and see if dropping this patch doesn't deeply 
disturb later patches (or if it can be shuffled backwards to a point 
where it makes more sense contextually).

I genuinely can't remember if it's going to wrench something else up 
later or not right now, though; and I still haven't finished rebasing 
part 5 so I don't have a "finished" product repository to test on anymore.

--js


