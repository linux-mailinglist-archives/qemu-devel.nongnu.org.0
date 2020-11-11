Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CF2AE943
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 07:55:25 +0100 (CET)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kck2P-0001oB-2R
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 01:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kck0u-0001LQ-02
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 01:53:52 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kck0r-0005HN-2u
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 01:53:51 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CWFn351CTz74xB;
 Wed, 11 Nov 2020 14:53:27 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 14:53:25 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH] multifd/tls: fix memoryleak of the QIOChannelSocket object
 when canceling migration
Date: Wed, 11 Nov 2020 15:08:57 +0800
Message-ID: <1605078537-61763-1-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:53:36
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

When creating new tls client, the tioc->master will be referred, we need unrefer
it after tls handshake.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 68b171f..df76a8e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -728,7 +728,8 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
                                            gpointer opaque)
 {
     MultiFDSendParams *p = opaque;
-    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
+    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(qio_task_get_source(task));
+    QIOChannel *ioc = QIO_CHANNEL(tioc);
     Error *err = NULL;
 
     if (qio_task_propagate_error(task, &err)) {
@@ -737,6 +738,7 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
         trace_multifd_tls_outgoing_handshake_complete(ioc);
     }
     multifd_channel_connect(p, ioc, err);
+    object_unref(OBJECT(tioc->master));
 }
 
 static void multifd_tls_channel_connect(MultiFDSendParams *p,
-- 
1.8.3.1


