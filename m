Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC962DB1F8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:57:48 +0100 (CET)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDdy-0005MR-My
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpDbh-0004nB-TY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:55:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpDbb-00082I-4V
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608051317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ZEQrqlDMAQXD6icep9k0VIxWBtR93DfoBq4lyDyi9E=;
 b=DFXFdf5fsjgCopcJBPRe2IpsDUu2jdcSiXFWPY8NBNPOgj8tjK79wMI13MGu/DMTlHAOzT
 devllFw8QpMfKo1E9uYZdsOQQRFWeTNvd0+6n+M/FbZh7zNmGPffjrQdwonPThFtzdilFr
 X3Q9jn1spwnQVlYcNdB4CpNgMvPI+tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-24r3BK1tPwyfVnjWdZ8pOA-1; Tue, 15 Dec 2020 11:55:13 -0500
X-MC-Unique: 24r3BK1tPwyfVnjWdZ8pOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D72610054FF
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 16:55:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C59D1E5;
 Tue, 15 Dec 2020 16:55:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D75CB11329A5; Tue, 15 Dec 2020 17:55:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 06/11] qapi/introspect.py: add _gen_features helper
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-7-jsnow@redhat.com>
 <87k0ul1ydu.fsf@dusky.pond.sub.org>
 <3b1186c1-c927-9d02-126b-c15d372ae97c@redhat.com>
Date: Tue, 15 Dec 2020 17:55:10 +0100
In-Reply-To: <3b1186c1-c927-9d02-126b-c15d372ae97c@redhat.com> (John Snow's
 message of "Mon, 7 Dec 2020 18:57:13 -0500")
Message-ID: <87h7onypox.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

> On 11/16/20 3:47 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> _make_tree might receive a dict or some other type.
>> 
>> Are you talking about @obj?
>> 
>
> Yes.

Recommend to be explict: _make_tree()'s first argument can be ...

>      It *usually* takes a dict. sometimes it doesn't.

Yes.  It takes an abstract syntax tree: dict for JSON object, list for
JSON array, str for JSON string, bool for JSON true and false, NoneType
for JSON none.  JSON int isn't implemented, because it doesn't occur in
SchemaInfo.

>>>                                                      Adding features
>>> information should arguably be performed by the caller at such a time
>>> when we know the type of the object and don't have to re-interrogate it.
>> 
>> Fair enough.  There are just two such callers anyway.
>> 
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/introspect.py | 19 ++++++++++++-------
>>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>> index 803288a64e7..16282f2634b 100644
>>> --- a/scripts/qapi/introspect.py
>>> +++ b/scripts/qapi/introspect.py
>>> @@ -76,16 +76,12 @@
>>>   
>>>   
>>>   def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>>> -               features: List[QAPISchemaFeature],
>>>                  extra: Optional[Annotations] = None
>>>                  ) -> TreeValue:
>>>       if extra is None:
>>>           extra = {}
>>>       if ifcond:
>>>           extra['if'] = ifcond
>>> -    if features:
>>> -        assert isinstance(obj, dict)
>>> -        obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
>>>       if extra:
>>>           return (obj, extra)
>>>       return obj
>>> @@ -221,6 +217,11 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>>>               return '[' + self._use_type(typ.element_type) + ']'
>>>           return self._name(typ.name)
>>>   
>>> +    @classmethod
>>> +    def _gen_features(cls,
>>> +                      features: List[QAPISchemaFeature]) -> List[TreeValue]:
>>> +        return [_make_tree(f.name, f.ifcond) for f in features]
>>> +
>> 
>> Ignorant question: when to use @classmethod, and when to use
>> @staticmethod?
>
> Matter of taste. My preference is to just always use @classmethod, 
> because they can be extended or referenced by subclasses.

Non-issue here, sub-classes are vanishingly unlikely.

> @staticmethod does not take a class argument, @classmethod does. Static 
> methods therefore cannot address any other classmethods, but a 
> classmethod can.
>
> I just always reach for classmethod by default.

Unused cls parameters are slightly annoying, though.

I've been using @staticmethod whenever it suffices.  Makes "this is a
function, i.e. it can't mess with the class or instances" immediately
obvious.

[...]


