Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBCF287C6B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:22:00 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbUF-0008Cb-5i
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <95e6f85d8d0c4e05f11991ba528e3d474f08789b@lizzy.crudebyte.com>)
 id 1kQbMS-0006he-20
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:37925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <95e6f85d8d0c4e05f11991ba528e3d474f08789b@lizzy.crudebyte.com>)
 id 1kQbMQ-0005Il-Hq
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=lRzWEo6b7k9+kApoB+89gLCgSlgbKdep1hgOxL6/O8s=; b=lojf9
 cHvdn3vQgxKSwi7J2X2xnakyLUPbDHsWv0xgcd6WjEuAHltPQ2LFb9H7EfYbJsw5cUUveS+HC33YV
 nEiPUEFPb44qqeZ2ztKELUsdMigB26Jx/hQkwW+PJlfC1/pvyykZoN7EcPJ/Z7gbZr3Z9aUxr8Jbh
 cpr1gKFhK5c2LdOO5qmQhDG5MuvKOVt6MoIU1TSMOHNf8nNTOhNWJNv1X+d+ECEauoCzgLFgq0YJH
 aYvVVkdUy94BF48bLJ54PyHQXsmv2PUCsWk+1L/Y3aY6ae5Bq4OEgFQ7nFhPvJTND/rLfqiYs98fP
 jtq1VnggkJwRVu8v6wX7zuismVNHg==;
Message-Id: <95e6f85d8d0c4e05f11991ba528e3d474f08789b.1602182956.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1602182956.git.qemu_oss@crudebyte.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PATCH v4 07/12] tests/qtest/qos-test: dump QEMU command if verbose
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
    Laurent Vivier <lvivier@redhat.com>,
    Paolo Bonzini <pbonzini@redhat.com>,
    Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
    Greg Kurz <groug@kaod.org>,
    "Daniel P. Berrangé" <berrange@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=95e6f85d8d0c4e05f11991ba528e3d474f08789b@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 15:12:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If qtests are run in verbose mode (i.e. if --verbose CL argument
was provided) then print the assembled qemu command line for each
test.

Use qos_printf() instead of g_test_message() to avoid the latter
cluttering the output.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/qos-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index b279b6f816..f97d0a08fd 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -89,6 +89,9 @@ static void qos_set_machines_devices_available(void)
 
 static void restart_qemu_or_continue(char *path)
 {
+    if (g_test_verbose()) {
+        qos_printf("Run QEMU with: '%s'\n", path);
+    }
     /* compares the current command line with the
      * one previously executed: if they are the same,
      * don't restart QEMU, if they differ, stop previous
-- 
2.20.1


