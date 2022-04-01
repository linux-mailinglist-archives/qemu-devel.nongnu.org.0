Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B64EFCE2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:47:35 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naQ3K-0003P3-46
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:47:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxL-0002FK-4q
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxJ-0005RT-Ev
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4pJQD6VkrgHuQFDZ9pmVsufEgTW8aQpUaRR1B2d0MUg=;
 b=UA67JrTsxCJJ6ChpqfHWpaVOUcBHppYH+1pM7Am+wZ0rijxsiYA54+lFHSUYT8x9KsffN7
 tj8mFlvARGrpbsONoCR3wrrLdqvK0MzZrBGWddUNG4qs7bTy+m/YiHiuhMLuFkdap8Imyk
 4GgjK1XJ/RYtsi8z2pASY0LiBCzIYoc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-hrjpn0wgPd6zCyOPCKYdrw-1; Fri, 01 Apr 2022 18:41:19 -0400
X-MC-Unique: hrjpn0wgPd6zCyOPCKYdrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6818783395E
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:19 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BEAD9E69;
 Fri,  1 Apr 2022 22:41:17 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 7/8] qapi: golang: Add CommandResult type to Go
Date: Sat,  2 Apr 2022 00:41:03 +0200
Message-Id: <20220401224104.145961-8-victortoso@redhat.com>
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

This patch adds a struct type in Go that will handle return values for
QAPI's command types.

The return value of a Command is, encouraged to be, QAPI's complext
types or an Array of those.

The 'CommandResult' type acts in similar fashion to 'Event' and
'Command', in order to map the right return data structure based on
the issued 'Command'.

This patch also adds a syntax sugar method to 'Command' to return the
'CommandResult' struct to use when receiving the return data.

Example:
```go
    cmd := Command{}
    cmd.Name = `query-tpm-models`
    // bytes, _ := json.Marshal(&cmd)
    // send bytes ...
    received := `{"return":["tpm-tis","tpm-crb","tpm-spapr"]}`
    cmdRet := cmd.GetReturnType()
    _ = json.Unmarshal([]byte(received), &cmdRet)
    // cmdRet.Value.([]TpmModel)[2] == TpmModelTpmSpapr
```

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 scripts/qapi/golang.py | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/golang.py b/scripts/qapi/golang.py
index 0b9c19babb..5d3395514d 100644
--- a/scripts/qapi/golang.py
+++ b/scripts/qapi/golang.py
@@ -36,6 +36,7 @@ def __init__(self, prefix: str):
         self.schema = None
         self.events = {}
         self.commands = {}
+        self.command_results = {}
         self._docmap = {}
         self.golang_package_name = "qapi"
 
@@ -90,6 +91,32 @@ def visit_end(self):
 '''
         self.target["command"] += generate_marshal_methods('Command', self.commands)
 
+        self.target["command"] += '''
+type CommandResult struct {
+	CommandBase
+	Value       Any `json:"return,omitempty"`
+}
+
+func (s Command) GetReturnType() CommandResult {
+	return CommandResult{
+		CommandBase: s.CommandBase,
+	}
+}
+
+// In order to evaluate nil value to empty JSON object
+func (s *CommandResult) MarshalJSON() ([]byte, error) {
+	if s.Value == nil {
+		return []byte(`{"return":{}}`), nil
+	}
+	tmp := struct {
+		Value Any `json:"return"`
+	}{Value: s.Value}
+
+	return json.Marshal(&tmp)
+}
+'''
+        self.target["command"] += generate_marshal_methods('CommandResult', self.command_results)
+
         self.target["helper"] += '''
 // Creates a decoder that errors on unknown Fields
 // Returns true if successfully decoded @from string @into type
@@ -312,6 +339,9 @@ def visit_command(self,
         assert name == info.defn_name
         type_name = qapi_to_go_type_name(name, info.defn_meta)
         self.commands[name] = type_name
+        if ret_type:
+            ret_type_name = qapi_schema_type_to_go_type(ret_type.name)
+            self.command_results[name] = ret_type_name
 
         doc = self._docmap.get(name, None)
         self_contained = True if not arg_type or not arg_type.name.startswith("q_obj") else False
@@ -445,6 +475,11 @@ def generate_marshal_methods(type: str,
         discriminator = "base.Name"
         struct_field = "Arg"
         json_field = "arguments"
+    elif type == "CommandResult":
+        base = "CommandBase"
+        discriminator = "s.Name"
+        struct_field = "Value"
+        json_field = "return"
     else:
         assert base != ""
         discriminator = "base." + discriminator
@@ -527,14 +562,17 @@ def generate_marshal_methods(type: str,
     return []byte(result), nil
 }}
 '''
-    unmarshal_base = f'''
+    unmarshal_base = ""
+    unmarshal_default_warn = ""
+    if type != "CommandResult":
+        unmarshal_base = f'''
     var base {base}
     if err := json.Unmarshal(data, &base); err != nil {{
         return err
     }}
     s.{base} = base
 '''
-    unmarshal_default_warn = f'''
+        unmarshal_default_warn = f'''
     default:
         fmt.Println("Failed to decode {type}", {discriminator})'''
 
-- 
2.35.1


