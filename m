Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3932879BA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 18:12:08 +0200 (CEST)
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQYWU-000544-Pd
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 12:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kQYOP-0005NQ-VO
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 12:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kQYOK-0004N9-VT
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 12:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602173018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LI2yQBdRVB5RJHtXOO354AUUzZFLPc8JCBDVL3xXvos=;
 b=eHJ+QxciZVZLdqhn6ZUfqt4atxs3HLNq4KBCPYaIXGlR5070kJcnlfoa8jQJTLmTdKycC4
 jQd5oEtjrTcUTWXuFIRZL7wwmMV4tVfLS6de+iQrnmNLn1U9bG6sSSdpgwkci4fnqkPj38
 SFdffTnjg6WMeNHahjbLNNNU9QRGD/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109--pwS3uclNCqE457CVrcQCg-1; Thu, 08 Oct 2020 12:03:36 -0400
X-MC-Unique: -pwS3uclNCqE457CVrcQCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18BB4425DD;
 Thu,  8 Oct 2020 16:03:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-212.ams2.redhat.com
 [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1BA060CD1;
 Thu,  8 Oct 2020 16:03:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, thuth@redhat.com, lvivier@redhat.com,
 alex.bennee@linaro.org
Subject: [PATCH] tests/migration: Allow longer timeouts
Date: Thu,  8 Oct 2020 17:03:30 +0100
Message-Id: <20201008160330.130431-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

In travis, with gcov and gprof we're seeing timeouts; hopefully fix
this by increasing the test timeouts a bit, but for xbzrle ensure it
really does get a couple of cycles through to test the cache.

I think the problem in travis is we have about 2 host CPU threads,
in the test we have at least 3:
   a) The vCPU thread (100% flat out)
   b) The source migration thread
   c) The destination migration thread

if (b) & (c) are slow for any reason - gcov+gperf or a slow host -
then they're sharing one host CPU thread so limit the migration
bandwidth.

Tested on my laptop with:
   taskset -c 0,1 ./tests/qtest/migration-test -p /x86_64/migration

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 00a233cd8c..481db4e929 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -44,6 +44,9 @@ static bool uffd_feature_thread_id;
 #include <sys/ioctl.h>
 #include <linux/userfaultfd.h>
 
+/* A downtime where the test really should converge */
+#define CONVERGE_DOWNTIME 1000
+
 static bool ufd_version_check(void)
 {
     struct uffdio_api api_struct;
@@ -864,8 +867,7 @@ static void test_precopy_unix(void)
 
     wait_for_migration_pass(from);
 
-    /* 300 ms should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
@@ -946,10 +948,12 @@ static void test_xbzrle(const char *uri)
 
     migrate_qmp(from, uri, "{}");
 
+    wait_for_migration_pass(from);
+    /* Make sure we have 2 passes, so the xbzrle cache gets a workout */
     wait_for_migration_pass(from);
 
-    /* 300ms should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 300);
+    /* 1000ms should converge */
+    migrate_set_parameter_int(from, "downtime-limit", 1000);
 
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
@@ -999,8 +1003,7 @@ static void test_precopy_tcp(void)
 
     wait_for_migration_pass(from);
 
-    /* 300ms should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
@@ -1068,8 +1071,7 @@ static void test_migrate_fd_proto(void)
 
     wait_for_migration_pass(from);
 
-    /* 300ms should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
@@ -1304,8 +1306,7 @@ static void test_multifd_tcp(const char *method)
 
     wait_for_migration_pass(from);
 
-    /* 300ms it should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 300);
+    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
     if (!got_stop) {
         qtest_qmp_eventwait(from, "STOP");
-- 
2.28.0


