Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901F2A939D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 11:04:35 +0100 (CET)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaybi-0001ui-2v
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 05:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kayah-0001TO-4O
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 05:03:31 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kayae-0008Fh-Et
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 05:03:30 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CSGDL5D8tzhhRP;
 Fri,  6 Nov 2020 18:03:14 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Nov 2020
 18:03:12 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH] migration/multifd: close TLS channel before socket finalize
Date: Fri, 6 Nov 2020 18:18:55 +0800
Message-ID: <1604657935-56394-1-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 05:03:20
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we now support tls multifd, when we cancel migration, the TLS
sockets will be left as CLOSE-WAIT On Src which results in socket
leak.
Fix it by closing TLS channel before socket finalize.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 68b171f..832e475 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -523,6 +523,19 @@ static void multifd_send_terminate_threads(Error *err)
     }
 }
 
+static void multifd_tls_socket_close(QIOChannel *ioc, Error *err)
+{
+     if (ioc &&
+         object_dynamic_cast(OBJECT(ioc),
+                             TYPE_QIO_CHANNEL_TLS)) {
+         /*
+          * TLS channel is special, we need close it before
+          * socket finalize.
+          */
+         qio_channel_close(ioc, &err);
+     }
+}
+
 void multifd_save_cleanup(void)
 {
     int i;
@@ -542,6 +555,7 @@ void multifd_save_cleanup(void)
         MultiFDSendParams *p = &multifd_send_state->params[i];
         Error *local_err = NULL;
 
+        multifd_tls_socket_close(p->c, NULL);
         socket_send_channel_destroy(p->c);
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
-- 
1.8.3.1


