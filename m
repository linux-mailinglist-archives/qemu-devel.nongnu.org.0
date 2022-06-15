Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C9D54CF00
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:47:44 +0200 (CEST)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1WBD-0002JK-1N
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1Vwe-0003xE-TN
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:32:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1Vwb-0002Au-71
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:32:40 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0Gvf025874;
 Wed, 15 Jun 2022 14:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=sGF/hoUS2Ixg7lqKUCEQZ8cExPMGnWqsW/teGPcQQ7I=;
 b=ib+rhH9TkCXDfTsXonJPEYWarcmdVxhEJxxWae1Zdg2dKwm69zLaEUAfIT+Z07OV/T1A
 nalG4gsBTV+xWgq1iJ3walxQ74lPKq/BeRI+/hoJUUTGpGZU2GTZtC7A+MYT+6cOWuVA
 A1G+/qTLlSXf/GZ/+PUYDN5PZaDlAB4xIkPpOJ62fZ2UX32Y3hcXFVFI5xVk5fHQryq2
 /8aIZqLEgBGV0XszMAYVpQXoPaZXiODYQpUvALo0zy8n3pYTocsIVICaZGPCx+QPfeqa
 3h9knUW37BMhVOmGRlGXOoQU8zOAHgn3N6inYe3gV2n/+si4HGhp2vbWls1z2Iy3kdTV zA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:34 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ733023089; Wed, 15 Jun 2022 14:52:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vphf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:33 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSMp018501;
 Wed, 15 Jun 2022 14:52:32 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-5; Wed, 15 Jun 2022 14:52:32 +0000
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
Subject: [PATCH V8 04/39] memory: RAM_ANON flag
Date: Wed, 15 Jun 2022 07:51:51 -0700
Message-Id: <1655304746-102776-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: 7j5n_AbGmqHc4nXvieLNMfYUuNtmkaDO
X-Proofpoint-ORIG-GUID: 7j5n_AbGmqHc4nXvieLNMfYUuNtmkaDO
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01,
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

A memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
flag set is not migrated when migrate_ignore_shared() is true, but this
is wrong, because it has no named backing store, and its contents will be
lost.  Define a new flag RAM_ANON to distinguish this case.  Cpr will also
test this flag, for similar reasons.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/hostmem-epc.c   |  2 +-
 backends/hostmem-memfd.c |  1 +
 backends/hostmem-ram.c   |  1 +
 include/exec/memory.h    |  3 +++
 include/exec/ram_addr.h  |  1 +
 migration/ram.c          |  3 ++-
 softmmu/physmem.c        | 12 +++++++++---
 7 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 037292d..cb06255 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -37,7 +37,7 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     }
 
     name = object_get_canonical_path(OBJECT(backend));
-    ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED;
+    ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED | MAP_ANON;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size, ram_flags,
                                    fd, 0, errp);
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 3fc85c3..c9d8001 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
+    ram_flags |= RAM_ANON;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
                                    backend->size, ram_flags, fd, 0, errp);
     g_free(name);
diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
index b8e55cd..5e80149 100644
--- a/backends/hostmem-ram.c
+++ b/backends/hostmem-ram.c
@@ -30,6 +30,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
+    ram_flags |= RAM_ANON;
     memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
                                            backend->size, ram_flags, errp);
     g_free(name);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index f1c1945..0daddd7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -203,6 +203,9 @@ typedef struct IOMMUTLBEvent {
 /* RAM that isn't accessible through normal means. */
 #define RAM_PROTECTED (1 << 8)
 
+/* RAM has no name outside the qemu process. */
+#define RAM_ANON (1 << 9)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f3e0c78..56188b8 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -94,6 +94,7 @@ static inline unsigned long int ramblock_recv_bitmap_offset(void *host_addr,
 }
 
 bool ramblock_is_pmem(RAMBlock *rb);
+bool ramblock_is_anon(RAMBlock *rb);
 
 long qemu_minrampagesize(void);
 long qemu_maxrampagesize(void);
diff --git a/migration/ram.c b/migration/ram.c
index 5f5e37f..5cdb93d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -164,7 +164,8 @@ out:
 bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
-           (migrate_ignore_shared() && qemu_ram_is_shared(block));
+           (migrate_ignore_shared() && qemu_ram_is_shared(block) &&
+            !ramblock_is_anon(block));
 }
 
 #undef RAMBLOCK_FOREACH
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 657841e..0f1ce28 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1975,6 +1975,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     new_block->offset = find_ram_offset(new_block->max_length);
 
     if (!new_block->host) {
+        new_block->flags |= RAM_ANON;
         if (xen_enabled()) {
             xen_ram_alloc(new_block->offset, new_block->max_length,
                           new_block->mr, &err);
@@ -2059,7 +2060,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
     /* Just support these ram flags by now. */
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
-                          RAM_PROTECTED)) == 0);
+                          RAM_PROTECTED | RAM_ANON)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
@@ -2151,7 +2152,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     Error *local_err = NULL;
 
     assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
-                          RAM_NORESERVE)) == 0);
+                          RAM_NORESERVE | RAM_ANON)) == 0);
     assert(!host ^ (ram_flags & RAM_PREALLOC));
 
     size = HOST_PAGE_ALIGN(size);
@@ -2185,7 +2186,7 @@ RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
 RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags,
                          MemoryRegion *mr, Error **errp)
 {
-    assert((ram_flags & ~(RAM_SHARED | RAM_NORESERVE)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_NORESERVE | RAM_ANON)) == 0);
     return qemu_ram_alloc_internal(size, size, NULL, NULL, ram_flags, mr, errp);
 }
 
@@ -3664,6 +3665,11 @@ bool ramblock_is_pmem(RAMBlock *rb)
     return rb->flags & RAM_PMEM;
 }
 
+bool ramblock_is_anon(RAMBlock *rb)
+{
+    return rb->flags & RAM_ANON;
+}
+
 static void mtree_print_phys_entries(int start, int end, int skip, int ptr)
 {
     if (start == end - 1) {
-- 
1.8.3.1


