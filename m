Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9097D4EFCDA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:44:38 +0200 (CEST)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naQ0T-0007m8-Lf
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:44:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxE-0001sr-8l
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxA-0005PX-EQ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ/25VGpLmuwPak1J7FfgNG28lCp3PDDIoaiEuZVhsk=;
 b=d2v1Vnis1gJSTKuC9rJh+lk6BEPQAQcB0BlrHRsxqKi11iwVvjwu+m//PaR8+GI4NytjFq
 /y42X1G9rJvvftWcb52UG1tZW+DQ5hoynhkRoCRMUCbzNyBQyHLu5ZbKHtEsR9GG+snX+3
 ZjX5p1cMCAG3+sjdAs0onFYpKlFnDkQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-GbB08wyQOsqgOZqzZ1E9Yw-1; Fri, 01 Apr 2022 18:41:11 -0400
X-MC-Unique: GbB08wyQOsqgOZqzZ1E9Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFFFC2A2AD40
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:10 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CEF99E6E;
 Fri,  1 Apr 2022 22:41:09 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 2/8] qapi: golang: Generate qapi's alternate types in Go
Date: Sat,  2 Apr 2022 00:40:58 +0200
Message-Id: <20220401224104.145961-3-victortoso@redhat.com>
In-Reply-To: <20220401224104.145961-1-victortoso@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
to infer it. That can't be easily mapped in Go.

For each Alternate type, we will be using a Any type to hold the
value. 'Any' is an alias type for interface{} (similar to void* in C).

Similarly to the Enum types (see previous commit), we will implement
Marshaler and Unmarshaler interfaces for the Alternate types and in
those MarshalJSON() and UnmarshalJSON() methods is where we are going
to put the logic to read/set alternate's value.

Note that on UnmarshalJSON(), a helper function called StrictDecode()
will be used. This function is the main logic to infer if a given JSON
object fits in a given Go struct. Because we only have 5 alternate
types, it is not hard to validate the unmarshaling logic but we might
need to improve it in the future if Alternate with branches that have
similar fields appear.

Examples:
 * BlockdevRef
```go
    // Data to set in BlockdevOptions
    qcow2 := BlockdevOptionsQcow2{}
    // BlockdevRef using a string
    qcow2.File = BlockdevRef{Value: "/some/place/my-image"}
    opt := BlockdevOptions{}
    opt.Driver = BlockdevDriverQcow2
    opt.Value = qcow2

    b, _ := json.Marshal(data.s)
    // string(b) == `{"driver":"qcow2","file":"/some/place/my-image"}`
```

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 157 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 070d4cbbae..8be31bd902 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -31,7 +31,8 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["enum"]}
+        self.target = {name: "" for name in ["alternate", "enum", "helper"]}
+        self.objects_seen = {}
         self.schema = None
         self._docmap = {}
         self.golang_package_name = "qapi"
@@ -43,6 +44,10 @@ def visit_begin(self, schema):
         for target in self.target:
             self.target[target] = f"package {self.golang_package_name}\n"
 
+        self.target["helper"] += f'''
+    // Alias for go version lower than 1.18
+    type Any = interface{{}}'''
+
         # Iterate once in schema.docs to map doc objects to its name
         for doc in schema.docs:
             if doc.symbol is None:
@@ -52,6 +57,22 @@ def visit_begin(self, schema):
     def visit_end(self):
         self.schema = None
 
+        self.target["helper"] += '''
+// Creates a decoder that errors on unknown Fields
+// Returns true if successfully decoded @from string @into type
+// Returns false without error is failed with "unknown field"
+// Returns false with error is a different error was found
+func StrictDecode(into interface{}, from []byte) error {
+	dec := json.NewDecoder(strings.NewReader(string(from)))
+	dec.DisallowUnknownFields()
+
+    if err := dec.Decode(into); err != nil {
+        return err
+    }
+	return nil
+}
+'''
+
     def visit_object_type(self: QAPISchemaGenGolangVisitor,
                           name: str,
                           info: Optional[QAPISourceInfo],
@@ -70,7 +91,123 @@ def visit_alternate_type(self: QAPISchemaGenGolangVisitor,
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants
                              ) -> None:
-        pass
+        assert name not in self.objects_seen
+        self.objects_seen[name] = True
+
+        # Alternate marshal logic
+        #
+        # To avoid programming errors by users of this generated Go module,
+        # we add a runtime check to error out in case the underlying Go type
+        # doesn't not match any of supported types of the Alternate type.
+        #
+        # Also, Golang's json Marshal will include as JSON's object, the
+        # wrapper we use to hold the Go struct (Value Any -> `Value: {...}`)
+        # This would not be an valid QMP message so we workaround it by
+        # calling RemoveValueObject function.
+        doc = self._docmap.get(name, None)
+        doc_struct, doc_fields = qapi_to_golang_struct_docs(doc)
+
+        members_doc = '''// Options are:'''
+        if_supported_types = ""
+        for var in variants.variants:
+            field_doc = doc_fields.get(var.name, "")
+            field_go_type = qapi_schema_type_to_go_type(var.type.name)
+            members_doc += f'''\n// * {var.name} ({field_go_type}):{field_doc[3:]}'''
+
+            if field_go_type == "nil":
+                field_go_type = "*string"
+
+            if_supported_types += f'''typestr != "{field_go_type}" &&\n\t\t'''
+
+        # Alternate unmarshal logic
+        #
+        # With Alternate types, we have to check the JSON data in order to
+        # identify what is the target Go type. So, this is different than an
+        # union which has an identifier that we can check first.
+        # StrictDecode function tries to match the given JSON data to a given
+        # Go type and it'll error in case it doesn´t fit, for instance, when
+        # there were members in the JSON data that had no equivalent in the
+        # target Go type.
+        #
+        # For this reason, the order is important.
+        #
+        # At this moment, the only field that must be checked first is JSON
+        # NULL, which is relevant to a few alternate types. In the future, we
+        # might need to improve the logic to be foolproof between target Go
+        # types that might have a common base (non existing Today).
+        check_type_str = '''
+    // Check for {name}
+    {{
+        var value {go_type}
+        if err := StrictDecode(&value, data); {error_check} {{
+            s.Value = {set_value}
+            return nil
+        }}
+    }}'''
+        reference_checks = ""
+        for var in variants.variants:
+            if var.type.name == "null":
+                # We use a pointer (by referece) to check for JSON's NULL
+                reference_checks += check_type_str.format(
+                        name = var.type.name,
+                        go_type = "*string",
+                        error_check = "err == nil && value == nil",
+                        set_value = "nil")
+                break;
+
+        value_checks = ""
+        for var in variants.variants:
+            if var.type.name != "null":
+                go_type = qapi_schema_type_to_go_type(var.type.name)
+                value_checks += check_type_str.format(
+                        name = var.type.name,
+                        go_type = go_type,
+                        error_check = "err == nil",
+                        set_value = "value")
+
+        unmarshal_checks = ""
+        if len(reference_checks) > 0 and len(value_checks) > 0:
+            unmarshal_checks = reference_checks[1:] + value_checks
+        else:
+            unmarshal_checks = reference_checks[1:] if len(reference_checks) > 0 else value_checks[1:]
+
+        self.target["alternate"] += f'''
+{doc_struct}
+type {name} struct {{
+{members_doc}
+    Value Any
+}}
+
+func (s {name}) MarshalJSON() ([]byte, error) {{
+    typestr := fmt.Sprintf("%T", s.Value)
+    typestr = typestr[strings.LastIndex(typestr, ".")+1:]
+
+    // Runtime check for supported types
+    if typestr != "<nil>" &&
+{if_supported_types[:-6]} {{
+        return nil, errors.New(fmt.Sprintf("Type is not supported: %s", typestr))
+    }}
+
+    b, err := json.Marshal(s.Value);
+    if err != nil {{
+        return nil, err
+    }}
+
+    return b, nil
+}}
+
+func (s *{name}) UnmarshalJSON(data []byte) error {{
+{unmarshal_checks}
+    // Check type to error out nicely
+    {{
+        var value Any
+        if err := json.Unmarshal(data, &value); err != nil {{
+            return err
+        }}
+        return errors.New(fmt.Sprintf("Unsupported type %T (value: %v)", value, value))
+    }}
+}}
+'''
 
     def visit_enum_type(self: QAPISchemaGenGolangVisitor,
                         name: str,
@@ -208,6 +345,22 @@ def qapi_to_golang_struct_docs(doc: QAPIDoc) -> (str, Dict[str, str]):
 
     return main, fields
 
+def qapi_schema_type_to_go_type(type: str) -> str:
+    schema_types_to_go = {'str': 'string', 'null': 'nil', 'bool': 'bool',
+            'number': 'float64', 'size': 'uint64', 'int': 'int64', 'int8': 'int8',
+            'int16': 'int16', 'int32': 'int32', 'int64': 'int64', 'uint8': 'uint8',
+            'uint16': 'uint16', 'uint32': 'uint32', 'uint64': 'uint64',
+            'any': 'Any', 'QType': 'QType',
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
 def qapi_to_field_name_enum(name: str) -> str:
     return name.title().replace("-", "")
 
-- 
2.35.1


