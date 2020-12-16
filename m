Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45402DBB4C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:39:45 +0100 (CET)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQTR-0005KO-11
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpQP3-0002pN-A3
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpQP0-0006qh-5N
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608100508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZIJQ6bmsZAUFkOz3riWBHoSJ5Iama+0YQFfCfnUBYss=;
 b=SiMM7uIS6LPmQxMNmc/U8h5WeNwyLBCSWgDnqFzrOy84WFUywf+g7wCCDS6jWNWL9KouHb
 gnCZxGu9mFVRLghgwc0KPi8FwrpOn9tOoISlNUvu60S68UoWiv+wXeKxttL//jKjmoVKuR
 XFOtjHmApHvTGJgkPxelJFUA9iw0px4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-P3lS4Q4rMgywqiR7u_69RA-1; Wed, 16 Dec 2020 01:35:05 -0500
X-MC-Unique: P3lS4Q4rMgywqiR7u_69RA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F9B7180A086
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 06:35:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AFA85D9D7;
 Wed, 16 Dec 2020 06:35:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB30A11329A5; Wed, 16 Dec 2020 07:35:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 07/11] qapi/introspect.py: Unify return type of
 _make_tree()
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-8-jsnow@redhat.com>
 <87blfx1voe.fsf@dusky.pond.sub.org>
 <c760e550-3b53-5ef4-2827-ad0096b695c9@redhat.com>
Date: Wed, 16 Dec 2020 07:35:02 +0100
In-Reply-To: <c760e550-3b53-5ef4-2827-ad0096b695c9@redhat.com> (John Snow's
 message of "Mon, 7 Dec 2020 19:06:34 -0500")
Message-ID: <87k0tiw961.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 11/16/20 4:46 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Returning two different types conditionally can be complicated to
>>> type. Let's always return a tuple for consistency. Prohibit the use of
>>> annotations with dict-values in this circumstance. It can be implemented
>>> later if and when the need for it arises.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/introspect.py | 21 ++++++++++++---------
>>>   1 file changed, 12 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>> index 16282f2634b..ef469b6c06e 100644
>>> --- a/scripts/qapi/introspect.py
>>> +++ b/scripts/qapi/introspect.py
>>> @@ -77,14 +77,12 @@
>>>   
>>>   def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>>>                  extra: Optional[Annotations] = None
>>> -               ) -> TreeValue:
>>> +               ) -> Annotated:
>>>       if extra is None:
>>>           extra = {}
>>>       if ifcond:
>>>           extra['if'] = ifcond
>>> -    if extra:
>>> -        return (obj, extra)
>>> -    return obj
>>> +    return (obj, extra)
>> 
>> Less efficient, but that's okay.
>> 
>
> I have bad news about Python :)

Well played, sir!

>>>   
>>>   
>>>   def _tree_to_qlit(obj: TreeValue,
>>> @@ -98,12 +96,16 @@ def indent(level: int) -> str:
>>>           ifobj, extra = obj
>>>           ifcond = cast(Optional[Sequence[str]], extra.get('if'))
>>>           comment = extra.get('comment')
>>> +
>>> +        msg = "Comments and Conditionals not implemented for dict values"
>>> +        assert not (suppress_first_indent and (ifcond or comment)), msg
>> 
>> What exactly does this assertion guard?
>> 
>
> Something that Eduardo noticed in his review. It's ugly, and I explained 
> it poorly.
>
> We don't support annotations on dict *values*, basically. When this 
> function is called with suppress_first_indent, we know that we are being 
> called to process a dict *value* and not a dict *key*.
>
> What do you do with comments or conditionals on just one half of a key: 
> value pair?
>
> Well, break.

Your @msg is a bit misleading then: it suggests comments and
conditionals are not implemented for dict values, but could be.  Not
true for conditionals.

Minimally invasive patch correction: drop @msg.

But the actual impossibility to guard against is even simpler, I
believe:

          if isinstance(obj, tuple):
              assert not suppress_first_indent

But^2, I figure this can be made truly impossible: factor out the part
of _tree_to_qlit() that deals with non-tuple @obj into its own function
(the conditional at its end), then use that for the dict values.

>>> +
>>>           ret = ''
>>>           if comment:
>>>               ret += indent(level) + '/* %s */\n' % comment
>>>           if ifcond:
>>>               ret += gen_if(ifcond)
>>> -        ret += _tree_to_qlit(ifobj, level)
>>> +        ret += _tree_to_qlit(ifobj, level, suppress_first_indent)
>> 
>> Why do you need to pass on @suppress_first_indent now?
>> 
>
> We either never should or we always should have. This is just in the 
> case that "suppress first indent" is used on an annotated node. Which, 
> err, for the annotations we actually support right now (comment, ifcond) 
> -- we will reject in this case.
>
> But it felt precarious...

I suspect the factoring I suggested above will make this less
precarious, too.

>>>           if ifcond:
>>>               ret += '\n' + gen_endif(ifcond)
>>>           return ret
>>> @@ -152,7 +154,7 @@ def __init__(self, prefix: str, unmask: bool):
>>>               ' * QAPI/QMP schema introspection', __doc__)
>>>           self._unmask = unmask
>>>           self._schema: Optional[QAPISchema] = None
>>> -        self._trees: List[TreeValue] = []
>>> +        self._trees: List[Annotated] = []
>>>           self._used_types: List[QAPISchemaType] = []
>>>           self._name_map: Dict[str, str] = {}
>>>           self._genc.add(mcgen('''
>>> @@ -219,7 +221,8 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>>>   
>>>       @classmethod
>>>       def _gen_features(cls,
>>> -                      features: List[QAPISchemaFeature]) -> List[TreeValue]:
>>> +                      features: List[QAPISchemaFeature]
>>> +                      ) -> List[Annotated]:
>>>           return [_make_tree(f.name, f.ifcond) for f in features]
>>>   
>>>       def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>> @@ -239,7 +242,7 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>>           self._trees.append(_make_tree(obj, ifcond, extra))
>>>   
>>>       def _gen_member(self,
>>> -                    member: QAPISchemaObjectTypeMember) -> TreeValue:
>>> +                    member: QAPISchemaObjectTypeMember) -> Annotated:
>>>           obj: _DObject = {
>>>               'name': member.name,
>>>               'type': self._use_type(member.type)
>>> @@ -255,7 +258,7 @@ def _gen_variants(self, tag_name: str,
>>>           return {'tag': tag_name,
>>>                   'variants': [self._gen_variant(v) for v in variants]}
>>>   
>>> -    def _gen_variant(self, variant: QAPISchemaVariant) -> TreeValue:
>>> +    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated:
>>>           obj: _DObject = {
>>>               'case': variant.name,
>>>               'type': self._use_type(variant.type)


