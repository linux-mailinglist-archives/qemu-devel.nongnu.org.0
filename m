Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD203AC8D1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:29:54 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBl3-0000bR-PB
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBhX-0005Uf-28
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBhV-0000O7-0V
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624011972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TI7bL3uQTUDNb1eFo8+9MOceTIZzU9rOd4XY8k482cQ=;
 b=OkOs7yRWogS+QbTDl1ayhTE8X+t0qasJE+exximu8oWlXivXANA7xGqFhCSKXnKiHWTrft
 5PMLZoKTkQDNQvrIzC2FTUp3BnZMxHK0Fo4x7Omhaf3Q81O1UzM4RPhBz/OwCcADBk9Z/2
 PTB/Qe0fIbUa/8nH2Nwy6UZSaiPipmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-r9QB8zyJPwqRCzG6FAt9Nw-1; Fri, 18 Jun 2021 06:26:02 -0400
X-MC-Unique: r9QB8zyJPwqRCzG6FAt9Nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 533358030AF
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:26:01 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D82205D9C0;
 Fri, 18 Jun 2021 10:25:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/11] qapi: add QAPISchemaIfCond.is_present()
Date: Fri, 18 Jun 2021 14:24:59 +0400
Message-Id: <20210618102507.3761128-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/sphinx/qapidoc.py         | 8 ++++----
 scripts/qapi/schema.py         | 7 +++++--
 tests/qapi-schema/test-qapi.py | 2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index 0eac3308b2..511520f33f 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):
             term.append(nodes.literal('', member.type.doc_type()))
         if member.optional:
             term.append(nodes.Text(' (optional)'))
-        if member.ifcond.ifcond:
+        if member.ifcond.is_present():
             term.extend(self._nodes_for_ifcond(member.ifcond))
         return term
 
@@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, variant):
                 nodes.literal('', variants.tag_member.name),
                 nodes.Text(' is '),
                 nodes.literal('', '"%s"' % variant.name)]
-        if variant.ifcond.ifcond:
+        if variant.ifcond.is_present():
             term.extend(self._nodes_for_ifcond(variant.ifcond))
         return term
 
@@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):
         dlnode = nodes.definition_list()
         for section in doc.args.values():
             termtext = [nodes.literal('', section.member.name)]
-            if section.member.ifcond.ifcond:
+            if section.member.ifcond.is_present():
                 termtext.extend(self._nodes_for_ifcond(section.member.ifcond))
             # TODO drop fallbacks when undocumented members are outlawed
             if section.text:
@@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):
     def _nodes_for_if_section(self, ifcond):
         """Return list of doctree nodes for the "If" section"""
         nodelist = []
-        if ifcond.ifcond:
+        if ifcond.is_present():
             snode = self._make_section('If')
             snode += nodes.paragraph(
                 '', '', *self._nodes_for_ifcond(ifcond, with_if=False)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 5e44164bd1..e3bd8f8720 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -29,6 +29,9 @@ class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
         self.ifcond = ifcond or []
 
+    def is_present(self):
+        return bool(self.ifcond)
+
 
 class QAPISchemaEntity:
     meta: Optional[str] = None
@@ -599,7 +602,7 @@ def check(self, schema, seen):
                     self.info,
                     "discriminator member '%s' of %s must not be optional"
                     % (self._tag_name, base))
-            if self.tag_member.ifcond.ifcond:
+            if self.tag_member.ifcond.is_present():
                 raise QAPISemError(
                     self.info,
                     "discriminator member '%s' of %s must not be conditional"
@@ -607,7 +610,7 @@ def check(self, schema, seen):
         else:                   # simple union
             assert isinstance(self.tag_member.type, QAPISchemaEnumType)
             assert not self.tag_member.optional
-            assert self.tag_member.ifcond.ifcond == []
+            assert not self.tag_member.ifcond.is_present()
         if self._tag_name:    # flat union
             # branches that are not explicitly covered get an empty type
             cases = {v.name for v in self.variants}
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index 7907b4ac3a..c92be2d086 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -94,7 +94,7 @@ def _print_variants(variants):
 
     @staticmethod
     def _print_if(ifcond, indent=4):
-        if ifcond.ifcond:
+        if ifcond.is_present():
             print('%sif %s' % (' ' * indent, ifcond.ifcond))
 
     @classmethod
-- 
2.29.0


