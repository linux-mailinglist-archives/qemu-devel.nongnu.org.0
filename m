Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA24923C2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:30:16 +0100 (CET)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9lkk-0005nZ-Gq
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:30:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9liJ-000548-PR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:27:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9liG-0007qo-4A
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642501658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3UTIeClrknYFqyFjkJbPIaXOtIL8b3WPwmc79QmGkIQ=;
 b=ZZ5QdiqF6F2PfjBTq4lZUudpvINQ5VG9Gk8Kb7/WSldW9YpZMh8Qvg1c9NHMpNp6ngByQN
 79uRho/GViBb5WgHOKX4FyvM3eu5Ez6dw19b+ZUWvMyixv4/uQ3kjp///zn9Xbqv7RkRna
 adBtuKMiUKrmnYqvJI9UfAbiIlYYfDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-33uLk5VjMpa7xweE1UAfrw-1; Tue, 18 Jan 2022 05:27:37 -0500
X-MC-Unique: 33uLk5VjMpa7xweE1UAfrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E7284E0AB;
 Tue, 18 Jan 2022 10:27:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65AE01059179;
 Tue, 18 Jan 2022 10:27:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB2EE11380A2; Tue, 18 Jan 2022 11:27:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 2/3] scripts/qapi-gen.py: add --add-trace-events option
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-3-vsementsov@virtuozzo.com>
Date: Tue, 18 Jan 2022 11:27:20 +0100
In-Reply-To: <20220117201845.2438382-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 17 Jan 2022 21:18:44 +0100")
Message-ID: <877daxpcdz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

> Add and option to generate trace events. We should generate both trace
> events and trace-events files for further trace events code generation.

Can you explain why we want trace generation to be optional?

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/commands.py | 91 ++++++++++++++++++++++++++++++++++------
>  scripts/qapi/main.py     | 10 +++--
>  2 files changed, 85 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 21001bbd6b..8cd1aa41ce 100644
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
> @@ -71,21 +72,65 @@ def gen_call(name: str,
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

Humor me: blank line between declarations and statements, please.

> +        trace_qmp_enter_%(name)s(req_json->str);
> +    }
> +    ''',
> +                     upper=upper, name=name)
> +
> +    ret += mcgen('''
> +
> +    %(lhs)sqmp_%(name)s(%(args)s&err);
> +''',
> +                name=name, args=argstr, lhs=lhs)

pycodestyle-3 gripes:

    scripts/qapi/commands.py:92:17: E128 continuation line under-indented for visual indent

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

Humor me: blank line between declarations and statements, please.

> +        trace_qmp_exit_%(name)s(ret_json->str, true);
> +    }
> +    ''',
> +                     upper=upper, name=name)

scripts/qapi/commands.py:126:22: E128 continuation line under-indented for visual indent

> +        else:
> +            ret += mcgen('''
> +
> +    trace_qmp_exit_%(name)s("{}", true);
> +    ''',
> +                         name=name)
> +
>      return ret

The generated code changes like this when trace generation is enabled
(next patch):

    @@ -52,14 +55,25 @@ void qmp_marshal_query_acpi_ospm_status(
             goto out;
         }

    +    if (trace_event_get_state_backends(TRACE_QMP_ENTER_QUERY_ACPI_OSPM_STATUS)) {
    +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
    +        trace_qmp_enter_query_acpi_ospm_status(req_json->str);
    +    }
    +    
         retval = qmp_query_acpi_ospm_status(&err);
         if (err) {
    +        trace_qmp_exit_query_acpi_ospm_status(error_get_pretty(err), false);
             error_propagate(errp, err);
             goto out;
         }

         qmp_marshal_output_ACPIOSTInfoList(retval, ret, errp);

    +    if (trace_event_get_state_backends(TRACE_QMP_EXIT_QUERY_ACPI_OSPM_STATUS)) {
    +        g_autoptr(GString) ret_json = qobject_to_json(*ret);
    +        trace_qmp_exit_query_acpi_ospm_status(ret_json->str, true);
    +    }
    +    
     out:
         visit_free(v);
         v = qapi_dealloc_visitor_new();

The trace_qmp_enter_query_acpi_ospm_status() and the second
trace_qmp_exit_query_acpi_ospm_status() is guarded by
trace_event_get_state_backends(), the first is not.  Intentional?

Have you considered something like

    @@ -52,14 +55,25 @@ void qmp_marshal_query_acpi_ospm_status(
             goto out;
         }

    +    if (trace_event_get_state_backends(TRACE_QMP_ENTER_QUERY_ACPI_OSPM_STATUS)) {
    +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
    +        trace_qmp_enter_query_acpi_ospm_status(req_json->str);
    +    }
    +    
         retval = qmp_query_acpi_ospm_status(&err);
         if (err) {
             error_propagate(errp, err);
             goto out;
         }

         qmp_marshal_output_ACPIOSTInfoList(retval, ret, errp);

     out:
    +    if (trace_event_get_state_backends(TRACE_QMP_EXIT_QUERY_ACPI_OSPM_STATUS)) {
    +        g_autoptr(GString) result_json
    +            = qobject_to_json(err ? error_get_pretty(err) : *ret);
    +
    +        trace_qmp_exit_query_acpi_ospm_status(ret_json->str, !err);
    +    }
    +    
         visit_free(v);
         v = qapi_dealloc_visitor_new();

>  
>  
> @@ -122,10 +167,17 @@ def gen_marshal_decl(name: str) -> str:
>                   proto=build_marshal_proto(name))
>  
>  
> +def gen_trace(name: str) -> str:
> +    name = c_name(name)
> +    return f"""\
> +qmp_enter_{name}(const char *json) "%s"\n
> +qmp_exit_{name}(const char *result, bool succeeded) "%s %d"\n"""

Why not mcgen()?

The generated FOO.trace-events look like this:

    $ cat bld-clang/qapi/qapi-commands-control.trace-events
    qmp_enter_qmp_capabilities(const char *json) "%s"

    qmp_exit_qmp_capabilities(const char *result, bool succeeded) "%s %d"
    qmp_enter_query_version(const char *json) "%s"

    qmp_exit_query_version(const char *result, bool succeeded) "%s %d"
    qmp_enter_query_commands(const char *json) "%s"

    qmp_exit_query_commands(const char *result, bool succeeded) "%s %d"
    qmp_enter_quit(const char *json) "%s"

    qmp_exit_quit(const char *result, bool succeeded) "%s %d"

Either drop the blank lines, or put them between the pairs instead of
within.  I'd do the former.

We generate lots of empty FOO.trace-events.  I guess that's okay.

> +

scripts/qapi/commands.py:176:1: E302 expected 2 blank lines, found 1

>  def gen_marshal(name: str,
>                  arg_type: Optional[QAPISchemaObjectType],
>                  boxed: bool,
> -                ret_type: Optional[QAPISchemaType]) -> str:
> +                ret_type: Optional[QAPISchemaType],
> +                add_trace_events: bool) -> str:
>      have_args = boxed or (arg_type and not arg_type.is_empty())
>      if have_args:
>          assert arg_type is not None
> @@ -180,7 +232,7 @@ def gen_marshal(name: str,
>      }
>  ''')
>  
> -    ret += gen_call(name, arg_type, boxed, ret_type)
> +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_events)
>  
>      ret += mcgen('''
>  
> @@ -238,11 +290,12 @@ def gen_register_command(name: str,
>  
>  
>  class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
> -    def __init__(self, prefix: str):
> +    def __init__(self, prefix: str, add_trace_events: bool):
>          super().__init__(
>              prefix, 'qapi-commands',
>              ' * Schema-defined QAPI/QMP commands', None, __doc__)
>          self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
> +        self.add_trace_events = add_trace_events
>  
>      def _begin_user_module(self, name: str) -> None:
>          self._visited_ret_types[self._genc] = set()
> @@ -261,6 +314,15 @@ def _begin_user_module(self, name: str) -> None:
>  
>  ''',
>                               commands=commands, visit=visit))
> +
> +        if self.add_trace_events and c_name(commands) != 'qapi_commands':
> +            self._genc.add(mcgen('''
> +#include "trace/trace-qapi.h"
> +#include "qapi/qmp/qjson.h"
> +#include "trace/trace-%(nm)s_trace_events.h"
> +''',
> +                                 nm=c_name(commands)))

Why c_name(commands), and not just commands?

> +
>          self._genh.add(mcgen('''
>  #include "%(types)s.h"
>  
> @@ -322,7 +384,9 @@ def visit_command(self,
>          with ifcontext(ifcond, self._genh, self._genc):
>              self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
>              self._genh.add(gen_marshal_decl(name))
> -            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
> +            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
> +                                       self.add_trace_events))
> +            self._gent.add(gen_trace(name))
>          with self._temp_module('./init'):
>              with ifcontext(ifcond, self._genh, self._genc):
>                  self._genc.add(gen_register_command(
> @@ -332,7 +396,8 @@ def visit_command(self,
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
> index f2ea6e0ce4..7fab71401c 100644
> --- a/scripts/qapi/main.py
> +++ b/scripts/qapi/main.py
> @@ -32,7 +32,8 @@ def generate(schema_file: str,
>               output_dir: str,
>               prefix: str,
>               unmask: bool = False,
> -             builtins: bool = False) -> None:
> +             builtins: bool = False,
> +             add_trace_events: bool = False) -> None:
>      """
>      Generate C code for the given schema into the target directory.
>  
> @@ -49,7 +50,7 @@ def generate(schema_file: str,
>      schema = QAPISchema(schema_file)
>      gen_types(schema, output_dir, prefix, builtins)
>      gen_visit(schema, output_dir, prefix, builtins)
> -    gen_commands(schema, output_dir, prefix)
> +    gen_commands(schema, output_dir, prefix, add_trace_events)
>      gen_events(schema, output_dir, prefix)
>      gen_introspect(schema, output_dir, prefix, unmask)
>  
> @@ -74,6 +75,8 @@ def main() -> int:
>      parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
>                          dest='unmask',
>                          help="expose non-ABI names in introspection")
> +    parser.add_argument('--add-trace-events', action='store_true',
> +                        help="add trace events to qmp marshals")
>      parser.add_argument('schema', action='store')
>      args = parser.parse_args()
>  
> @@ -88,7 +91,8 @@ def main() -> int:
>                   output_dir=args.output_dir,
>                   prefix=args.prefix,
>                   unmask=args.unmask,
> -                 builtins=args.builtins)
> +                 builtins=args.builtins,
> +                 add_trace_events=args.add_trace_events)
>      except QAPIError as err:
>          print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
>          return 1

Missing: documentation for the tracing feature in
docs/devel/qapi-code-gen.rst.  We can talk about the level of detail
last.

Also missing is the example update:

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
 


