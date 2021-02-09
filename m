Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18B3151FD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:48:43 +0100 (CET)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UJm-0000NR-P5
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wanghao232@huawei.com>)
 id 1l9QTv-0006rF-Q1
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:42:55 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wanghao232@huawei.com>)
 id 1l9QTs-0000L4-26
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:42:55 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DZfZW4B7rz7hmh;
 Tue,  9 Feb 2021 18:41:23 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Tue, 9 Feb 2021
 18:42:39 +0800
From: Hao Wang <wanghao232@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v2 1/2] migration/tls: fix inverted semantics in
 multifd_channel_connect
Date: Tue, 9 Feb 2021 18:42:36 +0800
Message-ID: <20210209104237.2250941-2-wanghao232@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210209104237.2250941-1-wanghao232@huawei.com>
References: <20210209104237.2250941-1-wanghao232@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=wanghao232@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Feb 2021 09:41:09 -0500
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
Cc: yubihong@huawei.com, alex.chen@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, zhengchuan@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Function multifd_channel_connect() return "true" to indicate failure,
which is rather confusing. Fix that.

Signed-off-by: Hao Wang <wanghao232@huawei.com>
---
 migration/multifd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1a1e589064..2a1ea85ade 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -798,9 +798,9 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                  * function after the TLS handshake,
                  * so we mustn't call multifd_send_thread until then
                  */
-                return false;
-            } else {
                 return true;
+            } else {
+                return false;
             }
         } else {
             /* update for tls qio channel */
@@ -808,10 +808,10 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
             qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                                    QEMU_THREAD_JOINABLE);
        }
-       return false;
+       return true;
     }
 
-    return true;
+    return false;
 }
 
 static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
@@ -844,7 +844,7 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
-        if (multifd_channel_connect(p, sioc, local_err)) {
+        if (!multifd_channel_connect(p, sioc, local_err)) {
             goto cleanup;
         }
         return;
-- 
2.23.0


