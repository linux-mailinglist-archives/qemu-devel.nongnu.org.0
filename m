Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1853E12F3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:47:13 +0200 (CEST)
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBau8-0000iN-JH
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBas9-0007bR-B5
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:45:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBas7-0002vY-Ey
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628160306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g93HKTxpIVNgJCJOeSiCh3Edjsh/QKoE4lOTK17fRnk=;
 b=IBEmOJnz5SXpAG0nVPJdSWcj3dQPfdSqcI6meaPSnHsmZKtCPX4nLgEDd5mDqSsz8hnhl5
 e1PtA74TRLXen4WGBoeHZ5isNNhxQrOTZkSzMC7mjgzaAiwANTbxr3Qc6pyFbre3GoUp0i
 87alu2C5wdgFW0hDkHBlN7tgMQGPyMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-eLvUTaM_N_2xfN7qcFsJPQ-1; Thu, 05 Aug 2021 06:45:02 -0400
X-MC-Unique: eLvUTaM_N_2xfN7qcFsJPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F64B87D543
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 10:45:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA6DF69CBB;
 Thu,  5 Aug 2021 10:44:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DE3611380A0; Thu,  5 Aug 2021 12:44:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v6 02/11] qapi: wrap Sequence[str] in an object
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-3-marcandre.lureau@redhat.com>
 <87czqwtd5v.fsf@dusky.pond.sub.org>
 <CAMxuvawv2-=90LUt_ByMhwckAcH=3M4h3oQvCoFbk=qavrfjWg@mail.gmail.com>
Date: Thu, 05 Aug 2021 12:44:47 +0200
In-Reply-To: <CAMxuvawv2-=90LUt_ByMhwckAcH=3M4h3oQvCoFbk=qavrfjWg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 4 Aug 2021
 12:22:48 +0400")
Message-ID: <87zgtw9nmo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Mon, Aug 2, 2021 at 1:21 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Except for the special casing assert in _make_implicit_object_type(),
>> > which needs to handle schema objects, it's a mechanical change.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
[...]
>> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> > index 9a348ca2e5..77a8c33ad4 100644
>> > --- a/scripts/qapi/introspect.py
>> > +++ b/scripts/qapi/introspect.py
[...]
>> > @@ -125,10 +124,10 @@ def indent(level: int) -> str:
>> >          if obj.comment:
>> >              ret +=3D indent(level) + f"/* {obj.comment} */\n"
>> >          if obj.ifcond:
>> > -            ret +=3D gen_if(obj.ifcond)
>> > +            ret +=3D gen_if(obj.ifcond.ifcond)
>> >          ret +=3D _tree_to_qlit(obj.value, level)
>> >          if obj.ifcond:
>> > -            ret +=3D '\n' + gen_endif(obj.ifcond)
>> > +            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
>> >          return ret
>> >
>> >      ret =3D ''
>>
>> You update obj.ifcond to obj.ifcond.ifcond when used as argument of
>> gen_if() and gen_endif().  This changes the argument from Tuple to
>> Sequence.  Fine, because Tuple is a special Sequence.
>>
>> Digression: I don't (anymore) understand why we made self.ifcond Tuple.
>> John, do you remember?
>>
>> You don't update obj.ifcond when used as conditional.  The code now
>> calls gen_if() and gen_endif() even for an empty Sequence.
>>
>> I believe this can't actually happen because check_if() rejects [] with
>> "'if' condition [] of %s is useless".
>>
>> Still, the mechanical change should update to obj.ifcond even when used
>> as conditional.
>>
>> Are there other, possibly not so harmless uses of values that change
>> from Sequence to QAPISchemaIfCond the patch doesn't update?
>>
>> Or asked differently: how did you find what to update?
>>
>
> Eh, you are asking me for something I spent just a few hours a few times
> over the last year. Sorry!

That's fair.

> Most probably simply with code reading/grepping, linter and the test suit=
e.

Plausible.

I'm somewhat worried about the bug pattern, but a thorough search feels
uneconomical.  Instead, I've attempted two things to flush out such
bugs:

* Run "make check" with the appended patch.  Fails with v6, i.e. it can
  detect execution of the bug pattern.  Passes with v7.

* The variables holding QAPISchemaIfCond are generally named @ifcond.
  Eyeball grep -w ifcond with ifcond.MUMBLE, ifcond: QAPISchemaIfCond,
  and def parameter lists ignored.  Most remaining grep hits move values
  around.  I can see a few hits where @ifcond is used like a boolean:

  - In docgen_ifcond() and cgen_ifcond(), but @ifcond isn't
    QAPISchemaIfCond there.  Okay, but there's an unrelated oddity I'll
    discuss in review of PATCH 07.

  - In QAPISchemaIfCond.__init__(): likewise.

  - In QAPISchemaEntity.__init__() and QAPISchemaMember.__init__():
    okay, because @ifcond is Optional[QAPISchemaIfCond] there.

  - In check_if(), but @ifcond isn't QAPISchemaIfCond there.  Okay.

I think that's all we can sensibly do now.

[...]


diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 627735a431..a71ad31d59 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -43,6 +43,9 @@ def docgen(self):
     def is_present(self):
         return bool(self.ifcond)
=20
+    def __bool__(self):
+        assert False
+
=20
 class QAPISchemaEntity:
     meta: Optional[str] =3D None
@@ -61,7 +64,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNone, f=
eatures=3DNone):
         # such place).
         self.info =3D info
         self.doc =3D doc
-        self._ifcond =3D ifcond or QAPISchemaIfCond()
+        self._ifcond =3D ifcond if ifcond !=3D None else QAPISchemaIfCond(=
)
         self.features =3D features or []
         self._checked =3D False
=20
@@ -665,7 +668,7 @@ def __init__(self, name, info, ifcond=3DNone):
         assert isinstance(name, str)
         self.name =3D name
         self.info =3D info
-        self.ifcond =3D ifcond or QAPISchemaIfCond()
+        self.ifcond =3D ifcond if ifcond !=3D None else QAPISchemaIfCond()
         self.defined_in =3D None
=20
     def set_defined_in(self, name):


