Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58F2DDE05
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:27:02 +0100 (CET)
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8I9-0003mS-Gu
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kq8Fu-0002M4-Eh
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kq8Fp-0005iK-8O
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608269075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=84bsMcq/J8eXUS2Fe43/n3eUm/Uds9s9gRhVAt9KnBo=;
 b=HiYNLaeruo/MKUHjZZ5nKMEnA9ux7wh0ABCvUVnObzNLI28Hg47GbUNQzDW71mcRQRhNoN
 Q1dCQs0ayXhnY5sciyhHjobDfGL4IMmbOPYYkeCSJbjqwaErgRjZWjPT3tpxYWZsprZRXi
 WHJYjF0UCdd0cj5AIPPu/sh7ZdHc+mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-Df3tT7XyPIWMrPiZ5nFLDw-1; Fri, 18 Dec 2020 00:24:32 -0500
X-MC-Unique: Df3tT7XyPIWMrPiZ5nFLDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B18A4800D62
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:24:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4EEA60BE5;
 Fri, 18 Dec 2020 05:24:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69C271130358; Fri, 18 Dec 2020 06:24:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 08/12] qapi/schema: make QAPISourceInfo mandatory
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-9-jsnow@redhat.com>
 <875z52rr3h.fsf@dusky.pond.sub.org>
 <60c5ae45-c1c4-8bac-9617-5366e49dac7e@redhat.com>
 <87pn38lv1d.fsf@dusky.pond.sub.org>
 <e9f43898-1c0b-54e3-59a7-d9064c2d86ea@redhat.com>
Date: Fri, 18 Dec 2020 06:24:26 +0100
In-Reply-To: <e9f43898-1c0b-54e3-59a7-d9064c2d86ea@redhat.com> (John Snow's
 message of "Thu, 17 Dec 2020 12:02:29 -0500")
Message-ID: <87mtybd6ut.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 12/17/20 3:02 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 12/16/20 5:18 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> --
>>>>>
>>>>> events.py had an info to route, was it by choice that it wasn't before?
>>>>
>>>> See below.
>>>>
>>>> I figure this is intentionally below the -- line, but ...
>>>>
>>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>
>>>> ... this should be above it.
>>>>
>>>
>>> Script failure. Or human failure, because I used '--' instead of '---'.
>>>
>>>>> ---
>>>>>    scripts/qapi/events.py |  2 +-
>>>>>    scripts/qapi/schema.py | 23 +++++++++++++----------
>>>>>    scripts/qapi/types.py  |  9 +++++----
>>>>>    scripts/qapi/visit.py  |  6 +++---
>>>>>    4 files changed, 22 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
>>>>> index 9851653b9d11..9ba4f109028d 100644
>>>>> --- a/scripts/qapi/events.py
>>>>> +++ b/scripts/qapi/events.py
>>>>> @@ -225,7 +225,7 @@ def visit_event(self,
>>>>>                                              self._event_emit_name))
>>>>>            # Note: we generate the enum member regardless of @ifcond, to
>>>>>            # keep the enumeration usable in target-independent code.
>>>>> -        self._event_enum_members.append(QAPISchemaEnumMember(name, None))
>>>>> +        self._event_enum_members.append(QAPISchemaEnumMember(name, info))
>>>>
>>>> We pass None because errors should never happen, and None makes that
>>>> quite clear.
>>>>
>>>
>>> Not clear: *why* should errors never happen? This is the only place we
>>> pass None for SourceInfo that isn't explicitly a literal built-in type.
>>> This is not obvious.
>> 
>> You're right, but there are two separate "unclarities".
>> 
>> Passing None effectively asserts "errors never happen".  We neglect to
>> explain why, leaving the reader guessing.
>> 
>> Passing @info "fixes" that by removing the assertion.  Now we have a
>> more subtle problem: will errors make sense with this @info?  Normally,
>> all members of an enum share one info.  Only this enum's members don't.
>> It turns out the question is moot because @info is not actually used.
>> But will it remain moot?  My point isn't that these are important
>> questions to answer.  It is that we're replacing the relatively obvious
>> question "why are we asserting errors can't happen" by more subtle ones.
>> Feels like sweeping dirt under the rug.
>> 
>
> I'll grant you that. I'm going wide instead of deep, here. There were 
> 200+ errors to fix, and not every last one got the same level of attention.
>
> I definitely did just sweep some dirt under the rug.
>
>>>> We don't actually have a built-in QAPISchemaEnumType for the event enum.
>>>> We merely generate a C enum QAPIEvent along with macro QAPIEvent_str(),
>>>> by passing self._event_emit_name, self._event_enum_members straight to
>>>> gen_enum() and gen_enum_lookup().
>>>>
>>>> If we did build a QAPISchemaEnumType, and used it to diagnose clashes,
>>>> then clashes would be reported like
>>>>
>>>>       mumble.json: In event 'A-B':
>>>>       mumble.json: 2: value 'A-B' collides with value 'A_B'
>>>>
>>>> leaving you guessing what "value" means, and where 'A_B' may be.
>>>>
>>>> Bug: we don't diagnose certain event name clashes.  I'll fix it.
>>>>
>>>
>>> Not clear to me: If I want interface consistency, what *should* be
>>> passed downwards as the info? it's not quite a builtin as much as it is
>>> an inferred enum,
>> 
>> True.
>> 
>>>                    so should I just ... leave it like this, or wait for
>>> you to offer a better fix?
>> 
>> Waiting for some better fix feels undavisable.  We want to get type
>> checking in place sooner rather than later.
>> 
>
> OK. You mentioned fixing the conflicts, so I had thought maybe that was 
> near-term instead of long-term. We have cleared that misunderstanding up ;)
>
>> Aside: a possible fix is decoupling gen_enum_lookup() and gen_enum()
>> from QAPISchemaEnumMember, so we don't have to make up
>> QAPISchemaEnumMembers here.
>> 
>
> I'm not sure I have the broader picture here to do this, or the time to 
> focus on it. It's a bit of a deeper fix than the rest of the minor 
> refactorings I do in these series.
>
>> I think there are two interpretations of your QAPISourceInfo work's aim:
>> 
>> 1. Narrow: use a special QAPISourceInfo rather then None as "no errors
>>     shall happen" poison.
>> 
>>     QAPISourceInfo.builtin() returns this poison.  The name "builtin" is
>>     less than ideal.
>> 
>
> I did intend it to be used for explicit built-in types; this is an 
> "inferred" type, and I'd use a differently named poison for it, I suppose.

In the narrow interpretation, I'd use just one poison, and I'd name it
in a way that signals "no error shall happen".

>> 2. Ambitious: eliminate "no errors shall happen".
>> 
>> We're discussing this in reply of PATCH 06.  I think we need to reach a
>> conclusion there before we can decide here.
>> 
>
> OK, I'll head over there. I'm still a bit confused over here, but we'll 
> get to it.

Just one more thought: narrow vs. ambitious need not be final.  We can
pass "no error shall happen" poison now, and still eliminate or reduce
the poison later on.

>>>>>    
>>>>>    
>>>>>    def gen_events(schema: QAPISchema,
>>>>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>>>>> index 720449feee4d..d5f19732b516 100644
>>>>> --- a/scripts/qapi/schema.py
>>>>> +++ b/scripts/qapi/schema.py
>>>>> @@ -23,6 +23,7 @@
>>>>>    from .error import QAPIError, QAPISemError
>>>>>    from .expr import check_exprs
>>>>>    from .parser import QAPISchemaParser
>>>>> +from .source import QAPISourceInfo
>>>>>    
>>>>>    
>>>>>    class QAPISchemaEntity:
>>>>> @@ -36,10 +37,10 @@ def __init__(self, name, info, doc, ifcond=None, features=None):
>>>>>            self.name = name
>>>>>            self._module = None
>>>>>            # For explicitly defined entities, info points to the (explicit)
>>>>> -        # definition.  For builtins (and their arrays), info is None.
>>>>> -        # For implicitly defined entities, info points to a place that
>>>>> -        # triggered the implicit definition (there may be more than one
>>>>> -        # such place).
>>>>> +        # definition.  For builtins (and their arrays), info is a null-object
>>>>> +        # sentinel that evaluates to False. For implicitly defined entities,
>>>>> +        # info points to a place that triggered the implicit definition
>>>>> +        # (there may be more than one such place).
>>>>
>>>> s/builtins/built-in types/
>>>>
>>>> The meaning of "a null object sentinel" is less than clear.  Perhaps "a
>>>> special object".
>>>>
>>>
>>> OK.
>>>
>>>>>            self.info = info
>>>>>            self.doc = doc
>>>>>            self._ifcond = ifcond or []
>>>>> @@ -209,7 +210,7 @@ class QAPISchemaBuiltinType(QAPISchemaType):
>>>>>        meta = 'built-in'
>>>>>    
>>>>>        def __init__(self, name, json_type, c_type):
>>>>> -        super().__init__(name, None, None)
>>>>> +        super().__init__(name, QAPISourceInfo.builtin(), None)
>>>>>            assert not c_type or isinstance(c_type, str)
>>>>>            assert json_type in ('string', 'number', 'int', 'boolean', 'null',
>>>>>                                 'value')
>>>>> @@ -871,7 +872,7 @@ def resolve_type(self, name, info, what):
>>>>>            return typ
>>>>>    
>>>>>        def _module_name(self, fname):
>>>>> -        if fname is None:
>>>>> +        if not fname:
>>>>>                return None
>>>>>            return os.path.relpath(fname, self._schema_dir)
>>>>>    
>>>>
>>>> Sure this hunk belongs to this patch?
>>>>
>>>
>>> Accident.
>>>
>>> "info and info.fname" does not behave the same with a falsey info object
>>> as it does when info was genuinely None; I compensated for that *here*,
>>> but I should have compensated for it elsewhere.
>>>
>>>>> @@ -897,9 +898,11 @@ def _def_builtin_type(self, name, json_type, c_type):
>>>>>            # be nice, but we can't as long as their generated code
>>>>>            # (qapi-builtin-types.[ch]) may be shared by some other
>>>>>            # schema.
>>>>> -        self._make_array_type(name, None)
>>>>> +        self._make_array_type(name, QAPISourceInfo.builtin())
>>>>>    
>>>>>        def _def_predefineds(self):
>>>>> +        info = QAPISourceInfo.builtin()
>>>>> +
>>>>
>>>> Everything else gets its very own copy of the "no source info" object,
>>>> except for the stuff defined here, which gets to share one.  Isn't that
>>>> odd?
>>>>
>>>
>>> It's also the only function where we define so many built-ins in the
>>> same place, so spiritually they do have the same SourceInfo, right? :)
>>>
>>> (OK, no, it wasn't a conscious design choice, but it also seems
>>> harmless. I am going to assume you'd prefer I not do this?)
>> 
>> It is harmless.  It just made me wonder why we create more than one such
>> QAPISourceInfo in the first place.  Method builtin() could return the
>> same one every time.  It could even be an attribute instead of a method.
>> Anyway, no big deal.
>> 
>
> I could conceivably use source line information and stuff, to be 
> needlessly fancy about it. Nah. I just think singleton patterns are kind 
> of weird to implement in Python, so I didn't.

Stupidest singleton that could possibly work: in __init__,
self.singleton = ...


