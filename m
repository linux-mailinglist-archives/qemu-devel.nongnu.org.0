Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08706FEEAB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:24:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2Vf-0004oT-6D; Thu, 11 May 2023 05:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px2Vd-0004na-L0
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px2Vb-0008Ml-Tl
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683796966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2vhftrlV08Q6dycDXdiQ/8heo5Xz30wx7HacOmM3yA=;
 b=K89Xsrqqx7GMg4ZGFEjL+1igLxJKKruSUrzX/SXdd/ybZYZUcgC5awGmAKnUwmhagly09b
 3smcMfHFQ88PnHYWpKCujXtBgvTFxfQovbYnlgV2G5blKs/uF1eSoyVHttgHf4eSJ7IdC0
 2Vt22/Te6/uWieS3l8MyD2vnMK3mXfU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-gBvgBCnpPpyfy_wVZC2N7Q-1; Thu, 11 May 2023 05:22:45 -0400
X-MC-Unique: gBvgBCnpPpyfy_wVZC2N7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 369053850550;
 Thu, 11 May 2023 09:22:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9995400E89;
 Thu, 11 May 2023 09:22:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [PATCH 1/3] migration: Teach dirtyrate about qemu_target_page_size()
Date: Thu, 11 May 2023 11:22:37 +0200
Message-Id: <20230511092239.14607-2-quintela@redhat.com>
In-Reply-To: <20230511092239.14607-1-quintela@redhat.com>
References: <20230511092239.14607-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/dirtyrate.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 180ba38c7a..9aa092738c 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -17,6 +17,7 @@
 #include "cpu.h"
 #include "exec/ramblock.h"
 #include "exec/ram_addr.h"
+#include "exec/target_page.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
 #include "qapi/qapi-commands-migration.h"
@@ -78,7 +79,7 @@ static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
     uint64_t increased_dirty_pages =
         dirty_pages.end_pages - dirty_pages.start_pages;
 
-    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
+    memory_size_MB = (increased_dirty_pages * qemu_target_page_size()) >> 20;
 
     return memory_size_MB * 1000 / calc_time_ms;
 }
@@ -291,8 +292,8 @@ static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
     DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
     DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
     /* size of total pages in MB */
-    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
-                                                   TARGET_PAGE_SIZE) >> 20;
+    DirtyStat.page_sampling.total_block_mem_MB +=
+        (info->ramblock_pages * qemu_target_page_size()) >> 20;
 }
 
 static void update_dirtyrate(uint64_t msec)
@@ -315,10 +316,10 @@ static void update_dirtyrate(uint64_t msec)
 static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
                                       uint64_t vfn)
 {
+    int page_size = qemu_target_page_size();
     uint32_t crc;
 
-    crc = crc32(0, (info->ramblock_addr +
-                vfn * TARGET_PAGE_SIZE), TARGET_PAGE_SIZE);
+    crc = crc32(0, info->ramblock_addr + vfn * page_size, page_size);
 
     trace_get_ramblock_vfn_hash(info->idstr, vfn, crc);
     return crc;
-- 
2.40.1


