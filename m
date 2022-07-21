Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4463E57C455
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 08:25:16 +0200 (CEST)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEPcY-000581-Rh
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 02:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oEPYy-0003Cd-Ph
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 02:21:32 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oEPYv-00040o-Hx
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 02:21:32 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LpMpW02QVzkXD9;
 Thu, 21 Jul 2022 14:18:59 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 14:21:22 +0800
Received: from localhost (10.174.149.172) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Jul
 2022 14:21:22 +0800
To: <qemu-devel@nongnu.org>, <marcandre.lureau@redhat.com>
CC: <wangxinxin.wang@huawei.com>, <hogan.wang@huawei.com>
Subject: [PATCH] dump: introduce dump-cancel QMP command
Date: Thu, 21 Jul 2022 14:21:18 +0800
Message-ID: <20220721062118.2015-1-hogan.wang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.149.172]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=hogan.wang@huawei.com; helo=szxga02-in.huawei.com
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

There's no way to cancel the current executing dump process, lead to the
virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
job after daemon restart.

Add the 'cancelling' and 'cancelled' dump states.

Use 'dump-cancel' qmp command Set the dump state as 'cancelling'.
The dump process check the 'cancelling' state and break loops. 
The 'cancelled' state mark the dump process cancelled success.

---
 dump/dump.c               | 38 ++++++++++++++++++++++++++++++++++++--
 include/sysemu/runstate.h |  1 +
 qapi/dump.json            | 21 ++++++++++++++++++++-
 3 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 4d9658ffa2..a0ac85aa02 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -118,6 +118,10 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
     DumpState *s = opaque;
     size_t written_size;
 
+    if (qemu_system_dump_cancelling()) {
+        return -ECANCELED;
+    }
+
     written_size = qemu_write_full(s->fd, buf, size);
     if (written_size != size) {
         return -errno;
@@ -627,6 +631,10 @@ static void dump_iterate(DumpState *s, Error **errp)
 
     do {
         block = s->next_block;
+        if (qemu_system_dump_cancelling()) {
+            error_setg(errp, "dump: job cancelled");
+            return;
+        }
 
         size = block->target_end - block->target_start;
         if (s->has_filter) {
@@ -1321,6 +1329,11 @@ static void write_dump_pages(DumpState *s, Error **errp)
      * first page of page section
      */
     while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
+        if (qemu_system_dump_cancelling()) {
+            error_setg(errp, "dump: job cancelled");
+            goto out;
+        }
+
         /* check zero page */
         if (buffer_is_zero(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
@@ -1540,6 +1553,22 @@ bool qemu_system_dump_in_progress(void)
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
 }
 
+bool qemu_system_dump_cancelling(void)
+{
+    DumpState *state = &dump_state_global;
+    return (qatomic_read(&state->status) == DUMP_STATUS_CANCELLING);
+}
+
+void qmp_dump_cancel(Error **errp)
+{
+    DumpState *state = &dump_state_global;
+    if (!qemu_system_dump_in_progress()) {
+        return;
+    }
+    qatomic_set(&state->status, DUMP_STATUS_CANCELLING);
+}
+
+
 /* calculate total size of memory to be dumped (taking filter into
  * acoount.) */
 static int64_t dump_calculate_size(DumpState *s)
@@ -1838,8 +1867,13 @@ static void dump_process(DumpState *s, Error **errp)
 
     /* make sure status is written after written_size updates */
     smp_wmb();
-    qatomic_set(&s->status,
-               (*errp ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
+    if (qemu_system_dump_cancelling()) {
+        qatomic_set(&s->status, DUMP_STATUS_CANCELLED);
+    } else if (*errp) {
+        qatomic_set(&s->status, DUMP_STATUS_FAILED);
+    } else {
+        qatomic_set(&s->status, DUMP_STATUS_COMPLETED);
+    }
 
     /* send DUMP_COMPLETED message (unconditionally) */
     result = qmp_query_dump(NULL);
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index f3ed52548e..a36c1d43f6 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -76,6 +76,7 @@ void qemu_system_reset(ShutdownCause reason);
 void qemu_system_guest_panicked(GuestPanicInformation *info);
 void qemu_system_guest_crashloaded(GuestPanicInformation *info);
 bool qemu_system_dump_in_progress(void);
+bool qemu_system_dump_cancelling(void);
 
 #endif
 
diff --git a/qapi/dump.json b/qapi/dump.json
index 90859c5483..6dfbb6b7de 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -108,7 +108,7 @@
 # Since: 2.6
 ##
 { 'enum': 'DumpStatus',
-  'data': [ 'none', 'active', 'completed', 'failed' ] }
+  'data': [ 'none', 'active', 'completed', 'failed', 'cancelling', 'cancelled' ] }
 
 ##
 # @DumpQueryResult:
@@ -200,3 +200,22 @@
 ##
 { 'command': 'query-dump-guest-memory-capability',
   'returns': 'DumpGuestMemoryCapability' }
+
+##
+# @dump-cancel:
+#
+# Cancel the current executing dump process.
+#
+# Returns: nothing on success
+#
+# Notes: This command succeeds even if there is no dump process running.
+#
+# Since: 7.2
+#
+# Example:
+#
+# -> { "execute": "dump-cancel" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'dump-cancel' }
-- 
2.33.0


