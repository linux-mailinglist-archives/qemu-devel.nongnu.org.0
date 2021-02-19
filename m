Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9563731FBEF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:26:06 +0100 (CET)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7fR-0004Z3-LA
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD77X-00061g-Pt
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD77U-0005CR-55
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4+4XzK2YlPze0zoq4fG6+eJnV5feYSAPBwxa0jzBwI=;
 b=RpXeAXH7ZIsaNjUfy1pLhy4/CLmPzDgrJpIuU9YdltYnE7C4ktl1K60KfCmVXeN87WZPFq
 wdyxbzCkcKm0a4vhCVNURORC3JTboG/q1RqniG2bpzPsf4AgNQhuKcO+qf5MjQH2Y7WoiV
 GhGm6ZCtAXfrNqd9IQdXWpu/hqifhIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-1PFIKKPMMz-xEtrrabYaMw-1; Fri, 19 Feb 2021 09:49:42 -0500
X-MC-Unique: 1PFIKKPMMz-xEtrrabYaMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01F24804036;
 Fri, 19 Feb 2021 14:49:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C786418B4B;
 Fri, 19 Feb 2021 14:49:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A0211132C28; Fri, 19 Feb 2021 15:49:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] qapi/introspect.py: add _gen_features helper
Date: Fri, 19 Feb 2021 15:49:25 +0100
Message-Id: <20210219144939.604488-5-armbru@redhat.com>
In-Reply-To: <20210219144939.604488-1-armbru@redhat.com>
References: <20210219144939.604488-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

_make_tree might receive a dict (a SchemaInfo object) or some other type
(usually, a string) for its obj parameter. Adding features information
should arguably be performed by the caller at such a time when we know
the type of the object and don't have to re-interrogate it.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-5-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 3295a15c98..4749f65ea3 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -24,15 +24,11 @@ from .schema import (
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
@@ -169,6 +165,10 @@ const QLitObject %(c_name)s = %(c_string)s;
             return '[' + self._use_type(typ.element_type) + ']'
         return self._name(typ.name)
 
+    @staticmethod
+    def _gen_features(features):
+        return [_make_tree(f.name, f.ifcond) for f in features]
+
     def _gen_tree(self, name, mtype, obj, ifcond, features):
         extra = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
@@ -179,13 +179,17 @@ const QLitObject %(c_name)s = %(c_string)s;
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
@@ -193,7 +197,7 @@ const QLitObject %(c_name)s = %(c_string)s;
 
     def _gen_variant(self, variant):
         obj = {'case': variant.name, 'type': self._use_type(variant.type)}
-        return _make_tree(obj, variant.ifcond, None)
+        return _make_tree(obj, variant.ifcond)
 
     def visit_builtin_type(self, name, info, json_type):
         self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
-- 
2.26.2


