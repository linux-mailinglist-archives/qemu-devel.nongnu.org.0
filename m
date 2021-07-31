Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402D3DC636
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 16:06:09 +0200 (CEST)
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9pcu-0004Z2-FF
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 10:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m9pYM-0000id-1C
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 10:01:26 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:17350
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1m9pYK-0002Bu-9t
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 10:01:25 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A2I8006wWzEqBdzC/Yw4wKrPwEL1zdoMgy1kn?=
 =?us-ascii?q?xilNoH1uA6ilfqWV8cjzuiWbtN9vYhsdcLy7WZVoIkmskKKdg7NhXotKNTOO0A?=
 =?us-ascii?q?SVxepZnOnfKlPbexHWx6p00KdMV+xEAsTsMF4St63HyTj9P9E+4NTvysyVuds?=
 =?us-ascii?q?=3D?=
X-IronPort-AV: E=Sophos;i="5.84,284,1620662400"; d="scan'208";a="112154451"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Jul 2021 22:01:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 51AD24D0D49B;
 Sat, 31 Jul 2021 22:01:20 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Sat, 31 Jul 2021 22:01:21 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Sat, 31 Jul 2021 22:01:19 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] migration: allow enabling mutilfd for specific
 protocol only
Date: Sat, 31 Jul 2021 22:05:52 +0800
Message-ID: <20210731140552.8818-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731140552.8818-1-lizhijian@cn.fujitsu.com>
References: <20210731140552.8818-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 51AD24D0D49B.ACF60
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
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And change the default to true so that in '-incoming defer' case, user is able
to change multifd capability.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/migration.c | 8 ++++++++
 migration/multifd.c   | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 212314541f1..b4d0e66cf7b 100644
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
index 4a4d16d3888..4643b25c9db 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -864,7 +864,7 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
-static bool migrate_allow_multifd;
+static bool migrate_allow_multifd = true;
 void migrate_protocol_allow_multifd(bool allow)
 {
     migrate_allow_multifd = allow;
-- 
2.31.1




