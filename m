Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB471313D1F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:20:30 +0100 (CET)
Received: from localhost ([::1]:60306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B9B-00063i-RK
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94lG-00028M-O6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94l9-0002ch-4K
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKnF4pRrKwqKPZxcNddLx6h5pLWcgzICdlkmoGEpkSY=;
 b=MfP2FKXZ8StSR22KVacxjkF+/Td5l2sJeRhad3RnJggx2JTdH9stiA4FMrk+wQc4CzmEv2
 RbiqVLK3BUHUC5DMoapjRhnEpmNMM5OJbmbrOJvk6/Qm9RYUvgyrNzZnzxFxjX0uZpW7gX
 oPCaiuRp115rier7ViN1eHr9BTCyXe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-0ADhOSycP3Kn6huIetu91A-1; Mon, 08 Feb 2021 06:31:10 -0500
X-MC-Unique: 0ADhOSycP3Kn6huIetu91A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97957192AB78;
 Mon,  8 Feb 2021 11:31:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D14A31002388;
 Mon,  8 Feb 2021 11:31:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 26/27] migration: introduce snapshot-{save, load,
 delete} QMP commands
Date: Mon,  8 Feb 2021 11:29:17 +0000
Message-Id: <20210208112918.185058-27-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Daniel P. Berrangé <berrange@redhat.com>

savevm, loadvm and delvm are some of the few HMP commands that have never
been converted to use QMP. The reasons for the lack of conversion are
that they blocked execution of the event thread, and the semantics
around choice of disks were ill-defined.

Despite this downside, however, libvirt and applications using libvirt
have used these commands for as long as QMP has existed, via the
"human-monitor-command" passthrough command. IOW, while it is clearly
desirable to be able to fix the problems, they are not a blocker to
all real world usage.

Meanwhile there is a need for other features which involve adding new
parameters to the commands. This is possible with HMP passthrough, but
it provides no reliable way for apps to introspect features, so using
QAPI modelling is highly desirable.

This patch thus introduces new snapshot-{load,save,delete} commands to
QMP that are intended to replace the old HMP counterparts. The new
commands are given different names, because they will be using the new
QEMU job framework and thus will have diverging behaviour from the HMP
originals. It would thus be misleading to keep the same name.

While this design uses the generic job framework, the current impl is
still blocking. The intention that the blocking problem is fixed later.
None the less applications using these new commands should assume that
they are asynchronous and thus wait for the job status change event to
indicate completion.

In addition to using the job framework, the new commands require the
caller to be explicit about all the block device nodes used in the
snapshot operations, with no built-in default heuristics in use.

Note that the existing "query-named-block-nodes" can be used to query
what snapshots currently exist for block nodes.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210204124834.774401-13-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: removed tests for now, the output ordering isn't
deterministic
---
 migration/savevm.c  | 184 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/job.json       |   9 ++-
 qapi/migration.json | 173 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 365 insertions(+), 1 deletion(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0c5d61ae20..52e2d72e4b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3112,3 +3112,187 @@ bool vmstate_check_only_migratable(const VMStateDescription *vmsd)
 
     return !(vmsd && vmsd->unmigratable);
 }
+
+typedef struct SnapshotJob {
+    Job common;
+    char *tag;
+    char *vmstate;
+    strList *devices;
+    Coroutine *co;
+    Error **errp;
+    bool ret;
+} SnapshotJob;
+
+static void qmp_snapshot_job_free(SnapshotJob *s)
+{
+    g_free(s->tag);
+    g_free(s->vmstate);
+    qapi_free_strList(s->devices);
+}
+
+
+static void snapshot_load_job_bh(void *opaque)
+{
+    Job *job = opaque;
+    SnapshotJob *s = container_of(job, SnapshotJob, common);
+    int orig_vm_running;
+
+    job_progress_set_remaining(&s->common, 1);
+
+    orig_vm_running = runstate_is_running();
+    vm_stop(RUN_STATE_RESTORE_VM);
+
+    s->ret = load_snapshot(s->tag, s->vmstate, true, s->devices, s->errp);
+    if (s->ret && orig_vm_running) {
+        vm_start();
+    }
+
+    job_progress_update(&s->common, 1);
+
+    qmp_snapshot_job_free(s);
+    aio_co_wake(s->co);
+}
+
+static void snapshot_save_job_bh(void *opaque)
+{
+    Job *job = opaque;
+    SnapshotJob *s = container_of(job, SnapshotJob, common);
+
+    job_progress_set_remaining(&s->common, 1);
+    s->ret = save_snapshot(s->tag, false, s->vmstate,
+                           true, s->devices, s->errp);
+    job_progress_update(&s->common, 1);
+
+    qmp_snapshot_job_free(s);
+    aio_co_wake(s->co);
+}
+
+static void snapshot_delete_job_bh(void *opaque)
+{
+    Job *job = opaque;
+    SnapshotJob *s = container_of(job, SnapshotJob, common);
+
+    job_progress_set_remaining(&s->common, 1);
+    s->ret = delete_snapshot(s->tag, true, s->devices, s->errp);
+    job_progress_update(&s->common, 1);
+
+    qmp_snapshot_job_free(s);
+    aio_co_wake(s->co);
+}
+
+static int coroutine_fn snapshot_save_job_run(Job *job, Error **errp)
+{
+    SnapshotJob *s = container_of(job, SnapshotJob, common);
+    s->errp = errp;
+    s->co = qemu_coroutine_self();
+    aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                            snapshot_save_job_bh, job);
+    qemu_coroutine_yield();
+    return s->ret ? 0 : -1;
+}
+
+static int coroutine_fn snapshot_load_job_run(Job *job, Error **errp)
+{
+    SnapshotJob *s = container_of(job, SnapshotJob, common);
+    s->errp = errp;
+    s->co = qemu_coroutine_self();
+    aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                            snapshot_load_job_bh, job);
+    qemu_coroutine_yield();
+    return s->ret ? 0 : -1;
+}
+
+static int coroutine_fn snapshot_delete_job_run(Job *job, Error **errp)
+{
+    SnapshotJob *s = container_of(job, SnapshotJob, common);
+    s->errp = errp;
+    s->co = qemu_coroutine_self();
+    aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                            snapshot_delete_job_bh, job);
+    qemu_coroutine_yield();
+    return s->ret ? 0 : -1;
+}
+
+
+static const JobDriver snapshot_load_job_driver = {
+    .instance_size = sizeof(SnapshotJob),
+    .job_type      = JOB_TYPE_SNAPSHOT_LOAD,
+    .run           = snapshot_load_job_run,
+};
+
+static const JobDriver snapshot_save_job_driver = {
+    .instance_size = sizeof(SnapshotJob),
+    .job_type      = JOB_TYPE_SNAPSHOT_SAVE,
+    .run           = snapshot_save_job_run,
+};
+
+static const JobDriver snapshot_delete_job_driver = {
+    .instance_size = sizeof(SnapshotJob),
+    .job_type      = JOB_TYPE_SNAPSHOT_DELETE,
+    .run           = snapshot_delete_job_run,
+};
+
+
+void qmp_snapshot_save(const char *job_id,
+                       const char *tag,
+                       const char *vmstate,
+                       strList *devices,
+                       Error **errp)
+{
+    SnapshotJob *s;
+
+    s = job_create(job_id, &snapshot_save_job_driver, NULL,
+                   qemu_get_aio_context(), JOB_MANUAL_DISMISS,
+                   NULL, NULL, errp);
+    if (!s) {
+        return;
+    }
+
+    s->tag = g_strdup(tag);
+    s->vmstate = g_strdup(vmstate);
+    s->devices = QAPI_CLONE(strList, devices);
+
+    job_start(&s->common);
+}
+
+void qmp_snapshot_load(const char *job_id,
+                       const char *tag,
+                       const char *vmstate,
+                       strList *devices,
+                       Error **errp)
+{
+    SnapshotJob *s;
+
+    s = job_create(job_id, &snapshot_load_job_driver, NULL,
+                   qemu_get_aio_context(), JOB_MANUAL_DISMISS,
+                   NULL, NULL, errp);
+    if (!s) {
+        return;
+    }
+
+    s->tag = g_strdup(tag);
+    s->vmstate = g_strdup(vmstate);
+    s->devices = QAPI_CLONE(strList, devices);
+
+    job_start(&s->common);
+}
+
+void qmp_snapshot_delete(const char *job_id,
+                         const char *tag,
+                         strList *devices,
+                         Error **errp)
+{
+    SnapshotJob *s;
+
+    s = job_create(job_id, &snapshot_delete_job_driver, NULL,
+                   qemu_get_aio_context(), JOB_MANUAL_DISMISS,
+                   NULL, NULL, errp);
+    if (!s) {
+        return;
+    }
+
+    s->tag = g_strdup(tag);
+    s->devices = QAPI_CLONE(strList, devices);
+
+    job_start(&s->common);
+}
diff --git a/qapi/job.json b/qapi/job.json
index 280c2f76f1..1a6ef03451 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -22,10 +22,17 @@
 #
 # @amend: image options amend job type, see "x-blockdev-amend" (since 5.1)
 #
+# @snapshot-load: snapshot load job type, see "snapshot-load" (since 6.0)
+#
+# @snapshot-save: snapshot save job type, see "snapshot-save" (since 6.0)
+#
+# @snapshot-delete: snapshot delete job type, see "snapshot-delete" (since 6.0)
+#
 # Since: 1.7
 ##
 { 'enum': 'JobType',
-  'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend'] }
+  'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend',
+           'snapshot-load', 'snapshot-save', 'snapshot-delete'] }
 
 ##
 # @JobStatus:
diff --git a/qapi/migration.json b/qapi/migration.json
index 076d2d5634..ce14d78071 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1854,3 +1854,176 @@
 # Since: 5.2
 ##
 { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
+
+##
+# @snapshot-save:
+#
+# Save a VM snapshot
+#
+# @job-id: identifier for the newly created job
+# @tag: name of the snapshot to create
+# @vmstate: block device node name to save vmstate to
+# @devices: list of block device node names to save a snapshot to
+#
+# Applications should not assume that the snapshot save is complete
+# when this command returns. The job commands / events must be used
+# to determine completion and to fetch details of any errors that arise.
+#
+# Note that execution of the guest CPUs may be stopped during the
+# time it takes to save the snapshot. A future version of QEMU
+# may ensure CPUs are executing continuously.
+#
+# It is strongly recommended that @devices contain all writable
+# block device nodes if a consistent snapshot is required.
+#
+# If @tag already exists, an error will be reported
+#
+# Returns: nothing
+#
+# Example:
+#
+# -> { "execute": "snapshot-save",
+#      "data": {
+#         "job-id": "snapsave0",
+#         "tag": "my-snap",
+#         "vmstate": "disk0",
+#         "devices": ["disk0", "disk1"]
+#      }
+#    }
+# <- { "return": { } }
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "created", "id": "snapsave0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "running", "id": "snapsave0"}}
+# <- {"event": "STOP"}
+# <- {"event": "RESUME"}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "waiting", "id": "snapsave0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "pending", "id": "snapsave0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "concluded", "id": "snapsave0"}}
+# -> {"execute": "query-jobs"}
+# <- {"return": [{"current-progress": 1,
+#                 "status": "concluded",
+#                 "total-progress": 1,
+#                 "type": "snapshot-save",
+#                 "id": "snapsave0"}]}
+#
+# Since: 6.0
+##
+{ 'command': 'snapshot-save',
+  'data': { 'job-id': 'str',
+            'tag': 'str',
+            'vmstate': 'str',
+            'devices': ['str'] } }
+
+##
+# @snapshot-load:
+#
+# Load a VM snapshot
+#
+# @job-id: identifier for the newly created job
+# @tag: name of the snapshot to load.
+# @vmstate: block device node name to load vmstate from
+# @devices: list of block device node names to load a snapshot from
+#
+# Applications should not assume that the snapshot load is complete
+# when this command returns. The job commands / events must be used
+# to determine completion and to fetch details of any errors that arise.
+#
+# Note that execution of the guest CPUs will be stopped during the
+# time it takes to load the snapshot.
+#
+# It is strongly recommended that @devices contain all writable
+# block device nodes that can have changed since the original
+# @snapshot-save command execution.
+#
+# Returns: nothing
+#
+# Example:
+#
+# -> { "execute": "snapshot-load",
+#      "data": {
+#         "job-id": "snapload0",
+#         "tag": "my-snap",
+#         "vmstate": "disk0",
+#         "devices": ["disk0", "disk1"]
+#      }
+#    }
+# <- { "return": { } }
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "created", "id": "snapload0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "running", "id": "snapload0"}}
+# <- {"event": "STOP"}
+# <- {"event": "RESUME"}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "waiting", "id": "snapload0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "pending", "id": "snapload0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "concluded", "id": "snapload0"}}
+# -> {"execute": "query-jobs"}
+# <- {"return": [{"current-progress": 1,
+#                 "status": "concluded",
+#                 "total-progress": 1,
+#                 "type": "snapshot-load",
+#                 "id": "snapload0"}]}
+#
+# Since: 6.0
+##
+{ 'command': 'snapshot-load',
+  'data': { 'job-id': 'str',
+            'tag': 'str',
+            'vmstate': 'str',
+            'devices': ['str'] } }
+
+##
+# @snapshot-delete:
+#
+# Delete a VM snapshot
+#
+# @job-id: identifier for the newly created job
+# @tag: name of the snapshot to delete.
+# @devices: list of block device node names to delete a snapshot from
+#
+# Applications should not assume that the snapshot delete is complete
+# when this command returns. The job commands / events must be used
+# to determine completion and to fetch details of any errors that arise.
+#
+# Returns: nothing
+#
+# Example:
+#
+# -> { "execute": "snapshot-delete",
+#      "data": {
+#         "job-id": "snapdelete0",
+#         "tag": "my-snap",
+#         "devices": ["disk0", "disk1"]
+#      }
+#    }
+# <- { "return": { } }
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "created", "id": "snapdelete0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "running", "id": "snapdelete0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "waiting", "id": "snapdelete0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "pending", "id": "snapdelete0"}}
+# <- {"event": "JOB_STATUS_CHANGE",
+#     "data": {"status": "concluded", "id": "snapdelete0"}}
+# -> {"execute": "query-jobs"}
+# <- {"return": [{"current-progress": 1,
+#                 "status": "concluded",
+#                 "total-progress": 1,
+#                 "type": "snapshot-delete",
+#                 "id": "snapdelete0"}]}
+#
+# Since: 6.0
+##
+{ 'command': 'snapshot-delete',
+  'data': { 'job-id': 'str',
+            'tag': 'str',
+            'devices': ['str'] } }
-- 
2.29.2


