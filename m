Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D158283F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:09:03 +0200 (CEST)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhig-0006kZ-IP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oGhbU-00037G-NZ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 10:01:37 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oGhbM-0007xx-91
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 10:01:35 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LtFl26TpLzmV5x;
 Wed, 27 Jul 2022 21:59:26 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Jul 2022 22:01:16 +0800
Received: from localhost (10.174.149.172) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Jul
 2022 22:01:16 +0800
To: <berrange@redhat.com>, <marcandre.lureau@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <wangxinxin.wang@huawei.com>, <hogan.wang@huawei.com>
Subject: [PATCH 3/3] dump: support cancel dump process
Date: Wed, 27 Jul 2022 22:01:10 +0800
Message-ID: <20220727140110.2698-3-hogan.wang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220727140110.2698-1-hogan.wang@huawei.com>
References: <20220727140110.2698-1-hogan.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.149.172]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=hogan.wang@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hogan Wang <hogan.wang@huawei.com>
From:  Hogan Wang via <qemu-devel@nongnu.org>

Break saving pages or dump iterate when dump job in cancel state,
make sure dump process exits as soon as possible.

Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
---
 dump/dump.c           | 24 ++++++++++++++++++++++++
 include/sysemu/dump.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index 51dc933c7c..881895e831 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -54,6 +54,8 @@ static Error *dump_migration_blocker;
       DIV_ROUND_UP((name_size), 4) +                    \
       DIV_ROUND_UP((desc_size), 4)) * 4)
 
+static bool dump_cancelling(void);
+
 static inline bool dump_is_64bit(DumpState *s)
 {
     return s->dump_info.d_class == ELFCLASS64;
@@ -118,6 +120,10 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
     DumpState *s = opaque;
     size_t written_size;
 
+    if (dump_cancelling()) {
+        return -ECANCELED;
+    }
+
     written_size = qemu_write_full(s->fd, buf, size);
     if (written_size != size) {
         return -errno;
@@ -627,6 +633,10 @@ static void dump_iterate(DumpState *s, Error **errp)
 
     do {
         block = s->next_block;
+        if (dump_cancelling()) {
+            error_setg(errp, "dump: job cancelled");
+            return;
+        }
 
         size = block->target_end - block->target_start;
         if (s->has_filter) {
@@ -1321,6 +1331,10 @@ static void write_dump_pages(DumpState *s, Error **errp)
      * first page of page section
      */
     while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
+        if (dump_cancelling()) {
+            error_setg(errp, "dump: job cancelled");
+            goto out;
+        }
         /* check zero page */
         if (buffer_is_zero(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
@@ -1548,6 +1562,15 @@ bool qemu_system_dump_in_progress(void)
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
 }
 
+static bool dump_cancelling(void)
+{
+    DumpState *state = &dump_state_global;
+    if (state->job && job_is_cancelled(state->job)) {
+        return true;
+    }
+    return false;
+}
+
 /* calculate total size of memory to be dumped (taking filter into
  * acoount.) */
 static int64_t dump_calculate_size(DumpState *s)
@@ -1894,6 +1917,7 @@ static int coroutine_fn dump_guest_memory_job_run(Job *job, Error **errp)
 
     s->errp = errp;
     s->co = qemu_coroutine_self();
+    state->job = job;
 
     if (state->detached) {
         /* detached dump */
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..41bdbe595f 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -15,6 +15,7 @@
 #define DUMP_H
 
 #include "qapi/qapi-types-dump.h"
+#include "qemu/job.h"
 
 #define MAKEDUMPFILE_SIGNATURE      "makedumpfile"
 #define MAX_SIZE_MDF_HEADER         (4096) /* max size of makedumpfile_header */
@@ -154,6 +155,7 @@ typedef struct DumpState {
     GuestPhysBlockList guest_phys_blocks;
     ArchDumpInfo dump_info;
     MemoryMappingList list;
+    Job *job;
     uint32_t phdr_num;
     uint32_t shdr_num;
     bool resume;
-- 
2.33.0


