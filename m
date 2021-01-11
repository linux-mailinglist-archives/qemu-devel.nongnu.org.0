Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC32F0C17
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:10:27 +0100 (CET)
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypTF-0006Lw-MP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPd-0001Ba-6w
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:41 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:52898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPZ-0005mo-Fy
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:40 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B551t0136352;
 Mon, 11 Jan 2021 05:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=LnLOzmDa5T3JMJMlHyI2N+DKckhRbqWiYe6fNdWlaZg=;
 b=BswrONi0dMpjSurQzm5CIkvKTufyn3QGpVGZPEidAqMN99RyI5ksxxKeqCEeswgLjbY2
 Prt50Ri2OA7nAFTlB3/Yx9bXSsR56Us/jcjuotpF0OlrqBE2/AnsuTow8REz6mm96p1b
 KZoW2xcxqkIifpJAcNqikwUzH8M7G1ifJZOIvEbVN6mW/iwixD2EupQtT7t6yqC5plww
 +VMSyEebWMUYPJhtgho9WAeg2Hi63TEgADckQ/RGMLBe7u8BbnuP6y+laLr/lG2Znrvv
 gUna2V3drQ//RQImm6F4JnkTxoqtVbQ6R6bXkYvkl8ST+wndfh0huGXLngtMCVS6j+oY nw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 35yknhsypy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 05:06:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B5156j191808;
 Mon, 11 Jan 2021 05:06:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 35ypcw283m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 05:06:22 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10B56L62002996;
 Mon, 11 Jan 2021 05:06:21 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 10 Jan 2021 21:06:21 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 03/20] memory: alloc RAM from file at offset
Date: Mon, 11 Jan 2021 00:05:48 -0500
Message-Id: <110f42658e1fcb5f22d0b795c7350adec42cdd5b.1610339529.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow RAM MemoryRegion to be created from an offset in a file, instead
of allocating at offset of 0 by default. This is needed to synchronize
RAM between QEMU & remote process.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/memory.h     |  2 ++
 include/exec/ram_addr.h   |  2 +-
 include/qemu/mmap-alloc.h |  4 +++-
 backends/hostmem-memfd.c  |  2 +-
 hw/misc/ivshmem.c         |  3 ++-
 softmmu/memory.c          |  3 ++-
 softmmu/physmem.c         | 11 +++++++----
 util/mmap-alloc.c         |  7 ++++---
 util/oslib-posix.c        |  2 +-
 9 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 521d990..a9d2b66 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -990,6 +990,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @size: size of the region.
  * @share: %true if memory must be mmaped with the MAP_SHARED flag
  * @fd: the fd to mmap.
+ * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
  *
  * Note that this function does not do anything to cause the data in the
@@ -1001,6 +1002,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     uint64_t size,
                                     bool share,
                                     int fd,
+                                    ram_addr_t offset,
                                     Error **errp);
 #endif
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index c6d2ef1..d465a48 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -121,7 +121,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    Error **errp);
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd,
-                                 Error **errp);
+                                 off_t offset, Error **errp);
 
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                   MemoryRegion *mr, Error **errp);
diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index e786266..b096ffb 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -16,6 +16,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
  *          otherwise, the alignment in use will be determined by QEMU.
  *  @shared: map has RAM_SHARED flag.
  *  @is_pmem: map has RAM_PMEM flag.
+ *  @map_offset: map starts at offset of map_offset from the start of fd
  *
  * Return:
  *  On success, return a pointer to the mapped area.
@@ -25,7 +26,8 @@ void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
                     bool shared,
-                    bool is_pmem);
+                    bool is_pmem,
+                    off_t map_offset);
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size);
 
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index e5626d4..69b0ae3 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -55,7 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     name = host_memory_backend_get_name(backend);
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size,
-                                   backend->share, fd, errp);
+                                   backend->share, fd, 0, errp);
     g_free(name);
 }
 
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 0505b52..603e992 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -495,7 +495,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
 
     /* mmap the region and map into the BAR2 */
     memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, &local_err);
+                                   "ivshmem.bar2", size, true, fd, 0,
+                                   &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed..fa65f45 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1609,6 +1609,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     uint64_t size,
                                     bool share,
                                     int fd,
+                                    ram_addr_t offset,
                                     Error **errp)
 {
     Error *err = NULL;
@@ -1618,7 +1619,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
                                            share ? RAM_SHARED : 0,
-                                           fd, &err);
+                                           fd, offset, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6301f4f..31afdf6 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1461,6 +1461,7 @@ static void *file_ram_alloc(RAMBlock *block,
                             ram_addr_t memory,
                             int fd,
                             bool truncate,
+                            off_t offset,
                             Error **errp)
 {
     void *area;
@@ -1511,7 +1512,8 @@ static void *file_ram_alloc(RAMBlock *block,
     }
 
     area = qemu_ram_mmap(fd, memory, block->mr->align,
-                         block->flags & RAM_SHARED, block->flags & RAM_PMEM);
+                         block->flags & RAM_SHARED, block->flags & RAM_PMEM,
+                         offset);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "unable to map backing store for guest RAM");
@@ -1943,7 +1945,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
 #ifdef CONFIG_POSIX
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd,
-                                 Error **errp)
+                                 off_t offset, Error **errp)
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
@@ -1996,7 +1998,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     new_block->used_length = size;
     new_block->max_length = size;
     new_block->flags = ram_flags;
-    new_block->host = file_ram_alloc(new_block, size, fd, !file_size, errp);
+    new_block->host = file_ram_alloc(new_block, size, fd, !file_size, offset,
+                                     errp);
     if (!new_block->host) {
         g_free(new_block);
         return NULL;
@@ -2026,7 +2029,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, errp);
+    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, errp);
     if (!block) {
         if (created) {
             unlink(mem_path);
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd..ddffa0d 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -86,7 +86,8 @@ void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
                     bool shared,
-                    bool is_pmem)
+                    bool is_pmem,
+                    off_t map_offset)
 {
     int flags;
     int map_sync_flags = 0;
@@ -147,7 +148,7 @@ void *qemu_ram_mmap(int fd,
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
     ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-               flags | map_sync_flags, fd, 0);
+               flags | map_sync_flags, fd, map_offset);
 
     if (ptr == MAP_FAILED && map_sync_flags) {
         if (errno == ENOTSUP) {
@@ -172,7 +173,7 @@ void *qemu_ram_mmap(int fd,
          * we will remove these flags to handle compatibility.
          */
         ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-                   flags, fd, 0);
+                   flags, fd, map_offset);
     }
 
     if (ptr == MAP_FAILED) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 359c52d..3041e9f 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -230,7 +230,7 @@ void *qemu_memalign(size_t alignment, size_t size)
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
 {
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, shared, false);
+    void *ptr = qemu_ram_mmap(-1, size, align, shared, false, 0);
 
     if (ptr == MAP_FAILED) {
         return NULL;
-- 
1.8.3.1


