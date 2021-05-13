Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B21637F43F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:38:02 +0200 (CEST)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6r3-0005ML-Ck
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gd-0005Im-VA
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:16 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gY-0001Q9-OG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:15 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 93E6421EC3;
 Thu, 13 May 2021 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYt2ioAwjPKTG0t8HzXEn0rQ8QVS2WLAxNP177SPzXc=;
 b=UyJXGClMRjKE0Z9Se5k9COtmD+tDArGZyIn64xgQ3bVfghk7cBON809toGvYvJrsJUn7hX
 Zv3QJWttSPi644rKvCJJruS7gU8+5FoxE257bDMMz6Zx3CrkpvoOs8iFX5klXZ45d4R+DF
 RaH0aXv0ILggiSQVWKN0htJwkcP3xwA=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 8/9] qapi: Introduce 'allow-init-config' option
Date: Thu, 13 May 2021 10:25:48 +0200
Message-Id: <20210513082549.114275-9-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Roth <michael.roth@amd.com>,
 mark.burton@greensocs.com, Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This option will be used to select the commands which are allowed
to execute during the MACHINE_INIT_PHASE_INITIALIZED machine phase.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 docs/sphinx/qapidoc.py      |  2 +-
 include/qapi/qmp/dispatch.h |  1 +
 softmmu/qdev-monitor.c      |  5 +++++
 scripts/qapi/commands.py    | 10 +++++++---
 scripts/qapi/expr.py        |  5 +++--
 scripts/qapi/introspect.py  |  3 ++-
 scripts/qapi/schema.py      | 10 ++++++----
 7 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b7a2d39c10..5432560480 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -332,7 +332,7 @@ def visit_alternate_type(self, name, info, ifcond, features, variants):
 
     def visit_command(self, name, info, ifcond, features, arg_type,
                       ret_type, gen, success_response, boxed, allow_oob,
-                      allow_preconfig, coroutine):
+                      allow_preconfig, coroutine, allow_init_config):
         doc = self._cur_doc
         self._add_doc('Command',
                       self._nodes_for_arguments(doc,
diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 075203dc67..ecdfc9c444 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -27,6 +27,7 @@ typedef enum QmpCommandOptions
     QCO_ALLOW_PRECONFIG       =  (1U << 2),
     QCO_COROUTINE             =  (1U << 3),
     QCO_DEPRECATED            =  (1U << 4),
+    QCO_ALLOW_INIT_CONFIG     =  (1U << 5),
 } QmpCommandOptions;
 
 typedef struct QmpCommand
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 448f9dbb6f..92423f92db 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1004,6 +1004,11 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
             return true;
         }
         break;
+    case MACHINE_INIT_PHASE_INITIALIZED:
+        if (cmd->options & QCO_ALLOW_INIT_CONFIG) {
+            return true;
+        }
+        break;
     case MACHINE_INIT_PHASE_READY:
         /* All commands are available when the machine is ready */
         return true;
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 0e13d51054..cc8fc89384 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -214,7 +214,8 @@ def gen_register_command(name: str,
                          success_response: bool,
                          allow_oob: bool,
                          allow_preconfig: bool,
-                         coroutine: bool) -> str:
+                         coroutine: bool,
+                         allow_init_config: bool) -> str:
     options = []
 
     if 'deprecated' in [f.name for f in features]:
@@ -228,6 +229,8 @@ def gen_register_command(name: str,
         options += ['QCO_ALLOW_PRECONFIG']
     if coroutine:
         options += ['QCO_COROUTINE']
+    if allow_init_config:
+        options += ['QCO_ALLOW_INIT_CONFIG']
 
     if not options:
         options = ['QCO_NO_OPTIONS']
@@ -310,7 +313,8 @@ def visit_command(self,
                       boxed: bool,
                       allow_oob: bool,
                       allow_preconfig: bool,
-                      coroutine: bool) -> None:
+                      coroutine: bool,
+                      allow_init_config: bool) -> None:
         if not gen:
             return
         # FIXME: If T is a user-defined type, the user is responsible
@@ -331,7 +335,7 @@ def visit_command(self,
             with ifcontext(ifcond, self._genh, self._genc):
                 self._genc.add(gen_register_command(
                     name, features, success_response, allow_oob,
-                    allow_preconfig, coroutine))
+                    allow_preconfig, coroutine, allow_init_config))
 
 
 def gen_commands(schema: QAPISchema,
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 540b3982b1..45031c950c 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -107,7 +107,8 @@ def check_flags(expr, info):
         if key in expr and expr[key] is not False:
             raise QAPISemError(
                 info, "flag '%s' may only use false value" % key)
-    for key in ['boxed', 'allow-oob', 'allow-preconfig', 'coroutine']:
+    for key in ['boxed', 'allow-oob', 'allow-preconfig', 'coroutine',
+                'allow-init-config']:
         if key in expr and expr[key] is not True:
             raise QAPISemError(
                 info, "flag '%s' may only use true value" % key)
@@ -378,7 +379,7 @@ def check_exprs(exprs):
                        ['command'],
                        ['data', 'returns', 'boxed', 'if', 'features',
                         'gen', 'success-response', 'allow-oob',
-                        'allow-preconfig', 'coroutine'])
+                        'allow-preconfig', 'coroutine', 'allow-init-config'])
             normalize_members(expr.get('data'))
             check_command(expr, info)
         elif meta == 'event':
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 9a348ca2e5..fccc67c6d4 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -353,7 +353,8 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
                       arg_type: Optional[QAPISchemaObjectType],
                       ret_type: Optional[QAPISchemaType], gen: bool,
                       success_response: bool, boxed: bool, allow_oob: bool,
-                      allow_preconfig: bool, coroutine: bool) -> None:
+                      allow_preconfig: bool, coroutine: bool,
+                      allow_init_config: bool) -> None:
         assert self._schema is not None
 
         arg_type = arg_type or self._schema.the_empty_object_type
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 703b446fd2..135f37d358 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -130,7 +130,7 @@ def visit_alternate_type(self, name, info, ifcond, features, variants):
 
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
-                      allow_oob, allow_preconfig, coroutine):
+                      allow_oob, allow_preconfig, coroutine, allow_init_config):
         pass
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
@@ -746,7 +746,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
     def __init__(self, name, info, doc, ifcond, features,
                  arg_type, ret_type,
                  gen, success_response, boxed, allow_oob, allow_preconfig,
-                 coroutine):
+                 coroutine, allow_init_config):
         super().__init__(name, info, doc, ifcond, features)
         assert not arg_type or isinstance(arg_type, str)
         assert not ret_type or isinstance(ret_type, str)
@@ -760,6 +760,7 @@ def __init__(self, name, info, doc, ifcond, features,
         self.allow_oob = allow_oob
         self.allow_preconfig = allow_preconfig
         self.coroutine = coroutine
+        self.allow_init_config = allow_init_config
 
     def check(self, schema):
         super().check(schema)
@@ -803,7 +804,7 @@ def visit(self, visitor):
             self.name, self.info, self.ifcond, self.features,
             self.arg_type, self.ret_type, self.gen, self.success_response,
             self.boxed, self.allow_oob, self.allow_preconfig,
-            self.coroutine)
+            self.coroutine, self.allow_init_config)
 
 
 class QAPISchemaEvent(QAPISchemaEntity):
@@ -1111,6 +1112,7 @@ def _def_command(self, expr, info, doc):
         allow_oob = expr.get('allow-oob', False)
         allow_preconfig = expr.get('allow-preconfig', False)
         coroutine = expr.get('coroutine', False)
+        allow_init_config = expr.get('allow-init-config', False)
         ifcond = expr.get('if')
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
@@ -1124,7 +1126,7 @@ def _def_command(self, expr, info, doc):
                                            data, rets,
                                            gen, success_response,
                                            boxed, allow_oob, allow_preconfig,
-                                           coroutine))
+                                           coroutine, allow_init_config))
 
     def _def_event(self, expr, info, doc):
         name = expr['event']
-- 
2.25.1


