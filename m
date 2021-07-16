Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E6E3CB3A3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 09:56:01 +0200 (CEST)
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IhU-0001B3-8u
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 03:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m4IgJ-0008IJ-6N
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 03:54:47 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:7612
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1m4IgH-0007Uj-JI
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 03:54:46 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AwlcdY6BttBj2xgblHemQ55DYdb4zR+YMi2TD?=
 =?us-ascii?q?tnoBLSC9F/b0qynAppomPGDP4gr5NEtApTniAtjkfZq/z+8X3WB5B97LMzUO01?=
 =?us-ascii?q?HYTr2Kg7GD/xTQXwX69sN4kZxrarVCDrTLZmRSvILX5xaZHr8brOW6zA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,244,1620662400"; d="scan'208";a="111301869"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Jul 2021 15:54:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 976D94D0D480;
 Fri, 16 Jul 2021 15:54:43 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Jul 2021 15:54:38 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 16 Jul 2021 15:54:38 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH 2/2] migration: allow enabling mutilfd for specific protocol
 only
Date: Fri, 16 Jul 2021 15:59:09 +0800
Message-ID: <20210716075909.50575-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716075909.50575-1-lizhijian@cn.fujitsu.com>
References: <20210716075909.50575-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 976D94D0D480.AC615
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And change the default to true so that '-incoming defer' can enable
multifd first.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/migration.c | 8 ++++++++
 migration/multifd.c   | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index d6d48f6999b..bcc8b3bcb92 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1249,6 +1249,14 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    /* incoming side only */
+    if (runstate_check(RUN_STATE_INMIGRATE) &&
+        !migrate_multifd_is_allowed() &&
+        cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+        error_setg(errp, "multifd is not supported by current protocol");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index b3d99c79d83..372f3633eda 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -864,7 +864,7 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
-static bool migrate_allow_multifd;
+static bool migrate_allow_multifd = true;
 void migrate_protocal_allow_multifd(bool allow)
 {
     migrate_allow_multifd = allow;
-- 
2.31.1




