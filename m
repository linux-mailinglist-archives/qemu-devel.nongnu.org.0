Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6252B903D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:40:33 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhMe-0008UA-8h
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfhLY-000833-Kd
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:39:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfhLW-0001Kv-1F
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605782360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFRVWHp60SQw3IiJJBMYgsSwCytkhwWkOj9mcUdUW40=;
 b=IOGmV3MRBsT8t3YlWj2zn/4zNnB8PLg4v6+ut9BYxVl+j7e9llB238zW87bbb3SXSibZ9t
 ScsWn98zl8kAxBYsjK67lzw9jOTG1jX4eKT3ihKX0RqglGOwD55KXuYOH8Ya/KtFjOAOL4
 KfMEzkk14P3FTnWuubIXtJMSqZ+lOt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-nOOEEOVGPqaffqqDf1HKuw-1; Thu, 19 Nov 2020 05:39:16 -0500
X-MC-Unique: nOOEEOVGPqaffqqDf1HKuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F2E8143F3;
 Thu, 19 Nov 2020 10:39:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F0CC5D9C2;
 Thu, 19 Nov 2020 10:39:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1431911358BA; Thu, 19 Nov 2020 11:39:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 5/8] qlit: Support all types of QNums
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-6-ehabkost@redhat.com>
 <CAJ+F1CJ4quGCWWSbfChj3DW-0ReMYxPM6gmFvMx9cKrTb2TeYA@mail.gmail.com>
Date: Thu, 19 Nov 2020 11:39:14 +0100
In-Reply-To: <CAJ+F1CJ4quGCWWSbfChj3DW-0ReMYxPM6gmFvMx9cKrTb2TeYA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 17 Nov 2020
 12:52:47 +0400")
Message-ID: <87blftd419.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> On Tue, Nov 17, 2020 at 2:48 AM Eduardo Habkost <ehabkost@redhat.com> wro=
te:
>
>> Use QNumValue to represent QNums, so we can also support uint64_t
>> and double QNum values.  Add new QLIT_QNUM_(INT|UINT|DOUBLE)
>> macros for each case.
>>
>> The QLIT_QNUM() macro is being kept for compatibility with
>> existing code, but becomes just a wrapper for QLIT_QNUM_INT().
>>
>
> I am not sure it's worth to keep. (furthermore, it's only used in tests
> afaics)

Seconded.

>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>
>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ---
>> Changes v1 -> v2:
>> * Coding style fix at qlit_equal_qobject()
>> ---
>>  include/qapi/qmp/qlit.h | 11 +++++--
>>  qobject/qlit.c          |  5 +--
>>  tests/check-qjson.c     | 72 ++++++++++++++++++++++++++++++++++++++---
>>  3 files changed, 79 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
>> index c0676d5daf..f9e356d31e 100644
>> --- a/include/qapi/qmp/qlit.h
>> +++ b/include/qapi/qmp/qlit.h
>> @@ -15,6 +15,7 @@
>>  #define QLIT_H
>>
>>  #include "qobject.h"
>> +#include "qnum.h"
>>
>>  typedef struct QLitDictEntry QLitDictEntry;
>>  typedef struct QLitObject QLitObject;
>> @@ -23,7 +24,7 @@ struct QLitObject {
>>      QType type;
>>      union {
>>          bool qbool;
>> -        int64_t qnum;
>> +        QNumValue qnum;
>>          const char *qstr;
>>          QLitDictEntry *qdict;
>>          QLitObject *qlist;
>> @@ -39,8 +40,14 @@ struct QLitDictEntry {
>>      { .type =3D QTYPE_QNULL }
>>  #define QLIT_QBOOL(val) \
>>      { .type =3D QTYPE_QBOOL, .value.qbool =3D (val) }
>> +#define QLIT_QNUM_INT(val) \
>> +    { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_INT(val) }
>> +#define QLIT_QNUM_UINT(val) \
>> +    { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_UINT(val) }
>> +#define QLIT_QNUM_DOUBLE(val) \
>> +    { .type =3D QTYPE_QNUM, .value.qnum =3D QNUM_VAL_DOUBLE(val) }
>>  #define QLIT_QNUM(val) \
>> -    { .type =3D QTYPE_QNUM, .value.qnum =3D (val) }
>> +    QLIT_QNUM_INT(val)
>>  #define QLIT_QSTR(val) \
>>      { .type =3D QTYPE_QSTRING, .value.qstr =3D (val) }
>>  #define QLIT_QDICT(val) \
>> diff --git a/qobject/qlit.c b/qobject/qlit.c
>> index be8332136c..b23cdc4532 100644
>> --- a/qobject/qlit.c
>> +++ b/qobject/qlit.c
>> @@ -71,7 +71,8 @@ bool qlit_equal_qobject(const QLitObject *lhs, const
>> QObject *rhs)
>>      case QTYPE_QBOOL:
>>          return lhs->value.qbool =3D=3D qbool_get_bool(qobject_to(QBool,=
 rhs));
>>      case QTYPE_QNUM:
>> -        return lhs->value.qnum =3D=3D  qnum_get_int(qobject_to(QNum, rh=
s));
>> +        return qnum_value_is_equal(&lhs->value.qnum,
>> +                                   qnum_get_value(qobject_to(QNum, rhs)=
));

Before the patch, we crash when @rhs can't be represented as int64_t.

Afterwards, we return false (I think).

Please note this in the commit message.  A separate fix preceding this
patch would be even better, but may not be worth the trouble.  Up to
you.

>>      case QTYPE_QSTRING:
>>          return (strcmp(lhs->value.qstr,
>>                         qstring_get_str(qobject_to(QString, rhs))) =3D=
=3D 0);
>> @@ -94,7 +95,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)
>>      case QTYPE_QNULL:
>>          return QOBJECT(qnull());
>>      case QTYPE_QNUM:
>> -        return QOBJECT(qnum_from_int(qlit->value.qnum));
>> +        return QOBJECT(qnum_from_value(qlit->value.qnum));
>>      case QTYPE_QSTRING:
>>          return QOBJECT(qstring_from_str(qlit->value.qstr));
>>      case QTYPE_QDICT: {
>> diff --git a/tests/check-qjson.c b/tests/check-qjson.c
>> index 07a773e653..711030cffd 100644
>> --- a/tests/check-qjson.c
>> +++ b/tests/check-qjson.c
>> @@ -796,20 +796,23 @@ static void simple_number(void)
>>      int i;
>>      struct {
>>          const char *encoded;
>> +        QLitObject qlit;
>>          int64_t decoded;
>>          int skip;
>>      } test_cases[] =3D {
>> -        { "0", 0 },
>> -        { "1234", 1234 },
>> -        { "1", 1 },
>> -        { "-32", -32 },
>> -        { "-0", 0, .skip =3D 1 },
>> +        { "0",    QLIT_QNUM(0),    0, },
>> +        { "1234", QLIT_QNUM(1234), 1234, },
>> +        { "1",    QLIT_QNUM(1),    1, },
>> +        { "-32",  QLIT_QNUM(-32),  -32, },
>> +        { "-0",   QLIT_QNUM(0),    0, .skip =3D 1 },

Note .qlit is always QLIT_QNUM(.decoded).  Would doing without .qlit
result in a simpler patch?

>>          { },
>>      };
>>
>>      for (i =3D 0; test_cases[i].encoded; i++) {
>>          QNum *qnum;
>>          int64_t val;
>> +        QNum *qlit_num;
>> +        int64_t qlit_val;
>>
>>          qnum =3D qobject_to(QNum,
>>                            qobject_from_json(test_cases[i].encoded,
>> @@ -817,6 +820,7 @@ static void simple_number(void)
>>          g_assert(qnum);
>>          g_assert(qnum_get_try_int(qnum, &val));
>>          g_assert_cmpint(val, =3D=3D, test_cases[i].decoded);
>> +
>>          if (test_cases[i].skip =3D=3D 0) {
>>              QString *str;
>>
>> @@ -826,9 +830,66 @@ static void simple_number(void)
>>          }
>>
>>          qobject_unref(qnum);
>> +
>> +        qlit_num =3D qobject_to(QNum,
>> +                              qobject_from_qlit(&test_cases[i].qlit));
>> +        g_assert(qlit_num);
>> +        g_assert(qnum_get_try_int(qlit_num, &qlit_val));
>> +        g_assert_cmpint(qlit_val, =3D=3D, test_cases[i].decoded);
>> +
>> +        qobject_unref(qlit_num);
>>      }
>>  }
>>
>> +static void qlit_large_number(void)
>> +{
>> +    QLitObject maxu64 =3D QLIT_QNUM_UINT(UINT64_MAX);
>> +    QLitObject maxi64 =3D QLIT_QNUM(INT64_MAX);
>> +    QLitObject mini64 =3D QLIT_QNUM(INT64_MIN);
>> +    QLitObject gtu64  =3D QLIT_QNUM_DOUBLE(18446744073709552e3);
>> +    QLitObject lti64  =3D QLIT_QNUM_DOUBLE(-92233720368547758e2);
>> +    QNum *qnum;
>> +    uint64_t val;
>> +    int64_t ival;
>> +
>> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&maxu64));
>> +    g_assert(qnum);
>> +    g_assert_cmpuint(qnum_get_uint(qnum), =3D=3D, UINT64_MAX);
>> +    g_assert(!qnum_get_try_int(qnum, &ival));
>> +
>> +    qobject_unref(qnum);
>> +
>> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&maxi64));
>> +    g_assert(qnum);
>> +    g_assert_cmpuint(qnum_get_uint(qnum), =3D=3D, INT64_MAX);
>> +    g_assert_cmpint(qnum_get_int(qnum), =3D=3D, INT64_MAX);
>> +
>> +    qobject_unref(qnum);
>> +
>> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&mini64));
>> +    g_assert(qnum);
>> +    g_assert(!qnum_get_try_uint(qnum, &val));
>> +    g_assert_cmpuint(qnum_get_int(qnum), =3D=3D, INT64_MIN);
>> +
>> +    qobject_unref(qnum);
>> +
>> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&gtu64));
>> +    g_assert(qnum);
>> +    g_assert_cmpfloat(qnum_get_double(qnum), =3D=3D, 18446744073709552e=
3);
>> +    g_assert(!qnum_get_try_uint(qnum, &val));
>> +    g_assert(!qnum_get_try_int(qnum, &ival));
>> +
>> +    qobject_unref(qnum);
>> +
>> +    qnum =3D qobject_to(QNum, qobject_from_qlit(&lti64));
>> +    g_assert(qnum);
>> +    g_assert_cmpfloat(qnum_get_double(qnum), =3D=3D, -92233720368547758=
e2);
>> +    g_assert(!qnum_get_try_uint(qnum, &val));
>> +    g_assert(!qnum_get_try_int(qnum, &ival));
>> +
>> +    qobject_unref(qnum);
>> +}
>> +
>>  static void large_number(void)
>>  {
>>      const char *maxu64 =3D "18446744073709551615"; /* 2^64-1 */
>> @@ -1472,6 +1533,7 @@ int main(int argc, char **argv)
>>      g_test_add_func("/literals/string/utf8", utf8_string);
>>
>>      g_test_add_func("/literals/number/simple", simple_number);
>> +    g_test_add_func("/literals/number/qlit_large", qlit_large_number);
>>      g_test_add_func("/literals/number/large", large_number);
>>      g_test_add_func("/literals/number/float", float_number);
>>
>> --
>> 2.28.0
>>
>>
>>


