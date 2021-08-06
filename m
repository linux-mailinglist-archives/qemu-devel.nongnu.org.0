Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279B3E2972
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:22:03 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxvO-0006L7-G2
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBxtf-0004l4-0L
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBxtc-00018l-Fy
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628248811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9Em7qI7etUepvbf7vDRJax9TNmlJAGwI8qn3HxyQOk=;
 b=WhRFMrYN7p6W61Ct8F2dSXGWxKDdyrAu9TCJvaIXlwbDo7sS8bTzbb2+4A5B8w6awgpRpw
 JAJkLB8baRvR5PEbN99iqa4T1qL64eX5S4YsZiIXLrvm1GFPuFyiSNjKwHttDSZaWd3AbU
 +YMSXk3vX+FEjzKP81MgVXlIcqy5cus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-gsRD3a4XP_yegZF9XvsilQ-1; Fri, 06 Aug 2021 07:19:57 -0400
X-MC-Unique: gsRD3a4XP_yegZF9XvsilQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A7631008069
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 11:19:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 583F9779D0;
 Fri,  6 Aug 2021 11:19:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E6A3811380A0; Fri,  6 Aug 2021 13:19:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v6 02/11] qapi: wrap Sequence[str] in an object
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-3-marcandre.lureau@redhat.com>
 <87czqwtd5v.fsf@dusky.pond.sub.org>
 <CAMxuvawv2-=90LUt_ByMhwckAcH=3M4h3oQvCoFbk=qavrfjWg@mail.gmail.com>
Date: Fri, 06 Aug 2021 13:19:46 +0200
In-Reply-To: <CAMxuvawv2-=90LUt_ByMhwckAcH=3M4h3oQvCoFbk=qavrfjWg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 4 Aug 2021
 12:22:48 +0400")
Message-ID: <8735rmzup9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
>> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> > index d1d27ff7ee..5e44164bd1 100644
>> > --- a/scripts/qapi/schema.py
>> > +++ b/scripts/qapi/schema.py
[...]
>> > @@ -968,11 +974,13 @@ def _def_predefineds(self):
>> >      def _make_features(self, features, info):
>> >          if features is None:
>> >              return []
>> > -        return [QAPISchemaFeature(f['name'], info, f.get('if'))
>> > +        return [QAPISchemaFeature(f['name'], info,
>> > +                                  QAPISchemaIfCond(f.get('if')))
>> >                  for f in features]
>> >
>> >      def _make_enum_members(self, values, info):
>> > -        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
>> > +        return [QAPISchemaEnumMember(v['name'], info,
>> > +                                     QAPISchemaIfCond(v.get('if')))
>> >                  for v in values]
>> >
>>
>> Two more instances of pattern #3, only here we wrap values we get from
>> the JSON parser.  These are either None or non-empty lists.
>>
>> >      def _make_implicit_enum_type(self, name, info, ifcond, values):
>> > @@ -1008,7 +1016,10 @@ def _make_implicit_object_type(self, name, info=
, ifcond, role, members):
>>            if typ:
>>                # The implicit object type has multiple users.  This can
>>                # happen only for simple unions' implicit wrapper types.
>>                # Its ifcond should be the disjunction of its user's
>>                # ifconds.  Not implemented.  Instead, we always pass the
>>                # wrapped type's ifcond, which is trivially the same for =
all
>>                # users.  It's also necessary for the wrapper to compile.
>>                # But it's not tight: the disjunction need not imply it. =
 We
>>                # may end up compiling useless wrapper types.
>> >              # TODO kill simple unions or implement the disjunction
>> >
>> >              # pylint: disable=3Dprotected-access
>> > -            assert (ifcond or []) =3D=3D typ._ifcond
>> > +            if isinstance(ifcond, QAPISchemaIfCond):
>> > +                assert ifcond.ifcond =3D=3D typ._ifcond.ifcond
>> > +            else:
>> > +                assert ifcond =3D=3D typ._ifcond
>> >          else:
>> >              self._def_entity(QAPISchemaObjectType(
>> >                  name, info, None, ifcond, None, None, members, None))
>>
>> This is the non-mechanical change mentioned in the commit message.
>>
>> Can you explain where the two cases come from?
>>
>>
> _make_simple_variant() calls _make_implicit_object_type() with
> self.lookup_type(typ).
>
> I think it could instead call with the ._ifcond value.
>
> To be done after?

We can't.

._make_implicit_object_type() is called by ._make_simple_variant(),
._def_union_type(), ._def_command(), and ._def_event().

The latter three all pass QAPISchemaIfCond(expr.get('if')).
Straightforward.

._make_simple_variant() passes self.lookup_type(typ), i.e. a
QAPISchemaType.  The condition is to be inherited from the type.

We can't pass ._ifcond, because it becomes valid only at .check().
Commit f9d1743b9b0 explains:

    * A QAPISchemaEntity's .ifcond becomes valid at .check().  This is due
      to arrays and simple unions.
   =20
      Most types get ifcond and info passed to their constructor.
   =20
      Array types don't: they get it from their element type, which
      becomes known only in .element_type.check().
   =20
      The implicit wrapper object types for simple union branches don't:
      they get it from the wrapped type, which might be an array.
   =20
      Ditch the idea to set .ifcond in .check().  Instead, turn it into a
      property and compute it on demand.  Safe because it's only used
      after the schema has been checked.
   =20
      Most types simply return the ifcond passed to their constructor.
   =20
      Array types forward to their .element_type instead, and the wrapper
      types forward to the wrapped type.

We really need to kill off "simple" unions.

I was tempted to accept your patch as is, but then my spider sense made
me dig deeper.

When an implicit object type has multiple users, we call
._make_implicit_object_type() multiple times.  The first call creates
the type, subsequent calls reuse it.  The assertion ensures we pass the
same condition to subsequent calls, so reuse is actually valid.

Assertion before the patch:

        typ =3D self.lookup_entity(name, QAPISchemaObjectType)

@typ is the QAPISchemaType created by the first call, if any.

        if typ:

This is a subsequent call, and @ifcond is its argument.

            [...]
            assert (ifcond or []) =3D=3D typ._ifcond

typ._ifcond comes from the first call's @ifcond argument, which created
@typ and intialized typ._ifcond in QAPISchemaEntity.__init__():

        self._ifcond =3D ifcond or []

The assertion asserts "same condition argument", as intended.  It
carefully avoids use of potentially invalid .ifcond.  Good.

For simple union branch wrapper types, @ifcond is the QAPISchemaType
we're wrapping.  The assertion boils down to ifcond =3D=3D typ._ifcond,
i.e. we assert we pass the same type.  Still good.

The comment before the assertion claims this is the only way to get
here:

            # The implicit object type has multiple users.  This can
            # happen only for simple unions' implicit wrapper types.

Not true, as tests/qapi-schema/redefined-command.json demonstrates: we
get here for unboxed redefined commands, too.

For implicit object types other than simple union branch wrapper types,
i.e. for anonymous union base types, command and event argument types,
@ifcond is either None or a non-empty array of condition strings.  Now
the assertion asserts we pass the same Optional[List[str]].  Quack!
This is *wrong*.  To demonstrate, feed it redefined-command.json
modified like this:

    # we reject commands defined more than once
    { 'command': 'foo', 'data': { 'one': 'str' } }
    { 'command': 'foo', 'data': { '*two': 'str' }, 'if': 'defined(FOO)' }

It trips the assertion.

Your patch wraps QAPISchemaIfCond() around non-empty arrays, and
replaces None by QAPISchemaIfCond([]).

Doesn't affect @ifcond arguments for simple union branch wrapper types.
The assertion continues to work as intended.

Does affect @ifcond arguments for the other implicit object types.
There, we now need to compare the wrapped value instead.  Thus, the
quackery doesn't work anymore, and we need something like

            if simple union wrapper type:
                assert (ifcond or []) =3D=3D typ._ifcond # old assertion
            else:
                assert ifcond.ifcond =3D=3D typ._ifcond.ifcond

Your patch uses an indirect way to determine the condition, negates it,
and simplifies the old assertion a bit:

            if isinstance(ifcond, QAPISchemaIfCond):
                assert ifcond.ifcond =3D=3D typ._ifcond.ifcond
            else:
                assert ifcond =3D=3D typ._ifcond

All fine, except the assertion remains just as wrong as it was :)

I'll send a patch to delete it, to be inserted before your series.

[...]


