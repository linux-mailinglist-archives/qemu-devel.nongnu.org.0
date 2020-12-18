Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B62DEA9F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 21:56:52 +0100 (CET)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMnz-00040q-MA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 15:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlZ-00011Y-BV
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlW-0002uk-Jx
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608324857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfjjjpZnwU913JbXpk4wFG9lzOoHwzDy+tJejANj9Xw=;
 b=cFM+jP3HmgRXTvvgMxfIxwEEuH6hklWmApr+Z2q902ts7aJf1DmBK1bnZQapD4kc/Ix/UG
 /Xg2LuwW/YD5a9DBV0Ys8yps6Bnsq8Vz+R4AmyP4GUNGt2WkJav4liIlpZmavSBJxuW/OZ
 MJkAEWu5IOcW9iCijvjsXhqhQ/VcU18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-7-h_OSoENvubthqUmdNqkQ-1; Fri, 18 Dec 2020 15:54:16 -0500
X-MC-Unique: 7-h_OSoENvubthqUmdNqkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47182801817
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:54:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11139299A7;
 Fri, 18 Dec 2020 20:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4A9311275E4; Fri, 18 Dec 2020 21:54:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] qapi/gen: Expose a single module name space
Date: Fri, 18 Dec 2020 21:54:04 +0100
Message-Id: <20201218205407.1326907-9-armbru@redhat.com>
In-Reply-To: <20201218205407.1326907-1-armbru@redhat.com>
References: <20201218205407.1326907-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPISchemaModularCVisitor attempts to encapsulate the way it splits
the module name space between user modules (name can't start with
'./') and system modules (name is None or starts with './') by
providing separate ._add_user_module() and ._add_system_module(),
where the latter prepends './' to names other than None.

Not worthwhile.  Dumb down to a single ._add_module(), and have the
callers take care of giving system modules names starting with './'.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/events.py   |  2 +-
 scripts/qapi/gen.py      | 16 +++++-----------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 71744f48a3..4911166339 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -286,7 +286,7 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('init', ' * QAPI Commands initialization')
+        self._add_module('./init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 9851653b9d..079c666ec6 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -191,7 +191,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('emit', ' * QAPI Events emission')
+        self._add_module('./emit', ' * QAPI Events emission')
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-emit-events.h"
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 67635b6a26..d9f8bac9aa 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -287,21 +287,15 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
                             self._module_basename(what, name))
 
     def _add_module(self, name: str, blurb: str) -> None:
+        if self._is_user_module(name):
+            if self._main_module is None:
+                self._main_module = name
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] = (genc, genh)
         self._current_module = name
 
-    def _add_user_module(self, name: str, blurb: str) -> None:
-        assert self._is_user_module(name)
-        if self._main_module is None:
-            self._main_module = name
-        self._add_module(name, blurb)
-
-    def _add_system_module(self, name: str, blurb: str) -> None:
-        self._add_module('./' + name, blurb)
-
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
             if self._is_builtin_module(name) and not opt_builtins:
@@ -319,14 +313,14 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
     def visit_module(self, name: Optional[str]) -> None:
         if name is None:
             if self._builtin_blurb:
-                self._add_system_module('builtin', self._builtin_blurb)
+                self._add_module('./builtin', self._builtin_blurb)
                 self._begin_builtin_module()
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
                 self._current_module = None
         else:
-            self._add_user_module(name, self._user_blurb)
+            self._add_module(name, self._user_blurb)
             self._begin_user_module(name)
 
     def visit_include(self, name: str, info: QAPISourceInfo) -> None:
-- 
2.26.2


