Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE130D469
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:56:58 +0100 (CET)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7D21-0001kn-48
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpj-000361-RC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cph-0008MD-BI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:15 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVttr5S49z163x8;
 Wed,  3 Feb 2021 15:42:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:41 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 08/18] migration/rdma: export getQIOChannel to get
 QIOchannel in rdma
Date: Wed, 3 Feb 2021 16:01:41 +0800
Message-ID: <1612339311-114805-9-git-send-email-zhengchuan@huawei.com>
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

Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/qemu-file.c | 5 +++++
 migration/qemu-file.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index be21518..37f6201 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -260,6 +260,11 @@ void ram_control_before_iterate(QEMUFile *f, uint64_t flags)
     }
 }
 
+void *getQIOChannel(QEMUFile *f)
+{
+    return f->opaque;
+}
+
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
 {
     int ret = 0;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index a9b6d6c..4cef043 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -165,6 +165,7 @@ void qemu_file_set_blocking(QEMUFile *f, bool block);
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
+void *getQIOChannel(QEMUFile *f);
 
 /* Whenever this is found in the data stream, the flags
  * will be passed to ram_control_load_hook in the incoming-migration
-- 
1.8.3.1


