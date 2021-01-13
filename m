Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C52F5515
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:06:15 +0100 (CET)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzpDS-0005f9-Ri
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzpBw-00059N-7o
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzpBu-0003eF-FM
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610579077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAtTztGv1SR7NSPXXEblAiMOWUA4wsF21nucIXfdFNg=;
 b=ZaS2PVpCmMnIJOs9zwuVN2DL1Y+Lt/fbDh51nxd73tA2x6Gi2ptCHAu78QJn/a0Kg1a90Q
 6CdBTPVmu6v3XDUeEQtiIE87kI8+/X/q9FOtkneQ+eQEXQ9bOqj78IySAMjd2XTgieBZnn
 toZzXpf9no0TMM9pSfZWQPiDzhUTUQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490--kXkYPHhOwKNTmVh1RcDoA-1; Wed, 13 Jan 2021 18:04:35 -0500
X-MC-Unique: -kXkYPHhOwKNTmVh1RcDoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ADA98143E5;
 Wed, 13 Jan 2021 23:04:34 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694551F416;
 Wed, 13 Jan 2021 23:04:29 +0000 (UTC)
Subject: Re: [PATCH v2 07/12] qapi/schema: make QAPISourceInfo mandatory
To: Markus Armbruster <armbru@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-8-jsnow@redhat.com>
 <87ft34x1bv.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <fe49fccd-dce1-44ee-71c5-f696f69f5361@redhat.com>
Date: Wed, 13 Jan 2021 18:04:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87ft34x1bv.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On 1/13/21 11:12 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>>
>> ---
>>
>> The event_enum_members change might become irrelevant after a
>> forthcoming (?) patch by Markus, but didn't have it in-hand at time of
>> publishing.
> 
> It's in my "[PATCH 00/11] Drop support for QAPIGen without a file name",
> which includes parts of your v1.  The parts that are new should be
> injected into your series so they replace your "[PATCH v2 09/12]
> qapi/gen: move write method to QAPIGenC, make fname a str".  Holler if
> you need help.
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/events.py |  2 +-
>>   scripts/qapi/schema.py | 25 ++++++++++++++-----------
>>   scripts/qapi/types.py  |  9 +++++----
>>   scripts/qapi/visit.py  |  6 +++---
>>   4 files changed, 23 insertions(+), 19 deletions(-)
>>
>> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
>> index 9851653b9d1..9ba4f109028 100644
>> --- a/scripts/qapi/events.py
>> +++ b/scripts/qapi/events.py
>> @@ -225,7 +225,7 @@ def visit_event(self,
>>                                             self._event_emit_name))
>>           # Note: we generate the enum member regardless of @ifcond, to
>>           # keep the enumeration usable in target-independent code.
>> -        self._event_enum_members.append(QAPISchemaEnumMember(name, None))
>> +        self._event_enum_members.append(QAPISchemaEnumMember(name, info))
> 
> This "enum" is not supposed to be erroneous.  If it is, it's a bug.
> 
> Your patch changes how the code behaves should such a bug bite here.
> Before, we crash.  Afterwards, we report the bug using @info, which I'd
> expect to produce utterly confusing error messages.
> 

It doesn't change the behavior *here*, though. It changes it whenever 
this info object is used in another context. ... and who knows when or 
where or why it is being used, or by whom.

I'll have to play with this. I'm not sure there's any way to coax a bug 
to happen here that I am aware of right away. Can you think of how to 
will one into existence?

> My comments on PATCH 06 apply: how the code should behave here is a
> design issue that should be kept out of this patch series.
> 
> If you need to pass a value other than None to help with static typing,
> then pass a suitable poison info that will crash right where None
> crashes now.
> 

I think we need to, yes; or we probably really, really want to. Making 
the info parameter optional really adds a lot of unidiomatic 
type-checking confetti when we go to use info, and in many more contexts 
than just this sorta-built-in-enum; it will creep badly.

So, I gotta pass ...something here. but what? You want poison, but I 
think it's not right to fundamentally poison all built-ins.

Mmmmmmm. Maybe per-instance poison can be done? We actually share info 
objects, but I can make poisoned copies. Using next_line() as a basis:

     def poison(self: T) -> T:
         info = copy.copy(self)
         info.poisoned = True
         return info

probably almost anything I do is not going to make a lot of sense unless 
I can actually replicate and test the different error scenarios to prove 
that we didn't make the error spaghetti unknowably worse. I see it as 
functionally inevitable that I have to audit this and make sure we get 
good error messages anyway, so ... maybe I just ought to do that now anyway.

>>   def gen_events(schema: QAPISchema,
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 720449feee4..0449771dfe5 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -23,6 +23,7 @@
>>   from .error import QAPIError, QAPISemError
>>   from .expr import check_exprs
>>   from .parser import QAPISchemaParser
>> +from .source import QAPISourceInfo
>>   
>>   
>>   class QAPISchemaEntity:
>> @@ -36,10 +37,10 @@ def __init__(self, name, info, doc, ifcond=None, features=None):
>>           self.name = name
>>           self._module = None
>>           # For explicitly defined entities, info points to the (explicit)
>> -        # definition.  For builtins (and their arrays), info is None.
>> -        # For implicitly defined entities, info points to a place that
>> -        # triggered the implicit definition (there may be more than one
>> -        # such place).
>> +        # definition. For built-in types (and their arrays), info is a
>> +        # special object that evaluates to False. For implicitly defined
>> +        # entities, info points to a place that triggered the implicit
>> +        # definition (there may be more than one such place).
>>           self.info = info
>>           self.doc = doc
>>           self._ifcond = ifcond or []
>> @@ -68,7 +69,7 @@ def check_doc(self):
>>   
>>       def _set_module(self, schema, info):
>>           assert self._checked
>> -        self._module = schema.module_by_fname(info and info.fname)
>> +        self._module = schema.module_by_fname(info.fname if info else None)
> 
> Looks unrelated.
> 

Hmm, it sorta is. I have apparently edited this patch since I sent it, 
but there was some tomfoolery over how "x and y" statements behave and 
this edit was necessary at the time.

"info and info.fname" returned None when info could actually be None, 
but when it was updated to be a special source object, we could 
accidentally pass that special source object as the name -- instead of 
None. Not good.

I think I re-ordered some patches such that I can just pass in 
"info.fname" unconditionally instead as of this patch.

>>           self._module.add_entity(self)
>>   
>>       def set_module(self, schema):
> [...]
> 


