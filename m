Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F070160B6C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 08:09:37 +0100 (CET)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3aX9-000464-Ud
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 02:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j3aWA-0003Hy-VD
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:08:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j3aW8-00013r-MY
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:08:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43477
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j3aW7-00012A-Bc
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581923311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4he5iatdZDF1YdKRiPuYK66g8NwqBt9JcD7mMa5ZMs=;
 b=jTvtPCb+I3zbneWuNGzRzC/MYE5Hb5khpr2xsvrgtlZy445KTJpeW3VES4kt47JI72T0dv
 aSV0SobWwTGNrHFPGh7kVSIsbelaRh8A8XH0ufzte2gtjy+jjqYWqWFdvZjeNOTEG8FxSV
 CWZBFqH58K2A6WqHKD3XeyqMJI8GaT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-bDQDzkTCMP67aGlVJZWeHQ-1; Mon, 17 Feb 2020 02:08:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7B86107ACCA;
 Mon, 17 Feb 2020 07:08:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B2FC5DA75;
 Mon, 17 Feb 2020 07:08:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0286711385C9; Mon, 17 Feb 2020 08:08:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v4 1/4] qapi: Add a 'coroutine' flag for commands
References: <20200121181122.15941-1-kwolf@redhat.com>
 <20200121181122.15941-2-kwolf@redhat.com>
Date: Mon, 17 Feb 2020 08:08:20 +0100
In-Reply-To: <20200121181122.15941-2-kwolf@redhat.com> (Kevin Wolf's message
 of "Tue, 21 Jan 2020 19:11:19 +0100")
Message-ID: <87wo8lvggr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: bDQDzkTCMP67aGlVJZWeHQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: stefanha@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This patch adds a new 'coroutine' flag to QMP command definitions that
> tells the QMP dispatcher that the command handler is safe to be run in a
> coroutine.
>
> The documentation of the new flag pretends that this flag is already
> used as intended, which it isn't yet after this patch. We'll implement
> this in another patch in this series.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/devel/qapi-code-gen.txt            | 10 ++++++++++
>  include/qapi/qmp/dispatch.h             |  1 +
>  tests/test-qmp-cmds.c                   |  4 ++++
>  scripts/qapi/commands.py                | 10 +++++++---
>  scripts/qapi/doc.py                     |  2 +-
>  scripts/qapi/expr.py                    |  7 +++++--
>  scripts/qapi/introspect.py              |  2 +-
>  scripts/qapi/schema.py                  |  9 ++++++---
>  tests/qapi-schema/test-qapi.py          |  7 ++++---
>  tests/Makefile.include                  |  1 +
>  tests/qapi-schema/oob-coroutine.err     |  2 ++
>  tests/qapi-schema/oob-coroutine.json    |  2 ++
>  tests/qapi-schema/oob-coroutine.out     |  0
>  tests/qapi-schema/qapi-schema-test.json |  1 +
>  tests/qapi-schema/qapi-schema-test.out  |  2 ++
>  15 files changed, 47 insertions(+), 13 deletions(-)
>  create mode 100644 tests/qapi-schema/oob-coroutine.err
>  create mode 100644 tests/qapi-schema/oob-coroutine.json
>  create mode 100644 tests/qapi-schema/oob-coroutine.out
>
> diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
> index 59d6973e1e..9b65cd3ab3 100644
> --- a/docs/devel/qapi-code-gen.txt
> +++ b/docs/devel/qapi-code-gen.txt
> @@ -457,6 +457,7 @@ Syntax:
>                  '*gen': false,
>                  '*allow-oob': true,
>                  '*allow-preconfig': true,
> +                '*coroutine': true,
>                  '*if': COND,
>                  '*features': FEATURES }
> =20
> @@ -581,6 +582,15 @@ before the machine is built.  It defaults to false. =
 For example:
>  QMP is available before the machine is built only when QEMU was
>  started with --preconfig.
> =20
> +Member 'coroutine' tells the QMP dispatcher whether the command handler
> +is safe to be run in a coroutine.  It defaults to false.  If it is true,
> +the command handler is called from coroutine context and may yield while
> +waiting for an external event (such as I/O completion) in order to avoid
> +blocking the guest and other background operations.
> +
> +It is an error to specify both 'coroutine': true and 'allow-oob': true
> +for a command.
> +
>  The optional 'if' member specifies a conditional.  See "Configuring
>  the schema" below for more on this.
> =20
> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> index 9aa426a398..d6ce9efc8e 100644
> --- a/include/qapi/qmp/dispatch.h
> +++ b/include/qapi/qmp/dispatch.h
> @@ -24,6 +24,7 @@ typedef enum QmpCommandOptions
>      QCO_NO_SUCCESS_RESP       =3D  (1U << 0),
>      QCO_ALLOW_OOB             =3D  (1U << 1),
>      QCO_ALLOW_PRECONFIG       =3D  (1U << 2),
> +    QCO_COROUTINE             =3D  (1U << 3),
>  } QmpCommandOptions;
> =20
>  typedef struct QmpCommand
> diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
> index 79507d9e54..6359cc28c7 100644
> --- a/tests/test-qmp-cmds.c
> +++ b/tests/test-qmp-cmds.c
> @@ -35,6 +35,10 @@ void qmp_cmd_success_response(Error **errp)
>  {
>  }
> =20
> +void qmp_coroutine_cmd(Error **errp)
> +{
> +}
> +
>  Empty2 *qmp_user_def_cmd0(Error **errp)
>  {
>      return g_new0(Empty2, 1);
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index afa55b055c..f2f2f8948d 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -194,7 +194,8 @@ out:
>      return ret
> =20
> =20
> -def gen_register_command(name, success_response, allow_oob, allow_precon=
fig):
> +def gen_register_command(name, success_response, allow_oob, allow_precon=
fig,
> +                         coroutine):
>      options =3D []
> =20
>      if not success_response:
> @@ -203,6 +204,8 @@ def gen_register_command(name, success_response, allo=
w_oob, allow_preconfig):
>          options +=3D ['QCO_ALLOW_OOB']
>      if allow_preconfig:
>          options +=3D ['QCO_ALLOW_PRECONFIG']
> +    if coroutine:
> +        options +=3D ['QCO_COROUTINE']
> =20
>      if not options:
>          options =3D ['QCO_NO_OPTIONS']
> @@ -285,7 +288,7 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmd=
s);
> =20
>      def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
>                        success_response, boxed, allow_oob, allow_preconfi=
g,
> -                      features):
> +                      coroutine, features):
>          if not gen:
>              return
>          # FIXME: If T is a user-defined type, the user is responsible
> @@ -303,7 +306,8 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmd=
s);
>              self._genh.add(gen_marshal_decl(name))
>              self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
>              self._regy.add(gen_register_command(name, success_response,
> -                                                allow_oob, allow_preconf=
ig))
> +                                                allow_oob, allow_preconf=
ig,
> +                                                coroutine))
> =20
> =20
>  def gen_commands(schema, output_dir, prefix):
> diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
> index 6f1c17f71f..8b6978c81e 100644
> --- a/scripts/qapi/doc.py
> +++ b/scripts/qapi/doc.py
> @@ -265,7 +265,7 @@ class QAPISchemaGenDocVisitor(QAPISchemaVisitor):
> =20
>      def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
>                        success_response, boxed, allow_oob, allow_preconfi=
g,
> -                      features):
> +                      coroutine, features):
>          doc =3D self.cur_doc
>          self._gen.add(texi_msg('Command', doc, ifcond,
>                                 texi_arguments(doc,
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index d7a289eded..769c54ebfe 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -89,10 +89,13 @@ def check_flags(expr, info):
>          if key in expr and expr[key] is not False:
>              raise QAPISemError(
>                  info, "flag '%s' may only use false value" % key)
> -    for key in ['boxed', 'allow-oob', 'allow-preconfig']:
> +    for key in ['boxed', 'allow-oob', 'allow-preconfig', 'coroutine']:
>          if key in expr and expr[key] is not True:
>              raise QAPISemError(
>                  info, "flag '%s' may only use true value" % key)
> +    if 'allow-oob' in expr and 'coroutine' in expr:
> +        raise QAPISemError(info, "flags 'allow-oob' and 'coroutine' "
> +                                 "are incompatible")

Only because we didn't implement coroutine context for exec-oob, for
want of a use case.  I think we should note that somehow, to remind our
future selves that the two aren't actually fundamentally incompatible.
Could put the reminder into the error message, like "'coroutine': true
isn't implement with 'allow-oob': true".  A comment would do as well.

A similar reminder in qapi-code-gen.txt wouldn't hurt.

> =20
> =20
>  def check_if(expr, info, source):
> @@ -344,7 +347,7 @@ def check_exprs(exprs):
>                         ['command'],
>                         ['data', 'returns', 'boxed', 'if', 'features',
>                          'gen', 'success-response', 'allow-oob',
> -                        'allow-preconfig'])
> +                        'allow-preconfig', 'coroutine'])
>              normalize_members(expr.get('data'))
>              check_command(expr, info)
>          elif meta =3D=3D 'event':
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index b3a463dd8b..8a296a69d6 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -212,7 +212,7 @@ const QLitObject %(c_name)s =3D %(c_string)s;
> =20
>      def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
>                        success_response, boxed, allow_oob, allow_preconfi=
g,
> -                      features):
> +                      coroutine, features):
>          arg_type =3D arg_type or self._schema.the_empty_object_type
>          ret_type =3D ret_type or self._schema.the_empty_object_type
>          obj =3D {'arg-type': self._use_type(arg_type),
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 0bfc5256fb..87d76b59d3 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -128,7 +128,7 @@ class QAPISchemaVisitor(object):
> =20
>      def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
>                        success_response, boxed, allow_oob, allow_preconfi=
g,
> -                      features):
> +                      coroutine, features):
>          pass
> =20
>      def visit_event(self, name, info, ifcond, arg_type, boxed):
> @@ -690,7 +690,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
> =20
>      def __init__(self, name, info, doc, ifcond, arg_type, ret_type,
>                   gen, success_response, boxed, allow_oob, allow_preconfi=
g,
> -                 features):
> +                 coroutine, features):
>          QAPISchemaEntity.__init__(self, name, info, doc, ifcond, feature=
s)
>          assert not arg_type or isinstance(arg_type, str)
>          assert not ret_type or isinstance(ret_type, str)
> @@ -703,6 +703,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
>          self.boxed =3D boxed
>          self.allow_oob =3D allow_oob
>          self.allow_preconfig =3D allow_preconfig
> +        self.coroutine =3D coroutine
> =20
>      def check(self, schema):
>          QAPISchemaEntity.check(self, schema)
> @@ -745,7 +746,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
>                                self.arg_type, self.ret_type,
>                                self.gen, self.success_response,
>                                self.boxed, self.allow_oob,
> -                              self.allow_preconfig,
> +                              self.allow_preconfig, self.coroutine,
>                                self.features)
> =20
> =20
> @@ -1043,6 +1044,7 @@ class QAPISchema(object):
>          boxed =3D expr.get('boxed', False)
>          allow_oob =3D expr.get('allow-oob', False)
>          allow_preconfig =3D expr.get('allow-preconfig', False)
> +        coroutine =3D expr.get('coroutine', False)
>          ifcond =3D expr.get('if')
>          features =3D expr.get('features', [])
>          if isinstance(data, OrderedDict):
> @@ -1054,6 +1056,7 @@ class QAPISchema(object):
>          self._def_entity(QAPISchemaCommand(name, info, doc, ifcond, data=
, rets,
>                                             gen, success_response,
>                                             boxed, allow_oob, allow_preco=
nfig,
> +                                           coroutine,
>                                             self._make_features(features,=
 info)))
> =20
>      def _def_event(self, expr, info, doc):
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
> index bad14edb47..7a8e65188d 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -70,12 +70,13 @@ class QAPISchemaTestVisitor(QAPISchemaVisitor):
> =20
>      def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
>                        success_response, boxed, allow_oob, allow_preconfi=
g,
> -                      features):
> +                      coroutine, features):
>          print('command %s %s -> %s'
>                % (name, arg_type and arg_type.name,
>                   ret_type and ret_type.name))
> -        print('    gen=3D%s success_response=3D%s boxed=3D%s oob=3D%s pr=
econfig=3D%s'
> -              % (gen, success_response, boxed, allow_oob, allow_preconfi=
g))
> +        print('    gen=3D%s success_response=3D%s boxed=3D%s oob=3D%s pr=
econfig=3D%s%s'
> +              % (gen, success_response, boxed, allow_oob, allow_preconfi=
g,
> +                 " coroutine=3DTrue" if coroutine else ""))
>          self._print_if(ifcond)
>          self._print_features(features)
> =20
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index c6827ce8c2..d111389c03 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -286,6 +286,7 @@ qapi-schema +=3D missing-type.json
>  qapi-schema +=3D nested-struct-data.json
>  qapi-schema +=3D nested-struct-data-invalid-dict.json
>  qapi-schema +=3D non-objects.json
> +qapi-schema +=3D oob-coroutine.json
>  qapi-schema +=3D oob-test.json
>  qapi-schema +=3D allow-preconfig-test.json
>  qapi-schema +=3D pragma-doc-required-crap.json
> diff --git a/tests/qapi-schema/oob-coroutine.err b/tests/qapi-schema/oob-=
coroutine.err
> new file mode 100644
> index 0000000000..c01a4992bd
> --- /dev/null
> +++ b/tests/qapi-schema/oob-coroutine.err
> @@ -0,0 +1,2 @@
> +oob-coroutine.json: In command 'oob-command-1':
> +oob-coroutine.json:2: flags 'allow-oob' and 'coroutine' are incompatible
> diff --git a/tests/qapi-schema/oob-coroutine.json b/tests/qapi-schema/oob=
-coroutine.json
> new file mode 100644
> index 0000000000..0f67663bcd
> --- /dev/null
> +++ b/tests/qapi-schema/oob-coroutine.json
> @@ -0,0 +1,2 @@
> +# Check that incompatible flags allow-oob and coroutine are rejected
> +{ 'command': 'oob-command-1', 'allow-oob': true, 'coroutine': true }
> diff --git a/tests/qapi-schema/oob-coroutine.out b/tests/qapi-schema/oob-=
coroutine.out
> new file mode 100644
> index 0000000000..e69de29bb2

You remembered to cover the error case.  Appreciated!

> diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
> index 9abf175fe0..1a850fe171 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -147,6 +147,7 @@
>    'returns': 'UserDefTwo' }
> =20
>  { 'command': 'cmd-success-response', 'data': {}, 'success-response': fal=
se }
> +{ 'command': 'coroutine-cmd', 'data': {}, 'coroutine': true }
> =20
>  # Returning a non-dictionary requires a name from the whitelist
>  { 'command': 'guest-get-time', 'data': {'a': 'int', '*b': 'int' },
> diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
> index 9bd3c4a490..fdc349991a 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -203,6 +203,8 @@ command user_def_cmd2 q_obj_user_def_cmd2-arg -> User=
DefTwo
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>  command cmd-success-response None -> None
>      gen=3DTrue success_response=3DFalse boxed=3DFalse oob=3DFalse precon=
fig=3DFalse
> +command coroutine-cmd None -> None
> +    gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse coroutine=3DTrue
>  object q_obj_guest-get-time-arg
>      member a: int optional=3DFalse
>      member b: int optional=3DTrue

Preferably with the "not implemented" status clarified:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


