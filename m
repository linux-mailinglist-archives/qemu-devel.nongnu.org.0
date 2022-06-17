Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279CA54F7B9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:41:32 +0200 (CEST)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BI3-0006ng-69
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2AxA-0001p1-UX
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Ax6-000512-Hr
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZ0vOcnsF21RFn7nIjZPVMrS8wCUCtbccTUvlstCT7Y=;
 b=I/bbjFZOzLC/gqTynwOv8BMXnYsOhyp3guLMzk2u2XtJeF/aLD4uEWlJ+MwWcvWAApRDtf
 EDLBBxCV1tH0HMKB9edR27QZ6oPoKNtNKEp82CtgKWkqD5CGB0yA+pm8VO3gnD412+VZeJ
 SxpF6IIwXik+y38gqAluYecozGZ0M20=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-FxUZXtkaPA6tcTgSG_PYPw-1; Fri, 17 Jun 2022 08:19:50 -0400
X-MC-Unique: FxUZXtkaPA6tcTgSG_PYPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89AC71C01B2B
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:19:50 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE770415F5E;
 Fri, 17 Jun 2022 12:19:48 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v2 7/8] qapi: golang: Add CommandResult type to Go
Date: Fri, 17 Jun 2022 14:19:31 +0200
Message-Id: <20220617121932.249381-8-victortoso@redhat.com>
In-Reply-To: <20220617121932.249381-1-victortoso@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
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

This patch adds a struct type in Go that will handle return values for
QAPI's command types.

The return value of a Command is, encouraged to be, QAPI's complex
types or an Array of those.

Every Command has a underlying CommandResult. The EmptyCommandReturn
is for those that don't expect any data e.g: `{ "return": {} }`.

All CommandReturn types implement the CommandResult interface.

Example:
qapi:
  | { 'command': 'query-sev', 'returns': 'SevInfo',
  |   'if': 'TARGET_I386' }

go:
  | type QuerySevCommandReturn struct {
  |         CommandId string     `json:"id,omitempty"`
  |         Result    *SevInfo   `json:"return"`
  |         Error     *QapiError `json:"error,omitempty"`
  | }

usage:
  | // One can use QuerySevCommandReturn directly or
  | // command's interface GetReturnType() instead.
  |
  | input := `{ "return": { "enabled": true, "api-major" : 0,` +
  |                        `"api-minor" : 0, "build-id" : 0,` +
  |                        `"policy" : 0, "state" : "running",` +
  |                        `"handle" : 1 } } `
  | ret := QuerySevCommandReturn{}
  | err := json.Unmarshal([]byte(input), &ret)
  | if ret.Error != nil {
  |     // Handle command failure {"error": { ...}}
  | } else if ret.Result != nil {
  |     // ret.Result.Enable == true
  | }

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 73 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 123179cced..ab91cf124f 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -89,7 +89,8 @@
 }}
 '''
 
-# Only variable is @unm_cases to handle all command's names and associated types.
+# Only variable is @unm_cases to handle
+# all command's names and associated types.
 TEMPLATE_COMMAND = '''
 type Command interface {{
     GetId()         string
@@ -145,10 +146,49 @@
 }}
 '''
 
+TEMPLATE_COMMAND_RETURN = '''
+type CommandReturn interface {
+    GetId()          string
+    GetCommandName() string
+    GetError()       error
+}
+
+type EmptyCommandReturn struct {
+    CommandId string          `json:"id,omitempty"`
+    Error     *QapiError      `json:"error,omitempty"`
+    Name      string          `json:"-"`
+}
+
+func (r EmptyCommandReturn) MarshalJSON() ([]byte, error) {
+    return []byte(`{"return":{}}`), nil
+}
+
+func (r *EmptyCommandReturn) GetId() string {
+    return r.CommandId
+}
+
+func (r *EmptyCommandReturn) GetCommandName() string {
+    return r.Name
+}
+
+func (r *EmptyCommandReturn) GetError() error {
+    return r.Error
+}
+'''
+
 TEMPLATE_HELPER = '''
 // Alias for go version lower than 1.18
 type Any = interface{}
 
+type QapiError struct {
+    Class       string `json:"class"`
+    Description string `json:"desc"`
+}
+
+func (err *QapiError) Error() string {
+    return fmt.Sprintf("%s: %s", err.Class, err.Description)
+}
+
 // Creates a decoder that errors on unknown Fields
 // Returns true if successfully decoded @from string @into type
 // Returns false without error is failed with "unknown field"
@@ -176,6 +216,7 @@ def __init__(self, prefix: str):
         self.schema = None
         self.events = {}
         self.commands = {}
+        self.command_results = {}
         self.golang_package_name = "qapi"
 
     def visit_begin(self, schema):
@@ -224,6 +265,7 @@ def visit_end(self):
 '''
         self.target["command"] += TEMPLATE_COMMAND.format(unm_cases=unm_cases)
 
+        self.target["command"] += TEMPLATE_COMMAND_RETURN
 
     def visit_object_type(self: QAPISchemaGenGolangVisitor,
                           name: str,
@@ -390,6 +432,31 @@ def visit_command(self,
         self.commands[name] = type_name
         command_ret = ""
         init_ret_type_name = f'''EmptyCommandReturn {{ Name: "{name}" }}'''
+        if ret_type:
+            cmd_ret_name = qapi_to_go_type_name(name, "command return")
+            ret_type_name = qapi_schema_type_to_go_type(ret_type.name)
+            init_ret_type_name = f'''{cmd_ret_name}{{}}'''
+            isptr = "*" if ret_type_name[0] not in "*[" else ""
+            self.command_results[name] = ret_type_name
+            command_ret = f'''
+type {cmd_ret_name} struct {{
+    CommandId  string                `json:"id,omitempty"`
+    Result    {isptr}{ret_type_name} `json:"return"`
+    Error     *QapiError             `json:"error,omitempty"`
+}}
+
+func (r *{cmd_ret_name}) GetCommandName() string {{
+    return "{name}"
+}}
+
+func (r *{cmd_ret_name}) GetId() string {{
+    return r.CommandId
+}}
+
+func (r *{cmd_ret_name}) GetError() error {{
+    return r.Error
+}}
+'''
 
         self_contained = True
         if arg_type and arg_type.name.startswith("q_obj"):
@@ -423,7 +490,7 @@ def visit_command(self,
     return &{init_ret_type_name}
 }}
 '''
-        self.target["command"] += content + methods
+        self.target["command"] += content + methods + command_ret
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
         assert name == info.defn_name
@@ -686,7 +753,7 @@ def qapi_to_go_type_name(name: str, meta: str) -> str:
 
     name += ''.join(word.title() for word in words[1:])
 
-    if meta in ["event", "command"]:
+    if meta in ["event", "command", "command return"]:
         name = name[:-3] if name.endswith("Arg") else name
         name += meta.title().replace(" ", "")
 
-- 
2.36.1


