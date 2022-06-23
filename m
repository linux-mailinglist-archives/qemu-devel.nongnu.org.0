Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85321557517
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:12:43 +0200 (CEST)
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4HxC-0000KI-2x
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o4Hv7-0007ro-86
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:10:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o4Hv1-0001Ht-RP
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655971827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llvxXhowgeTUQFDIEN14cyxbkRFxOgg1pDRvZAlMez8=;
 b=EuRPn5+LOe6Ghvmi2DgHFaOWWvzkVoDLEjINYvhtXHqLC3scRy3wzi67pqTTo4QtvqhnKq
 oRDocWgI6yLw6gNNh2KHRn8Cnx3xZQXxQuMDvF6yhgvbU55VZEoqO36Tr4KRyH9bf8oq++
 fcNtl/DzwtZ3LNGsjvx3dDDwyFrMUGY=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-fEOqMax6NE234GjQT-SRWg-1; Thu, 23 Jun 2022 04:10:24 -0400
X-MC-Unique: fEOqMax6NE234GjQT-SRWg-1
Received: by mail-oi1-f199.google.com with SMTP id
 c8-20020aca3508000000b0032f32d257eeso10818393oia.1
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 01:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=llvxXhowgeTUQFDIEN14cyxbkRFxOgg1pDRvZAlMez8=;
 b=fxTeIk2gTv1q3Q+QsPBqEs2Et4jIGRBxazP7QB2afzV15srpxC4zo1ZhRQ/jwp2fCZ
 sjn6ZjGf2iKh4omHgyqewgE6/XkXor+ra382NQjbAdeO6EmFdTHpvpOd+QAkKj9cmKns
 F0eEj4GRByuD0gHT0cqDGT6FwwbAQ0uxiIGFjDBFstbADAidlulR7gb72uzV62b8HLAZ
 DNWw3G4TewxvM/iI2B6er0wzYSzfHqe2nIGnjKfFFXV9BCqjfywkAd69a3kHWi17stz0
 Amh2qsCZyRfWtLbTonGg0Er9FJ3aRKg3lmpnQRq6ceRs/fDQc8Kg0/1UF4Wl70WqoP0w
 TelQ==
X-Gm-Message-State: AJIora9RpnnQRP840IKznnDhozyyal8gT2WvYWR2pDiUjIMrvl7WHdQe
 k5WVZ88OqncHdqrs9TgDHn3eAZPW7ouowobrOZha3HYRrJ6bY7mccn09AMnELxNINczztWuxQZj
 8TAbJbrZvG90gmUP18UVfEWdJLfIGpPo=
X-Received: by 2002:a05:6808:d50:b0:333:415e:2ca5 with SMTP id
 w16-20020a0568080d5000b00333415e2ca5mr1533439oik.53.1655971823108; 
 Thu, 23 Jun 2022 01:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uSnvVePLHCmv303AUC62YZC2Nrqvwu7YWYYdmYVrykcQ/Pqvpro9DO5UhaLg5gR9XbPFrSSYrXrWu1KbIEW+M=
X-Received: by 2002:a05:6808:d50:b0:333:415e:2ca5 with SMTP id
 w16-20020a0568080d5000b00333415e2ca5mr1533422oik.53.1655971822746; Thu, 23
 Jun 2022 01:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-9-marcandre.lureau@redhat.com>
 <87fsjyqf2w.fsf@pond.sub.org>
In-Reply-To: <87fsjyqf2w.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 23 Jun 2022 12:10:11 +0400
Message-ID: <CAMxuvaz5A1oh4kPVWVwCBvfQjX23EGvfrSukj3Zo+OQGHhmNVQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] scripts/qapi-gen: add -i option
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi


On Tue, Jun 21, 2022 at 6:14 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Replace hard-coded "qemu/osdep.h" include with a qapi-gen option to
> > specify the headers to include. This will allow to substitute QEMU
> > osdep.h with glib.h for example, for projects with different
> > global headers.
> >
> > For historical reasons, we can keep the default as "qemu/osdep.h".
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I wish we'd all agree on "config.h" (conventional with autoconf).  But
> we don't.
>
> Precedence for tweaking generated code with command line options: -p.
>
> I suspect that we'll always specify the same -p and -i for a given
> schema.  To me, that suggests they should both go into the schema
> instead.  Observation, not demand.
>
> > ---
> >  scripts/qapi/commands.py   | 15 ++++++++++-----
> >  scripts/qapi/events.py     | 17 +++++++++++------
> >  scripts/qapi/gen.py        | 17 +++++++++++++++++
> >  scripts/qapi/introspect.py | 11 +++++++----
> >  scripts/qapi/main.py       | 17 +++++++++++------
> >  scripts/qapi/types.py      | 17 +++++++++++------
> >  scripts/qapi/visit.py      | 17 +++++++++++------
> >  7 files changed, 78 insertions(+), 33 deletions(-)
> >
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 38ca38a7b9dd..781491b6390d 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -294,9 +294,9 @@ def gen_register_command(name: str,
> >
> >
> >  class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
> > -    def __init__(self, prefix: str, gen_tracing: bool):
> > +    def __init__(self, prefix: str, include: List[str], gen_tracing: b=
ool):
>
> Ignorant question: why ist this List[str], not str?  Do multiple options
> accumulate into a list?
>
> Alright, I'm back from further down: looks like they do.
>
> >          super().__init__(
> > -            prefix, 'qapi-commands',
> > +            prefix, include, 'qapi-commands',
> >              ' * Schema-defined QAPI/QMP commands', None, __doc__,
> >              gen_tracing=3Dgen_tracing)
> >          self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] =
=3D {}
> > @@ -308,7 +308,8 @@ def _begin_user_module(self, name: str) -> None:
> >          types =3D self._module_basename('qapi-types', name)
> >          visit =3D self._module_basename('qapi-visit', name)
> >          self._genc.add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "qapi/compat-policy.h"
> >  #include "qapi/visitor.h"
> >  #include "qapi/qmp/qdict.h"
> > @@ -318,6 +319,7 @@ def _begin_user_module(self, name: str) -> None:
> >  #include "%(commands)s.h"
> >
> >  ''',
> > +                             include=3Dself.genc_include(),
> >                               commands=3Dcommands, visit=3Dvisit))
> >
> >          if self._gen_tracing and commands !=3D 'qapi-commands':
> > @@ -344,7 +346,8 @@ def visit_begin(self, schema: QAPISchema) -> None:
> >  ''',
> >                               c_prefix=3Dc_name(self._prefix, protect=
=3DFalse)))
> >          self._genc.add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "%(prefix)sqapi-commands.h"
> >  #include "%(prefix)sqapi-init-commands.h"
> >
> > @@ -353,6 +356,7 @@ def visit_begin(self, schema: QAPISchema) -> None:
> >      QTAILQ_INIT(cmds);
> >
> >  ''',
> > +                             include=3Dself.genc_include(),
> >                               prefix=3Dself._prefix,
> >                               c_prefix=3Dc_name(self._prefix, protect=
=3DFalse)))
> >
> > @@ -404,7 +408,8 @@ def visit_command(self,
> >  def gen_commands(schema: QAPISchema,
> >                   output_dir: str,
> >                   prefix: str,
> > +                 include: List[str],
> >                   gen_tracing: bool) -> None:
> > -    vis =3D QAPISchemaGenCommandVisitor(prefix, gen_tracing)
> > +    vis =3D QAPISchemaGenCommandVisitor(prefix, include, gen_tracing)
> >      schema.visit(vis)
> >      vis.write(output_dir)
> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> > index 27b44c49f5e9..6e677d11d2e0 100644
> > --- a/scripts/qapi/events.py
> > +++ b/scripts/qapi/events.py
> > @@ -175,9 +175,9 @@ def gen_event_send(name: str,
> >
> >  class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
> >
> > -    def __init__(self, prefix: str):
> > +    def __init__(self, prefix: str, include: List[str]):
> >          super().__init__(
> > -            prefix, 'qapi-events',
> > +            prefix, include, 'qapi-events',
> >              ' * Schema-defined QAPI/QMP events', None, __doc__)
> >          self._event_enum_name =3D c_name(prefix + 'QAPIEvent', protect=
=3DFalse)
> >          self._event_enum_members: List[QAPISchemaEnumMember] =3D []
> > @@ -188,7 +188,8 @@ def _begin_user_module(self, name: str) -> None:
> >          types =3D self._module_basename('qapi-types', name)
> >          visit =3D self._module_basename('qapi-visit', name)
> >          self._genc.add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "%(prefix)sqapi-emit-events.h"
> >  #include "%(events)s.h"
> >  #include "%(visit)s.h"
> > @@ -198,6 +199,7 @@ def _begin_user_module(self, name: str) -> None:
> >  #include "qapi/qmp-event.h"
> >
> >  ''',
> > +                             include=3Dself.genc_include(),
> >                               events=3Devents, visit=3Dvisit,
> >                               prefix=3Dself._prefix))
> >          self._genh.add(mcgen('''
> > @@ -209,9 +211,11 @@ def _begin_user_module(self, name: str) -> None:
> >      def visit_end(self) -> None:
> >          self._add_module('./emit', ' * QAPI Events emission')
> >          self._genc.preamble_add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "%(prefix)sqapi-emit-events.h"
> >  ''',
> > +                                      include=3Dself.genc_include(),
> >                                        prefix=3Dself._prefix))
> >          self._genh.preamble_add(mcgen('''
> >  #include "qapi/util.h"
> > @@ -246,7 +250,8 @@ def visit_event(self,
> >
> >  def gen_events(schema: QAPISchema,
> >                 output_dir: str,
> > -               prefix: str) -> None:
> > -    vis =3D QAPISchemaGenEventVisitor(prefix)
> > +               prefix: str,
> > +               include: List[str]) -> None:
> > +    vis =3D QAPISchemaGenEventVisitor(prefix, include)
> >      schema.visit(vis)
> >      vis.write(output_dir)
> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> > index 113b49134de4..54a70a5ff516 100644
> > --- a/scripts/qapi/gen.py
> > +++ b/scripts/qapi/gen.py
> > @@ -17,6 +17,7 @@
> >  from typing import (
> >      Dict,
> >      Iterator,
> > +    List,
> >      Optional,
> >      Sequence,
> >      Tuple,
> > @@ -45,6 +46,12 @@ def gen_special_features(features: Sequence[QAPISche=
maFeature]) -> str:
> >      return ' | '.join(special_features) or '0'
> >
> >
> > +def genc_include(include: List[str]) -> str:
> > +    return '\n'.join(['#include ' +
> > +                      (f'"{inc}"' if inc[0] not in ('<', '"') else inc=
)
> > +                      for inc in include])
>
> This maps a list of file names / #include arguments to C code including
> them, mapping file names to #include arguments by enclosing them in "".
>
> Option arguments of the form <foo.h> and "foo.h" need to be quoted in
> the shell.  The latter can be done without quoting as foo.h.
>
> Somewhat funky wedding of generality with convenience.
>
> > +
> > +
> >  class QAPIGen:
> >      def __init__(self, fname: str):
> >          self.fname =3D fname
> > @@ -228,16 +235,21 @@ def ifcontext(ifcond: QAPISchemaIfCond, *args: QA=
PIGenCCode) -> Iterator[None]:
> >  class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor):
> >      def __init__(self,
> >                   prefix: str,
> > +                 include: List[str],
> >                   what: str,
> >                   blurb: str,
> >                   pydoc: str):
> >          self._prefix =3D prefix
> > +        self._include =3D include
> >          self._what =3D what
> >          self._genc =3D QAPIGenC(self._prefix + self._what + '.c',
> >                                blurb, pydoc)
> >          self._genh =3D QAPIGenH(self._prefix + self._what + '.h',
> >                                blurb, pydoc)
> >
> > +    def genc_include(self) -> str:
> > +        return genc_include(self._include)
> > +
> >      def write(self, output_dir: str) -> None:
> >          self._genc.write(output_dir)
> >          self._genh.write(output_dir)
> > @@ -246,12 +258,14 @@ def write(self, output_dir: str) -> None:
> >  class QAPISchemaModularCVisitor(QAPISchemaVisitor):
> >      def __init__(self,
> >                   prefix: str,
> > +                 include: List[str],
> >                   what: str,
> >                   user_blurb: str,
> >                   builtin_blurb: Optional[str],
> >                   pydoc: str,
> >                   gen_tracing: bool =3D False):
> >          self._prefix =3D prefix
> > +        self._include =3D include
> >          self._what =3D what
> >          self._user_blurb =3D user_blurb
> >          self._builtin_blurb =3D builtin_blurb
> > @@ -262,6 +276,9 @@ def __init__(self,
> >          self._main_module: Optional[str] =3D None
> >          self._gen_tracing =3D gen_tracing
> >
> > +    def genc_include(self) -> str:
> > +        return genc_include(self._include)
> > +
> >      @property
> >      def _genc(self) -> QAPIGenC:
> >          assert self._current_module is not None
> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> > index 67c7d89aae00..d965d1769447 100644
> > --- a/scripts/qapi/introspect.py
> > +++ b/scripts/qapi/introspect.py
> > @@ -170,9 +170,9 @@ def to_c_string(string: str) -> str:
> >
> >  class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
> >
> > -    def __init__(self, prefix: str, unmask: bool):
> > +    def __init__(self, prefix: str, include: List[str], unmask: bool):
> >          super().__init__(
> > -            prefix, 'qapi-introspect',
> > +            prefix, include, 'qapi-introspect',
> >              ' * QAPI/QMP schema introspection', __doc__)
> >          self._unmask =3D unmask
> >          self._schema: Optional[QAPISchema] =3D None
> > @@ -180,10 +180,12 @@ def __init__(self, prefix: str, unmask: bool):
> >          self._used_types: List[QAPISchemaType] =3D []
> >          self._name_map: Dict[str, str] =3D {}
> >          self._genc.add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "%(prefix)sqapi-introspect.h"
> >
> >  ''',
> > +                             include=3Dself.genc_include(),
> >                               prefix=3Dprefix))
> >
> >      def visit_begin(self, schema: QAPISchema) -> None:
> > @@ -384,7 +386,8 @@ def visit_event(self, name: str, info: Optional[QAP=
ISourceInfo],
> >
> >
> >  def gen_introspect(schema: QAPISchema, output_dir: str, prefix: str,
> > +                   include: List[str],
> >                     opt_unmask: bool) -> None:
> > -    vis =3D QAPISchemaGenIntrospectVisitor(prefix, opt_unmask)
> > +    vis =3D QAPISchemaGenIntrospectVisitor(prefix, include, opt_unmask=
)
> >      schema.visit(vis)
> >      vis.write(output_dir)
> > diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
> > index fc216a53d32a..eba98cb9ace2 100644
> > --- a/scripts/qapi/main.py
> > +++ b/scripts/qapi/main.py
> > @@ -9,7 +9,7 @@
> >
> >  import argparse
> >  import sys
> > -from typing import Optional
> > +from typing import List, Optional
> >
> >  from .commands import gen_commands
> >  from .common import must_match
> > @@ -31,6 +31,7 @@ def invalid_prefix_char(prefix: str) -> Optional[str]=
:
> >  def generate(schema_file: str,
> >               output_dir: str,
> >               prefix: str,
> > +             include: List[str],
> >               unmask: bool =3D False,
> >               builtins: bool =3D False,
> >               gen_tracing: bool =3D False) -> None:
> > @@ -48,11 +49,11 @@ def generate(schema_file: str,
> >      assert invalid_prefix_char(prefix) is None
> >
> >      schema =3D QAPISchema(schema_file)
> > -    gen_types(schema, output_dir, prefix, builtins)
> > -    gen_visit(schema, output_dir, prefix, builtins)
> > -    gen_commands(schema, output_dir, prefix, gen_tracing)
> > -    gen_events(schema, output_dir, prefix)
> > -    gen_introspect(schema, output_dir, prefix, unmask)
> > +    gen_types(schema, output_dir, prefix, include, builtins)
> > +    gen_visit(schema, output_dir, prefix, include, builtins)
> > +    gen_commands(schema, output_dir, prefix, include, gen_tracing)
> > +    gen_events(schema, output_dir, prefix, include)
> > +    gen_introspect(schema, output_dir, prefix, include, unmask)
> >
> >
> >  def main() -> int:
> > @@ -75,6 +76,9 @@ def main() -> int:
> >      parser.add_argument('-u', '--unmask-non-abi-names', action=3D'stor=
e_true',
> >                          dest=3D'unmask',
> >                          help=3D"expose non-ABI names in introspection"=
)
> > +    parser.add_argument('-i', '--include', nargs=3D'*',
> > +                        default=3D['qemu/osdep.h'],
> > +                        help=3D"top-level include headers")
>
> The option name --include doesn't really tell me what it is about.  Is
> it an include path for schema files?  Or is it about including something
> in generated C?  Where in generated C?
>
> The help text provides clues: "headers" suggests .h, and "top-level"
> suggests somewhere top-like.
>
> In fact, it's about inserting C code at the beginning of generated .c
> files.  For the uses we have in mind, the C code is a single #include.
> The patch implements any number of #includes.
>
> More general and arguably less funky: a way to insert arbitrary C code.
>
> Except arbitrary C code on the command line is unwieldy.  Better kept it
> in the schema.  Pragma?
>
> Thoughts?

Pragmas are global currently. This doesn't scale well, as we would
like to split the schemas. I have a following patch that will allow me
to split/merge the pragmas. This is not optimal either, I would rather
remove/replace them (using annotations).

Imho, global tweaking of compilation is better done from the command line.

>
> >
> >      # Option --suppress-tracing exists so we can avoid solving build s=
ystem
> >      # problems.  TODO Drop it when we no longer need it.
> > @@ -94,6 +98,7 @@ def main() -> int:
> >          generate(args.schema,
> >                   output_dir=3Dargs.output_dir,
> >                   prefix=3Dargs.prefix,
> > +                 include=3Dargs.include,
> >                   unmask=3Dargs.unmask,
> >                   builtins=3Dargs.builtins,
> >                   gen_tracing=3Dnot args.suppress_tracing)
> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > index 477d02700137..9617b7d4edfa 100644
> > --- a/scripts/qapi/types.py
> > +++ b/scripts/qapi/types.py
> > @@ -282,18 +282,20 @@ def gen_type_cleanup(name: str) -> str:
> >
> >  class QAPISchemaGenTypeVisitor(QAPISchemaModularCVisitor):
> >
> > -    def __init__(self, prefix: str):
> > +    def __init__(self, prefix: str, include: List[str]):
> >          super().__init__(
> > -            prefix, 'qapi-types', ' * Schema-defined QAPI types',
> > +            prefix, include, 'qapi-types', ' * Schema-defined QAPI typ=
es',
> >              ' * Built-in QAPI types', __doc__)
> >
> >      def _begin_builtin_module(self) -> None:
> >          self._genc.preamble_add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "qapi/dealloc-visitor.h"
> >  #include "qapi/qapi-builtin-types.h"
> >  #include "qapi/qapi-builtin-visit.h"
> > -'''))
> > +''',
> > +                                      include=3Dself.genc_include()))
> >          self._genh.preamble_add(mcgen('''
> >  #include "qapi/util.h"
> >  '''))
> > @@ -302,11 +304,13 @@ def _begin_user_module(self, name: str) -> None:
> >          types =3D self._module_basename('qapi-types', name)
> >          visit =3D self._module_basename('qapi-visit', name)
> >          self._genc.preamble_add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "qapi/dealloc-visitor.h"
> >  #include "%(types)s.h"
> >  #include "%(visit)s.h"
> >  ''',
> > +                                      include=3Dself.genc_include(),
> >                                        types=3Dtypes, visit=3Dvisit))
> >          self._genh.preamble_add(mcgen('''
> >  #include "qapi/qapi-builtin-types.h"
> > @@ -381,7 +385,8 @@ def visit_alternate_type(self,
> >  def gen_types(schema: QAPISchema,
> >                output_dir: str,
> >                prefix: str,
> > +              include: List[str],
> >                opt_builtins: bool) -> None:
> > -    vis =3D QAPISchemaGenTypeVisitor(prefix)
> > +    vis =3D QAPISchemaGenTypeVisitor(prefix, include)
> >      schema.visit(vis)
> >      vis.write(output_dir, opt_builtins)
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 380fa197f589..1ff464c0360f 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -318,17 +318,19 @@ def gen_visit_object(name: str) -> str:
> >
> >  class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
> >
> > -    def __init__(self, prefix: str):
> > +    def __init__(self, prefix: str, include: List[str]):
> >          super().__init__(
> > -            prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
> > +            prefix, include, 'qapi-visit', ' * Schema-defined QAPI vis=
itors',
> >              ' * Built-in QAPI visitors', __doc__)
> >
> >      def _begin_builtin_module(self) -> None:
> >          self._genc.preamble_add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-builtin-visit.h"
> > -'''))
> > +''',
> > +                                      include=3Dself.genc_include()))
> >          self._genh.preamble_add(mcgen('''
> >  #include "qapi/visitor.h"
> >  #include "qapi/qapi-builtin-types.h"
> > @@ -339,11 +341,13 @@ def _begin_user_module(self, name: str) -> None:
> >          types =3D self._module_basename('qapi-types', name)
> >          visit =3D self._module_basename('qapi-visit', name)
> >          self._genc.preamble_add(mcgen('''
> > -#include "qemu/osdep.h"
> > +%(include)s
> > +
> >  #include "qapi/error.h"
> >  #include "qapi/qmp/qerror.h"
> >  #include "%(visit)s.h"
> >  ''',
> > +                                      include=3Dself.genc_include(),
> >                                        visit=3Dvisit))
> >          self._genh.preamble_add(mcgen('''
> >  #include "qapi/qapi-builtin-visit.h"
> > @@ -408,7 +412,8 @@ def visit_alternate_type(self,
> >  def gen_visit(schema: QAPISchema,
> >                output_dir: str,
> >                prefix: str,
> > +              include: List[str],
> >                opt_builtins: bool) -> None:
> > -    vis =3D QAPISchemaGenVisitVisitor(prefix)
> > +    vis =3D QAPISchemaGenVisitVisitor(prefix, include)
> >      schema.visit(vis)
> >      vis.write(output_dir, opt_builtins)
>
> Patch is mostly plumbing.  Looks reasonable.
>


