Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816C2DA472
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:59:39 +0100 (CET)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxkg-00023O-Lk
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf4-0003K9-VU
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf3-0000ts-22
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fU1x3aYfkQgbpuX5Pv2W3fUdPM/d6b7VrrWfI36y0ls=;
 b=iYZuVs0XXD5lve7wrF1TlKCTHxGFhfuQP6W7v3mUd98bGjzUCYf3PnVqN3GYRk4zgCuPMP
 uy/ocHTJO0FDG6USMJ1mOHoLUlzAUGWesHUN3SRmQ8ibW0t1ekkkKINKCHmwjVZt8gDIVE
 Z6IGPIboNSDg2jwzTFLcljsgSOdJltI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-dh1MuHObOLGRRqy1TFX20g-1; Mon, 14 Dec 2020 18:53:46 -0500
X-MC-Unique: dh1MuHObOLGRRqy1TFX20g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF381922964
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B4A770484;
 Mon, 14 Dec 2020 23:53:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] qapi/gen: write _genc/_genh access shims
Date: Mon, 14 Dec 2020 18:53:22 -0500
Message-Id: <20201214235327.1007124-8-jsnow@redhat.com>
In-Reply-To: <20201214235327.1007124-1-jsnow@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
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
index 0c5d1fee6088..17ae9f4af703 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -243,11 +243,20 @@ def __init__(self,
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
     def _is_user_module(name: str) -> bool:
         return not name.startswith('./')
@@ -281,7 +290,7 @@ def _add_module(self, name: str, blurb: str) -> None:
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] = (genc, genh)
-        self._genc, self._genh = self._module[name]
+        self._current_module = name
 
     def _add_user_module(self, name: str, blurb: str) -> None:
         assert self._is_user_module(name)
@@ -314,8 +323,7 @@ def visit_module(self, name: Optional[str]) -> None:
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
-                self._genc = None
-                self._genh = None
+                self._current_module = None
         else:
             self._add_user_module(name, self._user_blurb)
             self._begin_user_module(name)
-- 
2.26.2


