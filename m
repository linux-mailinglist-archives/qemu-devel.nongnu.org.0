Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE242DB3F7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:50:38 +0100 (CET)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFPA-00075T-FN
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpFNy-0006G9-04
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:49:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpFNv-0000GT-Qc
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608058158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lvd9MhEUoiKIgdpBRSdm9wAsjRYZPcmYCOpidoT0zgs=;
 b=A+j1r06RPd0X7BljAlJrymz0LetmiMT8T7qEQL0BAKIZ6Pf0qZxgQ3hFmq6fXqzwf7SzR/
 xWN8EXt2SoAg4CTnJ3XmYSFHBxPurnGgUnAXNK+OX2ko6/HXOUaGrRlaKOeLuJkLddXIGl
 s0d29J+MIBlcqHvlITSrKSjIgGbt0+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-u3kHlrybOvuXNAR21z6VHQ-1; Tue, 15 Dec 2020 13:49:16 -0500
X-MC-Unique: u3kHlrybOvuXNAR21z6VHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DB0B1800D42
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:49:15 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DCA11E5;
 Tue, 15 Dec 2020 18:49:14 +0000 (UTC)
Subject: Re: [PATCH v2 06/11] qapi/introspect.py: add _gen_features helper
To: Markus Armbruster <armbru@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-7-jsnow@redhat.com> <87k0ul1ydu.fsf@dusky.pond.sub.org>
 <3b1186c1-c927-9d02-126b-c15d372ae97c@redhat.com>
 <87h7onypox.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <2eef69ab-25fb-7ba6-8230-f1c606379fd3@redhat.com>
Date: Tue, 15 Dec 2020 13:49:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87h7onypox.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 11:55 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 11/16/20 3:47 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> _make_tree might receive a dict or some other type.
>>>
>>> Are you talking about @obj?
>>>
>>
>> Yes.
> 
> Recommend to be explict: _make_tree()'s first argument can be ...
> 
>>       It *usually* takes a dict. sometimes it doesn't.
> 
> Yes.  It takes an abstract syntax tree: dict for JSON object, list for
> JSON array, str for JSON string, bool for JSON true and false, NoneType
> for JSON none.  JSON int isn't implemented, because it doesn't occur in
> SchemaInfo.
> 
>>>>                                                       Adding features
>>>> information should arguably be performed by the caller at such a time
>>>> when we know the type of the object and don't have to re-interrogate it.
>>>
>>> Fair enough.  There are just two such callers anyway.
>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/introspect.py | 19 ++++++++++++-------
>>>>    1 file changed, 12 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>>> index 803288a64e7..16282f2634b 100644
>>>> --- a/scripts/qapi/introspect.py
>>>> +++ b/scripts/qapi/introspect.py
>>>> @@ -76,16 +76,12 @@
>>>>    
>>>>    
>>>>    def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>>>> -               features: List[QAPISchemaFeature],
>>>>                   extra: Optional[Annotations] = None
>>>>                   ) -> TreeValue:
>>>>        if extra is None:
>>>>            extra = {}
>>>>        if ifcond:
>>>>            extra['if'] = ifcond
>>>> -    if features:
>>>> -        assert isinstance(obj, dict)
>>>> -        obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
>>>>        if extra:
>>>>            return (obj, extra)
>>>>        return obj
>>>> @@ -221,6 +217,11 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>>>>                return '[' + self._use_type(typ.element_type) + ']'
>>>>            return self._name(typ.name)
>>>>    
>>>> +    @classmethod
>>>> +    def _gen_features(cls,
>>>> +                      features: List[QAPISchemaFeature]) -> List[TreeValue]:
>>>> +        return [_make_tree(f.name, f.ifcond) for f in features]
>>>> +
>>>
>>> Ignorant question: when to use @classmethod, and when to use
>>> @staticmethod?
>>
>> Matter of taste. My preference is to just always use @classmethod,
>> because they can be extended or referenced by subclasses.
> 
> Non-issue here, sub-classes are vanishingly unlikely.
> 

True. I did admit it was just simply my default. I can adjust it 
case-by-case for circumstances when ...

>> @staticmethod does not take a class argument, @classmethod does. Static
>> methods therefore cannot address any other classmethods, but a
>> classmethod can.
>>
>> I just always reach for classmethod by default.
> 
> Unused cls parameters are slightly annoying, though.
> 
> I've been using @staticmethod whenever it suffices.  Makes "this is a
> function, i.e. it can't mess with the class or instances" immediately
> obvious.
> 

... you feel it provides additional clarity to do so.

--js


