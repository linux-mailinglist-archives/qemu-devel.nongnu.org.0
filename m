Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E16A9D35
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 10:39:16 +0200 (CEST)
Received: from localhost ([::1]:43266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5nIQ-0006S5-Pf
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 04:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5nAS-0007o5-Vu
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5nAO-0005mH-1d
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33276)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i5nAN-0005lc-Sy
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:30:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E3E3307D977;
 Thu,  5 Sep 2019 08:30:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6665F5D704;
 Thu,  5 Sep 2019 08:30:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  5 Sep 2019 10:30:42 +0200
Message-Id: <20190905083049.11645-2-thuth@redhat.com>
In-Reply-To: <20190905083049.11645-1-thuth@redhat.com>
References: <20190905083049.11645-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 05 Sep 2019 08:30:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/8] tests/migration: Do not use functions
 anymore that rely on global_qtest
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The migration tests deal with multiple test states, so we really should
not use functions here that rely on the single global_qtest variable.
Switch from qtest_start() to qtest_init() to make sure that global_qtest
is not set anymore. This also revealed a regression in the migrate()
function: It has once been converted to use the qtest_qmp() function,
but commit b5bbd3f315d686bd511 ("Clean up string interpolation into QMP,
part 2") accidentally reverted it back to qmp().

Message-Id: <20190904130047.25808-2-thuth@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/migration-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index b87ba99a9e..a9f81cc185 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -490,7 +490,7 @@ static void migrate(QTestState *who, const char *uri, const char *fmt, ...)
     g_assert(!qdict_haskey(args, "uri"));
     qdict_put_str(args, "uri", uri);
 
-    rsp = qmp("{ 'execute': 'migrate', 'arguments': %p}", args);
+    rsp = qtest_qmp(who, "{ 'execute': 'migrate', 'arguments': %p}", args);
 
     g_assert(qdict_haskey(rsp, "return"));
     qobject_unref(rsp);
@@ -625,7 +625,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_dst = tmp;
     }
 
-    *from = qtest_start(cmd_src);
+    *from = qtest_init(cmd_src);
     g_free(cmd_src);
 
     *to = qtest_init(cmd_dst);
@@ -715,7 +715,7 @@ static void test_deprecated(void)
 {
     QTestState *from;
 
-    from = qtest_start("-machine none");
+    from = qtest_init("-machine none");
 
     deprecated_set_downtime(from, 0.12345);
     deprecated_set_speed(from, 12345);
-- 
2.18.1


