Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F988418020
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 08:52:03 +0200 (CEST)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU1XW-0001VA-EE
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 02:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU187-0007eB-J1
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU17y-0007Fm-Lb
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632551137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ups1L4r4vr298+cwSmkUAYzRSDFIKAmpPsWktfvFTj8=;
 b=g6pLuHTJWgYwI6r+VN8iItpjWUPk2tQBSJjDy30R2SXBw17myzrMalPxozokMlxtv8reix
 s40ZMh32uaMP9aF5Zl/6/UPKn+FdhYiw1jPXrXu0mhk5hDdNeg+xRbxbB+fQRNGuamdRnG
 vWZSluZ7YmxYCuDFTKg+vk3YekWqCf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-lzCJ0_jtPU6--mf9ls4-FA-1; Sat, 25 Sep 2021 02:25:35 -0400
X-MC-Unique: lzCJ0_jtPU6--mf9ls4-FA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37268362F9;
 Sat, 25 Sep 2021 06:25:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BCE960936;
 Sat, 25 Sep 2021 06:25:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 559F711380BC; Sat, 25 Sep 2021 08:25:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/25] test-clone-visitor: Wean off __org.qemu_x-Union1
Date: Sat, 25 Sep 2021 08:25:18 +0200
Message-Id: <20210925062525.988405-19-armbru@redhat.com>
In-Reply-To: <20210925062525.988405-1-armbru@redhat.com>
References: <20210925062525.988405-1-armbru@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_clone_complex3() uses simple union __org.qemu_x-Union1 to cover
arrays.  Use UserDefOneList instead.  Unions are still covered by
test_clone_complex1().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-19-armbru@redhat.com>
---
 tests/unit/test-clone-visitor.c | 70 ++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/tests/unit/test-clone-visitor.c b/tests/unit/test-clone-visitor.c
index 8357a90e60..4048018607 100644
--- a/tests/unit/test-clone-visitor.c
+++ b/tests/unit/test-clone-visitor.c
@@ -153,42 +153,48 @@ static void test_clone_complex2(void)
 
 static void test_clone_complex3(void)
 {
-    __org_qemu_x_Struct2 *src, *dst;
-    __org_qemu_x_Union1List *tmp;
+    UserDefOneList *src, *dst, *tail;
+    UserDefOne *elt;
 
-    src = g_new0(__org_qemu_x_Struct2, 1);
-    tmp = src->array = g_new0(__org_qemu_x_Union1List, 1);
-    tmp->value = g_new0(__org_qemu_x_Union1, 1);
-    tmp->value->type = ORG_QEMU_X_UNION1_KIND___ORG_QEMU_X_BRANCH;
-    tmp->value->u.__org_qemu_x_branch.data = g_strdup("one");
-    tmp = tmp->next = g_new0(__org_qemu_x_Union1List, 1);
-    tmp->value = g_new0(__org_qemu_x_Union1, 1);
-    tmp->value->type = ORG_QEMU_X_UNION1_KIND___ORG_QEMU_X_BRANCH;
-    tmp->value->u.__org_qemu_x_branch.data = g_strdup("two");
-    tmp = tmp->next = g_new0(__org_qemu_x_Union1List, 1);
-    tmp->value = g_new0(__org_qemu_x_Union1, 1);
-    tmp->value->type = ORG_QEMU_X_UNION1_KIND___ORG_QEMU_X_BRANCH;
-    tmp->value->u.__org_qemu_x_branch.data = g_strdup("three");
+    src = NULL;
+    elt = g_new0(UserDefOne, 1);
+    elt->integer = 3;
+    elt->string = g_strdup("three");
+    elt->has_enum1 = true;
+    elt->enum1 = ENUM_ONE_VALUE3;
+    QAPI_LIST_PREPEND(src, elt);
+    elt = g_new0(UserDefOne, 1);
+    elt->integer = 2;
+    elt->string = g_strdup("two");
+    QAPI_LIST_PREPEND(src, elt);
+    elt = g_new0(UserDefOne, 1);
+    elt->integer = 1;
+    elt->string = g_strdup("one");
+    QAPI_LIST_PREPEND(src, elt);
+
+    dst = QAPI_CLONE(UserDefOneList, src);
 
-    dst = QAPI_CLONE(__org_qemu_x_Struct2, src);
     g_assert(dst);
-    tmp = dst->array;
-    g_assert(tmp);
-    g_assert(tmp->value);
-    g_assert_cmpstr(tmp->value->u.__org_qemu_x_branch.data, ==, "one");
-    tmp = tmp->next;
-    g_assert(tmp);
-    g_assert(tmp->value);
-    g_assert_cmpstr(tmp->value->u.__org_qemu_x_branch.data, ==, "two");
-    tmp = tmp->next;
-    g_assert(tmp);
-    g_assert(tmp->value);
-    g_assert_cmpstr(tmp->value->u.__org_qemu_x_branch.data, ==, "three");
-    tmp = tmp->next;
-    g_assert(!tmp);
+    tail = dst;
+    elt = tail->value;
+    g_assert_cmpint(elt->integer, ==, 1);
+    g_assert_cmpstr(elt->string, ==, "one");
+    g_assert(!elt->has_enum1);
+    tail = tail->next;
+    elt = tail->value;
+    g_assert_cmpint(elt->integer, ==, 2);
+    g_assert_cmpstr(elt->string, ==, "two");
+    g_assert(!elt->has_enum1);
+    tail = tail->next;
+    elt = tail->value;
+    g_assert_cmpint(elt->integer, ==, 3);
+    g_assert_cmpstr(elt->string, ==, "three");
+    g_assert(elt->has_enum1);
+    g_assert_cmpint(elt->enum1, ==, ENUM_ONE_VALUE3);
+    g_assert(!tail->next);
 
-    qapi_free___org_qemu_x_Struct2(src);
-    qapi_free___org_qemu_x_Struct2(dst);
+    qapi_free_UserDefOneList(src);
+    qapi_free_UserDefOneList(dst);
 }
 
 int main(int argc, char **argv)
-- 
2.31.1


