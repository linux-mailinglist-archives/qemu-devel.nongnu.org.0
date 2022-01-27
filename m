Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0A049E4B9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:36:27 +0100 (CET)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5sv-0003sQ-PH
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:36:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5f6-00071E-Sz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5f4-0003Nn-Vu
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YsJT5MTHf2Cezs4F6cTQHCH9i3TE+9e/7vwcK3wos4g=;
 b=evXsqmORNj/NDdCdm3dgrKFVQXlxxLPEtdfnbg0KhCJw/JJQriS9KQdMeF369dv6MuzNRB
 u7wD8fGTSwCsvgRkfL/2Xw1xqfFe4PVu/5ZVYrP6/shb7CEir3O9zVn9K67Kh76aW8/hgG
 TEavkthrLj3x6ytuJMD8wJNeZqpkCv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-sSHKR_iHP52upZ-kjiWV-A-1; Thu, 27 Jan 2022 09:22:05 -0500
X-MC-Unique: sSHKR_iHP52upZ-kjiWV-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 522D31091DA4;
 Thu, 27 Jan 2022 14:22:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED23C7D735;
 Thu, 27 Jan 2022 14:22:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A780B1138222; Thu, 27 Jan 2022 15:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 4/8] qapi/commands: Optionally generate trace for QMP
 commands
Date: Thu, 27 Jan 2022 15:21:58 +0100
Message-Id: <20220127142202.236638-5-armbru@redhat.com>
In-Reply-To: <20220127142202.236638-1-armbru@redhat.com>
References: <20220127142202.236638-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add trace generation disabled by default and new option --gen-trace to
enable it.  The next commit will enable it for qapi/, but not for qga/
and tests/.  Making it work for the latter two would involve some Meson
hackery to ensure we generate the trace-events files before trace-tool
uses them.  Since we don't actually support tracing there, we'll bypass
that problem.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220126161130.3240892-4-vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Superfluous #include dropped]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/commands.py | 90 +++++++++++++++++++++++++++++++++++-----
 scripts/qapi/main.py     | 14 +++++--
 2 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 17e5ed2414..869d799ed2 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -53,7 +53,8 @@ def gen_command_decl(name: str,
 def gen_call(name: str,
              arg_type: Optional[QAPISchemaObjectType],
              boxed: bool,
-             ret_type: Optional[QAPISchemaType]) -> str:
+             ret_type: Optional[QAPISchemaType],
+             gen_tracing: bool) -> str:
     ret = ''
 
     argstr = ''
@@ -71,14 +72,37 @@ def gen_call(name: str,
     if ret_type:
         lhs = 'retval = '
 
-    ret = mcgen('''
+    name = c_name(name)
+    upper = name.upper()
 
-    %(lhs)sqmp_%(c_name)s(%(args)s&err);
+    if gen_tracing:
+        ret += mcgen('''
+
+    if (trace_event_get_state_backends(TRACE_QMP_ENTER_%(upper)s)) {
+        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
+
+        trace_qmp_enter_%(name)s(req_json->str);
+    }
+    ''',
+                     upper=upper, name=name)
+
+    ret += mcgen('''
+
+    %(lhs)sqmp_%(name)s(%(args)s&err);
 ''',
-                c_name=c_name(name), args=argstr, lhs=lhs)
+                 name=name, args=argstr, lhs=lhs)
 
     ret += mcgen('''
     if (err) {
+''')
+
+    if gen_tracing:
+        ret += mcgen('''
+        trace_qmp_exit_%(name)s(error_get_pretty(err), false);
+''',
+                     name=name)
+
+    ret += mcgen('''
         error_propagate(errp, err);
         goto out;
     }
@@ -90,6 +114,25 @@ def gen_call(name: str,
     qmp_marshal_output_%(c_name)s(retval, ret, errp);
 ''',
                      c_name=ret_type.c_name())
+
+    if gen_tracing:
+        if ret_type:
+            ret += mcgen('''
+
+    if (trace_event_get_state_backends(TRACE_QMP_EXIT_%(upper)s)) {
+        g_autoptr(GString) ret_json = qobject_to_json(*ret);
+
+        trace_qmp_exit_%(name)s(ret_json->str, true);
+    }
+    ''',
+                         upper=upper, name=name)
+        else:
+            ret += mcgen('''
+
+    trace_qmp_exit_%(name)s("{}", true);
+    ''',
+                         name=name)
+
     return ret
 
 
@@ -126,10 +169,19 @@ def gen_marshal_decl(name: str) -> str:
                  proto=build_marshal_proto(name))
 
 
+def gen_trace(name: str) -> str:
+    return mcgen('''
+qmp_enter_%(name)s(const char *json) "%%s"
+qmp_exit_%(name)s(const char *result, bool succeeded) "%%s %%d"
+''',
+                 name=c_name(name))
+
+
 def gen_marshal(name: str,
                 arg_type: Optional[QAPISchemaObjectType],
                 boxed: bool,
-                ret_type: Optional[QAPISchemaType]) -> str:
+                ret_type: Optional[QAPISchemaType],
+                gen_tracing: bool) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
     if have_args:
         assert arg_type is not None
@@ -184,7 +236,7 @@ def gen_marshal(name: str,
     }
 ''')
 
-    ret += gen_call(name, arg_type, boxed, ret_type)
+    ret += gen_call(name, arg_type, boxed, ret_type, gen_tracing)
 
     ret += mcgen('''
 
@@ -242,11 +294,13 @@ def gen_register_command(name: str,
 
 
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
-    def __init__(self, prefix: str):
+    def __init__(self, prefix: str, gen_tracing: bool):
         super().__init__(
             prefix, 'qapi-commands',
-            ' * Schema-defined QAPI/QMP commands', None, __doc__)
+            ' * Schema-defined QAPI/QMP commands', None, __doc__,
+            gen_tracing=gen_tracing)
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
+        self._gen_tracing = gen_tracing
 
     def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
@@ -265,6 +319,16 @@ def _begin_user_module(self, name: str) -> None:
 
 ''',
                              commands=commands, visit=visit))
+
+        if self._gen_tracing and commands != 'qapi-commands':
+            self._genc.add(mcgen('''
+#include "qapi/qmp/qjson.h"
+#include "trace/trace-%(nm)s_trace_events.h"
+''',
+                                 nm=c_name(commands, protect=False)))
+            # We use c_name(commands, protect=False) to turn '-' into '_', to
+            # match .underscorify() in trace/meson.build
+
         self._genh.add(mcgen('''
 #include "%(types)s.h"
 
@@ -326,7 +390,10 @@ def visit_command(self,
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
             self._genh.add(gen_marshal_decl(name))
-            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
+            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
+                                       self._gen_tracing))
+            if self._gen_tracing:
+                self._gen_trace_events.add(gen_trace(name))
         with self._temp_module('./init'):
             with ifcontext(ifcond, self._genh, self._genc):
                 self._genc.add(gen_register_command(
@@ -336,7 +403,8 @@ def visit_command(self,
 
 def gen_commands(schema: QAPISchema,
                  output_dir: str,
-                 prefix: str) -> None:
-    vis = QAPISchemaGenCommandVisitor(prefix)
+                 prefix: str,
+                 gen_tracing: bool) -> None:
+    vis = QAPISchemaGenCommandVisitor(prefix, gen_tracing)
     schema.visit(vis)
     vis.write(output_dir)
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index f2ea6e0ce4..687d408aba 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -32,7 +32,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             gen_tracing: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -49,7 +50,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
+    gen_commands(schema, output_dir, prefix, gen_tracing)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
@@ -74,6 +75,12 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+
+    # Option --gen-trace exists so we can avoid solving build system
+    # problems.  TODO Drop it when we no longer need it.
+    parser.add_argument('--gen-trace', action='store_true',
+                        help="add trace events to qmp marshals")
+
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +95,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 gen_tracing=args.gen_trace)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
-- 
2.31.1


