Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3AC2D1EC3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:04:37 +0100 (CET)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQUe-0002ns-RP
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmQNf-0005tz-Ai
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:57:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmQNb-0004c7-GE
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607385438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjybVj2Jb0pCzPXECdZGk2RuC2qYpLldP1fNhKc5rtc=;
 b=Vstt/lyfuI5k2KWto93cwm7IfRppWGTzOXO9WorU2LwUul65j7Bth3Rg+7I6WEWLVPd7Ym
 1Fvj+QHtnDuWYHAesDNHNCxfJC2VRqDOPTsORLdFgo4rPxQqPW0OGBmpw1nP2jTJWz86xR
 gXuT3Ku8WMMjUrQpYAU33mTkKni7QVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-ICvpgSkqN2-9MLlV3nGC0g-1; Mon, 07 Dec 2020 18:57:16 -0500
X-MC-Unique: ICvpgSkqN2-9MLlV3nGC0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 224C0803652
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 23:57:15 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B81260BE2;
 Mon,  7 Dec 2020 23:57:13 +0000 (UTC)
Subject: Re: [PATCH v2 06/11] qapi/introspect.py: add _gen_features helper
To: Markus Armbruster <armbru@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-7-jsnow@redhat.com> <87k0ul1ydu.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <3b1186c1-c927-9d02-126b-c15d372ae97c@redhat.com>
Date: Mon, 7 Dec 2020 18:57:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87k0ul1ydu.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 3:47 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> _make_tree might receive a dict or some other type.
> 
> Are you talking about @obj?
> 

Yes. It *usually* takes a dict. sometimes it doesn't.

>>                                                      Adding features
>> information should arguably be performed by the caller at such a time
>> when we know the type of the object and don't have to re-interrogate it.
> 
> Fair enough.  There are just two such callers anyway.
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 803288a64e7..16282f2634b 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -76,16 +76,12 @@
>>   
>>   
>>   def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>> -               features: List[QAPISchemaFeature],
>>                  extra: Optional[Annotations] = None
>>                  ) -> TreeValue:
>>       if extra is None:
>>           extra = {}
>>       if ifcond:
>>           extra['if'] = ifcond
>> -    if features:
>> -        assert isinstance(obj, dict)
>> -        obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
>>       if extra:
>>           return (obj, extra)
>>       return obj
>> @@ -221,6 +217,11 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>>               return '[' + self._use_type(typ.element_type) + ']'
>>           return self._name(typ.name)
>>   
>> +    @classmethod
>> +    def _gen_features(cls,
>> +                      features: List[QAPISchemaFeature]) -> List[TreeValue]:
>> +        return [_make_tree(f.name, f.ifcond) for f in features]
>> +
> 
> Ignorant question: when to use @classmethod, and when to use
> @staticmethod?
> 

Matter of taste. My preference is to just always use @classmethod, 
because they can be extended or referenced by subclasses.

@staticmethod does not take a class argument, @classmethod does. Static 
methods therefore cannot address any other classmethods, but a 
classmethod can.

I just always reach for classmethod by default.

>>       def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>                     ifcond: List[str],
>>                     features: Optional[List[QAPISchemaFeature]]) -> None:
>> @@ -233,7 +234,9 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>               name = self._name(name)
>>           obj['name'] = name
>>           obj['meta-type'] = mtype
>> -        self._trees.append(_make_tree(obj, ifcond, features, extra))
>> +        if features:
>> +            obj['features'] = self._gen_features(features)
>> +        self._trees.append(_make_tree(obj, ifcond, extra))
>>   
>>       def _gen_member(self,
>>                       member: QAPISchemaObjectTypeMember) -> TreeValue:
> 
> No change when not features.  Else, you change
> 
>      obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
> 
> to
> 
>      obj['features'] = [_make_tree(f.name, f.ifcond) for f in features]
> 

Yep. I am consolidating the logic for (node, annotation) in so doing.

> where
> 
>      _make_tree(f.name, f.ifcond)
>      = (f.name, {'if': f.ifcond})       if f.ifcond
>      = f.name                           else
> 
> Works, and feels less lazy.  However, the commit message did not prepare
> me for this.  If you split this off into its own patch, you can describe
> it properly.
> 

OK.

>> @@ -243,7 +246,9 @@ def _gen_member(self,
>>           }
>>           if member.optional:
>>               obj['default'] = None
>> -        return _make_tree(obj, member.ifcond, member.features)
>> +        if member.features:
>> +            obj['features'] = self._gen_features(member.features)
>> +        return _make_tree(obj, member.ifcond)
>>   
>>       def _gen_variants(self, tag_name: str,
>>                         variants: List[QAPISchemaVariant]) -> _DObject:
>> @@ -255,7 +260,7 @@ def _gen_variant(self, variant: QAPISchemaVariant) -> TreeValue:
>>               'case': variant.name,
>>               'type': self._use_type(variant.type)
>>           }
>> -        return _make_tree(obj, variant.ifcond, None)
>> +        return _make_tree(obj, variant.ifcond)
>>   
>>       def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>>                              json_type: str) -> None:


