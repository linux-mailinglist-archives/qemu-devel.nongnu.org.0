Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292A58171B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:15:52 +0200 (CEST)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNDr-0008Dw-3n
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9a-0002V1-JG
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9X-00068i-2P
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:26 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn0W4031705;
 Tue, 26 Jul 2022 16:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=d4Wf6zvZj7pf1CIr9mYRqH/hBauzgg9hCULr1Yp9if8=;
 b=GO0EGcwrQc3xbJZBz7FWMSopAEpw9qE0LJQay8YBgF6c9lxLGHZ2v2DAQcp+KsnIhgWi
 tjXiZTrW3XghT1Deh6o6bXhIRbQEVIcu8u6ipHcgSs7G4Ma/ksV9oLkkTJJAT8oCOSxX
 QdCMvXF2g3tbzyc+uUQSF10bwx5Kg8KlvSsM2M68Vlkx3wTUxYp+OcS6ZptVBIE0mvI2
 99okKRHgtw5aTEOsg4J+u++xltXsF4ylBUfqS339xYiG4oao7tZw+3fSLMx2WcsCrVQ0
 wB1hzp+m62ed13rb1iYfWxPga3Qq7T745w3cwEdjLHpdKLoJtYXeX9qrCjhsXVGhEX1f hQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q183-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:50 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF22wV006237; Tue, 26 Jul 2022 16:10:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq13s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:49 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSD023334;
 Tue, 26 Jul 2022 16:10:48 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-3; Tue, 26 Jul 2022 16:10:48 +0000
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
Subject: [PATCH V9 02/46] memory: RAM_NAMED_FILE flag
Date: Tue, 26 Jul 2022 09:09:59 -0700
Message-Id: <1658851843-236870-3-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-ORIG-GUID: p91a6EQpoQTppzKRHDz_TwKH0S0rS12Q
X-Proofpoint-GUID: p91a6EQpoQTppzKRHDz_TwKH0S0rS12Q
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

A memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
flag set is not migrated when migrate_ignore_shared() is true, but this
is wrong, because it has no named backing store, and its contents will be
lost.  Define a new flag RAM_NAMED_FILE to distinguish this case.  Cpr will
also test this flag, for similar reasons.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/hostmem-file.c | 1 +
 include/exec/memory.h   | 3 +++
 include/exec/ram_addr.h | 1 +
 migration/ram.c         | 3 ++-
 softmmu/physmem.c       | 7 ++++++-
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
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bfb1de8..7513d04 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -206,6 +206,9 @@ typedef struct IOMMUTLBEvent {
 /* RAM that isn't accessible through normal means. */
 #define RAM_PROTECTED (1 << 8)
 
+/* RAM is an mmap-ed named file */
+#define RAM_NAMED_FILE (1 << 9)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f3e0c78..4405e2e 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -94,6 +94,7 @@ static inline unsigned long int ramblock_recv_bitmap_offset(void *host_addr,
 }
 
 bool ramblock_is_pmem(RAMBlock *rb);
+bool ramblock_is_named_file(RAMBlock *rb);
 
 long qemu_minrampagesize(void);
 long qemu_maxrampagesize(void);
diff --git a/migration/ram.c b/migration/ram.c
index b94669b..3ea3b41 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -165,7 +165,8 @@ out:
 bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
-           (migrate_ignore_shared() && qemu_ram_is_shared(block));
+           (migrate_ignore_shared() && qemu_ram_is_shared(block) &&
+            ramblock_is_named_file(block));
 }
 
 #undef RAMBLOCK_FOREACH
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dc3c3e5..cce721a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2070,7 +2070,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
     /* Just support these ram flags by now. */
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
-                          RAM_PROTECTED)) == 0);
+                          RAM_PROTECTED | RAM_NAMED_FILE)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
@@ -3675,6 +3675,11 @@ bool ramblock_is_pmem(RAMBlock *rb)
     return rb->flags & RAM_PMEM;
 }
 
+bool ramblock_is_named_file(RAMBlock *rb)
+{
+    return rb->flags & RAM_NAMED_FILE;
+}
+
 static void mtree_print_phys_entries(int start, int end, int skip, int ptr)
 {
     if (start == end - 1) {
-- 
1.8.3.1


