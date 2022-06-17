Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7250654F7B2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:37:54 +0200 (CEST)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BEX-0003g7-Jc
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax7-0001hs-Eq
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax4-00050l-NW
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ya/yFxVJyK8+F3qyfRthaOOUOhY7r2uw8VIya/1UxQA=;
 b=ViIar478482QqOgg1OgzIqskku67JPjcLL3Ka+MHMKmiAk77b6UjeK4iSUWGYt1SlLDYe1
 gqzEXQQcBP/8pfPk1sCCGagRmcHulb2DpKS7cwQ3pXorZIS4XTwHy77VGrSt1rTOvG+CzW
 04vR0tTad01cRmKP14lYBfUvHRvrNF4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-bQw6AqnrNSOAubOputJQIQ-1; Fri, 17 Jun 2022 08:19:48 -0400
X-MC-Unique: bQw6AqnrNSOAubOputJQIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E0973C0D85D
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:48 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAB5040334E;
 Fri, 17 Jun 2022 12:19:46 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 6/8] qapi: golang: Generate qapi's command types in Go
Date: Fri, 17 Jun 2022 14:19:30 +0200
Message-Id: <20220617121932.249381-7-victortoso@redhat.com>
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

This patch handles QAPI command types and generates data structures in
Go that decodes from QMP JSON Object to Go data structure and vice
versa.

Simlar to Event, this patch adds a Command interface and two helper
functions MarshalCommand and UnmarshalCommand.

At the time of this writing, it generates 209 structures.

Example:

qapi:
  | { 'command': 'set_password',
  |   'boxed': true,
  |   'data': 'SetPasswordOptions' }

go:
  | type SetPasswordCommand struct {
  |         SetPasswordOptions
  |         CommandId string `json:"-"`
  | }

usage:
  | input := `{"execute":"set_password",` +
  |     `"arguments":{"protocol":"vnc","password":"secret"}}`
  | c, err := UnmarshalCommand([]byte(input))
  | if err != nil {
  |     panic(err)
  | }
  | if c.GetName() == `set_password` {
  |         m := c.(*SetPasswordCommand)
  |         // m.Password == "secret"
  | }

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 123 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index b2e08cebdf..123179cced 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -88,6 +88,63 @@
     return nil, errors.New("Failed to recognize event")
 }}
 '''
+
+# Only variable is @unm_cases to handle all command's names and associated types.
+TEMPLATE_COMMAND = '''
+type Command interface {{
+    GetId()         string
+    GetName()       string
+    GetReturnType() CommandReturn
+}}
+
+func MarshalCommand(c Command) ([]byte, error) {{
+    baseStruct := struct {{
+        CommandId   string `json:"id,omitempty"`
+        Name        string `json:"execute"`
+    }}{{
+        CommandId: c.GetId(),
+        Name:      c.GetName(),
+    }}
+    base, err := json.Marshal(baseStruct)
+    if err != nil {{
+        return []byte{{}}, err
+    }}
+
+    argsStruct := struct {{
+        Args Command `json:"arguments,omitempty"`
+    }}{{
+        Args: c,
+    }}
+    args, err := json.Marshal(argsStruct)
+    if err != nil {{
+        return []byte{{}}, err
+    }}
+
+    if len(args) == len(`{{"arguments":{{}}}}`) {{
+        return base, nil
+    }}
+
+    // Combines Event's base and data in a single JSON object
+    result := fmt.Sprintf("%s,%s", base[:len(base)-1], args[1:])
+    return []byte(result), nil
+}}
+
+func UnmarshalCommand(data []byte) (Command, error) {{
+    base := struct {{
+        CommandId string `json:"id,omitempty"`
+        Name      string `json:"execute"`
+    }}{{}}
+    if err := json.Unmarshal(data, &base); err != nil {{
+        return nil, errors.New(fmt.Sprintf("Failed to decode command: %s", string(data)))
+    }}
+
+    switch base.Name {{
+    {unm_cases}
+    }}
+    return nil, errors.New("Failed to recognize command")
+}}
+'''
+
 TEMPLATE_HELPER = '''
 // Alias for go version lower than 1.18
 type Any = interface{}
@@ -112,12 +169,13 @@ class QAPISchemaGenGolangVisitor(QAPISchemaVisitor):
 
     def __init__(self, prefix: str):
         super().__init__()
-        self.target = {name: "" for name in ["alternate", "enum",
+        self.target = {name: "" for name in ["alternate", "command", "enum",
                                              "event", "helper", "struct",
                                              "union"]}
         self.objects_seen = {}
         self.schema = None
         self.events = {}
+        self.commands = {}
         self.golang_package_name = "qapi"
 
     def visit_begin(self, schema):
@@ -149,6 +207,23 @@ def visit_end(self):
 '''
         self.target["event"] += TEMPLATE_EVENT.format(unm_cases=unm_cases)
 
+        unm_cases = ""
+        for name in sorted(self.commands):
+            case_type = self.commands[name]
+            unm_cases += f'''
+    case "{name}":
+        command := struct {{
+            Args {case_type} `json:"arguments"`
+        }}{{}}
+
+        if err := json.Unmarshal(data, &command); err != nil {{
+            return nil, errors.New(fmt.Sprintf("Failed to unmarshal: %s", string(data)))
+        }}
+        command.Args.CommandId = base.CommandId
+        return &command.Args, nil
+'''
+        self.target["command"] += TEMPLATE_COMMAND.format(unm_cases=unm_cases)
+
 
     def visit_object_type(self: QAPISchemaGenGolangVisitor,
                           name: str,
@@ -308,7 +383,47 @@ def visit_command(self,
                       allow_oob: bool,
                       allow_preconfig: bool,
                       coroutine: bool) -> None:
-        pass
+        # Safety check
+        assert name == info.defn_name
+
+        type_name = qapi_to_go_type_name(name, info.defn_meta)
+        self.commands[name] = type_name
+        command_ret = ""
+        init_ret_type_name = f'''EmptyCommandReturn {{ Name: "{name}" }}'''
+
+        self_contained = True
+        if arg_type and arg_type.name.startswith("q_obj"):
+            self_contained = False
+
+        content = ""
+        if boxed or self_contained:
+            args = "" if not arg_type else "\n" + arg_type.name
+            args += '''\n\tCommandId   string `json:"-"`'''
+            content = generate_struct_type(type_name, args)
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
+func (c *{type_name}) GetName() string {{
+    return "{name}"
+}}
+
+func (s *{type_name}) GetId() string {{
+    return s.CommandId
+}}
+
+func (s *{type_name}) GetReturnType() CommandReturn {{
+    return &{init_ret_type_name}
+}}
+'''
+        self.target["command"] += content + methods
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
         assert name == info.defn_name
@@ -385,6 +500,8 @@ def qapi_to_golang_struct(name: str,
     fields = ""
     if info.defn_meta == "event":
         fields += '''\tEventTimestamp Timestamp `json:"-"`\n'''
+    elif info.defn_meta == "command":
+        fields += '''\tCommandId string `json:"-"`\n'''
 
     if base:
         base_fields = ""
@@ -569,7 +686,7 @@ def qapi_to_go_type_name(name: str, meta: str) -> str:
 
     name += ''.join(word.title() for word in words[1:])
 
-    if meta in ["event"]:
+    if meta in ["event", "command"]:
         name = name[:-3] if name.endswith("Arg") else name
         name += meta.title().replace(" ", "")
 
-- 
2.36.1


