Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A24482271
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 07:19:50 +0100 (CET)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3BGW-0005r3-VL
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 01:19:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7S-0003N9-A8
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:3743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B7Q-0008Hw-1I
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640931024; x=1672467024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7qP1tIM4rhCOqOJDe77opsBZ8kwlldx4EwRWQw1/79k=;
 b=e4Z/RC2lm5C7IGiIFZ7eKg0TJuyVHgaJGQcTfyRrBXEUVXI8LUUCrrUn
 w4gBuiKC8/3Yo/Tori0P7Nv/f25lMap4NLjA5o8NJ2LJWijPZ1eRtkG/E
 esROHyyTaqoaKVBxm8KRY6r04xecJGx+wXyOnxkncboEN+lzWvOtdW24w
 8r8fCS8kQNzUkEveW9f+/yfh0oicrPtZ4zdB19uFy35skP77OpPtZawO3
 hUhGxwrTvFu8jNgT+4qrAXwKDx8D04zY2R2Krct6xoZchsBO68hKIn9vj
 iG6nJ0mZ/01Qsg0TL3xYs4lnnp7RL2l3Od+AEmfR4/zpLbl3FjnvYg7CH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="328110759"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="328110759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="470867789"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:10:18 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 1/3] migration/migration.c: Add missed default error handler
 for migration state
Date: Fri, 31 Dec 2021 13:59:33 +0800
Message-Id: <20211231055935.1878503-2-chen.zhang@intel.com>
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

In the migration_completion() no other status is expected, for
example MIGRATION_STATUS_CANCELLING, MIGRATION_STATUS_CANCELLED, etc.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
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


