Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE11587D1D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:30:01 +0200 (CEST)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIryC-0006Cw-RG
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIrvc-0002KL-L8
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIrvZ-0006UN-Qq
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659446836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7DJiZmS/3kUGVZbtAmx34cbYCejswCGB/SAPtD2PTc=;
 b=E4WRc0ZwYf+McqAE/0j9pE9IJj+t9MyXw0vOrMIaJo/3qvF7uuApPTOqMvd7hiBi1f2RC4
 uds5vxvz/Sd2ZXIg6cZ4KMFhXz6V/UCYwJPundtXwcombR6Ql8rdgSzHUwB1/5Zq86t6iL
 p/epzPk6JqtjToXxstMrMtSl8trg3u0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-CbJL_fpdMQmIFds6hbn8BA-1; Tue, 02 Aug 2022 09:27:13 -0400
X-MC-Unique: CbJL_fpdMQmIFds6hbn8BA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 579D418E0043;
 Tue,  2 Aug 2022 13:27:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B146240CFD0A;
 Tue,  2 Aug 2022 13:27:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60FC121E6930; Tue,  2 Aug 2022 15:27:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Michael Roth
 <michael.roth@amd.com>,  Kevin Wolf <kwolf@redhat.com>,  Laurent Vivier
 <laurent@vivier.eu>,  Warner Losh <imp@bsdimp.com>,  Kyle Evans
 <kevans@freebsd.org>,  Hanna Reitz <hreitz@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Fam Zheng
 <fam@euphon.net>,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block <qemu-block@nongnu.org>
Subject: Re: [PATCH 8/9] scripts/qapi-gen: add -i option
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-9-marcandre.lureau@redhat.com>
 <87fsjyqf2w.fsf@pond.sub.org>
 <CAMxuvaz5A1oh4kPVWVwCBvfQjX23EGvfrSukj3Zo+OQGHhmNVQ@mail.gmail.com>
Date: Tue, 02 Aug 2022 15:27:11 +0200
In-Reply-To: <CAMxuvaz5A1oh4kPVWVwCBvfQjX23EGvfrSukj3Zo+OQGHhmNVQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 23 Jun 2022
 12:10:11 +0400")
Message-ID: <87o7x2srm8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
>
> On Tue, Jun 21, 2022 at 6:14 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Replace hard-coded "qemu/osdep.h" include with a qapi-gen option to
>> > specify the headers to include. This will allow to substitute QEMU
>> > osdep.h with glib.h for example, for projects with different
>> > global headers.
>> >
>> > For historical reasons, we can keep the default as "qemu/osdep.h".
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> I wish we'd all agree on "config.h" (conventional with autoconf).  But
>> we don't.
>>
>> Precedence for tweaking generated code with command line options: -p.
>>
>> I suspect that we'll always specify the same -p and -i for a given
>> schema.  To me, that suggests they should both go into the schema
>> instead.  Observation, not demand.
>>
>> > ---
>> >  scripts/qapi/commands.py   | 15 ++++++++++-----
>> >  scripts/qapi/events.py     | 17 +++++++++++------
>> >  scripts/qapi/gen.py        | 17 +++++++++++++++++
>> >  scripts/qapi/introspect.py | 11 +++++++----
>> >  scripts/qapi/main.py       | 17 +++++++++++------
>> >  scripts/qapi/types.py      | 17 +++++++++++------
>> >  scripts/qapi/visit.py      | 17 +++++++++++------
>> >  7 files changed, 78 insertions(+), 33 deletions(-)
>> >
>> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> > index 38ca38a7b9dd..781491b6390d 100644
>> > --- a/scripts/qapi/commands.py
>> > +++ b/scripts/qapi/commands.py
>> > @@ -294,9 +294,9 @@ def gen_register_command(name: str,
>> >
>> >
>> >  class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
>> > -    def __init__(self, prefix: str, gen_tracing: bool):
>> > +    def __init__(self, prefix: str, include: List[str], gen_tracing: =
bool):
>>
>> Ignorant question: why ist this List[str], not str?  Do multiple options
>> accumulate into a list?
>>
>> Alright, I'm back from further down: looks like they do.
>>
>> >          super().__init__(
>> > -            prefix, 'qapi-commands',
>> > +            prefix, include, 'qapi-commands',
>> >              ' * Schema-defined QAPI/QMP commands', None, __doc__,
>> >              gen_tracing=3Dgen_tracing)
>> >          self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] =
=3D {}
>> > @@ -308,7 +308,8 @@ def _begin_user_module(self, name: str) -> None:
>> >          types =3D self._module_basename('qapi-types', name)
>> >          visit =3D self._module_basename('qapi-visit', name)
>> >          self._genc.add(mcgen('''
>> > -#include "qemu/osdep.h"
>> > +%(include)s
>> > +
>> >  #include "qapi/compat-policy.h"
>> >  #include "qapi/visitor.h"
>> >  #include "qapi/qmp/qdict.h"
>> > @@ -318,6 +319,7 @@ def _begin_user_module(self, name: str) -> None:
>> >  #include "%(commands)s.h"
>> >
>> >  ''',
>> > +                             include=3Dself.genc_include(),
>> >                               commands=3Dcommands, visit=3Dvisit))
>> >
>> >          if self._gen_tracing and commands !=3D 'qapi-commands':
>> > @@ -344,7 +346,8 @@ def visit_begin(self, schema: QAPISchema) -> None:
>> >  ''',
>> >                               c_prefix=3Dc_name(self._prefix, protect=
=3DFalse)))
>> >          self._genc.add(mcgen('''
>> > -#include "qemu/osdep.h"
>> > +%(include)s
>> > +
>> >  #include "%(prefix)sqapi-commands.h"
>> >  #include "%(prefix)sqapi-init-commands.h"
>> >
>> > @@ -353,6 +356,7 @@ def visit_begin(self, schema: QAPISchema) -> None:
>> >      QTAILQ_INIT(cmds);
>> >
>> >  ''',
>> > +                             include=3Dself.genc_include(),
>> >                               prefix=3Dself._prefix,
>> >                               c_prefix=3Dc_name(self._prefix, protect=
=3DFalse)))
>> >
>> > @@ -404,7 +408,8 @@ def visit_command(self,
>> >  def gen_commands(schema: QAPISchema,
>> >                   output_dir: str,
>> >                   prefix: str,
>> > +                 include: List[str],
>> >                   gen_tracing: bool) -> None:
>> > -    vis =3D QAPISchemaGenCommandVisitor(prefix, gen_tracing)
>> > +    vis =3D QAPISchemaGenCommandVisitor(prefix, include, gen_tracing)
>> >      schema.visit(vis)
>> >      vis.write(output_dir)
>> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
>> > index 27b44c49f5e9..6e677d11d2e0 100644
>> > --- a/scripts/qapi/events.py
>> > +++ b/scripts/qapi/events.py
>> > @@ -175,9 +175,9 @@ def gen_event_send(name: str,
>> >
>> >  class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
>> >
>> > -    def __init__(self, prefix: str):
>> > +    def __init__(self, prefix: str, include: List[str]):
>> >          super().__init__(
>> > -            prefix, 'qapi-events',
>> > +            prefix, include, 'qapi-events',
>> >              ' * Schema-defined QAPI/QMP events', None, __doc__)
>> >          self._event_enum_name =3D c_name(prefix + 'QAPIEvent', protec=
t=3DFalse)
>> >          self._event_enum_members: List[QAPISchemaEnumMember] =3D []
>> > @@ -188,7 +188,8 @@ def _begin_user_module(self, name: str) -> None:
>> >          types =3D self._module_basename('qapi-types', name)
>> >          visit =3D self._module_basename('qapi-visit', name)
>> >          self._genc.add(mcgen('''
>> > -#include "qemu/osdep.h"
>> > +%(include)s
>> > +
>> >  #include "%(prefix)sqapi-emit-events.h"
>> >  #include "%(events)s.h"
>> >  #include "%(visit)s.h"
>> > @@ -198,6 +199,7 @@ def _begin_user_module(self, name: str) -> None:
>> >  #include "qapi/qmp-event.h"
>> >
>> >  ''',
>> > +                             include=3Dself.genc_include(),
>> >                               events=3Devents, visit=3Dvisit,
>> >                               prefix=3Dself._prefix))
>> >          self._genh.add(mcgen('''
>> > @@ -209,9 +211,11 @@ def _begin_user_module(self, name: str) -> None:
>> >      def visit_end(self) -> None:
>> >          self._add_module('./emit', ' * QAPI Events emission')
>> >          self._genc.preamble_add(mcgen('''
>> > -#include "qemu/osdep.h"
>> > +%(include)s
>> > +
>> >  #include "%(prefix)sqapi-emit-events.h"
>> >  ''',
>> > +                                      include=3Dself.genc_include(),
>> >                                        prefix=3Dself._prefix))
>> >          self._genh.preamble_add(mcgen('''
>> >  #include "qapi/util.h"
>> > @@ -246,7 +250,8 @@ def visit_event(self,
>> >
>> >  def gen_events(schema: QAPISchema,
>> >                 output_dir: str,
>> > -               prefix: str) -> None:
>> > -    vis =3D QAPISchemaGenEventVisitor(prefix)
>> > +               prefix: str,
>> > +               include: List[str]) -> None:
>> > +    vis =3D QAPISchemaGenEventVisitor(prefix, include)
>> >      schema.visit(vis)
>> >      vis.write(output_dir)
>> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> > index 113b49134de4..54a70a5ff516 100644
>> > --- a/scripts/qapi/gen.py
>> > +++ b/scripts/qapi/gen.py
>> > @@ -17,6 +17,7 @@
>> >  from typing import (
>> >      Dict,
>> >      Iterator,
>> > +    List,
>> >      Optional,
>> >      Sequence,
>> >      Tuple,
>> > @@ -45,6 +46,12 @@ def gen_special_features(features: Sequence[QAPISch=
emaFeature]) -> str:
>> >      return ' | '.join(special_features) or '0'
>> >
>> >
>> > +def genc_include(include: List[str]) -> str:
>> > +    return '\n'.join(['#include ' +
>> > +                      (f'"{inc}"' if inc[0] not in ('<', '"') else in=
c)
>> > +                      for inc in include])
>>
>> This maps a list of file names / #include arguments to C code including
>> them, mapping file names to #include arguments by enclosing them in "".
>>
>> Option arguments of the form <foo.h> and "foo.h" need to be quoted in
>> the shell.  The latter can be done without quoting as foo.h.
>>
>> Somewhat funky wedding of generality with convenience.
>>
>> > +
>> > +
>> >  class QAPIGen:
>> >      def __init__(self, fname: str):
>> >          self.fname =3D fname
>> > @@ -228,16 +235,21 @@ def ifcontext(ifcond: QAPISchemaIfCond, *args: Q=
APIGenCCode) -> Iterator[None]:
>> >  class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor):
>> >      def __init__(self,
>> >                   prefix: str,
>> > +                 include: List[str],
>> >                   what: str,
>> >                   blurb: str,
>> >                   pydoc: str):
>> >          self._prefix =3D prefix
>> > +        self._include =3D include
>> >          self._what =3D what
>> >          self._genc =3D QAPIGenC(self._prefix + self._what + '.c',
>> >                                blurb, pydoc)
>> >          self._genh =3D QAPIGenH(self._prefix + self._what + '.h',
>> >                                blurb, pydoc)
>> >
>> > +    def genc_include(self) -> str:
>> > +        return genc_include(self._include)
>> > +
>> >      def write(self, output_dir: str) -> None:
>> >          self._genc.write(output_dir)
>> >          self._genh.write(output_dir)
>> > @@ -246,12 +258,14 @@ def write(self, output_dir: str) -> None:
>> >  class QAPISchemaModularCVisitor(QAPISchemaVisitor):
>> >      def __init__(self,
>> >                   prefix: str,
>> > +                 include: List[str],
>> >                   what: str,
>> >                   user_blurb: str,
>> >                   builtin_blurb: Optional[str],
>> >                   pydoc: str,
>> >                   gen_tracing: bool =3D False):
>> >          self._prefix =3D prefix
>> > +        self._include =3D include
>> >          self._what =3D what
>> >          self._user_blurb =3D user_blurb
>> >          self._builtin_blurb =3D builtin_blurb
>> > @@ -262,6 +276,9 @@ def __init__(self,
>> >          self._main_module: Optional[str] =3D None
>> >          self._gen_tracing =3D gen_tracing
>> >
>> > +    def genc_include(self) -> str:
>> > +        return genc_include(self._include)
>> > +
>> >      @property
>> >      def _genc(self) -> QAPIGenC:
>> >          assert self._current_module is not None
>> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> > index 67c7d89aae00..d965d1769447 100644
>> > --- a/scripts/qapi/introspect.py
>> > +++ b/scripts/qapi/introspect.py
>> > @@ -170,9 +170,9 @@ def to_c_string(string: str) -> str:
>> >
>> >  class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
>> >
>> > -    def __init__(self, prefix: str, unmask: bool):
>> > +    def __init__(self, prefix: str, include: List[str], unmask: bool):
>> >          super().__init__(
>> > -            prefix, 'qapi-introspect',
>> > +            prefix, include, 'qapi-introspect',
>> >              ' * QAPI/QMP schema introspection', __doc__)
>> >          self._unmask =3D unmask
>> >          self._schema: Optional[QAPISchema] =3D None
>> > @@ -180,10 +180,12 @@ def __init__(self, prefix: str, unmask: bool):
>> >          self._used_types: List[QAPISchemaType] =3D []
>> >          self._name_map: Dict[str, str] =3D {}
>> >          self._genc.add(mcgen('''
>> > -#include "qemu/osdep.h"
>> > +%(include)s
>> > +
>> >  #include "%(prefix)sqapi-introspect.h"
>> >
>> >  ''',
>> > +                             include=3Dself.genc_include(),
>> >                               prefix=3Dprefix))
>> >
>> >      def visit_begin(self, schema: QAPISchema) -> None:
>> > @@ -384,7 +386,8 @@ def visit_event(self, name: str, info: Optional[QA=
PISourceInfo],
>> >
>> >
>> >  def gen_introspect(schema: QAPISchema, output_dir: str, prefix: str,
>> > +                   include: List[str],
>> >                     opt_unmask: bool) -> None:
>> > -    vis =3D QAPISchemaGenIntrospectVisitor(prefix, opt_unmask)
>> > +    vis =3D QAPISchemaGenIntrospectVisitor(prefix, include, opt_unmas=
k)
>> >      schema.visit(vis)
>> >      vis.write(output_dir)
>> > diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
>> > index fc216a53d32a..eba98cb9ace2 100644
>> > --- a/scripts/qapi/main.py
>> > +++ b/scripts/qapi/main.py
>> > @@ -9,7 +9,7 @@
>> >
>> >  import argparse
>> >  import sys
>> > -from typing import Optional
>> > +from typing import List, Optional
>> >
>> >  from .commands import gen_commands
>> >  from .common import must_match
>> > @@ -31,6 +31,7 @@ def invalid_prefix_char(prefix: str) -> Optional[str=
]:
>> >  def generate(schema_file: str,
>> >               output_dir: str,
>> >               prefix: str,
>> > +             include: List[str],
>> >               unmask: bool =3D False,
>> >               builtins: bool =3D False,
>> >               gen_tracing: bool =3D False) -> None:
>> > @@ -48,11 +49,11 @@ def generate(schema_file: str,
>> >      assert invalid_prefix_char(prefix) is None
>> >
>> >      schema =3D QAPISchema(schema_file)
>> > -    gen_types(schema, output_dir, prefix, builtins)
>> > -    gen_visit(schema, output_dir, prefix, builtins)
>> > -    gen_commands(schema, output_dir, prefix, gen_tracing)
>> > -    gen_events(schema, output_dir, prefix)
>> > -    gen_introspect(schema, output_dir, prefix, unmask)
>> > +    gen_types(schema, output_dir, prefix, include, builtins)
>> > +    gen_visit(schema, output_dir, prefix, include, builtins)
>> > +    gen_commands(schema, output_dir, prefix, include, gen_tracing)
>> > +    gen_events(schema, output_dir, prefix, include)
>> > +    gen_introspect(schema, output_dir, prefix, include, unmask)
>> >
>> >
>> >  def main() -> int:
>> > @@ -75,6 +76,9 @@ def main() -> int:
>> >      parser.add_argument('-u', '--unmask-non-abi-names', action=3D'sto=
re_true',
>> >                          dest=3D'unmask',
>> >                          help=3D"expose non-ABI names in introspection=
")
>> > +    parser.add_argument('-i', '--include', nargs=3D'*',
>> > +                        default=3D['qemu/osdep.h'],
>> > +                        help=3D"top-level include headers")
>>
>> The option name --include doesn't really tell me what it is about.  Is
>> it an include path for schema files?  Or is it about including something
>> in generated C?  Where in generated C?
>>
>> The help text provides clues: "headers" suggests .h, and "top-level"
>> suggests somewhere top-like.
>>
>> In fact, it's about inserting C code at the beginning of generated .c
>> files.  For the uses we have in mind, the C code is a single #include.
>> The patch implements any number of #includes.
>>
>> More general and arguably less funky: a way to insert arbitrary C code.
>>
>> Except arbitrary C code on the command line is unwieldy.  Better kept it
>> in the schema.  Pragma?
>>
>> Thoughts?
>
> Pragmas are global currently. This doesn't scale well, as we would
> like to split the schemas. I have a following patch that will allow me
> to split/merge the pragmas. This is not optimal either, I would rather
> remove/replace them (using annotations).

Now I'm curious.  Can you sketch what you have in mind?

> Imho, global tweaking of compilation is better done from the command line.

The command line is fine for straightforward configuration.  It's not
suitable for injecting code.

Fine: cc -c, which tells the compiler to work in a certain way.

Still fine: cc -DFOO, which effectively prepends '#define FOO 1" to the
.c.

No longer fine: a hypothetical option to prepend arbitrary C code.  Even
if it was occasionally useful.

Now watch this:

    $ python qapi-gen.py -o t qapi/qapi-schema.json -i '"abc.h"
    #define FOO'

    $ head -n 16 t/qapi-types.c
    /* AUTOMATICALLY GENERATED, DO NOT MODIFY */

    /*
     * Schema-defined QAPI types
     *
     * Copyright IBM, Corp. 2011
     * Copyright (c) 2013-2018 Red Hat Inc.
     *
     * This work is licensed under the terms of the GNU LGPL, version 2.1 o=
r later.
     * See the COPYING.LIB file in the top-level directory.
     */

    #include "abc.h"
    #define FOO

    #include "qapi/dealloc-visitor.h"

Sure, nobody of sane mind would ever do this.  The fact remains that
we're doing something on the command line that should not be done there.

Your -i enables code injection because it takes either a file name or a
#include argument.  Can we dumb it down to just file name?

[...]


