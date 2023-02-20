Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50369C64C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:10:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1Ej-0000Qt-21; Mon, 20 Feb 2023 03:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU1Ed-0000QY-Ik
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU1Eb-0000ew-9u
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676880555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WX73ZJmaFYIIObT5d5BxsCZCrra4uLDXcDUbQmFjmsU=;
 b=ZR7opJ2omj+j1DXzP9EOYZ+/W5cELU2WMbB4toBLwC1Oyxg3VXXk8K9kNNc3e8NTA3aXLQ
 DuKf4DbwkrgBfcE11XHqNrMJKk6bKRHGjlcPeUXK5g8u1AIfBzEu6liVQIS1mHRWvA55V9
 ayY/24klWQoF+jJYNSyU3NIjj1iug58=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-jXlbkrGENZaonPnWNFPhHg-1; Mon, 20 Feb 2023 03:09:11 -0500
X-MC-Unique: jXlbkrGENZaonPnWNFPhHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD07A1011351;
 Mon, 20 Feb 2023 08:09:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6CE2026D68;
 Mon, 20 Feb 2023 08:09:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 711B921E6A1F; Mon, 20 Feb 2023 09:09:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,  Beraldo Leal <bleal@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
Date: Mon, 20 Feb 2023 09:09:08 +0100
In-Reply-To: <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Sat, 18 Feb 2023
 14:45:19 +0400")
Message-ID: <87a61821y3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi Markus
>
> On Fri, Feb 17, 2023 at 12:28 PM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > The generated code doesn't quite handle the conditional arguments.
>> > For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #if
>> > conditions. See generated code in qmp_marshal_test_if_cmd().
>> >
>> > Note that if there are multiple optional arguments at the last positio=
n,
>> > there might be compilation issues due to extra comas. I left an assert
>> > and FIXME for later.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >  scripts/qapi/commands.py                |  4 ++++
>> >  scripts/qapi/gen.py                     | 19 ++++++++++++++-----
>> >  scripts/qapi/visit.py                   |  2 ++
>> >  tests/qapi-schema/qapi-schema-test.json |  3 ++-
>> >  4 files changed, 22 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> > index 79c5e5c3a9..07997d1586 100644
>> > --- a/scripts/qapi/commands.py
>> > +++ b/scripts/qapi/commands.py
>> > @@ -64,9 +64,13 @@ def gen_call(name: str,
>> >      elif arg_type:
>> >          assert not arg_type.variants
>> >          for memb in arg_type.members:
>> > +            if memb.ifcond.is_present():
>> > +                argstr +=3D '\n' + memb.ifcond.gen_if()
>> >              if memb.need_has():
>> >                  argstr +=3D 'arg.has_%s, ' % c_name(memb.name)
>> >              argstr +=3D 'arg.%s, ' % c_name(memb.name)
>> > +            if memb.ifcond.is_present():
>> > +                argstr +=3D '\n' + memb.ifcond.gen_endif()
>> >
>> >      lhs =3D ''
>> >      if ret_type:
>>
>> @argstr is emitted further down:
>>
>>        %(lhs)sqmp_%(name)s(%(args)s&err);
>>    ''',
>>                     name=3Dname, args=3Dargstr, lhs=3Dlhs)
>>
>>        ret +=3D mcgen('''
>>        if (err) {
>>    ''')
>>
>> Before the patch, @argstr contains no newlines.  Works.
>>
>> After the patch, it may contain newlines, and if it does, intentation is
>> messed up.  For instance, in the code generated for
>> qapi-schema-test.json:
>>
>>         retval =3D qmp_test_if_cmd(arg.foo,
>>     #if defined(TEST_IF_CMD_BAR)
>>     arg.bar,
>>     #endif /* defined(TEST_IF_CMD_BAR) */
>>     &err);
>>
>> Strings interpolated into the mcgen() argument should not contain
>> newlines.  I'm afraid you have to rewrite the code emitting the call.
>>
>
> Why it should not contain newlines?

They mess up indentation.  I think.  It's been a while...  All I really
know for sure is that the generated code's indentation is messed up
right there.

> What are you asking exactly? that the caller be changed? (this does not
> work well if there are multiple optional arguments..)
>
>     #if defined(TEST_IF_CMD_BAR)
>         retval =3D qmp_test_if_cmd(arg.foo, arg.bar, &err);
>     #else
>         retval =3D qmp_test_if_cmd(arg.foo, &err);
>     #endif /* defined(TEST_IF_CMD_BAR) */

I'm asking for better indentation.  In handwritten code, we'd do

        retval =3D qmp_test_if_cmd(arg.foo,
    #if defined(TEST_IF_CMD_BAR)
                                 arg.bar,
    #endif /* defined(TEST_IF_CMD_BAR) */
                                 &err);

Keeping track of how far to indent the arguments is bothersome in the
generator, though.  Perhaps we could create infrastructure to make it
not bothersome, but I'm not asking for that.  Something like this should
be good enough:

        retval =3D qmp_test_if_cmd(arg.foo,
    #if defined(TEST_IF_CMD_BAR)
                    arg.bar,
    #endif /* defined(TEST_IF_CMD_BAR) */
                    &err);

I.e. indent to the function call and then some.

>> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> > index b5a8d03e8e..ba57e72c9b 100644
>> > --- a/scripts/qapi/gen.py
>> > +++ b/scripts/qapi/gen.py
>> > @@ -111,22 +111,31 @@ def build_params(arg_type: Optional[QAPISchemaOb=
jectType],
>> >                   boxed: bool,
>> >                   extra: Optional[str] =3D None) -> str:
>> >      ret =3D ''
>> > -    sep =3D ''
>> >      if boxed:
>> >          assert arg_type
>> >          ret +=3D '%s arg' % arg_type.c_param_type()
>> > -        sep =3D ', '
>> > +        if extra:
>> > +            ret +=3D ', '
>> >      elif arg_type:
>> >          assert not arg_type.variants
>> > +        n =3D 0
>> >          for memb in arg_type.members:
>> > -            ret +=3D sep
>> > -            sep =3D ', '
>> > +            n +=3D 1
>> > +            if memb.ifcond.is_present():
>> > +                ret +=3D '\n' + memb.ifcond.gen_if()
>> >              if memb.need_has():
>> >                  ret +=3D 'bool has_%s, ' % c_name(memb.name)
>> >              ret +=3D '%s %s' % (memb.type.c_param_type(),
>> >                                c_name(memb.name))
>> > +            if extra or n !=3D len(arg_type.members):
>> > +                ret +=3D ', '
>> > +            else:
>> > +                # FIXME: optional last argument may break compilation
>> > +                assert not memb.ifcond.is_present()
>>
>> Does the assertion guard against the C compilation failure?
>
> Yes
>
>>
>> Is it possible to write schema code that triggers it?
>
> Yes, the one we have for TEST_IF_EVENT for example:
>
> { 'event': 'TEST_IF_EVENT',
>   'data': { 'foo': 'TestIfStruct',
>             'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },

This is the one you put in qapi-schema-test.json less the last
parameter, so that the conditional parameter becomes the last one.

> produces:
>
> void qapi_event_send_test_if_event(TestIfStruct *foo,
> #if defined(TEST_IF_EVT_BAR)
> TestIfEnumList *bar,
> #endif /* defined(TEST_IF_EVT_BAR) */
> );
>
> Which will fail to compile if TEST_IF_EVT_BAR is undefined.

I think it'll fail to compile always, because the parameter list has a
trailing comma regardless of TEST_IF_EVT_BAR.

> So I would rather assert that we don't introduce such a schema, until we
> fix the code generator. Or we acknowledge the limitation, and treat it as=
 a
> schema error. Other ideas?

Yes: throw an error.  Assertions are for programming errors.  This isn't
a programming error, it's a limitation of the current implementation.

How hard would it be to lift the limitation?

>> > +            if memb.ifcond.is_present():
>> > +                ret +=3D '\n' + memb.ifcond.gen_endif()
>> >      if extra:
>> > -        ret +=3D sep + extra
>> > +        ret +=3D extra
>> >      return ret if ret else 'void'
>> >
>> >
>>
>> Same newline issue as in gen_call().  Generated code:
>>
>>     UserDefThree *qmp_test_if_cmd(TestIfStruct *foo,
>>     #if defined(TEST_IF_CMD_BAR)
>>     TestIfEnum bar,
>>     #endif /* defined(TEST_IF_CMD_BAR) */
>>     Error **errp);
>>
>> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
>> > index 26a584ee4c..c56ea4d724 100644
>> > --- a/scripts/qapi/visit.py
>> > +++ b/scripts/qapi/visit.py
>> > @@ -74,11 +74,13 @@ def gen_visit_object_members(name: str,
>> >      sep =3D ''
>> >      for memb in members:
>> >          if memb.optional and not memb.need_has():
>> > +            ret +=3D memb.ifcond.gen_if()
>> >              ret +=3D mcgen('''
>> >      bool has_%(c_name)s =3D !!obj->%(c_name)s;
>> >  ''',
>> >                           c_name=3Dc_name(memb.name))
>> >              sep =3D '\n'
>> > +            ret +=3D memb.ifcond.gen_endif()
>> >      ret +=3D sep
>> >
>> >      if base:
>>
>> This hunk has no effect on the code generated for our schemas as far as
>> I can tell.  Is it superfluous?  Incorrect?  Gap in test coverage?  Or
>> am I confused?
>>
>>
> Right, we could change the test this way to exercise it:
>
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -250,7 +250,7 @@
>  { 'command': 'test-if-cmd',
>    'data': {
>      'foo': 'TestIfStruct',
> -    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_BAR' } },
> +    '*bar': { 'type': 'TestIfStruct', 'if': 'TEST_IF_STRUCT' } },
>    'returns': 'UserDefThree',

Please exercise it :)

>> > diff --git a/tests/qapi-schema/qapi-schema-test.json
>> b/tests/qapi-schema/qapi-schema-test.json
>> > index ba7302f42b..baa4e69f63 100644
>> > --- a/tests/qapi-schema/qapi-schema-test.json
>> > +++ b/tests/qapi-schema/qapi-schema-test.json
>> > @@ -258,7 +258,8 @@
>> >
>> >  { 'event': 'TEST_IF_EVENT',
>> >    'data': { 'foo': 'TestIfStruct',
>> > -            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' }
>> },
>> > +            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' =
},
>> > +            'baz': 'int' },
>> >    'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
>> >
>> >  { 'event': 'TEST_IF_EVENT2', 'data': {},
>>
>>


