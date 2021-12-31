Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911CE48227C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 07:26:42 +0100 (CET)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3BNB-0001Zo-8s
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 01:26:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7V-0003NI-MN
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:31 -0500
Received: from mga05.intel.com ([192.55.52.43]:3743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7S-0008Hw-Mb
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640931026; x=1672467026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDBQXCJr6mRM51CY171mIjAONQezSBEhlvTSUD3CMC8=;
 b=oHDk42SZcD+GiK4grelCVlAMGvHqIDpO2Ow1rpJ28AgRDLKRRkuZsR7k
 gK4NApVqGttfx3zkJASibyzGclCrrv/w7TQrXD8ofTuRGla9QsOkLosa9
 jVI2xSehtMsADGBQFLfasXQHu+mkmP3P6/18BF4dAmZsjI4Oa4H/UOs0q
 VxZ9BUSDt6IpUz2QPM+K8GVizCiIqcb0F8Gxc3lLoyzfXEJ2RUrDjvEoK
 Q/3w/lyJqU6CUk75IWWj/Yjw6UTIAo8SyhPR9Kp4kk0dYL3w77k5Te4+w
 0ooFhaPseMeO/nievh9GS2fYs2CgI6H3hyRCpRzkEVKGpXQP0S4xKHLkn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="328110766"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="328110766"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="470867810"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:22 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 3/3] migration/migration.c: Remove the MIGRATION_STATUS_ACTIVE
 when migration finished
Date: Fri, 31 Dec 2021 13:59:35 +0800
Message-Id: <20211231055935.1878503-4-chen.zhang@intel.com>
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

The MIGRATION_STATUS_ACTIVE indicates that migration is running.
Remove it to be handled by the default operation,
It should be part of the unknown ending states.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
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


