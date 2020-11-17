Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004122B690A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:51:14 +0100 (CET)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3GC-0004fY-Lw
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kf3Et-00048k-Nv
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kf3Ep-000224-K7
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605628186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQA5PTWssJ58OH5kxPPI175mY8w5Dhhrty2KxhZ3feU=;
 b=hujebFq1wsyZ3i/KDywGKcN3wGRfR9SXBcLwGFHIMCnTEB+J3zRpa2IsBKmbXAyWV7RdcJ
 6Q62jP4dfdQnlRTY30H54YrPewQS/KzzJJDB2a0LGZQwKYOI2vw2eGyomuhwFxlpPlZyvW
 023fiCLlR2HzX6xCBkhde69XldW9I7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-7KZtONp4P6KcRqXDNSdzcA-1; Tue, 17 Nov 2020 10:49:42 -0500
X-MC-Unique: 7KZtONp4P6KcRqXDNSdzcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7747B10866B4;
 Tue, 17 Nov 2020 15:49:41 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 090535D9CC;
 Tue, 17 Nov 2020 15:49:40 +0000 (UTC)
Date: Tue, 17 Nov 2020 10:49:40 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 4/8] qnum: qnum_value_is_equal() function
Message-ID: <20201117154940.GG1235237@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-5-ehabkost@redhat.com>
 <CAJ+F1CJYPfYa+3acEQVJAnKxtOG7rx1uJG+siqEQX6h=F9p8kA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJYPfYa+3acEQVJAnKxtOG7rx1uJG+siqEQX6h=F9p8kA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Tue, Nov 17, 2020 at 12:42:47PM +0400, Marc-André Lureau wrote:
> On Tue, Nov 17, 2020 at 2:42 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Extract the QNum value comparison logic to a function that takes
> > QNumValue* as argument.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  include/qapi/qmp/qnum.h |  1 +
> >  qobject/qnum.c          | 29 +++++++++++++++++++----------
> >  2 files changed, 20 insertions(+), 10 deletions(-)
> >
> > diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> > index 62fbdfda68..0327ecd0f0 100644
> > --- a/include/qapi/qmp/qnum.h
> > +++ b/include/qapi/qmp/qnum.h
> > @@ -106,6 +106,7 @@ double qnum_get_double(const QNum *qn);
> >
> >  char *qnum_to_string(QNum *qn);
> >
> > +bool qnum_value_is_equal(const QNumValue *num_x, const QNumValue *num_y);
> >  bool qnum_is_equal(const QObject *x, const QObject *y);
> >  void qnum_destroy_obj(QObject *obj);
> >
> > diff --git a/qobject/qnum.c b/qobject/qnum.c
> > index f80d4efd76..6a0f948b16 100644
> > --- a/qobject/qnum.c
> > +++ b/qobject/qnum.c
> > @@ -207,9 +207,9 @@ char *qnum_to_string(QNum *qn)
> >  }
> >
> >  /**
> > - * qnum_is_equal(): Test whether the two QNums are equal
> > - * @x: QNum object
> > - * @y: QNum object
> > + * qnum_value_is_equal(): Test whether two QNumValues are equal
> > + * @num_x: QNum value
> > + * @num_y: QNum value
> >
> 
> val_x: a QNumValue ?

Do you mean:
  @num_x: a QNumValue
?

I was not planning to rename the existing num_x/num_y variables.

> 
>   *
> >   * Negative integers are never considered equal to unsigned integers,
> >   * but positive integers in the range [0, INT64_MAX] are considered
> > @@ -217,13 +217,8 @@ char *qnum_to_string(QNum *qn)
> >   *
> >   * Doubles are never considered equal to integers.
> >   */
> > -bool qnum_is_equal(const QObject *x, const QObject *y)
> > +bool qnum_value_is_equal(const QNumValue *num_x, const QNumValue *num_y)
> >  {
> > -    const QNum *qnum_x = qobject_to(QNum, x);
> > -    const QNum *qnum_y = qobject_to(QNum, y);
> > -    const QNumValue *num_x = &qnum_x->value;
> > -    const QNumValue *num_y = &qnum_y->value;
> > -
> >      switch (num_x->kind) {
> >      case QNUM_I64:
> >          switch (num_y->kind) {
> > @@ -241,7 +236,7 @@ bool qnum_is_equal(const QObject *x, const QObject *y)
> >      case QNUM_U64:
> >          switch (num_y->kind) {
> >          case QNUM_I64:
> > -            return qnum_is_equal(y, x);
> > +            return qnum_value_is_equal(num_y, num_x);
> >          case QNUM_U64:
> >              /* Comparison in native uint64_t type */
> >              return num_x->u.u64 == num_y->u.u64;
> > @@ -264,6 +259,20 @@ bool qnum_is_equal(const QObject *x, const QObject *y)
> >      abort();
> >  }
> >
> > +/**
> > + * qnum_is_equal(): Test whether the two QNums are equal
> > + * @x: QNum object
> > + * @y: QNum object
> > + *
> > + * See qnum_value_is_equal() for details on the comparison rules.
> > + */
> > +bool qnum_is_equal(const QObject *x, const QObject *y)
> > +{
> > +    const QNum *qnum_x = qobject_to(QNum, x);
> > +    const QNum *qnum_y = qobject_to(QNum, y);
> > +    return qnum_value_is_equal(&qnum_x->value, &qnum_y->value);
> > +}
> > +
> >  /**
> >   * qnum_destroy_obj(): Free all memory allocated by a QNum object
> >   *
> > --
> > 2.28.0
> >
> >
> >
> beside that,
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Thanks!

-- 
Eduardo


