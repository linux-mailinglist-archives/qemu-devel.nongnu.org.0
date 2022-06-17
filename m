Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB054F773
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:25:03 +0200 (CEST)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2B26-0005n0-0l
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax7-0001fG-7r
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax3-00050S-1R
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpPwu1g9dMEHFOL4cfYX89f8RiOgjrXW5hdE6Qec2w8=;
 b=PSVfqLfqhQ+bDVgxMxtQAlBNUcQbNAkFliTJIIiXwWX+bUUvW9Ml1VUOfxeT0HWv3Z1yxm
 1aRgb0nI7HgeeZzXRpDK/Bz5UMXorpfXBODnNJUtCTgcGFL3jmTCRr1Vz9frHUtT0FAUma
 jCHe3jcGBlfFYVvJQRSB1vd0n/q5tPQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-DgLDvEf6PbOp-ox69ATzdg-1; Fri, 17 Jun 2022 08:19:46 -0400
X-MC-Unique: DgLDvEf6PbOp-ox69ATzdg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4059C3C0D860
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:46 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9232A4328C9;
 Fri, 17 Jun 2022 12:19:44 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
Date: Fri, 17 Jun 2022 14:19:29 +0200
Message-Id: <20220617121932.249381-6-victortoso@redhat.com>
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

This patch handles QAPI event types and generates data structures in
Go that handles it.

We also define a Event interface and two helper functions MarshalEvent
and UnmarshalEvent.

At the moment of this writing, this patch generates 51 structures (50
events)

Example:

qapi:
  | { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
  |   'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }

go:
  | type MemoryDeviceSizeChangeEvent struct {
  |         EventTimestamp Timestamp `json:"-"`
  |         Id             *string   `json:"id,omitempty"`
  |         Size           uint64    `json:"size"`
  |         QomPath        string    `json:"qom-path"`
  | }

usage:
  | input := `{"event":"MEMORY_DEVICE_SIZE_CHANGE",` +
  |     `"timestamp":{"seconds":1588168529,"microseconds":201316},` +
  |     `"data":{"id":"vm0","size":1073741824,"qom-path":"/machine/unattached/device[2]"}}`
  | e, err := UnmarshalEvent([]byte(input)
  | if err != nil {
  |     panic(err)
  | }
  | if e.GetName() == `MEMORY_DEVICE_SIZE_CHANGE` {
  |     m := e.(*MemoryDeviceSizeChangeEvent)
  |     // m.QomPath == "/machine/unattached/device[2]"
  | }

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 120 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 6c6a5cea97..b2e08cebdf 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -28,7 +28,66 @@
 )
 from .source import QAPISourceInfo
 
+# Only variable is @unm_cases to handle
+# all events's names and associated types.
+TEMPLATE_EVENT = '''
+type Timestamp struct {{
+    Seconds      int64 `json:"seconds"`
+    Microseconds int64 `json:"microseconds"`
+}}
+
+type Event interface {{
+    GetName()      string
+    GetTimestamp() Timestamp
+}}
 
+func MarshalEvent(e Event) ([]byte, error) {{
+    baseStruct := struct {{
+        Name           string    `json:"event"`
+        EventTimestamp Timestamp `json:"timestamp"`
+    }}{{
+        Name:           e.GetName(),
+        EventTimestamp: e.GetTimestamp(),
+    }}
+    base, err := json.Marshal(baseStruct)
+    if err != nil {{
+        return []byte{{}}, err
+    }}
+
+    dataStruct := struct {{
+        Payload Event `json:"data"`
+    }}{{
+        Payload: e,
+    }}
+    data, err := json.Marshal(dataStruct)
+    if err != nil {{
+        return []byte{{}}, err
+    }}
+
+    if len(data) == len(`{{"data":{{}}}}`) {{
+        return base, nil
+    }}
+
+    // Combines Event's base and data in a single JSON object
+    result := fmt.Sprintf("%s,%s", base[:len(base)-1], data[1:])
+    return []byte(result), nil
+}}
+
+func UnmarshalEvent(data []byte) (Event, error) {{
+    base := struct {{
+        Name           string    `json:"event"`
+        EventTimestamp Timestamp `json:"timestamp"`
+    }}{{}}
+    if err := json.Unmarshal(data, &base); err != nil {{
+        return nil, errors.New(fmt.Sprintf("Failed to decode event: %s", string(data)))
+    }}
+
+    switch base.Name {{
+    {unm_cases}
+    }}
+    return nil, errors.New("Failed to recognize event")
+}}
+'''
 TEMPLATE_HELPER = '''
 // Alias for go version lower than 1.18
 type Any = interface{}
@@ -53,10 +112,12 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum", "helper", "struct",
+        self.target = {name: "" for name in ["alternate", "enum",
+                                             "event", "helper", "struct",
                                              "union"]}
         self.objects_seen = {}
         self.schema = None
+        self.events = {}
         self.golang_package_name = "qapi"
 
     def visit_begin(self, schema):
@@ -71,6 +132,24 @@ def visit_begin(self, schema):
     def visit_end(self):
         self.schema = None
 
+        unm_cases = ""
+        for name in sorted(self.events):
+            case_type = self.events[name]
+            unm_cases += f'''
+    case "{name}":
+        event := struct {{
+            Data {case_type} `json:"data"`
+        }}{{}}
+
+        if err := json.Unmarshal(data, &event); err != nil {{
+            return nil, errors.New(fmt.Sprintf("Failed to unmarshal: %s", string(data)))
+        }}
+        event.Data.EventTimestamp = base.EventTimestamp
+        return &event.Data, nil
+'''
+        self.target["event"] += TEMPLATE_EVENT.format(unm_cases=unm_cases)
+
+
     def visit_object_type(self: QAPISchemaGenGolangVisitor,
                           name: str,
                           info: Optional[QAPISourceInfo],
@@ -232,7 +311,37 @@ def visit_command(self,
         pass
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
-        pass
+        assert name == info.defn_name
+        type_name = qapi_to_go_type_name(name, info.defn_meta)
+        self.events[name] = type_name
+
+        self_contained = True
+        if arg_type and arg_type.name.startswith("q_obj"):
+            self_contained = False
+
+        content = ""
+        if self_contained:
+            content = generate_struct_type(type_name, '''EventTimestamp Timestamp `json:"-"`''')
+        else:
+            assert isinstance(arg_type, QAPISchemaObjectType)
+            content = qapi_to_golang_struct(name,
+                                            arg_type.info,
+                                            arg_type.ifcond,
+                                            arg_type.features,
+                                            arg_type.base,
+                                            arg_type.members,
+                                            arg_type.variants)
+
+        methods = f'''
+func (s *{type_name}) GetName() string {{
+    return "{name}"
+}}
+
+func (s *{type_name}) GetTimestamp() Timestamp {{
+    return s.EventTimestamp
+}}
+'''
+        self.target["event"] += content + methods
 
     def write(self, output_dir: str) -> None:
         for module_name, content in self.target.items():
@@ -274,6 +383,8 @@ def qapi_to_golang_struct(name: str,
     type_name = qapi_to_go_type_name(name, info.defn_meta)
 
     fields = ""
+    if info.defn_meta == "event":
+        fields += '''\tEventTimestamp Timestamp `json:"-"`\n'''
 
     if base:
         base_fields = ""
@@ -457,4 +568,9 @@ def qapi_to_go_type_name(name: str, meta: str) -> str:
         name = name.title()
 
     name += ''.join(word.title() for word in words[1:])
+
+    if meta in ["event"]:
+        name = name[:-3] if name.endswith("Arg") else name
+        name += meta.title().replace(" ", "")
+
     return name
-- 
2.36.1


