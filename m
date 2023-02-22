Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D269F2A4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:24:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmHN-0006gQ-7e; Wed, 22 Feb 2023 05:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUmHK-0006fz-Ku
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUmHI-0000Xq-GN
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677061391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3jNF4MuitTcHRF5kIEtaWVAEDkZgO4qkRlxxIRjxoQ=;
 b=eyidp8/EFtBxKwrA7rbFIqAok74Nf5qTRL9QBCIFfGZR+H7L5m/V4yIoK0AxVFBQjtxLVK
 KzuXCi/KNmJcUKqBJ5Y4lWBo+2PxCuDRR+cK7wYkoR5wG+gjDza298ljikyTn4ORZ/Gfn3
 RT6gPgqFFejNnZOaoq/yHHBb+nJRbyY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-96HiUi4_MNaWumJl2i6KHw-1; Wed, 22 Feb 2023 05:23:06 -0500
X-MC-Unique: 96HiUi4_MNaWumJl2i6KHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 387AB18A0651;
 Wed, 22 Feb 2023 10:23:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA1572026D4B;
 Wed, 22 Feb 2023 10:23:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C39C321E6A1F; Wed, 22 Feb 2023 11:23:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
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
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
Date: Wed, 22 Feb 2023 11:23:03 +0100
In-Reply-To: <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 22 Feb 2023
 12:05:26 +0400")
Message-ID: <87356yq9rs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Mon, Feb 20, 2023 at 12:10 PM Markus Armbruster <armbru@redhat.com> wr=
ote:
>>
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>>
>> > Hi Markus
>> >
>> > On Fri, Feb 17, 2023 at 12:28 PM Markus Armbruster <armbru@redhat.com>
>> > wrote:
>> >
>> >> marcandre.lureau@redhat.com writes:
>> >>
>> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >> >
>> >> > The generated code doesn't quite handle the conditional arguments.
>> >> > For example, 'bar' in 'test-if-cmd' is not correctly surrounded by =
#if
>> >> > conditions. See generated code in qmp_marshal_test_if_cmd().
>> >> >
>> >> > Note that if there are multiple optional arguments at the last posi=
tion,
>> >> > there might be compilation issues due to extra comas. I left an ass=
ert
>> >> > and FIXME for later.
>> >> >
>> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >> > ---
>> >> >  scripts/qapi/commands.py                |  4 ++++
>> >> >  scripts/qapi/gen.py                     | 19 ++++++++++++++-----
>> >> >  scripts/qapi/visit.py                   |  2 ++
>> >> >  tests/qapi-schema/qapi-schema-test.json |  3 ++-
>> >> >  4 files changed, 22 insertions(+), 6 deletions(-)
>> >> >
>> >> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> >> > index 79c5e5c3a9..07997d1586 100644
>> >> > --- a/scripts/qapi/commands.py
>> >> > +++ b/scripts/qapi/commands.py
>> >> > @@ -64,9 +64,13 @@ def gen_call(name: str,
>> >> >      elif arg_type:
>> >> >          assert not arg_type.variants
>> >> >          for memb in arg_type.members:
>> >> > +            if memb.ifcond.is_present():
>> >> > +                argstr +=3D '\n' + memb.ifcond.gen_if()
>> >> >              if memb.need_has():
>> >> >                  argstr +=3D 'arg.has_%s, ' % c_name(memb.name)
>> >> >              argstr +=3D 'arg.%s, ' % c_name(memb.name)
>> >> > +            if memb.ifcond.is_present():
>> >> > +                argstr +=3D '\n' + memb.ifcond.gen_endif()
>> >> >
>> >> >      lhs =3D ''
>> >> >      if ret_type:
>> >>
>> >> @argstr is emitted further down:
>> >>
>> >>        %(lhs)sqmp_%(name)s(%(args)s&err);
>> >>    ''',
>> >>                     name=3Dname, args=3Dargstr, lhs=3Dlhs)
>> >>
>> >>        ret +=3D mcgen('''
>> >>        if (err) {
>> >>    ''')
>> >>
>> >> Before the patch, @argstr contains no newlines.  Works.
>> >>
>> >> After the patch, it may contain newlines, and if it does, intentation=
 is
>> >> messed up.  For instance, in the code generated for
>> >> qapi-schema-test.json:
>> >>
>> >>         retval =3D qmp_test_if_cmd(arg.foo,
>> >>     #if defined(TEST_IF_CMD_BAR)
>> >>     arg.bar,
>> >>     #endif /* defined(TEST_IF_CMD_BAR) */
>> >>     &err);
>> >>
>> >> Strings interpolated into the mcgen() argument should not contain
>> >> newlines.  I'm afraid you have to rewrite the code emitting the call.
>> >>
>> >
>> > Why it should not contain newlines?
>>
>> They mess up indentation.  I think.  It's been a while...  All I really
>> know for sure is that the generated code's indentation is messed up
>> right there.
>>
>> > What are you asking exactly? that the caller be changed? (this does not
>> > work well if there are multiple optional arguments..)
>> >
>> >     #if defined(TEST_IF_CMD_BAR)
>> >         retval =3D qmp_test_if_cmd(arg.foo, arg.bar, &err);
>> >     #else
>> >         retval =3D qmp_test_if_cmd(arg.foo, &err);
>> >     #endif /* defined(TEST_IF_CMD_BAR) */
>>
>> I'm asking for better indentation.  In handwritten code, we'd do
>>
>>         retval =3D qmp_test_if_cmd(arg.foo,
>>     #if defined(TEST_IF_CMD_BAR)
>>                                  arg.bar,
>>     #endif /* defined(TEST_IF_CMD_BAR) */
>>                                  &err);
>>
>> Keeping track of how far to indent the arguments is bothersome in the
>> generator, though.  Perhaps we could create infrastructure to make it
>> not bothersome, but I'm not asking for that.  Something like this should
>> be good enough:
>>
>>         retval =3D qmp_test_if_cmd(arg.foo,
>>     #if defined(TEST_IF_CMD_BAR)
>>                     arg.bar,
>>     #endif /* defined(TEST_IF_CMD_BAR) */
>>                     &err);
>>
>> I.e. indent to the function call and then some.
>
> ok, I improved the indentation a bit.
>
> However, I think it would be simpler, and better, if we piped the
> generated code to clang-format (when available). I made a simple patch
> for that too.

Piping through indent or clang-format may well give us neater results
for less effort.

We might want to dumb down generator code then.

>> >> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> >> > index b5a8d03e8e..ba57e72c9b 100644
>> >> > --- a/scripts/qapi/gen.py
>> >> > +++ b/scripts/qapi/gen.py
>> >> > @@ -111,22 +111,31 @@ def build_params(arg_type: Optional[QAPISchem=
aObjectType],
>> >> >                   boxed: bool,
>> >> >                   extra: Optional[str] =3D None) -> str:
>> >> >      ret =3D ''
>> >> > -    sep =3D ''
>> >> >      if boxed:
>> >> >          assert arg_type
>> >> >          ret +=3D '%s arg' % arg_type.c_param_type()
>> >> > -        sep =3D ', '
>> >> > +        if extra:
>> >> > +            ret +=3D ', '
>> >> >      elif arg_type:
>> >> >          assert not arg_type.variants
>> >> > +        n =3D 0
>> >> >          for memb in arg_type.members:
>> >> > -            ret +=3D sep
>> >> > -            sep =3D ', '
>> >> > +            n +=3D 1
>> >> > +            if memb.ifcond.is_present():
>> >> > +                ret +=3D '\n' + memb.ifcond.gen_if()
>> >> >              if memb.need_has():
>> >> >                  ret +=3D 'bool has_%s, ' % c_name(memb.name)
>> >> >              ret +=3D '%s %s' % (memb.type.c_param_type(),
>> >> >                                c_name(memb.name))
>> >> > +            if extra or n !=3D len(arg_type.members):
>> >> > +                ret +=3D ', '
>> >> > +            else:
>> >> > +                # FIXME: optional last argument may break compilat=
ion
>> >> > +                assert not memb.ifcond.is_present()
>> >>
>> >> Does the assertion guard against the C compilation failure?
>> >
>> > Yes
>> >
>> >>
>> >> Is it possible to write schema code that triggers it?
>> >
>> > Yes, the one we have for TEST_IF_EVENT for example:
>> >
>> > { 'event': 'TEST_IF_EVENT',
>> >   'data': { 'foo': 'TestIfStruct',
>> >             'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' }=
 },
>>
>> This is the one you put in qapi-schema-test.json less the last
>> parameter, so that the conditional parameter becomes the last one.
>>
>> > produces:
>> >
>> > void qapi_event_send_test_if_event(TestIfStruct *foo,
>> > #if defined(TEST_IF_EVT_BAR)
>> > TestIfEnumList *bar,
>> > #endif /* defined(TEST_IF_EVT_BAR) */
>> > );
>> >
>> > Which will fail to compile if TEST_IF_EVT_BAR is undefined.
>>
>> I think it'll fail to compile always, because the parameter list has a
>> trailing comma regardless of TEST_IF_EVT_BAR.
>
> Yes, I think I hand-wrote that example, the actual generator does not
> leave a trailing comma here.
>
>>
>> > So I would rather assert that we don't introduce such a schema, until =
we
>> > fix the code generator. Or we acknowledge the limitation, and treat it=
 as a
>> > schema error. Other ideas?
>>
>> Yes: throw an error.  Assertions are for programming errors.  This isn't
>> a programming error, it's a limitation of the current implementation.
>>
>> How hard would it be to lift the limitation?
>
> Taking this as a problematic example:
>
> void function(first,
> #ifdef A
>     a,
> #endif
> #ifdef B
>     b
> #endif
> )
>
> I think it would mean that we would have to pass arguments as a
> structure, as they don't have the limitation of trailing coma in
> initializers. That would not be idiomatic C though, and we would need
> to refactor a lot of code..
>
> Another option is to always pass a dummy last argument? :)
>
> void command(first,
> #ifdef A
>     a,
> #endif
> #ifdef B
>     b,
> #endif
>     dummy)

Yet another option:

  void command(first
  #ifdef A
      , a
  #endif
  #ifdef B
      , b
  #endif
      )

[...]


