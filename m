Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A030D442
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:48:53 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CuC-0008Gi-Ll
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpd-0002xZ-2S
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:09 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7CpO-0008EL-E0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:06 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVttr5Cfgz163x7;
 Wed,  3 Feb 2021 15:42:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:39 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 06/18] migration/rdma: export
 MultiFDSendParams/MultiFDRecvParams
Date: Wed, 3 Feb 2021 16:01:39 +0800
Message-ID: <1612339311-114805-7-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

MultiFDSendParams and MultiFDRecvParams is need for rdma, export it

Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c | 26 ++++++++++++++++++++++++++
 migration/multifd.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 5d34950..ae0b7f0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -390,6 +390,19 @@ struct {
     MultiFDSetup *setup_ops;
 } *multifd_send_state;
 
+int get_multifd_send_param(int id, MultiFDSendParams **param)
+{
+    int ret = 0;
+
+    if (id < 0 || id >= migrate_multifd_channels()) {
+        ret = -1;
+    } else {
+        *param = &(multifd_send_state->params[id]);
+    }
+
+    return ret;
+}
+
 /*
  * How we use multifd_send_state->pages and channel->pages?
  *
@@ -934,6 +947,19 @@ struct {
     MultiFDSetup *setup_ops;
 } *multifd_recv_state;
 
+int get_multifd_recv_param(int id, MultiFDRecvParams **param)
+{
+    int ret = 0;
+
+    if (id < 0 || id >= migrate_multifd_channels()) {
+        ret = -1;
+    } else {
+        *param = &(multifd_recv_state->params[id]);
+    }
+
+    return ret;
+}
+
 static void multifd_recv_terminate_threads(Error *err)
 {
     int i;
diff --git a/migration/multifd.h b/migration/multifd.h
index e3ab4b0..d57756c 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -176,6 +176,8 @@ typedef struct {
 #ifdef CONFIG_RDMA
 extern MultiFDSetup multifd_rdma_ops;
 #endif
+int get_multifd_send_param(int id, MultiFDSendParams **param);
+int get_multifd_recv_param(int id, MultiFDRecvParams **param);
 MultiFDSetup *multifd_setup_ops_init(void);
 
 void multifd_register_ops(int method, MultiFDMethods *ops);
-- 
1.8.3.1


