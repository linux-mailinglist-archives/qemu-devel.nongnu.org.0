Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1475949B128
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:08:39 +0100 (CET)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIkf-0007aZ-Na
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:08:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCIfM-0004kf-8c
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:03:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCIfI-0001Mn-5I
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643104976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4/yTTo+Um0cJAWmNFPLL+cE3Q73V6lBaJxoR5N0rsfE=;
 b=Vpu/XZsLY4tswy0EJCK7BiswVPKybe6vzN26kNdr9OhCFcMrlwsjLpWYePTA3szqx5+PGe
 mX+iUZxsK+0rq2nOs32ONpCA03uU23NaZ1a9RD7M0VGSTR3cIQvoO1uoih2CdXv5q0tmzn
 9S4s3rpa/l4yoqcK+ltwNbfQkDGc8xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-GAMZPyMQPpaTXjGubeE8BA-1; Tue, 25 Jan 2022 05:02:53 -0500
X-MC-Unique: GAMZPyMQPpaTXjGubeE8BA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E50F814246;
 Tue, 25 Jan 2022 10:02:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 976F162D7B;
 Tue, 25 Jan 2022 10:02:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 185B61138640; Tue, 25 Jan 2022 11:02:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 2/3] scripts/qapi/commands: gen_commands(): add
 add_trace_events arg
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-3-vsementsov@virtuozzo.com>
Date: Tue, 25 Jan 2022 11:02:44 +0100
In-Reply-To: <20220121162234.2707906-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 21 Jan 2022 17:22:33 +0100")
Message-ID: <877dao3zgb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We are going to generate trace events for qmp commands. We should
> generate both trace_*() function calls and trace-events files listing
> events for trace generator.
>
> Now implement that possibility in gen_commands() function.
>
> The functionality will be used in the following commit, and now comment
> in _begin_user_module() about c_name() is a bit premature.

Neglects to explain why it needs to be optional.

Suggest

  qapi/commands: Optionally generate trace for QMP commands

  Add trace generation disabled.  The next commit will enable it for
  qapi/, but not for qga/ and tests/.  Making it work for the latter two
  would involve some Meson hackery to ensure we generate the
  trace-events files before trace-tool uses them.  Since we don't
  actually support tracing there, we'll bypass that problem.

>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/commands.py | 101 +++++++++++++++++++++++++++++++++------
>  scripts/qapi/main.py     |   2 +-
>  2 files changed, 88 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 21001bbd6b..166bf5dcbc 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
>  def gen_call(name: str,
>               arg_type: Optional[QAPISchemaObjectType],
>               boxed: bool,
> -             ret_type: Optional[QAPISchemaType]) -> str:
> +             ret_type: Optional[QAPISchemaType],
> +             add_trace_events: bool) -> str:
>      ret = ''
>  
>      argstr = ''
> @@ -71,21 +72,67 @@ def gen_call(name: str,
>      if ret_type:
>          lhs = 'retval = '
>  
> -    ret = mcgen('''
> +    name = c_name(name)
> +    upper = name.upper()
>  
> -    %(lhs)sqmp_%(c_name)s(%(args)s&err);
> -    error_propagate(errp, err);
> -''',
> -                c_name=c_name(name), args=argstr, lhs=lhs)
> -    if ret_type:
> +    if add_trace_events:
>          ret += mcgen('''
> +
> +    if (trace_event_get_state_backends(TRACE_QMP_ENTER_%(upper)s)) {
> +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
> +
> +        trace_qmp_enter_%(name)s(req_json->str);
> +    }
> +    ''',
> +                     upper=upper, name=name)
> +
> +    ret += mcgen('''
> +
> +    %(lhs)sqmp_%(name)s(%(args)s&err);
> +''',
> +                 name=name, args=argstr, lhs=lhs)
> +
> +    ret += mcgen('''
>      if (err) {
> +''')
> +
> +    if add_trace_events:
> +        ret += mcgen('''
> +        trace_qmp_exit_%(name)s(error_get_pretty(err), false);
> +''',
> +                     name=name)
> +
> +    ret += mcgen('''
> +        error_propagate(errp, err);
>          goto out;
>      }
> +''')

Before the patch, we generate

    error_propagate(errp, err);

and if there's any code between here and out:

    if (err) {
        goto out;
    }

After the patch, we always generate

    if (err) {
        error_propagate(errp, err);
        goto out;
    }

But with trace generation enabled (next patch), it changes to

    if (err) {
        trace_qmp_exit_FOO(error_get_pretty(err), false);
        error_propagate(errp, err);
        goto out;
    }

    trace_qmp_exit_FOO("{}", true);

Okay.

> +
> +    if ret_type:
> +        ret += mcgen('''
>  
>      qmp_marshal_output_%(c_name)s(retval, ret, errp);
>  ''',
>                       c_name=ret_type.c_name())
> +
> +    if add_trace_events:
> +        if ret_type:
> +            ret += mcgen('''
> +
> +    if (trace_event_get_state_backends(TRACE_QMP_EXIT_%(upper)s)) {
> +        g_autoptr(GString) ret_json = qobject_to_json(*ret);
> +
> +        trace_qmp_exit_%(name)s(ret_json->str, true);
> +    }
> +    ''',
> +                         upper=upper, name=name)
> +        else:
> +            ret += mcgen('''
> +
> +    trace_qmp_exit_%(name)s("{}", true);
> +    ''',
> +                         name=name)
> +
>      return ret
>  
>  
> @@ -122,10 +169,19 @@ def gen_marshal_decl(name: str) -> str:
>                   proto=build_marshal_proto(name))
>  
>  
> +def gen_trace(name: str) -> str:
> +    return mcgen('''
> +qmp_enter_%(name)s(const char *json) "%%s"
> +qmp_exit_%(name)s(const char *result, bool succeeded) "%%s %%d"
> +''',
> +                 name=c_name(name))
> +
> +
>  def gen_marshal(name: str,
>                  arg_type: Optional[QAPISchemaObjectType],
>                  boxed: bool,
> -                ret_type: Optional[QAPISchemaType]) -> str:
> +                ret_type: Optional[QAPISchemaType],
> +                add_trace_events: bool) -> str:
>      have_args = boxed or (arg_type and not arg_type.is_empty())
>      if have_args:
>          assert arg_type is not None
> @@ -180,7 +236,7 @@ def gen_marshal(name: str,
>      }
>  ''')
>  
> -    ret += gen_call(name, arg_type, boxed, ret_type)
> +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_events)
>  
>      ret += mcgen('''
>  
> @@ -238,11 +294,13 @@ def gen_register_command(name: str,
>  
>  
>  class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
> -    def __init__(self, prefix: str):
> +    def __init__(self, prefix: str, add_trace_events: bool):
>          super().__init__(
>              prefix, 'qapi-commands',
> -            ' * Schema-defined QAPI/QMP commands', None, __doc__)
> +            ' * Schema-defined QAPI/QMP commands', None, __doc__,
> +            add_trace_events=add_trace_events)
>          self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
> +        self.add_trace_events = add_trace_events
>  
>      def _begin_user_module(self, name: str) -> None:
>          self._visited_ret_types[self._genc] = set()
> @@ -261,6 +319,17 @@ def _begin_user_module(self, name: str) -> None:
>  
>  ''',
>                               commands=commands, visit=visit))
> +
> +        if self.add_trace_events and commands != 'qapi-commands':
> +            self._genc.add(mcgen('''
> +#include "trace/trace-qapi.h"
> +#include "qapi/qmp/qjson.h"
> +#include "trace/trace-%(nm)s_trace_events.h"
> +''',
> +                                 nm=c_name(commands, protect=False)))
> +            # We use c_name(commands, protect=False) to turn '-' into '_', to
> +            # match .underscorify() in trace/meson.build
> +
>          self._genh.add(mcgen('''
>  #include "%(types)s.h"
>  
> @@ -322,7 +391,10 @@ def visit_command(self,
>          with ifcontext(ifcond, self._genh, self._genc):
>              self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
>              self._genh.add(gen_marshal_decl(name))
> -            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
> +            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
> +                                       self.add_trace_events))
> +            if self.add_trace_events:
> +                self._gent.add(gen_trace(name))
>          with self._temp_module('./init'):
>              with ifcontext(ifcond, self._genh, self._genc):
>                  self._genc.add(gen_register_command(
> @@ -332,7 +404,8 @@ def visit_command(self,
>  
>  def gen_commands(schema: QAPISchema,
>                   output_dir: str,
> -                 prefix: str) -> None:
> -    vis = QAPISchemaGenCommandVisitor(prefix)
> +                 prefix: str,
> +                 add_trace_events: bool) -> None:
> +    vis = QAPISchemaGenCommandVisitor(prefix, add_trace_events)
>      schema.visit(vis)
>      vis.write(output_dir)
> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
> index f2ea6e0ce4..2e61409f04 100644
> --- a/scripts/qapi/main.py
> +++ b/scripts/qapi/main.py
> @@ -49,7 +49,7 @@ def generate(schema_file: str,
>      schema = QAPISchema(schema_file)
>      gen_types(schema, output_dir, prefix, builtins)
>      gen_visit(schema, output_dir, prefix, builtins)
> -    gen_commands(schema, output_dir, prefix)
> +    gen_commands(schema, output_dir, prefix, False)
>      gen_events(schema, output_dir, prefix)
>      gen_introspect(schema, output_dir, prefix, unmask)

Missing:

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index a3b5473089..feafed79b5 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1690,8 +1690,8 @@ Example::
         }
 
         retval = qmp_my_command(arg.arg1, &err);
-        error_propagate(errp, err);
         if (err) {
+            error_propagate(errp, err);
             goto out;
         }
 


