Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6726EEDE1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAX-0006Jg-Up; Wed, 26 Apr 2023 01:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA4-00064y-B3
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA1-0002ko-CM
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRk1nFbnqOhorbVjQ1hQZKVhXqGBVGhh4vs3W09hBcI=;
 b=gXm7AkJ+QNccwmY226zx1bPEGsw9ue657brvyyRu+gYAL2OJhY/OBQFPrwmlBG8gGw9gJR
 8tc66JW8vFZbgo+MEJ2BFHjAUD7M9xcwXBceOpPhJ+Wg2FmaVTVhgvsxv/NQnwYlJkxxxF
 ksG5ebISyUO/Pk9ylT7FJncp9BH2yvo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-ndPmPqqxPaCrocgvqVcDiw-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: ndPmPqqxPaCrocgvqVcDiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 805401C06EDE;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F7452027045;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3636421F9821; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Eric Blake <eblake@redhat.com>
Subject: [PULL 11/17] tests/qapi-schema: Clean up positive test for
 conditionals
Date: Wed, 26 Apr 2023 07:57:38 +0200
Message-Id: <20230426055744.1041930-12-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Union TestIfUnion is conditional on macros TEST_IF_UNION and
TEST_IF_STRUCT.  It uses TestIfEnum, which is conditional on macro
TEST_IF_ENUM.  If TEST_IF_UNION and TEST_IF_STRUCT are defined, but
TEST_IF_ENUM isn't, the generated code won't compile.

Command test-if-cmd is conditional an macros TEST_IF_CMD and
TEST_IF_STRUCT, and uses TestIfEnum.  Similar issue.

Event TEST_IF_EVENT is conditional an macros TEST_IF_EVT and
TEST_IF_STRUCT, and uses TestIfEnum.  Similar issue.

Replace the uses of TestIfEnum in the latter two by str.

TestIfUnion is now TestIfEnum's only user.  Change TestIfEnum's
condition to TEST_IF_UNION.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230316071325.492471-12-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[Commit message corrected]
---
 tests/qapi-schema/qapi-schema-test.json | 6 +++---
 tests/qapi-schema/qapi-schema-test.out  | 8 +++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 5728d4de38..8f0ee95d23 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -225,7 +225,7 @@
 
 { 'enum': 'TestIfEnum',
   'data': [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_MEMBER' } ],
-  'if': 'TEST_IF_ENUM' }
+  'if': 'TEST_IF_UNION' }
 
 { 'union': 'TestIfUnion',
   'base': { 'type': 'TestIfEnum' },
@@ -250,7 +250,7 @@
 { 'command': 'test-if-cmd',
   'data': {
     'foo': 'TestIfStruct',
-    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_ARG' } },
+    'bar': { 'type': 'str', 'if': 'TEST_IF_CMD_ARG' } },
   'returns': 'UserDefThree',
   'if': { 'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT'] } }
 
@@ -258,7 +258,7 @@
 
 { 'event': 'TEST_IF_EVENT',
   'data': { 'foo': 'TestIfStruct',
-            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_ARG' } },
+            'bar': { 'type': ['str'], 'if': 'TEST_IF_EVT_ARG' } },
   'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
 { 'event': 'TEST_IF_EVENT2', 'data': {},
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index cbd96f0b24..715f3a3f23 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -252,7 +252,7 @@ enum TestIfEnum
     member foo
     member bar
         if TEST_IF_ENUM_MEMBER
-    if TEST_IF_ENUM
+    if TEST_IF_UNION
 object q_obj_TestIfUnion-base
     member type: TestIfEnum optional=False
     if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
@@ -283,7 +283,7 @@ command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
-    member bar: TestIfEnum optional=False
+    member bar: str optional=False
         if TEST_IF_CMD_ARG
     if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
@@ -291,11 +291,9 @@ command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-array TestIfEnumList TestIfEnum
-    if TEST_IF_ENUM
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
-    member bar: TestIfEnumList optional=False
+    member bar: strList optional=False
         if TEST_IF_EVT_ARG
     if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
-- 
2.39.2


