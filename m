Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B690C6E65FF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:32:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polQw-0004Tv-3N; Tue, 18 Apr 2023 09:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1polQM-0004PN-AE
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1polQK-0000uV-PA
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681824668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7dQAKpk96paTPu8mAEJxP+k6HXblvCSN8kQtAOwZ6s=;
 b=SZ1p+BTwRTIXhU7FKWJgMljqrjlUrqRgsy5y4dYDV4gQdn/6XqghIvJSaWWOcMHjKRQuPW
 0ar+ZLpZuoAzJwewG7zsnTELC45jcbBGVtj80Se2dxT1Gy6+PeeC5FWfSgKHj5ZZSf7ls6
 pi7ojVRs4tN1K3KhsTb2p2QbcMPWdjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-v7ijYICRNvSQ7NtBDclpJg-1; Tue, 18 Apr 2023 09:31:04 -0400
X-MC-Unique: v7ijYICRNvSQ7NtBDclpJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1FA3185A7A4
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 13:31:03 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1691B40C6E6F;
 Tue, 18 Apr 2023 13:31:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/2] tests/qtest: capture RESUME events during migration
Date: Tue, 18 Apr 2023 14:30:59 +0100
Message-Id: <20230418133100.48799-2-berrange@redhat.com>
In-Reply-To: <20230418133100.48799-1-berrange@redhat.com>
References: <20230418133100.48799-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When running migration tests we monitor for a STOP event so we can skip
redundant waits. This will be needed for the RESUME event too shortly.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-helpers.c | 12 +++++++++---
 tests/qtest/migration-helpers.h |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index f6f3c6680f..61396335cc 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -24,14 +24,20 @@
 #define MIGRATION_STATUS_WAIT_TIMEOUT 120
 
 bool got_stop;
+bool got_resume;
 
-static void check_stop_event(QTestState *who)
+static void check_events(QTestState *who)
 {
     QDict *event = qtest_qmp_event_ref(who, "STOP");
     if (event) {
         got_stop = true;
         qobject_unref(event);
     }
+    event = qtest_qmp_event_ref(who, "RESUME");
+    if (event) {
+        got_resume = true;
+        qobject_unref(event);
+    }
 }
 
 #ifndef _WIN32
@@ -48,7 +54,7 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...)
     va_end(ap);
 
     resp = qtest_qmp_receive(who);
-    check_stop_event(who);
+    check_events(who);
 
     g_assert(!qdict_haskey(resp, "error"));
     g_assert(qdict_haskey(resp, "return"));
@@ -73,7 +79,7 @@ QDict *wait_command(QTestState *who, const char *command, ...)
     resp = qtest_vqmp(who, command, ap);
     va_end(ap);
 
-    check_stop_event(who);
+    check_events(who);
 
     g_assert(!qdict_haskey(resp, "error"));
     g_assert(qdict_haskey(resp, "return"));
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index a188b62787..726a66cfc1 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -16,6 +16,7 @@
 #include "libqtest.h"
 
 extern bool got_stop;
+extern bool got_resume;
 
 #ifndef _WIN32
 G_GNUC_PRINTF(3, 4)
-- 
2.40.0


