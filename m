Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4C9400620
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:50:28 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFCl-0004pY-Rr
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvF-0005m4-0I
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvD-0003bK-4x
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEEZ4ch5/qs/4u+VvW1u+ltQl8zE3FlPZy53bDszeho=;
 b=LNP7Yj09eHO5fvXSivMlPcmk4CNtFBceMVehu9Z6n8aeAYzC4kbMk+gL/reG0l7j3ARNys
 gFWXnuN2UVJ0YOFzy2M6VA1AruHLrOb9yH7YFCHeuxA/C29L1emqadloT9bqVwBPnoCCvz
 rL4guwy4+HdC7e++qtQovStfkd4Fhrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-j9kV65cLP8uKc_WOewh9Sw-1; Fri, 03 Sep 2021 15:32:17 -0400
X-MC-Unique: j9kV65cLP8uKc_WOewh9Sw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87368501E5;
 Fri,  3 Sep 2021 19:32:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C6F7100164A;
 Fri,  3 Sep 2021 19:32:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB1DB1138221; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] tests/qapi-schema: Correct two 'if' conditionals
Date: Fri,  3 Sep 2021 21:32:00 +0200
Message-Id: <20210903193209.1426791-5-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
Message-Id: <20210831123809.1107782-4-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


