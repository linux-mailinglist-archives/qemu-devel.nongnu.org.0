Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F8313DBD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:40:55 +0100 (CET)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BSw-0002yA-Jw
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974Q-0005c2-BK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9743-0001d3-7c
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oy8o2Yg213v5wQfG4LS4hCBKJj0a2TMGUUY09jDMGCA=;
 b=AAo2owxR6Tal0g9FY8eixTKuE+Pvj8oV8CjS6ht1avwB0gJytXUOYDKtL+vnmr2rFVb0QW
 Ki9aNBv/hpCU7j5iLEH++OGiNoL9L6xgQ/v7G26lTEvTm3N3haI0z7G4WfQURKtlUGlkUt
 s47kCnf2psfHNPVkJ2ZUZYe8BN+xB3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-fUthpsTeOEqBkhwJUXGWUw-1; Mon, 08 Feb 2021 08:58:52 -0500
X-MC-Unique: fUthpsTeOEqBkhwJUXGWUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868C985B66D;
 Mon,  8 Feb 2021 13:58:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32FD65D9DC;
 Mon,  8 Feb 2021 13:58:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B5881141D22; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] qapi: type 'info' as Optional[QAPISourceInfo]
Date: Mon,  8 Feb 2021 14:58:45 +0100
Message-Id: <20210208135846.3707170-16-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
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

From: John Snow <jsnow@redhat.com>

For everything typed so far, type this parameter as
Optional[QAPISourceInfo].

In the most generic case, QAPISchemaEntity's info field may be None to
represent types that come from built-in definitions. Although some
Entity types may not currently have any built-in definitions, it is not
easily possible to constrain the type except on an ad-hoc basis using
assertions.

It's easier and simpler, then, to just say it's always an Optional type.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-16-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/commands.py | 2 +-
 scripts/qapi/events.py   | 2 +-
 scripts/qapi/gen.py      | 2 +-
 scripts/qapi/types.py    | 2 +-
 scripts/qapi/visit.py    | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 13a9dcaf89..54af519f44 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -296,7 +296,7 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds)
 
     def visit_command(self,
                       name: str,
-                      info: QAPISourceInfo,
+                      info: Optional[QAPISourceInfo],
                       ifcond: List[str],
                       features: List[QAPISchemaFeature],
                       arg_type: Optional[QAPISchemaObjectType],
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 079c666ec6..8c57deb2b8 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -213,7 +213,7 @@ void %(event_emit)s(%(event_enum)s event, QDict *qdict);
 
     def visit_event(self,
                     name: str,
-                    info: QAPISourceInfo,
+                    info: Optional[QAPISourceInfo],
                     ifcond: List[str],
                     features: List[QAPISchemaFeature],
                     arg_type: Optional[QAPISchemaObjectType],
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index ac3d3e687e..63549cc8d4 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -325,7 +325,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             self._add_module(name, self._user_blurb)
             self._begin_user_module(name)
 
-    def visit_include(self, name: str, info: QAPISourceInfo) -> None:
+    def visit_include(self, name: str, info: Optional[QAPISourceInfo]) -> None:
         relname = os.path.relpath(self._module_filename(self._what, name),
                                   os.path.dirname(self._genh.fname))
         self._genh.preamble_add(mcgen('''
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index dbf58c0b91..2bdd626847 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -350,7 +350,7 @@ class QAPISchemaGenTypeVisitor(QAPISchemaModularCVisitor):
 
     def visit_alternate_type(self,
                              name: str,
-                             info: QAPISourceInfo,
+                             info: Optional[QAPISourceInfo],
                              ifcond: List[str],
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 568ba35592..22e62df901 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -336,7 +336,7 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
 
     def visit_enum_type(self,
                         name: str,
-                        info: QAPISourceInfo,
+                        info: Optional[QAPISourceInfo],
                         ifcond: List[str],
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
@@ -378,7 +378,7 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
 
     def visit_alternate_type(self,
                              name: str,
-                             info: QAPISourceInfo,
+                             info: Optional[QAPISourceInfo],
                              ifcond: List[str],
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
-- 
2.26.2


