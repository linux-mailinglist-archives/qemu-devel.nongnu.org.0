Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A036EB7C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:44:10 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6xd-0006kB-3E
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6ui-00054h-RC
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6ua-0002R2-Dq
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619703659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EzOYjLLS7ZXruBmt1bkaO9lVP9s7RVR/toaIlc+d34g=;
 b=MilrkwNQtaQEWkCGdDRMaJvUfbsqWO/3pSqbHliFRzpSea8zylZYmD8+Sp2vrwqJiJ1FMq
 2CDp+31B0Qui/12chfDArBIl/BrTFt3FGFEJ6yNPCpr2QOiZa0799duUyJ9QoKwF1Vq9wK
 ViKd6fddIKPnZ+4Iz1tOwJc8P2/npIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-je2TvHNJMh2GEa8tUpXMXA-1; Thu, 29 Apr 2021 09:40:57 -0400
X-MC-Unique: je2TvHNJMh2GEa8tUpXMXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41B3F107ACFA
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 13:40:56 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02C81100AE4E;
 Thu, 29 Apr 2021 13:40:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] qapi: move gen_if/gen_endif to QAPISchemaIfCond
Date: Thu, 29 Apr 2021 17:40:25 +0400
Message-Id: <20210429134032.1125111-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move the generating function to the QAPISchemaIfCond class.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py     | 20 +-------------------
 scripts/qapi/gen.py        |  6 ++----
 scripts/qapi/introspect.py | 11 +++--------
 scripts/qapi/schema.py     | 18 +++++++++++++++++-
 scripts/qapi/types.py      | 28 +++++++++++-----------------
 scripts/qapi/visit.py      | 14 ++++++--------
 6 files changed, 40 insertions(+), 57 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cbd3fd81d3..b7f475a160 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -12,7 +12,7 @@
 # See the COPYING file in the top-level directory.
 
 import re
-from typing import Optional, Sequence
+from typing import Optional
 
 
 #: Magic string that gets removed along with all space to its right.
@@ -192,21 +192,3 @@ def guardend(name: str) -> str:
 #endif /* %(name)s */
 ''',
                  name=c_fname(name).upper())
-
-
-def gen_if(ifcond: Sequence[str]) -> str:
-    ret = ''
-    for ifc in ifcond:
-        ret += mcgen('''
-#if %(cond)s
-''', cond=ifc)
-    return ret
-
-
-def gen_endif(ifcond: Sequence[str]) -> str:
-    ret = ''
-    for ifc in reversed(ifcond):
-        ret += mcgen('''
-#endif /* %(cond)s */
-''', cond=ifc)
-    return ret
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 1c5b190276..ab26d5c937 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -24,8 +24,6 @@
 from .common import (
     c_fname,
     c_name,
-    gen_endif,
-    gen_if,
     guardend,
     guardstart,
     mcgen,
@@ -95,9 +93,9 @@ def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -> str:
     if added[0] == '\n':
         out += '\n'
         added = added[1:]
-    out += gen_if(ifcond.ifcond)
+    out += ifcond.gen_if()
     out += added
-    out += gen_endif(ifcond.ifcond)
+    out += ifcond.gen_endif()
     return out
 
 
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 77a8c33ad4..a2a8a57b9a 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -22,12 +22,7 @@
     Union,
 )
 
-from .common import (
-    c_name,
-    gen_endif,
-    gen_if,
-    mcgen,
-)
+from .common import c_name, mcgen
 from .gen import QAPISchemaMonolithicCVisitor
 from .schema import (
     QAPISchema,
@@ -124,10 +119,10 @@ def indent(level: int) -> str:
         if obj.comment:
             ret += indent(level) + f"/* {obj.comment} */\n"
         if obj.ifcond:
-            ret += gen_if(obj.ifcond.ifcond)
+            ret += obj.ifcond.gen_if()
         ret += _tree_to_qlit(obj.value, level)
         if obj.ifcond:
-            ret += '\n' + gen_endif(obj.ifcond.ifcond)
+            ret += '\n' + obj.ifcond.gen_endif()
         return ret
 
     ret = ''
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 7d6f390fa6..8e6d0a5296 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -19,7 +19,7 @@
 import re
 from typing import Optional
 
-from .common import POINTER_SUFFIX, c_name
+from .common import POINTER_SUFFIX, c_name, mcgen
 from .error import QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
@@ -29,6 +29,22 @@ class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
         self.ifcond = ifcond or []
 
+    def gen_if(self):
+        ret = ''
+        for ifc in self.ifcond:
+            ret += mcgen('''
+#if %(cond)s
+''', cond=ifc)
+        return ret
+
+    def gen_endif(self):
+        ret = ''
+        for ifc in reversed(self.ifcond):
+            ret += mcgen('''
+#endif /* %(cond)s */
+''', cond=ifc)
+        return ret
+
     def __bool__(self):
         return bool(self.ifcond)
 
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 3673cf0f49..831294fe42 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -15,13 +15,7 @@
 
 from typing import List, Optional
 
-from .common import (
-    c_enum_const,
-    c_name,
-    gen_endif,
-    gen_if,
-    mcgen,
-)
+from .common import c_enum_const, c_name, mcgen
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import (
     QAPISchema,
@@ -51,13 +45,13 @@ def gen_enum_lookup(name: str,
 ''',
                 c_name=c_name(name))
     for memb in members:
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_if()
         index = c_enum_const(name, memb.name, prefix)
         ret += mcgen('''
         [%(index)s] = "%(name)s",
 ''',
                      index=index, name=memb.name)
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_endif()
 
     ret += mcgen('''
     },
@@ -81,12 +75,12 @@ def gen_enum(name: str,
                 c_name=c_name(name))
 
     for memb in enum_members:
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_if()
         ret += mcgen('''
     %(c_enum)s,
 ''',
                      c_enum=c_enum_const(name, memb.name, prefix))
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_endif()
 
     ret += mcgen('''
 } %(c_name)s;
@@ -126,7 +120,7 @@ def gen_array(name: str, element_type: QAPISchemaType) -> str:
 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     ret = ''
     for memb in members:
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_if()
         if memb.optional:
             ret += mcgen('''
     bool has_%(c_name)s;
@@ -136,7 +130,7 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     %(c_type)s %(c_name)s;
 ''',
                      c_type=memb.type.c_type(), c_name=c_name(memb.name))
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_endif()
     return ret
 
 
@@ -159,7 +153,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 
 ''')
-    ret += gen_if(ifcond.ifcond)
+    ret += ifcond.gen_if()
     ret += mcgen('''
 struct %(c_name)s {
 ''',
@@ -193,7 +187,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 };
 ''')
-    ret += gen_endif(ifcond.ifcond)
+    ret += ifcond.gen_endif()
 
     return ret
 
@@ -220,13 +214,13 @@ def gen_variants(variants: QAPISchemaVariants) -> str:
     for var in variants.variants:
         if var.type.name == 'q_empty':
             continue
-        ret += gen_if(var.ifcond.ifcond)
+        ret += var.ifcond.gen_if()
         ret += mcgen('''
         %(c_type)s %(c_name)s;
 ''',
                      c_type=var.type.c_unboxed_type(),
                      c_name=c_name(var.name))
-        ret += gen_endif(var.ifcond.ifcond)
+        ret += var.ifcond.gen_endif()
 
     ret += mcgen('''
     } u;
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 67721b2470..9d9196a143 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -18,8 +18,6 @@
 from .common import (
     c_enum_const,
     c_name,
-    gen_endif,
-    gen_if,
     indent,
     mcgen,
 )
@@ -79,7 +77,7 @@ def gen_visit_object_members(name: str,
 
     for memb in members:
         deprecated = 'deprecated' in [f.name for f in memb.features]
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_if()
         if memb.optional:
             ret += mcgen('''
     if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
@@ -112,7 +110,7 @@ def gen_visit_object_members(name: str,
             ret += mcgen('''
     }
 ''')
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += memb.ifcond.gen_endif()
 
     if variants:
         tag_member = variants.tag_member
@@ -126,7 +124,7 @@ def gen_visit_object_members(name: str,
         for var in variants.variants:
             case_str = c_enum_const(tag_member.type.name, var.name,
                                     tag_member.type.prefix)
-            ret += gen_if(var.ifcond.ifcond)
+            ret += var.ifcond.gen_if()
             if var.type.name == 'q_empty':
                 # valid variant and nothing to do
                 ret += mcgen('''
@@ -142,7 +140,7 @@ def gen_visit_object_members(name: str,
                              case=case_str,
                              c_type=var.type.c_name(), c_name=c_name(var.name))
 
-            ret += gen_endif(var.ifcond.ifcond)
+            ret += var.ifcond.gen_endif()
         ret += mcgen('''
     default:
         abort();
@@ -228,7 +226,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
                 c_name=c_name(name))
 
     for var in variants.variants:
-        ret += gen_if(var.ifcond.ifcond)
+        ret += var.ifcond.gen_if()
         ret += mcgen('''
     case %(case)s:
 ''',
@@ -254,7 +252,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
         ret += mcgen('''
         break;
 ''')
-        ret += gen_endif(var.ifcond.ifcond)
+        ret += var.ifcond.gen_endif()
 
     ret += mcgen('''
     case QTYPE_NONE:
-- 
2.29.0


