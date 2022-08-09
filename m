Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B308758D69F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:41:12 +0200 (CEST)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLLjb-0007aj-Af
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oLLhZ-000691-H6
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oLLhW-00029B-S3
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660037938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0qv/asIz7SFh4YIycmnJpCCzIV1dg99knJDcS3TQPUo=;
 b=AoUPW+euN/P8sSAAVsUHUCIdh+/xgWUciy4ySUaTNNskntzVnlo2ZGc2DwUO5uW4fH9IU/
 HtMCrxTCiGrLuecynqv+uUsMFjGp0vOJXxXgHr7SIMh7qPWk+JkMkTMiFb8CHl+X/AV0XV
 1YMYJ0/YH8nmZ9jQMWpGiUqFUF6MNV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-Zm-TY4EQPle1m2tU7TIP5g-1; Tue, 09 Aug 2022 05:38:54 -0400
X-MC-Unique: Zm-TY4EQPle1m2tU7TIP5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 712F08041B5
 for <qemu-devel@nongnu.org>; Tue,  9 Aug 2022 09:38:54 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4926C2026D64;
 Tue,  9 Aug 2022 09:38:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests/qtest: misc tweaks to readconfig
Date: Tue,  9 Aug 2022 05:38:54 -0400
Message-Id: <20220809093854.168438-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The property name parameter is ignored when visiting a top
level type, but the obvious typo should be fixed to avoid
confusion. A few indentation issues were tidied up. We
can break out of the loop when finding the RNG device.
Finally, close the temp FD immediately when no longer
needed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/readconfig-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 2e604d7c2d..c7a9b0c7dd 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -33,13 +33,12 @@ static QTestState *qtest_init_with_config(const char *cfgdata)
     g_assert_cmpint(cfgfd, >=, 0);
 
     ret = qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
+    close(cfgfd);
     if (ret < 0) {
         unlink(cfgpath);
     }
     g_assert_cmpint(ret, ==, strlen(cfgdata));
 
-    close(cfgfd);
-
     args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
 
     qts = qtest_init(args);
@@ -79,7 +78,7 @@ static void test_x86_memdev(void)
         "size = \"200\"";
 
     qts = qtest_init_with_config(cfgdata);
-   /* Test valid command */
+    /* Test valid command */
     resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
     test_x86_memdev_resp(qdict_get(resp, "return"));
     qobject_unref(resp);
@@ -96,7 +95,7 @@ static void test_spice_resp(QObject *res)
 
     g_assert(res);
     v = qobject_input_visitor_new(res);
-    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
+    visit_type_SpiceInfo(v, "spice", &spice, &error_abort);
 
     g_assert(spice);
     g_assert(spice->enabled);
@@ -114,7 +113,7 @@ static void test_spice(void)
         "unix = \"on\"\n";
 
     qts = qtest_init_with_config(cfgdata);
-   /* Test valid command */
+    /* Test valid command */
     resp = qtest_qmp(qts, "{ 'execute': 'query-spice' }");
     test_spice_resp(qdict_get(resp, "return"));
     qobject_unref(resp);
@@ -144,6 +143,7 @@ static void test_object_rng_resp(QObject *res)
         if (g_str_equal(obj->name, "rng0") &&
             g_str_equal(obj->type, "child<rng-builtin>")) {
             seen_rng = true;
+            break;
         }
 
         tmp = tmp->next;
@@ -164,7 +164,7 @@ static void test_object_rng(void)
         "id = \"rng0\"\n";
 
     qts = qtest_init_with_config(cfgdata);
-   /* Test valid command */
+    /* Test valid command */
     resp = qtest_qmp(qts,
                      "{ 'execute': 'qom-list',"
                      "  'arguments': {'path': '/objects' }}");
-- 
2.37.1


