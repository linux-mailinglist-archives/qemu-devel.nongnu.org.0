Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70277274B44
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:40:22 +0200 (CEST)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKq1N-0001Lk-Dm
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQc-0002ty-F5
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQZ-0004gP-6B
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfnNb8K+fR0XrTDp0uEKa0hcypzfZki4qBv716hnSTs=;
 b=OiZUm0C6qxKEb4WOoXTIBcJ3Hj9oviRk2QPQCOEgMMZwCGy3xaq6NiARLSItNGRfJGxtGF
 pj0BPJrWv1gVijip5SJqiMgAINIuMmYFgnAqPyh22ypqkIHVzA+hqjb+CzvM+3tTI1DpaI
 SARJSAsyXB8bn9VPjT50YuT/o/fK5Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-SygbvdQYNiSzHA4SjBiuEA-1; Tue, 22 Sep 2020 17:01:52 -0400
X-MC-Unique: SygbvdQYNiSzHA4SjBiuEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39A1D186841A;
 Tue, 22 Sep 2020 21:01:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49E6955767;
 Tue, 22 Sep 2020 21:01:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 32/38] qapi/introspect.py: create a typed 'Node' data
 structure
Date: Tue, 22 Sep 2020 17:00:55 -0400
Message-Id: <20200922210101.4081073-33-jsnow@redhat.com>
In-Reply-To: <20200922210101.4081073-1-jsnow@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replacing the un-typed tuple, add a typed Node that we can add typed
metadata to.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 53 ++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index e1edd0b179..e0f5007ab7 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -31,11 +31,18 @@ class Extra(NamedTuple):
     ifcond: Sequence[str] = tuple()
 
 
-def _make_tree(obj, ifcond,
-               extra: Optional[Extra] = None):
-    comment = extra.comment if extra else None
-    extra = Extra(comment, ifcond)
-    return (obj, extra)
+class Node:
+    """
+    Node generally contains a SchemaInfo-like type (as a dict),
+    But it also used to wrap comments/ifconds around leaf value types.
+    """
+    # Remove after 3.7 adds @dataclass:
+    # pylint: disable=too-few-public-methods
+    def __init__(self, data, ifcond: List[str],
+                 extra: Optional[Extra] = None):
+        self.data = data
+        comment = extra.comment if extra else None
+        self.extra = Extra(comment, ifcond)
 
 
 def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
@@ -43,18 +50,15 @@ def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
     def indent(level):
         return level * 4 * ' '
 
-    if isinstance(obj, tuple):
-        ifobj, extra = obj
-        ifcond = extra.ifcond
-        comment = extra.comment
+    if isinstance(obj, Node):
         ret = ''
-        if comment:
-            ret += indent(level) + '/* %s */\n' % comment
-        if ifcond:
-            ret += gen_if(ifcond)
-        ret += _tree_to_qlit(ifobj, level)
-        if ifcond:
-            ret += '\n' + gen_endif(ifcond)
+        if obj.extra.comment:
+            ret += indent(level) + '/* %s */\n' % obj.extra.comment
+        if obj.extra.ifcond:
+            ret += gen_if(obj.extra.ifcond)
+        ret += _tree_to_qlit(obj.data, level)
+        if obj.extra.ifcond:
+            ret += '\n' + gen_endif(obj.extra.ifcond)
         return ret
 
     ret = ''
@@ -169,7 +173,7 @@ def _use_type(self, typ):
 
     @classmethod
     def _gen_features(cls, features: List[QAPISchemaFeature]):
-        return [_make_tree(f.name, f.ifcond) for f in features]
+        return [Node(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name, mtype, obj, ifcond, features):
         extra = None
@@ -183,7 +187,7 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
         obj['meta-type'] = mtype
         if features:
             obj['features'] = self._gen_features(features)
-        self._trees.append(_make_tree(obj, ifcond, extra))
+        self._trees.append(Node(obj, ifcond, extra))
 
     def _gen_member(self, member):
         obj = {'name': member.name, 'type': self._use_type(member.type)}
@@ -191,7 +195,7 @@ def _gen_member(self, member):
             obj['default'] = None
         if member.features:
             obj['features'] = self._gen_features(member.features)
-        return _make_tree(obj, member.ifcond)
+        return Node(obj, member.ifcond)
 
     def _gen_variants(self, tag_name, variants):
         return {'tag': tag_name,
@@ -199,15 +203,14 @@ def _gen_variants(self, tag_name, variants):
 
     def _gen_variant(self, variant):
         obj = {'case': variant.name, 'type': self._use_type(variant.type)}
-        return _make_tree(obj, variant.ifcond)
+        return Node(obj, variant.ifcond)
 
     def visit_builtin_type(self, name, info, json_type):
         self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
 
     def visit_enum_type(self, name, info, ifcond, features, members, prefix):
         self._gen_tree(name, 'enum',
-                       {'values': [_make_tree(m.name, m.ifcond, None)
-                                   for m in members]},
+                       {'values': [Node(m.name, m.ifcond) for m in members]},
                        ifcond, features)
 
     def visit_array_type(self, name, info, ifcond, element_type):
@@ -227,9 +230,9 @@ def visit_object_type_flat(self, name, info, ifcond, features,
     def visit_alternate_type(self, name, info, ifcond, features, variants):
         self._gen_tree(name, 'alternate',
                        {'members': [
-                           _make_tree({'type': self._use_type(m.type)},
-                                      m.ifcond, None)
-                           for m in variants.variants]},
+                           Node({'type': self._use_type(m.type)}, m.ifcond)
+                           for m in variants.variants
+                       ]},
                        ifcond, features)
 
     def visit_command(self, name, info, ifcond, features,
-- 
2.26.2


