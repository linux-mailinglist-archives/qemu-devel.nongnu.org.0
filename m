Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCE4EFCDE
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:45:05 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naQ0u-00008O-7t
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:45:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxI-000250-0y
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxG-0005QL-57
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSFfrvWh1Xt40OQDhsyiB4ZhWoJF6DziWwoJBjKGkdo=;
 b=QRwY0L3IqMZSyZDhVd6sLsc7D103hhxcCwwJSuMwnMh9LHXoFWiAu2VXFjhcpeK8ILQr5e
 C7EP54yFrWo7rlFs4GAAtgLHYHqWQWwHWmdewIKkvvg+XBcG9N6KnaOLbBGafQPaGB+0Jw
 Y21Pvr0hJ1DGxLNZIC4lK2KftYKeWRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-wJxMd-U9OUCjuSqYIGXh5Q-1; Fri, 01 Apr 2022 18:41:14 -0400
X-MC-Unique: wJxMd-U9OUCjuSqYIGXh5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23883802803
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:14 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85AA49E6A;
 Fri,  1 Apr 2022 22:41:12 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 4/8] qapi: golang: Generate qapi's union types in Go
Date: Sat,  2 Apr 2022 00:41:00 +0200
Message-Id: <20220401224104.145961-5-victortoso@redhat.com>
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

This patch handles QAPI union types and generates the equivalent data
structures and methods in Go to handle it.

At the moment of this writing, it generates 67 structures.

The QAPI union type can be summarized by its common members that are
defined in a @base struct and a @value. The @value type can vary and
depends on @base's field that we call @discriminator. The
@discriminator is always a Enum type.

Golang does not have Unions. The generation of QAPI union type in Go
with this patch, follows similar approach to what is done for QAPI
struct types and QAPI alternate types.

Similarly to Go implementation of QAPI alternate types, we will
implement the Marshaler and Unmarshaler interfaces to seamless decode
from JSON objects to Golang structs and vice versa.

Similarly to Go implementation of QAPI struct types, we will need to
tag @base fields accordingly.

The embedded documentation in Golang's structures and fields are
particularly important here, to help developers know what Types to use
for @value. Runtime checks too.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 124 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 50e39f8925..0a1bf430ba 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -31,7 +31,7 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct"]}
+        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct", "union"]}
         self.objects_seen = {}
         self.schema = None
         self._docmap = {}
@@ -82,10 +82,10 @@ def visit_object_type(self: QAPISchemaGenGolangVisitor,
                           members: List[QAPISchemaObjectTypeMember],
                           variants: Optional[QAPISchemaVariants]
                           ) -> None:
-        # Do not handle anything besides structs
+        # Do not handle anything besides struct and unions.
         if (name == self.schema.the_empty_object_type.name or
                 not isinstance(name, str) or
-                info.defn_meta not in ["struct"]):
+                info.defn_meta not in ["struct", "union"]):
             return
 
         assert name not in self.objects_seen
@@ -351,6 +351,93 @@ def generate_marshal_methods_enum(members: List[QAPISchemaEnumMember]) -> str:
 }}
 '''
 
+# Marshal methods for Union types
+def generate_marshal_methods(type: str,
+                             type_dict: Dict[str, str],
+                             discriminator: str = "",
+                             base: str = "") -> str:
+    assert base != ""
+    discriminator = "base." + discriminator
+
+    switch_case_format = '''
+    case {name}:
+        value := {case_type}{{}}
+        if err := json.Unmarshal(data, &value); err != nil {{
+            return err
+        }}
+        s.Value = value'''
+
+    if_supported_types = ""
+    added = {}
+    switch_cases = ""
+    for name in sorted(type_dict):
+        case_type = type_dict[name]
+        isptr = "*" if case_type[0] not in "*[" else ""
+        switch_cases += switch_case_format.format(name = name,
+                                                  case_type = case_type)
+        if case_type not in added:
+            if_supported_types += f'''typestr != "{case_type}" &&\n\t\t'''
+            added[case_type] = True
+
+    marshalfn = f'''
+func (s {type}) MarshalJSON() ([]byte, error) {{
+	base, err := json.Marshal(s.{base})
+	if err != nil {{
+		return nil, err
+	}}
+
+    typestr := fmt.Sprintf("%T", s.Value)
+    typestr = typestr[strings.LastIndex(typestr, ".")+1:]
+
+    // "The branches need not cover all possible enum values"
+    // This means that on Marshal, we can safely ignore empty values
+    if typestr == "<nil>" {{
+        return []byte(base), nil
+    }}
+
+    // Runtime check for supported value types
+    if {if_supported_types[:-6]} {{
+        return nil, errors.New(fmt.Sprintf("Type is not supported: %s", typestr))
+    }}
+	value, err := json.Marshal(s.Value)
+	if err != nil {{
+		return nil, err
+	}}
+
+    // Workaround to avoid checking s.Value being empty
+    if string(value) == "{{}}" {{
+        return []byte(base), nil
+    }}
+
+    // Removes the last '}}' from base and the first '{{' from value, in order to
+    // return a single JSON object.
+    result := fmt.Sprintf("%s,%s", base[:len(base)-1], value[1:])
+    return []byte(result), nil
+}}
+'''
+    unmarshal_base = f'''
+    var base {base}
+    if err := json.Unmarshal(data, &base); err != nil {{
+        return err
+    }}
+    s.{base} = base
+'''
+    unmarshal_default_warn = f'''
+    default:
+        fmt.Println("Failed to decode {type}", {discriminator})'''
+
+    return f'''{marshalfn}
+func (s *{type}) UnmarshalJSON(data []byte) error {{
+    {unmarshal_base}
+    switch {discriminator} {{
+{switch_cases[1:]}
+    {unmarshal_default_warn}
+    }}
+
+    return nil
+}}
+'''
+
 # Takes the documentation object of a specific type and returns
 # that type's documentation followed by its member's docs.
 def qapi_to_golang_struct_docs(doc: QAPIDoc) -> (str, Dict[str, str]):
@@ -412,10 +499,37 @@ def qapi_to_golang_struct(name: str,
         field_doc = doc_fields.get(memb.name, "")
         own_fields += f"\t{field} {isptr}{member_type}{fieldtag}{field_doc}\n"
 
+    union_types = {}
+    variant_fields = ""
+    if variants:
+        variant_fields = f"// Value based on @{variants.tag_member.name}, possible types:"
+        for var in variants.variants:
+            if var.type.is_implicit():
+                continue
+
+            name = variants.tag_member._type_name + var.name.title().replace("-", "")
+            union_types[name] = var.type.name
+            variant_fields += f"\n\t// * {var.type.c_unboxed_type()}"
+
+        variant_fields += f"\n\tValue Any"
+
     all_fields = base_fields if len(base_fields) > 0 else ""
     all_fields += own_fields[:-1] if len(own_fields) > 0 else ""
-
-    return generate_struct_type(type_name, all_fields, doc_struct)
+    all_fields += variant_fields if len(variant_fields) > 0 else ""
+
+    unmarshal_fn = ""
+    if info.defn_meta == "union" and variants is not None:
+        # Union's without variants are the Union's base data structure.
+        # e.g: SchemaInfo's base is SchemainfoBase.
+        discriminator = qapi_to_field_name(variants.tag_member.name)
+        base = qapi_to_go_type_name(variants.tag_member.defined_in,
+                                    variants.tag_member.info.defn_meta)
+        unmarshal_fn = generate_marshal_methods(type_name,
+                                                union_types,
+                                                discriminator = discriminator,
+                                                base = base_type_name)
+
+    return generate_struct_type(type_name, all_fields, doc_struct) + unmarshal_fn
 
 def qapi_schema_type_to_go_type(type: str) -> str:
     schema_types_to_go = {'str': 'string', 'null': 'nil', 'bool': 'bool',
-- 
2.35.1


