Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5322B900E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:26:54 +0100 (CET)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfh9R-0004j6-Gc
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfh7d-0003KA-Bb
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:25:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfh7a-0004gf-M1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+994b5u7rUTdwdcZJ4ThkRCayjmi51c2yvEExx2DOM=;
 b=bRe6Vpeg8FeRfRyTJtHJpf0ALLiP9qBNn88j3VqyBKh2DYrR9ca3nTry3ssEm481Qr221K
 ezLMtYd/jP42DrTVG2S8cbPVkBn6nWYTG+iMkKZnw0+DQoOA/0I2aIOV4pTA7yGHl+rKO+
 v/IHY0KyxB1i2/5zD2AR4JxRJ6RqN+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-NoWn6e_fNq2d4sRXt2wKbg-1; Thu, 19 Nov 2020 05:24:55 -0500
X-MC-Unique: NoWn6e_fNq2d4sRXt2wKbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ED1F81A33E;
 Thu, 19 Nov 2020 10:24:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12584179B3;
 Thu, 19 Nov 2020 10:24:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D54511358BA; Thu, 19 Nov 2020 11:24:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
 <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
 <20201117144246.GD1235237@habkost.net>
 <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
Date: Thu, 19 Nov 2020 11:24:52 +0100
In-Reply-To: <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 17 Nov 2020
 18:58:39 +0400")
Message-ID: <87mtzdd4p7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> On Tue, Nov 17, 2020 at 6:42 PM Eduardo Habkost <ehabkost@redhat.com> wro=
te:
>
>> On Tue, Nov 17, 2020 at 12:37:56PM +0400, Marc-Andr=C3=A9 Lureau wrote:
>> > On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost <ehabkost@redhat.com>
>> wrote:
>> >
>> > > Provide a separate QNumValue type that can be used for QNum value
>> > > literals without the referencing counting and memory allocation
>> > > features provided by QObject.
>> > >
>> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> > > ---
>> > > Changes v1 -> v2:
>> > > * Fix "make check" failure, by updating check-qnum unit test to
>> > >   use the new struct fields
>> > > ---
>> > >  include/qapi/qmp/qnum.h | 40 +++++++++++++++++++--
>> > >  qobject/qnum.c          | 78 ++++++++++++++++++++------------------=
---
>> > >  tests/check-qnum.c      | 14 ++++----
>> > >  3 files changed, 84 insertions(+), 48 deletions(-)
>> > >
>> > > diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
>> > > index 55c27b1c24..62fbdfda68 100644
>> > > --- a/include/qapi/qmp/qnum.h
>> > > +++ b/include/qapi/qmp/qnum.h
>> > > @@ -46,20 +46,56 @@ typedef enum {
>> > >   * in range: qnum_get_try_int() / qnum_get_try_uint() check range a=
nd
>> > >   * convert under the hood.
>> > >   */
>> > > -struct QNum {
>> > > -    struct QObjectBase_ base;
>> > > +
>> > > +/**
>> > > + * struct QNumValue: the value of a QNum
>> > > + *
>> > > + * QNumValue literals can be constructed using the `QNUM_VAL_INT`,
>> > > + * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.
>> > > + */
>> > > +typedef struct QNumValue {
>> > > +    /* private: */

Do we care?

>> > >      QNumKind kind;
>> > >      union {
>> > >          int64_t i64;
>> > >          uint64_t u64;
>> > >          double dbl;
>> > >      } u;
>> > > +} QNumValue;
>> > > +
>> > > +#define QNUM_VAL_INT(value) \
>> > > +    { .kind =3D QNUM_I64, .u.i64 =3D value }
>> > > +#define QNUM_VAL_UINT(value) \
>> > > +    { .kind =3D QNUM_U64, .u.u64 =3D value }
>> > > +#define QNUM_VAL_DOUBLE(value) \
>> > > +    { .kind =3D QNUM_DOUBLE, .u.dbl =3D value }
>> > > +
>> > > +struct QNum {
>> > > +    struct QObjectBase_ base;
>> > > +    QNumValue value;
>> > >  };
>> > >
>> > > +/**
>> > > + * qnum_from_int(): Create a new QNum from a QNumValue
>> > >
>> >
>> > Copy-pasta qnum_from_int() -> qnum_from_value()
>>
>> Oops!  I will fix it in v3, or submit a fixup patch if that's the
>> only needed change.
>>
>> >
>> > I wonder if there is a check for that kind of mistake, as it may be
>> common.
>>
>> It looks like kernel-doc ignores what's before the colon in the
>> summary line.  It probably shouldn't.
>>
>> >
>> > + * @value: QNumValue
>> > > + *
>> > > + * Return strong reference.
>> > > + */
>> > > +QNum *qnum_from_value(QNumValue value);
>> > >
>> > +
>> > >  QNum *qnum_from_int(int64_t value);
>> > >  QNum *qnum_from_uint(uint64_t value);
>> > >  QNum *qnum_from_double(double value);
>> > >
>> > > +/**
>> > > + * qnum_get_value(): Get QNumValue from QNum
>> > > + * @qn: QNum object
>> > > + */
>> > > +static inline const QNumValue *qnum_get_value(const QNum *qn)
>> > > +{
>> > > +    return &qn->value;
>> > > +}
>> > > +
>> > >
>> >
>> > Nothing uses that function in this patch. Should be put into use.
>>
>> It is used in patch 5/8.  Why do you think it's necessary to use
>> it in internal code too?
>>
>
> Not necessarily, just want to make sure we don't introduce dead code. Fin=
e
> it's used later, perhaps worth noting in the commit message.

Yes, use later in the same series suffices.

The whole patch makes sense only because later patches put QNumValue to
use.  The commit message could perhaps be more explicit about that.  No
need to be explicit about every new function, though.

That said, I wouldn't bother with a getter function.  Yes, we have
similar trivial getters for other QFoo.  I don't care for them, either.
The actual structure of these data types is trivial, and not worth
hiding.

Also, I'm wary of inline functions in headers.  *Especially* when they
require additional #include (which this one doesn't).  I accept them
when they provide a worthwhile performance improvement.  Guesses don't
count as evidence :)

>>
>> >
>> >  bool qnum_get_try_int(const QNum *qn, int64_t *val);
>> > >  int64_t qnum_get_int(const QNum *qn);
>> > >
>> > > diff --git a/qobject/qnum.c b/qobject/qnum.c
>> > > index 69fd9a82d9..f80d4efd76 100644
>> > > --- a/qobject/qnum.c
>> > > +++ b/qobject/qnum.c
>> > > @@ -15,6 +15,15 @@
>> > >  #include "qemu/osdep.h"
>> > >  #include "qapi/qmp/qnum.h"
>> > >
>> > > +QNum *qnum_from_value(QNumValue value)
>> > >
>> >
>> > I wonder if it shouldn't be made "inline" in header too (if that can h=
elp
>> > avoid argument copy).
>>
>> I'm unsure.  I would make it inline (in a separate patch) if
>> there's evidence it's worth it.  I expect the g_new() call to be
>> more expensive than any argument copying, though.
>
> ok

I'm with Eduardo here.

>> >
>> > +{
>> > > +    QNum *qn =3D g_new(QNum, 1);
>> > > +
>> > > +    qobject_init(QOBJECT(qn), QTYPE_QNUM);
>> > > +    qn->value =3D value;
>> > > +    return qn;
>> > > +}
>> > > +
>> > >  /**
>> > >   * qnum_from_int(): Create a new QNum from an int64_t
>> > >   * @value: int64_t value
>> > > @@ -23,13 +32,7 @@
>> > >   */
>> > >  QNum *qnum_from_int(int64_t value)
>> > >  {
>> > > -    QNum *qn =3D g_new(QNum, 1);
>> > > -
>> > > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
>> > > -    qn->kind =3D QNUM_I64;
>> > > -    qn->u.i64 =3D value;
>> > > -
>> > > -    return qn;
>> > > +    return qnum_from_value((QNumValue) QNUM_VAL_INT(value));

No space between between (type) and its operand, please.

Could we lift the cast into the macro somehow?

>> > >  }
>> > >
>> > >  /**
>> > > @@ -40,13 +43,7 @@ QNum *qnum_from_int(int64_t value)
>> > >   */
>> > >  QNum *qnum_from_uint(uint64_t value)
>> > >  {
>> > > -    QNum *qn =3D g_new(QNum, 1);
>> > > -
>> > > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
>> > > -    qn->kind =3D QNUM_U64;
>> > > -    qn->u.u64 =3D value;
>> > > -
>> > > -    return qn;
>> > > +    return qnum_from_value((QNumValue) QNUM_VAL_UINT(value));
>> > >  }
>> > >
>> > >  /**
>> > > @@ -57,13 +54,7 @@ QNum *qnum_from_uint(uint64_t value)
>> > >   */
>> > >  QNum *qnum_from_double(double value)
>> > >  {
>> > > -    QNum *qn =3D g_new(QNum, 1);
>> > > -
>> > > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
>> > > -    qn->kind =3D QNUM_DOUBLE;
>> > > -    qn->u.dbl =3D value;
>> > > -
>> > > -    return qn;
>> > > +    return qnum_from_value((QNumValue) QNUM_VAL_DOUBLE(value));
>> > >  }
>> > >
>> > >  /**
>> > > @@ -75,15 +66,17 @@ QNum *qnum_from_double(double value)
>> > >   */
>> > >  bool qnum_get_try_int(const QNum *qn, int64_t *val)
>> > >  {
>> > > -    switch (qn->kind) {
>> > > +    const QNumValue *qv =3D &qn->value;
>> > > +
>> > > +    switch (qv->kind) {
>> > >      case QNUM_I64:
>> > > -        *val =3D qn->u.i64;
>> > > +        *val =3D qv->u.i64;
>> > >          return true;
>> > >      case QNUM_U64:
>> > > -        if (qn->u.u64 > INT64_MAX) {
>> > > +        if (qv->u.u64 > INT64_MAX) {
>> > >              return false;
>> > >          }
>> > > -        *val =3D qn->u.u64;
>> > > +        *val =3D qv->u.u64;
>> > >          return true;
>> > >      case QNUM_DOUBLE:
>> > >          return false;

Here you add a new variable to shorten "qn->value." to "qv->".  In
tests/check-qnum.c you don't.  I'm not sure the variable is worthwhile.

>> > > @@ -116,15 +109,17 @@ int64_t qnum_get_int(const QNum *qn)
>> > >   */
>> > >  bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
>> > >  {
>> > > -    switch (qn->kind) {
>> > > +    const QNumValue *qv =3D &qn->value;
>> > > +
>> > > +    switch (qv->kind) {
>> > >      case QNUM_I64:
>> > > -        if (qn->u.i64 < 0) {
>> > > +        if (qv->u.i64 < 0) {
>> > >              return false;
>> > >          }
>> > > -        *val =3D qn->u.i64;
>> > > +        *val =3D qv->u.i64;
>> > >          return true;
>> > >      case QNUM_U64:
>> > > -        *val =3D qn->u.u64;
>> > > +        *val =3D qv->u.u64;
>> > >          return true;
>> > >      case QNUM_DOUBLE:
>> > >          return false;
>> > > @@ -156,13 +151,15 @@ uint64_t qnum_get_uint(const QNum *qn)
>> > >   */
>> > >  double qnum_get_double(const QNum *qn)
>> > >  {
>> > > -    switch (qn->kind) {
>> > > +    const QNumValue *qv =3D &qn->value;
>> > > +
>> > > +    switch (qv->kind) {
>> > >      case QNUM_I64:
>> > > -        return qn->u.i64;
>> > > +        return qv->u.i64;
>> > >      case QNUM_U64:
>> > > -        return qn->u.u64;
>> > > +        return qv->u.u64;
>> > >      case QNUM_DOUBLE:
>> > > -        return qn->u.dbl;
>> > > +        return qv->u.dbl;
>> > >      }
>> > >
>> > >      assert(0);
>> > > @@ -171,14 +168,15 @@ double qnum_get_double(const QNum *qn)
>> > >
>> > >  char *qnum_to_string(QNum *qn)
>> > >  {
>> > > +    const QNumValue *qv =3D &qn->value;
>> > >
>> >
>> > qnum_get_value() ?
>>
>> I prefer to not hide this behind a function call, in internal
>> code.  But I don't mind changing it if you think it's important.

Me too.  Even in external code.

> no, it's ok to me
>
>
>>
>> >
>> >      char *buffer;
>> > >      int len;
>> > >
>> > > -    switch (qn->kind) {
>> > > +    switch (qv->kind) {
>> > >      case QNUM_I64:
>> > > -        return g_strdup_printf("%" PRId64, qn->u.i64);
>> > > +        return g_strdup_printf("%" PRId64, qv->u.i64);
>> > >      case QNUM_U64:
>> > > -        return g_strdup_printf("%" PRIu64, qn->u.u64);
>> > > +        return g_strdup_printf("%" PRIu64, qv->u.u64);
>> > >      case QNUM_DOUBLE:
>> > >          /* FIXME: snprintf() is locale dependent; but JSON requires
>> > >           * numbers to be formatted as if in the C locale. Dependenc=
e
>> > > @@ -189,7 +187,7 @@ char *qnum_to_string(QNum *qn)
>> > >           * rounding errors; we should be using DBL_DECIMAL_DIG (17)=
,
>> > >           * and only rounding to a shorter number if the result woul=
d
>> > >           * still produce the same floating point value.  */
>> > > -        buffer =3D g_strdup_printf("%f" , qn->u.dbl);
>> > > +        buffer =3D g_strdup_printf("%f" , qv->u.dbl);
>> > >          len =3D strlen(buffer);
>> > >          while (len > 0 && buffer[len - 1] =3D=3D '0') {
>> > >              len--;
>> > > @@ -221,8 +219,10 @@ char *qnum_to_string(QNum *qn)
>> > >   */
>> > >  bool qnum_is_equal(const QObject *x, const QObject *y)
>> > >  {
>> > > -    QNum *num_x =3D qobject_to(QNum, x);
>> > > -    QNum *num_y =3D qobject_to(QNum, y);
>> > > +    const QNum *qnum_x =3D qobject_to(QNum, x);
>> > > +    const QNum *qnum_y =3D qobject_to(QNum, y);

A bit of drive-by constification.  Okay.

>> > > +    const QNumValue *num_x =3D &qnum_x->value;
>> > > +    const QNumValue *num_y =3D &qnum_y->value;
>> > >
>> > >      switch (num_x->kind) {
>> > >      case QNUM_I64:
>> > > diff --git a/tests/check-qnum.c b/tests/check-qnum.c
>> > > index 4105015872..9499b0d845 100644
>> > > --- a/tests/check-qnum.c
>> > > +++ b/tests/check-qnum.c
>> > > @@ -30,8 +30,8 @@ static void qnum_from_int_test(void)
>> > >
>> > >      qn =3D qnum_from_int(value);
>> > >      g_assert(qn !=3D NULL);
>> > > -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_I64);
>> > > -    g_assert_cmpint(qn->u.i64, =3D=3D, value);
>> > > +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_I64);
>> > > +    g_assert_cmpint(qn->value.u.i64, =3D=3D, value);
>> > >      g_assert_cmpint(qn->base.refcnt, =3D=3D, 1);
>> > >      g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYPE_QNUM);
>> > >
>> > > @@ -45,8 +45,8 @@ static void qnum_from_uint_test(void)
>> > >
>> > >      qn =3D qnum_from_uint(value);
>> > >      g_assert(qn !=3D NULL);
>> > > -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_U64);
>> > > -    g_assert(qn->u.u64 =3D=3D value);
>> > > +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_U64);
>> > > +    g_assert(qn->value.u.u64 =3D=3D value);
>> > >      g_assert(qn->base.refcnt =3D=3D 1);
>> > >      g_assert(qobject_type(QOBJECT(qn)) =3D=3D QTYPE_QNUM);
>> > >
>> > > @@ -60,8 +60,8 @@ static void qnum_from_double_test(void)
>> > >
>> > >      qn =3D qnum_from_double(value);
>> > >      g_assert(qn !=3D NULL);
>> > > -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_DOUBLE);
>> > > -    g_assert_cmpfloat(qn->u.dbl, =3D=3D, value);
>> > > +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_DOUBLE);
>> > > +    g_assert_cmpfloat(qn->value.u.dbl, =3D=3D, value);
>> > >      g_assert_cmpint(qn->base.refcnt, =3D=3D, 1);
>> > >      g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYPE_QNUM);
>> > >
>> > > @@ -74,7 +74,7 @@ static void qnum_from_int64_test(void)
>> > >      const int64_t value =3D 0x1234567890abcdefLL;
>> > >
>> > >      qn =3D qnum_from_int(value);
>> > > -    g_assert_cmpint((int64_t) qn->u.i64, =3D=3D, value);
>> > > +    g_assert_cmpint((int64_t) qn->value.u.i64, =3D=3D, value);
>> > >
>> > >      qobject_unref(qn);
>> > >  }
>> > > --
>> > > 2.28.0
>> > >
>> > >
>> > >
>> > lgtm otherwise
>>
>> Thanks!
>>
>> --
>> Eduardo
>>
>>


