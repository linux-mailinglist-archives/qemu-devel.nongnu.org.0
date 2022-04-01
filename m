Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47E04EFCE0
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:46:46 +0200 (CEST)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naQ2X-0002cu-Ob
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:46:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxG-0001zz-6W
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxE-0005Pz-ER
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGk99wOZ5GBeeMkIGm0UFq2RzAWQRX/6iGYVGqcKP04=;
 b=ebAHZ7g0ALeWBY71lCOtJ/SqLPi9Qh9uf+zo9cWURPgFEHO1PNlIeu6Tn7xd9afMoFbCa+
 7sQ/i2FbYjolBWZYkPQmboGy2U/uSWfyYNSAMJrxOOWBFLgRrZMFJieNSHX+zOQZ4790oh
 ucmB3sxPanQyQeoHQnFKBnh7sPrfQ/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-LPPDVImwPIu6HBh-4IJmIA-1; Fri, 01 Apr 2022 18:41:12 -0400
X-MC-Unique: LPPDVImwPIu6HBh-4IJmIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25A5C811E76
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:12 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD849E6E;
 Fri,  1 Apr 2022 22:41:10 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 3/8] qapi: golang: Generate qapi's struct types in Go
Date: Sat,  2 Apr 2022 00:40:59 +0200
Message-Id: <20220401224104.145961-4-victortoso@redhat.com>
In-Reply-To: <20220401224104.145961-1-victortoso@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch handles QAPI struct types and generates the equivalent
types in Go.

At the time of this writing, it generates 375 structures.

The highlights of this implementation are:

1. Generating an Go struct that requires a @base type, the @base
   type is embedded in this Go structure.

   Example: See InetSocketAddress with it's base InetSocketAddressBase

2. Differently from previous two types ('enum' and 'alternate'), the
   generated QAPI's struct type do not need to implement Marshaler and
   Unmarshaler interfaces. This generated structures will naturally
   match with JSON Objects.

3. About the Go struct's fields:

  i) They can be either by Value or Reference.

  ii) Every field that is marked as optional in the QAPI specification
  are translated to Reference fields in its Go structure. This design
  decision is the most straightforward way to check if a given field
  was set or not.

  iii) Mandatory fields are always by Value with the exception of QAPI
  arrays, which are handled by Reference (to a block of memory) by Go.

  iv) All the fields are named with Uppercase due Golang's export
  convention.

  v) In order to avoid any kind of issues when encoding ordecoding, to
  or from JSON, we mark all fields with its @name and, when it is
  optional, member, with @omitempty

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 79 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 8be31bd902..50e39f8925 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -31,7 +31,7 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum", "helper"]}
+        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct"]}
         self.objects_seen = {}
         self.schema = None
         self._docmap = {}
@@ -82,7 +82,31 @@ def visit_object_type(self: QAPISchemaGenGolangVisitor,
                           members: List[QAPISchemaObjectTypeMember],
                           variants: Optional[QAPISchemaVariants]
                           ) -> None:
-        pass
+        # Do not handle anything besides structs
+        if (name == self.schema.the_empty_object_type.name or
+                not isinstance(name, str) or
+                info.defn_meta not in ["struct"]):
+            return
+
+        assert name not in self.objects_seen
+        self.objects_seen[name] = True
+
+        # visit all inner objects as well, they are not going to be
+        # called by python's generator.
+        if variants:
+            for var in variants.variants:
+                assert isinstance(var.type, QAPISchemaObjectType)
+                self.visit_object_type(self,
+                                       var.type.name,
+                                       var.type.info,
+                                       var.type.ifcond,
+                                       var.type.base,
+                                       var.type.local_members,
+                                       var.type.variants)
+
+        doc = self._docmap.get(info.defn_name, None)
+        self.target[info.defn_meta] += qapi_to_golang_struct(name, doc, info,
+                ifcond, features, base, members, variants)
 
     def visit_alternate_type(self: QAPISchemaGenGolangVisitor,
                              name: str,
@@ -276,6 +300,14 @@ def gen_golang(schema: QAPISchema,
     schema.visit(vis)
     vis.write(output_dir)
 
+# Helper function for boxed or self contained structures.
+def generate_struct_type(type_name, args="", doc_struct="") -> str:
+    args =  args if len(args) == 0 else f"\n{args}\n"
+    return f'''
+{doc_struct}
+type {type_name} struct {{{args}}}
+'''
+
 def generate_marshal_methods_enum(members: List[QAPISchemaEnumMember]) -> str:
     type = qapi_to_go_type_name(members[0].defined_in, "enum")
 
@@ -345,6 +377,46 @@ def qapi_to_golang_struct_docs(doc: QAPIDoc) -> (str, Dict[str, str]):
 
     return main, fields
 
+# Helper function that is used for most of QAPI types
+def qapi_to_golang_struct(name: str,
+                          doc: QAPIDoc,
+                          info: Optional[QAPISourceInfo],
+                          ifcond: QAPISchemaIfCond,
+                          features: List[QAPISchemaFeature],
+                          base: Optional[QAPISchemaObjectType],
+                          members: List[QAPISchemaObjectTypeMember],
+                          variants: Optional[QAPISchemaVariants]) -> str:
+
+    type_name = qapi_to_go_type_name(name, info.defn_meta)
+    doc_struct, doc_fields = qapi_to_golang_struct_docs(doc)
+
+    base_fields = ""
+    if base:
+        base_type_name = qapi_to_go_type_name(base.name, base.meta)
+        base_fields = f"\t// Base type for this struct\n\t{base_type_name}\n"
+
+    own_fields = ""
+    for memb in members:
+        field = qapi_to_field_name(memb.name)
+        member_type = qapi_schema_type_to_go_type(memb.type.name)
+
+        # In Golang, we are using "encoding/json" library to Marshal and Unmarshal between
+        # over-the-wire QMP and Golang struct. The field tag 'omitempty' does not behave as
+        # expected for some types with default values and they only way to "ignore by default"
+        # unset fields is to have them as reference in the Struct.
+        # This way, a *bool and *int can be ignored where a bool or int might have been set.
+        isptr = "*" if memb.optional and member_type[0] not in "*[" else ""
+        optional = ",omitempty" if memb.optional else ""
+        fieldtag = '`json:"{name}{optional}"`'.format(name=memb.name,optional=optional)
+
+        field_doc = doc_fields.get(memb.name, "")
+        own_fields += f"\t{field} {isptr}{member_type}{fieldtag}{field_doc}\n"
+
+    all_fields = base_fields if len(base_fields) > 0 else ""
+    all_fields += own_fields[:-1] if len(own_fields) > 0 else ""
+
+    return generate_struct_type(type_name, all_fields, doc_struct)
+
 def qapi_schema_type_to_go_type(type: str) -> str:
     schema_types_to_go = {'str': 'string', 'null': 'nil', 'bool': 'bool',
             'number': 'float64', 'size': 'uint64', 'int': 'int64', 'int8': 'int8',
@@ -364,6 +436,9 @@ def qapi_schema_type_to_go_type(type: str) -> str:
 def qapi_to_field_name_enum(name: str) -> str:
     return name.title().replace("-", "")
 
+def qapi_to_field_name(name: str) -> str:
+    return name.title().replace("_", "").replace("-", "")
+
 def qapi_to_go_type_name(name: str, meta: str) -> str:
     if name.startswith("q_obj_"):
         name = name[6:]
-- 
2.35.1


