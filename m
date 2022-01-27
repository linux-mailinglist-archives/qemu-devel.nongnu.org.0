Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F449D7DB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 03:10:26 +0100 (CET)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCuEz-00038p-7K
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 21:10:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu6h-0004KE-BI
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:01:51 -0500
Received: from mga12.intel.com ([192.55.52.136]:34862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu6f-0003Dp-BY
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643248909; x=1674784909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qCorVAtx5c17zt46uY/woh/THgCnwUFFdfyzFX76r9Y=;
 b=Y3xJi530gEpZ1iiPrC8Lywnrc5IZiEx4gleTyYG9MGQbqXvJS8VhkKGq
 Urp7Bjxe5s+Ap85/Yd4O+kiW4UulEAwAcS4HXfl/dfpNzlssoSGCprRp8
 F9mJzaDnWPto/MyZrb0lKFaaNVmzQcj16ImULCW0THDaZOkfE4YEnVPUm
 3U2EZx2SWSI6U92K0spzgjDGn/Xe3nSyVr4MujDEhEeKcaysg4L2CoxrW
 uRnLwROXXu9ksrfJpo+++Xvr8n2+8ksHOoEwii7izdTo/anpj83ACPB6v
 XqlTBAaxWkEhOsghUQQKEjSe5G6cpc+rGDzQZra4ajbAOrMba8Si/+ZIP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="226695387"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="226695387"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 18:01:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="535434850"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 18:01:09 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 3/3] migration/migration.c: Remove the
 MIGRATION_STATUS_ACTIVE when migration finished
Date: Thu, 27 Jan 2022 09:49:57 +0800
Message-Id: <20220127014957.3262813-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127014957.3262813-1-chen.zhang@intel.com>
References: <20220127014957.3262813-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The MIGRATION_STATUS_ACTIVE indicates that migration is running.
Remove it to be handled by the default operation,
It should be part of the unknown ending states.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>

---
 migration/migration.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3fac9c67ca..21e1498f46 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3625,12 +3625,6 @@ static void migration_iteration_finish(MigrationState *s)
                          "COLO enabled", __func__);
         }
         migrate_start_colo_process(s);
-         /* Fallthrough */
-    case MIGRATION_STATUS_ACTIVE:
-        /*
-         * We should really assert here, but since it's during
-         * migration, let's try to reduce the usage of assertions.
-         */
         s->vm_was_running = true;
         /* Fallthrough */
     case MIGRATION_STATUS_FAILED:
-- 
2.25.1


