Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F2158177E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:34:37 +0200 (CEST)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNW0-0007kR-Bk
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9q-0002yu-Tq
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9o-0006Ag-6e
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:42 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3Uo016260;
 Tue, 26 Jul 2022 16:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=E6TXwK1/WJ7d+7ecsRmCREBhp+ocOagKPApyHnMH70I=;
 b=jT4hbux4qzsDyk8E0LoUB9OjMNn9XhXTr6dBq8va95fP95B1EEKdoQ8RKDmMVJBhvUxV
 Sr1Ds4h+0JJb3i8EO4RsVuU7M4oXyY3p1aXsEaNcGoeehFxfN0fFMdYbU/TMkyrcfC1T
 gcig6UEZMtDwLy2BWrwhQUOQNLNPhZSToakLStsj9IZgm41RUBeUgDfsRnJFAbAKRmpL
 LIOx9dDcLA+z37tVSsYRpoKU8qm5VJYXQNjZPV0jrG/wYQyqruWX86strZjYvwl/CIXo
 ZhNUYH/rkfjglfEOZMdliMX2DCL/3V0y4uLouzO/kj0XzfGRr7LPRsxQrM23MF8t6GMu +A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:20 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFEnp8006399; Tue, 26 Jul 2022 16:11:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq22k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:19 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSv023334;
 Tue, 26 Jul 2022 16:11:18 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-25; Tue, 26 Jul 2022 16:11:18 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 24/46] cpr: ram block blockers
Date: Tue, 26 Jul 2022 09:10:21 -0700
Message-Id: <1658851843-236870-25-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: 3F0JnfG6Ge_wFNQ7ejou9QdC0sD_NCmB
X-Proofpoint-ORIG-GUID: 3F0JnfG6Ge_wFNQ7ejou9QdC0sD_NCmB
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

Unlike cpr-reboot mode, cpr-exec mode cannot save volatile ram blocks in the
migration stream file and recreate them later, because the physical memory for
the blocks is pinned and registered for vfio.  Add an exec-mode blocker for
volatile ram blocks.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h   |  2 ++
 include/exec/ramblock.h |  1 +
 softmmu/physmem.c       | 45 +++++++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c            |  2 ++
 4 files changed, 50 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9629289..128bf3e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3039,6 +3039,8 @@ bool ram_block_discard_is_disabled(void);
  */
 bool ram_block_discard_is_required(void);
 
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
index 29baa0f..ac0ae25 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -67,6 +67,7 @@
 
 #include "qemu/pmem.h"
 
+#include "migration/blocker.h"
 #include "migration/cpr-state.h"
 #include "migration/misc.h"
 #include "migration/vmstate.h"
@@ -1979,6 +1980,49 @@ static bool memory_region_is_backend(MemoryRegion *mr)
     return !!object_dynamic_cast(OBJECT(mr)->parent, TYPE_MEMORY_BACKEND);
 }
 
+/*
+ * Return true if ram contents would be lost during cpr for MIG_MODE_CPR_EXEC.
+ * Return false for ram_device because it is remapped after exec.  Do not
+ * exclude rom, even though it is readonly, because the rom file could change
+ * in the new qemu.  Return false for non-migratable blocks.  They are either
+ * re-created after exec, or are handled specially, or are covered by a
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
+        (!qemu_ram_is_shared(rb) || !ramblock_is_named_file(rb)) &&
+        qemu_ram_is_migratable(rb) &&
+        rb->fd < 0;
+}
+
+/*
+ * Add a MIG_MODE_CPR_EXEC blocker for each volatile ram block.  This cannot be
+ * performed in ram_block_add because the migratable flag has not been set yet.
+ * No need to examine anonymous (non-backend) blocks, because they are
+ * created using memfd if cpr-exec mode is enabled.
+ */
+void ram_block_add_cpr_blockers(Error **errp)
+{
+    RAMBlock *rb;
+
+    RAMBLOCK_FOREACH(rb) {
+        if (ram_is_volatile(rb) && memory_region_is_backend(rb->mr)) {
+            const char *name = memory_region_name(rb->mr);
+            rb->cpr_blocker = NULL;
+            error_setg(&rb->cpr_blocker,
+                    "Memory region %s is volatile. A memory-backend-memfd or"
+                    " memory-backend-file with share=on is required.", name);
+            migrate_add_blockers(&rb->cpr_blocker, errp, MIG_MODE_CPR_EXEC, -1);
+        }
+    }
+}
+
 static void *qemu_anon_memfd_alloc(RAMBlock *rb, size_t maxlen, Error **errp)
 {
     size_t len, align;
@@ -2285,6 +2329,7 @@ void qemu_ram_free(RAMBlock *block)
 
     qemu_mutex_lock_ramlist();
     cpr_delete_memfd(memory_region_name(block->mr));
+    migrate_del_blocker(&block->cpr_blocker);
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 83f3be0..5f6cd8c 100644
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
@@ -2589,6 +2590,7 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_init_board();
     qemu_create_cli_devices();
     qemu_machine_creation_done();
+    ram_block_add_cpr_blockers(&error_fatal);
 
     if (loadvm) {
         load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
-- 
1.8.3.1


