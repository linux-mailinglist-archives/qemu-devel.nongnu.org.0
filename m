Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C638C4EFCD6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:42:56 +0200 (CEST)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naPyp-0003wD-1b
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:42:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxD-0001t3-L6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxA-0005PF-9l
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6xH/5BPizyYOOs1YymptuSXhHP4izaoxIpDOPlhO/g=;
 b=PBXLxbA7pZPxjSbi2nCnkFnFFUGvWh77yJ1RuJW6gh4BSBOzjG5WY6EKCDmHq9Nm72wWt4
 3WMOi6xkT2Bf8n1hnwsm5Ee3so7Dl5ZkzYxkeFA4pSwWQOv4kdkgxlIXcS+ETGcpGEYOIW
 Wllh/4sUQOaFH0B/2GGWtPy7mFR2sQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-rB3AQGIhNnCNt_a197Kffg-1; Fri, 01 Apr 2022 18:41:09 -0400
X-MC-Unique: rB3AQGIhNnCNt_a197Kffg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D99D185A7BA
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:09 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3B579D70;
 Fri,  1 Apr 2022 22:41:07 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 1/8] qapi: golang: Generate qapi's enum types in Go
Date: Sat,  2 Apr 2022 00:40:57 +0200
Message-Id: <20220401224104.145961-2-victortoso@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This patch handles QAPI enum types and generates its equivalent in Go.

The highlights of this implementation are:

1. For each QAPI enum, we will define an int32 type in Go to be the
   assigned type of this specific enum

2. While in the Go codebase we can use the generated enum values, the
   specification requires that, on the wire, the enumeration type's
   value to be represented by its string name.

   For this reason, each Go type that represent's a QAPI enum will be
   implementing the Marshaler[0] and Unmarshaler[1] interfaces to
   seamless handle QMP's string to Go int32 value and vice-versa.

3. Naming: CamelCase will be used in any identifier that we want to
   export [2], which is everything in this patch.

[0] https://pkg.go.dev/encoding/json#Marshaler
[1] https://pkg.go.dev/encoding/json#Unmarshaler
[2] https://go.dev/ref/spec#Exported_identifiers

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/meson.build       |   1 +
 scripts/qapi/golang.py | 225 +++++++++++++++++++++++++++++++++++++++++
 scripts/qapi/main.py   |   2 +
 3 files changed, 228 insertions(+)
 create mode 100644 scripts/qapi/golang.py

diff --git a/qapi/meson.build b/qapi/meson.build
index 656ef0e039..0951692332 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -90,6 +90,7 @@ qapi_nonmodule_outputs = [
   'qapi-init-commands.h', 'qapi-init-commands.c',
   'qapi-events.h', 'qapi-events.c',
   'qapi-emit-events.c', 'qapi-emit-events.h',
+  'qapibara.go',
 ]
 
 # First build all sources
diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
new file mode 100644
index 0000000000..070d4cbbae
--- /dev/null
+++ b/scripts/qapi/golang.py
@@ -0,0 +1,225 @@
+"""
+Golang QAPI generator
+"""
+# Copyright (c) 2021 Red Hat Inc.
+#
+# Authors:
+#  Victor Toso <victortoso@redhat.com>
+# 
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+# Just for type hint on self
+from __future__ import annotations
+
+import os
+from typing import Dict, List, Optional
+
+from .schema import (
+    QAPISchema,
+    QAPISchemaVisitor,
+    QAPISchemaEnumMember,
+    QAPISchemaFeature,
+    QAPISchemaIfCond,
+    QAPISchemaObjectType,
+    QAPISchemaObjectTypeMember,
+    QAPISchemaVariants,
+)
+from .source import QAPISourceInfo
+
+class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
+
+    def __init__(self, prefix: str):
+        super().__init__()
+        self.target = {name: "" for name in ["enum"]}
+        self.schema = None
+        self._docmap = {}
+        self.golang_package_name = "qapi"
+
+    def visit_begin(self, schema):
+        self.schema = schema
+
+        # Every Go file needs to reference its package name
+        for target in self.target:
+            self.target[target] = f"package {self.golang_package_name}\n"
+
+        # Iterate once in schema.docs to map doc objects to its name
+        for doc in schema.docs:
+            if doc.symbol is None:
+                continue
+            self._docmap[doc.symbol] = doc
+
+    def visit_end(self):
+        self.schema = None
+
+    def visit_object_type(self: QAPISchemaGenGolangVisitor,
+                          name: str,
+                          info: Optional[QAPISourceInfo],
+                          ifcond: QAPISchemaIfCond,
+                          features: List[QAPISchemaFeature],
+                          base: Optional[QAPISchemaObjectType],
+                          members: List[QAPISchemaObjectTypeMember],
+                          variants: Optional[QAPISchemaVariants]
+                          ) -> None:
+        pass
+
+    def visit_alternate_type(self: QAPISchemaGenGolangVisitor,
+                             name: str,
+                             info: Optional[QAPISourceInfo],
+                             ifcond: QAPISchemaIfCond,
+                             features: List[QAPISchemaFeature],
+                             variants: QAPISchemaVariants
+                             ) -> None:
+        pass
+
+    def visit_enum_type(self: QAPISchemaGenGolangVisitor,
+                        name: str,
+                        info: Optional[QAPISourceInfo],
+                        ifcond: QAPISchemaIfCond,
+                        features: List[QAPISchemaFeature],
+                        members: List[QAPISchemaEnumMember],
+                        prefix: Optional[str]
+                        ) -> None:
+        doc = self._docmap.get(name, None)
+        doc_struct, doc_fields = qapi_to_golang_struct_docs(doc)
+
+        value = qapi_to_field_name_enum(members[0].name)
+        fields = f"\t{name}{value} {name} = iota\n"
+        for member in members[1:]:
+            field_doc = " " + doc_fields.get(member.name, "") if doc_fields else ""
+            value = qapi_to_field_name_enum(member.name)
+            fields += f"\t{name}{value}{field_doc}\n"
+
+        self.target["enum"] += f'''
+{doc_struct}
+type {name} int32
+const (
+{fields[:-1]}
+)
+{generate_marshal_methods_enum(members)}
+'''
+
+    def visit_array_type(self, name, info, ifcond, element_type):
+        pass
+
+    def visit_command(self,
+                      name: str,
+                      info: Optional[QAPISourceInfo],
+                      ifcond: QAPISchemaIfCond,
+                      features: List[QAPISchemaFeature],
+                      arg_type: Optional[QAPISchemaObjectType],
+                      ret_type: Optional[QAPISchemaType],
+                      gen: bool,
+                      success_response: bool,
+                      boxed: bool,
+                      allow_oob: bool,
+                      allow_preconfig: bool,
+                      coroutine: bool) -> None:
+        pass
+
+    def visit_event(self, name, info, ifcond, features, arg_type, boxed):
+        pass
+
+    def write(self, output_dir: str) -> None:
+        for module_name, content in self.target.items():
+            go_module = module_name + "s.go"
+            go_dir = "go"
+            pathname = os.path.join(output_dir, go_dir, go_module)
+            odir = os.path.dirname(pathname)
+            os.makedirs(odir, exist_ok=True)
+
+            with open(pathname, "w") as outfile:
+                outfile.write(content)
+
+
+def gen_golang(schema: QAPISchema,
+               output_dir: str,
+               prefix: str) -> None:
+    vis = QAPISchemaGenGolangVisitor(prefix)
+    schema.visit(vis)
+    vis.write(output_dir)
+
+def generate_marshal_methods_enum(members: List[QAPISchemaEnumMember]) -> str:
+    type = qapi_to_go_type_name(members[0].defined_in, "enum")
+
+    marshal_switch_cases = ""
+    unmarshal_switch_cases = ""
+    for i in range(len(members)):
+        go_type = type + qapi_to_field_name_enum(members[i].name)
+        name = members[i].name
+
+        marshal_switch_cases += f'''
+    case {go_type}:
+        return []byte(`"{name}"`), nil'''
+
+        unmarshal_switch_cases += f'''
+    case "{name}":
+        (*s) = {go_type}'''
+
+    return f'''
+func (s {type}) MarshalJSON() ([]byte, error) {{
+    switch s {{
+{marshal_switch_cases[1:]}
+    default:
+        fmt.Println("Failed to decode {type}", s)
+    }}
+    return nil, errors.New("Failed")
+}}
+
+func (s *{type}) UnmarshalJSON(data []byte) error {{
+    var name string
+
+    if err := json.Unmarshal(data, &name); err != nil {{
+        return err
+    }}
+
+    switch name {{
+{unmarshal_switch_cases[1:]}
+    default:
+        fmt.Println("Failed to decode {type}", *s)
+    }}
+    return nil
+}}
+'''
+
+# Takes the documentation object of a specific type and returns
+# that type's documentation followed by its member's docs.
+def qapi_to_golang_struct_docs(doc: QAPIDoc) -> (str, Dict[str, str]):
+    if doc is None:
+        return "// No documentation available", None
+
+    main = ""
+    if len(doc.body.text) > 0:
+        main = f"// {doc.body.text}".replace("\n", "\n// ")
+
+    for section in doc.sections:
+        # Skip sections that are not useful for Golang consumers
+        if section.name and "TODO" in section.name:
+            continue
+
+        # Small hack to only add // when doc.body.text was empty
+        prefix = "// " if len(main) == 0 else "\n\n"
+        main += f"{prefix}{section.name}: {section.text}".replace("\n", "\n// ")
+
+    fields = {}
+    for key, value in doc.args.items():
+        if len(value.text) > 0:
+            fields[key] = " // " + ' '.join(value.text.replace("\n", " ").split())
+
+    return main, fields
+
+def qapi_to_field_name_enum(name: str) -> str:
+    return name.title().replace("-", "")
+
+def qapi_to_go_type_name(name: str, meta: str) -> str:
+    if name.startswith("q_obj_"):
+        name = name[6:]
+
+    # We want to keep CamelCase for Golang types. We want to avoid removing
+    # already set CameCase names while fixing uppercase ones, eg:
+    # 1) q_obj_SocketAddress_base -> SocketAddressBase
+    # 2) q_obj_WATCHDOG-arg -> WatchdogArg
+    words = [word for word in name.replace("_", "-").split("-")]
+    name = words[0].title() if words[0].islower() or words[0].isupper() else words[0]
+    name += ''.join(word.title() for word in words[1:])
+    return name
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index fc216a53d3..661fb1e091 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -15,6 +15,7 @@
 from .common import must_match
 from .error import QAPIError
 from .events import gen_events
+from .golang import gen_golang
 from .introspect import gen_introspect
 from .schema import QAPISchema
 from .types import gen_types
@@ -54,6 +55,7 @@ def generate(schema_file: str,
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
+    gen_golang(schema, output_dir, prefix)
 
 def main() -> int:
     """
-- 
2.35.1


