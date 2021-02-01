Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640730B080
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:42:54 +0100 (CET)
Received: from localhost ([::1]:38210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6f65-0000AK-Ft
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1Y-0003Dr-OR
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1X-0005fB-2W
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lb7V/mm7zQa8yrfFR/zgKPDM7V7rJbjKwC0qBdFefDU=;
 b=Ix9OggtbyW8NICxcIlg/z5dSHIe22pZy+dTYs4MosWIcmGOcI4+a/bCq47qHdPh5+/7Wlx
 eprwcbQpNy9Fouq/cf+tGekWXVXCtmtocA6RuB+GDGrkXBU8TktLNeZBxBozyznevlL7YX
 08tPToyDugw2KGk+jRykseF+18DZYXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-Ysr62lDMPV68fdM4dACBjQ-1; Mon, 01 Feb 2021 14:38:08 -0500
X-MC-Unique: Ysr62lDMPV68fdM4dACBjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 316F01005513;
 Mon,  1 Feb 2021 19:38:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0765360C05;
 Mon,  1 Feb 2021 19:38:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/16] qapi/gen: Replace ._begin_system_module()
Date: Mon,  1 Feb 2021 14:37:37 -0500
Message-Id: <20210201193747.2169670-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

QAPISchemaModularCVisitor._begin_system_module() is actually just for
the builtin module.  Rename it to ._begin_builtin_module() and drop
its useless @name parameter.

Clarify conditionals in visit_module to make this clear.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py   | 9 +++++----
 scripts/qapi/types.py | 2 +-
 scripts/qapi/visit.py | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 2aec6d34365..aaed78eed5e 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -295,23 +295,24 @@ def write(self, output_dir: str, opt_builtins: bool = False) -> None:
             genc.write(output_dir)
             genh.write(output_dir)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         pass
 
     def _begin_user_module(self, name: str) -> None:
         pass
 
     def visit_module(self, name: Optional[str]) -> None:
-        if name is None:
+        if QAPISchemaModule.is_builtin_module(name):
             if self._builtin_blurb:
-                self._add_system_module(None, self._builtin_blurb)
-                self._begin_system_module(name)
+                self._add_system_module(name, self._builtin_blurb)
+                self._begin_builtin_module()
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
                 self._genc = None
                 self._genh = None
         else:
+            assert QAPISchemaModule.is_user_module(name)
             self._add_user_module(name, self._user_blurb)
             self._begin_user_module(name)
 
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 2b4916cdaa1..dbf58c0b91d 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -271,7 +271,7 @@ def __init__(self, prefix: str):
             prefix, 'qapi-types', ' * Schema-defined QAPI types',
             ' * Built-in QAPI types', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/dealloc-visitor.h"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 339f1521524..568ba35592c 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -305,7 +305,7 @@ def __init__(self, prefix: str):
             prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
             ' * Built-in QAPI visitors', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-- 
2.29.2


