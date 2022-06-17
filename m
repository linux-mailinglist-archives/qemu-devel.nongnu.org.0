Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E441754F7AC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:34:33 +0200 (CEST)
Received: from localhost ([::1]:55354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BBI-0006cI-F8
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax0-0001Um-HO
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Awy-0004zB-K9
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxLiIhoCRhDUEQB4LloOvnDaqMfE1O9VhJfYCIPTDo8=;
 b=G+tiHRISFAnzy4F/+fGUP8ST47KuSLD9DCID/Ue4ZodGor8qJl9kJnGLdbYFi5gMRYx7R8
 t+yup+L1/B0eDpYqiO593Zx/eGC965Hk3kvvea/hvLb5Zy+blTYE6J0rVItWNjmLf00TVj
 gu43ZmcGCIJLose6GzkfcJq5tLr9Rgk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-8aETMbMJOzW40n0xVbxtbw-1; Fri, 17 Jun 2022 08:19:42 -0400
X-MC-Unique: 8aETMbMJOzW40n0xVbxtbw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10474811E76
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:42 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 337CA40334E;
 Fri, 17 Jun 2022 12:19:40 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 3/8] qapi: golang: Generate qapi's struct types in Go
Date: Fri, 17 Jun 2022 14:19:27 +0200
Message-Id: <20220617121932.249381-4-victortoso@redhat.com>
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

This patch handles QAPI struct types and generates the equivalent
types in Go.

At the time of this writing, it generates 388 structures.

The highlights of this implementation are:

1. Generating an Go struct that requires a @base type, the @base type
   fields are copied over to the Go struct. The advantage of this
   approach is to not have embed structs in any of the QAPI types.
   The downside are some generated Types that are likely useless now,
   like InetSocketAddressBase from InetSocketAddress.

2. About the Go struct's fields:

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

Example:

qapi:
  | { 'struct': 'BlockdevCreateOptionsFile',
  |   'data': { 'filename':             'str',
  |             'size':                 'size',
  |             '*preallocation':       'PreallocMode',
  |             '*nocow':               'bool',
  |             '*extent-size-hint':    'size'} }

go:
  | type BlockdevCreateOptionsFile struct {
  |         Filename       string        `json:"filename"`
  |         Size           uint64        `json:"size"`
  |         Preallocation  *PreallocMode `json:"preallocation,omitempty"`
  |         Nocow          *bool         `json:"nocow,omitempty"`
  |         ExtentSizeHint *uint64       `json:"extent-size-hint,omitempty"`
  | }

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 117 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 37d7c062c9..1ab0c0bb46 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -53,7 +53,7 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum", "helper"]}
+        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct"]}
         self.objects_seen = {}
         self.schema = None
         self.golang_package_name = "qapi"
@@ -79,7 +79,37 @@ def visit_object_type(self: QAPISchemaGenGolangVisitor,
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
+        # Safety checks.
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
+        # Save generated Go code to be written later
+        self.target[info.defn_meta] += qapi_to_golang_struct(name,
+                                                             info,
+                                                             ifcond,
+                                                             features,
+                                                             base,
+                                                             members,
+                                                             variants)
 
     def visit_alternate_type(self: QAPISchemaGenGolangVisitor,
                              name: str,
@@ -223,6 +253,72 @@ def generate_struct_type(type_name, args="") -> str:
 '''
 
 
+# Helper function that is used for most of QAPI types
+def qapi_to_golang_struct(name: str,
+                          info: Optional[QAPISourceInfo],
+                          ifcond: QAPISchemaIfCond,
+                          features: List[QAPISchemaFeature],
+                          base: Optional[QAPISchemaObjectType],
+                          members: List[QAPISchemaObjectTypeMember],
+                          variants: Optional[QAPISchemaVariants]) -> str:
+
+    type_name = qapi_to_go_type_name(name, info.defn_meta)
+
+    fields = ""
+
+    if base:
+        base_fields = ""
+        for lm in base.local_members:
+            # We do not include the Union's discriminator
+            # into the generated Go struct as the selection
+            # of what variant was set is enough on Go side.
+            if variants and variants.tag_member.name == lm.name:
+                continue
+
+            field = qapi_to_field_name(lm.name)
+            member_type = qapi_schema_type_to_go_type(lm.type.name)
+
+            isptr = "*" if lm.optional and member_type[0] not in "*[" else ""
+            optional = ",omitempty" if lm.optional else ""
+            fieldtag = f'`json:"{lm.name}{optional}"`'
+
+            base_fields += f"\t{field} {isptr}{member_type}{fieldtag}\n"
+
+        if len(base_fields) > 0:
+            fields += f"\t// Base fields\n\t{base_fields}\n"
+
+    if members:
+        for memb in members:
+            field = qapi_to_field_name(memb.name)
+            member_type = qapi_schema_type_to_go_type(memb.type.name)
+
+            isptr = "*" if memb.optional and member_type[0] not in "*[" else ""
+            optional = ",omitempty" if memb.optional else ""
+            fieldtag = f'`json:"{memb.name}{optional}"`'
+
+            fields += f"\t{field} {isptr}{member_type}{fieldtag}\n"
+
+        fields += "\n"
+
+    if variants:
+        fields += "\t// Variants fields\n"
+        for var in variants.variants:
+            if var.type.is_implicit():
+                continue
+
+            field = qapi_to_field_name(var.name)
+            member_type = qapi_schema_type_to_go_type(var.type.name)
+            # Variant's are handled in the Marshal/Unmarshal methods
+            fieldtag = '`json:"-"`'
+            fields += f"\t{field} *{member_type}{fieldtag}\n"
+            member_type = qapi_schema_type_to_go_type(var.type.name)
+            # Variant's are handled in the Marshal/Unmarshal methods
+            fieldtag = '`json:"-"`'
+            fields += f"\t{field} *{member_type}{fieldtag}\n"
+
+    return generate_struct_type(type_name, fields)
+
+
 def qapi_schema_type_to_go_type(type: str) -> str:
     schema_types_to_go = {
             'str': 'string', 'null': 'nil', 'bool': 'bool', 'number':
@@ -247,3 +343,20 @@ def qapi_to_field_name_enum(name: str) -> str:
 
 def qapi_to_field_name(name: str) -> str:
     return name.title().replace("_", "").replace("-", "")
+
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
+    name = words[0]
+    if name.islower() or name.isupper():
+        name = name.title()
+
+    name += ''.join(word.title() for word in words[1:])
+    return name
-- 
2.36.1


