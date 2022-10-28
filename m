Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891EB6112AE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:27:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPMq-00048h-FU; Fri, 28 Oct 2022 09:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKw-0001Lg-Bj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKm-0005Ku-BG
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0QaFgfEpMDt0xolT2LiMxtORZqkchR3q5/7a9nRRqc=;
 b=FAqa7hZuEPcLq2ulKPkob9JE6dTMZfVnVu00XkKfxomXHO8bc2JhtkQh/EorIDNLtG5bat
 Q483HfxgIPdKkiwxeHFTO0hVQqDHsh8A+/aGR5Hu1VnRB31965CQG3uEP0f2gEfODa3Hfk
 GqN76qPdnK8Jhcc37F8nt23JZtn2bp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-O-1fcX2pM3GPXQVXvcvTiQ-1; Fri, 28 Oct 2022 09:23:36 -0400
X-MC-Unique: O-1fcX2pM3GPXQVXvcvTiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14D9E8027EA;
 Fri, 28 Oct 2022 13:23:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4CC71121319;
 Fri, 28 Oct 2022 13:23:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 17/21] tests/qtest: Use EXIT_FAILURE instead of magic number
Date: Fri, 28 Oct 2022 15:23:00 +0200
Message-Id: <20221028132304.829103-18-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

When migration fails, QEMU exits with a status code EXIT_FAILURE.
Change qtests to use the well-defined macro instead of magic number.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221028045736.679903-6-bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/dbus-vmstate-test.c | 2 +-
 tests/qtest/migration-test.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/dbus-vmstate-test.c b/tests/qtest/dbus-vmstate-test.c
index 74ede651f6..6c990864e3 100644
--- a/tests/qtest/dbus-vmstate-test.c
+++ b/tests/qtest/dbus-vmstate-test.c
@@ -233,7 +233,7 @@ test_dbus_vmstate(Test *test)
     test->src_qemu = src_qemu;
     if (test->migrate_fail) {
         wait_for_migration_fail(src_qemu, true);
-        qtest_set_expected_status(dst_qemu, 1);
+        qtest_set_expected_status(dst_qemu, EXIT_FAILURE);
     } else {
         wait_for_migration_complete(src_qemu);
     }
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index aa1ba179fa..28a06d8170 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1342,7 +1342,7 @@ static void test_precopy_common(MigrateCommon *args)
         wait_for_migration_fail(from, allow_active);
 
         if (args->result == MIG_TEST_FAIL_DEST_QUIT_ERR) {
-            qtest_set_expected_status(to, 1);
+            qtest_set_expected_status(to, EXIT_FAILURE);
         }
     } else {
         if (args->iterations) {
@@ -1738,7 +1738,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
     migrate_qmp(from, uri, "{}");
 
     if (should_fail) {
-        qtest_set_expected_status(to, 1);
+        qtest_set_expected_status(to, EXIT_FAILURE);
         wait_for_migration_fail(from, true);
     } else {
         wait_for_migration_complete(from);
-- 
2.31.1


