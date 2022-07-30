Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E343F58583C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 05:21:50 +0200 (CEST)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHd30-0002xd-1Q
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 23:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oHd1V-0007jj-QQ
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 23:20:17 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oHd1T-0008M0-DC
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 23:20:17 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LvqMv4cNczmVDR;
 Sat, 30 Jul 2022 11:18:19 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 30 Jul 2022 11:20:12 +0800
Received: from localhost (10.174.149.172) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 30 Jul
 2022 11:20:11 +0800
To: <kwolf@redhat.com>, <berrange@redhat.com>, <armbru@redhat.com>,
 <marcandre.lureau@redhat.com>, <qemu-devel@nongnu.org>
CC: <wangxinxin.wang@huawei.com>, <hogan.wang@huawei.com>
Subject: [PATCH v3 3/3] dump: use jobs framework for dump guest memory
Date: Sat, 30 Jul 2022 11:20:08 +0800
Message-ID: <20220730032008.3185-1-hogan.wang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.149.172]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

There's no way to cancel the current executing dump process, lead to the
virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
job after daemon restart.

When caller pass the 'job-id' argument, create a job for dump process.
And then caller can use job-cancel QMP command to cancel the detached
dump process, use job-dismiss QMP command to release job object.

Examples:
Start dump job:
{"execute": "dump-guest-memory", "arguments": { "job-id": "dump-guest-memory",
                                                "protocol": "file:/tmp/vm.dump",
                                                "paging": false,
                                                "format": "elf",
                                                "detach": true
                                              }}

Cancel dump job:
{"execute": "job-cancel", "arguments": { "id": "dump-guest-memory" }}

Dismiss dump job:
{"execute": "job-dismiss", "arguments": { "id": "dump-guest-memory" }}

Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
---
 dump/dump.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index cec9be30b4..3f4ed8e7a7 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -98,6 +98,7 @@ static int dump_cleanup(DumpState *s)
 {
     guest_phys_blocks_free(&s->guest_phys_blocks);
     memory_mapping_list_free(&s->list);
+    s->job = NULL;
     close(s->fd);
     g_free(s->guest_note);
     s->guest_note = NULL;
@@ -1542,6 +1543,14 @@ static void get_max_mapnr(DumpState *s)
 
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
@@ -1894,6 +1903,64 @@ DumpQueryResult *qmp_query_dump(Error **errp)
     return result;
 }
 
+static void *dump_job_thread(void *opaque)
+{
+    DumpJob *job = (DumpJob *)opaque;
+    job_progress_set_remaining(&job->common, 1);
+    dump_process(job->state, job->errp);
+    job_progress_update(&job->common, 1);
+    aio_co_wake(job->co);
+    return NULL;
+}
+
+static void dump_sync_job_bh(void *opaque)
+{
+    dump_job_thread(opaque);
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
+        qemu_thread_create(&s->state->dump_thread, "dump_thread",
+                           dump_job_thread, job, QEMU_THREAD_DETACHED);
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
+static void dump_job_start(DumpState *state, const char *job_id,
+                           bool detach, Error **errp)
+{
+    DumpJob *job;
+
+    job = job_create(job_id, &dump_guest_memory_job_driver, NULL,
+                     qemu_get_aio_context(), JOB_MANUAL_DISMISS,
+                     NULL, NULL, errp);
+    if (!job) {
+        return;
+    }
+    state->detached = detach;
+    state->job = &job->common;
+    job->state = state;
+    job_start(&job->common);
+}
+
 void qmp_dump_guest_memory(bool paging, const char *file,
                            bool has_job_id, const char *job_id,
                            bool has_detach, bool detach,
@@ -2010,6 +2077,15 @@ void qmp_dump_guest_memory(bool paging, const char *file,
         return;
     }
 
+    if (has_job_id) {
+        dump_job_start(s, job_id, detach_p, errp);
+        if (*errp) {
+            qatomic_set(&s->status, DUMP_STATUS_FAILED);
+            dump_cleanup(s);
+        }
+        return;
+    }
+
     if (detach_p) {
         /* detached dump */
         s->detached = true;
-- 
2.33.0


