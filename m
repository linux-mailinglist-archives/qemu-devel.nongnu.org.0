Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0512FBFB9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:07:11 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wLO-0004Wc-5E
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLb-0007me-5q
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLX-0005Sf-Sg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DXthwzTGPV8NROKpyvQC4SOqtS8Z5EE8TjfysGXtoI4=;
 b=K4jo1mFXdmRC0wfghRvsRcxui/yuF6M1oeTsyB49/Qdfd2xpwR+lJMrQut5/KIa8WnerGa
 UgYC5L3M7DTQCHXkbT4sfHUlvcZTlUkAho2IEsLpKdise3Q0osw8MliILj5jnzm9NbgIoW
 EKu/hkKKLeQu6Ed8iuomMzBtYBKvA+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-3vpKrEisNTGZXCBxUHhJyA-1; Tue, 19 Jan 2021 13:03:12 -0500
X-MC-Unique: 3vpKrEisNTGZXCBxUHhJyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE0E10054FF
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:03:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17FA85D9DD;
 Tue, 19 Jan 2021 18:03:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/17] qapi/gen: write _genc/_genh access shims
Date: Tue, 19 Jan 2021 13:02:37 -0500
Message-Id: <20210119180242.1570753-13-jsnow@redhat.com>
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

Many places assume they can access these fields without checking them
first to ensure they are defined. Eliminating the _genc and _genh fields
and replacing them with functional properties that check for correct
state can ease the typing overhead by eliminating the Optional[T] return
type.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b5505685e6e..4b5d3ea3a5b 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -244,11 +244,20 @@ def __init__(self,
         self._user_blurb = user_blurb
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
-        self._genc: Optional[QAPIGenC] = None
-        self._genh: Optional[QAPIGenH] = None
+        self._current_module: Optional[str] = None
         self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
         self._main_module: Optional[str] = None
 
+    @property
+    def _genc(self) -> QAPIGenC:
+        assert self._current_module is not None
+        return self._module[self._current_module][0]
+
+    @property
+    def _genh(self) -> QAPIGenH:
+        assert self._current_module is not None
+        return self._module[self._current_module][1]
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -279,7 +288,7 @@ def _add_module(self, name: str, blurb: str) -> None:
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] = (genc, genh)
-        self._genc, self._genh = self._module[name]
+        self._current_module = name
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
@@ -303,8 +312,7 @@ def visit_module(self, module: QAPISchemaModule) -> None:
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
-                self._genc = None
-                self._genh = None
+                self._current_module = None
         else:
             assert module.user_module, "Unexpected system module"
             self._add_module(module.name, self._user_blurb)
-- 
2.26.2


