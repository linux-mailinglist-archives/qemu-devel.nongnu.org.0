Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C044F290EAE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 06:12:31 +0200 (CEST)
Received: from localhost ([::1]:59200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTda2-0007nA-Q6
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 00:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXg-0005tn-Lx
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:04 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5242 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXe-0007Gf-M6
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:04 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8606FA20CCE762B3E224;
 Sat, 17 Oct 2020 12:09:51 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Sat, 17 Oct 2020
 12:09:43 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v3 06/18] migration/rdma: export
 MultiFDSendParams/MultiFDRecvParams
Date: Sat, 17 Oct 2020 12:25:36 +0800
Message-ID: <1602908748-43335-7-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 00:09:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, fengzhimin1@huawei.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, alex.chen@huawei.com,
 wanghao232@huawei.com
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
index 8ccfd46..03f3a1e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -387,6 +387,19 @@ struct {
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
@@ -919,6 +932,19 @@ struct {
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
index 62a0b2a..2f4e585 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -176,6 +176,8 @@ typedef struct {
 #ifdef CONFIG_RDMA
 MultiFDSetup *multifd_rdma_setup(void);
 #endif
+int get_multifd_send_param(int id, MultiFDSendParams **param);
+int get_multifd_recv_param(int id, MultiFDRecvParams **param);
 MultiFDSetup *multifd_setup_ops_init(void);
 void multifd_register_ops(int method, MultiFDMethods *ops);
 
-- 
1.8.3.1


