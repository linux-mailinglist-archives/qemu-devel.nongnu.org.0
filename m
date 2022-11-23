Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C6636026
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 14:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxpxJ-0006R7-Lr; Wed, 23 Nov 2022 08:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxpxF-0006QN-1D
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxpxC-00011h-05
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669210696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wNmORnecLhR05PAV895FZBpDDGxTG1qVGGVcBESupak=;
 b=PSRYxkgcQe5VPOPz78+DZjrQ+85+OFrDnO4fhDHN61MjAnFKsMKcL6yEdXAA9UF22N2Lc+
 TBffbm7DCBAHCTFREWGm29COeqBGWg09K0r6NvrcoGSX0EQW2b1amwVf3oUV6pUVndDUgD
 C6hHexgcPW2Qnb2Iy4m0GSKNfI05TSk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-KD736A_BNa6VHcxRAdAcFg-1; Wed, 23 Nov 2022 08:38:15 -0500
X-MC-Unique: KD736A_BNa6VHcxRAdAcFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5046802314;
 Wed, 23 Nov 2022 13:38:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 564732166B26;
 Wed, 23 Nov 2022 13:38:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3431E21E6921; Wed, 23 Nov 2022 14:38:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2] Drop more useless casts from void * to pointer
Date: Wed, 23 Nov 2022 14:38:11 +0100
Message-Id: <20221123133811.1398562-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
v2:
* PATCH 1+2 merged as commit 0a553c12c7 and 3f7febc937
* PATCH 3 change to util/coroutine-ucontext.c dropped [Laurent]

 bsd-user/elfload.c                      | 2 +-
 contrib/plugins/cache.c                 | 8 ++++----
 contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
 hw/core/qdev-clock.c                    | 2 +-
 hw/hyperv/vmbus.c                       | 2 +-
 hw/net/cadence_gem.c                    | 2 +-
 hw/net/virtio-net.c                     | 2 +-
 hw/nvme/ctrl.c                          | 4 ++--
 hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
 hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
 hw/virtio/virtio-iommu.c                | 3 +--
 linux-user/syscall.c                    | 2 +-
 target/i386/hax/hax-all.c               | 2 +-
 tests/tcg/aarch64/system/semiheap.c     | 4 ++--
 util/vfio-helpers.c                     | 2 +-
 15 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index f8edb22f2a..fbcdc94b96 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -156,7 +156,7 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
             --p; --tmp; --len;
             if (--offset < 0) {
                 offset = p % TARGET_PAGE_SIZE;
-                pag = (char *)page[p / TARGET_PAGE_SIZE];
+                pag = page[p / TARGET_PAGE_SIZE];
                 if (!pag) {
                     pag = g_try_malloc0(TARGET_PAGE_SIZE);
                     page[p / TARGET_PAGE_SIZE] = pag;
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index ac1510aaa1..2e25184a7f 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -405,7 +405,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     g_mutex_lock(&l1_dcache_locks[cache_idx]);
     hit_in_l1 = access_cache(l1_dcaches[cache_idx], effective_addr);
     if (!hit_in_l1) {
-        insn = (InsnData *) userdata;
+        insn = userdata;
         __atomic_fetch_add(&insn->l1_dmisses, 1, __ATOMIC_SEQ_CST);
         l1_dcaches[cache_idx]->misses++;
     }
@@ -419,7 +419,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
 
     g_mutex_lock(&l2_ucache_locks[cache_idx]);
     if (!access_cache(l2_ucaches[cache_idx], effective_addr)) {
-        insn = (InsnData *) userdata;
+        insn = userdata;
         __atomic_fetch_add(&insn->l2_misses, 1, __ATOMIC_SEQ_CST);
         l2_ucaches[cache_idx]->misses++;
     }
@@ -440,7 +440,7 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
     g_mutex_lock(&l1_icache_locks[cache_idx]);
     hit_in_l1 = access_cache(l1_icaches[cache_idx], insn_addr);
     if (!hit_in_l1) {
-        insn = (InsnData *) userdata;
+        insn = userdata;
         __atomic_fetch_add(&insn->l1_imisses, 1, __ATOMIC_SEQ_CST);
         l1_icaches[cache_idx]->misses++;
     }
@@ -454,7 +454,7 @@ static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
 
     g_mutex_lock(&l2_ucache_locks[cache_idx]);
     if (!access_cache(l2_ucaches[cache_idx], insn_addr)) {
-        insn = (InsnData *) userdata;
+        insn = userdata;
         __atomic_fetch_add(&insn->l2_misses, 1, __ATOMIC_SEQ_CST);
         l2_ucaches[cache_idx]->misses++;
     }
diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index d6932a2645..aa99877fcd 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -193,7 +193,7 @@ vub_discard_write_zeroes(VubReq *req, struct iovec *iov, uint32_t iovcnt,
 
     #if defined(__linux__) && defined(BLKDISCARD) && defined(BLKZEROOUT)
     VubDev *vdev_blk = req->vdev_blk;
-    desc = (struct virtio_blk_discard_write_zeroes *)buf;
+    desc = buf;
     uint64_t range[2] = { le64toh(desc->sector) << 9,
                           le32toh(desc->num_sectors) << 9 };
     if (type == VIRTIO_BLK_T_DISCARD) {
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index 117f4c6ea4..82799577f3 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -134,7 +134,7 @@ void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)
         Clock **clkp;
         /* offset cannot be inside the DeviceState part */
         assert(elem->offset > sizeof(DeviceState));
-        clkp = (Clock **)(((void *) dev) + elem->offset);
+        clkp = ((void *)dev) + elem->offset;
         if (elem->is_output) {
             *clkp = qdev_init_clock_out(dev, elem->name);
         } else {
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 30bc04e1c4..f956381cc9 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2104,7 +2104,7 @@ static void process_message(VMBus *vmbus)
         goto out;
     }
     msgdata = hv_msg->payload;
-    msg = (struct vmbus_message_header *)msgdata;
+    msg = msgdata;
 
     trace_vmbus_process_incoming_message(msg->message_type);
 
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 24b3a0ff66..42ea2411a2 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1429,7 +1429,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
 {
     CadenceGEMState *s;
     uint32_t retval;
-    s = (CadenceGEMState *)opaque;
+    s = opaque;
 
     offset >>= 2;
     retval = s->regs[offset];
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index aba12759d5..fea6f43429 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2472,7 +2472,7 @@ static size_t virtio_net_rsc_receive6(void *opq, NetClientState *nc,
     VirtioNetRscChain *chain;
     VirtioNetRscUnit unit;
 
-    chain = (VirtioNetRscChain *)opq;
+    chain = opq;
     hdr_len = ((VirtIONet *)(chain->n))->guest_hdr_len;
 
     if (size < (hdr_len + sizeof(struct eth_header) + sizeof(struct ip6_header)
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac3885ce50..d0684da9fe 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4104,14 +4104,14 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
             nr_zones++;
         }
     }
-    header = (NvmeZoneReportHeader *)buf;
+    header = buf;
     header->nr_zones = cpu_to_le64(nr_zones);
 
     buf_p = buf + sizeof(NvmeZoneReportHeader);
     for (; zone_idx < ns->num_zones && max_zones > 0; zone_idx++) {
         zone = &ns->zone_array[zone_idx];
         if (nvme_zone_matches_filter(zrasf, zone)) {
-            z = (NvmeZoneDescr *)buf_p;
+            z = buf_p;
             buf_p += sizeof(NvmeZoneDescr);
 
             z->zt = zone->d.zt;
diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index da7ddfa548..f5b6c3d728 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -269,8 +269,7 @@ static int create_cq_ring(PCIDevice *pci_dev , PvrdmaRing **ring,
     r = g_malloc(sizeof(*r));
     *ring = r;
 
-    r->ring_state = (PvrdmaRingState *)
-        rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
+    r->ring_state = rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
 
     if (!r->ring_state) {
         rdma_error_report("Failed to map to CQ ring state");
@@ -405,8 +404,7 @@ static int create_qp_rings(PCIDevice *pci_dev, uint64_t pdir_dma,
     *rings = sr;
 
     /* Create send ring */
-    sr->ring_state = (PvrdmaRingState *)
-        rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
+    sr->ring_state = rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
     if (!sr->ring_state) {
         rdma_error_report("Failed to map to QP ring state");
         goto out_free_sr_mem;
@@ -646,8 +644,7 @@ static int create_srq_ring(PCIDevice *pci_dev, PvrdmaRing **ring,
     r = g_malloc(sizeof(*r));
     *ring = r;
 
-    r->ring_state = (PvrdmaRingState *)
-            rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
+    r->ring_state = rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
     if (!r->ring_state) {
         rdma_error_report("Failed to map tp SRQ ring state");
         goto out_free_ring_mem;
diff --git a/hw/rdma/vmw/pvrdma_qp_ops.c b/hw/rdma/vmw/pvrdma_qp_ops.c
index bd7cbf2bdf..c30c8344f6 100644
--- a/hw/rdma/vmw/pvrdma_qp_ops.c
+++ b/hw/rdma/vmw/pvrdma_qp_ops.c
@@ -149,7 +149,7 @@ void pvrdma_qp_send(PVRDMADev *dev, uint32_t qp_handle)
 
     ring = (PvrdmaRing *)qp->opaque;
 
-    wqe = (struct PvrdmaSqWqe *)pvrdma_ring_next_elem_read(ring);
+    wqe = pvrdma_ring_next_elem_read(ring);
     while (wqe) {
         CompHandlerCtx *comp_ctx;
 
@@ -212,7 +212,7 @@ void pvrdma_qp_recv(PVRDMADev *dev, uint32_t qp_handle)
 
     ring = &((PvrdmaRing *)qp->opaque)[1];
 
-    wqe = (struct PvrdmaRqWqe *)pvrdma_ring_next_elem_read(ring);
+    wqe = pvrdma_ring_next_elem_read(ring);
     while (wqe) {
         CompHandlerCtx *comp_ctx;
 
@@ -254,7 +254,7 @@ void pvrdma_srq_recv(PVRDMADev *dev, uint32_t srq_handle)
 
     ring = (PvrdmaRing *)srq->opaque;
 
-    wqe = (struct PvrdmaRqWqe *)pvrdma_ring_next_elem_read(ring);
+    wqe = pvrdma_ring_next_elem_read(ring);
     while (wqe) {
         CompHandlerCtx *comp_ctx;
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 62e07ec2e4..23c470977e 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -775,8 +775,7 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
             output_size = s->config.probe_size + sizeof(tail);
             buf = g_malloc0(output_size);
 
-            ptail = (struct virtio_iommu_req_tail *)
-                        (buf + s->config.probe_size);
+            ptail = buf + s->config.probe_size;
             ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
             break;
         }
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24b25759be..1f8c10f8ef 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5471,7 +5471,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
     for (i = 0; i < se->nb_fields; i++) {
         if (dst_offsets[i] == offsetof(struct rtentry, rt_dev)) {
             assert(*field_types == TYPE_PTRVOID);
-            target_rt_dev_ptr = (abi_ulong *)(argptr + src_offsets[i]);
+            target_rt_dev_ptr = argptr + src_offsets[i];
             host_rt_dev_ptr = (unsigned long *)(buf_temp + dst_offsets[i]);
             if (*target_rt_dev_ptr != 0) {
                 *host_rt_dev_ptr = (unsigned long)lock_user_string(
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index b185ee8de4..b7fb5385b2 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -388,7 +388,7 @@ static int hax_handle_io(CPUArchState *env, uint32_t df, uint16_t port,
     MemTxAttrs attrs = { 0 };
 
     if (!df) {
-        ptr = (uint8_t *) buffer;
+        ptr = buffer;
     } else {
         ptr = buffer + size * count - size;
     }
diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/system/semiheap.c
index a254bd8982..693a1b037d 100644
--- a/tests/tcg/aarch64/system/semiheap.c
+++ b/tests/tcg/aarch64/system/semiheap.c
@@ -73,11 +73,11 @@ int main(int argc, char *argv[argc])
     ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
 
     /* finally can we read/write the heap */
-    ptr_to_heap = (uint32_t *) info.heap_base;
+    ptr_to_heap = info.heap_base;
     for (i = 0; i < 512; i++) {
         *ptr_to_heap++ = i;
     }
-    ptr_to_heap = (uint32_t *) info.heap_base;
+    ptr_to_heap = info.heap_base;
     for (i = 0; i < 512; i++) {
         uint32_t tmp = *ptr_to_heap;
         if (tmp != i) {
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 0d1520caac..7a84b1d806 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -271,7 +271,7 @@ static void collect_usable_iova_ranges(QEMUVFIOState *s, void *buf)
         if (!cap->next) {
             return;
         }
-        cap = (struct vfio_info_cap_header *)(buf + cap->next);
+        cap = buf + cap->next;
     }
 
     cap_iova_range = (struct vfio_iommu_type1_info_cap_iova_range *)cap;
-- 
2.37.3


