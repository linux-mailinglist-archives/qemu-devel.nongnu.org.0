Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D576D152880
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 10:37:52 +0100 (CET)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izH82-0005lx-U9
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 04:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <i.kotrasinsk@partner.samsung.com>)
 id 1izH3g-0000hu-CQ
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 04:33:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <i.kotrasinsk@partner.samsung.com>)
 id 1izH3e-0004x0-3x
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 04:33:20 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <i.kotrasinsk@partner.samsung.com>)
 id 1izH3d-0004Uv-PX
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 04:33:18 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200205093315euoutp0127bf4070e62721b1e5c8198e5bb25e05~wd83dRHXz2281422814euoutp01e
 for <qemu-devel@nongnu.org>; Wed,  5 Feb 2020 09:33:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200205093315euoutp0127bf4070e62721b1e5c8198e5bb25e05~wd83dRHXz2281422814euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1580895195;
 bh=VrEMlIgxEJjU0sxujhBCFCGXNdNA8F72SurqAsUMMcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C8+qr1KE8I9fzrzeVcvF9wi+qyzSozxM+ZAx/dVgkg8gDJ7rGyqpo/LK1gwYkegaY
 b9H0akge+B9CI55St/LvsLT/LCJDQ7vVveHPDtLv08VDtLi7eA5y88flcx54UtyxT7
 Gq+qaZmqfS8rm68A4Tv6FuP4XBH2x2IqwDBtDse8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200205093315eucas1p2465111564150ef49c1b208fbb1cd6cb3~wd83Ns1Wt1343613436eucas1p2z;
 Wed,  5 Feb 2020 09:33:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 6C.39.60679.ADB8A3E5; Wed,  5
 Feb 2020 09:33:14 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200205093314eucas1p23f60704a2ba3e1732c37ec76b8b3ef5a~wd824yxtk0722307223eucas1p2k;
 Wed,  5 Feb 2020 09:33:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200205093314eusmtrp1984fffd7e5dbd6d03d6e561e3caf2dd6~wd824QzLF1029010290eusmtrp1U;
 Wed,  5 Feb 2020 09:33:14 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-90-5e3a8bdac6c1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F8.9A.07950.ADB8A3E5; Wed,  5
 Feb 2020 09:33:14 +0000 (GMT)
Received: from AMDC3304.digital.local (unknown [106.120.51.21]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200205093314eusmtip2afe5c81bfd9e90e2e1f33252135b3646~wd82ovdMv3043630436eusmtip2I;
 Wed,  5 Feb 2020 09:33:14 +0000 (GMT)
From: i.kotrasinsk@partner.samsung.com
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/9] memory: Support mmap offset for fd-backed memory
 regions
Date: Wed,  5 Feb 2020 10:32:58 +0100
Message-Id: <1580895185-24341-3-git-send-email-i.kotrasinsk@partner.samsung.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580895185-24341-1-git-send-email-i.kotrasinsk@partner.samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djPc7q3uq3iDP7st7LYc+Exm8X+bf9Y
 LeacecBicbx3B4sDi8eda3vYPJ5c28zkcfDdHiaP9/uusgWwRHHZpKTmZJalFunbJXBlzOzu
 Zy+Y61Hx4FEPcwPjO/0uRk4OCQETiXUL77J3MXJxCAmsYJSYsGMaC0hCSOALo8S0Lg6IxGdG
 ie8tm5lhOp6v62ODSCxnlJj4sg+qHahj9aX9YFVsAmoSO498ZgSxRQQkJX53nQaLMwtkSDyf
 1Q1mCwuESfy/uB2shkVAVeLHpmNsIDavQIDE6Y6JjBDb5CRunusEq+cUCJTY9Okj2GYJgTNs
 EvcPHWeCKHKR+PLzARuELSzx6vgWdghbRuL05B4WCLteouXODiaI5g5Gib6V06EarCW+bFgK
 VMQBdJ2mxPpd0IBxlPj39iUjSFhCgE/ixltBiPv5JCZtm84MEeaV6GgTgqjWk+h+cpMJZuuy
 xkcsECUeEkve8kGCZwmjxLar+5gmMMrPQti1gJFxFaN4amlxbnpqsVFearlecWJucWleul5y
 fu4mRmD0n/53/MsOxl1/kg4xCnAwKvHwrphkGSfEmlhWXJl7iFGCg1lJhPe8PlCINyWxsiq1
 KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGxhnC61at2cHheO7lXFVP
 i9NtNXePf9Po0k+XzzsTLqbXsUPg3HlZEzeZeSxXHm27ZGh70on3woRFVtN3BfywPFh44+WD
 zhS+Xq3KoFxugXVHa45ya7WsPVq/RW5N5wq99MCvfzweH2C80v1vj9Ql10VVcfvPn8ue03sq
 SqzFbebxWINbze/yU5RYijMSDbWYi4oTATo+dCH6AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xe7q3uq3iDP5cVLPYc+Exm8X+bf9Y
 LeacecBicbx3B4sDi8eda3vYPJ5c28zkcfDdHiaP9/uusgWwROnZFOWXlqQqZOQXl9gqRRta
 GOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlzOzuZy+Y61Hx4FEPcwPjO/0uRk4O
 CQETiefr+ti6GLk4hASWMkrM+bmRESIhI/Hj9Bo2CFtY4s+1LqiiT4wSF6evYAdJsAmoSew8
 8hmsQURAUuJ312lmEJtZIEti5+z7TCC2sECIxIed58EGsQioSvzYdAzM5hUIkDjdMRFqmZzE
 zXOdYL2cAoESmz59BKsRAqq59vUr6wRGvgWMDKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC
 w3HbsZ9bdjB2vQs+xCjAwajEwxswwTJOiDWxrLgy9xCjBAezkgjveX2gEG9KYmVValF+fFFp
 TmrxIUZToKMmMkuJJucDYyWvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwf
 EwenVANjU9vVw3wMcU3t7kwvHoreOy2oO23nrcI1KxbUJGbckOtKquyd8rqg7GGlcUrirskz
 FawuJB2OdeNkfl27tWaj9qXa1jU9v408tkdViZ5bvS2wev5XR44ohpv7n33Ju/16Etv9I5Zx
 K47+zjna+G9qvtQX1uSSLx2mE9WjdJ9/dpzz/vxdrk3hSizFGYmGWsxFxYkASJ5MnV0CAAA=
X-CMS-MailID: 20200205093314eucas1p23f60704a2ba3e1732c37ec76b8b3ef5a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200205093314eucas1p23f60704a2ba3e1732c37ec76b8b3ef5a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200205093314eucas1p23f60704a2ba3e1732c37ec76b8b3ef5a
References: <1580895185-24341-1-git-send-email-i.kotrasinsk@partner.samsung.com>
 <CGME20200205093314eucas1p23f60704a2ba3e1732c37ec76b8b3ef5a@eucas1p2.samsung.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 210.118.77.11
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
Cc: peter.maydell@linaro.org,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>

The memexpose device will receive shared memory from another VM and map
parts of it as memory regions. For that, we need to be able to mmap the
region at an offset from shared memory's start.

Signed-off-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
---
 backends/hostmem-memfd.c  |  2 +-
 exec.c                    | 10 ++++++----
 hw/misc/ivshmem.c         |  3 ++-
 include/exec/memory.h     |  2 ++
 include/exec/ram_addr.h   |  2 +-
 include/qemu/mmap-alloc.h |  1 +
 memory.c                  |  3 ++-
 util/mmap-alloc.c         |  7 ++++---
 util/oslib-posix.c        |  2 +-
 9 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 26070b4..7cd6c53 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -56,7 +56,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
     name = host_memory_backend_get_name(backend);
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
-                                   name, backend->size,
+                                   name, backend->size, 0,
                                    backend->share, fd, errp);
     g_free(name);
 }
diff --git a/exec.c b/exec.c
index 67e520d..afcb3c9 100644
--- a/exec.c
+++ b/exec.c
@@ -1839,6 +1839,7 @@ static int file_ram_open(const char *path,
 
 static void *file_ram_alloc(RAMBlock *block,
                             ram_addr_t memory,
+                            size_t mmap_offset,
                             int fd,
                             bool truncate,
                             Error **errp)
@@ -1892,7 +1893,7 @@ static void *file_ram_alloc(RAMBlock *block,
         perror("ftruncate");
     }
 
-    area = qemu_ram_mmap(fd, memory, block->mr->align,
+    area = qemu_ram_mmap(fd, memory, mmap_offset, block->mr->align,
                          block->flags & RAM_SHARED, block->flags & RAM_PMEM);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
@@ -2314,7 +2315,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
 
 #ifdef CONFIG_POSIX
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
-                                 uint32_t ram_flags, int fd,
+                                 uint32_t ram_flags, int fd, size_t mmap_offset,
                                  Error **errp)
 {
     RAMBlock *new_block;
@@ -2360,7 +2361,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     new_block->used_length = size;
     new_block->max_length = size;
     new_block->flags = ram_flags;
-    new_block->host = file_ram_alloc(new_block, size, fd, !file_size, errp);
+    new_block->host = file_ram_alloc(new_block, size, mmap_offset, fd,
+                                     !file_size, errp);
     if (!new_block->host) {
         g_free(new_block);
         return NULL;
@@ -2390,7 +2392,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, errp);
+    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, errp);
     if (!block) {
         if (created) {
             unlink(mem_path);
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 1a0fad7..4967d4f 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -492,7 +492,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
 
     /* mmap the region and map into the BAR2 */
     memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, &local_err);
+                                   "ivshmem.bar2", size, 0, true, fd,
+                                   &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index ac09221..c5554cc 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -906,6 +906,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @owner: the object that tracks the region's reference count
  * @name: the name of the region.
  * @size: size of the region.
+ * @mmap_offset: offset at which the fd is to be mapped.
  * @share: %true if memory must be mmaped with the MAP_SHARED flag
  * @fd: the fd to mmap.
  * @errp: pointer to Error*, to store an error if it happens.
@@ -917,6 +918,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     struct Object *owner,
                                     const char *name,
                                     uint64_t size,
+                                    uint64_t mmap_offset,
                                     bool share,
                                     int fd,
                                     Error **errp);
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 5e59a3d..1e85362 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -120,7 +120,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
                                    Error **errp);
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
-                                 uint32_t ram_flags, int fd,
+                                 uint32_t ram_flags, int fd, size_t mmap_offset,
                                  Error **errp);
 
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index e786266..bd95504 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -23,6 +23,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
  */
 void *qemu_ram_mmap(int fd,
                     size_t size,
+                    size_t mmap_offset,
                     size_t align,
                     bool shared,
                     bool is_pmem);
diff --git a/memory.c b/memory.c
index e9f37e7..65dd165 100644
--- a/memory.c
+++ b/memory.c
@@ -1584,6 +1584,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     struct Object *owner,
                                     const char *name,
                                     uint64_t size,
+                                    uint64_t mmap_offset,
                                     bool share,
                                     int fd,
                                     Error **errp)
@@ -1595,7 +1596,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
                                            share ? RAM_SHARED : 0,
-                                           fd, &err);
+                                           fd, mmap_offset, &err);
     mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
     if (err) {
         mr->size = int128_zero();
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd..191db45 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -84,6 +84,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
 
 void *qemu_ram_mmap(int fd,
                     size_t size,
+                    size_t mmap_offset,
                     size_t align,
                     bool shared,
                     bool is_pmem)
@@ -127,7 +128,7 @@ void *qemu_ram_mmap(int fd,
     flags = MAP_PRIVATE | MAP_ANONYMOUS;
 #endif
 
-    guardptr = mmap(0, total, PROT_NONE, flags, guardfd, 0);
+    guardptr = mmap(0, total, PROT_NONE, flags, guardfd, mmap_offset);
 
     if (guardptr == MAP_FAILED) {
         return MAP_FAILED;
@@ -147,7 +148,7 @@ void *qemu_ram_mmap(int fd,
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
     ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-               flags | map_sync_flags, fd, 0);
+               flags | map_sync_flags, fd, mmap_offset);
 
     if (ptr == MAP_FAILED && map_sync_flags) {
         if (errno == ENOTSUP) {
@@ -172,7 +173,7 @@ void *qemu_ram_mmap(int fd,
          * we will remove these flags to handle compatibility.
          */
         ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-                   flags, fd, 0);
+                   flags, fd, mmap_offset);
     }
 
     if (ptr == MAP_FAILED) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 5a291cc..e4ffdc1 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -205,7 +205,7 @@ void *qemu_memalign(size_t alignment, size_t size)
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
 {
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, shared, false);
+    void *ptr = qemu_ram_mmap(-1, size, 0, align, shared, false);
 
     if (ptr == MAP_FAILED) {
         return NULL;
-- 
2.7.4


