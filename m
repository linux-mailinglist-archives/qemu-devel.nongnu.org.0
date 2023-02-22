Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782F869EFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 09:07:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUk8d-0001l8-6y; Wed, 22 Feb 2023 03:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUk8F-0001eU-F6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 03:05:50 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUk8C-0007iK-W0
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 03:05:42 -0500
Received: by mail-lj1-x22c.google.com with SMTP id h9so6790551ljq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 00:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQLeHE27poLoyke9lDuvYa6h+KN9AXLtP8deo/vIEgI=;
 b=S85i/6K5Ahs/xovihLeK0MhPfXqXcBevNNzWQcJCXKgM+67EPKVu3kyump5/xTc6qX
 9sxZmPW+tH5yIsyRCixzwIM8EAUCCBhTbu2mPrPfh/JZIJWnW1OC1j1sQwMM1m41wjvS
 /CmfG6t/m4lmMPIKnhyZwFCxdbiu/WR7Fzsjp1WTMCiW2nF/5TBoghMZRbxQYBrEeolR
 5XIthXj6ZrrcaCgqQXwfMSRuL2nGKrS23vgZXJXH3tMLWX7YFmsdxRLnH9zcRmjhtNhV
 N5mdSvzDlFis8C3SidPW4qjo8IbTn0FXzAShTQKPXiZFXNe3p2QbJOtNqemmws8lyrxh
 Wn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uQLeHE27poLoyke9lDuvYa6h+KN9AXLtP8deo/vIEgI=;
 b=576RDrsuVl+FkrGbNvI606VO0UG/LGYxYVoJPprF4WABxRiVTM/liS4s3zFTX8OxBE
 wyGyaG9cpwEeFvyoRgU7Jt5k0tQ41/AndHgYx2H6xBSY/JeOMEkaxpkz8pa40GHN6DP2
 aOgKPk/DZzV3kwhtwNPjpZKr3wa8F5Eh9B3LWjLcTXIEe9u3iIwDIo3vsvOyErt7y9wu
 0yrGstT5TGeFye5HwD6gS2oV0qOrZyhemPAsxwYLbbDUG+Mlo0KqNopyu4UBUWqR010e
 rmgYjUIBkTe4GTyMfJM3QzuqbXwUHimqqLPM09U9UZHC5cTPj7XVYreIX7GtvdPmP1zG
 C5Iw==
X-Gm-Message-State: AO0yUKUQEjVQ9SBTtTFZAYI/4FNYlq2a3IHIGIcMRDPR95/Lr+f2HqMp
 6oLHcgmuAfIaLrDQjl2plUy7hYbNdxycqhRfrlw=
X-Google-Smtp-Source: AK7set/8K2XxYOAXWEEvemO+/qMCCBQyqOTxyhq/6yUGHyvIxc9GzK3q1Ph9qITy80UTau6hlJq7VztsfwDxZjwpZ/4=
X-Received: by 2002:a05:651c:b9b:b0:295:945d:b382 with SMTP id
 bg27-20020a05651c0b9b00b00295945db382mr961977ljb.4.1677053138376; Wed, 22 Feb
 2023 00:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
In-Reply-To: <87a61821y3.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 12:05:26 +0400
Message-ID: <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Mon, Feb 20, 2023 at 12:10 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Hi Markus
> >
> > On Fri, Feb 17, 2023 at 12:28 PM Markus Armbruster <armbru@redhat.com>
> > wrote:
> >
> >> marcandre.lureau@redhat.com writes:
> >>
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > The generated code doesn't quite handle the conditional arguments.
> >> > For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #=
if
> >> > conditions. See generated code in qmp_marshal_test_if_cmd().
> >> >
> >> > Note that if there are multiple optional arguments at the last posit=
ion,
> >> > there might be compilation issues due to extra comas. I left an asse=
rt
> >> > and FIXME for later.
> >> >
> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> > ---
> >> >  scripts/qapi/commands.py                |  4 ++++
> >> >  scripts/qapi/gen.py                     | 19 ++++++++++++++-----
> >> >  scripts/qapi/visit.py                   |  2 ++
> >> >  tests/qapi-schema/qapi-schema-test.json |  3 ++-
> >> >  4 files changed, 22 insertions(+), 6 deletions(-)
> >> >
> >> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> >> > index 79c5e5c3a9..07997d1586 100644
> >> > --- a/scripts/qapi/commands.py
> >> > +++ b/scripts/qapi/commands.py
> >> > @@ -64,9 +64,13 @@ def gen_call(name: str,
> >> >      elif arg_type:
> >> >          assert not arg_type.variants
> >> >          for memb in arg_type.members:
> >> > +            if memb.ifcond.is_present():
> >> > +                argstr +=3D '\n' + memb.ifcond.gen_if()
> >> >              if memb.need_has():
> >> >                  argstr +=3D 'arg.has_%s, ' % c_name(memb.name)
> >> >              argstr +=3D 'arg.%s, ' % c_name(memb.name)
> >> > +            if memb.ifcond.is_present():
> >> > +                argstr +=3D '\n' + memb.ifcond.gen_endif()
> >> >
> >> >      lhs =3D ''
> >> >      if ret_type:
> >>
> >> @argstr is emitted further down:
> >>
> >>        %(lhs)sqmp_%(name)s(%(args)s&err);
> >>    ''',
> >>                     name=3Dname, args=3Dargstr, lhs=3Dlhs)
> >>
> >>        ret +=3D mcgen('''
> >>        if (err) {
> >>    ''')
> >>
> >> Before the patch, @argstr contains no newlines.  Works.
> >>
> >> After the patch, it may contain newlines, and if it does, intentation =
is
> >> messed up.  For instance, in the code generated for
> >> qapi-schema-test.json:
> >>
> >>         retval =3D qmp_test_if_cmd(arg.foo,
> >>     #if defined(TEST_IF_CMD_BAR)
> >>     arg.bar,
> >>     #endif /* defined(TEST_IF_CMD_BAR) */
> >>     &err);
> >>
> >> Strings interpolated into the mcgen() argument should not contain
> >> newlines.  I'm afraid you have to rewrite the code emitting the call.
> >>
> >
> > Why it should not contain newlines?
>
> They mess up indentation.  I think.  It's been a while...  All I really
> know for sure is that the generated code's indentation is messed up
> right there.
>
> > What are you asking exactly? that the caller be changed? (this does not
> > work well if there are multiple optional arguments..)
> >
> >     #if defined(TEST_IF_CMD_BAR)
> >         retval =3D qmp_test_if_cmd(arg.foo, arg.bar, &err);
> >     #else
> >         retval =3D qmp_test_if_cmd(arg.foo, &err);
> >     #endif /* defined(TEST_IF_CMD_BAR) */
>
> I'm asking for better indentation.  In handwritten code, we'd do
>
>         retval =3D qmp_test_if_cmd(arg.foo,
>     #if defined(TEST_IF_CMD_BAR)
>                                  arg.bar,
>     #endif /* defined(TEST_IF_CMD_BAR) */
>                                  &err);
>
> Keeping track of how far to indent the arguments is bothersome in the
> generator, though.  Perhaps we could create infrastructure to make it
> not bothersome, but I'm not asking for that.  Something like this should
> be good enough:
>
>         retval =3D qmp_test_if_cmd(arg.foo,
>     #if defined(TEST_IF_CMD_BAR)
>                     arg.bar,
>     #endif /* defined(TEST_IF_CMD_BAR) */
>                     &err);
>
> I.e. indent to the function call and then some.

ok, I improved the indentation a bit.

However, I think it would be simpler, and better, if we piped the
generated code to clang-format (when available). I made a simple patch
for that too.

>
> >> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> >> > index b5a8d03e8e..ba57e72c9b 100644
> >> > --- a/scripts/qapi/gen.py
> >> > +++ b/scripts/qapi/gen.py
> >> > @@ -111,22 +111,31 @@ def build_params(arg_type: Optional[QAPISchema=
ObjectType],
> >> >                   boxed: bool,
> >> >                   extra: Optional[str] =3D None) -> str:
> >> >      ret =3D ''
> >> > -    sep =3D ''
> >> >      if boxed:
> >> >          assert arg_type
> >> >          ret +=3D '%s arg' % arg_type.c_param_type()
> >> > -        sep =3D ', '
> >> > +        if extra:
> >> > +            ret +=3D ', '
> >> >      elif arg_type:
> >> >          assert not arg_type.variants
> >> > +        n =3D 0
> >> >          for memb in arg_type.members:
> >> > -            ret +=3D sep
> >> > -            sep =3D ', '
> >> > +            n +=3D 1
> >> > +            if memb.ifcond.is_present():
> >> > +                ret +=3D '\n' + memb.ifcond.gen_if()
> >> >              if memb.need_has():
> >> >                  ret +=3D 'bool has_%s, ' % c_name(memb.name)
> >> >              ret +=3D '%s %s' % (memb.type.c_param_type(),
> >> >                                c_name(memb.name))
> >> > +            if extra or n !=3D len(arg_type.members):
> >> > +                ret +=3D ', '
> >> > +            else:
> >> > +                # FIXME: optional last argument may break compilati=
on
> >> > +                assert not memb.ifcond.is_present()
> >>
> >> Does the assertion guard against the C compilation failure?
> >
> > Yes
> >
> >>
> >> Is it possible to write schema code that triggers it?
> >
> > Yes, the one we have for TEST_IF_EVENT for example:
> >
> > { 'event': 'TEST_IF_EVENT',
> >   'data': { 'foo': 'TestIfStruct',
> >             'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } =
},
>
> This is the one you put in qapi-schema-test.json less the last
> parameter, so that the conditional parameter becomes the last one.
>
> > produces:
> >
> > void qapi_event_send_test_if_event(TestIfStruct *foo,
> > #if defined(TEST_IF_EVT_BAR)
> > TestIfEnumList *bar,
> > #endif /* defined(TEST_IF_EVT_BAR) */
> > );
> >
> > Which will fail to compile if TEST_IF_EVT_BAR is undefined.
>
> I think it'll fail to compile always, because the parameter list has a
> trailing comma regardless of TEST_IF_EVT_BAR.

Yes, I think I hand-wrote that example, the actual generator does not
leave a trailing comma here.

>
> > So I would rather assert that we don't introduce such a schema, until w=
e
> > fix the code generator. Or we acknowledge the limitation, and treat it =
as a
> > schema error. Other ideas?
>
> Yes: throw an error.  Assertions are for programming errors.  This isn't
> a programming error, it's a limitation of the current implementation.
>
> How hard would it be to lift the limitation?

Taking this as a problematic example:

void function(first,
#ifdef A
    a,
#endif
#ifdef B
    b
#endif
)

I think it would mean that we would have to pass arguments as a
structure, as they don't have the limitation of trailing coma in
initializers. That would not be idiomatic C though, and we would need
to refactor a lot of code..

Another option is to always pass a dummy last argument? :)

void command(first,
#ifdef A
    a,
#endif
#ifdef B
    b,
#endif
    dummy)


>
> >> > +            if memb.ifcond.is_present():
> >> > +                ret +=3D '\n' + memb.ifcond.gen_endif()
> >> >      if extra:
> >> > -        ret +=3D sep + extra
> >> > +        ret +=3D extra
> >> >      return ret if ret else 'void'
> >> >
> >> >
> >>
> >> Same newline issue as in gen_call().  Generated code:
> >>
> >>     UserDefThree *qmp_test_if_cmd(TestIfStruct *foo,
> >>     #if defined(TEST_IF_CMD_BAR)
> >>     TestIfEnum bar,
> >>     #endif /* defined(TEST_IF_CMD_BAR) */
> >>     Error **errp);
> >>
> >> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> >> > index 26a584ee4c..c56ea4d724 100644
> >> > --- a/scripts/qapi/visit.py
> >> > +++ b/scripts/qapi/visit.py
> >> > @@ -74,11 +74,13 @@ def gen_visit_object_members(name: str,
> >> >      sep =3D ''
> >> >      for memb in members:
> >> >          if memb.optional and not memb.need_has():
> >> > +            ret +=3D memb.ifcond.gen_if()
> >> >              ret +=3D mcgen('''
> >> >      bool has_%(c_name)s =3D !!obj->%(c_name)s;
> >> >  ''',
> >> >                           c_name=3Dc_name(memb.name))
> >> >              sep =3D '\n'
> >> > +            ret +=3D memb.ifcond.gen_endif()
> >> >      ret +=3D sep
> >> >
> >> >      if base:
> >>
> >> This hunk has no effect on the code generated for our schemas as far a=
s
> >> I can tell.  Is it superfluous?  Incorrect?  Gap in test coverage?  Or
> >> am I confused?
> >>
> >>
> > Right, we could change the test this way to exercise it:
> >
> > --- a/tests/qapi-schema/qapi-schema-test.json
> > +++ b/tests/qapi-schema/qapi-schema-test.json
> > @@ -250,7 +250,7 @@
> >  { 'command': 'test-if-cmd',
> >    'data': {
> >      'foo': 'TestIfStruct',
> > -    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_BAR' } },
> > +    '*bar': { 'type': 'TestIfStruct', 'if': 'TEST_IF_STRUCT' } },
> >    'returns': 'UserDefThree',
>
> Please exercise it :)

ok

>
> >> > diff --git a/tests/qapi-schema/qapi-schema-test.json
> >> b/tests/qapi-schema/qapi-schema-test.json
> >> > index ba7302f42b..baa4e69f63 100644
> >> > --- a/tests/qapi-schema/qapi-schema-test.json
> >> > +++ b/tests/qapi-schema/qapi-schema-test.json
> >> > @@ -258,7 +258,8 @@
> >> >
> >> >  { 'event': 'TEST_IF_EVENT',
> >> >    'data': { 'foo': 'TestIfStruct',
> >> > -            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR=
' }
> >> },
> >> > +            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR=
' },
> >> > +            'baz': 'int' },
> >> >    'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
> >> >
> >> >  { 'event': 'TEST_IF_EVENT2', 'data': {},
> >>
> >>
>
>

thanks

--=20
Marc-Andr=C3=A9 Lureau

