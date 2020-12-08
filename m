Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4662D1ECD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:14:17 +0100 (CET)
Received: from localhost ([::1]:42354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQdz-0006v3-Fu
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmQcA-0006Ui-Ng
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmQc8-0001OB-TD
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607386339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bOX26qlUdzowRQpYn5ukc4ANeM6X//okrmLTiA2xzA=;
 b=A6nDj3mRaDmsSUERQqFi8W5QIs3335kCQsXyVM0QhqgbicW59BBXOM0u+z616Y1zrXVusN
 nAFu0RmSfbOlt+H277s/SAQdJamP5T/qwRS2SsJSWY3AzVHnYOa9HFgmWqixqaWwG7Dew8
 ivahX3/Yulmm6bEkC6CyuW+j+QMne+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-Hynm012zOiK7B3gjDRj8Kg-1; Mon, 07 Dec 2020 19:12:18 -0500
X-MC-Unique: Hynm012zOiK7B3gjDRj8Kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26A369CDA2
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 00:12:17 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92A215C1A1;
 Tue,  8 Dec 2020 00:12:16 +0000 (UTC)
Subject: Re: [PATCH v2 08/11] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
To: Markus Armbruster <armbru@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-9-jsnow@redhat.com> <875z651v8h.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <41e0e0e8-e7ac-173e-c3bb-33a2ee9d26f8@redhat.com>
Date: Mon, 7 Dec 2020 19:12:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <875z651v8h.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On 11/16/20 4:55 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> This is only used to pass in a dictionary with a comment already set, so
>> skip the runaround and just accept the comment.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index ef469b6c06e..a0978cb3adb 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -76,12 +76,11 @@
>>   
>>   
>>   def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>> -               extra: Optional[Annotations] = None
>> -               ) -> Annotated:
>> -    if extra is None:
>> -        extra = {}
>> -    if ifcond:
>> -        extra['if'] = ifcond
>> +               comment: Optional[str] = None) -> Annotated:
>> +    extra: Annotations = {
>> +        'if': ifcond,
>> +        'comment': comment,
>> +    }
> 
> Works because _tree_to_qlit() treats 'if': None, 'comment': None exactly
> like absent 'if', 'comment'.  Mentioning this in the commit message
> wouldn't hurt.
> 

OK.

> We create even more dicts now.  Okay.
> 

It's just shuffling around where this dict is made, I don't think we 
create more in total.

>>       return (obj, extra)
>>   
>>   
>> @@ -228,18 +227,18 @@ def _gen_features(cls,
>>       def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>                     ifcond: List[str],
>>                     features: Optional[List[QAPISchemaFeature]]) -> None:
>> -        extra: Optional[Annotations] = None
>> +        comment: Optional[str] = None
>>           if mtype not in ('command', 'event', 'builtin', 'array'):
>>               if not self._unmask:
>>                   # Output a comment to make it easy to map masked names
>>                   # back to the source when reading the generated output.
>> -                extra = {'comment': '"%s" = %s' % (self._name(name), name)}
>> +                comment = f'"{self._name(name)}" = {name}'
> 
> Drive-by modernization, fine with me.  Aside: many more opportunities; a
> systematic hunt is called for.  Not now.
> 

It happened because of line-length limits, admittedly.

>>               name = self._name(name)
>>           obj['name'] = name
>>           obj['meta-type'] = mtype
>>           if features:
>>               obj['features'] = self._gen_features(features)
>> -        self._trees.append(_make_tree(obj, ifcond, extra))
>> +        self._trees.append(_make_tree(obj, ifcond, comment))
>>   
>>       def _gen_member(self,
>>                       member: QAPISchemaObjectTypeMember) -> Annotated:


