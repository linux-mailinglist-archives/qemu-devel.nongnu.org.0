Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52C2DC6B5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:46:20 +0100 (CET)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpboY-000431-Kb
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpbjk-00011Q-RB
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpbjh-00036W-4d
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608144075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PJsb1+5+jzafXdXRokCgQ18EX1ocM2SdwzoGSvn5z0=;
 b=Av5V3tkWwtSVRKUScQ7jaiqGHLX0Lt1nFccVgEv4r7zCKZRhEyEB7QgNRJy/ov7wuRTINf
 TLKi8yQ6DPSsp3Ky2YsvL5FIYsAlwaqC/Btq3thihQP2fRp0qxm0txpi3KSB9kO4vb6c8N
 nxBa+o66hJacrbIWOuKBKKMthZE0p5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458--9qIxsC3O5etWQ8JlS0-sg-1; Wed, 16 Dec 2020 13:41:12 -0500
X-MC-Unique: -9qIxsC3O5etWQ8JlS0-sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F3B1801AAF
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 18:41:11 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0B510013C0;
 Wed, 16 Dec 2020 18:41:07 +0000 (UTC)
Subject: Re: [PATCH 08/12] qapi/schema: make QAPISourceInfo mandatory
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-9-jsnow@redhat.com>
 <875z52rr3h.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <60c5ae45-c1c4-8bac-9617-5366e49dac7e@redhat.com>
Date: Wed, 16 Dec 2020 13:41:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <875z52rr3h.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 5:18 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> --
>>
>> events.py had an info to route, was it by choice that it wasn't before?
> 
> See below.
> 
> I figure this is intentionally below the -- line, but ...
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> ... this should be above it.
> 

Script failure. Or human failure, because I used '--' instead of '---'.

>> ---
>>   scripts/qapi/events.py |  2 +-
>>   scripts/qapi/schema.py | 23 +++++++++++++----------
>>   scripts/qapi/types.py  |  9 +++++----
>>   scripts/qapi/visit.py  |  6 +++---
>>   4 files changed, 22 insertions(+), 18 deletions(-)
>>
>> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
>> index 9851653b9d11..9ba4f109028d 100644
>> --- a/scripts/qapi/events.py
>> +++ b/scripts/qapi/events.py
>> @@ -225,7 +225,7 @@ def visit_event(self,
>>                                             self._event_emit_name))
>>           # Note: we generate the enum member regardless of @ifcond, to
>>           # keep the enumeration usable in target-independent code.
>> -        self._event_enum_members.append(QAPISchemaEnumMember(name, None))
>> +        self._event_enum_members.append(QAPISchemaEnumMember(name, info))
> 
> We pass None because errors should never happen, and None makes that
> quite clear.
> 

Not clear: *why* should errors never happen? This is the only place we 
pass None for SourceInfo that isn't explicitly a literal built-in type. 
This is not obvious.

> We don't actually have a built-in QAPISchemaEnumType for the event enum.
> We merely generate a C enum QAPIEvent along with macro QAPIEvent_str(),
> by passing self._event_emit_name, self._event_enum_members straight to
> gen_enum() and gen_enum_lookup().
> 
> If we did build a QAPISchemaEnumType, and used it to diagnose clashes,
> then clashes would be reported like
> 
>      mumble.json: In event 'A-B':
>      mumble.json: 2: value 'A-B' collides with value 'A_B'
> 
> leaving you guessing what "value" means, and where 'A_B' may be.
> 
> Bug: we don't diagnose certain event name clashes.  I'll fix it.
> 

Not clear to me: If I want interface consistency, what *should* be 
passed downwards as the info? it's not quite a builtin as much as it is 
an inferred enum, so should I just ... leave it like this, or wait for 
you to offer a better fix?

>>   
>>   
>>   def gen_events(schema: QAPISchema,
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 720449feee4d..d5f19732b516 100644
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
>> +        # definition.  For builtins (and their arrays), info is a null-object
>> +        # sentinel that evaluates to False. For implicitly defined entities,
>> +        # info points to a place that triggered the implicit definition
>> +        # (there may be more than one such place).
> 
> s/builtins/built-in types/
> 
> The meaning of "a null object sentinel" is less than clear.  Perhaps "a
> special object".
> 

OK.

>>           self.info = info
>>           self.doc = doc
>>           self._ifcond = ifcond or []
>> @@ -209,7 +210,7 @@ class QAPISchemaBuiltinType(QAPISchemaType):
>>       meta = 'built-in'
>>   
>>       def __init__(self, name, json_type, c_type):
>> -        super().__init__(name, None, None)
>> +        super().__init__(name, QAPISourceInfo.builtin(), None)
>>           assert not c_type or isinstance(c_type, str)
>>           assert json_type in ('string', 'number', 'int', 'boolean', 'null',
>>                                'value')
>> @@ -871,7 +872,7 @@ def resolve_type(self, name, info, what):
>>           return typ
>>   
>>       def _module_name(self, fname):
>> -        if fname is None:
>> +        if not fname:
>>               return None
>>           return os.path.relpath(fname, self._schema_dir)
>>   
> 
> Sure this hunk belongs to this patch?
> 

Accident.

"info and info.fname" does not behave the same with a falsey info object 
as it does when info was genuinely None; I compensated for that *here*, 
but I should have compensated for it elsewhere.

>> @@ -897,9 +898,11 @@ def _def_builtin_type(self, name, json_type, c_type):
>>           # be nice, but we can't as long as their generated code
>>           # (qapi-builtin-types.[ch]) may be shared by some other
>>           # schema.
>> -        self._make_array_type(name, None)
>> +        self._make_array_type(name, QAPISourceInfo.builtin())
>>   
>>       def _def_predefineds(self):
>> +        info = QAPISourceInfo.builtin()
>> +
> 
> Everything else gets its very own copy of the "no source info" object,
> except for the stuff defined here, which gets to share one.  Isn't that
> odd?
> 

It's also the only function where we define so many built-ins in the 
same place, so spiritually they do have the same SourceInfo, right? :)

(OK, no, it wasn't a conscious design choice, but it also seems 
harmless. I am going to assume you'd prefer I not do this?)

>>           for t in [('str',    'string',  'char' + POINTER_SUFFIX),
>>                     ('number', 'number',  'double'),
>>                     ('int',    'int',     'int64_t'),
>> @@ -917,15 +920,15 @@ def _def_predefineds(self):
>>                     ('null',   'null',    'QNull' + POINTER_SUFFIX)]:
>>               self._def_builtin_type(*t)
>>           self.the_empty_object_type = QAPISchemaObjectType(
>> -            'q_empty', None, None, None, None, None, [], None)
>> +            'q_empty', info, None, None, None, None, [], None)
>>           self._def_entity(self.the_empty_object_type)
>>   
>>           qtypes = ['none', 'qnull', 'qnum', 'qstring', 'qdict', 'qlist',
>>                     'qbool']
>>           qtype_values = self._make_enum_members(
>> -            [{'name': n} for n in qtypes], None)
>> +            [{'name': n} for n in qtypes], info)
>>   
>> -        self._def_entity(QAPISchemaEnumType('QType', None, None, None, None,
>> +        self._def_entity(QAPISchemaEnumType('QType', info, None, None, None,
>>                                               qtype_values, 'QTYPE'))
>>   
>>       def _make_features(self, features, info):
>> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
>> index 2b4916cdaa1b..a3a16284006b 100644
>> --- a/scripts/qapi/types.py
>> +++ b/scripts/qapi/types.py
>> @@ -71,7 +71,8 @@ def gen_enum(name: str,
>>                members: List[QAPISchemaEnumMember],
>>                prefix: Optional[str] = None) -> str:
>>       # append automatically generated _MAX value
>> -    enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
>> +    enum_members = members + [
>> +        QAPISchemaEnumMember('_MAX', QAPISourceInfo.builtin())]
>>   
>>       ret = mcgen('''
>>   
>> @@ -306,7 +307,7 @@ def _gen_type_cleanup(self, name: str) -> None:
>>   
>>       def visit_enum_type(self,
>>                           name: str,
>> -                        info: Optional[QAPISourceInfo],
>> +                        info: QAPISourceInfo,
>>                           ifcond: List[str],
>>                           features: List[QAPISchemaFeature],
>>                           members: List[QAPISchemaEnumMember],
>> @@ -317,7 +318,7 @@ def visit_enum_type(self,
>>   
>>       def visit_array_type(self,
>>                            name: str,
>> -                         info: Optional[QAPISourceInfo],
>> +                         info: QAPISourceInfo,
>>                            ifcond: List[str],
>>                            element_type: QAPISchemaType) -> None:
>>           with ifcontext(ifcond, self._genh, self._genc):
>> @@ -327,7 +328,7 @@ def visit_array_type(self,
>>   
>>       def visit_object_type(self,
>>                             name: str,
>> -                          info: Optional[QAPISourceInfo],
>> +                          info: QAPISourceInfo,
>>                             ifcond: List[str],
>>                             features: List[QAPISchemaFeature],
>>                             base: Optional[QAPISchemaObjectType],
>> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
>> index 339f1521524c..3f49c307c566 100644
>> --- a/scripts/qapi/visit.py
>> +++ b/scripts/qapi/visit.py
>> @@ -336,7 +336,7 @@ def _begin_user_module(self, name: str) -> None:
>>   
>>       def visit_enum_type(self,
>>                           name: str,
>> -                        info: QAPISourceInfo,
>> +                        info: Optional[QAPISourceInfo],
>>                           ifcond: List[str],
>>                           features: List[QAPISchemaFeature],
>>                           members: List[QAPISchemaEnumMember],
>> @@ -347,7 +347,7 @@ def visit_enum_type(self,
>>   
>>       def visit_array_type(self,
>>                            name: str,
>> -                         info: Optional[QAPISourceInfo],
>> +                         info: QAPISourceInfo,
>>                            ifcond: List[str],
>>                            element_type: QAPISchemaType) -> None:
>>           with ifcontext(ifcond, self._genh, self._genc):
>> @@ -356,7 +356,7 @@ def visit_array_type(self,
>>   
>>       def visit_object_type(self,
>>                             name: str,
>> -                          info: Optional[QAPISourceInfo],
>> +                          info: QAPISourceInfo,
>>                             ifcond: List[str],
>>                             features: List[QAPISchemaFeature],
>>                             base: Optional[QAPISchemaObjectType],


