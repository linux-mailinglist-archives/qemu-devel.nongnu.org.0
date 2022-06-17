Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB454F784
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:28:31 +0200 (CEST)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2B5S-00025F-7N
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax2-0001Z8-EV
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax0-0004zm-DU
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWBkF88ZLS2dEY/eZXueOzV74Qv41we61gYIwdDw3kw=;
 b=Dm0bt9ffv1xshnBt8uGWskQbmNCKckeqLQkmle/rFHaIui3L5sRoH8Lv6nAgEw3ENiK4VV
 zvb1PvGFyadF6O64XfYLT9UQQSbaCsl7bxMd5dX+jYrSYrgew7p5L9dPDLvAFjY71+hfYH
 jLXDDmn7SQi8f/UHcRz01RDzgnCp/iA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-oOFd9xP6OLiKf63y5FtvuQ-1; Fri, 17 Jun 2022 08:19:44 -0400
X-MC-Unique: oOFd9xP6OLiKf63y5FtvuQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 353C41C01B23
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:44 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7067140334E;
 Fri, 17 Jun 2022 12:19:42 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Date: Fri, 17 Jun 2022 14:19:28 +0200
Message-Id: <20220617121932.249381-5-victortoso@redhat.com>
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

This patch handles QAPI union types and generates the equivalent data
structures and methods in Go to handle it.

At the moment of this writing, it generates 38 structures.

The QAPI union type has two types of fields: The @base and the
@variants members. The @base fields can be considered common members
for the union while only one field maximum is set for the @variants.

In the QAPI specification, it defines a @discriminator field, which is
an Enum type. The purpose of the  @discriminator is to identify which
@variant type is being used. The @discriminator is not used in the
generated union Go structs as it suffices to check which one of the
@variants fields were set.

The union types implement the Marshaler and Unmarshaler interfaces to
seamless decode from JSON objects to Golang structs and vice versa.

qapi:
  | { 'union': 'SetPasswordOptions',
  |   'base': { 'protocol': 'DisplayProtocol',
  |             'password': 'str',
  |             '*connected': 'SetPasswordAction' },
  |   'discriminator': 'protocol',
  |   'data': { 'vnc': 'SetPasswordOptionsVnc' } }

go:
  | type SetPasswordOptions struct {
  | 	// Base fields
  | 	Password  string             `json:"password"`
  | 	Connected *SetPasswordAction `json:"connected,omitempty"`
  |
  | 	// Variants fields
  | 	Vnc *SetPasswordOptionsVnc `json:"-"`
  | }

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 112 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 105 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 1ab0c0bb46..6c6a5cea97 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -53,7 +53,8 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct"]}
+        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct",
+                                             "union"]}
         self.objects_seen = {}
         self.schema = None
         self.golang_package_name = "qapi"
@@ -79,10 +80,14 @@ def visit_object_type(self: QAPISchemaGenGolangVisitor,
                           members: List[QAPISchemaObjectTypeMember],
                           variants: Optional[QAPISchemaVariants]
                           ) -> None:
-        # Do not handle anything besides structs
+        # Do not handle anything besides struct and unions.
         if (name == self.schema.the_empty_object_type.name or
                 not isinstance(name, str) or
-                info.defn_meta not in ["struct"]):
+                info.defn_meta not in ["struct", "union"]):
+            return
+
+        # Base structs are embed
+        if qapi_name_is_base(name):
             return
 
         # Safety checks.
@@ -110,6 +115,10 @@ def visit_object_type(self: QAPISchemaGenGolangVisitor,
                                                              base,
                                                              members,
                                                              variants)
+        if info.defn_meta == "union":
+            self.target[info.defn_meta] += qapi_to_golang_methods_union(name,
+                                                                        info,
+                                                                        variants)
 
     def visit_alternate_type(self: QAPISchemaGenGolangVisitor,
                              name: str,
@@ -311,14 +320,99 @@ def qapi_to_golang_struct(name: str,
             # Variant's are handled in the Marshal/Unmarshal methods
             fieldtag = '`json:"-"`'
             fields += f"\t{field} *{member_type}{fieldtag}\n"
-            member_type = qapi_schema_type_to_go_type(var.type.name)
-            # Variant's are handled in the Marshal/Unmarshal methods
-            fieldtag = '`json:"-"`'
-            fields += f"\t{field} *{member_type}{fieldtag}\n"
 
     return generate_struct_type(type_name, fields)
 
 
+def qapi_to_golang_methods_union(name: str,
+                                 info: Optional[QAPISourceInfo],
+                                 variants: Optional[QAPISchemaVariants]
+                                 ) -> str:
+
+    type_name = qapi_to_go_type_name(name, info.defn_meta)
+
+    driverCases = ""
+    checkFields = ""
+    if variants:
+        for var in variants.variants:
+            if var.type.is_implicit():
+                continue
+
+            field = qapi_to_field_name(var.name)
+            member_type = qapi_schema_type_to_go_type(var.type.name)
+
+            if len(checkFields) > 0:
+                checkFields += "\t} else "
+            checkFields += f'''if s.{field} != nil {{
+        driver = "{var.name}"
+        payload, err = json.Marshal(s.{field})
+'''
+            # for Unmarshal method
+            driverCases += f'''
+    case "{var.name}":
+        s.{field} = new({member_type})
+        if err := json.Unmarshal(data, s.{field}); err != nil {{
+            s.{field} = nil
+            return err
+        }}'''
+
+        checkFields += "}"
+
+    return f'''
+func (s {type_name}) MarshalJSON() ([]byte, error) {{
+    type Alias {type_name}
+    alias := Alias(s)
+    base, err := json.Marshal(alias)
+    if err != nil {{
+        return nil, err
+    }}
+
+    driver := ""
+    payload := []byte{{}}
+    {checkFields}
+
+    if err != nil {{
+        return nil, err
+    }}
+
+    if len(base) == len("{{}}") {{
+        base = []byte("")
+    }} else {{
+        base = append([]byte{{','}}, base[1:len(base)-1]...)
+    }}
+
+    if len(payload) == 0 || len(payload) == len("{{}}") {{
+        payload = []byte("")
+    }} else {{
+        payload = append([]byte{{','}}, payload[1:len(payload)-1]...)
+    }}
+
+    result := fmt.Sprintf(`{{"{variants.tag_member.name}":"%s"%s%s}}`, driver, base, payload)
+    return []byte(result), nil
+}}
+
+func (s *{type_name}) UnmarshalJSON(data []byte) error {{
+    type Alias {type_name}
+    peek := struct {{
+        Alias
+        Driver string `json:"{variants.tag_member.name}"`
+    }}{{}}
+
+
+    if err := json.Unmarshal(data, &peek); err != nil {{
+        return err
+    }}
+    *s = {type_name}(peek.Alias)
+
+    switch peek.Driver {{
+    {driverCases}
+    }}
+    // Unrecognizer drivers are silently ignored.
+    return nil
+}}
+'''
+
+
 def qapi_schema_type_to_go_type(type: str) -> str:
     schema_types_to_go = {
             'str': 'string', 'null': 'nil', 'bool': 'bool', 'number':
@@ -345,6 +439,10 @@ def qapi_to_field_name(name: str) -> str:
     return name.title().replace("_", "").replace("-", "")
 
 
+def qapi_name_is_base(name: str) -> bool:
+    return name.startswith("q_obj_") and name.endswith("-base")
+
+
 def qapi_to_go_type_name(name: str, meta: str) -> str:
     if name.startswith("q_obj_"):
         name = name[6:]
-- 
2.36.1


