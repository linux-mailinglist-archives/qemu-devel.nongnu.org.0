Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39FF383A5D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:48:04 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligPT-0001J4-UL
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig93-0005Jq-9d
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig90-0006Az-6u
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwVDUsopyARUkjvg3zJKi5jsoJ+xKwVA7O3Hrc5iuDY=;
 b=CUJt3pH5RdBZTjnGqetzdPC4+DoHkQ+ZOOvhMh/FzbZVIeIuZwjEKZNbnJ4oucAvb+psF3
 xfyK6rDo1Dh20MCeZd05IPZfI9M/Xv1heSZ2oXwd+rijr4smEDPuir7V4tkx+bjUyRw95Q
 z1ms2R1KmCi1S7j6QGt8louUTYq/+fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-Q_hAZOvtMxe97RSbPavLmA-1; Mon, 17 May 2021 12:30:59 -0400
X-MC-Unique: Q_hAZOvtMxe97RSbPavLmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1397D101371E
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:30:58 +0000 (UTC)
Received: from localhost (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B7565C1A1;
 Mon, 17 May 2021 16:30:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/9] qapi: make gen_if/gen_endif take a simple string
Date: Mon, 17 May 2021 20:30:33 +0400
Message-Id: <20210517163040.2308926-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Instead of building prepocessor conditions from a list of string, use
the result generated from QAPISchemaIfCond.cgen().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py     | 22 ++++++++++------------
 scripts/qapi/gen.py        |  4 ++--
 scripts/qapi/introspect.py |  4 ++--
 scripts/qapi/schema.py     |  3 +++
 scripts/qapi/types.py      | 20 ++++++++++----------
 scripts/qapi/visit.py      | 12 ++++++------
 6 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cbd3fd81d3..9ab1c9ca55 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -194,19 +194,17 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
-def gen_if(ifcond: Sequence[str]) -> str:
-    ret = ''
-    for ifc in ifcond:
-        ret += mcgen('''
+def gen_if(cond: str) -> str:
+    if not cond:
+        return ''
+    return mcgen('''
 #if %(cond)s
-''', cond=ifc)
-    return ret
+''', cond=cond)
 
 
-def gen_endif(ifcond: Sequence[str]) -> str:
-    ret = ''
-    for ifc in reversed(ifcond):
-        ret += mcgen('''
+def gen_endif(cond: str) -> str:
+    if not cond:
+        return ''
+    return mcgen('''
 #endif /* %(cond)s */
-''', cond=ifc)
-    return ret
+''', cond=cond)
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 1c5b190276..51a597a025 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -> str:
     if added[0] == '\n':
         out += '\n'
         added = added[1:]
-    out += gen_if(ifcond.ifcond)
+    out += gen_if(ifcond.cgen())
     out += added
-    out += gen_endif(ifcond.ifcond)
+    out += gen_endif(ifcond.cgen())
     return out
 
 
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 77a8c33ad4..474b08fd4d 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -124,10 +124,10 @@ def indent(level: int) -> str:
         if obj.comment:
             ret += indent(level) + f"/* {obj.comment} */\n"
         if obj.ifcond:
-            ret += gen_if(obj.ifcond.ifcond)
+            ret += gen_if(obj.ifcond.cgen())
         ret += _tree_to_qlit(obj.value, level)
         if obj.ifcond:
-            ret += '\n' + gen_endif(obj.ifcond.ifcond)
+            ret += '\n' + gen_endif(obj.ifcond.cgen())
         return ret
 
     ret = ''
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 6d55add190..0a187ba3f0 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -29,6 +29,9 @@ class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
         self.ifcond = ifcond or []
 
+    def cgen(self):
+        return ' && '.join([i for i in self.ifcond])
+
     # Returns true if the condition is not void
     def __bool__(self):
         return bool(self.ifcond)
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 3673cf0f49..db9ff95bd1 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -51,13 +51,13 @@ def gen_enum_lookup(name: str,
 ''',
                 c_name=c_name(name))
     for memb in members:
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += gen_if(memb.ifcond.cgen())
         index = c_enum_const(name, memb.name, prefix)
         ret += mcgen('''
         [%(index)s] = "%(name)s",
 ''',
                      index=index, name=memb.name)
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += gen_endif(memb.ifcond.cgen())
 
     ret += mcgen('''
     },
@@ -81,12 +81,12 @@ def gen_enum(name: str,
                 c_name=c_name(name))
 
     for memb in enum_members:
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += gen_if(memb.ifcond.cgen())
         ret += mcgen('''
     %(c_enum)s,
 ''',
                      c_enum=c_enum_const(name, memb.name, prefix))
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += gen_endif(memb.ifcond.cgen())
 
     ret += mcgen('''
 } %(c_name)s;
@@ -126,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaType) -> str:
 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     ret = ''
     for memb in members:
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += gen_if(memb.ifcond.cgen())
         if memb.optional:
             ret += mcgen('''
     bool has_%(c_name)s;
@@ -136,7 +136,7 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     %(c_type)s %(c_name)s;
 ''',
                      c_type=memb.type.c_type(), c_name=c_name(memb.name))
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += gen_endif(memb.ifcond.cgen())
     return ret
 
 
@@ -159,7 +159,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 
 ''')
-    ret += gen_if(ifcond.ifcond)
+    ret += gen_if(ifcond.cgen())
     ret += mcgen('''
 struct %(c_name)s {
 ''',
@@ -193,7 +193,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 };
 ''')
-    ret += gen_endif(ifcond.ifcond)
+    ret += gen_endif(ifcond.cgen())
 
     return ret
 
@@ -220,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -> str:
     for var in variants.variants:
         if var.type.name == 'q_empty':
             continue
-        ret += gen_if(var.ifcond.ifcond)
+        ret += gen_if(var.ifcond.cgen())
         ret += mcgen('''
         %(c_type)s %(c_name)s;
 ''',
                      c_type=var.type.c_unboxed_type(),
                      c_name=c_name(var.name))
-        ret += gen_endif(var.ifcond.ifcond)
+        ret += gen_endif(var.ifcond.cgen())
 
     ret += mcgen('''
     } u;
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 67721b2470..56ea516399 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -79,7 +79,7 @@ def gen_visit_object_members(name: str,
 
     for memb in members:
         deprecated = 'deprecated' in [f.name for f in memb.features]
-        ret += gen_if(memb.ifcond.ifcond)
+        ret += gen_if(memb.ifcond.cgen())
         if memb.optional:
             ret += mcgen('''
     if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
@@ -112,7 +112,7 @@ def gen_visit_object_members(name: str,
             ret += mcgen('''
     }
 ''')
-        ret += gen_endif(memb.ifcond.ifcond)
+        ret += gen_endif(memb.ifcond.cgen())
 
     if variants:
         tag_member = variants.tag_member
@@ -126,7 +126,7 @@ def gen_visit_object_members(name: str,
         for var in variants.variants:
             case_str = c_enum_const(tag_member.type.name, var.name,
                                     tag_member.type.prefix)
-            ret += gen_if(var.ifcond.ifcond)
+            ret += gen_if(var.ifcond.cgen())
             if var.type.name == 'q_empty':
                 # valid variant and nothing to do
                 ret += mcgen('''
@@ -142,7 +142,7 @@ def gen_visit_object_members(name: str,
                              case=case_str,
                              c_type=var.type.c_name(), c_name=c_name(var.name))
 
-            ret += gen_endif(var.ifcond.ifcond)
+            ret += gen_endif(var.ifcond.cgen())
         ret += mcgen('''
     default:
         abort();
@@ -228,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
                 c_name=c_name(name))
 
     for var in variants.variants:
-        ret += gen_if(var.ifcond.ifcond)
+        ret += gen_if(var.ifcond.cgen())
         ret += mcgen('''
     case %(case)s:
 ''',
@@ -254,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
         ret += mcgen('''
         break;
 ''')
-        ret += gen_endif(var.ifcond.ifcond)
+        ret += gen_endif(var.ifcond.cgen())
 
     ret += mcgen('''
     case QTYPE_NONE:
-- 
2.29.0


