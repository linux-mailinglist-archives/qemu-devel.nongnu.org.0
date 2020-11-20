Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A192BA1EC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 06:32:18 +0100 (CET)
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfz1t-0001Um-7Y
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 00:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfyz7-0008Ku-KJ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 00:29:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfyz4-0006hH-TB
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 00:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605850161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euiHrpQy4ONY+zTZ4D3clSP5Efrblp91moWOtuhlWd8=;
 b=H+vdWnL40Vg/XVMeLq0wecMxm5LeFwjGsWTe6jcGuaFRaaOSDSLkqSLQJlzUm1m0WpyMQT
 N6ZWM50//VmdUuP0vyOrLKwGx1721gz4Y1DyrTJ3ZoghaI2XTsgvgrtEpe/QyUBX47WGp4
 kCGjJTrh7t2201YSZHdm2WaZw0kU/0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-dsQlt1lbNGiWLXvGvUEmPw-1; Fri, 20 Nov 2020 00:29:18 -0500
X-MC-Unique: dsQlt1lbNGiWLXvGvUEmPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFDB68143F3;
 Fri, 20 Nov 2020 05:29:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 821D55D6AD;
 Fri, 20 Nov 2020 05:29:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 17BE611358BA; Fri, 20 Nov 2020 06:29:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
 <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
 <20201117144246.GD1235237@habkost.net>
 <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
 <87mtzdd4p7.fsf@dusky.pond.sub.org>
 <20201119182158.GX1509407@habkost.net>
Date: Fri, 20 Nov 2020 06:29:16 +0100
In-Reply-To: <20201119182158.GX1509407@habkost.net> (Eduardo Habkost's message
 of "Thu, 19 Nov 2020 13:21:58 -0500")
Message-ID: <877dqg8ukz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Nov 19, 2020 at 11:24:52AM +0100, Markus Armbruster wrote:
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>>=20
>> > On Tue, Nov 17, 2020 at 6:42 PM Eduardo Habkost <ehabkost@redhat.com> =
wrote:
>> >
>> >> On Tue, Nov 17, 2020 at 12:37:56PM +0400, Marc-Andr=C3=A9 Lureau wrot=
e:
>> >> > On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost <ehabkost@redhat.co=
m>
>> >> wrote:
>> >> >
>> >> > > Provide a separate QNumValue type that can be used for QNum value
>> >> > > literals without the referencing counting and memory allocation
>> >> > > features provided by QObject.
>> >> > >
>> >> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> >> > > ---
>> >> > > Changes v1 -> v2:
>> >> > > * Fix "make check" failure, by updating check-qnum unit test to
>> >> > >   use the new struct fields
>> >> > > ---
>> >> > >  include/qapi/qmp/qnum.h | 40 +++++++++++++++++++--
>> >> > >  qobject/qnum.c          | 78 ++++++++++++++++++++---------------=
------
>> >> > >  tests/check-qnum.c      | 14 ++++----
>> >> > >  3 files changed, 84 insertions(+), 48 deletions(-)
>> >> > >
>> >> > > diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
>> >> > > index 55c27b1c24..62fbdfda68 100644
>> >> > > --- a/include/qapi/qmp/qnum.h
>> >> > > +++ b/include/qapi/qmp/qnum.h
>> >> > > @@ -46,20 +46,56 @@ typedef enum {
>> >> > >   * in range: qnum_get_try_int() / qnum_get_try_uint() check rang=
e and
>> >> > >   * convert under the hood.
>> >> > >   */
>> >> > > -struct QNum {
>> >> > > -    struct QObjectBase_ base;
>> >> > > +
>> >> > > +/**
>> >> > > + * struct QNumValue: the value of a QNum
>> >> > > + *
>> >> > > + * QNumValue literals can be constructed using the `QNUM_VAL_INT=
`,
>> >> > > + * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.
>> >> > > + */
>> >> > > +typedef struct QNumValue {
>> >> > > +    /* private: */
>>=20
>> Do we care?
>
> Are you asking if we want to make them private, or if we want to
> document them as private (assuming they are).
>
> The answer to the latter is yes ("private:" is an indication to
> kernel-doc).  The answer to the former seems to be "no", based on
> your other comments.
>
> Or maybe `kind` should be public and `u` should be private?

You're factoring out a part of struct QNum into new struct QNumValue.
struct QNum is not private before the patch.  I see no need to start
making it or parts of it private now.

When the structure of a data type is to be kept away from its users, I
prefer to keep it out of the public header, so the compiler enforces the
encapsulation.

[...]


