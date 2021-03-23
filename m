Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC2346BB7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:07:30 +0100 (CET)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpBR-0006oz-3c
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1a-0007A0-Mo
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1Q-0002mr-DE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ly9gUTmur/X47V/CvqLOO5YTsgWFsABTtSdJ2pNqSOo=;
 b=XzKv5Yudr6n6A35RZTTUJk67+jh0HL3+qKj4LnSeYB6AHD07C4YHG+GB6cAhEv1y+83A/3
 KSt4K9Z2mb+yqPIHZePs/YY/gVWN+59dmsJmR35yY26WzLIUXFMHYUSB+uGqewJwrunld4
 /QqP3B8zqFOjEjxiswKlR1+smH+vqoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-tkjW0l6-NOOs_13U4RByTw-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: tkjW0l6-NOOs_13U4RByTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF12B100747F;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 317F860CF1;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF78B11326AC; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/29] qapi: Enforce command naming rules
Date: Tue, 23 Mar 2021 22:56:53 +0100
Message-Id: <20210323215658.3840228-25-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Command names should be lower-case.  Enforce this.  Fix the fixable
offenders (all in tests/), and add the remainder to pragma
command-name-exceptions.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-25-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/devel/qapi-code-gen.txt            |  8 ++++++--
 qapi/pragma.json                        | 18 +++++++++++++++++
 tests/unit/test-qmp-cmds.c              | 10 +++++-----
 scripts/qapi/expr.py                    |  5 +++--
 scripts/qapi/parser.py                  |  3 +++
 scripts/qapi/source.py                  |  2 ++
 tests/qapi-schema/qapi-schema-test.json | 21 +++++++++++---------
 tests/qapi-schema/qapi-schema-test.out  | 26 ++++++++++++-------------
 8 files changed, 62 insertions(+), 31 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 23e9823019..10e9a0f829 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -149,6 +149,7 @@ prevent incomplete include files.
 Syntax:
     PRAGMA = { 'pragma': {
                    '*doc-required': BOOL,
+                   '*command-name-exceptions': [ STRING, ... ],
                    '*command-returns-exceptions': [ STRING, ... ],
                    '*member-name-exceptions': [ STRING, ... ] } }
 
@@ -160,6 +161,9 @@ pragma to different values in parts of the schema doesn't work.
 Pragma 'doc-required' takes a boolean value.  If true, documentation
 is required.  Default is false.
 
+Pragma 'command-name-exceptions' takes a list of commands whose names
+may contain '_' instead of '-'.  Default is none.
+
 Pragma 'command-returns-exceptions' takes a list of commands that may
 violate the rules on permitted return types.  Default is none.
 
@@ -756,8 +760,8 @@ Any name (command, event, type, member, or enum value) beginning with
 "x-" is marked experimental, and may be withdrawn or changed
 incompatibly in a future release.
 
-Pragma 'member-name-exceptions' lets you violate the rules on use of
-upper and lower case.  Use for new code is strongly discouraged.
+Pragmas 'command-name-exceptions' and 'member-name-exceptions' let you
+violate naming rules.  Use for new code is strongly discouraged.
 
 
 === Downstream extensions ===
diff --git a/qapi/pragma.json b/qapi/pragma.json
index 4c47c802d1..339f067943 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -4,6 +4,24 @@
 # add to them!
 { 'pragma': {
     # Commands allowed to return a non-dictionary:
+    'command-name-exceptions': [
+        'add_client',
+        'block_passwd',
+        'block_resize',
+        'block_set_io_throttle',
+        'client_migrate_info',
+        'device_add',
+        'device_del',
+        'expire_password',
+        'migrate_cancel',
+        'netdev_add',
+        'netdev_del',
+        'qmp_capabilities',
+        'set_link',
+        'set_password',
+        'system_powerdown',
+        'system_reset',
+        'system_wakeup' ],
     'command-returns-exceptions': [
         'human-monitor-command',
         'qom-get',
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 99973dde7c..1b0b7d99df 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -13,7 +13,7 @@
 
 static QmpCommandList qmp_commands;
 
-UserDefThree *qmp_TestCmdReturnDefThree(Error **errp)
+UserDefThree *qmp_test_cmd_return_def_three(Error **errp)
 {
     return NULL;
 }
@@ -199,7 +199,7 @@ static void test_dispatch_cmd(void)
 
     ret = qobject_to(QDict,
                      do_qmp_dispatch(false,
-                                     "{ 'execute': 'user_def_cmd' }"));
+                                     "{ 'execute': 'user-def-cmd' }"));
     assert(ret && qdict_size(ret) == 0);
     qobject_unref(ret);
 }
@@ -220,11 +220,11 @@ static void test_dispatch_cmd_failure(void)
 {
     /* missing arguments */
     do_qmp_dispatch_error(false, ERROR_CLASS_GENERIC_ERROR,
-                          "{ 'execute': 'user_def_cmd2' }");
+                          "{ 'execute': 'user-def-cmd2' }");
 
     /* extra arguments */
     do_qmp_dispatch_error(false, ERROR_CLASS_GENERIC_ERROR,
-                          "{ 'execute': 'user_def_cmd',"
+                          "{ 'execute': 'user-def-cmd',"
                           " 'arguments': { 'a': 66 } }");
 }
 
@@ -248,7 +248,7 @@ static void test_dispatch_cmd_io(void)
     int64_t val;
 
     ret = qobject_to(QDict, do_qmp_dispatch(false,
-        "{ 'execute': 'user_def_cmd2', 'arguments': {"
+        "{ 'execute': 'user-def-cmd2', 'arguments': {"
         " 'ud1a': { 'integer': 42, 'string': 'hello' },"
         " 'ud1b': { 'integer': 422, 'string': 'hello2' } } }"));
 
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index d778107c18..9193e68763 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -70,8 +70,9 @@ def check_defn_name_str(name, info, meta):
     if meta == 'event':
         check_name_upper(name, info, meta)
     elif meta == 'command':
-        check_name_lower(name, info, meta,
-                         permit_upper=True, permit_underscore=True)
+        check_name_lower(
+            name, info, meta,
+            permit_underscore=name in info.pragma.command_name_exceptions)
     else:
         check_name_camel(name, info, meta)
     if name.endswith('Kind') or name.endswith('List'):
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index c16b8b6995..58267c3db9 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -132,6 +132,9 @@ def _pragma(self, name, value, info):
                 raise QAPISemError(info,
                                    "pragma 'doc-required' must be boolean")
             info.pragma.doc_required = value
+        elif name == 'command-name-exceptions':
+            self._check_pragma_list_of_str(name, value, info)
+            info.pragma.command_name_exceptions = value
         elif name == 'command-returns-exceptions':
             self._check_pragma_list_of_str(name, value, info)
             info.pragma.command_returns_exceptions = value
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index d8f9ec377f..03b6ede082 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -21,6 +21,8 @@ class QAPISchemaPragma:
     def __init__(self) -> None:
         # Are documentation comments required?
         self.doc_required = False
+        # Commands whose names may use '_'
+        self.command_name_exceptions: List[str] = []
         # Commands allowed to return a non-dictionary
         self.command_returns_exceptions: List[str] = []
         # Types whose member names may violate case conventions
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 16b03bf308..e635db4a35 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -31,7 +31,7 @@
   'base': { 'type': 'EnumOne' }, 'discriminator': 'type',
   'data': { } }
 
-{ 'command': 'user_def_cmd0', 'data': 'Empty2', 'returns': 'Empty2' }
+{ 'command': 'user-def-cmd0', 'data': 'Empty2', 'returns': 'Empty2' }
 
 # for testing override of default naming heuristic
 { 'enum': 'QEnumTwo',
@@ -141,9 +141,9 @@
 { 'include': 'include/sub-module.json' }
 
 # testing commands
-{ 'command': 'user_def_cmd', 'data': {} }
-{ 'command': 'user_def_cmd1', 'data': {'ud1a': 'UserDefOne'} }
-{ 'command': 'user_def_cmd2',
+{ 'command': 'user-def-cmd', 'data': {} }
+{ 'command': 'user-def-cmd1', 'data': {'ud1a': 'UserDefOne'} }
+{ 'command': 'user-def-cmd2',
   'data': {'ud1a': {'type': 'UserDefOne'}, '*ud1b': 'UserDefOne'},
   'returns': 'UserDefTwo' }
 
@@ -230,7 +230,8 @@
     'union_bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
   'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
 
-{ 'command': 'TestIfUnionCmd', 'data': { 'union_cmd_arg': 'TestIfUnion' },
+{ 'command': 'test-if-union-cmd',
+  'data': { 'union_cmd_arg': 'TestIfUnion' },
   'if': 'defined(TEST_IF_UNION)' }
 
 { 'alternate': 'TestIfAlternate', 'data':
@@ -238,16 +239,18 @@
     'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} },
   'if': 'defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)' }
 
-{ 'command': 'TestIfAlternateCmd', 'data': { 'alt_cmd_arg': 'TestIfAlternate' },
+{ 'command': 'test-if-alternate-cmd',
+  'data': { 'alt_cmd_arg': 'TestIfAlternate' },
   'if': 'defined(TEST_IF_ALT)' }
 
-{ 'command': 'TestIfCmd', 'data':
-  { 'foo': 'TestIfStruct',
+{ 'command': 'test-if-cmd',
+  'data': {
+    'foo': 'TestIfStruct',
     'bar': { 'type': 'TestIfEnum', 'if': 'defined(TEST_IF_CMD_BAR)' } },
   'returns': 'UserDefThree',
   'if': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] }
 
-{ 'command': 'TestCmdReturnDefThree', 'returns': 'UserDefThree' }
+{ 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
 
 { 'event': 'TEST_IF_EVENT', 'data':
   { 'foo': 'TestIfStruct',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 882d0e7c56..3f1ea345fd 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -32,7 +32,7 @@ object Union
     case value2: q_empty
     case value3: q_empty
     case value4: q_empty
-command user_def_cmd0 Empty2 -> Empty2
+command user-def-cmd0 Empty2 -> Empty2
     gen=True success_response=True boxed=False oob=False preconfig=False
 enum QEnumTwo
     prefix QENUM_TWO
@@ -190,16 +190,16 @@ object UserDefListUnion
     case any: q_obj_anyList-wrapper
     case user: q_obj_StatusList-wrapper
 include include/sub-module.json
-command user_def_cmd None -> None
+command user-def-cmd None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-object q_obj_user_def_cmd1-arg
+object q_obj_user-def-cmd1-arg
     member ud1a: UserDefOne optional=False
-command user_def_cmd1 q_obj_user_def_cmd1-arg -> None
+command user-def-cmd1 q_obj_user-def-cmd1-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-object q_obj_user_def_cmd2-arg
+object q_obj_user-def-cmd2-arg
     member ud1a: UserDefOne optional=False
     member ud1b: UserDefOne optional=True
-command user_def_cmd2 q_obj_user_def_cmd2-arg -> UserDefTwo
+command user-def-cmd2 q_obj_user-def-cmd2-arg -> UserDefTwo
     gen=True success_response=True boxed=False oob=False preconfig=False
 command cmd-success-response None -> None
     gen=True success_response=False boxed=False oob=False preconfig=False
@@ -319,10 +319,10 @@ object TestIfUnion
     case union_bar: q_obj_str-wrapper
         if ['defined(TEST_IF_UNION_BAR)']
     if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
-object q_obj_TestIfUnionCmd-arg
+object q_obj_test-if-union-cmd-arg
     member union_cmd_arg: TestIfUnion optional=False
     if ['defined(TEST_IF_UNION)']
-command TestIfUnionCmd q_obj_TestIfUnionCmd-arg -> None
+command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     if ['defined(TEST_IF_UNION)']
 alternate TestIfAlternate
@@ -331,21 +331,21 @@ alternate TestIfAlternate
     case bar: TestStruct
         if ['defined(TEST_IF_ALT_BAR)']
     if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
-object q_obj_TestIfAlternateCmd-arg
+object q_obj_test-if-alternate-cmd-arg
     member alt_cmd_arg: TestIfAlternate optional=False
     if ['defined(TEST_IF_ALT)']
-command TestIfAlternateCmd q_obj_TestIfAlternateCmd-arg -> None
+command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     if ['defined(TEST_IF_ALT)']
-object q_obj_TestIfCmd-arg
+object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
         if ['defined(TEST_IF_CMD_BAR)']
     if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
-command TestIfCmd q_obj_TestIfCmd-arg -> UserDefThree
+command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
     if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
-command TestCmdReturnDefThree None -> UserDefThree
+command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
     if ['defined(TEST_IF_ENUM)']
-- 
2.26.3


