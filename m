Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236354CC07
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:00:33 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UVU-0003vX-BD
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOC-0006OC-68
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO9-000110-TO
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:59 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE3J22025870;
 Wed, 15 Jun 2022 14:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=hPPI5U8n9By6D6CnUyM75BH/3nBeUyxSsGawJZht1hM=;
 b=HbsH32nBaLmJc32d1IDgdXb4cequX571O6U6A9M7kMPbGPKkgRixBSbiIqvyuSwji5pi
 hY3NOVjJ6pGbwffQA7yuQ+NHKGIumrgf+UHHXEDzQGPMtOsAykXGQ4XSa74hOAr+iLnr
 fZoOBIkJzVflI6MKEGrIkGzHmqp+pcoMFcTlftKj2Z2B7eGqoXOH/Xtg2sXjwprXL8Is
 zFhlU0r2BzOBp/L25A8jee2MC/v7jeTnup5GLUjAeKdnxnqyanKkiTUx0tDq73PGBNtz
 bHsj2QtO4o2BbiqQYJBMvTQGBQ/K1URhOYGrjOTNu71cF+xCJX/snZ2Y+OLwoudFxErM IA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:43 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ73b023111; Wed, 15 Jun 2022 14:52:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:42 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSN5018501;
 Wed, 15 Jun 2022 14:52:41 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-12; Wed, 15 Jun 2022 14:52:41 +0000
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
Subject: [PATCH V8 11/39] cpr: save ram blocks
Date: Wed, 15 Jun 2022 07:51:58 -0700
Message-Id: <1655304746-102776-12-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: klIUTvxRPURiUkMmktsxzhEdmCJO--0E
X-Proofpoint-ORIG-GUID: klIUTvxRPURiUkMmktsxzhEdmCJO--0E
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

Add a vmstate handler to save volatile ram blocks in the state file.  This
is used to preserve secondary guest ram blocks (those that cannot be
specified on the command line) such as video ram and roms for cpr reboot,
as there is no option to allocate them in shared memory.  For efficiency,
the user should create a shared memory-backend-file for the VM's main ram,
so it is not copied to the state file, but this is not enforced.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h |  6 +++++
 migration/savevm.c    |  2 ++
 softmmu/memory.c      | 18 ++++++++++++++
 softmmu/physmem.c     | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0daddd7..a03301d 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3002,6 +3002,12 @@ bool ram_block_discard_is_disabled(void);
  */
 bool ram_block_discard_is_required(void);
 
+/*
+ * Register/unregister a ram block for cpr.
+ */
+void ram_block_register(RAMBlock *rb);
+void ram_block_unregister(RAMBlock *rb);
+
 #endif
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 0b2c5cd..9d528ed 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3108,10 +3108,12 @@ void vmstate_register_ram(MemoryRegion *mr, DeviceState *dev)
     qemu_ram_set_idstr(mr->ram_block,
                        memory_region_name(mr), dev);
     qemu_ram_set_migratable(mr->ram_block);
+    ram_block_register(mr->ram_block);
 }
 
 void vmstate_unregister_ram(MemoryRegion *mr, DeviceState *dev)
 {
+    ram_block_unregister(mr->ram_block);
     qemu_ram_unset_idstr(mr->ram_block);
     qemu_ram_unset_migratable(mr->ram_block);
 }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7ba2048..0fe6fac 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3541,13 +3541,31 @@ void __attribute__((weak)) fuzz_dma_read_cb(size_t addr,
 }
 #endif
 
+static char *
+memory_region_vmstate_if_get_id(VMStateIf *obj)
+{
+    MemoryRegion *mr = MEMORY_REGION(obj);
+    return strdup(mr->ram_block->idstr);
+}
+
+static void memory_region_class_init(ObjectClass *class, void *data)
+{
+    VMStateIfClass *vc = VMSTATE_IF_CLASS(class);
+    vc->get_id = memory_region_vmstate_if_get_id;
+}
+
 static const TypeInfo memory_region_info = {
     .parent             = TYPE_OBJECT,
     .name               = TYPE_MEMORY_REGION,
     .class_size         = sizeof(MemoryRegionClass),
+    .class_init         = memory_region_class_init,
     .instance_size      = sizeof(MemoryRegion),
     .instance_init      = memory_region_initfn,
     .instance_finalize  = memory_region_finalize,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_VMSTATE_IF },
+        { }
+    }
 };
 
 static const TypeInfo iommu_memory_region_info = {
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0f1ce28..822c424 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -66,7 +66,9 @@
 
 #include "qemu/pmem.h"
 
+#include "migration/cpr.h"
 #include "migration/vmstate.h"
+#include "migration/qemu-file.h"
 
 #include "qemu/range.h"
 #ifndef _WIN32
@@ -2450,6 +2452,71 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
+static int put_ram_block(QEMUFile *f, void *pv, size_t size,
+                         const VMStateField *field, JSONWriter *vmdesc)
+{
+    RAMBlock *rb = pv;
+
+    if (rb->used_length > 1024 * 1024) {
+        warn_report("Large RAM block %s size %ld saved to state file. "
+                    "Use a shared file memory backend to avoid the copy.",
+                    rb->idstr, rb->used_length);
+    }
+    qemu_put_buffer(f, rb->host, rb->used_length);
+    return 0;
+}
+
+static int get_ram_block(QEMUFile *f, void *pv, size_t size,
+                         const VMStateField *field)
+{
+    RAMBlock *rb = pv;
+    qemu_get_buffer(f, rb->host, rb->used_length);
+    return 0;
+}
+
+static const VMStateInfo vmstate_info_ram_block = {
+    .name = "ram block host",
+    .get  = get_ram_block,
+    .put  = put_ram_block,
+};
+
+#define VMSTATE_RAM_BLOCK() {           \
+    .name  = "ram_block_host",          \
+    .info  = &vmstate_info_ram_block,   \
+    .flags = VMS_SINGLE,                \
+}
+
+static bool ram_block_needed(void *opaque)
+{
+    RAMBlock *rb = opaque;
+
+    return cpr_get_mode() == CPR_MODE_REBOOT &&
+        qemu_ram_is_migratable(rb) &&
+        (!qemu_ram_is_shared(rb) || ramblock_is_anon(rb));
+}
+
+const VMStateDescription vmstate_ram_block = {
+    .name = "RAMBlock",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ram_block_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(used_length, RAMBlock),
+        VMSTATE_RAM_BLOCK(),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+void ram_block_register(RAMBlock *rb)
+{
+    vmstate_register(VMSTATE_IF(rb->mr), 0, &vmstate_ram_block, rb);
+}
+
+void ram_block_unregister(RAMBlock *rb)
+{
+    vmstate_unregister(VMSTATE_IF(rb->mr), &vmstate_ram_block, rb);
+}
+
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
-- 
1.8.3.1


