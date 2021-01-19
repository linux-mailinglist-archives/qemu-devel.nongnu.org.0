Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23F2FBED1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:22:54 +0100 (CET)
Received: from localhost ([::1]:34914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1veX-0007OY-Dk
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLW-0007kZ-48
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLT-0005RK-FL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6aiH8zm1YUPRAyeHaBmqcArttEwHHHXEPxZD/0Y0wE=;
 b=Rp9XaGru+z93IPcRmA/HqkSAQmHT0/ZRhUvgdNt6/2v+BmYxT3zzGVcxk4PaUmZdGo+gq+
 Y1EAI9nwiuvqSpNWuSFuiAn/H8h1YEkUIUSrWkrZmraRMD1kmVUrwASMz6W8Qw4Vxu1frE
 jLS+vAnJoHtdogSbluq1F42a8hHrGZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-xst1rdZqMg2bR8_EdtjQTQ-1; Tue, 19 Jan 2021 13:03:09 -0500
X-MC-Unique: xst1rdZqMg2bR8_EdtjQTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C14107AD4C
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:03:06 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21D935D9DD;
 Tue, 19 Jan 2021 18:03:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/17] qapi/gen: Combine ._add_[user|system]_module
Date: Tue, 19 Jan 2021 13:02:35 -0500
Message-Id: <20210119180242.1570753-11-jsnow@redhat.com>
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

From: Markus Armbruster <armbru@redhat.com>

QAPISchemaModularCVisitor attempts to encapsulate the way it splits
the module name space between user modules (name can't start with
'./') and system modules (name is None or starts with './') by
providing separate ._add_user_module() and ._add_system_module(),
where the latter prepends './' to names other than None.

Not worthwhile.  Dumb down to a single ._add_module().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/events.py   |  2 +-
 scripts/qapi/gen.py      | 20 +++++++-------------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index fc5fe27c472..49111663394 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -286,7 +286,7 @@ def _begin_user_module(self, name: str) -> None:
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('./init', ' * QAPI Commands initialization')
+        self._add_module('./init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 26faa829898..079c666ec69 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -191,7 +191,7 @@ def _begin_user_module(self, name: str) -> None:
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('./emit', ' * QAPI Events emission')
+        self._add_module('./emit', ' * QAPI Events emission')
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-emit-events.h"
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 55acd7e080d..b5505685e6e 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -272,22 +272,15 @@ def _module_filename(self, what: str, name: str) -> str:
                             self._module_basename(what, name))
 
     def _add_module(self, name: str, blurb: str) -> None:
+        if QAPISchemaModule.is_user_module(name):
+            if self._main_module is None:
+                self._main_module = name
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] = (genc, genh)
         self._genc, self._genh = self._module[name]
 
-    def _add_user_module(self, name: str, blurb: str) -> None:
-        assert QAPISchemaModule.is_user_module(name)
-        if self._main_module is None:
-            self._main_module = name
-        self._add_module(name, blurb)
-
-    def _add_system_module(self, name: str, blurb: str) -> None:
-        assert QAPISchemaModule.is_system_module(name)
-        self._add_module(name, blurb)
-
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
@@ -303,9 +296,9 @@ def _begin_user_module(self, name: str) -> None:
         pass
 
     def visit_module(self, module: QAPISchemaModule) -> None:
-        if module.system_module:
+        if module.builtin_module:
             if self._builtin_blurb:
-                self._add_system_module(module.name, self._builtin_blurb)
+                self._add_module(module.name, self._builtin_blurb)
                 self._begin_builtin_module()
             else:
                 # The built-in module has not been created.  No code may
@@ -313,7 +306,8 @@ def visit_module(self, module: QAPISchemaModule) -> None:
                 self._genc = None
                 self._genh = None
         else:
-            self._add_user_module(module.name, self._user_blurb)
+            assert module.user_module, "Unexpected system module"
+            self._add_module(module.name, self._user_blurb)
             self._begin_user_module(module.name)
 
     def visit_include(self, name: str, info: QAPISourceInfo) -> None:
-- 
2.26.2


