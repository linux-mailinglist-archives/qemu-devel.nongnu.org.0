Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724382B67B0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:43:46 +0100 (CET)
Received: from localhost ([::1]:45104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2Cv-0001jN-BC
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kf2CA-0001IQ-JC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kf2C7-00049C-7u
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605624173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2Bgt4WAr1YrAOWmOzqtOHcXDIPw3aOcbAgG/DxHnpM=;
 b=EaTHeYOhe5IsJvtOuVnB84ShE18QSjY6HTFOyPwWcpah6fPekAz7ijG56XnrdJML0QTOcs
 7jFXJR6iofHGQp3zAI0VrKf8iaQH4Z7DGwPCacNHR5KmiihZQyjcs5kIt9QnZsvNLvHizp
 UWTeRxuDoTHqdRWWhQw3sFb8TCsc0Ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-TKb5dEDANGOcf2HN38XbIw-1; Tue, 17 Nov 2020 09:42:49 -0500
X-MC-Unique: TKb5dEDANGOcf2HN38XbIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 381B264142;
 Tue, 17 Nov 2020 14:42:48 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFF115D707;
 Tue, 17 Nov 2020 14:42:47 +0000 (UTC)
Date: Tue, 17 Nov 2020 09:42:46 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
Message-ID: <20201117144246.GD1235237@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
 <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 12:37:56PM +0400, Marc-André Lureau wrote:
> On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Provide a separate QNumValue type that can be used for QNum value
> > literals without the referencing counting and memory allocation
> > features provided by QObject.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Changes v1 -> v2:
> > * Fix "make check" failure, by updating check-qnum unit test to
> >   use the new struct fields
> > ---
> >  include/qapi/qmp/qnum.h | 40 +++++++++++++++++++--
> >  qobject/qnum.c          | 78 ++++++++++++++++++++---------------------
> >  tests/check-qnum.c      | 14 ++++----
> >  3 files changed, 84 insertions(+), 48 deletions(-)
> >
> > diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> > index 55c27b1c24..62fbdfda68 100644
> > --- a/include/qapi/qmp/qnum.h
> > +++ b/include/qapi/qmp/qnum.h
> > @@ -46,20 +46,56 @@ typedef enum {
> >   * in range: qnum_get_try_int() / qnum_get_try_uint() check range and
> >   * convert under the hood.
> >   */
> > -struct QNum {
> > -    struct QObjectBase_ base;
> > +
> > +/**
> > + * struct QNumValue: the value of a QNum
> > + *
> > + * QNumValue literals can be constructed using the `QNUM_VAL_INT`,
> > + * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.
> > + */
> > +typedef struct QNumValue {
> > +    /* private: */
> >      QNumKind kind;
> >      union {
> >          int64_t i64;
> >          uint64_t u64;
> >          double dbl;
> >      } u;
> > +} QNumValue;
> > +
> > +#define QNUM_VAL_INT(value) \
> > +    { .kind = QNUM_I64, .u.i64 = value }
> > +#define QNUM_VAL_UINT(value) \
> > +    { .kind = QNUM_U64, .u.u64 = value }
> > +#define QNUM_VAL_DOUBLE(value) \
> > +    { .kind = QNUM_DOUBLE, .u.dbl = value }
> > +
> > +struct QNum {
> > +    struct QObjectBase_ base;
> > +    QNumValue value;
> >  };
> >
> > +/**
> > + * qnum_from_int(): Create a new QNum from a QNumValue
> >
> 
> Copy-pasta qnum_from_int() -> qnum_from_value()

Oops!  I will fix it in v3, or submit a fixup patch if that's the
only needed change.

> 
> I wonder if there is a check for that kind of mistake, as it may be common.

It looks like kernel-doc ignores what's before the colon in the
summary line.  It probably shouldn't.

> 
> + * @value: QNumValue
> > + *
> > + * Return strong reference.
> > + */
> > +QNum *qnum_from_value(QNumValue value);
> >
> +
> >  QNum *qnum_from_int(int64_t value);
> >  QNum *qnum_from_uint(uint64_t value);
> >  QNum *qnum_from_double(double value);
> >
> > +/**
> > + * qnum_get_value(): Get QNumValue from QNum
> > + * @qn: QNum object
> > + */
> > +static inline const QNumValue *qnum_get_value(const QNum *qn)
> > +{
> > +    return &qn->value;
> > +}
> > +
> >
> 
> Nothing uses that function in this patch. Should be put into use.

It is used in patch 5/8.  Why do you think it's necessary to use
it in internal code too?

> 
>  bool qnum_get_try_int(const QNum *qn, int64_t *val);
> >  int64_t qnum_get_int(const QNum *qn);
> >
> > diff --git a/qobject/qnum.c b/qobject/qnum.c
> > index 69fd9a82d9..f80d4efd76 100644
> > --- a/qobject/qnum.c
> > +++ b/qobject/qnum.c
> > @@ -15,6 +15,15 @@
> >  #include "qemu/osdep.h"
> >  #include "qapi/qmp/qnum.h"
> >
> > +QNum *qnum_from_value(QNumValue value)
> >
> 
> I wonder if it shouldn't be made "inline" in header too (if that can help
> avoid argument copy).

I'm unsure.  I would make it inline (in a separate patch) if
there's evidence it's worth it.  I expect the g_new() call to be
more expensive than any argument copying, though.

> 
> +{
> > +    QNum *qn = g_new(QNum, 1);
> > +
> > +    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > +    qn->value = value;
> > +    return qn;
> > +}
> > +
> >  /**
> >   * qnum_from_int(): Create a new QNum from an int64_t
> >   * @value: int64_t value
> > @@ -23,13 +32,7 @@
> >   */
> >  QNum *qnum_from_int(int64_t value)
> >  {
> > -    QNum *qn = g_new(QNum, 1);
> > -
> > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > -    qn->kind = QNUM_I64;
> > -    qn->u.i64 = value;
> > -
> > -    return qn;
> > +    return qnum_from_value((QNumValue) QNUM_VAL_INT(value));
> >  }
> >
> >  /**
> > @@ -40,13 +43,7 @@ QNum *qnum_from_int(int64_t value)
> >   */
> >  QNum *qnum_from_uint(uint64_t value)
> >  {
> > -    QNum *qn = g_new(QNum, 1);
> > -
> > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > -    qn->kind = QNUM_U64;
> > -    qn->u.u64 = value;
> > -
> > -    return qn;
> > +    return qnum_from_value((QNumValue) QNUM_VAL_UINT(value));
> >  }
> >
> >  /**
> > @@ -57,13 +54,7 @@ QNum *qnum_from_uint(uint64_t value)
> >   */
> >  QNum *qnum_from_double(double value)
> >  {
> > -    QNum *qn = g_new(QNum, 1);
> > -
> > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > -    qn->kind = QNUM_DOUBLE;
> > -    qn->u.dbl = value;
> > -
> > -    return qn;
> > +    return qnum_from_value((QNumValue) QNUM_VAL_DOUBLE(value));
> >  }
> >
> >  /**
> > @@ -75,15 +66,17 @@ QNum *qnum_from_double(double value)
> >   */
> >  bool qnum_get_try_int(const QNum *qn, int64_t *val)
> >  {
> > -    switch (qn->kind) {
> > +    const QNumValue *qv = &qn->value;
> > +
> > +    switch (qv->kind) {
> >      case QNUM_I64:
> > -        *val = qn->u.i64;
> > +        *val = qv->u.i64;
> >          return true;
> >      case QNUM_U64:
> > -        if (qn->u.u64 > INT64_MAX) {
> > +        if (qv->u.u64 > INT64_MAX) {
> >              return false;
> >          }
> > -        *val = qn->u.u64;
> > +        *val = qv->u.u64;
> >          return true;
> >      case QNUM_DOUBLE:
> >          return false;
> > @@ -116,15 +109,17 @@ int64_t qnum_get_int(const QNum *qn)
> >   */
> >  bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
> >  {
> > -    switch (qn->kind) {
> > +    const QNumValue *qv = &qn->value;
> > +
> > +    switch (qv->kind) {
> >      case QNUM_I64:
> > -        if (qn->u.i64 < 0) {
> > +        if (qv->u.i64 < 0) {
> >              return false;
> >          }
> > -        *val = qn->u.i64;
> > +        *val = qv->u.i64;
> >          return true;
> >      case QNUM_U64:
> > -        *val = qn->u.u64;
> > +        *val = qv->u.u64;
> >          return true;
> >      case QNUM_DOUBLE:
> >          return false;
> > @@ -156,13 +151,15 @@ uint64_t qnum_get_uint(const QNum *qn)
> >   */
> >  double qnum_get_double(const QNum *qn)
> >  {
> > -    switch (qn->kind) {
> > +    const QNumValue *qv = &qn->value;
> > +
> > +    switch (qv->kind) {
> >      case QNUM_I64:
> > -        return qn->u.i64;
> > +        return qv->u.i64;
> >      case QNUM_U64:
> > -        return qn->u.u64;
> > +        return qv->u.u64;
> >      case QNUM_DOUBLE:
> > -        return qn->u.dbl;
> > +        return qv->u.dbl;
> >      }
> >
> >      assert(0);
> > @@ -171,14 +168,15 @@ double qnum_get_double(const QNum *qn)
> >
> >  char *qnum_to_string(QNum *qn)
> >  {
> > +    const QNumValue *qv = &qn->value;
> >
> 
> qnum_get_value() ?

I prefer to not hide this behind a function call, in internal
code.  But I don't mind changing it if you think it's important.


> 
>      char *buffer;
> >      int len;
> >
> > -    switch (qn->kind) {
> > +    switch (qv->kind) {
> >      case QNUM_I64:
> > -        return g_strdup_printf("%" PRId64, qn->u.i64);
> > +        return g_strdup_printf("%" PRId64, qv->u.i64);
> >      case QNUM_U64:
> > -        return g_strdup_printf("%" PRIu64, qn->u.u64);
> > +        return g_strdup_printf("%" PRIu64, qv->u.u64);
> >      case QNUM_DOUBLE:
> >          /* FIXME: snprintf() is locale dependent; but JSON requires
> >           * numbers to be formatted as if in the C locale. Dependence
> > @@ -189,7 +187,7 @@ char *qnum_to_string(QNum *qn)
> >           * rounding errors; we should be using DBL_DECIMAL_DIG (17),
> >           * and only rounding to a shorter number if the result would
> >           * still produce the same floating point value.  */
> > -        buffer = g_strdup_printf("%f" , qn->u.dbl);
> > +        buffer = g_strdup_printf("%f" , qv->u.dbl);
> >          len = strlen(buffer);
> >          while (len > 0 && buffer[len - 1] == '0') {
> >              len--;
> > @@ -221,8 +219,10 @@ char *qnum_to_string(QNum *qn)
> >   */
> >  bool qnum_is_equal(const QObject *x, const QObject *y)
> >  {
> > -    QNum *num_x = qobject_to(QNum, x);
> > -    QNum *num_y = qobject_to(QNum, y);
> > +    const QNum *qnum_x = qobject_to(QNum, x);
> > +    const QNum *qnum_y = qobject_to(QNum, y);
> > +    const QNumValue *num_x = &qnum_x->value;
> > +    const QNumValue *num_y = &qnum_y->value;
> >
> >      switch (num_x->kind) {
> >      case QNUM_I64:
> > diff --git a/tests/check-qnum.c b/tests/check-qnum.c
> > index 4105015872..9499b0d845 100644
> > --- a/tests/check-qnum.c
> > +++ b/tests/check-qnum.c
> > @@ -30,8 +30,8 @@ static void qnum_from_int_test(void)
> >
> >      qn = qnum_from_int(value);
> >      g_assert(qn != NULL);
> > -    g_assert_cmpint(qn->kind, ==, QNUM_I64);
> > -    g_assert_cmpint(qn->u.i64, ==, value);
> > +    g_assert_cmpint(qn->value.kind, ==, QNUM_I64);
> > +    g_assert_cmpint(qn->value.u.i64, ==, value);
> >      g_assert_cmpint(qn->base.refcnt, ==, 1);
> >      g_assert_cmpint(qobject_type(QOBJECT(qn)), ==, QTYPE_QNUM);
> >
> > @@ -45,8 +45,8 @@ static void qnum_from_uint_test(void)
> >
> >      qn = qnum_from_uint(value);
> >      g_assert(qn != NULL);
> > -    g_assert_cmpint(qn->kind, ==, QNUM_U64);
> > -    g_assert(qn->u.u64 == value);
> > +    g_assert_cmpint(qn->value.kind, ==, QNUM_U64);
> > +    g_assert(qn->value.u.u64 == value);
> >      g_assert(qn->base.refcnt == 1);
> >      g_assert(qobject_type(QOBJECT(qn)) == QTYPE_QNUM);
> >
> > @@ -60,8 +60,8 @@ static void qnum_from_double_test(void)
> >
> >      qn = qnum_from_double(value);
> >      g_assert(qn != NULL);
> > -    g_assert_cmpint(qn->kind, ==, QNUM_DOUBLE);
> > -    g_assert_cmpfloat(qn->u.dbl, ==, value);
> > +    g_assert_cmpint(qn->value.kind, ==, QNUM_DOUBLE);
> > +    g_assert_cmpfloat(qn->value.u.dbl, ==, value);
> >      g_assert_cmpint(qn->base.refcnt, ==, 1);
> >      g_assert_cmpint(qobject_type(QOBJECT(qn)), ==, QTYPE_QNUM);
> >
> > @@ -74,7 +74,7 @@ static void qnum_from_int64_test(void)
> >      const int64_t value = 0x1234567890abcdefLL;
> >
> >      qn = qnum_from_int(value);
> > -    g_assert_cmpint((int64_t) qn->u.i64, ==, value);
> > +    g_assert_cmpint((int64_t) qn->value.u.i64, ==, value);
> >
> >      qobject_unref(qn);
> >  }
> > --
> > 2.28.0
> >
> >
> >
> lgtm otherwise

Thanks!

-- 
Eduardo


