Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA65682A34
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:15:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnd4-0002OC-3z; Tue, 31 Jan 2023 05:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncl-0002JQ-7T
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncg-0002UE-TF
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3lvftw6sxufJu8UjTmw+olJF55kxX9h8cxqGF98hes=;
 b=AByJ5ZoeaMd7vATXEzkbqURSd5JIOk7qXDWnU7/7f0x4AsOwK67Wndcgzkg50AWwXVF2l+
 ueji9ON96nJ4bEnBkDIkPATK9XwO9aY30vHDZ0bNxpq31BRgHNNXry9S6CD9gFJoW3+4JT
 I5FAd9IAwx/OmqvgJvAd2TyDCgu9b+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-oGL3GhVbNEyOZYEeJSFYpw-1; Tue, 31 Jan 2023 05:12:11 -0500
X-MC-Unique: oGL3GhVbNEyOZYEeJSFYpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1F3C3C02193;
 Tue, 31 Jan 2023 10:12:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7F99C15BAE;
 Tue, 31 Jan 2023 10:12:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/27] tests/qtest/qom-test: Stop spamming the test log
Date: Tue, 31 Jan 2023 11:11:40 +0100
Message-Id: <20230131101205.1499867-3-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

We are still facing the issues that our test logs in the gitlab CI
are too big (and thus cut off). A huge part is still caused by the
qom-test that prints the path and name of each object it looks at
by default. That's too much. Let's be silent by default, and only
print the object path+name when running with V=2 (and the properties
only with V=3 and higher).

Message-Id: <20230118122557.1668860-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/qom-test.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index d380261f8f..d677f87c8e 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -14,7 +14,7 @@
 #include "qemu/cutils.h"
 #include "libqtest.h"
 
-static bool verbose;
+static int verbosity_level;
 
 static void test_properties(QTestState *qts, const char *path, bool recurse)
 {
@@ -24,7 +24,9 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
     QListEntry *entry;
     GSList *children = NULL, *links = NULL;
 
-    g_test_message("Obtaining properties of %s", path);
+    if (verbosity_level >= 2) {
+        g_test_message("Obtaining properties of %s", path);
+    }
     response = qtest_qmp(qts, "{ 'execute': 'qom-list',"
                               "  'arguments': { 'path': %s } }", path);
     g_assert(response);
@@ -51,7 +53,7 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
             }
         } else {
             const char *prop = qdict_get_str(tuple, "name");
-            if (verbose) {
+            if (verbosity_level >= 3) {
                 g_test_message("-> %s", prop);
             }
             tmp = qtest_qmp(qts,
@@ -109,8 +111,8 @@ int main(int argc, char **argv)
 {
     char *v_env = getenv("V");
 
-    if (v_env && atoi(v_env) >= 2) {
-        verbose = true;
+    if (v_env) {
+        verbosity_level = atoi(v_env);
     }
 
     g_test_init(&argc, &argv, NULL);
-- 
2.31.1


