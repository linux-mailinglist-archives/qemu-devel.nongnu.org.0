Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07AF3FC815
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:21:01 +0200 (CEST)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3hC-0003QI-Fc
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL324-0006Km-IB
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31z-0005Ij-UV
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWGQV+GEFCOHg6ei19E8OzrRJoAl+B6mOLDxJEKR7jE=;
 b=C1NxcrIVagGMAVxlVMCLHhLdGXR8KTJvYm5esIQXF6SwPoVTFh7koKZPVeYVt0m7TILl38
 gj79eoOM/4tNHnLlDK2Up6CM60UXtqoU40FCmZHwj3Ri38s3b291Y0hAAACdyJnvN8lnN9
 SqyF5SYAIG7XjSotLdSLvT7mV7EVTqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-YNA3zOUoPlS2-H_BrUb_6Q-1; Tue, 31 Aug 2021 08:38:16 -0400
X-MC-Unique: YNA3zOUoPlS2-H_BrUb_6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F127100A606;
 Tue, 31 Aug 2021 12:38:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C11BD17AC5;
 Tue, 31 Aug 2021 12:38:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A2B611380AA; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/12] qapi: Simplify QAPISchemaIfCond's interface for
 generating C
Date: Tue, 31 Aug 2021 14:37:58 +0200
Message-Id: <20210831123809.1107782-2-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
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
---
 scripts/qapi/gen.py        |  6 ++----
 scripts/qapi/introspect.py |  6 ++----
 scripts/qapi/schema.py     | 10 +++++++++-
 scripts/qapi/types.py      | 22 ++++++++++------------
 scripts/qapi/visit.py      | 14 ++++++--------
 5 files changed, 29 insertions(+), 29 deletions(-)

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
index bd4233ecee..548bb29961 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -24,8 +24,6 @@
 
 from .common import (
     c_name,
-    gen_endif,
-    gen_if,
     mcgen,
 )
 from .gen import QAPISchemaMonolithicCVisitor
@@ -124,10 +122,10 @@ def indent(level: int) -> str:
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
index db9ff95bd1..b358dbbc8d 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -18,8 +18,6 @@
 from .common import (
     c_enum_const,
     c_name,
-    gen_endif,
-    gen_if,
     mcgen,
 )
 from .gen import QAPISchemaModularCVisitor, ifcontext
@@ -51,13 +49,13 @@ def gen_enum_lookup(name: str,
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
@@ -81,12 +79,12 @@ def gen_enum(name: str,
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
@@ -126,7 +124,7 @@ def gen_array(name: str, element_type: QAPISchemaType) -> str:
 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     ret = ''
     for memb in members:
-        ret += gen_if(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_if()
         if memb.optional:
             ret += mcgen('''
     bool has_%(c_name)s;
@@ -136,7 +134,7 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     %(c_type)s %(c_name)s;
 ''',
                      c_type=memb.type.c_type(), c_name=c_name(memb.name))
-        ret += gen_endif(memb.ifcond.cgen())
+        ret += memb.ifcond.gen_endif()
     return ret
 
 
@@ -159,7 +157,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 
 ''')
-    ret += gen_if(ifcond.cgen())
+    ret += ifcond.gen_if()
     ret += mcgen('''
 struct %(c_name)s {
 ''',
@@ -193,7 +191,7 @@ def gen_object(name: str, ifcond: QAPISchemaIfCond,
     ret += mcgen('''
 };
 ''')
-    ret += gen_endif(ifcond.cgen())
+    ret += ifcond.gen_endif()
 
     return ret
 
@@ -220,13 +218,13 @@ def gen_variants(variants: QAPISchemaVariants) -> str:
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


