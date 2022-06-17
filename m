Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB5254F796
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:29:39 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2B6Y-0002xj-8t
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2AxK-0001si-2Z
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax2-00050P-D6
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vakw/pNnC3CkaE/+zF+/jES8tUNyN0HAQuQGUIPmDq0=;
 b=ATuZXhyAaElM38ZDe/fdXKcGz7mcrNBkbK8RIX3fojcrmaa0mdocjlwvi5UqmiCQOODGx5
 8sB7hVmkp0c7FgJhzlFCAOwG0e2PAkn3vK11C92JdyI7IEqvoOrgkWFd5tKjdAKctKQAJo
 5Ui2JGOkNk1pMKDVVyEwxtnfqw8kFiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-njIXm4cTP_eJ9TaSBzjMRQ-1; Fri, 17 Jun 2022 08:19:39 -0400
X-MC-Unique: njIXm4cTP_eJ9TaSBzjMRQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3A77801756
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:37 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3422440334E;
 Fri, 17 Jun 2022 12:19:36 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 1/8] qapi: golang: Generate qapi's enum types in Go
Date: Fri, 17 Jun 2022 14:19:25 +0200
Message-Id: <20220617121932.249381-2-victortoso@redhat.com>
In-Reply-To: <20220617121932.249381-1-victortoso@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch handles QAPI enum types and generates its equivalent in Go.

Basically, Enums are being handled as strings in Golang.

1. For each QAPI enum, we will define a string type in Go to be the
   assigned type of this specific enum.

2. Naming: CamelCase will be used in any identifier that we want to
   export [0], which is everything.

[0] https://go.dev/ref/spec#Exported_identifiers

Example:

qapi:
  | { 'enum': 'DisplayProtocol',
  |   'data': [ 'vnc', 'spice' ] }

go:
  | type DisplayProtocol string
  |
  | const (
  |     DisplayProtocolVnc   DisplayProtocol = "vnc"
  |     DisplayProtocolSpice DisplayProtocol = "spice"
  | )

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 134 +++++++++++++++++++++++++++++++++++++++++
 scripts/qapi/main.py   |   2 +
 2 files changed, 136 insertions(+)
 create mode 100644 scripts/qapi/golang.py

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
new file mode 100644
index 0000000000..f2776520a1
--- /dev/null
+++ b/scripts/qapi/golang.py
@@ -0,0 +1,134 @@
+"""
+Golang QAPI generator
+"""
+# Copyright (c) 2022 Red Hat Inc.
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
+from typing import List, Optional
+
+from .schema import (
+    QAPISchema,
+    QAPISchemaType,
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
+
+class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
+
+    def __init__(self, prefix: str):
+        super().__init__()
+        self.target = {name: "" for name in ["enum"]}
+        self.schema = None
+        self.golang_package_name = "qapi"
+
+    def visit_begin(self, schema):
+        self.schema = schema
+
+        # Every Go file needs to reference its package name
+        for target in self.target:
+            self.target[target] = f"package {self.golang_package_name}\n"
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
+
+        value = qapi_to_field_name_enum(members[0].name)
+        fields = ""
+        for member in members:
+            value = qapi_to_field_name_enum(member.name)
+            fields += f'''\t{name}{value} {name} = "{member.name}"\n'''
+
+        self.target["enum"] += f'''
+type {name} string
+const (
+{fields[:-1]}
+)
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
+
+def qapi_to_field_name_enum(name: str) -> str:
+    return name.title().replace("-", "")
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
2.36.1


