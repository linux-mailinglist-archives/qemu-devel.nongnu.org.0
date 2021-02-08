Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C148531408F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:34:06 +0100 (CET)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DET-00071T-SV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974K-0005Yl-8w
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9742-0001cl-HM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1i+h7+iueBrI5W5I2eFfcNNG5niua3bgXx6OuZp6Y/0=;
 b=HkSwQM3aH6Hu3swbiDJuMf4NuQQg8Y2KJf9+16SF+qceKeaJ0Y4djmimmHoJz1lDRufyw6
 qgCpLCW8ZxGUxQMLu2KopVWfFXsoXEFcaZEKIg80djWgjf7m8pP5A2OxX9dUeHdJX8OUXx
 +viVOXymLPKVmoSJpHGuikLjCjT1+KM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-Gf-R4oXPMH-bN52P6OViNA-1; Mon, 08 Feb 2021 08:58:51 -0500
X-MC-Unique: Gf-R4oXPMH-bN52P6OViNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02EA9180A09B;
 Mon,  8 Feb 2021 13:58:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A294860938;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8202D113275D; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] qapi/commands: Simplify command registry generation
Date: Mon,  8 Feb 2021 14:58:43 +0100
Message-Id: <20210208135846.3707170-14-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPISchemaGenCommandVisitor.visit_command() needs to generate the
marshalling function into the current module, and also generate its
registration into the ./init system module.  The latter is done
somewhat awkwardly: .__init__() creates a QAPIGenCCode that will not
be written out, each .visit_command() adds its registration to it, and
.visit_end() copies its contents into the ./init module it creates.

Instead provide the means to temporarily switch to another module.
Create the ./init module in .visit_begin(), and generate its initial
part.  Add registrations to it in .visit_command().  Finish it in
.visit_end().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-14-jsnow@redhat.com>
---
 scripts/qapi/commands.py | 49 ++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 4911166339..13a9dcaf89 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -23,7 +23,6 @@ from typing import (
 from .common import c_name, mcgen
 from .gen import (
     QAPIGenC,
-    QAPIGenCCode,
     QAPISchemaModularCVisitor,
     build_params,
     ifcontext,
@@ -237,28 +236,11 @@ def gen_register_command(name: str,
     return ret
 
 
-def gen_registry(registry: str, prefix: str) -> str:
-    ret = mcgen('''
-
-void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds)
-{
-    QTAILQ_INIT(cmds);
-
-''',
-                c_prefix=c_name(prefix, protect=False))
-    ret += registry
-    ret += mcgen('''
-}
-''')
-    return ret
-
-
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
     def __init__(self, prefix: str):
         super().__init__(
             prefix, 'qapi-commands',
             ' * Schema-defined QAPI/QMP commands', None, __doc__)
-        self._regy = QAPIGenCCode(None)
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
 
     def _begin_user_module(self, name: str) -> None:
@@ -285,7 +267,7 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
 ''',
                              types=types))
 
-    def visit_end(self) -> None:
+    def visit_begin(self, schema: QAPISchema) -> None:
         self._add_module('./init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
@@ -293,13 +275,24 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
 void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds);
 ''',
                              c_prefix=c_name(self._prefix, protect=False)))
-        self._genc.preamble_add(mcgen('''
+        self._genc.add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-commands.h"
 #include "%(prefix)sqapi-init-commands.h"
+
+void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds)
+{
+    QTAILQ_INIT(cmds);
+
 ''',
-                                      prefix=self._prefix))
-        self._genc.add(gen_registry(self._regy.get_content(), self._prefix))
+                             prefix=self._prefix,
+                             c_prefix=c_name(self._prefix, protect=False)))
+
+    def visit_end(self) -> None:
+        with self._temp_module('./init'):
+            self._genc.add(mcgen('''
+}
+'''))
 
     def visit_command(self,
                       name: str,
@@ -324,15 +317,17 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds);
         if ret_type and ret_type not in self._visited_ret_types[self._genc]:
             self._visited_ret_types[self._genc].add(ret_type)
             with ifcontext(ret_type.ifcond,
-                           self._genh, self._genc, self._regy):
+                           self._genh, self._genc):
                 self._genc.add(gen_marshal_output(ret_type))
-        with ifcontext(ifcond, self._genh, self._genc, self._regy):
+        with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
             self._genh.add(gen_marshal_decl(name))
             self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
-            self._regy.add(gen_register_command(name, success_response,
-                                                allow_oob, allow_preconfig,
-                                                coroutine))
+        with self._temp_module('./init'):
+            with ifcontext(ifcond, self._genh, self._genc):
+                self._genc.add(gen_register_command(name, success_response,
+                                                    allow_oob, allow_preconfig,
+                                                    coroutine))
 
 
 def gen_commands(schema: QAPISchema,
-- 
2.26.2


