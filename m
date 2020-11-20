Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE792BA2B6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 07:57:26 +0100 (CET)
Received: from localhost ([::1]:50216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg0MH-0003XH-UR
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 01:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg0K9-0002cT-LE
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 01:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg0K7-0001LJ-Sg
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 01:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605855311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xa4ohgPoRnbbQyvb85q8c/RHs+9UFs34laCqK960NXI=;
 b=eJsanAz+B16c2oBYT+2iu/o46UWt/N4iXJ/n1SzI66VMOu297tyRJXPINJAkot8bAx/DAC
 xyj8mzgX9As9TmiTLU+IDkNDt2IcXSHUBNX920Mw2fHJ2Ci6l3onhvT1S4hYEHAUGaMHeT
 fV6alNMmC75rbkgOIlrJNZyAMPKOAS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-wkVwX_KIMM23zJ-b40qN1A-1; Fri, 20 Nov 2020 01:55:08 -0500
X-MC-Unique: wkVwX_KIMM23zJ-b40qN1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F38F2108E1A3;
 Fri, 20 Nov 2020 06:55:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3493919C47;
 Fri, 20 Nov 2020 06:55:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8AE511358BA; Fri, 20 Nov 2020 07:55:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 5/8] qlit: Support all types of QNums
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-6-ehabkost@redhat.com>
 <CAJ+F1CJ4quGCWWSbfChj3DW-0ReMYxPM6gmFvMx9cKrTb2TeYA@mail.gmail.com>
 <87blftd419.fsf@dusky.pond.sub.org>
 <20201119185604.GZ1509407@habkost.net>
Date: Fri, 20 Nov 2020 07:55:05 +0100
In-Reply-To: <20201119185604.GZ1509407@habkost.net> (Eduardo Habkost's message
 of "Thu, 19 Nov 2020 13:56:04 -0500")
Message-ID: <87wnyg7c1i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Nov 19, 2020 at 11:39:14AM +0100, Markus Armbruster wrote:
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>>=20
>> > On Tue, Nov 17, 2020 at 2:48 AM Eduardo Habkost <ehabkost@redhat.com> =
wrote:
>> >
>> >> Use QNumValue to represent QNums, so we can also support uint64_t
>> >> and double QNum values.  Add new QLIT_QNUM_(INT|UINT|DOUBLE)
>> >> macros for each case.
>> >>
>> >> The QLIT_QNUM() macro is being kept for compatibility with
>> >> existing code, but becomes just a wrapper for QLIT_QNUM_INT().
>> >>
>> >
>> > I am not sure it's worth to keep. (furthermore, it's only used in test=
s
>> > afaics)
>>=20
>> Seconded.
>
> Understood, I will remove it.  I thought the QAPI code generator
> was using it.
>
> [...]
>> >> diff --git a/qobject/qlit.c b/qobject/qlit.c
>> >> index be8332136c..b23cdc4532 100644
>> >> --- a/qobject/qlit.c
>> >> +++ b/qobject/qlit.c
>> >> @@ -71,7 +71,8 @@ bool qlit_equal_qobject(const QLitObject *lhs, cons=
t
>> >> QObject *rhs)
>> >>      case QTYPE_QBOOL:
>> >>          return lhs->value.qbool =3D=3D qbool_get_bool(qobject_to(QBo=
ol, rhs));
>> >>      case QTYPE_QNUM:
>> >> -        return lhs->value.qnum =3D=3D  qnum_get_int(qobject_to(QNum,=
 rhs));
>> >> +        return qnum_value_is_equal(&lhs->value.qnum,
>> >> +                                   qnum_get_value(qobject_to(QNum, r=
hs)));
>>=20
>> Before the patch, we crash when @rhs can't be represented as int64_t.
>
> I thought it was expected behavior?  QLit never supported
> QNUM_U64 or QNUM_DOUBLE as input.

Yes.  It's a known limitation, not a bug.  You're lifting the
limitation, and that's worth noting in the commit message.

>> Afterwards, we return false (I think).
>>=20
>> Please note this in the commit message.  A separate fix preceding this
>> patch would be even better, but may not be worth the trouble.  Up to
>> you.
>
> The fix would be 3 or 4 extra lines of code that would be
> immediately deleted.  I'll just mention it as a side effect of
> the new feature.

That's okay.

>> >>      case QTYPE_QSTRING:
>> >>          return (strcmp(lhs->value.qstr,
>> >>                         qstring_get_str(qobject_to(QString, rhs))) =
=3D=3D 0);
>> >> @@ -94,7 +95,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)
>> >>      case QTYPE_QNULL:
>> >>          return QOBJECT(qnull());
>> >>      case QTYPE_QNUM:
>> >> -        return QOBJECT(qnum_from_int(qlit->value.qnum));
>> >> +        return QOBJECT(qnum_from_value(qlit->value.qnum));
>> >>      case QTYPE_QSTRING:
>> >>          return QOBJECT(qstring_from_str(qlit->value.qstr));
>> >>      case QTYPE_QDICT: {
>> >> diff --git a/tests/check-qjson.c b/tests/check-qjson.c
>> >> index 07a773e653..711030cffd 100644
>> >> --- a/tests/check-qjson.c
>> >> +++ b/tests/check-qjson.c
>> >> @@ -796,20 +796,23 @@ static void simple_number(void)
>> >>      int i;
>> >>      struct {
>> >>          const char *encoded;
>> >> +        QLitObject qlit;
>> >>          int64_t decoded;
>> >>          int skip;
>> >>      } test_cases[] =3D {
>> >> -        { "0", 0 },
>> >> -        { "1234", 1234 },
>> >> -        { "1", 1 },
>> >> -        { "-32", -32 },
>> >> -        { "-0", 0, .skip =3D 1 },
>> >> +        { "0",    QLIT_QNUM(0),    0, },
>> >> +        { "1234", QLIT_QNUM(1234), 1234, },
>> >> +        { "1",    QLIT_QNUM(1),    1, },
>> >> +        { "-32",  QLIT_QNUM(-32),  -32, },
>> >> +        { "-0",   QLIT_QNUM(0),    0, .skip =3D 1 },
>>=20
>> Note .qlit is always QLIT_QNUM(.decoded).  Would doing without .qlit
>> result in a simpler patch?
>
> Good point.  When I wrote this, I mistakenly thought we would end
> up having different types of qlits in the array.
>
> I still want to test multiple types of QNums here, not just
> QNUM_I64.  I will try to get something that is simple but also
> gets us more coverage.  Maybe as a separate test function and/or
> a separate patch.

Use your judgement :)

[...]


