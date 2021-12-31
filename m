Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59C48227E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 07:30:41 +0100 (CET)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3BR2-0004KZ-3b
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 01:30:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7T-0003NC-Bl
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:3745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7Q-0008IE-RZ
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640931024; x=1672467024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WlKrbpM0Mweq/okCiNR1t37y/Tzpv8jgr5VO4f8zCSA=;
 b=jNsXL3XQsG2lZhzZMO+PSbB6UospPfT4rX3QmAeXbIz39rK/PPud54w2
 a6NySfam3FJXzpdYbefEgf9sT4UC/63Ag4Fhu9ClNyFth8Zd3jawUT/FU
 O4VNAohYZqK6V1SNTsW6R0WDWayn8KHqeEt8wtQLCvxGMl5VfADS5B799
 ouobTHey4yPzoxUot6E683z4/8hZQh7caYmWRJb9FOgqRsVdOqosWZGwH
 TiTKXfLPI0L8zl+cU1TGonfeKbgDo4gJ22LDzTEy0Udp5L9uZptDyLnvt
 QmHXwnwoAKWB8U2MvZ3talO5vphH3GlykCefhE+caTUWzQx7JplviW8BY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="328110762"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="328110762"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="470867800"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:20 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postcopy
 migration
Date: Fri, 31 Dec 2021 13:59:34 +0800
Message-Id: <20211231055935.1878503-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211231055935.1878503-1-chen.zhang@intel.com>
References: <20211231055935.1878503-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

COLO dose not support postcopy migration and remove the Fixme.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 migration/migration.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2afa77da03..3fac9c67ca 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3230,7 +3230,11 @@ static void migration_completion(MigrationState *s)
         goto fail_invalidate;
     }
 
-    if (!migrate_colo_enabled()) {
+    if (migrate_colo_enabled() && s->state == MIGRATION_STATUS_ACTIVE) {
+        /* COLO dose not support postcopy */
+        migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
+                          MIGRATION_STATUS_COLO);
+    } else {
         migrate_set_state(&s->state, current_active_state,
                           MIGRATION_STATUS_COMPLETED);
     }
@@ -3621,10 +3625,6 @@ static void migration_iteration_finish(MigrationState *s)
                          "COLO enabled", __func__);
         }
         migrate_start_colo_process(s);
-        /*
-         * Fixme: we will run VM in COLO no matter its old running state.
-         * After exited COLO, we will keep running.
-         */
          /* Fallthrough */
     case MIGRATION_STATUS_ACTIVE:
         /*
-- 
2.25.1


