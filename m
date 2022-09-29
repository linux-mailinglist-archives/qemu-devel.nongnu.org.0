Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B55F00D0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:39:21 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2Bc-0003F6-Tv
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28m-00064T-RJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:24 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:42754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oe28j-0001xg-IV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:36:24 -0400
Received: from [192.168.16.158] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oe25j-0071e8-Uq;
 Fri, 30 Sep 2022 00:35:40 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v5 7/9] tests/x86: replace snprint() by g_strdup_printf() in
 drive_del-test
Date: Fri, 30 Sep 2022 01:35:45 +0300
Message-Id: <20220929223547.1429580-8-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=michael.labiuk@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Michael Labiuk <michael.labiuk@virtuozzo.com>
From:  Michael Labiuk via <qemu-devel@nongnu.org>

Using g_autofree char* and  g_strdup_printf(...) instead of ugly
snprintf on stack array.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
---
 tests/qtest/drive_del-test.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 44b9578801..106c613f4f 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -123,12 +123,10 @@ static const char *qvirtio_get_dev_type(void)
 
 static void device_add(QTestState *qts)
 {
-    QDict *response;
-    char driver[32];
-    snprintf(driver, sizeof(driver), "virtio-blk-%s",
-             qvirtio_get_dev_type());
-
-    response = qtest_qmp(qts, "{'execute': 'device_add',"
+    g_autofree char *driver = g_strdup_printf("virtio-blk-%s",
+                                              qvirtio_get_dev_type());
+    QDict *response =
+               qtest_qmp(qts, "{'execute': 'device_add',"
                               " 'arguments': {"
                               "   'driver': %s,"
                               "   'drive': 'drive0',"
-- 
2.34.1


