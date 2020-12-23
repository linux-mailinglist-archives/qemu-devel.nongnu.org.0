Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF462E18FF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:36:47 +0100 (CET)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxlO-00087W-EZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1krxSj-0007J4-Ku
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:17:33 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1krxSg-0006tl-0U
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:17:29 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BN6A6lG094413;
 Wed, 23 Dec 2020 06:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=ONlW5mKiaBlNnYIw4pW7Ix+VlxdnVg6WmCbAhlQbLB0=;
 b=KiAV3CKPf/DpJOew1gu3VV7ayb9wYJWF81HZ48iIhb/r+vpLxxcANWB7IBihL1Vd0f/2
 kJvTU9J3UzPi5MY+yoW07QcPDCtpV1KFVgx+1Wduy5HpHWYEgcWXdSc5K4wxzEmuFWh1
 1Y5vpK4KXy6KFQeRrg+DT6hZitwYvp58DQJBXROD0HuYdo470USnBmebJSEaBXHk27ZL
 Dh7U+3x10Cp/oWApPrVuv+7otVmyx2NVc5g65Te9Ygdxomv/ObIgMONuXklR/LUGsx95
 /arHgQatYMW8wHjd1+E4PyTgctFqOFRm30vE4xzNXM8zPc6nkIBemHqNvU+dW4/sAYFb bw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35k0cw6fcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Dec 2020 06:17:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BN6EcCh161113;
 Wed, 23 Dec 2020 06:15:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35k0eu21gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Dec 2020 06:15:17 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BN6FFf1002980;
 Wed, 23 Dec 2020 06:15:16 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Dec 2020 22:15:15 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v15 03/20] memory: alloc RAM from file at offset
Date: Tue, 22 Dec 2020 22:14:38 -0800
Message-Id: <ece5d4f658fe8ab61ea0a395aa488382d4c0071d.1608702853.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608702853.git.elena.ufimtseva@oracle.com>
References: <cover.1608702853.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012230047
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012230046
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Jagannathan Raman <jag.raman@oracle.com>

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
index 521d9901d7..a9d2b669e8 100644
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
index c6d2ef1d07..d465a483c6 100644
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
index e786266b92..b096ffb7e9 100644
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
index e5626d4330..69b0ae30bb 100644
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
index e321e5cb69..8d3e1eedbd 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -494,7 +494,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
 
     /* mmap the region and map into the BAR2 */
     memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, &local_err);
+                                   "ivshmem.bar2", size, true, fd, 0,
+                                   &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed7b0..fa65f45532 100644
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
index 2cd1de4a2c..4206dec857 100644
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
index 27dcccd8ec..ddffa0db4e 100644
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
index f15234b5c0..93874dfc9b 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -227,7 +227,7 @@ void *qemu_memalign(size_t alignment, size_t size)
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
 {
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, shared, false);
+    void *ptr = qemu_ram_mmap(-1, size, align, shared, false, 0);
 
     if (ptr == MAP_FAILED) {
         return NULL;
-- 
2.25.GIT


