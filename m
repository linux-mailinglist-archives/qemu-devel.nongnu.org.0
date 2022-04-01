Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254DE4EFCD8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:43:35 +0200 (CEST)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naPzS-0005Jc-8S
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:43:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxH-00024h-Vy
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxG-0005QI-0P
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=InuXhU4iwrbe0GkBIVkp7McvHI2BOEzzRIPXtveGZxA=;
 b=LgRKSZmzimY4NI7y7yF51e47nUjlJJEnS3q5XjsXuPEds3p/q1k7MpDAcNK/Uu86zEqmqX
 2Q3WBPbcy1XrfUv59nO9UxZOY4DoGivDWnhSzLT/Sgg4ZKtXtkImspJGK6d2dQkkLlHXfs
 6a1sRHnxNMF59qFVtwcq5NltBLi2Owo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-yln5NY0JM8-ywpOYX8FNag-1; Fri, 01 Apr 2022 18:41:16 -0400
X-MC-Unique: yln5NY0JM8-ywpOYX8FNag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E543E185A7A4
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:15 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3AF59E61;
 Fri,  1 Apr 2022 22:41:14 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 5/8] qapi: golang: Generate qapi's event types in Go
Date: Sat,  2 Apr 2022 00:41:01 +0200
Message-Id: <20220401224104.145961-6-victortoso@redhat.com>
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

This patch handles QAPI event types and generates data structures in
Go that handles it.

At the moment of this writing, it generates 51 structures (49 events)

In Golang, each event is handled as a Go structure and there is no big
difference, in the Go generated code, between what is a QAPI event
type and what is a QAPI struct.

Each QAPI event has the suffix 'Event' in its Golang data structure
and contains the fields, mandatory and optional, that can be
sent or received.

In addition, there are two structures added to handle QAPI
specification for event types: 'Event' and 'EventBase'.

'EventBase' contains @Name and @Timestamp fields and then 'Event'
extends 'EventBase' with an @Arg field of type 'Any'.

The 'Event' type implements the Unmarshaler to decode the QMP JSON
Object into the correct Golang (event) struct. The goal here is to
facilitate receiving Events.

A TODO for this type is to implement Marshaler for 'Event'. It'll
containt runtime checks to validate before transforming the struct
into a JSON Object.

Example:
```go
    qmpMsg := `{
    "event" : "MIGRATION",
    "timestamp":{
        "seconds": 1432121972,
        "microseconds": 744001
    },
    "data":{
        "status": "completed"
    }
}`

    e := Event{}
    _ = json.Unmarshal([]byte(qmpMsg), &e)
    // e.Name == "MIGRATION"
    // e.Arg.(MigrationEvent).Status == MigrationStatusCompleted
```

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 92 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 0a1bf430ba..3bb66d07c7 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -31,9 +31,10 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct", "union"]}
+        self.target = {name: "" for name in ["alternate", "enum", "event", "helper", "struct", "union"]}
         self.objects_seen = {}
         self.schema = None
+        self.events = {}
         self._docmap = {}
         self.golang_package_name = "qapi"
 
@@ -57,6 +58,24 @@ def visit_begin(self, schema):
     def visit_end(self):
         self.schema = None
 
+        # EventBase and Event are not specified in the QAPI schema,
+        # so we need to generate it ourselves.
+        self.target["event"] += '''
+type EventBase struct {
+    Name      string `json:"event"`
+    Timestamp struct {
+        Seconds      int64 `json:"seconds"`
+        Microseconds int64 `json:"microseconds"`
+    } `json:"timestamp"`
+}
+
+type Event struct {
+    EventBase
+    Arg       Any    `json:"data,omitempty"`
+}
+'''
+        self.target["event"] += generate_marshal_methods('Event', self.events)
+
         self.target["helper"] += '''
 // Creates a decoder that errors on unknown Fields
 // Returns true if successfully decoded @from string @into type
@@ -279,7 +298,28 @@ def visit_command(self,
         pass
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
-        pass
+        assert name == info.defn_name
+        type_name = qapi_to_go_type_name(name, info.defn_meta)
+        self.events[name] = type_name
+
+        doc = self._docmap.get(name, None)
+        self_contained = True if not arg_type or not arg_type.name.startswith("q_obj") else False
+        content = ""
+        if self_contained:
+            doc_struct, _ = qapi_to_golang_struct_docs(doc)
+            content = generate_struct_type(type_name, "", doc_struct)
+        else:
+            assert isinstance(arg_type, QAPISchemaObjectType)
+            content = qapi_to_golang_struct(name,
+                                            doc,
+                                            arg_type.info,
+                                            arg_type.ifcond,
+                                            arg_type.features,
+                                            arg_type.base,
+                                            arg_type.members,
+                                            arg_type.variants)
+
+        self.target["event"] += content
 
     def write(self, output_dir: str) -> None:
         for module_name, content in self.target.items():
@@ -351,15 +391,41 @@ def generate_marshal_methods_enum(members: List[QAPISchemaEnumMember]) -> str:
 }}
 '''
 
-# Marshal methods for Union types
+# Marshal methods for Event and Union types
 def generate_marshal_methods(type: str,
                              type_dict: Dict[str, str],
                              discriminator: str = "",
                              base: str = "") -> str:
-    assert base != ""
-    discriminator = "base." + discriminator
-
-    switch_case_format = '''
+    type_is_union = False
+    json_field = ""
+    struct_field = ""
+    if type == "Event":
+        base = type + "Base"
+        discriminator = "base.Name"
+        struct_field = "Arg"
+        json_field = "data"
+    else:
+        assert base != ""
+        discriminator = "base." + discriminator
+        type_is_union = True
+
+    switch_case_format = ""
+    if not type_is_union:
+        switch_case_format = '''
+    case "{name}":
+        tmp := struct {{
+            Value {isptr}{case_type} `json:"{json_field},omitempty"`
+        }}{{}}
+        if err := json.Unmarshal(data, &tmp); err != nil {{
+            return err
+        }}
+        if tmp.Value == nil {{
+            s.{struct_field} = nil
+        }} else {{
+            s.{struct_field} = {isptr}tmp.Value
+        }}'''
+    else:
+        switch_case_format = '''
     case {name}:
         value := {case_type}{{}}
         if err := json.Unmarshal(data, &value); err != nil {{
@@ -374,12 +440,17 @@ def generate_marshal_methods(type: str,
         case_type = type_dict[name]
         isptr = "*" if case_type[0] not in "*[" else ""
         switch_cases += switch_case_format.format(name = name,
+                                                  struct_field = struct_field,
+                                                  json_field = json_field,
+                                                  isptr = isptr,
                                                   case_type = case_type)
         if case_type not in added:
             if_supported_types += f'''typestr != "{case_type}" &&\n\t\t'''
             added[case_type] = True
 
-    marshalfn = f'''
+    marshalfn = ""
+    if type_is_union:
+        marshalfn = f'''
 func (s {type}) MarshalJSON() ([]byte, error) {{
 	base, err := json.Marshal(s.{base})
 	if err != nil {{
@@ -564,4 +635,9 @@ def qapi_to_go_type_name(name: str, meta: str) -> str:
     words = [word for word in name.replace("_", "-").split("-")]
     name = words[0].title() if words[0].islower() or words[0].isupper() else words[0]
     name += ''.join(word.title() for word in words[1:])
+
+    if meta == "event":
+        name = name[:-3] if name.endswith("Arg") else name
+        name += meta.title()
+
     return name
-- 
2.35.1


