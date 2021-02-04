Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E630E89F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 01:37:55 +0100 (CET)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Seg-0006k3-BQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 19:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZN-0001D2-CP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZC-0000bB-6R
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612398733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acrxd18H7FqKyFi0v69UbUmTdPkZgFPrjuidbeAGGhQ=;
 b=SezRqJQHY9ZH+G710Fj7l7mAPrndCSr1nrYhZBIJSlOHpjkGKumYR+8dgFtyTNXTxSkSfa
 8PfadTykdiGcc1S7fYSANtVokjg2SFGxoX7v/DvMsPasnp9HGTaTepLv3hywXn5c1xTSqa
 nYmop5++w3KSdEyKjT9N11IiCZ6ssRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-yXtQ71cUOvGAQzgBBiWRpg-1; Wed, 03 Feb 2021 19:32:11 -0500
X-MC-Unique: yXtQ71cUOvGAQzgBBiWRpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73AA7AFA80
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 00:32:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D256D101E817;
 Thu,  4 Feb 2021 00:32:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 03/15] qapi/introspect.py: add _gen_features helper
Date: Wed,  3 Feb 2021 19:31:55 -0500
Message-Id: <20210204003207.2856909-4-jsnow@redhat.com>
In-Reply-To: <20210204003207.2856909-1-jsnow@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

_make_tree might receive a dict (a SchemaInfo object) or some other type
(usually, a string) for its obj parameter. Adding features information
should arguably be performed by the caller at such a time when we know
the type of the object and don't have to re-interrogate it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 3295a15c98e..4749f65ea3c 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -24,15 +24,11 @@
 )
 
 
-def _make_tree(obj, ifcond, features, extra=None):
+def _make_tree(obj, ifcond, extra=None):
     if extra is None:
         extra = {}
     if ifcond:
         extra['if'] = ifcond
-    if features:
-        obj['features'] = [
-            _make_tree(f.name, f.ifcond, None) for f in features
-        ]
     if extra:
         return (obj, extra)
     return obj
@@ -169,6 +165,10 @@ def _use_type(self, typ):
             return '[' + self._use_type(typ.element_type) + ']'
         return self._name(typ.name)
 
+    @staticmethod
+    def _gen_features(features):
+        return [_make_tree(f.name, f.ifcond) for f in features]
+
     def _gen_tree(self, name, mtype, obj, ifcond, features):
         extra = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
@@ -179,13 +179,17 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
             name = self._name(name)
         obj['name'] = name
         obj['meta-type'] = mtype
-        self._trees.append(_make_tree(obj, ifcond, features, extra))
+        if features:
+            obj['features'] = self._gen_features(features)
+        self._trees.append(_make_tree(obj, ifcond, extra))
 
     def _gen_member(self, member):
         obj = {'name': member.name, 'type': self._use_type(member.type)}
         if member.optional:
             obj['default'] = None
-        return _make_tree(obj, member.ifcond, member.features)
+        if member.features:
+            obj['features'] = self._gen_features(member.features)
+        return _make_tree(obj, member.ifcond)
 
     def _gen_variants(self, tag_name, variants):
         return {'tag': tag_name,
@@ -193,7 +197,7 @@ def _gen_variants(self, tag_name, variants):
 
     def _gen_variant(self, variant):
         obj = {'case': variant.name, 'type': self._use_type(variant.type)}
-        return _make_tree(obj, variant.ifcond, None)
+        return _make_tree(obj, variant.ifcond)
 
     def visit_builtin_type(self, name, info, json_type):
         self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
-- 
2.29.2


