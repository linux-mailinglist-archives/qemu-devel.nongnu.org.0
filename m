Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AF58583B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 05:21:44 +0200 (CEST)
Received: from localhost ([::1]:49124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHd2t-0002jp-0w
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 23:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oHd1N-0007R0-86
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 23:20:09 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oHd1K-00088a-N3
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 23:20:08 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LvqNQ4s29z9svx;
 Sat, 30 Jul 2022 11:18:46 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 30 Jul 2022 11:19:59 +0800
Received: from localhost (10.174.149.172) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 30 Jul
 2022 11:19:59 +0800
To: <kwolf@redhat.com>, <berrange@redhat.com>, <armbru@redhat.com>,
 <marcandre.lureau@redhat.com>, <qemu-devel@nongnu.org>
CC: <wangxinxin.wang@huawei.com>, <hogan.wang@huawei.com>
Subject: [PATCH v3 2/3] job: introduce dump guest memory job
Date: Sat, 30 Jul 2022 11:19:51 +0800
Message-ID: <20220730031951.3172-1-hogan.wang@huawei.com>
X-Mailer: git-send-email 2.33.0
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

Introduce dump guest memory job type, and add an optional 'job-id'
argument for dump-guest-memory QMP to make use of jobs framework.

Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
---
 dump/dump-hmp-cmds.c | 12 ++++++++++--
 dump/dump.c          |  1 +
 qapi/dump.json       |  6 +++++-
 qapi/job.json        |  5 ++++-
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
index e5053b04cd..ba28a5e631 100644
--- a/dump/dump-hmp-cmds.c
+++ b/dump/dump-hmp-cmds.c
@@ -24,9 +24,11 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict)
     bool has_begin = qdict_haskey(qdict, "begin");
     bool has_length = qdict_haskey(qdict, "length");
     bool has_detach = qdict_haskey(qdict, "detach");
+    bool has_job_id = qdict_haskey(qdict, "job-id");
     int64_t begin = 0;
     int64_t length = 0;
     bool detach = false;
+    const char *job_id = NULL;
     enum DumpGuestMemoryFormat dump_format = DUMP_GUEST_MEMORY_FORMAT_ELF;
     char *prot;
 
@@ -62,10 +64,16 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict)
         detach = qdict_get_bool(qdict, "detach");
     }
 
+    if (has_job_id) {
+        job_id = qdict_get_str(qdict, "job-id");
+    }
+
     prot = g_strconcat("file:", file, NULL);
 
-    qmp_dump_guest_memory(paging, prot, true, detach, has_begin, begin,
-                          has_length, length, true, dump_format, &err);
+    qmp_dump_guest_memory(paging, prot, has_job_id, job_id,
+                          true, detach, has_begin, begin,
+                          has_length, length, true, dump_format,
+                          &err);
     hmp_handle_error(mon, err);
     g_free(prot);
 }
diff --git a/dump/dump.c b/dump/dump.c
index a57c580b12..cec9be30b4 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1895,6 +1895,7 @@ DumpQueryResult *qmp_query_dump(Error **errp)
 }
 
 void qmp_dump_guest_memory(bool paging, const char *file,
+                           bool has_job_id, const char *job_id,
                            bool has_detach, bool detach,
                            bool has_begin, int64_t begin, bool has_length,
                            int64_t length, bool has_format,
diff --git a/qapi/dump.json b/qapi/dump.json
index 90859c5483..5209d0b74f 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -59,6 +59,9 @@
 #            2. fd: the protocol starts with "fd:", and the following string
 #               is the fd's name.
 #
+# @job-id: identifier for the newly-created memory dump job. If
+#          omitted, use 'memory-guest-dump' by default. (Since 7.2)
+#
 # @detach: if true, QMP will return immediately rather than
 #          waiting for the dump to finish. The user can track progress
 #          using "query-dump". (since 2.6).
@@ -88,7 +91,8 @@
 #
 ##
 { 'command': 'dump-guest-memory',
-  'data': { 'paging': 'bool', 'protocol': 'str', '*detach': 'bool',
+  'data': { 'paging': 'bool', 'protocol': 'str',
+            '*job-id': 'str', '*detach': 'bool',
             '*begin': 'int', '*length': 'int',
             '*format': 'DumpGuestMemoryFormat'} }
 
diff --git a/qapi/job.json b/qapi/job.json
index d5f84e9615..e14d2290a5 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -28,11 +28,14 @@
 #
 # @snapshot-delete: snapshot delete job type, see "snapshot-delete" (since 6.0)
 #
+# @dump-guest-memory: dump guest memory job type, see "dump-guest-memory" (since 7.2)
+#
 # Since: 1.7
 ##
 { 'enum': 'JobType',
   'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend',
-           'snapshot-load', 'snapshot-save', 'snapshot-delete'] }
+           'snapshot-load', 'snapshot-save', 'snapshot-delete',
+           'dump-guest-memory'] }
 
 ##
 # @JobStatus:
-- 
2.33.0


