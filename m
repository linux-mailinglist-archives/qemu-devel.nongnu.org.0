Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA030B09F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:43:56 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6f75-0001Qe-LP
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1s-0003SG-2e
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1p-0005n6-EK
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aae64tPvuaxqKLnjLqM+1bdqLUUUPIZ0fxZePwQWUSI=;
 b=HwcXLOT6PAZ0llsPQt3saKBEmo5j0jI+xO9cp+mWqr9eNrMbg/IfMaQJXbq8YifpK3t2dL
 d4RXMHD5fDmeV/nPq0u6mJlUCVcIdU7XqF7KHxc+/W0pnJ9eajVr4RD2SMbVNXRSWT8V10
 0q+CYjj3MfrBSKpAiW9wKj3zT8iPC38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-6g-7FWHCMfydbqvCx2E4zg-1; Mon, 01 Feb 2021 14:38:01 -0500
X-MC-Unique: 6g-7FWHCMfydbqvCx2E4zg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEC67801817;
 Mon,  1 Feb 2021 19:38:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45FBE60C05;
 Mon,  1 Feb 2021 19:37:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/16] qapi: centralize is_[user|system|builtin]_module
 methods
Date: Mon,  1 Feb 2021 14:37:36 -0500
Message-Id: <20210201193747.2169670-6-jsnow@redhat.com>
In-Reply-To: <20210201193747.2169670-1-jsnow@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define what a module is and define what kind of a module it is once and
for all, in one place.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py    | 25 +++++++++++--------------
 scripts/qapi/schema.py | 31 +++++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 3d81b90ab71..2aec6d34365 100644
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
 
 
@@ -246,21 +250,14 @@ def __init__(self,
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
@@ -282,7 +279,7 @@ def _add_module(self, name: Optional[str], blurb: str) -> None:
         self._genc, self._genh = self._module[name]
 
     def _add_user_module(self, name: str, blurb: str) -> None:
-        assert self._is_user_module(name)
+        assert QAPISchemaModule.is_user_module(name)
         if self._main_module is None:
             self._main_module = name
         self._add_module(name, blurb)
@@ -292,7 +289,7 @@ def _add_system_module(self, name: Optional[str], blurb: str) -> None:
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
-            if self._is_builtin_module(name) and not opt_builtins:
+            if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             (genc, genh) = self._module[name]
             genc.write(output_dir)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 720449feee4..e80d9320eda 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -141,6 +141,33 @@ def __init__(self, name):
         self.name = name
         self._entity_list = []
 
+    @staticmethod
+    def is_system_module(name: Optional[str]) -> bool:
+        """
+        System modules are internally defined modules.
+
+        Their names start with the "./" prefix.
+        """
+        return name is None or name.startswith('./')
+
+    @classmethod
+    def is_user_module(cls, name: Optional[str]) -> bool:
+        """
+        User modules are those defined by the user in qapi JSON files.
+
+        They do not start with the "./" prefix.
+        """
+        return not cls.is_system_module(name)
+
+    @staticmethod
+    def is_builtin_module(name: Optional[str]) -> bool:
+        """
+        The built-in module is a single System module for the built-in types.
+
+        It is presently always the value 'None'.
+        """
+        return name is None
+
     def add_entity(self, ent):
         self._entity_list.append(ent)
 
@@ -871,8 +898,8 @@ def resolve_type(self, name, info, what):
         return typ
 
     def _module_name(self, fname):
-        if fname is None:
-            return None
+        if QAPISchemaModule.is_system_module(fname):
+            return fname
         return os.path.relpath(fname, self._schema_dir)
 
     def _make_module(self, fname):
-- 
2.29.2


