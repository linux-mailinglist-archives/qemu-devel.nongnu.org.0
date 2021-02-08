Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC23140AE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:42:48 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DMs-0006sT-JJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974P-0005aC-C9
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9742-0001cr-Od
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELyR8k+nisfGJRLnb7LDOZoFT8MT+r9AQuV5mx2Pn4w=;
 b=gXWYZYPMDWFlK/no6M7ns+nqe/TQCjV0gjSx6jTMQM7VqpOm7oCPT2MTOuuVM34JvdadCW
 mLdbG5HMVd9wn3ujkMz3RTszWke2jf3mbWRkhOHHj/sP7zogdDfW0BxRLVlCgraEXhQXee
 G3x5/Nj1HP+LLfvgTpFKpV2URmbPhRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-3GoPkhA6Oo21o6AxPMAIsQ-1; Mon, 08 Feb 2021 08:58:51 -0500
X-MC-Unique: 3GoPkhA6Oo21o6AxPMAIsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA91C85B660;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88BCE1007612;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DA241132EA4; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] qapi/gen: Replace ._begin_system_module()
Date: Mon,  8 Feb 2021 14:58:36 +0100
Message-Id: <20210208135846.3707170-7-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPISchemaModularCVisitor._begin_system_module() is actually just for
the builtin module.  Rename it to ._begin_builtin_module() and drop
its useless @name parameter.

Clarify conditionals in visit_module to make this clear.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-7-jsnow@redhat.com>
---
 scripts/qapi/gen.py   | 9 +++++----
 scripts/qapi/types.py | 2 +-
 scripts/qapi/visit.py | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 2aec6d3436..aaed78eed5 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -295,23 +295,24 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
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
index 2b4916cdaa..dbf58c0b91 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -271,7 +271,7 @@ class QAPISchemaGenTypeVisitor(QAPISchemaModularCVisitor):
             prefix, 'qapi-types', ' * Schema-defined QAPI types',
             ' * Built-in QAPI types', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/dealloc-visitor.h"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 339f152152..568ba35592 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -305,7 +305,7 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
             prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
             ' * Built-in QAPI visitors', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-- 
2.26.2


