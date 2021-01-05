Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA292EAFD3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:16:07 +0100 (CET)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp0A-0005CS-Qi
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwota-0003yY-Rg
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:19 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotU-0003ou-AO
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:18 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtXHn138036;
 Tue, 5 Jan 2021 16:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=GoDkm9eQO3GYZynplgz4xHsJ6z0ztZTknXSc77qPNn8=;
 b=ZfZxVWJRPeqeORftJAgFMAwGz5HiXUn+1vyJ7lJ1kkpdnnLBW8P4I8ah6/GyCaLohhi9
 IyeVgDOzB09Lw412jjAR/gKybrRgomrQUBXIn1pNnKpXn/YrKaWGmNjXcrBABjgojMo/
 0w7VZ4hftNf39WiukCiM68UGc1Vux3vFVLZAf8dSmVc3G1YFKcwPjatn46UWv15MXZwV
 QXSsBc2CfDFM4qvLupuLlwCNR/ZPS4gJ3DQ9OMEsDYGQnIeiS6Hs5zQofreDCQbghpvS
 ACjNNhK2zRbFHEMN/5gaGQ+qz0FatMmDst04CBJoPel1OV6y7UnJde5QX0Ci6cmI7C0G mg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35tg8r1gyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuOao029110;
 Tue, 5 Jan 2021 16:09:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35uxnsvb28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:07 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G95pr018518;
 Tue, 5 Jan 2021 16:09:05 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:05 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 07/22] cpr
Date: Tue,  5 Jan 2021 07:41:55 -0800
Message-Id: <1609861330-129855-8-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave and cprload functions for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
/usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
paused state and waits for the cprload command.

To use the restart mode, qemu must be started with the memfd-alloc option.
The memfd's are saved to the environment and kept open across exec, after
which they are found from the environment and re-mmap'd.  Hence guest ram is
preserved in place, albeit with new virtual addresses in the qemu process.
The caller resumes the guest by calling cprload, which loads state from the
file.  If the VM was running at cprsave time, then VM execution resumes.
cprsave supports any type of guest image and block device, but the caller
must not modify guest block devices between cprsave and cprload.

For the reboot mode, cprsave saves state and exits qemu, and the caller is
allowed to update the host kernel and system software and reboot.  The
caller resumes the guest by running qemu with the same arguments as the
original process and calling cprload.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0 or /dev/shm
PKRAM.

The reboot mode supports vfio devices if the caller suspends the guest
instead of stopping the VM, such as by issuing guest-suspend-ram to the
qemu guest agent.  The guest drivers' suspend methods flush outstanding
requests and re-initialize the devices, and thus there is no device state
to save and restore.

The restart mode supports vfio devices in a subsequent patch.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 exec.c                  |   6 +-
 include/migration/cpr.h |  17 +++++
 include/sysemu/sysemu.h |   1 +
 migration/Makefile.objs |   2 +-
 migration/cpr.c         | 187 ++++++++++++++++++++++++++++++++++++++++++++++++
 migration/savevm.h      |   2 +
 softmmu/vl.c            |  21 +++++-
 7 files changed, 233 insertions(+), 3 deletions(-)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c

diff --git a/exec.c b/exec.c
index 6da6590..6a6e43d 100644
--- a/exec.c
+++ b/exec.c
@@ -68,6 +68,7 @@
 
 #include "qemu/pmem.h"
 #include "qemu/memfd.h"
+#include "qemu/env.h"
 
 #include "migration/vmstate.h"
 
@@ -2256,7 +2257,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
         } else {
             name = memory_region_name(new_block->mr);
             if (memfd_alloc) {
-                int mfd = -1;          /* placeholder until next patch */
+                int mfd = getenv_fd(name);
                 mr->align = QEMU_VMALLOC_ALIGN;
                 if (mfd < 0) {
                     mfd = qemu_memfd_create(name, maxlen + mr->align,
@@ -2264,7 +2265,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
                     if (mfd < 0) {
                         return;
                     }
+                    setenv_fd(name, mfd);
                 }
+                qemu_clr_cloexec(mfd);
                 new_block->flags |= RAM_SHARED;
                 addr = file_ram_alloc(new_block, maxlen, mfd, false, errp);
                 trace_anon_memfd_alloc(name, maxlen, addr, mfd);
@@ -2521,6 +2524,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    unsetenv_fd(memory_region_name(block->mr));
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..42dec4e
--- /dev/null
+++ b/include/migration/cpr.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIGRATION_CPR_H
+#define MIGRATION_CPR_H
+
+#include "qapi/qapi-types-cpr.h"
+
+bool cpr_active(void);
+void cprsave(const char *file, CprMode mode, Error **errp);
+void cprload(const char *file, Error **errp);
+
+#endif
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 2ab9f95..f0017d4 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -14,6 +14,7 @@ extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
 extern bool memfd_alloc;
+extern int start_on_wake;
 
 void qemu_add_data_dir(const char *path);
 
diff --git a/migration/Makefile.objs b/migration/Makefile.objs
index 0fc619e..106b5fb 100644
--- a/migration/Makefile.objs
+++ b/migration/Makefile.objs
@@ -1,5 +1,5 @@
 common-obj-y += migration.o socket.o fd.o exec.o
-common-obj-y += tls.o channel.o savevm.o
+common-obj-y += tls.o channel.o savevm.o cpr.o
 common-obj-y += colo.o colo-failover.o
 common-obj-y += vmstate.o vmstate-types.o page_cache.o
 common-obj-y += qemu-file.o global_state.o
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..a8f3c10
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,187 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/xen/xen.h"
+#include "monitor/monitor.h"
+#include "migration.h"
+#include "migration/snapshot.h"
+#include "chardev/char.h"
+#include "migration/misc.h"
+#include "migration/cpr.h"
+#include "migration/global_state.h"
+#include "qemu-file-channel.h"
+#include "qemu-file.h"
+#include "savevm.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
+#include "io/channel-buffer.h"
+#include "io/channel-file.h"
+#include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/xen.h"
+#include "sysemu/replay.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/virtio/vhost.h"
+#include "qemu/env.h"
+
+static int cpr_is_active;
+
+bool cpr_active(void)
+{
+    return cpr_is_active;
+}
+
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                              const char *name, Error **errp)
+{
+    QIOChannelFile *fioc;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    if (flags & O_RDWR) {
+        error_setg(errp, "qf_file_open %s: O_RDWR not supported", path);
+        return 0;
+    }
+
+    fioc = qio_channel_file_new_path(path, flags, mode, errp);
+    if (!fioc) {
+        return 0;
+    }
+
+    ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    object_unref(OBJECT(fioc));
+    return f;
+}
+
+static int preserve_fd(const char *name, const char *val, void *handle)
+{
+    qemu_clr_cloexec(atoi(val));
+    return 0;
+}
+
+void cprsave(const char *file, CprMode mode, Error **errp)
+{
+    int ret = 0;
+    QEMUFile *f;
+    int saved_vm_running = runstate_is_running();
+    bool restart = (mode == CPR_MODE_RESTART);
+    bool reboot = (mode == CPR_MODE_REBOOT);
+
+    if (reboot && qemu_ram_volatile(errp)) {
+        return;
+    }
+
+    if (restart && xen_enabled()) {
+        error_setg(errp, "xen does not support cprsave restart");
+        return;
+    }
+
+    if (migrate_colo_enabled()) {
+        error_setg(errp, "error: cprsave does not support x-colo");
+        return;
+    }
+
+    if (replay_mode != REPLAY_MODE_NONE) {
+        error_setg(errp, "error: cprsave does not support replay");
+        return;
+    }
+
+    f = qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600, "cprsave", errp);
+    if (!f) {
+        return;
+    }
+
+    ret = global_state_store();
+    if (ret) {
+        error_setg(errp, "Error saving global state");
+        qemu_fclose(f);
+        return;
+    }
+    if (runstate_check(RUN_STATE_SUSPENDED)) {
+        /* Update timers_state before saving.  Suspend did not so do. */
+        cpu_disable_ticks();
+    }
+    vm_stop(RUN_STATE_SAVE_VM);
+
+    cpr_is_active = true;
+    ret = qemu_save_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, QERR_IO_ERROR);
+        goto err;
+    }
+
+    if (ret < 0) {
+        if (!*errp) {
+            error_setg(errp, "qemu_savevm_state failed");
+        }
+        goto err;
+    }
+
+    if (reboot) {
+        no_shutdown = 0;
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    } else if (restart) {
+        walkenv(FD_PREFIX, preserve_fd, 0);
+        setenv("QEMU_START_FREEZE", "", 1);
+        qemu_system_exec_request();
+    }
+    goto done;
+
+err:
+    if (saved_vm_running) {
+        vm_start();
+    }
+done:
+    cpr_is_active = false;
+    return;
+}
+
+void cprload(const char *file, Error **errp)
+{
+    QEMUFile *f;
+    int ret;
+    RunState state;
+
+    if (runstate_is_running()) {
+        error_setg(errp, "cprload called for a running VM");
+        return;
+    }
+
+    f = qf_file_open(file, O_RDONLY, 0, "cprload", errp);
+    if (!f) {
+        return;
+    }
+
+    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
+        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
+        error_setg(errp, "error: %s is not a vmstate file", file);
+        return;
+    }
+
+    ret = qemu_load_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        return;
+    }
+
+    state = global_state_get_runstate();
+    if (state == RUN_STATE_RUNNING) {
+        vm_start();
+    } else {
+        runstate_set(state);
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            start_on_wake = 1;
+        }
+    }
+}
diff --git a/migration/savevm.h b/migration/savevm.h
index ba64a7e..7413254 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
 void qemu_loadvm_state_cleanup(void);
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                       const char *name, Error **errp);
 
 #endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index d395e80..9f2be5c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -165,6 +165,7 @@ uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
 bool wakeup_suspend_enabled;
 bool memfd_alloc;
+int start_on_wake;
 static char **argv_main;
 
 int icount_align_option;
@@ -604,6 +605,8 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
     { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
     { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
 
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
@@ -1527,7 +1530,17 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
     if (!(wakeup_reason_mask & (1 << reason))) {
         return;
     }
-    runstate_set(RUN_STATE_RUNNING);
+
+    /*
+     * Must call vm_start if it has never been called, to invoke the state
+     * change callbacks for the first time.
+     */
+    if (start_on_wake) {
+        start_on_wake = 0;
+        vm_start();
+    } else {
+        runstate_set(RUN_STATE_RUNNING);
+    }
     wakeup_reason = reason;
     qemu_notify_event();
 }
@@ -4510,6 +4523,12 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(0);
     }
 
+    /* Equivalent to -S, but no need for parent to modify argv. */
+    if (getenv("QEMU_START_FREEZE")) {
+        unsetenv("QEMU_START_FREEZE");
+        autostart = 0;
+    }
+
     if (incoming) {
         Error *local_err = NULL;
         qemu_start_incoming_migration(incoming, &local_err);
-- 
1.8.3.1


