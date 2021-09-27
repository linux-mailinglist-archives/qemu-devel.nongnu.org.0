Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8C4194DD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:12:24 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqQh-0003FM-Q2
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLR-0003EN-Rv
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLP-0003iq-OK
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZRFRPs1pCmXQnNIp0HFzrbastWDL2VvEBNYCb7oCdA=;
 b=DN3ijWos5VECHaKjB43xqrW04l+fS+ppvbc3Qy/bvtaMvhB8G3t7o+xRubNr4StgpgEo6o
 J8PYx9RqTOnGxDnk4cz88Xittr9HtPYwKsdG0/PR94rqmPBFY1GDiFCODHMUCxfN78ziP9
 ok5g/XyjC9BQAQiik0yil7hg9z4bQ2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-wowr6cZcNHSm0G8nAa-AFQ-1; Mon, 27 Sep 2021 09:06:53 -0400
X-MC-Unique: wowr6cZcNHSm0G8nAa-AFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB2083DBD3;
 Mon, 27 Sep 2021 13:06:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F5F360C13;
 Mon, 27 Sep 2021 13:06:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B09B411380B9; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/25] tests/qapi-schema: Rewrite simple union TestIfUnion
 to be flat
Date: Mon, 27 Sep 2021 15:06:39 +0200
Message-Id: <20210927130647.1271533-18-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, rewrite TestIfUnion to be flat.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-18-armbru@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json |  4 +++-
 tests/qapi-schema/qapi-schema-test.out  | 16 ++++++----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index eae43f41c4..ef17ab1aae 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -229,8 +229,10 @@
   'if': 'TEST_IF_ENUM' }
 
 { 'union': 'TestIfUnion',
+  'base': { 'type': 'TestIfEnum' },
+  'discriminator': 'type',
   'data': { 'foo': 'TestStruct',
-            'bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
+            'bar': { 'type': 'UserDefZero', 'if': 'TEST_IF_ENUM_BAR'} },
   'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-union-cmd',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e43073d795..07e4161331 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -257,19 +257,15 @@ enum TestIfEnum
     member bar
         if TEST_IF_ENUM_BAR
     if TEST_IF_ENUM
-object q_obj_TestStruct-wrapper
-    member data: TestStruct optional=False
-enum TestIfUnionKind
-    member foo
-    member bar
-        if TEST_IF_UNION_BAR
+object q_obj_TestIfUnion-base
+    member type: TestIfEnum optional=False
     if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 object TestIfUnion
-    member type: TestIfUnionKind optional=False
+    base q_obj_TestIfUnion-base
     tag type
-    case foo: q_obj_TestStruct-wrapper
-    case bar: q_obj_str-wrapper
-        if TEST_IF_UNION_BAR
+    case foo: TestStruct
+    case bar: UserDefZero
+        if TEST_IF_ENUM_BAR
     if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-- 
2.31.1


