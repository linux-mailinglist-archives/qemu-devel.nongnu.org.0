Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C813314023
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:17:04 +0100 (CET)
Received: from localhost ([::1]:57098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Cxz-0004aa-Hn
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974Q-0005bt-7F
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9743-0001ct-4F
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lFsuvdTBY0RlUXyPOYGW+C+avllTSV6d2/cvT7x8e0=;
 b=MSJlh5u4R+9d6fOlAkIyLV+HISj3Y7tqVgnheaKelpQj5wZL3TYJ4sNHFKvfU3JRe4LIy9
 nECVT/WpCKysVC6T1MXGiZ7ZVPsH5PlGuWN7d38jHwyLwjOFDs12B/tYQyEcOMu/Scu8ci
 QYNJqT9BcqkpdHvVQwji9rNhQky54L0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-BrUa0MTRNg2cSQ2spmsNXw-1; Mon, 08 Feb 2021 08:58:51 -0500
X-MC-Unique: BrUa0MTRNg2cSQ2spmsNXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B81E5180E471;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8884A60C64;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67F3C11329AC; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] qapi/gen: Combine ._add_[user|system]_module
Date: Mon,  8 Feb 2021 14:58:39 +0100
Message-Id: <20210208135846.3707170-10-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With callers to _add_system_module now explicitly using the './' prefix
to indicate a system module, there is no longer any reason to have
separate interfaces for adding system vs user modules; use a unified
interface that differentiates based on the name.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-10-jsnow@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/events.py   |  2 +-
 scripts/qapi/gen.py      | 17 +++++------------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index fc5fe27c47..4911166339 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -286,7 +286,7 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('./init', ' * QAPI Commands initialization')
+        self._add_module('./init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 26faa82989..079c666ec6 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -191,7 +191,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('./emit', ' * QAPI Events emission')
+        self._add_module('./emit', ' * QAPI Events emission')
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-emit-events.h"
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 9352d79c3a..8ded0f7e5a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -272,22 +272,15 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
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
@@ -305,7 +298,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
     def visit_module(self, name: str) -> None:
         if QAPISchemaModule.is_builtin_module(name):
             if self._builtin_blurb:
-                self._add_system_module(name, self._builtin_blurb)
+                self._add_module(name, self._builtin_blurb)
                 self._begin_builtin_module()
             else:
                 # The built-in module has not been created.  No code may
@@ -314,7 +307,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
                 self._genh = None
         else:
             assert QAPISchemaModule.is_user_module(name)
-            self._add_user_module(name, self._user_blurb)
+            self._add_module(name, self._user_blurb)
             self._begin_user_module(name)
 
     def visit_include(self, name: str, info: QAPISourceInfo) -> None:
-- 
2.26.2


