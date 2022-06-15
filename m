Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED154CC2D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:06:24 +0200 (CEST)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Ub7-0006bu-08
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOV-0007BC-Fd
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOT-00012v-G6
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:19 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0c2I001492;
 Wed, 15 Jun 2022 14:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=rZBR0a1ztLqfou4cV1wfBrsD2ASxK5jsh8y8PeRXV78=;
 b=U9o6vry/6ADJt2ohlOxoczG2NcqBYyetrRENOjVpTVNtbgN2nzmveBi0bx31gE01aMyG
 6uKWOtWXRLHQ3fBVQRXhyChJIOIU+4PdTrKRa4ij6pRrSf06eGMzGQ5AV5VK0ferPLhr
 3mwsh0cqtTRKecasn2uiFsEGvUsfor9fu5dyFp5tqpFAtPOewXRbeqilwytpJlwBfc9R
 0vq1n1d5bNTJfVWM2oNP/TuEg7B+zhj4LQ+6ar8t7o5rd3UtzplGooUpsxl51hwga9ab
 Ec2d756eOlTXGIrSxlJAs2rSFdsZ58OQ9aIFx5S+icBV9J9aZRMzztsF2Wq+XyhopiuN sQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns8tm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:56 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7MN023113; Wed, 15 Jun 2022 14:52:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:55 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNR018501;
 Wed, 15 Jun 2022 14:52:54 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-23; Wed, 15 Jun 2022 14:52:54 +0000
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
Subject: [PATCH V8 22/39] cpr: ram block blockers
Date: Wed, 15 Jun 2022 07:52:09 -0700
Message-Id: <1655304746-102776-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: 2EmgyVf4s3howsLwf2Qmg0DAyQ3W8UMk
X-Proofpoint-ORIG-GUID: 2EmgyVf4s3howsLwf2Qmg0DAyQ3W8UMk
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

Unlike reboot mode, restart mode cannot save volatile ram blocks in the
vmstate file and recreate them later, because the physical memory for the
blocks is pinned and registered for vfio.  Add a restart-mode blocker for
volatile ram blocks.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h   |  2 ++
 include/exec/ramblock.h |  1 +
 softmmu/physmem.c       | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c            |  2 ++
 4 files changed, 53 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6a257a4..812226f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3039,6 +3039,8 @@ bool ram_block_discard_is_required(void);
 void ram_block_register(RAMBlock *rb);
 void ram_block_unregister(RAMBlock *rb);
 
+void ram_block_add_cpr_blockers(Error **errp);
+
 #endif
 
 #endif
diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 6cbedf9..a5cbd9e 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -39,6 +39,7 @@ struct RAMBlock {
     /* RCU-enabled, writes protected by the ramlist lock */
     QLIST_ENTRY(RAMBlock) next;
     QLIST_HEAD(, RAMBlockNotifier) ramblock_notifiers;
+    Error *cpr_blocker;
     int fd;
     size_t page_size;
     /* dirty bitmap used during migration */
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 412cc80..b90ab4e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1968,6 +1968,53 @@ static bool memory_region_is_backend(MemoryRegion *mr)
     return !!object_dynamic_cast(mr->parent_obj.parent, TYPE_MEMORY_BACKEND);
 }
 
+/*
+ * Return true if ram contents would be lost during cpr for CPR_MODE_RESTART.
+ * Return false for ram_device because it is remapped after restart.  Do not
+ * exclude rom, even though it is readonly, because the rom file could change
+ * in the new qemu.  Return false for non-migratable blocks.  They are either
+ * re-created after restart, or are handled specially, or are covered by a
+ * device-level cpr blocker.  Return false for an fd, because it is visible and
+ * can be remapped in the new process.
+ */
+static bool ram_is_volatile(RAMBlock *rb)
+{
+    MemoryRegion *mr = rb->mr;
+
+    return mr &&
+        memory_region_is_ram(mr) &&
+        !memory_region_is_ram_device(mr) &&
+        (!qemu_ram_is_shared(rb) || ramblock_is_anon(rb)) &&
+        qemu_ram_is_migratable(rb) &&
+        rb->fd < 0;
+}
+
+/*
+ * Add a CPR_MODE_RESTART blocker for each volatile ram block.  This cannot be
+ * performed in ram_block_add because the migratable flag has not been set yet.
+ */
+void ram_block_add_cpr_blockers(Error **errp)
+{
+    RAMBlock *rb;
+
+    RAMBLOCK_FOREACH(rb) {
+        if (ram_is_volatile(rb)) {
+            const char *name = memory_region_name(rb->mr);
+            rb->cpr_blocker = NULL;
+            if (memory_region_is_backend(rb->mr)) {
+                error_setg(&rb->cpr_blocker,
+                    "Memory region %s is volatile. A memory-backend-memfd or"
+                    " memory-backend-file with share=on is required.", name);
+            } else {
+                error_setg(&rb->cpr_blocker,
+                    "Memory region %s is volatile. "
+                    "-cpr-enable restart is required.", name);
+            }
+            cpr_add_blocker(&rb->cpr_blocker, errp, CPR_MODE_RESTART, 0);
+        }
+    }
+}
+
 static void *qemu_anon_memfd_alloc(RAMBlock *rb, size_t maxlen, Error **errp)
 {
     size_t len, align;
@@ -2275,6 +2322,7 @@ void qemu_ram_free(RAMBlock *block)
 
     qemu_mutex_lock_ramlist();
     cpr_delete_memfd(memory_region_name(block->mr));
+    cpr_del_blocker(&block->cpr_blocker);
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ce779cf..3e19c74 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -28,6 +28,7 @@
 #include "qemu/units.h"
 #include "exec/cpu-common.h"
 #include "exec/page-vary.h"
+#include "exec/memory.h"
 #include "hw/qdev-properties.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
@@ -2569,6 +2570,7 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_init_board();
     qemu_create_cli_devices();
     qemu_machine_creation_done();
+    ram_block_add_cpr_blockers(&error_fatal);
 
     if (loadvm) {
         load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
-- 
1.8.3.1


