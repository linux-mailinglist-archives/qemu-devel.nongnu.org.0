Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071D18A111
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 18:03:16 +0100 (CET)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEc67-0006Mz-Ao
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 13:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEc4o-0005WD-Ml
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEc4j-0007RF-Ke
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:01:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:56700)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEc4j-0007QX-GL
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584550909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wppJs5a/IO1HYySqijTbFagpgJGz7Xgr12zBKPn5+U=;
 b=WkrVD1Zge3O09WBupfnALcVir58KnA1/yV0HVM7Uk4vh4uBHOdb3WNHQpRAfWktkk44I30
 B98QslTtun5hMLu7ATlDQqqStpjJBI5/cxK6Jl86yb4Am9Av4hkZFa4mqERfkhjZrGQMhg
 cBiPxmXzKbnFblcY4bj5SXsydgZwkm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-_0k2n7hOOdSneMk4arxF3Q-1; Wed, 18 Mar 2020 13:01:45 -0400
X-MC-Unique: _0k2n7hOOdSneMk4arxF3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CA6D800D5C;
 Wed, 18 Mar 2020 17:01:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2849C5D9E2;
 Wed, 18 Mar 2020 17:01:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7BD41138404; Wed, 18 Mar 2020 18:01:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 30/34] qapi: Implement deprecated-output=hide for QMP
 event data
References: <20200317115459.31821-1-armbru@redhat.com>
 <20200317115459.31821-31-armbru@redhat.com>
 <0b746eff-9e7f-6ff7-c3f2-64b6c27f2b20@redhat.com>
Date: Wed, 18 Mar 2020 18:01:42 +0100
In-Reply-To: <0b746eff-9e7f-6ff7-c3f2-64b6c27f2b20@redhat.com> (Eric Blake's
 message of "Wed, 18 Mar 2020 10:20:16 -0500")
Message-ID: <87pnd938cp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/17/20 6:54 AM, Markus Armbruster wrote:
>> This policy suppresses deprecated bits in output, and thus permits
>> "testing the future".  Implement it for QMP event data: suppress
>> deprecated members.
>>
>> No QMP event data is deprecated right now.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +static void test_event_deprecated_data(TestEventData *data, const void =
*unused)
>> +{
>> +    memset(&compat_policy, 0, sizeof(compat_policy));
>> +
>> +    data->expect =3D qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FE=
ATURES0',"
>> +                                           " 'data': { 'foo': 42 } }");
>> +    qapi_event_send_test_event_features0(42);
>> +    g_assert(data->emitted);
>> +
>> +    qobject_unref(data->expect);
>> +
>> +    compat_policy.deprecated_output =3D COMPAT_POLICY_OUTPUT_HIDE;
>
> Again, playing fast-and-loose with compat_policy.has_deprecated_output.

I'll clean it up.

>> +++ b/scripts/qapi/events.py
>> @@ -104,7 +104,7 @@ def gen_event_send(name, arg_type, features, boxed,
>>         if have_args:
>>           ret +=3D mcgen('''
>> -    v =3D qobject_output_visitor_new(&obj);
>> +    v =3D qobject_output_visitor_new_qmp(&obj);
>>   ''')
>>           if not arg_type.is_implicit():
>>               ret +=3D mcgen('''
>> @@ -123,7 +123,11 @@ def gen_event_send(name, arg_type, features, boxed,
>>           ret +=3D mcgen('''
>>         visit_complete(v, &obj);
>> -    qdict_put_obj(qmp, "data", obj);
>> +    if (qdict_size(qobject_to(QDict, obj))) {
>> +        qdict_put_obj(qmp, "data", obj);
>> +    } else {
>> +        qobject_unref(obj);
>> +    }
>
> So you'd rather omit data altogether than emit "data":{} when all
> deprecated members disappear.  Fair enough; both approaches work.

I initially didn't do this until my testing demonstrated that "data"
goes away entirely when I delete the last member from the schema.  To
actually fulfill the "test the future" mission, I need policy hide drop
data, too.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


