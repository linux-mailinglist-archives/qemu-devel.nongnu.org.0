Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9F54F783
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:28:26 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2B5N-0001vQ-7d
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Awy-0001Ou-4w
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Aww-0004ym-7F
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkZTj+cIpLYJ1gsONDWzgyizG72ZOWTMjnB8hK2Ha8s=;
 b=Wrbn59C91IDTiMy4BpVSWiBaElca95UULpWGeAtd6MKPS2ntff8b6fmf+bx+NUjw7gx956
 ZdaAjcmcsosaHfNoJx/NP5fxpLiEKzHAGNRy7QLWywwIsG3pQkNLPx29j7lM7qcAnOhgAm
 BR7snEX8Km+3fphFqPxywkcOXX7Z0+w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-j9F2u_t5PGWc2vfpiwaxng-1; Fri, 17 Jun 2022 08:19:40 -0400
X-MC-Unique: j9F2u_t5PGWc2vfpiwaxng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C73433C0D85D
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:39 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FF7B40334E;
 Fri, 17 Jun 2022 12:19:38 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 2/8] qapi: golang: Generate qapi's alternate types in Go
Date: Fri, 17 Jun 2022 14:19:26 +0200
Message-Id: <20220617121932.249381-3-victortoso@redhat.com>
In-Reply-To: <20220617121932.249381-1-victortoso@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch handles QAPI alternate types and generates data structures
in Go that handles it.

At this moment, there are 5 alternates in qemu/qapi, they are:
 * BlockDirtyBitmapMergeSource
 * Qcow2OverlapChecks
 * BlockdevRef
 * BlockdevRefOrNull
 * StrOrNull

Alternate types are similar to Union but without a discriminator that
can be used to identify the underlying value on the wire. It is needed
to infer it. In Go, all the types are mapped as optional fields and
Marshal and Unmarshal methods will be handling the data checks.

Example:

qapi:
  | { 'alternate': 'BlockdevRef',
  |   'data': { 'definition': 'BlockdevOptions',
  |             'reference': 'str' } }

go:
  | type BlockdevRef struct {
  |         Definition *BlockdevOptions
  |         Reference  *string
  | }

usage:
  | input := `{"driver":"qcow2","data-file":"/some/place/my-image"}`
  | k := BlockdevRef{}
  | err := json.Unmarshal([]byte(input), &k)
  | if err != nil {
  |     panic(err)
  | }
  | // *k.Definition.Qcow2.DataFile.Reference == "/some/place/my-image"

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 119 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index f2776520a1..37d7c062c9 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -29,11 +29,32 @@
 from .source import QAPISourceInfo
 
 
+TEMPLATE_HELPER = '''
+// Alias for go version lower than 1.18
+type Any = interface{}
+
+// Creates a decoder that errors on unknown Fields
+// Returns true if successfully decoded @from string @into type
+// Returns false without error is failed with "unknown field"
+// Returns false with error is a different error was found
+func StrictDecode(into interface{}, from []byte) error {
+    dec := json.NewDecoder(strings.NewReader(string(from)))
+    dec.DisallowUnknownFields()
+
+    if err := dec.Decode(into); err != nil {
+        return err
+    }
+    return nil
+}
+'''
+
+
 class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["enum"]}
+        self.target = {name: "" for name in ["alternate", "enum", "helper"]}
+        self.objects_seen = {}
         self.schema = None
         self.golang_package_name = "qapi"
 
@@ -44,6 +65,8 @@ def visit_begin(self, schema):
         for target in self.target:
             self.target[target] = f"package {self.golang_package_name}\n"
 
+        self.target["helper"] += TEMPLATE_HELPER
+
     def visit_end(self):
         self.schema = None
 
@@ -65,7 +88,69 @@ def visit_alternate_type(self: QAPISchemaGenGolangVisitor,
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants
                              ) -> None:
-        pass
+        assert name not in self.objects_seen
+        self.objects_seen[name] = True
+
+        marshal_return_default = f'nil, errors.New("{name} has empty fields")'
+        marshal_check_fields = ""
+        unmarshal_check_fields = ""
+        variant_fields = ""
+
+        # We need to check if the Alternate type supports NULL as that
+        # means that JSON to Go would allow all fields to be empty.
+        # Alternate that don't support NULL, would fail to convert
+        # to JSON if all fields were empty.
+        return_on_null = f"errors.New(`null not supported for {name}`)"
+
+        # Assembly the fields and all the checks for Marshal and
+        # Unmarshal methods
+        for var in variants.variants:
+            # Nothing to generate on null types. We update some
+            # variables to handle json-null on marshalling methods.
+            if var.type.name == "null":
+                marshal_return_default = '[]byte("null"), nil'
+                return_on_null = "nil"
+                continue
+
+            var_name = qapi_to_field_name(var.name)
+            var_type = qapi_schema_type_to_go_type(var.type.name)
+            variant_fields += f"\t{var_name} *{var_type}\n"
+
+            if len(marshal_check_fields) > 0:
+                marshal_check_fields += "} else "
+
+            marshal_check_fields += f'''if s.{var_name} != nil {{
+        return json.Marshal(s.{var_name})
+    '''
+
+            unmarshal_check_fields += f'''// Check for {var_type}
+        {{
+            s.{var_name} = new({var_type})
+            if err := StrictDecode(s.{var_name}, data); err == nil {{
+                return nil
+            }}
+            s.{var_name} = nil
+        }}
+'''
+
+        marshal_check_fields += "}"
+
+        self.target["alternate"] += generate_struct_type(name, variant_fields)
+        self.target["alternate"] += f'''
+func (s {name}) MarshalJSON() ([]byte, error) {{
+    {marshal_check_fields}
+    return {marshal_return_default}
+}}
+
+func (s *{name}) UnmarshalJSON(data []byte) error {{
+    // Check for json-null first
+    if string(data) == "null" {{
+        return {return_on_null}
+    }}
+    {unmarshal_check_fields}
+    return errors.New(fmt.Sprintf("Can't convert to {name}: %s", string(data)))
+}}
+'''
 
     def visit_enum_type(self: QAPISchemaGenGolangVisitor,
                         name: str,
@@ -130,5 +215,35 @@ def gen_golang(schema: QAPISchema,
     vis.write(output_dir)
 
 
+# Helper function for boxed or self contained structures.
+def generate_struct_type(type_name, args="") -> str:
+    args = args if len(args) == 0 else f"\n{args}\n"
+    return f'''
+type {type_name} struct {{{args}}}
+'''
+
+
+def qapi_schema_type_to_go_type(type: str) -> str:
+    schema_types_to_go = {
+            'str': 'string', 'null': 'nil', 'bool': 'bool', 'number':
+            'float64', 'size': 'uint64', 'int': 'int64', 'int8': 'int8',
+            'int16': 'int16', 'int32': 'int32', 'int64': 'int64', 'uint8':
+            'uint8', 'uint16': 'uint16', 'uint32': 'uint32', 'uint64':
+            'uint64', 'any': 'Any', 'QType': 'QType',
+    }
+
+    prefix = ""
+    if type.endswith("List"):
+        prefix = "[]"
+        type = type[:-4]
+
+    type = schema_types_to_go.get(type, type)
+    return prefix + type
+
+
 def qapi_to_field_name_enum(name: str) -> str:
     return name.title().replace("-", "")
+
+
+def qapi_to_field_name(name: str) -> str:
+    return name.title().replace("_", "").replace("-", "")
-- 
2.36.1


