Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595C68E0D9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:04:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTFp-0007is-S0; Tue, 07 Feb 2023 14:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTFk-0007fO-P9
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:03:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTFi-0003oP-Nq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:03:40 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317IxBHH022113; Tue, 7 Feb 2023 19:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=AEJT/Adq5Wasll5tYTNBKb4ccK2SzLLmTiSJKH4Ws98=;
 b=UnsWsAfNUW0wvNrGnQAiSq4Py1ULDMb5BGUAMrkOlpTbuv6+l/RjlMEOg5UzZlCPouK2
 jXhHdBEXshwaptzS0Xle31uNP9RFIsNqkt117fHT/1D/yra69Up9JBifc8MHSpwXn8V1
 J56YBu5ZrrL1ZvRnSqjsTUMI45IK/23dSm+c+WPHgeczX7QjXI6IslpMUNYKxeJmPoKY
 u18LxYptP5UmZHfkKLw4n/sWHWL9VzoH+7MWTYVRjIerDyfhu+4zlQ9ghSx73nX2T2wW
 SqmQVKFzPQOmHEl8cvzyzzN6mh96CjeWV4r6RwD1XS2SN6ppvIu/0wEHBs8Q2dInCL1W +g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu6agy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:03:36 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317HvhDU028763; Tue, 7 Feb 2023 19:03:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtd4da6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:03:35 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317J3YQL019516;
 Tue, 7 Feb 2023 19:03:34 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtd4d96-1; Tue, 07 Feb 2023 19:03:34 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Xu <peterx@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2] memory: RAM_NAMED_FILE flag
Date: Tue,  7 Feb 2023 11:03:33 -0800
Message-Id: <1675796613-235716-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070170
X-Proofpoint-GUID: VdpGFGA_ApZ4UlFpB4GCKrPpC38Y3uY_
X-Proofpoint-ORIG-GUID: VdpGFGA_ApZ4UlFpB4GCKrPpC38Y3uY_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

migrate_ignore_shared() is an optimization that avoids copying memory
that is visible and can be mapped on the target.  However, a
memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
flag set is not migrated when migrate_ignore_shared() is true.  This is
wrong, because the block has no named backing store, and its contents will
be lost.  To fix, ignore shared memory iff it is a named file.  Define a
new flag RAM_NAMED_FILE to distinguish this case.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/hostmem-file.c   | 1 +
 include/exec/cpu-common.h | 1 +
 include/exec/memory.h     | 3 +++
 migration/ram.c           | 3 ++-
 softmmu/physmem.c         | 7 ++++++-
 5 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 2514128..486d77d 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -56,6 +56,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
+    ram_flags |= RAM_NAMED_FILE;
     memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
                                      backend->size, fb->align, ram_flags,
                                      fb->mem_path, fb->readonly, errp);
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40..8173e3b 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -92,6 +92,7 @@ void qemu_ram_set_uf_zeroable(RAMBlock *rb);
 bool qemu_ram_is_migratable(RAMBlock *rb);
 void qemu_ram_set_migratable(RAMBlock *rb);
 void qemu_ram_unset_migratable(RAMBlock *rb);
+bool qemu_ram_is_named_file(RAMBlock *rb);
 int qemu_ram_get_fd(RAMBlock *rb);
 
 size_t qemu_ram_pagesize(RAMBlock *block);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2..3224e09 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -232,6 +232,9 @@ typedef struct IOMMUTLBEvent {
 /* RAM that isn't accessible through normal means. */
 #define RAM_PROTECTED (1 << 8)
 
+/* RAM is an mmap-ed named file */
+#define RAM_NAMED_FILE (1 << 9)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/migration/ram.c b/migration/ram.c
index 334309f..03f8131 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -190,7 +190,8 @@ static bool postcopy_preempt_active(void)
 bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
-           (migrate_ignore_shared() && qemu_ram_is_shared(block));
+           (migrate_ignore_shared() && qemu_ram_is_shared(block) &&
+            qemu_ram_is_named_file(block));
 }
 
 #undef RAMBLOCK_FOREACH
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cb998cd..767a5f0 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1749,6 +1749,11 @@ void qemu_ram_unset_migratable(RAMBlock *rb)
     rb->flags &= ~RAM_MIGRATABLE;
 }
 
+bool qemu_ram_is_named_file(RAMBlock *rb)
+{
+    return rb->flags & RAM_NAMED_FILE;
+}
+
 int qemu_ram_get_fd(RAMBlock *rb)
 {
     return rb->fd;
@@ -2059,7 +2064,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
     /* Just support these ram flags by now. */
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
-                          RAM_PROTECTED)) == 0);
+                          RAM_PROTECTED | RAM_NAMED_FILE)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
-- 
1.8.3.1


