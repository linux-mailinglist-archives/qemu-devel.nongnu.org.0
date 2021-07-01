Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C333B9320
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:22:07 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxZu-0004ps-AQ
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUG-0004nn-AP
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUE-0005vh-JU
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625148974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XaOKYXoE0GpJxdZnxZ/JjXOFdHLIzIRuck0+JTIDLo=;
 b=OgqexPbCRsoXyYRXx+a99nWga4XjKXwSXdU4Cj2T5rT/UkeC4BLwh7hiHsiCuuiRHw+Ja8
 JwJkO0aOupZEsPcp3dtEplCwySX9IwqSMG9Sl7WqSpRdFLz2w0RE6Evql0nwWLo4ZhpJ70
 ipEDxIr/iJxbS7Ey24T5XIjFayDKitw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-noyIZdSIOKWFFVdgkHzw7w-1; Thu, 01 Jul 2021 10:16:12 -0400
X-MC-Unique: noyIZdSIOKWFFVdgkHzw7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414399F92F;
 Thu,  1 Jul 2021 14:16:11 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C1E160843;
 Thu,  1 Jul 2021 14:16:08 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 02/20] tests: migration-test: Add dirty ring test
Date: Thu,  1 Jul 2021 15:15:27 +0100
Message-Id: <20210701141545.193571-3-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Add dirty ring test if kernel supports it.  Add the dirty ring parameter on
source should be mostly enough, but let's change the dest too to make them
match always.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210615175523.439830-3-peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d9225f58d4..9ef6b47135 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -27,6 +27,10 @@
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
 
+#if defined(__linux__)
+#include "linux/kvm.h"
+#endif
+
 /* TODO actually test the results and get rid of this */
 #define qtest_qmp_discard_response(...) qobject_unref(qtest_qmp(__VA_ARGS__))
 
@@ -467,6 +471,8 @@ typedef struct {
     bool use_shmem;
     /* only launch the target process */
     bool only_target;
+    /* Use dirty ring if true; dirty logging otherwise */
+    bool use_dirty_ring;
     char *opts_source;
     char *opts_target;
 } MigrateStart;
@@ -573,11 +579,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         shmem_opts = g_strdup("");
     }
 
-    cmd_source = g_strdup_printf("-accel kvm -accel tcg%s%s "
+    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
                                  "-name source,debug-threads=on "
                                  "-m %s "
                                  "-serial file:%s/src_serial "
                                  "%s %s %s %s",
+                                 args->use_dirty_ring ?
+                                 ",dirty-ring-size=4096" : "",
                                  machine_opts ? " -machine " : "",
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs,
@@ -587,12 +595,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm -accel tcg%s%s "
+    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
                                  "-name target,debug-threads=on "
                                  "-m %s "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s %s",
+                                 args->use_dirty_ring ?
+                                 ",dirty-ring-size=4096" : "",
                                  machine_opts ? " -machine " : "",
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs, uri,
@@ -785,12 +795,14 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
-static void test_precopy_unix(void)
+static void test_precopy_unix_common(bool dirty_ring)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
 
+    args->use_dirty_ring = dirty_ring;
+
     if (test_migrate_start(&from, &to, uri, args)) {
         return;
     }
@@ -825,6 +837,18 @@ static void test_precopy_unix(void)
     test_migrate_end(from, to, true);
 }
 
+static void test_precopy_unix(void)
+{
+    /* Using default dirty logging */
+    test_precopy_unix_common(false);
+}
+
+static void test_precopy_unix_dirty_ring(void)
+{
+    /* Using dirty ring tracking */
+    test_precopy_unix_common(true);
+}
+
 #if 0
 /* Currently upset on aarch64 TCG */
 static void test_ignore_shared(void)
@@ -1369,6 +1393,29 @@ static void test_multifd_tcp_cancel(void)
     test_migrate_end(from, to2, true);
 }
 
+static bool kvm_dirty_ring_supported(void)
+{
+#if defined(__linux__)
+    int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
+
+    if (kvm_fd < 0) {
+        return false;
+    }
+
+    ret = ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DIRTY_LOG_RING);
+    close(kvm_fd);
+
+    /* We test with 4096 slots */
+    if (ret < 4096) {
+        return false;
+    }
+
+    return true;
+#else
+    return false;
+#endif
+}
+
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
@@ -1438,6 +1485,11 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/multifd/tcp/zstd", test_multifd_tcp_zstd);
 #endif
 
+    if (kvm_dirty_ring_supported()) {
+        qtest_add_func("/migration/dirty_ring",
+                       test_precopy_unix_dirty_ring);
+    }
+
     ret = g_test_run();
 
     g_assert_cmpint(ret, ==, 0);
-- 
2.31.1


