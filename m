Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602CD69B97D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 11:46:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTKir-0005aW-3y; Sat, 18 Feb 2023 05:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pTKio-0005a6-VH
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 05:45:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pTKim-0008QA-AC
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 05:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676717134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hygKOvABY1gOX5fiGEwDlOPa+8ylXUdPr936XXtT4CQ=;
 b=BKuSSvkGjPYQbgikuPV6MuhZNdSSMPDErOQWtoy6qP4racLS841upDsDLuJgKJc2DIbhHK
 q+T3cR0/hqr1yBw6RPVFzkP401ZPs6k56ZvcQzHS7Z1+5WJBrK4rcKrSU78J1g9YVv9IPp
 3XMifzI7AipgX4sm6Jo9912wfi6jHsw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-kBGV8IUtMHmhdQAGl3athQ-1; Sat, 18 Feb 2023 05:45:33 -0500
X-MC-Unique: kBGV8IUtMHmhdQAGl3athQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 fd8-20020a056402388800b004ad793116d5so3226035edb.23
 for <qemu-devel@nongnu.org>; Sat, 18 Feb 2023 02:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hygKOvABY1gOX5fiGEwDlOPa+8ylXUdPr936XXtT4CQ=;
 b=iwTeoftCi3k0X7s8RV8KUn26gRFlMZqBgHegSKz8WOBbWQyoeXVXmKlADoAWmQWqaF
 aXLbO5c1k8zK0XdRmh/fEmeGpdz84rM3efQPOqIM0fy8efXIM7gplJxsXkhHMn6hOTp+
 bo5nbDf+Gtt2pjORJXLaE+Jl8QmTxQdsczc2G51iT7Y3haOZ16DtC9H9RTupSA+BPXc0
 9UbEArZqClT2x9R9CikXy9EHUCv+p2LNSwHxDaGgb57AgZ2f+pkUY2lEe8XXJ1Bi7WiD
 bQvazWpbXFB88pZireVGShKcLDe1QTFfZvDf2hYTgk9l5Wo5zC1dmHCbUzWDwAEHrmcz
 a9VQ==
X-Gm-Message-State: AO0yUKU3/T09chIazNtykYR/susriUk4MnMeJfV/cNvYMzfoDynAFhN5
 qppDzAkRuUf4GaozsVMiWlfOThVriUk1Fl0TEf7VUviw5tdeJhPQUEYlp+khVM2AluSvUcjpPY+
 1nfebZUnxdRZowAyNPS0ksyfYFQOgL5c=
X-Received: by 2002:a50:ab1a:0:b0:4ad:7302:8bce with SMTP id
 s26-20020a50ab1a000000b004ad73028bcemr3429918edc.8.1676717131998; 
 Sat, 18 Feb 2023 02:45:31 -0800 (PST)
X-Google-Smtp-Source: AK7set97gjbL6ktVvFU2n78NxLSKNg4NAHAjZUg4o0xgMdltCpiTDM+BHSCWpRzS6DfMv7wSzLqqsdAixNoBPL99mU0=
X-Received: by 2002:a50:ab1a:0:b0:4ad:7302:8bce with SMTP id
 s26-20020a50ab1a000000b004ad73028bcemr3429897edc.8.1676717131683; Sat, 18 Feb
 2023 02:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
In-Reply-To: <87fsb4k85h.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sat, 18 Feb 2023 14:45:19 +0400
Message-ID: <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000005ec1c05f4f72183"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000005ec1c05f4f72183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus

On Fri, Feb 17, 2023 at 12:28 PM Markus Armbruster <armbru@redhat.com>
wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The generated code doesn't quite handle the conditional arguments.
> > For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #if
> > conditions. See generated code in qmp_marshal_test_if_cmd().
> >
> > Note that if there are multiple optional arguments at the last position=
,
> > there might be compilation issues due to extra comas. I left an assert
> > and FIXME for later.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  scripts/qapi/commands.py                |  4 ++++
> >  scripts/qapi/gen.py                     | 19 ++++++++++++++-----
> >  scripts/qapi/visit.py                   |  2 ++
> >  tests/qapi-schema/qapi-schema-test.json |  3 ++-
> >  4 files changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 79c5e5c3a9..07997d1586 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -64,9 +64,13 @@ def gen_call(name: str,
> >      elif arg_type:
> >          assert not arg_type.variants
> >          for memb in arg_type.members:
> > +            if memb.ifcond.is_present():
> > +                argstr +=3D '\n' + memb.ifcond.gen_if()
> >              if memb.need_has():
> >                  argstr +=3D 'arg.has_%s, ' % c_name(memb.name)
> >              argstr +=3D 'arg.%s, ' % c_name(memb.name)
> > +            if memb.ifcond.is_present():
> > +                argstr +=3D '\n' + memb.ifcond.gen_endif()
> >
> >      lhs =3D ''
> >      if ret_type:
>
> @argstr is emitted further down:
>
>        %(lhs)sqmp_%(name)s(%(args)s&err);
>    ''',
>                     name=3Dname, args=3Dargstr, lhs=3Dlhs)
>
>        ret +=3D mcgen('''
>        if (err) {
>    ''')
>
> Before the patch, @argstr contains no newlines.  Works.
>
> After the patch, it may contain newlines, and if it does, intentation is
> messed up.  For instance, in the code generated for
> qapi-schema-test.json:
>
>         retval =3D qmp_test_if_cmd(arg.foo,
>     #if defined(TEST_IF_CMD_BAR)
>     arg.bar,
>     #endif /* defined(TEST_IF_CMD_BAR) */
>     &err);
>
> Strings interpolated into the mcgen() argument should not contain
> newlines.  I'm afraid you have to rewrite the code emitting the call.
>

Why it should not contain newlines?

What are you asking exactly? that the caller be changed? (this does not
work well if there are multiple optional arguments..)

    #if defined(TEST_IF_CMD_BAR)
        retval =3D qmp_test_if_cmd(arg.foo, arg.bar, &err);
    #else
        retval =3D qmp_test_if_cmd(arg.foo, &err);
    #endif /* defined(TEST_IF_CMD_BAR) */


>
> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> > index b5a8d03e8e..ba57e72c9b 100644
> > --- a/scripts/qapi/gen.py
> > +++ b/scripts/qapi/gen.py
> > @@ -111,22 +111,31 @@ def build_params(arg_type:
> Optional[QAPISchemaObjectType],
> >                   boxed: bool,
> >                   extra: Optional[str] =3D None) -> str:
> >      ret =3D ''
> > -    sep =3D ''
> >      if boxed:
> >          assert arg_type
> >          ret +=3D '%s arg' % arg_type.c_param_type()
> > -        sep =3D ', '
> > +        if extra:
> > +            ret +=3D ', '
> >      elif arg_type:
> >          assert not arg_type.variants
> > +        n =3D 0
> >          for memb in arg_type.members:
> > -            ret +=3D sep
> > -            sep =3D ', '
> > +            n +=3D 1
> > +            if memb.ifcond.is_present():
> > +                ret +=3D '\n' + memb.ifcond.gen_if()
> >              if memb.need_has():
> >                  ret +=3D 'bool has_%s, ' % c_name(memb.name)
> >              ret +=3D '%s %s' % (memb.type.c_param_type(),
> >                                c_name(memb.name))
> > +            if extra or n !=3D len(arg_type.members):
> > +                ret +=3D ', '
> > +            else:
> > +                # FIXME: optional last argument may break compilation
> > +                assert not memb.ifcond.is_present()
>
> Does the assertion guard against the C compilation failure?
>

Yes


>
> Is it possible to write schema code that triggers it?
>

Yes, the one we have for TEST_IF_EVENT for example:

{ 'event': 'TEST_IF_EVENT',
  'data': { 'foo': 'TestIfStruct',
            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },

produces:

void qapi_event_send_test_if_event(TestIfStruct *foo,
#if defined(TEST_IF_EVT_BAR)
TestIfEnumList *bar,
#endif /* defined(TEST_IF_EVT_BAR) */
);

Which will fail to compile if TEST_IF_EVT_BAR is undefined.

So I would rather assert that we don't introduce such a schema, until we
fix the code generator. Or we acknowledge the limitation, and treat it as a
schema error. Other ideas?


> > +            if memb.ifcond.is_present():
> > +                ret +=3D '\n' + memb.ifcond.gen_endif()
> >      if extra:
> > -        ret +=3D sep + extra
> > +        ret +=3D extra
> >      return ret if ret else 'void'
> >
> >
>
> Same newline issue as in gen_call().  Generated code:
>
>     UserDefThree *qmp_test_if_cmd(TestIfStruct *foo,
>     #if defined(TEST_IF_CMD_BAR)
>     TestIfEnum bar,
>     #endif /* defined(TEST_IF_CMD_BAR) */
>     Error **errp);
>
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 26a584ee4c..c56ea4d724 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -74,11 +74,13 @@ def gen_visit_object_members(name: str,
> >      sep =3D ''
> >      for memb in members:
> >          if memb.optional and not memb.need_has():
> > +            ret +=3D memb.ifcond.gen_if()
> >              ret +=3D mcgen('''
> >      bool has_%(c_name)s =3D !!obj->%(c_name)s;
> >  ''',
> >                           c_name=3Dc_name(memb.name))
> >              sep =3D '\n'
> > +            ret +=3D memb.ifcond.gen_endif()
> >      ret +=3D sep
> >
> >      if base:
>
> This hunk has no effect on the code generated for our schemas as far as
> I can tell.  Is it superfluous?  Incorrect?  Gap in test coverage?  Or
> am I confused?
>
>
Right, we could change the test this way to exercise it:

--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -250,7 +250,7 @@
 { 'command': 'test-if-cmd',
   'data': {
     'foo': 'TestIfStruct',
-    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_BAR' } },
+    '*bar': { 'type': 'TestIfStruct', 'if': 'TEST_IF_STRUCT' } },
   'returns': 'UserDefThree',


> > diff --git a/tests/qapi-schema/qapi-schema-test.json
> b/tests/qapi-schema/qapi-schema-test.json
> > index ba7302f42b..baa4e69f63 100644
> > --- a/tests/qapi-schema/qapi-schema-test.json
> > +++ b/tests/qapi-schema/qapi-schema-test.json
> > @@ -258,7 +258,8 @@
> >
> >  { 'event': 'TEST_IF_EVENT',
> >    'data': { 'foo': 'TestIfStruct',
> > -            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' }
> },
> > +            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' }=
,
> > +            'baz': 'int' },
> >    'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
> >
> >  { 'event': 'TEST_IF_EVENT2', 'data': {},
>
>

--00000000000005ec1c05f4f72183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Markus<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 17, 2023 at 12:2=
8 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marc=
andre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The generated code doesn&#39;t quite handle the conditional arguments.=
<br>
&gt; For example, &#39;bar&#39; in &#39;test-if-cmd&#39; is not correctly s=
urrounded by #if<br>
&gt; conditions. See generated code in qmp_marshal_test_if_cmd().<br>
&gt;<br>
&gt; Note that if there are multiple optional arguments at the last positio=
n,<br>
&gt; there might be compilation issues due to extra comas. I left an assert=
<br>
&gt; and FIXME for later.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/commands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
&gt;=C2=A0 scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++++++++++++-----<br>
&gt;=C2=A0 scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 tests/qapi-schema/qapi-schema-test.json |=C2=A0 3 ++-<br>
&gt;=C2=A0 4 files changed, 22 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py<br>
&gt; index 79c5e5c3a9..07997d1586 100644<br>
&gt; --- a/scripts/qapi/commands.py<br>
&gt; +++ b/scripts/qapi/commands.py<br>
&gt; @@ -64,9 +64,13 @@ def gen_call(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 elif arg_type:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not arg_type.variants<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for memb in arg_type.members:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.ifcond.is_present()=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argstr +=3D &=
#39;\n&#39; + memb.ifcond.gen_if()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.need_has():<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argstr +=
=3D &#39;arg.has_%s, &#39; % c_name(<a href=3D"http://memb.name" rel=3D"nor=
eferrer" target=3D"_blank">memb.name</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argstr +=3D &#39;arg.%=
s, &#39; % c_name(<a href=3D"http://memb.name" rel=3D"noreferrer" target=3D=
"_blank">memb.name</a>)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.ifcond.is_present()=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argstr +=3D &=
#39;\n&#39; + memb.ifcond.gen_endif()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 lhs =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ret_type:<br>
<br>
@argstr is emitted further down:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0%(lhs)sqmp_%(name)s(%(args)s&amp;err);<br>
=C2=A0 =C2=A0&#39;&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=
=3Dname, args=3Dargstr, lhs=3Dlhs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
=C2=A0 =C2=A0&#39;&#39;&#39;)<br>
<br>
Before the patch, @argstr contains no newlines.=C2=A0 Works.<br>
<br>
After the patch, it may contain newlines, and if it does, intentation is<br=
>
messed up.=C2=A0 For instance, in the code generated for<br>
qapi-schema-test.json:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D qmp_test_if_cmd(arg.foo, <br>
=C2=A0 =C2=A0 #if defined(TEST_IF_CMD_BAR)<br>
=C2=A0 =C2=A0 arg.bar, <br>
=C2=A0 =C2=A0 #endif /* defined(TEST_IF_CMD_BAR) */<br>
=C2=A0 =C2=A0 &amp;err);<br>
<br>
Strings interpolated into the mcgen() argument should not contain<br>
newlines.=C2=A0 I&#39;m afraid you have to rewrite the code emitting the ca=
ll.<br></blockquote><div><br></div><div>Why it should not contain newlines?=
<br></div><div><br></div><div>What are you asking exactly? that the caller =
be changed? (this does not work well if there are multiple optional argumen=
ts..)<br></div><div><br></div><div>
=C2=A0 =C2=A0 #if defined(TEST_IF_CMD_BAR)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 retval =3D qmp_test_if_cmd(arg.foo, arg.bar, &amp;err);</div><div>=
=C2=A0=C2=A0=C2=A0 #else</div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =
=3D qmp_test_if_cmd(arg.foo, &amp;err);</div></div><div>=C2=A0 =C2=A0 #endi=
f /* defined(TEST_IF_CMD_BAR) */<br>
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py<br>
&gt; index b5a8d03e8e..ba57e72c9b 100644<br>
&gt; --- a/scripts/qapi/gen.py<br>
&gt; +++ b/scripts/qapi/gen.py<br>
&gt; @@ -111,22 +111,31 @@ def build_params(arg_type: Optional[QAPISchemaOb=
jectType],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo=
xed: bool,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ex=
tra: Optional[str] =3D None) -&gt; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 sep =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if boxed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert arg_type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;%s arg&#39; % arg_type=
.c_param_type()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sep =3D &#39;, &#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;, &#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 elif arg_type:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not arg_type.variants<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for memb in arg_type.members:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D sep<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sep =3D &#39;, &#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n +=3D 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.ifcond.is_present()=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39=
;\n&#39; + memb.ifcond.gen_if()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.need_has():<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D=
 &#39;bool has_%s, &#39; % c_name(<a href=3D"http://memb.name" rel=3D"noref=
errer" target=3D"_blank">memb.name</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39;%s %s&#3=
9; % (memb.type.c_param_type(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_name(<a href=3D"http://memb.nam=
e" rel=3D"noreferrer" target=3D"_blank">memb.name</a>))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra or n !=3D len(arg_=
type.members):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39=
;, &#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: opti=
onal last argument may break compilation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not me=
mb.ifcond.is_present()<br>
<br>
Does the assertion guard against the C compilation failure?<br></blockquote=
><div><br></div><div>Yes</div><div>=C2=A0<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Is it possible to write schema code that triggers it?<br></blockquote><div>=
<br></div><div>Yes, the one we have for TEST_IF_EVENT for example:</div><di=
v><br></div><div>{ &#39;event&#39;: &#39;TEST_IF_EVENT&#39;,<br>=C2=A0 &#39=
;data&#39;: { &#39;foo&#39;: &#39;TestIfStruct&#39;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: [&#39;TestIfEnum&=
#39;], &#39;if&#39;: &#39;TEST_IF_EVT_BAR&#39; } },</div><div><br></div><di=
v>produces:<br></div><div><br></div><div>void qapi_event_send_test_if_event=
(TestIfStruct *foo,<br>#if defined(TEST_IF_EVT_BAR)<br>TestIfEnumList *bar,=
<br>#endif /* defined(TEST_IF_EVT_BAR) */</div><div>);</div><div><br></div>=
<div>Which will fail to compile if TEST_IF_EVT_BAR is undefined.<br></div><=
div><br></div><div>So I would rather assert that we don&#39;t introduce suc=
h a schema, until we fix the code generator. Or we acknowledge the limitati=
on, and treat it as a schema error. Other ideas?<br></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.ifcond.is_present()=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D &#39=
;\n&#39; + memb.ifcond.gen_endif()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if extra:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D sep + extra<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D extra<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret if ret else &#39;void&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
<br>
Same newline issue as in gen_call().=C2=A0 Generated code:<br>
<br>
=C2=A0 =C2=A0 UserDefThree *qmp_test_if_cmd(TestIfStruct *foo, <br>
=C2=A0 =C2=A0 #if defined(TEST_IF_CMD_BAR)<br>
=C2=A0 =C2=A0 TestIfEnum bar, <br>
=C2=A0 =C2=A0 #endif /* defined(TEST_IF_CMD_BAR) */<br>
=C2=A0 =C2=A0 Error **errp);<br>
<br>
&gt; diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py<br>
&gt; index 26a584ee4c..c56ea4d724 100644<br>
&gt; --- a/scripts/qapi/visit.py<br>
&gt; +++ b/scripts/qapi/visit.py<br>
&gt; @@ -74,11 +74,13 @@ def gen_visit_object_members(name: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sep =3D &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for memb in members:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if memb.optional and not memb.need_h=
as():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D memb.ifcond.gen_if=
()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#=
39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool has_%(c_name)s =3D !!obj-&gt;%(c_name)s;<br>
&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0c_name=3Dc_name(<a href=3D"http://memb.name" rel=
=3D"noreferrer" target=3D"_blank">memb.name</a>))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sep =3D &#39;\n&#39;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D memb.ifcond.gen_en=
dif()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D sep<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if base:<br>
<br>
This hunk has no effect on the code generated for our schemas as far as<br>
I can tell.=C2=A0 Is it superfluous?=C2=A0 Incorrect?=C2=A0 Gap in test cov=
erage?=C2=A0 Or<br>
am I confused?<br>
<br></blockquote><div><br></div><div>Right, we could change the test this w=
ay to exercise it:</div><div><br></div><div>--- a/tests/qapi-schema/qapi-sc=
hema-test.json<br>+++ b/tests/qapi-schema/qapi-schema-test.json<br>@@ -250,=
7 +250,7 @@<br>=C2=A0{ &#39;command&#39;: &#39;test-if-cmd&#39;,<br>=C2=A0 =
=C2=A0&#39;data&#39;: {<br>=C2=A0 =C2=A0 =C2=A0&#39;foo&#39;: &#39;TestIfSt=
ruct&#39;,<br>- =C2=A0 =C2=A0&#39;bar&#39;: { &#39;type&#39;: &#39;TestIfEn=
um&#39;, &#39;if&#39;: &#39;TEST_IF_CMD_BAR&#39; } },<br>+ =C2=A0 =C2=A0&#3=
9;*bar&#39;: { &#39;type&#39;: &#39;TestIfStruct&#39;, &#39;if&#39;: &#39;T=
EST_IF_STRUCT&#39; } },<br>=C2=A0 =C2=A0&#39;returns&#39;: &#39;UserDefThre=
e&#39;,<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-sche=
ma/qapi-schema-test.json<br>
&gt; index ba7302f42b..baa4e69f63 100644<br>
&gt; --- a/tests/qapi-schema/qapi-schema-test.json<br>
&gt; +++ b/tests/qapi-schema/qapi-schema-test.json<br>
&gt; @@ -258,7 +258,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 { &#39;event&#39;: &#39;TEST_IF_EVENT&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: { &#39;foo&#39;: &#39;TestIfStruct&#39;,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&=
#39;: [&#39;TestIfEnum&#39;], &#39;if&#39;: &#39;TEST_IF_EVT_BAR&#39; } },<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&=
#39;: [&#39;TestIfEnum&#39;], &#39;if&#39;: &#39;TEST_IF_EVT_BAR&#39; },<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;baz&#39;: &#39;int&#39=
; },<br>
&gt;=C2=A0 =C2=A0 &#39;if&#39;: { &#39;all&#39;: [&#39;TEST_IF_EVT&#39;, &#=
39;TEST_IF_STRUCT&#39;] } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 { &#39;event&#39;: &#39;TEST_IF_EVENT2&#39;, &#39;data&#39;: {},=
<br>
<br>
</blockquote></div></div>

--00000000000005ec1c05f4f72183--


