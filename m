Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B9400606
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:43:55 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMF6Q-0007vJ-Oq
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvJ-0005pP-ET
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvF-0003d0-MU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTHirdJSbvfam5rHkKibIPiLKhRROSvQu0jDEbM6OqA=;
 b=dexDUwgUrs7sUYfJSMf5SVVIjLY1hFqf1cNPU+iCqbk7R9mb0e63a/KXtmdS/FNsPeQwmk
 sjGCpmHluZOs8CG7UZdbUL3sn/xzcq7ct17LCAYMJEusy/4zTbJDaJj21R7JEYqQGaFKgp
 s9JdTSBLdTWtDCw0X81WeouA1eAi9NM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-60CSFD_IOfa7wa6cVeVtGQ-1; Fri, 03 Sep 2021 15:32:16 -0400
X-MC-Unique: 60CSFD_IOfa7wa6cVeVtGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0398284A5E1;
 Fri,  3 Sep 2021 19:32:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D41D5D9FC;
 Fri,  3 Sep 2021 19:32:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BFB2311385C7; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] qapi: Simplify QAPISchemaIfCond's interface for
 generating C
Date: Fri,  3 Sep 2021 21:31:58 +0200
Message-Id: <20210903193209.1426791-3-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPISchemaIfCond.cgen() is only ever used like

    gen_if(ifcond.cgen())

and

    gen_endif(ifcond.cgen())

Simplify to

    ifcond.gen_if()

and

    ifcond.gen_endif()

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210831123809.1107782-2-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[Import statements tidied up with isort]
---
 scripts/qapi/gen.py        |  6 ++----
 scripts/qapi/introspect.py | 11 +++--------
 scripts/qapi/schema.py     | 10 +++++++++-
 scripts/qapi/types.py      | 28 +++++++++++-----------------
 scripts/qapi/visit.py      | 14 ++++++--------
 5 files changed, 31 insertions(+), 38 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 51a597a025..ab26d5c937 100644
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
-    out += gen_if(ifcond.cgen())
+    out += ifcond.gen_if()
     out += added
-    out += gen_endif(ifcond.cgen())
+    out += ifcond.gen_endif()
     return out
 
 
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index bd4233ecee..4c079ee627 100644
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
         if obj.ifcond.is_present():
-            ret += gen_if(obj.ifcond.cgen())
+            ret += obj.ifcond.gen_if()
         ret += _tree_to_qlit(obj.value, level)
         if obj.ifcond.is_present():
-            ret += '\n' + gen_endif(obj.ifcond.cgen())
+            ret += '\n' + obj.ifcond.gen_endif()
         return ret
 
     ret = ''
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 229d24fce9..1451cdec81 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -24,6 +24,8 @@
     c_name,
     cgen_ifcond,
     docgen_ifcond,
+    gen_endif,
+    gen_if,
 )
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
@@ -34,9 +36,15 @@ class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
         self.ifcond = ifcond or {}
 
-    def cgen(self):
+    def _cgen(self):
         return cgen_ifcond(self.ifcond)
 
+    def gen_if(self):
+        return gen_if(self._cgen())
+
+    def gen_endif(self):
+        return gen_endif(self._cgen())
+
     def docgen(self):
         return docgen_ifcond(self.ifcond)
 
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index db9ff95bd1..831294fe42 100644
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
-        ret += gen_if(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_if()
         index = c_enum_const(name, memb.name, prefix)
         ret += mcgen('''
         [%(index)s] = "%(name)s",
 ''',
                      index=index, name=memb.name)
-        ret += gen_endif(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_endif()
 
     ret += mcgen('''
     },
@@ -81,12 +75,12 @@ def gen_enum(name: str,
                 c_name=c_name(name))
 
     for memb in enum_members:
-        ret += gen_if(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_if()
         ret += mcgen('''
     %(c_enum)s,
 ''',
                      c_enum=c_enum_const(name, memb.name, prefix))
-        ret += gen_endif(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_endif()
 
     ret += mcgen('''
 } %(c_name)s;
@@ -126,7 +120,7 @@ def gen_array(name: str, element_type: QAPISchemaType) -> str:
 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     ret = ''
     for memb in members:
-        ret += gen_if(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_if()
         if memb.optional:
             ret += mcgen('''
     bool has_%(c_name)s;
@@ -136,7 +130,7 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     %(c_type)s %(c_name)s;
 ''',
                      c_type=memb.type.c_type(), c_name=c_name(memb.name))
-        ret += gen_endif(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_endif()
     return ret
 
 
@@ -159,7 +153,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 
 ''')
-    ret += gen_if(ifcond.cgen())
+    ret += ifcond.gen_if()
     ret += mcgen('''
 struct %(c_name)s {
 ''',
@@ -193,7 +187,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 };
 ''')
-    ret += gen_endif(ifcond.cgen())
+    ret += ifcond.gen_endif()
 
     return ret
 
@@ -220,13 +214,13 @@ def gen_variants(variants: QAPISchemaVariants) -> str:
     for var in variants.variants:
         if var.type.name == 'q_empty':
             continue
-        ret += gen_if(var.ifcond.cgen())
+        ret += var.ifcond.gen_if()
         ret += mcgen('''
         %(c_type)s %(c_name)s;
 ''',
                      c_type=var.type.c_unboxed_type(),
                      c_name=c_name(var.name))
-        ret += gen_endif(var.ifcond.cgen())
+        ret += var.ifcond.gen_endif()
 
     ret += mcgen('''
     } u;
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 56ea516399..9d9196a143 100644
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
-        ret += gen_if(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_if()
         if memb.optional:
             ret += mcgen('''
     if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
@@ -112,7 +110,7 @@ def gen_visit_object_members(name: str,
             ret += mcgen('''
     }
 ''')
-        ret += gen_endif(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_endif()
 
     if variants:
         tag_member = variants.tag_member
@@ -126,7 +124,7 @@ def gen_visit_object_members(name: str,
         for var in variants.variants:
             case_str = c_enum_const(tag_member.type.name, var.name,
                                     tag_member.type.prefix)
-            ret += gen_if(var.ifcond.cgen())
+            ret += var.ifcond.gen_if()
             if var.type.name == 'q_empty':
                 # valid variant and nothing to do
                 ret += mcgen('''
@@ -142,7 +140,7 @@ def gen_visit_object_members(name: str,
                              case=case_str,
                              c_type=var.type.c_name(), c_name=c_name(var.name))
 
-            ret += gen_endif(var.ifcond.cgen())
+            ret += var.ifcond.gen_endif()
         ret += mcgen('''
     default:
         abort();
@@ -228,7 +226,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
                 c_name=c_name(name))
 
     for var in variants.variants:
-        ret += gen_if(var.ifcond.cgen())
+        ret += var.ifcond.gen_if()
         ret += mcgen('''
     case %(case)s:
 ''',
@@ -254,7 +252,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
         ret += mcgen('''
         break;
 ''')
-        ret += gen_endif(var.ifcond.cgen())
+        ret += var.ifcond.gen_endif()
 
     ret += mcgen('''
     case QTYPE_NONE:
-- 
2.31.1


