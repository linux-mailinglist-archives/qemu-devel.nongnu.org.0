Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134B4EFCE3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:49:05 +0200 (CEST)
Received: from localhost ([::1]:33988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naQ4m-0005Zs-EM
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:49:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxJ-0002A0-JH
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxH-0005Qk-HF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZXMBWOTEdvWfBJyI1mCujsRhcs36+ZrJHiK6scddBs=;
 b=C0kxCPPC2IaqhlAQSvZw++o/Gy1VZ0RxyhLAprCZ8/C3wqP4+pCEU4V3jdNjHWYf/Yq80p
 P/sscOh4Lj22kN/pnsUqExJlnwh1Vpzgj2Ly6eRvcX7NYKYW8moSlr9SK6fmwFg9AbMto0
 p2ZtMqDE4slfHywhi4I9wh6qxH2M8bw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-HbaSe5VOOJ2mLtGE1SWIdA-1; Fri, 01 Apr 2022 18:41:18 -0400
X-MC-Unique: HbaSe5VOOJ2mLtGE1SWIdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C031C811E75
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:17 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 521579E61;
 Fri,  1 Apr 2022 22:41:16 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 6/8] qapi: golang: Generate qapi's command types in Go
Date: Sat,  2 Apr 2022 00:41:02 +0200
Message-Id: <20220401224104.145961-7-victortoso@redhat.com>
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

This patch handles QAPI command types and generates data structures in
Go that decodes from QMP JSON Object to Go data structure and vice
versa.

At the time of this writing, it generates 210 structures
(208 commands)

This is very similar to previous commit, that handles QAPI union types
in Go.

Each QAPI command will generate a Go struct with the suffix 'Command'.
Its fields, if any, are the mandatory or optional arguments defined in
the QAPI command.

Simlar to Event, this patch adds two structures to handle QAPI
specification for command types: 'Command' and 'CommandBase'.

'CommandBase' contains @Id and @Name. 'Command' extends 'CommandBase'
with an @Arg field of type 'Any'.

The 'Command' type implements the Unmarshaler to decode QMP JSON
Object into the correct Golang (command) struct.

Marshal example:
```go
	cmdArg := SetPasswordCommand{}
	cmdArg.Protocol = DisplayProtocolVnc
	cmdArg.Password = "secret"
	cmd := Command{}
	cmd.Name = "set_password"
	cmd.Arg = cmdArg

	b, _ := json.Marshal(&cmd)
	// string(b) == `{"execute":"set_password","arguments":{"protocol":"vnc","password":"secret"}}`
```

Unmarshal example:
```go
	qmpCommand := `
{
	"execute": "set_password",
	"arguments":{
		"protocol": "vnc",
		"password": "secret"
	}
}`
	cmd := Command{}
	_ = json.Unmarshal([]byte(qmpCommand), &cmd)
	// cmd.Name == "set_password"
	// cmd1.Arg.(SetPasswordCommand).Protocol == DisplayProtocolVnc
```

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 49 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 3bb66d07c7..0b9c19babb 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -31,10 +31,11 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum", "event", "helper", "struct", "union"]}
+        self.target = {name: "" for name in ["alternate", "command", "enum", "event", "helper", "struct", "union"]}
         self.objects_seen = {}
         self.schema = None
         self.events = {}
+        self.commands = {}
         self._docmap = {}
         self.golang_package_name = "qapi"
 
@@ -76,6 +77,19 @@ def visit_end(self):
 '''
         self.target["event"] += generate_marshal_methods('Event', self.events)
 
+        self.target["command"] += '''
+type CommandBase struct {
+    Id   string `json:"id,omitempty"`
+    Name string `json:"execute"`
+}
+
+type Command struct {
+    CommandBase
+    Arg Any    `json:"arguments,omitempty"`
+}
+'''
+        self.target["command"] += generate_marshal_methods('Command', self.commands)
+
         self.target["helper"] += '''
 // Creates a decoder that errors on unknown Fields
 // Returns true if successfully decoded @from string @into type
@@ -295,7 +309,29 @@ def visit_command(self,
                       allow_oob: bool,
                       allow_preconfig: bool,
                       coroutine: bool) -> None:
-        pass
+        assert name == info.defn_name
+        type_name = qapi_to_go_type_name(name, info.defn_meta)
+        self.commands[name] = type_name
+
+        doc = self._docmap.get(name, None)
+        self_contained = True if not arg_type or not arg_type.name.startswith("q_obj") else False
+        content = ""
+        if boxed or self_contained:
+            args = "" if not arg_type else "\n" + arg_type.name
+            doc_struct, _ = qapi_to_golang_struct_docs(doc)
+            content = generate_struct_type(type_name, args, doc_struct)
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
+        self.target["command"] += content
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
         assert name == info.defn_name
@@ -391,7 +427,7 @@ def generate_marshal_methods_enum(members: List[QAPISchemaEnumMember]) -> str:
 }}
 '''
 
-# Marshal methods for Event and Union types
+# Marshal methods for Event, Commad and Union types
 def generate_marshal_methods(type: str,
                              type_dict: Dict[str, str],
                              discriminator: str = "",
@@ -404,6 +440,11 @@ def generate_marshal_methods(type: str,
         discriminator = "base.Name"
         struct_field = "Arg"
         json_field = "data"
+    elif type == "Command":
+        base = type + "Base"
+        discriminator = "base.Name"
+        struct_field = "Arg"
+        json_field = "arguments"
     else:
         assert base != ""
         discriminator = "base." + discriminator
@@ -636,7 +677,7 @@ def qapi_to_go_type_name(name: str, meta: str) -> str:
     name = words[0].title() if words[0].islower() or words[0].isupper() else words[0]
     name += ''.join(word.title() for word in words[1:])
 
-    if meta == "event":
+    if meta == "event" or meta == "command":
         name = name[:-3] if name.endswith("Arg") else name
         name += meta.title()
 
-- 
2.35.1


