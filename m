Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303D23DFD08
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:35:19 +0200 (CEST)
Received: from localhost ([::1]:60504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCMw-0002Ay-7I
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBCJQ-0003qS-I5
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBCJO-0001oH-NJ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1U4129/BEn8b2mTVj9hNhVl4LnYPFQKoE8tTx58nplo=;
 b=S9EG7tpH5kAbIvlQuyhZrXNtCxfL5Xu2Xc7eRvaxuBkJIXmJ10h2xnMEcCDP/UdoNC1/WL
 yPdhejXTZFesGDx3xoMV9YL0GOVjk0U+LZYi7fzHI/7vTxOeIKwDCP7w9t04jG/URO83sP
 2kUqy2uAXiuJv/GEbKpPJrmVYbzx72E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-3ELwMulmNvqIIqRzVIRt2Q-1; Wed, 04 Aug 2021 04:31:36 -0400
X-MC-Unique: 3ELwMulmNvqIIqRzVIRt2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83D21084F54
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 08:31:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF7291981F;
 Wed,  4 Aug 2021 08:31:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/10] qapi: add QAPISchemaIfCond.is_present()
Date: Wed,  4 Aug 2021 12:30:58 +0400
Message-Id: <20210804083105.97531-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210804083105.97531-1-marcandre.lureau@redhat.com>
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 docs/sphinx/qapidoc.py         | 8 ++++----
 scripts/qapi/introspect.py     | 4 ++--
 scripts/qapi/schema.py         | 7 +++++--
 tests/qapi-schema/test-qapi.py | 2 +-
 4 files changed, 12 insertions(+), 9 deletions(-)

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
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index db1ebbf53a..e23725e2f9 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -123,10 +123,10 @@ def indent(level: int) -> str:
         ret = ''
         if obj.comment:
             ret += indent(level) + f"/* {obj.comment} */\n"
-        if obj.ifcond.ifcond:
+        if obj.ifcond.is_present():
             ret += gen_if(obj.ifcond.ifcond)
         ret += _tree_to_qlit(obj.value, level)
-        if obj.ifcond.ifcond:
+        if obj.ifcond.is_present():
             ret += '\n' + gen_endif(obj.ifcond.ifcond)
         return ret
 
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 90d7684066..24caa4ad43 100644
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
@@ -598,7 +601,7 @@ def check(self, schema, seen):
                     self.info,
                     "discriminator member '%s' of %s must not be optional"
                     % (self._tag_name, base))
-            if self.tag_member.ifcond.ifcond:
+            if self.tag_member.ifcond.is_present():
                 raise QAPISemError(
                     self.info,
                     "discriminator member '%s' of %s must not be conditional"
@@ -606,7 +609,7 @@ def check(self, schema, seen):
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
2.32.0.264.g75ae10bc75


