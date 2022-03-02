Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027014CADF3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:53:35 +0100 (CET)
Received: from localhost ([::1]:55436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU6Q-0007SM-2w
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkm-0001n5-Jr
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkh-0000Lt-Bv
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBgJE1JRhE6X1SUaBOG+Vqgs+NvOCCVxq25oeP48n54=;
 b=O7Fah5i8fNUNm2sUyiOrEfVwzbAfb8F/E42DeyaveVfoSAPPF52IsG7iZ86zkRt1YjSHuT
 63C4bsTukPnhvJGquAQhGIyHpwOkv6apYhp06ND/dNlEQWPXyn4Bz3o73jrUbxz2PnPc7O
 pJRVprBTYn71SDMv45FJ95aqHrj3ULg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-fLSuthr9PqGyFrh4O7hR8A-1; Wed, 02 Mar 2022 13:31:03 -0500
X-MC-Unique: fLSuthr9PqGyFrh4O7hR8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A4601019983;
 Wed,  2 Mar 2022 18:31:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB541105916D;
 Wed,  2 Mar 2022 18:31:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 17/18] tests: Pass in MigrateStart** into test_migrate_start()
Date: Wed,  2 Mar 2022 18:29:35 +0000
Message-Id: <20220302182936.227719-18-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

test_migrate_start() will release the MigrateStart structure that passed
in, however that's not super clear to the caller because after the call
returned the pointer can still be referenced by the callers.  It can easily
be a source of use-after-free.

Let's pass in a double pointer of that, then we can safely clear the
pointer for the caller after the struct is released.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-26-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Fixup apply since I didn't take 24/25
---
 tests/qtest/migration-test.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7b42f6fd90..0870656d82 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -495,7 +495,7 @@ static void migrate_start_destroy(MigrateStart *args)
 }
 
 static int test_migrate_start(QTestState **from, QTestState **to,
-                              const char *uri, MigrateStart *args)
+                              const char *uri, MigrateStart **pargs)
 {
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
@@ -507,6 +507,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
     const char *machine_opts = NULL;
+    MigrateStart *args = *pargs;
     const char *memory_size;
     int ret = 0;
 
@@ -621,6 +622,8 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 
 out:
     migrate_start_destroy(args);
+    /* This tells the caller that this structure is gone */
+    *pargs = NULL;
     return ret;
 }
 
@@ -665,7 +668,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return -1;
     }
 
@@ -788,7 +791,7 @@ static void test_baddest(void)
 
     args->hide_stderr = true;
 
-    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
+    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
         return;
     }
     migrate_qmp(from, "tcp:127.0.0.1:0", "{}");
@@ -804,7 +807,7 @@ static void test_precopy_unix_common(bool dirty_ring)
 
     args->use_dirty_ring = dirty_ring;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -892,7 +895,7 @@ static void test_xbzrle(const char *uri)
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -946,7 +949,7 @@ static void test_precopy_tcp(void)
     g_autofree char *uri = NULL;
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
+    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
         return;
     }
 
@@ -991,7 +994,7 @@ static void test_migrate_fd_proto(void)
     QDict *rsp;
     const char *error_desc;
 
-    if (test_migrate_start(&from, &to, "defer", args)) {
+    if (test_migrate_start(&from, &to, "defer", &args)) {
         return;
     }
 
@@ -1071,7 +1074,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -1163,7 +1166,7 @@ static void test_migrate_auto_converge(void)
      */
     const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -1232,7 +1235,7 @@ static void test_multifd_tcp(const char *method)
     QDict *rsp;
     g_autofree char *uri = NULL;
 
-    if (test_migrate_start(&from, &to, "defer", args)) {
+    if (test_migrate_start(&from, &to, "defer", &args)) {
         return;
     }
 
@@ -1318,7 +1321,7 @@ static void test_multifd_tcp_cancel(void)
 
     args->hide_stderr = true;
 
-    if (test_migrate_start(&from, &to, "defer", args)) {
+    if (test_migrate_start(&from, &to, "defer", &args)) {
         return;
     }
 
@@ -1357,7 +1360,7 @@ static void test_multifd_tcp_cancel(void)
     args = migrate_start_new();
     args->only_target = true;
 
-    if (test_migrate_start(&from, &to2, "defer", args)) {
+    if (test_migrate_start(&from, &to2, "defer", &args)) {
         return;
     }
 
-- 
2.35.1


