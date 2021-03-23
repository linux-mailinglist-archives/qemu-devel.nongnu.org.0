Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845D345B70
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:56:48 +0100 (CET)
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdmJ-0008F7-1L
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWq-0001em-Fo
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWj-00024P-2B
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2TeR91o4Shx9u2qZhtd0cglToOapuruDzLfwOUVzMg=;
 b=QJgCLo7F88SAhkWAiNKj7GpMevHNJRZf8a22gjv8ykhYdVsUEXY/C7oNFLccFE2VXNK7Ad
 dlEPJsYakZg0EqecVy7nc/D+58+G19/QcukxW2hnk/RtDHYnLxM4JmsEW18vBCp5otxhge
 U4kVlkkl8Rmg+yCfDwE7l2FVVAoYUhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-SNATr9RuPy-95rZSxhXj7Q-1; Tue, 23 Mar 2021 05:40:36 -0400
X-MC-Unique: SNATr9RuPy-95rZSxhXj7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21B3C87A83B;
 Tue, 23 Mar 2021 09:40:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEEA95C1A3;
 Tue, 23 Mar 2021 09:40:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2504911326B3; Tue, 23 Mar 2021 10:40:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/28] qapi: Enforce union and alternate branch naming rules
Date: Tue, 23 Mar 2021 10:40:25 +0100
Message-Id: <20210323094025.3569441-29-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Union branche names should use '-', not '_'.  Enforce this.  The only
offenders are in tests/.  Fix them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py                        | 4 ++--
 tests/qapi-schema/alternate-clash.err       | 2 +-
 tests/qapi-schema/alternate-clash.json      | 6 ++++--
 tests/qapi-schema/qapi-schema-test.json     | 2 +-
 tests/qapi-schema/qapi-schema-test.out      | 4 ++--
 tests/qapi-schema/union-clash-branches.err  | 2 +-
 tests/qapi-schema/union-clash-branches.json | 6 ++++--
 7 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index d5fc3ced4c..9e424255dd 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -274,7 +274,7 @@ def check_union(expr, info):
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         if discriminator is None:
-            check_name_lower(key, info, source, permit_underscore=True)
+            check_name_lower(key, info, source)
         # else: name is in discriminator enum, which gets checked
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
@@ -288,7 +288,7 @@ def check_alternate(expr, info):
         raise QAPISemError(info, "'data' must not be empty")
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
-        check_name_lower(key, info, source, permit_underscore=True)
+        check_name_lower(key, info, source)
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
         check_type(value['type'], info, source)
diff --git a/tests/qapi-schema/alternate-clash.err b/tests/qapi-schema/alternate-clash.err
index 0fe02f2c99..caa2d42e3f 100644
--- a/tests/qapi-schema/alternate-clash.err
+++ b/tests/qapi-schema/alternate-clash.err
@@ -1,2 +1,2 @@
 alternate-clash.json: In alternate 'Alt1':
-alternate-clash.json:4: branch 'a_b' collides with branch 'a-b'
+alternate-clash.json:6: name of 'data' member 'a_b' must not use uppercase or '_'
diff --git a/tests/qapi-schema/alternate-clash.json b/tests/qapi-schema/alternate-clash.json
index 039c4be658..87f061a74a 100644
--- a/tests/qapi-schema/alternate-clash.json
+++ b/tests/qapi-schema/alternate-clash.json
@@ -1,5 +1,7 @@
 # Alternate branch name collision
-# Reject an alternate that would result in a collision in generated C
-# names (this would try to generate two union members named 'a_b').
+# Naming rules make collision impossible (even with the pragma).  If
+# that wasn't the case, then we'd get a collision in generated C: two
+# union members a_b.
+{ 'pragma': { 'member-name-exceptions': [ 'Alt1' ] } }
 { 'alternate': 'Alt1',
   'data': { 'a-b': 'bool', 'a_b': 'int' } }
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 387678acbb..84b9d41f15 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -231,7 +231,7 @@
 
 { 'union': 'TestIfUnion', 'data':
   { 'foo': 'TestStruct',
-    'union_bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
+    'bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
   'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
 
 { 'command': 'test-if-union-cmd',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 51efe5d7cd..e0b8a5f0b6 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -309,14 +309,14 @@ object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
-    member union_bar
+    member bar
         if ['defined(TEST_IF_UNION_BAR)']
     if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
-    case union_bar: q_obj_str-wrapper
+    case bar: q_obj_str-wrapper
         if ['defined(TEST_IF_UNION_BAR)']
     if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
 object q_obj_test-if-union-cmd-arg
diff --git a/tests/qapi-schema/union-clash-branches.err b/tests/qapi-schema/union-clash-branches.err
index 73bbc2cabd..ef53645728 100644
--- a/tests/qapi-schema/union-clash-branches.err
+++ b/tests/qapi-schema/union-clash-branches.err
@@ -1,2 +1,2 @@
 union-clash-branches.json: In union 'TestUnion':
-union-clash-branches.json:4: branch 'a_b' collides with branch 'a-b'
+union-clash-branches.json:6: name of 'data' member 'a_b' must not use uppercase or '_'
diff --git a/tests/qapi-schema/union-clash-branches.json b/tests/qapi-schema/union-clash-branches.json
index 3bece8c948..7bdda0b0da 100644
--- a/tests/qapi-schema/union-clash-branches.json
+++ b/tests/qapi-schema/union-clash-branches.json
@@ -1,5 +1,7 @@
 # Union branch name collision
-# Reject a union that would result in a collision in generated C names (this
-# would try to generate two members 'a_b').
+# Naming rules make collision impossible (even with the pragma).  If
+# that wasn't the case, then we'd get collisions in generated C: two
+# union members a_b, and two enum members TEST_UNION_A_B.
+{ 'pragma': { 'member-name-exceptions': [ 'TestUnion' ] } }
 { 'union': 'TestUnion',
   'data': { 'a-b': 'int', 'a_b': 'str' } }
-- 
2.26.3


