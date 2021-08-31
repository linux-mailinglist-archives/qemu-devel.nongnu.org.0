Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A23FC7F1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:13:35 +0200 (CEST)
Received: from localhost ([::1]:43800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3a2-0005je-7D
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL322-0006H7-Dh
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31z-0005IR-63
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2zPZGxgMrBJEV+cKwF/OfDnS5JDVY1jTf755tcMGXA=;
 b=cjQbV353nvUP6Q1IWooIntchQpalLLxAiIuvh/cjP3K/w83+U9qvzOfLD0bqm/crNU/TIc
 WMhbSso7/l5yw3nlbfUYqdu8NYvZMvJ7jYz21FpA5v2TzTCyLYJMIFZvT0js7SbKZFIqPp
 zullqgw1vr+P0Sdvzg5JPiz7Uft7Rhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-p9Xl7OYjPbyYQsvd7z53RQ-1; Tue, 31 Aug 2021 08:38:19 -0400
X-MC-Unique: p9Xl7OYjPbyYQsvd7z53RQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88D4B192FDA2;
 Tue, 31 Aug 2021 12:38:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C17CC5DA2D;
 Tue, 31 Aug 2021 12:38:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 608FB11380B0; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/12] tests/qapi-schema: Correct two 'if' conditionals
Date: Tue, 31 Aug 2021 14:38:00 +0200
Message-Id: <20210831123809.1107782-4-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A definition's conditional should imply the conditionals of types it
uses.  If it doesn't, some configurations won't compile.

Example (from tests/qapi-schema/qapi-schema-test.json):

    { 'union': 'TestIfUnion', 'data':
      { 'foo': 'TestStruct',
	'bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
      'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }

    { 'command': 'test-if-union-cmd',
      'data': { 'union-cmd-arg': 'TestIfUnion' },
      'if': 'TEST_IF_UNION' }

generates

    #if (defined(TEST_IF_UNION)) && (defined(TEST_IF_STRUCT))
    typedef struct TestIfUnion TestIfUnion;
    #endif /* (defined(TEST_IF_UNION)) && (defined(TEST_IF_STRUCT)) */

and

    #if defined(TEST_IF_UNION)
    void qmp_test_if_union_cmd(TestIfUnion *union_cmd_arg, Error **errp);
    void qmp_marshal_test_if_union_cmd(QDict *args, QObject **ret, Error **errp);
    #endif /* defined(TEST_IF_UNION) */

which doesn't compile when !defined(TEST_IF_STRUCT).

Messed up in f8c4fdd6ae "tests/qapi: Cover commands with 'if' and
union / alternate 'data'", v4.0.0.  Harmless, as we don't actually use
this configuration.  Correct it anyway, along with another instance.

This loses coverage for 'not'.  The next commit will bring it back.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json | 5 ++---
 tests/qapi-schema/qapi-schema-test.out  | 8 ++++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index fe028145e4..e20f76d84c 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -236,7 +236,7 @@
 
 { 'command': 'test-if-union-cmd',
   'data': { 'union-cmd-arg': 'TestIfUnion' },
-  'if': 'TEST_IF_UNION' }
+  'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
 
 { 'alternate': 'TestIfAlternate', 'data':
   { 'foo': 'int',
@@ -245,8 +245,7 @@
 
 { 'command': 'test-if-alternate-cmd',
   'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': { 'all': ['TEST_IF_ALT',
-                  {'not': 'TEST_IF_NOT_ALT'}] } }
+  'if': { 'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-cmd',
   'data': {
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 3d0c6a8f28..517d802636 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -321,10 +321,10 @@ object TestIfUnion
     if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if TEST_IF_UNION
+    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if TEST_IF_UNION
+    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
 alternate TestIfAlternate
     tag type
     case foo: int
@@ -333,10 +333,10 @@ alternate TestIfAlternate
     if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if OrderedDict([('all', ['TEST_IF_ALT', OrderedDict([('not', 'TEST_IF_NOT_ALT')])])])
+    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['TEST_IF_ALT', OrderedDict([('not', 'TEST_IF_NOT_ALT')])])])
+    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-- 
2.31.1


