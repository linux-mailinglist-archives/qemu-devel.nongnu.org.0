Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A00269B3A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 21:13:06 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn6PI-0004q4-TR
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 15:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6Op-00038F-Bf
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6Om-0003iM-Sd
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hn6Om-0003hy-KF
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2D4883F51;
 Mon, 15 Jul 2019 19:12:30 +0000 (UTC)
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7475819C68;
 Mon, 15 Jul 2019 19:12:28 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:09:54 +0400
Message-Id: <20190715191001.1188-14-marcandre.lureau@redhat.com>
In-Reply-To: <20190715191001.1188-1-marcandre.lureau@redhat.com>
References: <20190715191001.1188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 15 Jul 2019 19:12:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 13/20] scripts: learn 'async' qapi commands
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commands with the 'async' key will be registered as async type (see
related commit), and will allow a synchronous (in scope callback) or
asynchronous return (out-of-scope when ready, in idle etc) by keeping
the given QmpReturn and calling qmp_return function later.

Ex:
  { 'command': 'foo-async,
    'data': {'arg': 'str'},
    'returns': 'Foo',
    'async': true }

generates the following marshaller:

void qmp_marshal_foo_async(QDict *args, QmpReturn *qret)
{
    Error *err =3D NULL;
    Visitor *v;
    q_obj_foo_async_arg arg =3D {0};

    v =3D qmp_input_visitor_new(QOBJECT(args), true);
    visit_start_struct(v, NULL, NULL, 0, &err);
    if (err) {
        goto out;
    }
    visit_type_q_obj_foo_async_arg_members(v, &arg, &err);
    if (!err) {
        visit_check_struct(v, &err);
    }
    visit_end_struct(v, NULL);
    if (err) {
        goto out;
    }

    qmp_foo_async(arg.arg, qret);

out:
    if (err) {
        qmp_return_error(qret, err);
    }
    visit_free(v);
    v =3D qapi_dealloc_visitor_new();
    visit_start_struct(v, NULL, NULL, 0, NULL);
    visit_type_q_obj_foo_async_arg_members(v, &arg, NULL);
    visit_end_struct(v, NULL);
    visit_free(v);
}

and a return helper:

void qmp_foo_async_return(QmpReturn *qret, Foo *ret_in)
{
    Error *err =3D NULL;
    QObject *ret_out =3D NULL;

    qmp_marshal_output_Foo(ret_in, &ret_out, &err);

    if (err) {
        qmp_return_error(qret, err);
    } else {
        qmp_return(qret, ret_out);
    }
}

The dispatched function may call the return helper within the calling
scope or delay the return. To return an error, it can call
qmp_return_error() directly instead.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/commands.py                | 151 ++++++++++++++++++++----
 scripts/qapi/common.py                  |  15 ++-
 scripts/qapi/doc.py                     |   3 +-
 scripts/qapi/introspect.py              |   3 +-
 tests/qapi-schema/qapi-schema-test.json |   5 +
 tests/qapi-schema/qapi-schema-test.out  |   8 ++
 tests/qapi-schema/test-qapi.py          |   8 +-
 tests/test-qmp-cmds.c                   |  60 ++++++++++
 8 files changed, 218 insertions(+), 35 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index b929e07be4..4c200c04ca 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -16,18 +16,36 @@ See the COPYING file in the top-level directory.
 from qapi.common import *
=20
=20
-def gen_command_decl(name, arg_type, boxed, ret_type):
-    return mcgen('''
-%(c_type)s qmp_%(c_name)s(%(params)s);
+def gen_command_decl(name, arg_type, boxed, ret_type, success_response, =
asyn):
+    if asyn:
+        extra =3D "QmpReturn *qret"
+    else:
+        extra =3D 'Error **errp'
+
+    if asyn:
+        ret =3D mcgen('''
+void qmp_%(name)s(%(params)s);
 ''',
-                 c_type=3D(ret_type and ret_type.c_type()) or 'void',
-                 c_name=3Dc_name(name),
-                 params=3Dbuild_params(arg_type, boxed, 'Error **errp'))
+                     name=3Dc_name(name),
+                     params=3Dbuild_params(arg_type, boxed, extra))
+        if success_response:
+            ret +=3D mcgen('''
+void qmp_%(name)s_return(QmpReturn *qret%(c_type)s);
+''',
+                        c_type=3D(", " + ret_type.c_type() if ret_type e=
lse ""),
+                        name=3Dc_name(name))
=20
+        return ret
+    else:
+        return mcgen('''
+%(c_type)s qmp_%(c_name)s(%(params)s);
+''',
+                     c_type=3D(ret_type and ret_type.c_type()) or 'void'=
,
+                     c_name=3Dc_name(name),
+                     params=3Dbuild_params(arg_type, boxed, extra))
=20
-def gen_call(name, arg_type, boxed, ret_type):
-    ret =3D ''
=20
+def gen_argstr(arg_type, boxed):
     argstr =3D ''
     if boxed:
         assert arg_type and not arg_type.is_empty()
@@ -39,6 +57,13 @@ def gen_call(name, arg_type, boxed, ret_type):
                 argstr +=3D 'arg.has_%s, ' % c_name(memb.name)
             argstr +=3D 'arg.%s, ' % c_name(memb.name)
=20
+    return argstr
+
+
+def gen_call(name, arg_type, boxed, ret_type):
+    ret =3D ''
+
+    argstr =3D gen_argstr(arg_type, boxed)
     lhs =3D ''
     if ret_type:
         lhs =3D 'retval =3D '
@@ -60,6 +85,50 @@ def gen_call(name, arg_type, boxed, ret_type):
     return ret
=20
=20
+def gen_async_call(name, arg_type, boxed):
+    argstr =3D gen_argstr(arg_type, boxed)
+
+    push_indent()
+    ret =3D mcgen('''
+
+qmp_%(c_name)s(%(args)sqret);
+''',
+                c_name=3Dc_name(name), args=3Dargstr)
+
+    pop_indent()
+    return ret
+
+
+def gen_async_return(name, ret_type):
+    if ret_type:
+        return mcgen('''
+
+void qmp_%(c_name)s_return(QmpReturn *qret, %(ret_type)s ret_in)
+{
+    Error *err =3D NULL;
+    QObject *ret_out =3D NULL;
+
+    qmp_marshal_output_%(ret_c_name)s(ret_in, &ret_out, &err);
+
+    if (err) {
+        qmp_return_error(qret, err);
+    } else {
+        qmp_return(qret, ret_out);
+    }
+}
+''',
+                     c_name=3Dc_name(name),
+                     ret_type=3Dret_type.c_type(), ret_c_name=3Dret_type=
.c_name())
+    else:
+        return mcgen('''
+
+void qmp_%(c_name)s_return(QmpReturn *qret)
+{
+    qmp_return(qret, QOBJECT(qdict_new()));
+}
+''',
+                     c_name=3Dc_name(name))
+
 def gen_marshal_output(ret_type):
     return mcgen('''
=20
@@ -83,19 +152,22 @@ static void qmp_marshal_output_%(c_name)s(%(c_type)s=
 ret_in, QObject **ret_out,
                  c_type=3Dret_type.c_type(), c_name=3Dret_type.c_name())
=20
=20
-def build_marshal_proto(name):
-    return ('void qmp_marshal_%s(QDict *args, QObject **ret, Error **err=
p)'
-            % c_name(name))
+def build_marshal_proto(name, asyn):
+    if asyn:
+        tmpl =3D 'void qmp_marshal_%s(QDict *args, QmpReturn *qret)'
+    else:
+        tmpl =3D 'void qmp_marshal_%s(QDict *args, QObject **ret, Error =
**errp)'
+    return tmpl % c_name(name)
=20
=20
-def gen_marshal_decl(name):
+def gen_marshal_decl(name, asyn):
     return mcgen('''
 %(proto)s;
 ''',
-                 proto=3Dbuild_marshal_proto(name))
+                 proto=3Dbuild_marshal_proto(name, asyn))
=20
=20
-def gen_marshal(name, arg_type, boxed, ret_type):
+def gen_marshal(name, arg_type, boxed, ret_type, asyn):
     have_args =3D arg_type and not arg_type.is_empty()
=20
     ret =3D mcgen('''
@@ -104,9 +176,9 @@ def gen_marshal(name, arg_type, boxed, ret_type):
 {
     Error *err =3D NULL;
 ''',
-                proto=3Dbuild_marshal_proto(name))
+                proto=3Dbuild_marshal_proto(name, asyn))
=20
-    if ret_type:
+    if ret_type and not asyn:
         ret +=3D mcgen('''
     %(c_type)s retval;
 ''',
@@ -153,12 +225,28 @@ def gen_marshal(name, arg_type, boxed, ret_type):
     }
 ''')
=20
-    ret +=3D gen_call(name, arg_type, boxed, ret_type)
+    if asyn:
+        ret +=3D gen_async_call(name, arg_type, boxed)
+    else:
+        ret +=3D gen_call(name, arg_type, boxed, ret_type)
=20
     ret +=3D mcgen('''
=20
 out:
+''')
+
+    if asyn:
+        ret +=3D mcgen('''
+    if (err) {
+        qmp_return_error(qret, err);
+    }
+''')
+    else:
+        ret +=3D mcgen('''
     error_propagate(errp, err);
+''')
+
+    ret +=3D mcgen('''
     visit_free(v);
 ''')
=20
@@ -193,7 +281,8 @@ out:
     return ret
=20
=20
-def gen_register_command(name, success_response, allow_oob, allow_precon=
fig):
+def gen_register_command(name, success_response, allow_oob, allow_precon=
fig,
+                         asyn):
     options =3D []
=20
     if not success_response:
@@ -202,17 +291,24 @@ def gen_register_command(name, success_response, al=
low_oob, allow_preconfig):
         options +=3D ['QCO_ALLOW_OOB']
     if allow_preconfig:
         options +=3D ['QCO_ALLOW_PRECONFIG']
+    if asyn:
+        options +=3D ['QCO_ASYNC']
=20
     if not options:
         options =3D ['QCO_NO_OPTIONS']
=20
     options =3D " | ".join(options)
=20
+    if asyn:
+        regfn =3D 'qmp_register_async_command'
+    else:
+        regfn =3D 'qmp_register_command'
+
     ret =3D mcgen('''
-    qmp_register_command(cmds, "%(name)s",
+    %(regfn)s(cmds, "%(name)s",
                          qmp_marshal_%(c_name)s, %(opts)s);
 ''',
-                name=3Dname, c_name=3Dc_name(name),
+                regfn=3Dregfn, name=3Dname, c_name=3Dc_name(name),
                 opts=3Doptions)
     return ret
=20
@@ -276,7 +372,8 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmd=
s);
         genc.add(gen_registry(self._regy.get_content(), self._prefix))
=20
     def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
-                      success_response, boxed, allow_oob, allow_preconfi=
g):
+                      success_response, boxed, allow_oob, allow_preconfi=
g,
+                      asyn):
         if not gen:
             return
         # FIXME: If T is a user-defined type, the user is responsible
@@ -290,11 +387,15 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *c=
mds);
                            self._genh, self._genc, self._regy):
                 self._genc.add(gen_marshal_output(ret_type))
         with ifcontext(ifcond, self._genh, self._genc, self._regy):
-            self._genh.add(gen_command_decl(name, arg_type, boxed, ret_t=
ype))
-            self._genh.add(gen_marshal_decl(name))
-            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
+            self._genh.add(gen_command_decl(name, arg_type, boxed, ret_t=
ype,
+                                            success_response, asyn))
+            self._genh.add(gen_marshal_decl(name, asyn))
+            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type, =
asyn))
+            if asyn and success_response:
+                self._genc.add(gen_async_return(name, ret_type))
             self._regy.add(gen_register_command(name, success_response,
-                                                allow_oob, allow_preconf=
ig))
+                                                allow_oob, allow_preconf=
ig,
+                                                asyn))
=20
=20
 def gen_commands(schema, output_dir, prefix):
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index d61bfdc526..1f698e91d1 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1138,7 +1138,7 @@ def check_exprs(exprs):
             meta =3D 'command'
             check_keys(expr_elem, 'command', [],
                        ['data', 'returns', 'gen', 'success-response',
-                        'boxed', 'allow-oob', 'allow-preconfig', 'if'])
+                        'boxed', 'allow-oob', 'allow-preconfig', 'if', '=
async'])
             normalize_members(expr.get('data'))
         elif 'event' in expr:
             meta =3D 'event'
@@ -1283,7 +1283,8 @@ class QAPISchemaVisitor(object):
         pass
=20
     def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
-                      success_response, boxed, allow_oob, allow_preconfi=
g):
+                      success_response, boxed, allow_oob, allow_preconfi=
g,
+                      asyn):
         pass
=20
     def visit_event(self, name, info, ifcond, arg_type, boxed):
@@ -1697,7 +1698,8 @@ class QAPISchemaAlternateType(QAPISchemaType):
=20
 class QAPISchemaCommand(QAPISchemaEntity):
     def __init__(self, name, info, doc, ifcond, arg_type, ret_type,
-                 gen, success_response, boxed, allow_oob, allow_preconfi=
g):
+                 gen, success_response, boxed, allow_oob, allow_preconfi=
g,
+                 asyn):
         QAPISchemaEntity.__init__(self, name, info, doc, ifcond)
         assert not arg_type or isinstance(arg_type, str)
         assert not ret_type or isinstance(ret_type, str)
@@ -1710,6 +1712,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
         self.boxed =3D boxed
         self.allow_oob =3D allow_oob
         self.allow_preconfig =3D allow_preconfig
+        self.asyn =3D asyn
=20
     def check(self, schema):
         QAPISchemaEntity.check(self, schema)
@@ -1736,7 +1739,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
                               self.arg_type, self.ret_type,
                               self.gen, self.success_response,
                               self.boxed, self.allow_oob,
-                              self.allow_preconfig)
+                              self.allow_preconfig, self.asyn)
=20
=20
 class QAPISchemaEvent(QAPISchemaEntity):
@@ -1989,6 +1992,7 @@ class QAPISchema(object):
         allow_oob =3D expr.get('allow-oob', False)
         allow_preconfig =3D expr.get('allow-preconfig', False)
         ifcond =3D expr.get('if')
+        asyn =3D expr.get('async', False)
         if isinstance(data, OrderedDict):
             data =3D self._make_implicit_object_type(
                 name, info, doc, ifcond, 'arg', self._make_members(data,=
 info))
@@ -1997,7 +2001,8 @@ class QAPISchema(object):
             rets =3D self._make_array_type(rets[0], info)
         self._def_entity(QAPISchemaCommand(name, info, doc, ifcond, data=
, rets,
                                            gen, success_response,
-                                           boxed, allow_oob, allow_preco=
nfig))
+                                           boxed, allow_oob, allow_preco=
nfig,
+                                           asyn))
=20
     def _def_event(self, expr, info, doc):
         name =3D expr['event']
diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
index 5fc0fc7e06..6fe280448a 100755
--- a/scripts/qapi/doc.py
+++ b/scripts/qapi/doc.py
@@ -249,7 +249,8 @@ class QAPISchemaGenDocVisitor(qapi.common.QAPISchemaV=
isitor):
                                body=3Dtexi_entity(doc, 'Members', ifcond=
)))
=20
     def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
-                      success_response, boxed, allow_oob, allow_preconfi=
g):
+                      success_response, boxed, allow_oob, allow_preconfi=
g,
+                      asyn):
         doc =3D self.cur_doc
         if boxed:
             body =3D texi_body(doc)
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index f62cf0a2e1..e618e36d38 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -206,7 +206,8 @@ const QLitObject %(c_name)s =3D %(c_string)s;
                            for m in variants.variants]}, ifcond)
=20
     def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
-                      success_response, boxed, allow_oob, allow_preconfi=
g):
+                      success_response, boxed, allow_oob, allow_preconfi=
g,
+                      asyn):
         arg_type =3D arg_type or self._schema.the_empty_object_type
         ret_type =3D ret_type or self._schema.the_empty_object_type
         obj =3D {'arg-type': self._use_type(arg_type),
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
index c6d59acc3e..593eefa10b 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -143,6 +143,11 @@
=20
 { 'command': 'cmd-success-response', 'data': {}, 'success-response': fal=
se }
=20
+{ 'command': 'cmd-async', 'data': {'filename': 'str'},
+  'returns': 'Empty2', 'async': true }
+{ 'command': 'cmd-success-response-async', 'data': {'filename': 'str'},
+  'async': true, 'success-response': false}
+
 # Returning a non-dictionary requires a name from the whitelist
 { 'command': 'guest-get-time', 'data': {'a': 'int', '*b': 'int' },
   'returns': 'int' }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
index 85d510bc00..75aee842b9 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -208,6 +208,14 @@ command user_def_cmd2 q_obj_user_def_cmd2-arg -> Use=
rDefTwo
    gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconfi=
g=3DFalse
 command cmd-success-response None -> None
    gen=3DTrue success_response=3DFalse boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
+object q_obj_cmd-async-arg
+    member filename: str optional=3DFalse
+command cmd-async q_obj_cmd-async-arg -> Empty2
+   gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconfi=
g=3DFalse async=3DTrue
+object q_obj_cmd-success-response-async-arg
+    member filename: str optional=3DFalse
+command cmd-success-response-async q_obj_cmd-success-response-async-arg =
-> None
+   gen=3DTrue success_response=3DFalse boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse async=3DTrue
 object q_obj_guest-get-time-arg
     member a: int optional=3DFalse
     member b: int optional=3DTrue
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
index b0f770b9bd..c88cc91763 100644
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -60,12 +60,14 @@ class QAPISchemaTestVisitor(QAPISchemaVisitor):
         self._print_if(ifcond)
=20
     def visit_command(self, name, info, ifcond, arg_type, ret_type, gen,
-                      success_response, boxed, allow_oob, allow_preconfi=
g):
+                      success_response, boxed, allow_oob, allow_preconfi=
g,
+                      asyn):
         print('command %s %s -> %s'
               % (name, arg_type and arg_type.name,
                  ret_type and ret_type.name))
-        print('   gen=3D%s success_response=3D%s boxed=3D%s oob=3D%s pre=
config=3D%s'
-              % (gen, success_response, boxed, allow_oob, allow_preconfi=
g))
+        print('   gen=3D%s success_response=3D%s boxed=3D%s oob=3D%s pre=
config=3D%s%s'
+              % (gen, success_response, boxed, allow_oob, allow_preconfi=
g,
+                 ' async=3DTrue' if asyn else ''))
         self._print_if(ifcond)
=20
     def visit_event(self, name, info, ifcond, arg_type, boxed):
diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
index ece8726e96..f567ac2fb0 100644
--- a/tests/test-qmp-cmds.c
+++ b/tests/test-qmp-cmds.c
@@ -34,6 +34,28 @@ void qmp_cmd_success_response(Error **errp)
 {
 }
=20
+static gboolean cmd_async_idle(gpointer user_data)
+{
+    QmpReturn *qret =3D user_data;
+
+    qmp_cmd_async_return(qret, g_new0(Empty2, 1));
+
+    return G_SOURCE_REMOVE;
+}
+
+void qmp_cmd_async(const char *filename, QmpReturn *qret)
+{
+    g_idle_add(cmd_async_idle, qret);
+}
+
+void qmp_cmd_success_response_async(const char *filename, QmpReturn *qre=
t)
+{
+    Error *err =3D NULL;
+
+    error_setg(&err, "no response, but error ok");
+    qmp_return_error(qret, err);
+}
+
 Empty2 *qmp_user_def_cmd0(Error **errp)
 {
     return g_new0(Empty2, 1);
@@ -366,6 +388,43 @@ static void test_qmp_return_orderly(void)
     qobject_unref(dict);
 }
=20
+typedef struct QmpReturnAsync {
+    QmpSession session;
+    GMainLoop *loop;
+} QmpReturnAsync;
+
+static void dispatch_return_async(QmpSession *session, QDict *resp)
+{
+    QmpReturnAsync *a =3D container_of(session, QmpReturnAsync, session)=
;
+
+    g_main_loop_quit(a->loop);
+    g_main_loop_unref(a->loop);
+    a->loop =3D NULL;
+}
+
+static void test_qmp_return_async(void)
+{
+    QmpReturnAsync a =3D { { 0, } , };
+    QDict *args =3D qdict_new();
+    QDict *req =3D qdict_new();
+
+    a.loop =3D g_main_loop_new(NULL, TRUE);
+    qmp_session_init(&a.session, &qmp_commands,
+                    NULL, dispatch_return_async);
+
+    qdict_put_str(args, "filename", "test-filename");
+    qdict_put_str(req, "execute", "cmd-async");
+    qdict_put(req, "arguments", args);
+    qmp_dispatch(&a.session, QOBJECT(req), false);
+    g_assert(a.loop);
+
+    g_main_loop_run(a.loop);
+    g_assert(!a.loop);
+
+    qmp_session_destroy(&a.session);
+    qobject_unref(req);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -379,6 +438,7 @@ int main(int argc, char **argv)
     g_test_add_func("/qmp/dealloc_types", test_dealloc_types);
     g_test_add_func("/qmp/dealloc_partial", test_dealloc_partial);
     g_test_add_func("/qmp/return_orderly", test_qmp_return_orderly);
+    g_test_add_func("/qmp/return_async", test_qmp_return_async);
=20
     test_qmp_init_marshal(&qmp_commands);
     g_test_run();
--=20
2.22.0.428.g6d5b264208


