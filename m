Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658133DA69
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:13:59 +0100 (CET)
Received: from localhost ([::1]:57924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDGY-0003nj-3Q
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMD8s-0002q5-T0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMD8p-00059O-2t
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9/kalaJR9iqF4Bo3hIlonGgbjbmM01Uohhabc/z2N4=;
 b=i7rbSSAZ9J6JjRZVenm+OsdLsMiLmEee1z1KE8WO8+X0v8DcgAXoj0AHTtohJ5DCajidun
 LW8FtwCiQ03CjmZ33XQu5CY8q4TuRPN9BOzeYbb0rJdnMGpv1UoTsE4FBJZGe/29y1FfRV
 9HAKLIjaltEqrsRipkRO7dludjIZyIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-aRcssvMBNQ6GW_FBja8Puw-1; Tue, 16 Mar 2021 13:05:55 -0400
X-MC-Unique: aRcssvMBNQ6GW_FBja8Puw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC1671934109;
 Tue, 16 Mar 2021 17:05:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66EE9690F6;
 Tue, 16 Mar 2021 17:05:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3622E112689A; Tue, 16 Mar 2021 18:05:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] qapi: Implement deprecated-input=reject for QMP commands
Date: Tue, 16 Mar 2021 18:05:49 +0100
Message-Id: <20210316170551.3911643-10-armbru@redhat.com>
In-Reply-To: <20210316170551.3911643-1-armbru@redhat.com>
References: <20210316170551.3911643-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This policy rejects deprecated input, and thus permits "testing the
future".  Implement it for QMP commands: make deprecated ones fail.
Example: when QEMU is run with -compat deprecated-input=reject, then

    {"execute": "query-cpus"}

fails like this

    {"error": {"class": "CommandNotFound", "desc": "Deprecated command query-cpus disabled by policy"}}

When the deprecated command is removed, the error will change to

    {"error": {"class": "CommandNotFound", "desc": "The command query-cpus has not been found"}}

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210312153210.2810514-9-armbru@redhat.com>
---
 include/qapi/qmp/dispatch.h |  1 +
 qapi/qmp-dispatch.c         | 13 +++++++++++++
 tests/unit/test-qmp-cmds.c  | 24 ++++++++++++++++++++++++
 scripts/qapi/commands.py    | 10 +++++++---
 4 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1486cac3ef..8b974b570e 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -26,6 +26,7 @@ typedef enum QmpCommandOptions
     QCO_ALLOW_OOB             =  (1U << 1),
     QCO_ALLOW_PRECONFIG       =  (1U << 2),
     QCO_COROUTINE             =  (1U << 3),
+    QCO_DEPRECATED            =  (1U << 4),
 } QmpCommandOptions;
 
 typedef struct QmpCommand
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 45090f881a..cbc4452341 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -158,6 +158,19 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
                   "The command %s has not been found", command);
         goto out;
     }
+    if (cmd->options & QCO_DEPRECATED) {
+        switch (compat_policy.deprecated_input) {
+        case COMPAT_POLICY_INPUT_ACCEPT:
+            break;
+        case COMPAT_POLICY_INPUT_REJECT:
+            error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
+                      "Deprecated command %s disabled by policy",
+                      command);
+            goto out;
+        default:
+            abort();
+        }
+    }
     if (!cmd->enabled) {
         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
                   "The command %s has been disabled for this instance",
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 1079d35122..cba982154b 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -281,6 +281,28 @@ static void test_dispatch_cmd_io(void)
     qobject_unref(ret3);
 }
 
+static void test_dispatch_cmd_deprecated(void)
+{
+    const char *cmd = "{ 'execute': 'test-command-features1' }";
+    QDict *ret;
+
+    memset(&compat_policy, 0, sizeof(compat_policy));
+
+    /* accept */
+    ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
+    assert(ret && qdict_size(ret) == 0);
+    qobject_unref(ret);
+
+    compat_policy.has_deprecated_input = true;
+    compat_policy.deprecated_input = COMPAT_POLICY_INPUT_ACCEPT;
+    ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
+    assert(ret && qdict_size(ret) == 0);
+    qobject_unref(ret);
+
+    compat_policy.deprecated_input = COMPAT_POLICY_INPUT_REJECT;
+    do_qmp_dispatch_error(false, ERROR_CLASS_COMMAND_NOT_FOUND, cmd);
+}
+
 static void test_dispatch_cmd_ret_deprecated(void)
 {
     const char *cmd = "{ 'execute': 'test-features0' }";
@@ -379,6 +401,8 @@ int main(int argc, char **argv)
     g_test_add_func("/qmp/dispatch_cmd_io", test_dispatch_cmd_io);
     g_test_add_func("/qmp/dispatch_cmd_success_response",
                     test_dispatch_cmd_success_response);
+    g_test_add_func("/qmp/dispatch_cmd_deprecated",
+                    test_dispatch_cmd_deprecated);
     g_test_add_func("/qmp/dispatch_cmd_ret_deprecated",
                     test_dispatch_cmd_ret_deprecated);
     g_test_add_func("/qmp/dealloc_types", test_dealloc_types);
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 7adeda917b..f5d97454af 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -210,12 +210,16 @@ def gen_marshal(name: str,
 
 
 def gen_register_command(name: str,
+                         features: List[QAPISchemaFeature],
                          success_response: bool,
                          allow_oob: bool,
                          allow_preconfig: bool,
                          coroutine: bool) -> str:
     options = []
 
+    if 'deprecated' in [f.name for f in features]:
+        options += ['QCO_DEPRECATED']
+
     if not success_response:
         options += ['QCO_NO_SUCCESS_RESP']
     if allow_oob:
@@ -326,9 +330,9 @@ def visit_command(self,
             self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
         with self._temp_module('./init'):
             with ifcontext(ifcond, self._genh, self._genc):
-                self._genc.add(gen_register_command(name, success_response,
-                                                    allow_oob, allow_preconfig,
-                                                    coroutine))
+                self._genc.add(gen_register_command(
+                    name, features, success_response, allow_oob,
+                    allow_preconfig, coroutine))
 
 
 def gen_commands(schema: QAPISchema,
-- 
2.26.2


