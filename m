Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E502293397
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 05:20:04 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUiBv-0000wd-9G
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 23:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUi4I-0000G6-9h; Mon, 19 Oct 2020 23:12:10 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42912 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUi4E-0005Cz-E8; Mon, 19 Oct 2020 23:12:09 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 01E2277AC4DBF115D352;
 Tue, 20 Oct 2020 11:12:00 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 11:11:53 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 2/8] migration: Don't use '#' flag of printf format
Date: Tue, 20 Oct 2020 11:10:42 +0800
Message-ID: <1603163448-27122-3-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 22:24:46
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
Cc: yubihong@huawei.com, zhengchuan@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, armbru@redhat.com, alex.chen@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/block.c | 2 +-
 migration/ram.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 4b8576b..273392b 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -998,7 +998,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
                    (addr == 100) ? '\n' : '\r');
             fflush(stdout);
         } else if (!(flags & BLK_MIG_FLAG_EOS)) {
-            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
+            fprintf(stderr, "Unknown block migration flags: 0x%x\n", flags);
             return -EINVAL;
         }
         ret = qemu_file_get_error(f);
diff --git a/migration/ram.c b/migration/ram.c
index 433489d..6ed4f9e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3298,7 +3298,7 @@ static int ram_load_postcopy(QEMUFile *f)
             multifd_recv_sync_main();
             break;
         default:
-            error_report("Unknown combination of migration flags: %#x"
+            error_report("Unknown combination of migration flags: 0x%x"
                          " (postcopy mode)", flags);
             ret = -EINVAL;
             break;
@@ -3576,7 +3576,7 @@ static int ram_load_precopy(QEMUFile *f)
             if (flags & RAM_SAVE_FLAG_HOOK) {
                 ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);
             } else {
-                error_report("Unknown combination of migration flags: %#x",
+                error_report("Unknown combination of migration flags: 0x%x",
                              flags);
                 ret = -EINVAL;
             }
-- 
1.8.3.1


