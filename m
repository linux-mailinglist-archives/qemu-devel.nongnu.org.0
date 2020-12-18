Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8851E2DEAAD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 22:01:40 +0100 (CET)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMsd-0000tR-JG
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 16:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlY-000113-V6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlW-0002ug-FY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608324857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZIU116KGIzE6OS3ze4xrO/bxNifGBXEoDCMorHNbsg=;
 b=VTEYE9DtXqtTkwvDJlVu59mi5r+kuGB3neNQ2bq7nfuFoE+7Yym9TaxEpngzS3D7tLKZln
 ha0EjyY/0GA8uzI007wpva5aWI3vsAIQ4WW7xVNWCKXSGh5FSgKrt3SXxMMEL+GxohU4az
 ezx4rd1HmcajxQajjDxvzN/XW7wxJ7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-R9EeA7IJO0ywrzJydbcyAw-1; Fri, 18 Dec 2020 15:54:15 -0500
X-MC-Unique: R9EeA7IJO0ywrzJydbcyAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8B24107ACF7
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:54:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A98235D9D7;
 Fri, 18 Dec 2020 20:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E16DF11275DE; Fri, 18 Dec 2020 21:54:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] qapi/gen: Replace ._begin_system_module()
Date: Fri, 18 Dec 2020 21:54:03 +0100
Message-Id: <20201218205407.1326907-8-armbru@redhat.com>
In-Reply-To: <20201218205407.1326907-1-armbru@redhat.com>
References: <20201218205407.1326907-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

QAPISchemaModularCVisitor._begin_system_module() is actually just for
the builtin module.  Rename it to ._begin_builtin_module() and drop
its useless @name parameter.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/gen.py   | 4 ++--
 scripts/qapi/types.py | 2 +-
 scripts/qapi/visit.py | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 12ea98fb61..67635b6a26 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -310,7 +310,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             genc.write(output_dir)
             genh.write(output_dir)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_builtin_module(self) -> None:
         pass
 
     def _begin_user_module(self, name: str) -> None:
@@ -320,7 +320,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         if name is None:
             if self._builtin_blurb:
                 self._add_system_module('builtin', self._builtin_blurb)
-                self._begin_system_module(name)
+                self._begin_builtin_module()
             else:
                 # The built-in module has not been created.  No code may
                 # be generated.
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


