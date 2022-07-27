Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294EB58283C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:08:18 +0200 (CEST)
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhhw-0006MN-Og
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oGhbU-00037F-NC
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 10:01:37 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oGhbM-0007xr-1Y
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 10:01:35 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LtFlm3fmDz9swF;
 Wed, 27 Jul 2022 22:00:04 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Jul 2022 22:01:14 +0800
Received: from localhost (10.174.149.172) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Jul
 2022 22:01:14 +0800
To: <berrange@redhat.com>, <marcandre.lureau@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <wangxinxin.wang@huawei.com>, <hogan.wang@huawei.com>
Subject: [PATCH 2/3] dump: use jobs framework for dump guest memory
Date: Wed, 27 Jul 2022 22:01:09 +0800
Message-ID: <20220727140110.2698-2-hogan.wang@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=hogan.wang@huawei.com; helo=szxga03-in.huawei.com
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

Use default job id 'dump-guest-memory' to create a job object for dump
process.

Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
---
 dump/dump.c | 68 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 6aa946b9ac..51dc933c7c 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1528,6 +1528,14 @@ static void get_max_mapnr(DumpState *s)
 
 static DumpState dump_state_global = { .status = DUMP_STATUS_NONE };
 
+typedef struct DumpJob {
+    Job common;
+    DumpState *state;
+    Coroutine *co;
+    Error **errp;
+} DumpJob;
+
+
 static void dump_state_prepare(DumpState *s)
 {
     /* zero the struct, setting status to active */
@@ -1854,8 +1862,11 @@ static void dump_process(DumpState *s, Error **errp)
 
 static void *dump_thread(void *data)
 {
-    DumpState *s = (DumpState *)data;
-    dump_process(s, NULL);
+    DumpJob *job = (DumpJob *)data;
+    job_progress_set_remaining(&job->common, 1);
+    dump_process(job->state, job->errp);
+    job_progress_update(&job->common, 1);
+    aio_co_wake(job->co);
     return NULL;
 }
 
@@ -1871,6 +1882,37 @@ DumpQueryResult *qmp_query_dump(Error **errp)
     return result;
 }
 
+static void dump_sync_job_bh(void *opaque)
+{
+    dump_thread(opaque);
+}
+
+static int coroutine_fn dump_guest_memory_job_run(Job *job, Error **errp)
+{
+    DumpJob *s = container_of(job, DumpJob, common);
+    DumpState *state = &dump_state_global;
+
+    s->errp = errp;
+    s->co = qemu_coroutine_self();
+
+    if (state->detached) {
+        /* detached dump */
+        qemu_thread_create(&s->state->dump_thread, "dump_thread", dump_thread,
+                           s, QEMU_THREAD_DETACHED);
+    } else {
+        aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                                dump_sync_job_bh, job);
+    }
+    qemu_coroutine_yield();
+    return qatomic_read(&state->status) == DUMP_STATUS_COMPLETED ? 0 : -1;
+}
+
+static const JobDriver dump_guest_memory_job_driver = {
+    .instance_size = sizeof(DumpJob),
+    .job_type      = JOB_TYPE_DUMP_GUEST_MEMORY,
+    .run           = dump_guest_memory_job_run,
+};
+
 void qmp_dump_guest_memory(bool paging, const char *file,
                            bool has_job_id, const char *job_id,
                            bool has_detach, bool detach,
@@ -1882,6 +1924,7 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     const char *p;
     int fd = -1;
     DumpState *s;
+    DumpJob *job;
     bool detach_p = false;
 
     if (runstate_check(RUN_STATE_INMIGRATE)) {
@@ -1977,6 +2020,10 @@ void qmp_dump_guest_memory(bool paging, const char *file,
         return;
     }
 
+    if (!has_job_id) {
+        job_id = "dump-guest-memory";
+    }
+
     s = &dump_state_global;
     dump_state_prepare(s);
 
@@ -1987,15 +2034,16 @@ void qmp_dump_guest_memory(bool paging, const char *file,
         return;
     }
 
-    if (detach_p) {
-        /* detached dump */
-        s->detached = true;
-        qemu_thread_create(&s->dump_thread, "dump_thread", dump_thread,
-                           s, QEMU_THREAD_DETACHED);
-    } else {
-        /* sync dump */
-        dump_process(s, errp);
+    s->detached = detach_p;
+    job = job_create(job_id, &dump_guest_memory_job_driver, NULL,
+                    qemu_get_aio_context(), JOB_DEFAULT,
+                    NULL, NULL, errp);
+    if (!job) {
+        qatomic_set(&s->status, DUMP_STATUS_FAILED);
+        return;
     }
+    job->state = s;
+    job_start(&job->common);
 }
 
 DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error **errp)
-- 
2.33.0


