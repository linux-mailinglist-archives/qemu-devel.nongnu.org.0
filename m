Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983882FBF83
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:55:58 +0100 (CET)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wAX-0005Aw-Kv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLU-0007iG-DA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLQ-0005QV-HG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xS66eQmUSx23VphivHbGiAaJMJlWm78y/k8iMgru4s=;
 b=ceZxgV/29kEjkx4bi87t/yjuK13DSuqe1XgdOiTVY+f6u1iWBDm3KoxiJHeHfG0dxN3wH5
 5rJcKb39m41bAy7WxYvuidlZyfcNmC3cyqgjDrKXNSborFFISPcnjlB+4bZq2jM4qtA8Y2
 RPJzdUjCcjAtevMPm+Rg/9KBhdRn4q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-w0QbyEm4MdO4xH9UYnCtaQ-1; Tue, 19 Jan 2021 13:03:01 -0500
X-MC-Unique: w0QbyEm4MdO4xH9UYnCtaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E71B8018A4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:02:55 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 846145D9DD;
 Tue, 19 Jan 2021 18:02:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/17] qapi: pass QAPISchemaModule to visit_module instead
 of str
Date: Tue, 19 Jan 2021 13:02:30 -0500
Message-Id: <20210119180242.1570753-6-jsnow@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Modify visit_module to pass the module itself instead of just its
name. This allows for future patches to centralize some
module-interrogation behavior within the QAPISchemaModule class itself,
cutting down on duplication between gen.py and schema.py.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/qapidoc.py         |  8 ++++----
 scripts/qapi/gen.py            | 16 ++++++++++------
 scripts/qapi/schema.py         |  4 ++--
 tests/qapi-schema/test-qapi.py |  4 ++--
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index e03abcbb959..f754f675d66 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -463,11 +463,11 @@ def __init__(self, env, qapidir):
         self._env = env
         self._qapidir = qapidir
 
-    def visit_module(self, name):
-        if name is not None:
-            qapifile = self._qapidir + '/' + name
+    def visit_module(self, module):
+        if module.name:
+            qapifile = self._qapidir + '/' + module.name
             self._env.note_dependency(os.path.abspath(qapifile))
-        super().visit_module(name)
+        super().visit_module(module)
 
 
 class QAPIDocDirective(Directive):
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 3d81b90ab71..e73d3d61aac 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -31,7 +31,11 @@
     guardstart,
     mcgen,
 )
-from .schema import QAPISchemaObjectType, QAPISchemaVisitor
+from .schema import (
+    QAPISchemaModule,
+    QAPISchemaObjectType,
+    QAPISchemaVisitor,
+)
 from .source import QAPISourceInfo
 
 
@@ -304,19 +308,19 @@ def _begin_system_module(self, name: None) -> None:
     def _begin_user_module(self, name: str) -> None:
         pass
 
-    def visit_module(self, name: Optional[str]) -> None:
-        if name is None:
+    def visit_module(self, module: QAPISchemaModule) -> None:
+        if module.name is None:
             if self._builtin_blurb:
                 self._add_system_module(None, self._builtin_blurb)
-                self._begin_system_module(name)
+                self._begin_system_module(module.name)
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
                 self._genc = None
                 self._genh = None
         else:
-            self._add_user_module(name, self._user_blurb)
-            self._begin_user_module(name)
+            self._add_user_module(module.name, self._user_blurb)
+            self._begin_user_module(module.name)
 
     def visit_include(self, name: str, info: QAPISourceInfo) -> None:
         relname = os.path.relpath(self._module_filename(self._what, name),
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 720449feee4..69ba722c084 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -97,7 +97,7 @@ def visit_begin(self, schema):
     def visit_end(self):
         pass
 
-    def visit_module(self, name):
+    def visit_module(self, module):
         pass
 
     def visit_needed(self, entity):
@@ -145,7 +145,7 @@ def add_entity(self, ent):
         self._entity_list.append(ent)
 
     def visit(self, visitor):
-        visitor.visit_module(self.name)
+        visitor.visit_module(self)
         for entity in self._entity_list:
             if visitor.visit_needed(entity):
                 entity.visit(visitor)
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index e8db9d09d91..bec1ebff3db 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -24,8 +24,8 @@
 
 class QAPISchemaTestVisitor(QAPISchemaVisitor):
 
-    def visit_module(self, name):
-        print('module %s' % name)
+    def visit_module(self, module):
+        print('module %s' % module.name)
 
     def visit_include(self, name, info):
         print('include %s' % name)
-- 
2.26.2


