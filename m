Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5257A570
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:33:34 +0200 (CEST)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDr6D-0006bn-OF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqce-0006ry-Tp
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcd-0002xW-CG
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658250177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YGjtVmacVqJNcP+bptc/jZx8APX15b7UgqdT7tHCaA=;
 b=jFXxjeI4NyxpHVGjBsMh2Utfg0tKth+B5WhaeEftDMSEN+xRZB1LwU5HeSlskNi9PTLlnv
 wu0jzHjrlcWH/WkNAjztSXnwQy4t+HtEdZDbYkxTb4frOsPLDyClaRPkgiuWpd6gRsqBvT
 PsgpYMYGNZexkRlqxc++Bwm9i0QDDKg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-vgoKc93NOEKFdgNdMd9GvA-1; Tue, 19 Jul 2022 13:02:53 -0400
X-MC-Unique: vgoKc93NOEKFdgNdMd9GvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F6842999B2A;
 Tue, 19 Jul 2022 17:02:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B75540466A6;
 Tue, 19 Jul 2022 17:02:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 22/29] tests: Add postcopy tls recovery migration test
Date: Tue, 19 Jul 2022 18:02:14 +0100
Message-Id: <20220719170221.576190-23-dgilbert@redhat.com>
In-Reply-To: <20220719170221.576190-1-dgilbert@redhat.com>
References: <20220719170221.576190-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Peter Xu <peterx@redhat.com>

It's easy to build this upon the postcopy tls test.  Rename the old
postcopy recovery test to postcopy/recovery/plain.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220707185527.27747-1-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Manual merge
---
 tests/qtest/migration-test.c | 37 +++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index b2020ef6c5..e9350ea8c6 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1146,17 +1146,15 @@ static void test_postcopy_tls_psk(void)
 }
 #endif
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_recovery_common(MigrateCommon *args)
 {
-    MigrateCommon args = {
-        .start = {
-            .hide_stderr = true,
-        },
-    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    /* Always hide errors for postcopy recover tests since they're expected */
+    args->start.hide_stderr = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
 
@@ -1207,7 +1205,24 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to, &args);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy_recovery(void)
+{
+    MigrateCommon args = { };
+
+    test_postcopy_recovery_common(&args);
+}
+
+static void test_postcopy_recovery_tls_psk(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2410,7 +2425,9 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/recovery/plain",
+                   test_postcopy_recovery);
+
     qtest_add_func("/migration/postcopy/plain", test_postcopy);
 
     qtest_add_func("/migration/bad_dest", test_baddest);
@@ -2425,6 +2442,8 @@ int main(int argc, char **argv)
      * general postcopy path that has TLS channel enabled.
      */
     qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
+    qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                   test_postcopy_recovery_tls_psk);
 #ifdef CONFIG_TASN1
     qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
                    test_precopy_unix_tls_x509_default_host);
-- 
2.36.1


