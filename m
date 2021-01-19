Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4552FBFD2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:17:46 +0100 (CET)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wVd-0002Cq-4N
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLf-0007pl-3S
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLc-0005Tv-TO
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z3bad5yWvdxkBc5j9NZ8zF1uyAhF+f5gWUrQmcvKlQ=;
 b=GMWODmnJZeW8mgrGgMKEhm9TEbo7n1uKjlGnv8c98PFMaD3Bn836TRLlZQm5NZ/dp/J5Qp
 bWPvmc35Z/7FM+zYPXn9XsRri/hE8nYniIiUZVv/8Co8beZ0QJgbV2Y6edoQ0z3pC64tA+
 NTvTMPOSYFhHy+nVbmqBfdLpjI9hnfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-FSv7bGfENIOd_LwCCJF7_A-1; Tue, 19 Jan 2021 13:03:17 -0500
X-MC-Unique: FSv7bGfENIOd_LwCCJF7_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA75106C060
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:03:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4B295D9DD;
 Tue, 19 Jan 2021 18:03:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/17] qapi/commands: Simplify command registry generation
Date: Tue, 19 Jan 2021 13:02:39 -0500
Message-Id: <20210119180242.1570753-15-jsnow@redhat.com>
In-Reply-To: <20210119180242.1570753-1-jsnow@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

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
---
 scripts/qapi/commands.py | 49 ++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 49111663394..13a9dcaf894 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -23,7 +23,6 @@
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
@@ -285,7 +267,7 @@ def _begin_user_module(self, name: str) -> None:
 ''',
                              types=types))
 
-    def visit_end(self) -> None:
+    def visit_begin(self, schema: QAPISchema) -> None:
         self._add_module('./init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
@@ -293,13 +275,24 @@ def visit_end(self) -> None:
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
@@ -324,15 +317,17 @@ def visit_command(self,
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


