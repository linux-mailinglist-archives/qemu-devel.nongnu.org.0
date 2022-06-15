Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDEB54CC15
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:01:54 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UWn-0006IX-M0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO4-00062d-RZ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO2-0000z2-4o
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:52 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0Gvj025874;
 Wed, 15 Jun 2022 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=oz2a9kX80ZSmiSS4Jq/4ZECWeEFcQFKs9Vlr5pBDPks=;
 b=idf0yA46Ur8+b8k3p6pgKH9qj42BDMpk1xk21rZgRXsv0Rtum3K4JkI42fDjANPiuDLk
 jaQE0aXsjyuY0zfpjNgZlI6zD6xB3l8rBRWAGSYZBG41wn4NJBpYuLo2zrHjQkAivzli
 w3Wejilhyo6HApCFgx7jqO2FdQCaEG+UjQ1ffEIJmLSima/zMXYLcPlLevba4ggWbcJL
 9nRXZTD1b+O3CzeSAyHP/NgBzA/Kk/DwVCYloNNpTlJxnYbbdUImJkAA7sbAmkHFjCzz
 SqkMD6cmLH4SkoKCZ7AWFuT+ONQBOnPSUVLTAZX0mApL51s5IDqUSBVUSE26ZktndqGP UA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:37 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ6A0023069; Wed, 15 Jun 2022 14:52:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:36 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSMt018501;
 Wed, 15 Jun 2022 14:52:35 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-7; Wed, 15 Jun 2022 14:52:35 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 06/39] cpr: reboot mode
Date: Wed, 15 Jun 2022 07:51:53 -0700
Message-Id: <1655304746-102776-7-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: ALMjSEPnyyLQSsdSsjBH1rwMPfuDGPin
X-Proofpoint-ORIG-GUID: ALMjSEPnyyLQSsdSsjBH1rwMPfuDGPin
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Provide the cpr-save and cpr-load functions for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
any type of guest image and block device, but the caller must not modify
guest block devices between cpr-save and cpr-load.

cpr-save supports several modes, the first of which is reboot. In this mode
the caller invokes cpr-save and then terminates qemu.  The caller may then
update the host kernel and system software and reboot.  The caller resumes
the guest by running qemu with the same arguments as the original process
and invoking cpr-load.  To use this mode, guest ram must be mapped to a
persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

cpr-load loads state from the file.  If the VM was running at cpr-save time
then VM execution resumes.  If the VM was suspended at cpr-save time, then
the caller must issue a system_wakeup command to resume.

cpr-save syntax:
  { 'enum': 'CprMode', 'data': [ 'reboot' ] }
  { 'command': 'cpr-save', 'data': { 'filename': 'str', 'mode': 'CprMode' }}

cpr-load syntax:
  { 'command': 'cpr-load', 'data': { 'filename': 'str', 'mode': 'CprMode' }}

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |   8 ++++
 include/migration/cpr.h |  16 +++++++
 migration/cpr.c         | 116 ++++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build   |   1 +
 qapi/cpr.json           |  62 ++++++++++++++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 softmmu/runstate.c      |   1 +
 8 files changed, 206 insertions(+)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cf6174..9273891 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3152,6 +3152,14 @@ F: net/filter-rewriter.c
 F: net/filter-mirror.c
 F: tests/qtest/test-filter*
 
+CPR
+M: Steve Sistare <steven.sistare@oracle.com>
+M: Mark Kanda <mark.kanda@oracle.com>
+S: Maintained
+F: include/migration/cpr.h
+F: migration/cpr.c
+F: qapi/cpr.json
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..1b6c82f
--- /dev/null
+++ b/include/migration/cpr.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
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
+void cpr_set_mode(CprMode mode);
+CprMode cpr_get_mode(void);
+
+#endif
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..24b0bcc
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,116 @@
+/*
+ * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "migration/cpr.h"
+#include "migration/global_state.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-cpr.h"
+#include "qemu-file-channel.h"
+#include "qemu-file.h"
+#include "savevm.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
+
+static CprMode cpr_mode = CPR_MODE_NONE;
+
+CprMode cpr_get_mode(void)
+{
+    return cpr_mode;
+}
+
+void cpr_set_mode(CprMode mode)
+{
+    cpr_mode = mode;
+}
+
+void qmp_cpr_save(const char *filename, CprMode mode, Error **errp)
+{
+    int ret;
+    QEMUFile *f;
+    int saved_vm_running = runstate_is_running();
+
+    if (global_state_store()) {
+        error_setg(errp, "Error saving global state");
+        return;
+    }
+
+    f = qemu_fopen_file(filename, O_CREAT | O_WRONLY | O_TRUNC, 0600,
+                        "cpr-save", errp);
+    if (!f) {
+        return;
+    }
+
+    if (runstate_check(RUN_STATE_SUSPENDED)) {
+        /* Update timers_state before saving.  Suspend did not so do. */
+        cpu_disable_ticks();
+    }
+    vm_stop(RUN_STATE_SAVE_VM);
+
+    cpr_set_mode(mode);
+    ret = qemu_save_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while saving VM state", ret);
+        goto err;
+    }
+
+    return;
+
+err:
+    if (saved_vm_running) {
+        vm_start();
+    }
+    cpr_set_mode(CPR_MODE_NONE);
+}
+
+void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
+{
+    QEMUFile *f;
+    int ret;
+    RunState state;
+
+    if (runstate_is_running()) {
+        error_setg(errp, "cpr-load called for a running VM");
+        return;
+    }
+
+    f = qemu_fopen_file(filename, O_RDONLY, 0, "cpr-load", errp);
+    if (!f) {
+        return;
+    }
+
+    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
+        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
+        error_setg(errp, "%s is not a vmstate file", filename);
+        qemu_fclose(f);
+        return;
+    }
+
+    cpr_set_mode(mode);
+    ret = qemu_load_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        goto out;
+    }
+
+    state = global_state_get_runstate();
+    if (state == RUN_STATE_RUNNING) {
+        vm_start();
+    } else {
+        runstate_set(state);
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            /* Force vm_start to be called later. */
+            qemu_system_start_on_wakeup_request();
+        }
+    }
+
+out:
+    cpr_set_mode(CPR_MODE_NONE);
+}
diff --git a/migration/meson.build b/migration/meson.build
index 6880b61..76fcfdb 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -15,6 +15,7 @@ softmmu_ss.add(files(
   'channel.c',
   'colo-failover.c',
   'colo.c',
+  'cpr.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/qapi/cpr.json b/qapi/cpr.json
new file mode 100644
index 0000000..bdaabcb
--- /dev/null
+++ b/qapi/cpr.json
@@ -0,0 +1,62 @@
+# -*- Mode: Python -*-
+#
+# Copyright (c) 2021, 2022 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+##
+# = CPR - CheckPoint and Restart
+##
+
+{ 'include': 'common.json' }
+
+##
+# @CprMode:
+#
+# @reboot: checkpoint can be cpr-load'ed after a host reboot.
+#
+# Since: 7.1
+##
+{ 'enum': 'CprMode',
+  'data': [ 'none', 'reboot' ] }
+
+##
+# @cpr-save:
+#
+# Pause the VCPUs, and create a checkpoint of the virtual machine device state
+# in @filename.  Unlike snapshot-save, this command completes synchronously,
+# saves state to an ordinary file, does not save guest block device blocks,
+# and does not require that guest RAM be saved in the file.  The caller must
+# not modify guest block devices between cpr-save and cpr-load.
+#
+# If @mode is 'reboot', the checkpoint remains valid after a host reboot.
+# The guest RAM memory-backend should be shared and non-volatile across
+# reboot, else it will be saved to the file.  To resume from the checkpoint,
+# issue the quit command, reboot the system, start qemu using the same
+# arguments plus -S, and issue the cpr-load command.
+#
+# @filename: name of checkpoint file
+# @mode: @CprMode mode
+#
+# Since: 7.1
+##
+{ 'command': 'cpr-save',
+  'data': { 'filename': 'str',
+            'mode': 'CprMode' } }
+
+##
+# @cpr-load:
+#
+# Load a virtual machine from the checkpoint file @filename that was created
+# earlier by the cpr-save command, and continue the VCPUs.  @mode must match
+# the mode specified for cpr-save.
+#
+# @filename: name of checkpoint file
+# @mode: @CprMode mode
+#
+# Since: 7.1
+##
+{ 'command': 'cpr-load',
+  'data': { 'filename': 'str',
+            'mode': 'CprMode' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index 656ef0e..d9ab29d 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -30,6 +30,7 @@ qapi_all_modules = [
   'common',
   'compat',
   'control',
+  'cpr',
   'crypto',
   'dump',
   'error',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..001d790 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -77,6 +77,7 @@
 { 'include': 'ui.json' }
 { 'include': 'authz.json' }
 { 'include': 'migration.json' }
+{ 'include': 'cpr.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'compat.json' }
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 9b27d74..cfd6aa9 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -116,6 +116,7 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
     { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
     { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
 
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
-- 
1.8.3.1


