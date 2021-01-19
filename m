Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1122FBF54
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:48:44 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1w3X-0000h5-RA
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLT-0007hA-AA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLQ-0005QM-HJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Ai/VlO/RNcCgVu+JEISrd3kFfJr9+Mv+vSzaYWMrxw=;
 b=UetQMcLAtbjOnQ3RtviIi4H/qF9wYFvUJTPd52WEXe4i9ayK11nveO9ZH2zM922s8j3vSj
 ZKOA7+UW1ZG+5EFg7vTonXKTR4e06foEIUiSG/zhvT6NMDCCYx87dkoxO4x+68uVJfy6CW
 WTBdeSjXv/A04Mlnkw7NAjUgRXm6fLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-fOzfxlioPFy8DAygVepY_g-1; Tue, 19 Jan 2021 13:03:01 -0500
X-MC-Unique: fOzfxlioPFy8DAygVepY_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2595180A0AE
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:02:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8C75D9DD;
 Tue, 19 Jan 2021 18:02:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/17] qapi: centralize is_[user|system|builtin]_module
 methods
Date: Tue, 19 Jan 2021 13:02:31 -0500
Message-Id: <20210119180242.1570753-7-jsnow@redhat.com>
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

Define what a module is and define what kind of a module it is once and
for all, in one place.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/qapidoc.py |  2 +-
 scripts/qapi/gen.py    | 21 +++++++--------------
 scripts/qapi/schema.py | 28 ++++++++++++++++++++++++++--
 3 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index f754f675d66..08b9439de2b 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -464,7 +464,7 @@ def __init__(self, env, qapidir):
         self._qapidir = qapidir
 
     def visit_module(self, module):
-        if module.name:
+        if module.user_module:
             qapifile = self._qapidir + '/' + module.name
             self._env.note_dependency(os.path.abspath(qapifile))
         super().visit_module(module)
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index e73d3d61aac..3b7eddc1c21 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -250,21 +250,14 @@ def __init__(self,
         self._main_module: Optional[str] = None
 
     @staticmethod
-    def _is_user_module(name: Optional[str]) -> bool:
-        return bool(name and not name.startswith('./'))
-
-    @staticmethod
-    def _is_builtin_module(name: Optional[str]) -> bool:
-        return not name
-
-    def _module_dirname(self, name: Optional[str]) -> str:
-        if self._is_user_module(name):
+    def _module_dirname(name: Optional[str]) -> str:
+        if QAPISchemaModule.is_user_module(name):
             return os.path.dirname(name)
         return ''
 
     def _module_basename(self, what: str, name: Optional[str]) -> str:
-        ret = '' if self._is_builtin_module(name) else self._prefix
-        if self._is_user_module(name):
+        ret = '' if QAPISchemaModule.is_builtin_module(name) else self._prefix
+        if QAPISchemaModule.is_user_module(name):
             basename = os.path.basename(name)
             ret += what
             if name != self._main_module:
@@ -286,7 +279,7 @@ def _add_module(self, name: Optional[str], blurb: str) -> None:
         self._genc, self._genh = self._module[name]
 
     def _add_user_module(self, name: str, blurb: str) -> None:
-        assert self._is_user_module(name)
+        assert QAPISchemaModule.is_user_module(name)
         if self._main_module is None:
             self._main_module = name
         self._add_module(name, blurb)
@@ -296,7 +289,7 @@ def _add_system_module(self, name: Optional[str], blurb: str) -> None:
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
-            if self._is_builtin_module(name) and not opt_builtins:
+            if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             (genc, genh) = self._module[name]
             genc.write(output_dir)
@@ -309,7 +302,7 @@ def _begin_user_module(self, name: str) -> None:
         pass
 
     def visit_module(self, module: QAPISchemaModule) -> None:
-        if module.name is None:
+        if module.system_module:
             if self._builtin_blurb:
                 self._add_system_module(None, self._builtin_blurb)
                 self._begin_system_module(module.name)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 69ba722c084..44a9232c881 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -141,6 +141,30 @@ def __init__(self, name):
         self.name = name
         self._entity_list = []
 
+    @classmethod
+    def is_system_module(cls, name: Optional[str]) -> bool:
+        return name is None or name.startswith('./')
+
+    @classmethod
+    def is_user_module(cls, name: Optional[str]) -> bool:
+        return not cls.is_system_module(name)
+
+    @classmethod
+    def is_builtin_module(cls, name: str) -> bool:
+        return name == './builtin'
+
+    @property
+    def system_module(self) -> bool:
+        return self.is_system_module(self.name)
+
+    @property
+    def user_module(self) -> bool:
+        return self.is_user_module(self.name)
+
+    @property
+    def builtin_module(self) -> bool:
+        return self.is_builtin_module(self.name)
+
     def add_entity(self, ent):
         self._entity_list.append(ent)
 
@@ -871,8 +895,8 @@ def resolve_type(self, name, info, what):
         return typ
 
     def _module_name(self, fname):
-        if fname is None:
-            return None
+        if QAPISchemaModule.is_system_module(fname):
+            return fname
         return os.path.relpath(fname, self._schema_dir)
 
     def _make_module(self, fname):
-- 
2.26.2


