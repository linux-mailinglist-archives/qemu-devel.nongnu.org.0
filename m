Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308635534BD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:42:26 +0200 (CEST)
Received: from localhost ([::1]:53592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3f5E-0002uy-9X
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3ee2-0004Pi-RI
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3edr-0001Hw-LW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655820846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SmBN7+G7fNudSYUx/7rY2swB9VF7Bbz0ItwRfKNpJA=;
 b=DpyuDMUILPa9ULBPiW3IZZz2xwb5Xh2lnfE7oGyniF4bYJVRBOmIpEWpVtkgSkfUQaVx73
 fQ2qJVi7FdAyqYb96KZ2wtKZFlxc0Q1TAPFjgteeN8mUI7OSbie6DFJJtauYmJyK0J+0Rv
 r3dNVpn+5nAtS4A/nDdZKTcoeVUb1DQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-6Wg7VU2CN26sPXXQqM6HDg-1; Tue, 21 Jun 2022 10:14:02 -0400
X-MC-Unique: 6Wg7VU2CN26sPXXQqM6HDg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6980811E80;
 Tue, 21 Jun 2022 14:14:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D9B492C3B;
 Tue, 21 Jun 2022 14:14:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C542D21E690D; Tue, 21 Jun 2022 16:13:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH 8/9] scripts/qapi-gen: add -i option
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-9-marcandre.lureau@redhat.com>
Date: Tue, 21 Jun 2022 16:13:59 +0200
In-Reply-To: <20220616124034.3381391-9-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 16 Jun 2022 16:40:33 +0400")
Message-ID: <87fsjyqf2w.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Replace hard-coded "qemu/osdep.h" include with a qapi-gen option to
> specify the headers to include. This will allow to substitute QEMU
> osdep.h with glib.h for example, for projects with different
> global headers.
>
> For historical reasons, we can keep the default as "qemu/osdep.h".
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I wish we'd all agree on "config.h" (conventional with autoconf).  But
we don't.

Precedence for tweaking generated code with command line options: -p.

I suspect that we'll always specify the same -p and -i for a given
schema.  To me, that suggests they should both go into the schema
instead.  Observation, not demand.

> ---
>  scripts/qapi/commands.py   | 15 ++++++++++-----
>  scripts/qapi/events.py     | 17 +++++++++++------
>  scripts/qapi/gen.py        | 17 +++++++++++++++++
>  scripts/qapi/introspect.py | 11 +++++++----
>  scripts/qapi/main.py       | 17 +++++++++++------
>  scripts/qapi/types.py      | 17 +++++++++++------
>  scripts/qapi/visit.py      | 17 +++++++++++------
>  7 files changed, 78 insertions(+), 33 deletions(-)
>
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 38ca38a7b9dd..781491b6390d 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -294,9 +294,9 @@ def gen_register_command(name: str,
>=20=20
>=20=20
>  class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
> -    def __init__(self, prefix: str, gen_tracing: bool):
> +    def __init__(self, prefix: str, include: List[str], gen_tracing: boo=
l):

Ignorant question: why ist this List[str], not str?  Do multiple options
accumulate into a list?

Alright, I'm back from further down: looks like they do.

>          super().__init__(
> -            prefix, 'qapi-commands',
> +            prefix, include, 'qapi-commands',
>              ' * Schema-defined QAPI/QMP commands', None, __doc__,
>              gen_tracing=3Dgen_tracing)
>          self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] =3D=
 {}
> @@ -308,7 +308,8 @@ def _begin_user_module(self, name: str) -> None:
>          types =3D self._module_basename('qapi-types', name)
>          visit =3D self._module_basename('qapi-visit', name)
>          self._genc.add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "qapi/compat-policy.h"
>  #include "qapi/visitor.h"
>  #include "qapi/qmp/qdict.h"
> @@ -318,6 +319,7 @@ def _begin_user_module(self, name: str) -> None:
>  #include "%(commands)s.h"
>=20=20
>  ''',
> +                             include=3Dself.genc_include(),
>                               commands=3Dcommands, visit=3Dvisit))
>=20=20
>          if self._gen_tracing and commands !=3D 'qapi-commands':
> @@ -344,7 +346,8 @@ def visit_begin(self, schema: QAPISchema) -> None:
>  ''',
>                               c_prefix=3Dc_name(self._prefix, protect=3DF=
alse)))
>          self._genc.add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "%(prefix)sqapi-commands.h"
>  #include "%(prefix)sqapi-init-commands.h"
>=20=20
> @@ -353,6 +356,7 @@ def visit_begin(self, schema: QAPISchema) -> None:
>      QTAILQ_INIT(cmds);
>=20=20
>  ''',
> +                             include=3Dself.genc_include(),
>                               prefix=3Dself._prefix,
>                               c_prefix=3Dc_name(self._prefix, protect=3DF=
alse)))
>=20=20
> @@ -404,7 +408,8 @@ def visit_command(self,
>  def gen_commands(schema: QAPISchema,
>                   output_dir: str,
>                   prefix: str,
> +                 include: List[str],
>                   gen_tracing: bool) -> None:
> -    vis =3D QAPISchemaGenCommandVisitor(prefix, gen_tracing)
> +    vis =3D QAPISchemaGenCommandVisitor(prefix, include, gen_tracing)
>      schema.visit(vis)
>      vis.write(output_dir)
> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index 27b44c49f5e9..6e677d11d2e0 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -175,9 +175,9 @@ def gen_event_send(name: str,
>=20=20
>  class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
>=20=20
> -    def __init__(self, prefix: str):
> +    def __init__(self, prefix: str, include: List[str]):
>          super().__init__(
> -            prefix, 'qapi-events',
> +            prefix, include, 'qapi-events',
>              ' * Schema-defined QAPI/QMP events', None, __doc__)
>          self._event_enum_name =3D c_name(prefix + 'QAPIEvent', protect=
=3DFalse)
>          self._event_enum_members: List[QAPISchemaEnumMember] =3D []
> @@ -188,7 +188,8 @@ def _begin_user_module(self, name: str) -> None:
>          types =3D self._module_basename('qapi-types', name)
>          visit =3D self._module_basename('qapi-visit', name)
>          self._genc.add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "%(prefix)sqapi-emit-events.h"
>  #include "%(events)s.h"
>  #include "%(visit)s.h"
> @@ -198,6 +199,7 @@ def _begin_user_module(self, name: str) -> None:
>  #include "qapi/qmp-event.h"
>=20=20
>  ''',
> +                             include=3Dself.genc_include(),
>                               events=3Devents, visit=3Dvisit,
>                               prefix=3Dself._prefix))
>          self._genh.add(mcgen('''
> @@ -209,9 +211,11 @@ def _begin_user_module(self, name: str) -> None:
>      def visit_end(self) -> None:
>          self._add_module('./emit', ' * QAPI Events emission')
>          self._genc.preamble_add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "%(prefix)sqapi-emit-events.h"
>  ''',
> +                                      include=3Dself.genc_include(),
>                                        prefix=3Dself._prefix))
>          self._genh.preamble_add(mcgen('''
>  #include "qapi/util.h"
> @@ -246,7 +250,8 @@ def visit_event(self,
>=20=20
>  def gen_events(schema: QAPISchema,
>                 output_dir: str,
> -               prefix: str) -> None:
> -    vis =3D QAPISchemaGenEventVisitor(prefix)
> +               prefix: str,
> +               include: List[str]) -> None:
> +    vis =3D QAPISchemaGenEventVisitor(prefix, include)
>      schema.visit(vis)
>      vis.write(output_dir)
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 113b49134de4..54a70a5ff516 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -17,6 +17,7 @@
>  from typing import (
>      Dict,
>      Iterator,
> +    List,
>      Optional,
>      Sequence,
>      Tuple,
> @@ -45,6 +46,12 @@ def gen_special_features(features: Sequence[QAPISchema=
Feature]) -> str:
>      return ' | '.join(special_features) or '0'
>=20=20
>=20=20
> +def genc_include(include: List[str]) -> str:
> +    return '\n'.join(['#include ' +
> +                      (f'"{inc}"' if inc[0] not in ('<', '"') else inc)
> +                      for inc in include])

This maps a list of file names / #include arguments to C code including
them, mapping file names to #include arguments by enclosing them in "".

Option arguments of the form <foo.h> and "foo.h" need to be quoted in
the shell.  The latter can be done without quoting as foo.h.

Somewhat funky wedding of generality with convenience.

> +
> +
>  class QAPIGen:
>      def __init__(self, fname: str):
>          self.fname =3D fname
> @@ -228,16 +235,21 @@ def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPI=
GenCCode) -> Iterator[None]:
>  class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor):
>      def __init__(self,
>                   prefix: str,
> +                 include: List[str],
>                   what: str,
>                   blurb: str,
>                   pydoc: str):
>          self._prefix =3D prefix
> +        self._include =3D include
>          self._what =3D what
>          self._genc =3D QAPIGenC(self._prefix + self._what + '.c',
>                                blurb, pydoc)
>          self._genh =3D QAPIGenH(self._prefix + self._what + '.h',
>                                blurb, pydoc)
>=20=20
> +    def genc_include(self) -> str:
> +        return genc_include(self._include)
> +
>      def write(self, output_dir: str) -> None:
>          self._genc.write(output_dir)
>          self._genh.write(output_dir)
> @@ -246,12 +258,14 @@ def write(self, output_dir: str) -> None:
>  class QAPISchemaModularCVisitor(QAPISchemaVisitor):
>      def __init__(self,
>                   prefix: str,
> +                 include: List[str],
>                   what: str,
>                   user_blurb: str,
>                   builtin_blurb: Optional[str],
>                   pydoc: str,
>                   gen_tracing: bool =3D False):
>          self._prefix =3D prefix
> +        self._include =3D include
>          self._what =3D what
>          self._user_blurb =3D user_blurb
>          self._builtin_blurb =3D builtin_blurb
> @@ -262,6 +276,9 @@ def __init__(self,
>          self._main_module: Optional[str] =3D None
>          self._gen_tracing =3D gen_tracing
>=20=20
> +    def genc_include(self) -> str:
> +        return genc_include(self._include)
> +
>      @property
>      def _genc(self) -> QAPIGenC:
>          assert self._current_module is not None
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 67c7d89aae00..d965d1769447 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -170,9 +170,9 @@ def to_c_string(string: str) -> str:
>=20=20
>  class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
>=20=20
> -    def __init__(self, prefix: str, unmask: bool):
> +    def __init__(self, prefix: str, include: List[str], unmask: bool):
>          super().__init__(
> -            prefix, 'qapi-introspect',
> +            prefix, include, 'qapi-introspect',
>              ' * QAPI/QMP schema introspection', __doc__)
>          self._unmask =3D unmask
>          self._schema: Optional[QAPISchema] =3D None
> @@ -180,10 +180,12 @@ def __init__(self, prefix: str, unmask: bool):
>          self._used_types: List[QAPISchemaType] =3D []
>          self._name_map: Dict[str, str] =3D {}
>          self._genc.add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "%(prefix)sqapi-introspect.h"
>=20=20
>  ''',
> +                             include=3Dself.genc_include(),
>                               prefix=3Dprefix))
>=20=20
>      def visit_begin(self, schema: QAPISchema) -> None:
> @@ -384,7 +386,8 @@ def visit_event(self, name: str, info: Optional[QAPIS=
ourceInfo],
>=20=20
>=20=20
>  def gen_introspect(schema: QAPISchema, output_dir: str, prefix: str,
> +                   include: List[str],
>                     opt_unmask: bool) -> None:
> -    vis =3D QAPISchemaGenIntrospectVisitor(prefix, opt_unmask)
> +    vis =3D QAPISchemaGenIntrospectVisitor(prefix, include, opt_unmask)
>      schema.visit(vis)
>      vis.write(output_dir)
> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
> index fc216a53d32a..eba98cb9ace2 100644
> --- a/scripts/qapi/main.py
> +++ b/scripts/qapi/main.py
> @@ -9,7 +9,7 @@
>=20=20
>  import argparse
>  import sys
> -from typing import Optional
> +from typing import List, Optional
>=20=20
>  from .commands import gen_commands
>  from .common import must_match
> @@ -31,6 +31,7 @@ def invalid_prefix_char(prefix: str) -> Optional[str]:
>  def generate(schema_file: str,
>               output_dir: str,
>               prefix: str,
> +             include: List[str],
>               unmask: bool =3D False,
>               builtins: bool =3D False,
>               gen_tracing: bool =3D False) -> None:
> @@ -48,11 +49,11 @@ def generate(schema_file: str,
>      assert invalid_prefix_char(prefix) is None
>=20=20
>      schema =3D QAPISchema(schema_file)
> -    gen_types(schema, output_dir, prefix, builtins)
> -    gen_visit(schema, output_dir, prefix, builtins)
> -    gen_commands(schema, output_dir, prefix, gen_tracing)
> -    gen_events(schema, output_dir, prefix)
> -    gen_introspect(schema, output_dir, prefix, unmask)
> +    gen_types(schema, output_dir, prefix, include, builtins)
> +    gen_visit(schema, output_dir, prefix, include, builtins)
> +    gen_commands(schema, output_dir, prefix, include, gen_tracing)
> +    gen_events(schema, output_dir, prefix, include)
> +    gen_introspect(schema, output_dir, prefix, include, unmask)
>=20=20
>=20=20
>  def main() -> int:
> @@ -75,6 +76,9 @@ def main() -> int:
>      parser.add_argument('-u', '--unmask-non-abi-names', action=3D'store_=
true',
>                          dest=3D'unmask',
>                          help=3D"expose non-ABI names in introspection")
> +    parser.add_argument('-i', '--include', nargs=3D'*',
> +                        default=3D['qemu/osdep.h'],
> +                        help=3D"top-level include headers")

The option name --include doesn't really tell me what it is about.  Is
it an include path for schema files?  Or is it about including something
in generated C?  Where in generated C?

The help text provides clues: "headers" suggests .h, and "top-level"
suggests somewhere top-like.

In fact, it's about inserting C code at the beginning of generated .c
files.  For the uses we have in mind, the C code is a single #include.
The patch implements any number of #includes.

More general and arguably less funky: a way to insert arbitrary C code.

Except arbitrary C code on the command line is unwieldy.  Better kept it
in the schema.  Pragma?

Thoughts?

>=20=20
>      # Option --suppress-tracing exists so we can avoid solving build sys=
tem
>      # problems.  TODO Drop it when we no longer need it.
> @@ -94,6 +98,7 @@ def main() -> int:
>          generate(args.schema,
>                   output_dir=3Dargs.output_dir,
>                   prefix=3Dargs.prefix,
> +                 include=3Dargs.include,
>                   unmask=3Dargs.unmask,
>                   builtins=3Dargs.builtins,
>                   gen_tracing=3Dnot args.suppress_tracing)
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 477d02700137..9617b7d4edfa 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -282,18 +282,20 @@ def gen_type_cleanup(name: str) -> str:
>=20=20
>  class QAPISchemaGenTypeVisitor(QAPISchemaModularCVisitor):
>=20=20
> -    def __init__(self, prefix: str):
> +    def __init__(self, prefix: str, include: List[str]):
>          super().__init__(
> -            prefix, 'qapi-types', ' * Schema-defined QAPI types',
> +            prefix, include, 'qapi-types', ' * Schema-defined QAPI types=
',
>              ' * Built-in QAPI types', __doc__)
>=20=20
>      def _begin_builtin_module(self) -> None:
>          self._genc.preamble_add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "qapi/dealloc-visitor.h"
>  #include "qapi/qapi-builtin-types.h"
>  #include "qapi/qapi-builtin-visit.h"
> -'''))
> +''',
> +                                      include=3Dself.genc_include()))
>          self._genh.preamble_add(mcgen('''
>  #include "qapi/util.h"
>  '''))
> @@ -302,11 +304,13 @@ def _begin_user_module(self, name: str) -> None:
>          types =3D self._module_basename('qapi-types', name)
>          visit =3D self._module_basename('qapi-visit', name)
>          self._genc.preamble_add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "qapi/dealloc-visitor.h"
>  #include "%(types)s.h"
>  #include "%(visit)s.h"
>  ''',
> +                                      include=3Dself.genc_include(),
>                                        types=3Dtypes, visit=3Dvisit))
>          self._genh.preamble_add(mcgen('''
>  #include "qapi/qapi-builtin-types.h"
> @@ -381,7 +385,8 @@ def visit_alternate_type(self,
>  def gen_types(schema: QAPISchema,
>                output_dir: str,
>                prefix: str,
> +              include: List[str],
>                opt_builtins: bool) -> None:
> -    vis =3D QAPISchemaGenTypeVisitor(prefix)
> +    vis =3D QAPISchemaGenTypeVisitor(prefix, include)
>      schema.visit(vis)
>      vis.write(output_dir, opt_builtins)
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 380fa197f589..1ff464c0360f 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -318,17 +318,19 @@ def gen_visit_object(name: str) -> str:
>=20=20
>  class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
>=20=20
> -    def __init__(self, prefix: str):
> +    def __init__(self, prefix: str, include: List[str]):
>          super().__init__(
> -            prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
> +            prefix, include, 'qapi-visit', ' * Schema-defined QAPI visit=
ors',
>              ' * Built-in QAPI visitors', __doc__)
>=20=20
>      def _begin_builtin_module(self) -> None:
>          self._genc.preamble_add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "qapi/error.h"
>  #include "qapi/qapi-builtin-visit.h"
> -'''))
> +''',
> +                                      include=3Dself.genc_include()))
>          self._genh.preamble_add(mcgen('''
>  #include "qapi/visitor.h"
>  #include "qapi/qapi-builtin-types.h"
> @@ -339,11 +341,13 @@ def _begin_user_module(self, name: str) -> None:
>          types =3D self._module_basename('qapi-types', name)
>          visit =3D self._module_basename('qapi-visit', name)
>          self._genc.preamble_add(mcgen('''
> -#include "qemu/osdep.h"
> +%(include)s
> +
>  #include "qapi/error.h"
>  #include "qapi/qmp/qerror.h"
>  #include "%(visit)s.h"
>  ''',
> +                                      include=3Dself.genc_include(),
>                                        visit=3Dvisit))
>          self._genh.preamble_add(mcgen('''
>  #include "qapi/qapi-builtin-visit.h"
> @@ -408,7 +412,8 @@ def visit_alternate_type(self,
>  def gen_visit(schema: QAPISchema,
>                output_dir: str,
>                prefix: str,
> +              include: List[str],
>                opt_builtins: bool) -> None:
> -    vis =3D QAPISchemaGenVisitVisitor(prefix)
> +    vis =3D QAPISchemaGenVisitVisitor(prefix, include)
>      schema.visit(vis)
>      vis.write(output_dir, opt_builtins)

Patch is mostly plumbing.  Looks reasonable.


