Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4784A6FF3C6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:14:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px72A-0003Pt-OW; Thu, 11 May 2023 10:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px728-0003PR-Ew
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px720-0004nD-OD
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683814351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T71ZSjiS8oq4jJNU+/+xUM9P5lzCJ1/G5WSwxAANw/w=;
 b=fcGy7owcpjdf5lcp8sxFraIeMsYv+OE9yXQmPaQex+pfFpDsd8r26qwO5w7BSGI6cBruW9
 Avx90Yg6Bt6Okrrx/lDj6T9JZlfq9G7GjB7hLjkV1OQFk4Oa3dC0SJQblWg2MAb1UkAjMd
 1jVyiMBN9QDSslaiyabR6Ph8/cHHy3I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-JmG_kVjDPEio2ZoFpVvX5A-1; Thu, 11 May 2023 10:12:28 -0400
X-MC-Unique: JmG_kVjDPEio2ZoFpVvX5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 291903C10247;
 Thu, 11 May 2023 14:12:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E18B14171BC;
 Thu, 11 May 2023 14:12:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Andrei Gudkov <gudkov.andrei@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [PATCH v2 2/5] Use new created qemu_target_pages_to_MiB()
Date: Thu, 11 May 2023 16:12:05 +0200
Message-Id: <20230511141208.17779-3-quintela@redhat.com>
In-Reply-To: <20230511141208.17779-1-quintela@redhat.com>
References: <20230511141208.17779-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
 migration/dirtyrate.c | 11 +++++------
 softmmu/dirtylimit.c  | 11 +++--------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 180ba38c7a..38ea95af59 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/ramblock.h"
+#include "exec/target_page.h"
 #include "exec/ram_addr.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
@@ -74,13 +75,11 @@ static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
 static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
                                       int64_t calc_time_ms)
 {
-    uint64_t memory_size_MB;
     uint64_t increased_dirty_pages =
         dirty_pages.end_pages - dirty_pages.start_pages;
+    uint64_t memory_size_MiB = qemu_target_pages_to_MiB(increased_dirty_pages);
 
-    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
-
-    return memory_size_MB * 1000 / calc_time_ms;
+    return memory_size_MiB * 1000 / calc_time_ms;
 }
 
 void global_dirty_log_change(unsigned int flag, bool start)
@@ -291,8 +290,8 @@ static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
     DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
     DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
     /* size of total pages in MB */
-    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
-                                                   TARGET_PAGE_SIZE) >> 20;
+    DirtyStat.page_sampling.total_block_mem_MB +=
+        qemu_target_pages_to_MiB(info->ramblock_pages);
 }
 
 static void update_dirtyrate(uint64_t msec)
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 71bf6dc7a4..015a9038d1 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -235,20 +235,15 @@ bool dirtylimit_vcpu_index_valid(int cpu_index)
 static uint64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
 {
     static uint64_t max_dirtyrate;
-    unsigned target_page_bits = qemu_target_page_bits();
-    uint64_t dirty_ring_size_MB;
+    uint64_t dirty_ring_size_MiB;
 
-    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
-    assert(target_page_bits < 20);
-
-    /* Convert ring size (pages) to MiB (2**20). */
-    dirty_ring_size_MB = kvm_dirty_ring_size() >> (20 - target_page_bits);
+    dirty_ring_size_MiB = qemu_target_pages_to_MiB(kvm_dirty_ring_size());
 
     if (max_dirtyrate < dirtyrate) {
         max_dirtyrate = dirtyrate;
     }
 
-    return dirty_ring_size_MB * 1000000 / max_dirtyrate;
+    return dirty_ring_size_MiB * 1000000 / max_dirtyrate;
 }
 
 static inline bool dirtylimit_done(uint64_t quota,
-- 
2.40.1


