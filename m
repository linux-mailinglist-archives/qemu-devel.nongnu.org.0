Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91422DEAA0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 21:58:30 +0100 (CET)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMpZ-0005tb-L3
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 15:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlY-00010q-Nt
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlW-0002ud-Cu
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608324857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sYazpc3XYxcQWKauYYN3lkLQYH+gsX+5rD5UqYJiuQc=;
 b=ctEQ4D7QImqmDKT8CyUfOyiAAL3jPQpOybOxXHVwnunkDrZTDsyBHyohdNNrutdp33Wfgj
 oR+U+xGfnoCxckjrlA+xlWoE585ONkuY2fY9ZJ1G8zzeCNXdntGx1NFn1F3MQsS7X9vZCv
 F37jMl/f1IjU41PWXQ5v5pVx1rQwr/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-8jQoGhR1Poyd2bcT73M40w-1; Fri, 18 Dec 2020 15:54:15 -0500
X-MC-Unique: 8jQoGhR1Poyd2bcT73M40w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7CE9800D62
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:54:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A41AD10013C0;
 Fri, 18 Dec 2020 20:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE2C811275DA; Fri, 18 Dec 2020 21:54:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] qapi/gen: write _genc/_genh access shims
Date: Fri, 18 Dec 2020 21:54:02 +0100
Message-Id: <20201218205407.1326907-7-armbru@redhat.com>
In-Reply-To: <20201218205407.1326907-1-armbru@redhat.com>
References: <20201218205407.1326907-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Many places assume they can access these fields without checking them
first to ensure they are defined. Eliminating the _genc and _genh fields
and replacing them with functional properties that check for correct
state can ease the typing overhead by eliminating the Optional[T] return
type.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20201217015927.197287-9-jsnow@redhat.com>
---
 scripts/qapi/gen.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 476d0adac4..12ea98fb61 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -243,11 +243,20 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
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
@@ -282,7 +291,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] = (genc, genh)
-        self._genc, self._genh = self._module[name]
+        self._current_module = name
 
     def _add_user_module(self, name: str, blurb: str) -> None:
         assert self._is_user_module(name)
@@ -315,8 +324,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
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


