Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A949D7D7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 03:08:25 +0100 (CET)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCuD2-0001PR-RA
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 21:08:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu6f-0004J7-B9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:01:49 -0500
Received: from mga12.intel.com ([192.55.52.136]:34870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nCu6d-0003E4-Fg
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 21:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643248907; x=1674784907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dxk7HrbUJ1xdGUwu/hpKB95V76rDLqpMIyB333tjdFA=;
 b=fwkuczoRqPQmoFW9i5q2BwMhHeuVgp6R7UZD3EVqyd0xuxw19B9MdcVQ
 BpkphieE+euXgxlbBphkk3nRECLQST9/skwwSfShaNqp56liHIlcp3Mky
 /wc32yqLe3qMeiqLkaq0ZmYBJdA1JzpuUhNPe9hxnyvBvVB6qrxl0IUmj
 4FuHJy2rMkd+vZ4aXBseDXs+1VaoddtkVjpGEe5L6NgDOrqiYNO64qtFI
 lKtVruhDo7NPRRWF292tfACHRPc4meMqRorEcCyrAC36PUWd+bclpkpHd
 lLcBkGpgxyzHjOl2DOqq2ovjWyN2CLsrLcoK1XbHmbHzooNKV6TB7OyDt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="226695376"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="226695376"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 18:01:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="535434822"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 18:01:06 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 1/3] migration/migration.c: Add missed default error
 handler for migration state
Date: Thu, 27 Jan 2022 09:49:55 +0800
Message-Id: <20220127014957.3262813-2-chen.zhang@intel.com>
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

In the migration_completion() no other status is expected, for
example MIGRATION_STATUS_CANCELLING, MIGRATION_STATUS_CANCELLED, etc.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---
 migration/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0652165610..2afa77da03 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3205,7 +3205,7 @@ static void migration_completion(MigrationState *s)
         qemu_mutex_unlock_iothread();
 
         trace_migration_completion_postcopy_end_after_complete();
-    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
+    } else {
         goto fail;
     }
 
-- 
2.25.1


