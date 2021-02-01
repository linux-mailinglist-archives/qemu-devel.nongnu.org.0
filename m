Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7730B078
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:41:10 +0100 (CET)
Received: from localhost ([::1]:60616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6f4P-0006EP-PG
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1q-0003NO-Er
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1i-0005kr-Pu
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDhdWAZvkCPb+FQ+r2+OFPVRscU+5EwrFcEaIfY0O2o=;
 b=X9PDgMovro+uTDjPQh9tchxzDSi97jRALu4ty3o2zENGkWqbI7gSYB7Iko6ISz7huRHvVH
 G+hqEDY/AhkWKVZVLoN1bBnTgHWUrMtPXUUm5xbKDgr8csSSPdfGg+nQCokvlp1V4Mk442
 +4W1ZcQ2xgPwoPge3ESLzkM89GeHTYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-1QkKdFqFOhOUW6T17FrU2g-1; Mon, 01 Feb 2021 14:38:20 -0500
X-MC-Unique: 1QkKdFqFOhOUW6T17FrU2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B21C107ACE6;
 Mon,  1 Feb 2021 19:38:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5DAE60C05;
 Mon,  1 Feb 2021 19:38:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/16] qapi/gen: write _genc/_genh access shims
Date: Mon,  1 Feb 2021 14:37:42 -0500
Message-Id: <20210201193747.2169670-12-jsnow@redhat.com>
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
index 8ded0f7e5ad..b2bb9d12ffc 100644
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
@@ -303,8 +312,7 @@ def visit_module(self, name: str) -> None:
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
-                self._genc = None
-                self._genh = None
+                self._current_module = None
         else:
             assert QAPISchemaModule.is_user_module(name)
             self._add_module(name, self._user_blurb)
-- 
2.29.2


