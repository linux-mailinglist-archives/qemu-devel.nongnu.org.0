Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6218A109
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 18:01:00 +0100 (CET)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEc3v-0004Xm-Es
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 13:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEc2u-00040d-0L
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 12:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEc2r-0000Xg-Vj
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 12:59:55 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:24685)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEc2r-0000WH-It
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 12:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584550793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owdXQjGkNmw1HYhSSNmoz0HYc13IaE+76lrSK5+LSHQ=;
 b=LNNDbc/NEzH273IgTbJXTBah4mO4DE1nlXq2l7n+mwuVROzMqVpV2LJvaPPYjFisPX5rfa
 RwWy/jYoN+IuvWtNWc5AaIMrlE8Jk1ju4FekQemdxPkwI/u2GCEIIbT14pvU0ODRxnubx6
 houn1Xd9WGkIDhZCYoH79suypQHY6zI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-rBRTgbubMk-uDyTlcK2V-Q-1; Wed, 18 Mar 2020 12:59:36 -0400
X-MC-Unique: rBRTgbubMk-uDyTlcK2V-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DB97800D4E;
 Wed, 18 Mar 2020 16:59:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C20B6EF85;
 Wed, 18 Mar 2020 16:59:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AAB991138404; Wed, 18 Mar 2020 17:59:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 29/34] qapi: Implement deprecated-output=hide for QMP
 events
References: <20200317115459.31821-1-armbru@redhat.com>
 <20200317115459.31821-30-armbru@redhat.com>
 <c8b780c9-8a82-bea2-61b5-14aab90f476d@redhat.com>
Date: Wed, 18 Mar 2020 17:59:31 +0100
In-Reply-To: <c8b780c9-8a82-bea2-61b5-14aab90f476d@redhat.com> (Eric Blake's
 message of "Wed, 18 Mar 2020 07:29:03 -0500")
Message-ID: <87v9n138gc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
>> "testing the future".  Implement it for QMP events: suppress
>> deprecated ones.
>>
>> No QMP event is deprecated right now.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> @@ -140,6 +141,23 @@ static void test_event_d(TestEventData *data,
>>       qobject_unref(data->expect);
>>   }
>>   +static void test_event_deprecated(TestEventData *data, const void
>> *unused)
>> +{
>> +    data->expect =3D qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FE=
ATURES1' }");
>> +
>> +    memset(&compat_policy, 0, sizeof(compat_policy));
>> +
>> +    qapi_event_send_test_event_features1();
>> +    g_assert(data->emitted);
>> +
>> +    compat_policy.deprecated_output =3D COMPAT_POLICY_OUTPUT_HIDE;
>
> Umm, did you forget to set compat_policy.has_deprecated_output =3D true?

I did.  Works anyway, because I don't bother checking it.  I'll clean it
up.

> (proof that we really want QAPI defaults to be working, to get rid of
> pointless has_* members...)
>
>> +    data->emitted =3D false;
>> +    qapi_event_send_test_event_features1();
>> +    g_assert(!data->emitted);
>> +
>> +    qobject_unref(data->expect);
>> +}
>> +
>
>> +++ b/scripts/qapi/events.py
>> @@ -61,7 +61,8 @@ def gen_param_var(typ):
>>       return ret
>>     -def gen_event_send(name, arg_type, boxed, event_enum_name,
>> event_emit):
>> +def gen_event_send(name, arg_type, features, boxed,
>> +                   event_enum_name, event_emit):
>>       # FIXME: Our declaration of local variables (and of 'errp' in the
>>       # parameter list) can collide with exploded members of the event's
>>       # data type passed in as parameters.  If this collision ever hits =
in
>> @@ -86,6 +87,14 @@ def gen_event_send(name, arg_type, boxed, event_enum_=
name, event_emit):
>>           if not boxed:
>>               ret +=3D gen_param_var(arg_type)
>>   +    if 'deprecated' in [f.name for f in features]:
>> +        ret +=3D mcgen('''
>> +
>> +    if (compat_policy.deprecated_output =3D=3D COMPAT_POLICY_OUTPUT_HID=
E) {
>> +        return;
>
> Here, you took the shortcut that if we always 0-initialize,
> deprecated_output will never be true except when has_deprecated_output
> is also true.  But the test above violated that rule of thumb.

Generated code ensures FOO is zero when !has_FOO.  Manual code should do
the same.

The pedantically correct check

    has_FOO && FOO =3D=3D some_non_zero_value

can then safely be abbreviated to just

    FOO =3D=3D some_non_zero_value

which I find less turing and more more legible.

> Otherwise, this patch makes sense.

Thanks!


