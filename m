Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B692DCAE0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:13:01 +0100 (CET)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpimq-0006ab-Q4
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiaC-0002GA-9y
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpia2-0007BU-Am
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4LO+NOoequEnTMn7BmCl3y7hnHeMLTh/G6wUPIRTf8=;
 b=W/KgsrF7KjoFHZOkjwnXZ2niGIGb38cUyS9hDCbXhfW1h7N/gUCNf0t/aAe/EKhZ+y4BS7
 PXPmkYxE7S5qVlal8dPid50aLdDbai7A1CkjkpsUgMf1WXrKykG0+Za5ZoonPF2nYXridG
 doxnxKsTG8ZXt7UGNctxombGHpwJ4dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-DifYcYTdMBW6OC0JN7MROw-1; Wed, 16 Dec 2020 20:59:41 -0500
X-MC-Unique: DifYcYTdMBW6OC0JN7MROw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68505180A093;
 Thu, 17 Dec 2020 01:59:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 922801E5;
 Thu, 17 Dec 2020 01:59:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] qapi/gen: write _genc/_genh access shims
Date: Wed, 16 Dec 2020 20:59:23 -0500
Message-Id: <20201217015927.197287-9-jsnow@redhat.com>
In-Reply-To: <20201217015927.197287-1-jsnow@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
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
index 476d0adac4e..12ea98fb61e 100644
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
@@ -282,7 +291,7 @@ def _add_module(self, name: str, blurb: str) -> None:
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] = (genc, genh)
-        self._genc, self._genh = self._module[name]
+        self._current_module = name
 
     def _add_user_module(self, name: str, blurb: str) -> None:
         assert self._is_user_module(name)
@@ -315,8 +324,7 @@ def visit_module(self, name: Optional[str]) -> None:
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


