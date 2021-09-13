Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68D408DC0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:28:38 +0200 (CEST)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPm0j-0003UX-QI
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFY-0000LH-0K
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFT-0000jD-Lf
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmxzRf8YwTF05kblBr8hDdHUFEA3kja80XGlFQDQ7ts=;
 b=bxEOirF4pV7mnxWKvjA4ZogGsps0EQFxVGJnRKlKf0qgC+6CnByjWVE10nYnapkOk1cp3K
 y0rS80uG4zNQHgTO/qXL82wf58KaI8WWSffduAGyhCDq4OK6tTqFCqcftBjoKEABLOU8/k
 s2wF9K+Ex73+WIWfR+QVzaEBB2ikMQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315---U91spUPFKYx0E1d2SJQQ-1; Mon, 13 Sep 2021 08:39:44 -0400
X-MC-Unique: --U91spUPFKYx0E1d2SJQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C503C93C
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9758577F35;
 Mon, 13 Sep 2021 12:39:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 44F1E11380B9; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/22] tests/qapi-schema: Rewrite simple union TestIfUnion to
 be flat
Date: Mon, 13 Sep 2021 14:39:27 +0200
Message-Id: <20210913123932.3306639-18-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: jsnow@redhat.com, eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, rewrite TestIfUnion to be flat.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


