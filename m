Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD06A611D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:17:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7KF-0004PD-Di; Tue, 28 Feb 2023 16:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7K9-0004OB-TL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7K8-0004LH-4y
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677618947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91xrWNrIFc5KJYlLZr/qQHRa5CP3dakRgPr1I+HWECc=;
 b=RC6kmTYt+aby5fQH5Ms0dDCA7TZ0ctUdJ3uNxinYob3tof3OkpZmTuCUNO7h1HjHfM5592
 UeMLJsStp2RT86gmvHWjuF1+tWOa6rPscJtIao1wUsoPWqB1pc5Ki47hBvfONr0IjrrUW6
 fTV/iD9mJv2gcGXJaCqZWpsYGdZnMws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-5y6mXw66OOSIvewGsAE1lg-1; Tue, 28 Feb 2023 16:15:43 -0500
X-MC-Unique: 5y6mXw66OOSIvewGsAE1lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0AE91C04191;
 Tue, 28 Feb 2023 21:15:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F066040C6EC4;
 Tue, 28 Feb 2023 21:15:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 1/6] tests/qtest/readconfig: Rework test_object_rng_resp into
 a generic function
Date: Tue, 28 Feb 2023 22:15:28 +0100
Message-Id: <20230228211533.201837-2-thuth@redhat.com>
In-Reply-To: <20230228211533.201837-1-thuth@redhat.com>
References: <20230228211533.201837-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

test_object_rng_resp() can be reworked quite easily to allow
testing for arbitrary objects in the qom-list response.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/readconfig-test.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 9ef870643d..26d79b5e4b 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -124,13 +124,15 @@ static void test_spice(void)
 }
 #endif
 
-static void test_object_rng_resp(QObject *res)
+static void test_object_available(QObject *res, const char *name,
+                                  const char *type)
 {
     Visitor *v;
     g_autoptr(ObjectPropertyInfoList) objs = NULL;
     ObjectPropertyInfoList *tmp;
     ObjectPropertyInfo *obj;
-    bool seen_rng = false;
+    bool object_available = false;
+    g_autofree char *childtype = g_strdup_printf("child<%s>", type);
 
     g_assert(res);
     v = qobject_input_visitor_new(res);
@@ -142,16 +144,15 @@ static void test_object_rng_resp(QObject *res)
         g_assert(tmp->value);
 
         obj = tmp->value;
-        if (g_str_equal(obj->name, "rng0") &&
-            g_str_equal(obj->type, "child<rng-builtin>")) {
-            seen_rng = true;
+        if (g_str_equal(obj->name, name) && g_str_equal(obj->type, childtype)) {
+            object_available = true;
             break;
         }
 
         tmp = tmp->next;
     }
 
-    g_assert(seen_rng);
+    g_assert(object_available);
 
     visit_free(v);
 }
@@ -170,7 +171,7 @@ static void test_object_rng(void)
     resp = qtest_qmp(qts,
                      "{ 'execute': 'qom-list',"
                      "  'arguments': {'path': '/objects' }}");
-    test_object_rng_resp(qdict_get(resp, "return"));
+    test_object_available(qdict_get(resp, "return"), "rng0", "rng-builtin");
     qobject_unref(resp);
 
     qtest_quit(qts);
-- 
2.31.1


