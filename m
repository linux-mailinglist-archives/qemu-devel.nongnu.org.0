Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817F440FA9D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:44:38 +0200 (CEST)
Received: from localhost ([::1]:33070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRF6T-000490-Jo
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREuB-0004QX-Bw
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREu0-0000Hm-UJ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTmjvmDdHz6KBVuQcVLqVmzAyIzWvbODts/ba7ZoDYU=;
 b=Xd1pNGj+4atwKhG8Coa4lpOwVyLHRFCCnq6Vhfw9pVUAw+BqG2MXFc2h0l3k+AeApSr5a/
 JxxIbzKTgm9eadKzTbwak9Qw1MwgzDugevnkg5C7Gcvfml4aeEBQXEOIAqnOe1XjcY4VB5
 Kp5DwrV/IOi7ulif9hOzYTDiD3vNjLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-6z-oOTHTNayr_0NIx5bviA-1; Fri, 17 Sep 2021 10:31:41 -0400
X-MC-Unique: 6z-oOTHTNayr_0NIx5bviA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B72B8145E5;
 Fri, 17 Sep 2021 14:31:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7FD417CF0;
 Fri, 17 Sep 2021 14:31:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 86BBA11380AB; Fri, 17 Sep 2021 16:31:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/23] test-clone-visitor: Wean off UserDefListUnion
Date: Fri, 17 Sep 2021 16:31:25 +0200
Message-Id: <20210917143134.412106-15-armbru@redhat.com>
In-Reply-To: <20210917143134.412106-1-armbru@redhat.com>
References: <20210917143134.412106-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: jsnow@redhat.com, michael.roth@amd.com, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_clone_complex1() uses simple union UserDefListUnion to cover
unions.  Use UserDefFlatUnion instead.  Arrays are still covered by
test_clone_complex3().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-clone-visitor.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-clone-visitor.c b/tests/unit/test-clone-visitor.c
index 4944b3d857..8357a90e60 100644
--- a/tests/unit/test-clone-visitor.c
+++ b/tests/unit/test-clone-visitor.c
@@ -99,18 +99,26 @@ static void test_clone_empty(void)
 
 static void test_clone_complex1(void)
 {
-    UserDefListUnion *src, *dst;
+    UserDefFlatUnion *src, *dst;
 
-    src = g_new0(UserDefListUnion, 1);
-    src->type = USER_DEF_LIST_UNION_KIND_STRING;
+    src = g_new0(UserDefFlatUnion, 1);
+    src->integer = 123;
+    src->string = g_strdup("abc");
+    src->enum1 = ENUM_ONE_VALUE1;
+    src->u.value1.boolean = true;
 
-    dst = QAPI_CLONE(UserDefListUnion, src);
+    dst = QAPI_CLONE(UserDefFlatUnion, src);
     g_assert(dst);
-    g_assert_cmpint(dst->type, ==, src->type);
-    g_assert(!dst->u.string.data);
 
-    qapi_free_UserDefListUnion(src);
-    qapi_free_UserDefListUnion(dst);
+    g_assert_cmpint(dst->integer, ==, 123);
+    g_assert_cmpstr(dst->string, ==, "abc");
+    g_assert_cmpint(dst->enum1, ==, ENUM_ONE_VALUE1);
+    g_assert(dst->u.value1.boolean);
+    g_assert(!dst->u.value1.has_a_b);
+    g_assert_cmpint(dst->u.value1.a_b, ==, 0);
+
+    qapi_free_UserDefFlatUnion(src);
+    qapi_free_UserDefFlatUnion(dst);
 }
 
 static void test_clone_complex2(void)
-- 
2.31.1


