Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451A2D1EC7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:08:24 +0100 (CET)
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQYJ-0005Zp-6a
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmQWh-0004mj-3Y
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmQWe-0007lo-Im
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607385999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+KBgW0k/QIA7ULFLGo4bjK/m/u2/sJ6q3iKzUMJf7nM=;
 b=UpjA7rcsIgcvE0q1+bP0xx8lSc9fmpYg1aMCHFZfzERkCbTivUHqj367LGXZmq09Y2Z6T5
 2anhBiQLOxBUvBMhrLjbelYccwGSIvkv01cHRhRpDvXdl2d+qC0KqWdDOabOM8Q9IRA0CT
 w2kS8/KXqsNTNbBF/n/O9QLlQndpZFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-amxGHUv5N1Gf2DxGM17SUg-1; Mon, 07 Dec 2020 19:06:37 -0500
X-MC-Unique: amxGHUv5N1Gf2DxGM17SUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4763E10054FF
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 00:06:36 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFC4060853;
 Tue,  8 Dec 2020 00:06:35 +0000 (UTC)
Subject: Re: [PATCH v2 07/11] qapi/introspect.py: Unify return type of
 _make_tree()
To: Markus Armbruster <armbru@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-8-jsnow@redhat.com> <87blfx1voe.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c760e550-3b53-5ef4-2827-ad0096b695c9@redhat.com>
Date: Mon, 7 Dec 2020 19:06:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87blfx1voe.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 4:46 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Returning two different types conditionally can be complicated to
>> type. Let's always return a tuple for consistency. Prohibit the use of
>> annotations with dict-values in this circumstance. It can be implemented
>> later if and when the need for it arises.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 21 ++++++++++++---------
>>   1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 16282f2634b..ef469b6c06e 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -77,14 +77,12 @@
>>   
>>   def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>>                  extra: Optional[Annotations] = None
>> -               ) -> TreeValue:
>> +               ) -> Annotated:
>>       if extra is None:
>>           extra = {}
>>       if ifcond:
>>           extra['if'] = ifcond
>> -    if extra:
>> -        return (obj, extra)
>> -    return obj
>> +    return (obj, extra)
> 
> Less efficient, but that's okay.
> 

I have bad news about Python :)

>>   
>>   
>>   def _tree_to_qlit(obj: TreeValue,
>> @@ -98,12 +96,16 @@ def indent(level: int) -> str:
>>           ifobj, extra = obj
>>           ifcond = cast(Optional[Sequence[str]], extra.get('if'))
>>           comment = extra.get('comment')
>> +
>> +        msg = "Comments and Conditionals not implemented for dict values"
>> +        assert not (suppress_first_indent and (ifcond or comment)), msg
> 
> What exactly does this assertion guard?
> 

Something that Eduardo noticed in his review. It's ugly, and I explained 
it poorly.

We don't support annotations on dict *values*, basically. When this 
function is called with suppress_first_indent, we know that we are being 
called to process a dict *value* and not a dict *key*.

What do you do with comments or conditionals on just one half of a key: 
value pair?

Well, break.

>> +
>>           ret = ''
>>           if comment:
>>               ret += indent(level) + '/* %s */\n' % comment
>>           if ifcond:
>>               ret += gen_if(ifcond)
>> -        ret += _tree_to_qlit(ifobj, level)
>> +        ret += _tree_to_qlit(ifobj, level, suppress_first_indent)
> 
> Why do you need to pass on @suppress_first_indent now?
> 

We either never should or we always should have. This is just in the 
case that "suppress first indent" is used on an annotated node. Which, 
err, for the annotations we actually support right now (comment, ifcond) 
-- we will reject in this case.

But it felt precarious...

>>           if ifcond:
>>               ret += '\n' + gen_endif(ifcond)
>>           return ret
>> @@ -152,7 +154,7 @@ def __init__(self, prefix: str, unmask: bool):
>>               ' * QAPI/QMP schema introspection', __doc__)
>>           self._unmask = unmask
>>           self._schema: Optional[QAPISchema] = None
>> -        self._trees: List[TreeValue] = []
>> +        self._trees: List[Annotated] = []
>>           self._used_types: List[QAPISchemaType] = []
>>           self._name_map: Dict[str, str] = {}
>>           self._genc.add(mcgen('''
>> @@ -219,7 +221,8 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>>   
>>       @classmethod
>>       def _gen_features(cls,
>> -                      features: List[QAPISchemaFeature]) -> List[TreeValue]:
>> +                      features: List[QAPISchemaFeature]
>> +                      ) -> List[Annotated]:
>>           return [_make_tree(f.name, f.ifcond) for f in features]
>>   
>>       def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>> @@ -239,7 +242,7 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>           self._trees.append(_make_tree(obj, ifcond, extra))
>>   
>>       def _gen_member(self,
>> -                    member: QAPISchemaObjectTypeMember) -> TreeValue:
>> +                    member: QAPISchemaObjectTypeMember) -> Annotated:
>>           obj: _DObject = {
>>               'name': member.name,
>>               'type': self._use_type(member.type)
>> @@ -255,7 +258,7 @@ def _gen_variants(self, tag_name: str,
>>           return {'tag': tag_name,
>>                   'variants': [self._gen_variant(v) for v in variants]}
>>   
>> -    def _gen_variant(self, variant: QAPISchemaVariant) -> TreeValue:
>> +    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated:
>>           obj: _DObject = {
>>               'case': variant.name,
>>               'type': self._use_type(variant.type)


