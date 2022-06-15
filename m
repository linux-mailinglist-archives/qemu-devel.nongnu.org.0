Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BB354CC36
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:09:32 +0200 (CEST)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UeA-0004a4-V3
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOU-00078L-6J
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:18 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOS-00012o-3q
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:17 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0Gvv025874;
 Wed, 15 Jun 2022 14:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=xcRVb5A5sUPmhFgH94z2dKmOmv04moZKedIBiTOb5jo=;
 b=DQq6fso63aVQCHQ9YVvoc+Ky9x6KEfvYo0z+Kd8/tn+Bdl1H/re/Hzbqw7uMtE9COevj
 detnonp4q/XaClONvRjLnb1919A5Gmkw31Tn3XJ5u4om0XlgW/da+c/UMFlF1xWbEKB1
 Um6aDD9UYZqoCl5cmbUURNblIhGLrdO3Bg64ErbmqSgez2pcWqOohdcWcX8xtHNZTeG2
 nPqWrrW+NowCNBwWzokm/twtn8M53u6VMuE+qaPLW0elbiEBmVWO6rckwomIuNrccIOx
 ZMAowsLgOjbKHfZkuLC/h06mG99zkijySmEzN8FpeRQ4n1IQU4K95YVmF7iqkd/jhgB3 LQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:54 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7e7023149; Wed, 15 Jun 2022 14:52:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:53 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNN018501;
 Wed, 15 Jun 2022 14:52:52 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-21; Wed, 15 Jun 2022 14:52:52 +0000
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
Subject: [PATCH V8 20/39] cpr: restart mode
Date: Wed, 15 Jun 2022 07:52:07 -0700
Message-Id: <1655304746-102776-21-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: PwKJ-eDFHjP9uBMLXfG1Av_QST63dNXx
X-Proofpoint-ORIG-GUID: PwKJ-eDFHjP9uBMLXfG1Av_QST63dNXx
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

Provide the cpr-save restart mode, which preserves the guest VM across a
restart of the qemu process.  After cpr-save, the caller passes qemu
command-line arguments to cpr-exec, which directly exec's the new qemu
binary.  The arguments must include -S so new qemu starts in a paused state.
The caller resumes the guest by calling cpr-load.

To use the restart mode, guest RAM must be backed by a memory-backend-file
with share=on.  The '-cpr-enable restart' option causes secondary guest
ram blocks (those not specified on the command line) to be allocated by
mmap'ing a memfd.  The memfd values are saved in special cpr state which
is retrieved after exec, and are kept open across exec, after which they
are retrieved and re-mmap'd.  Hence guest RAM is preserved in place, albeit
with new virtual addresses in the qemu process.

The restart mode supports vfio devices and memory-backend-memfd in
subsequent patches.

cpr-exec syntax:
  { 'command': 'cpr-exec', 'data': { 'argv': [ 'str' ] } }

Add the restart mode:
  { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/cpr.c   | 35 +++++++++++++++++++++++++++++++++++
 qapi/cpr.json     | 26 +++++++++++++++++++++++++-
 qemu-options.hx   |  2 +-
 softmmu/physmem.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 trace-events      |  1 +
 5 files changed, 107 insertions(+), 3 deletions(-)

diff --git a/migration/cpr.c b/migration/cpr.c
index 1cc8738..8b3fffd 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -22,6 +22,7 @@ static int cpr_enabled_modes;
 void cpr_init(int modes)
 {
     cpr_enabled_modes = modes;
+    cpr_state_load(&error_fatal);
 }
 
 bool cpr_enabled(CprMode mode)
@@ -153,6 +154,37 @@ err:
     cpr_set_mode(CPR_MODE_NONE);
 }
 
+static int preserve_fd(const char *name, int id, int fd, void *opaque)
+{
+    qemu_clear_cloexec(fd);
+    return 0;
+}
+
+static int unpreserve_fd(const char *name, int id, int fd, void *opaque)
+{
+    qemu_set_cloexec(fd);
+    return 0;
+}
+
+void qmp_cpr_exec(strList *args, Error **errp)
+{
+    if (!runstate_check(RUN_STATE_SAVE_VM)) {
+        error_setg(errp, "runstate is not save-vm");
+        return;
+    }
+    if (cpr_get_mode() != CPR_MODE_RESTART) {
+        error_setg(errp, "cpr-exec requires cpr-save with restart mode");
+        return;
+    }
+
+    cpr_walk_fd(preserve_fd, 0);
+    if (cpr_state_save(errp)) {
+        return;
+    }
+
+    assert(qemu_system_exec_request(args, errp) == 0);
+}
+
 void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
 {
     QEMUFile *f;
@@ -189,6 +221,9 @@ void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
         goto out;
     }
 
+    /* Clear cloexec to prevent fd leaks until the next cpr-save */
+    cpr_walk_fd(unpreserve_fd, 0);
+
     state = global_state_get_runstate();
     if (state == RUN_STATE_RUNNING) {
         vm_start();
diff --git a/qapi/cpr.json b/qapi/cpr.json
index 11c6f88..47ee4ff 100644
--- a/qapi/cpr.json
+++ b/qapi/cpr.json
@@ -15,11 +15,12 @@
 # @CprMode:
 #
 # @reboot: checkpoint can be cpr-load'ed after a host reboot.
+# @restart: checkpoint can be cpr-load'ed after restarting qemu.
 #
 # Since: 7.1
 ##
 { 'enum': 'CprMode',
-  'data': [ 'none', 'reboot' ] }
+  'data': [ 'none', 'reboot', 'restart' ] }
 
 ##
 # @cpr-save:
@@ -38,6 +39,11 @@
 # issue the quit command, reboot the system, start qemu using the same
 # arguments plus -S, and issue the cpr-load command.
 #
+# If @mode is 'restart', the checkpoint remains valid after restarting
+# qemu using a subsequent cpr-exec.  Guest RAM must be backed by a
+# memory-backend-file with share=on.
+# To resume from the checkpoint, issue the cpr-load command.
+#
 # @filename: name of checkpoint file
 # @mode: @CprMode mode
 #
@@ -48,6 +54,24 @@
             'mode': 'CprMode' } }
 
 ##
+# @cpr-exec:
+#
+# Restart qemu by directly exec'ing @argv[0], replacing the qemu process.
+# The PID remains the same.  Must be called after cpr-save restart.
+#
+# @argv[0] should be the path of a new qemu binary, or a prefix command that
+# in turn exec's the new qemu binary.  The arguments must match those used
+# to initially start qemu, plus the -S option so new qemu starts in a paused
+# state.
+#
+# @argv: arguments to be passed to exec().
+#
+# Since: 7.1
+##
+{ 'command': 'cpr-exec',
+  'data': { 'argv': [ 'str' ] } }
+
+##
 # @cpr-load:
 #
 # Load a virtual machine from the checkpoint file @filename that was created
diff --git a/qemu-options.hx b/qemu-options.hx
index 6e51c33..1b49360 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4484,7 +4484,7 @@ SRST
 ERST
 
 DEF("cpr-enable", HAS_ARG, QEMU_OPTION_cpr_enable, \
-    "-cpr-enable reboot    enable the cpr mode\n",
+    "-cpr-enable reboot|restart    enable the cpr mode\n",
     QEMU_ARCH_ALL)
 SRST
 ``-cpr-enable reboot``
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 822c424..412cc80 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -44,6 +44,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/log.h"
 #include "qemu/memalign.h"
+#include "qemu/memfd.h"
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "sysemu/dma.h"
@@ -1962,6 +1963,40 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
     }
 }
 
+static bool memory_region_is_backend(MemoryRegion *mr)
+{
+    return !!object_dynamic_cast(mr->parent_obj.parent, TYPE_MEMORY_BACKEND);
+}
+
+static void *qemu_anon_memfd_alloc(RAMBlock *rb, size_t maxlen, Error **errp)
+{
+    size_t len, align;
+    void *addr;
+    struct MemoryRegion *mr = rb->mr;
+    const char *name = memory_region_name(mr);
+    int mfd = cpr_find_memfd(name, &len, &maxlen, &align);
+
+    if (mfd >= 0) {
+        rb->used_length = len;
+        rb->max_length = maxlen;
+        mr->align = align;
+    } else {
+        len = rb->used_length;
+        maxlen = rb->max_length;
+        mr->align = QEMU_VMALLOC_ALIGN;
+        mfd = qemu_memfd_create(name, maxlen + mr->align, 0, 0, 0, errp);
+        if (mfd < 0) {
+            return NULL;
+        }
+        cpr_save_memfd(name, mfd, len, maxlen, mr->align);
+    }
+    rb->flags |= RAM_SHARED;
+    qemu_set_cloexec(mfd);
+    addr = file_ram_alloc(rb, maxlen, mfd, false, false, 0, errp);
+    trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+    return addr;
+}
+
 static void ram_block_add(RAMBlock *new_block, Error **errp)
 {
     const bool noreserve = qemu_ram_is_noreserve(new_block);
@@ -1986,6 +2021,14 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 qemu_mutex_unlock_ramlist();
                 return;
             }
+        } else if (cpr_enabled(CPR_MODE_RESTART) &&
+                   !memory_region_is_backend(new_block->mr)) {
+            new_block->host = qemu_anon_memfd_alloc(new_block,
+                                                    new_block->max_length,
+                                                    errp);
+            if (!new_block->host) {
+                return;
+            }
         } else {
             new_block->host = qemu_anon_ram_alloc(new_block->max_length,
                                                   &new_block->mr->align,
@@ -1997,8 +2040,8 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 qemu_mutex_unlock_ramlist();
                 return;
             }
-            memory_try_enable_merging(new_block->host, new_block->max_length);
         }
+        memory_try_enable_merging(new_block->host, new_block->max_length);
     }
 
     new_ram_size = MAX(old_ram_size,
@@ -2231,6 +2274,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    cpr_delete_memfd(memory_region_name(block->mr));
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/trace-events b/trace-events
index bc71006..07369bb 100644
--- a/trace-events
+++ b/trace-events
@@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 # accel/tcg/cputlb.c
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
-- 
1.8.3.1


