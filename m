Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7728A79A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 15:48:07 +0200 (CEST)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRbhm-0002MD-BK
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 09:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRYPW-0005RD-9o; Sun, 11 Oct 2020 06:17:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5220 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRYPU-0002Ep-1M; Sun, 11 Oct 2020 06:17:02 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5B82D2EC4CDC31120019;
 Sun, 11 Oct 2020 18:16:45 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sun, 11 Oct 2020
 18:16:39 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v1 6/8] migration: Do not initialise statics and globals to 0
 or NULL
Date: Sun, 11 Oct 2020 18:48:39 +0800
Message-ID: <1602413321-22252-7-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602413321-22252-1-git-send-email-yubihong@huawei.com>
References: <1602413321-22252-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 06:16:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Oct 2020 09:36:19 -0400
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
Cc: alex.chen@huawei.com, zhengchuan@huawei.com, wanghao232@huawei.com,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by:Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Bihong Yu <yubihong@huawei.com>
---
 migration/ram.c    | 2 +-
 migration/savevm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 12e7296..f71ff2b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2743,7 +2743,7 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  */
 static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
 {
-    static RAMBlock *block = NULL;
+    static RAMBlock *block;
     char id[256];
     uint8_t len;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 9e95df1..f808bc2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -64,7 +64,7 @@
 #include "qemu/bitmap.h"
 #include "net/announce.h"
 
-const unsigned int postcopy_ram_discard_version = 0;
+const unsigned int postcopy_ram_discard_version;
 
 /* Subcommands for QEMU_VM_COMMAND */
 enum qemu_vm_cmd {
-- 
1.8.3.1


