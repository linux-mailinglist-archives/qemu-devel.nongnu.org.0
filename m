Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFF43F4DA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 04:12:05 +0200 (CEST)
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgHND-0004Ph-Rf
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 22:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mgHLM-0003Zy-JN
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:10:09 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:57510
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mgHLH-0000Oh-18
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:10:08 -0400
IronPort-Data: =?us-ascii?q?A9a23=3AN4P+560p3jo4pqKWAvbD5elzkn2cJEfYwER7XOP?=
 =?us-ascii?q?LsXnJhTh01mdSyTEYX2HQOKvfZWqgf4t3YdzloUoPu5LXmNA2QQE+nZ1PZygU8?=
 =?us-ascii?q?JKaX7x1DatR0xu6d5SFFAQ+hyknQoGowPscEzmM+X9BDpC79SMljPnSFuKnYAL?=
 =?us-ascii?q?5EnsZqTFMGX5JZS1Ly7ZRbr5A2bBVMivV0T/Ai5S31GyNh1aYBlkpB5er83uDi?=
 =?us-ascii?q?hhdVAQw5TTSbdgT1LPXeuJ84Jg3fcldJFOgKmVY83LTegrN8F251juxExYFAdX?=
 =?us-ascii?q?jnKv5c1ERX/jZOg3mZnh+AvDk20Yd4HdplPtT2Pk0MC+7jx2NnsJxyddMvJqYR?=
 =?us-ascii?q?xorP7HXhaIWVBww/yRWZPQYpeGYfCjj2SCU5wicG5f2+N13AUQreIEV5OtzKWd?=
 =?us-ascii?q?J8/MeNXYKdB/rr+65wbaxR/Nwrt4uIMniIMUUvXQI5SjEDPA6TJTKa7/H6d9Rw?=
 =?us-ascii?q?HE7gcUmIBp0T6L1chI2NFKZPUIJYQxRVfoDcC6TriGXW1VlRJi9/8LbO1Tu8TE?=
 =?us-ascii?q?=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A/yRFMqHzINLWCHH2pLqEjceALOsnbusQ8zAX?=
 =?us-ascii?q?PiFKKSC9Hfb0qynDpp4mPHzP6Qr5OktOpTnoAsDpKk80naQFgrX5Vo3PYOCJgg?=
 =?us-ascii?q?WVEL0=3D?=
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="116567584"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Oct 2021 10:09:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 0085F4D0D9D7;
 Fri, 29 Oct 2021 10:09:56 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 29 Oct 2021 10:09:50 +0800
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 29 Oct 2021 10:09:50 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Fri, 29 Oct 2021 10:09:48 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH v4] migration/rdma: Fix out of order wrid
Date: Fri, 29 Oct 2021 10:14:47 +0800
Message-ID: <20211029021447.2430231-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 0085F4D0D9D7.AF0C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

destination:
../qemu/build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server-migration.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5902,disable-ticketing -incoming rdma:192.168.22.23:8888
qemu-system-x86_64: -spice streaming-video=filter,port=5902,disable-ticketing: warning: short-form boolean option 'disable-ticketing' deprecated
Please use disable-ticketing=on instead
QEMU 6.0.50 monitor - type 'help' for more information
(qemu) trace-event qemu_rdma_block_for_wrid_miss on
(qemu) dest_init RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
qemu_rdma_block_for_wrid_miss A Wanted wrid CONTROL SEND (2000) but got CONTROL RECV (4000)

source:
../qemu/build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5901,disable-ticketing -S
qemu-system-x86_64: -spice streaming-video=filter,port=5901,disable-ticketing: warning: short-form boolean option 'disable-ticketing' deprecated
Please use disable-ticketing=on instead
QEMU 6.0.50 monitor - type 'help' for more information
(qemu)
(qemu) trace-event qemu_rdma_block_for_wrid_miss on
(qemu) migrate -d rdma:192.168.22.23:8888
source_resolve_host RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
(qemu) qemu_rdma_block_for_wrid_miss A Wanted wrid WRITE RDMA (1) but got CONTROL RECV (4000)

NOTE: we use soft RoCE as the rdma device.
[root@iaas-rpma images]# rdma link show rxe_eth0/1
link rxe_eth0/1 state ACTIVE physical_state LINK_UP netdev eth0

This migration could not be completed when out of order(OOO) CQ event occurs.
The send queue and receive queue shared a same completion queue, and
qemu_rdma_block_for_wrid() will drop the CQs it's not interested in. But
the dropped CQs by qemu_rdma_block_for_wrid() could be later CQs it wants.
So in this case, qemu_rdma_block_for_wrid() will block forever.

OOO cases will occur in both source side and destination side. And a
forever blocking happens on only SEND and RECV are out of order. OOO between
'WRITE RDMA' and 'RECV' doesn't matter.

below the OOO sequence:
       source                             destination
      rdma_write_one()                   qemu_rdma_registration_handle()
1.    S1: post_recv X                    D1: post_recv Y
2.    wait for recv CQ event X
3.                                       D2: post_send X     ---------------+
4.                                       wait for send CQ send event X (D2) |
5.    recv CQ event X reaches (D2)                                          |
6.  +-S2: post_send Y                                                       |
7.  | wait for send CQ event Y                                              |
8.  |                                    recv CQ event Y (S2) (drop it)     |
9.  +-send CQ event Y reaches (S2)                                          |
10.                                      send CQ event X reaches (D2)  -----+
11.                                      wait recv CQ event Y (dropped by (8))

Although a hardware IB works fine in my a hundred of runs, the IB specification
doesn't guaratee the CQ order in such case.

Here we introduce a independent send completion queue to distinguish
ibv_post_send completion queue from the original mixed completion queue.
It helps us to poll the specific CQE we are really interested in.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
V4: amend log messages # Dave
V3: rebase code, and combine 2/2 to 1/2
V2: Introduce send completion queue
---
 migration/rdma.c | 138 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 101 insertions(+), 37 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 2a3c7889b9f..f5d3bbe7e9c 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -358,9 +358,11 @@ typedef struct RDMAContext {
     struct ibv_context          *verbs;
     struct rdma_event_channel   *channel;
     struct ibv_qp *qp;                      /* queue pair */
-    struct ibv_comp_channel *comp_channel;  /* completion channel */
+    struct ibv_comp_channel *recv_comp_channel;  /* recv completion channel */
+    struct ibv_comp_channel *send_comp_channel;  /* send completion channel */
     struct ibv_pd *pd;                      /* protection domain */
-    struct ibv_cq *cq;                      /* completion queue */
+    struct ibv_cq *recv_cq;                 /* recvieve completion queue */
+    struct ibv_cq *send_cq;                 /* send completion queue */
 
     /*
      * If a previous write failed (perhaps because of a failed
@@ -1059,21 +1061,34 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
         return -1;
     }
 
-    /* create completion channel */
-    rdma->comp_channel = ibv_create_comp_channel(rdma->verbs);
-    if (!rdma->comp_channel) {
-        error_report("failed to allocate completion channel");
+    /* create receive completion channel */
+    rdma->recv_comp_channel = ibv_create_comp_channel(rdma->verbs);
+    if (!rdma->recv_comp_channel) {
+        error_report("failed to allocate receive completion channel");
         goto err_alloc_pd_cq;
     }
 
     /*
-     * Completion queue can be filled by both read and write work requests,
-     * so must reflect the sum of both possible queue sizes.
+     * Completion queue can be filled by read work requests.
      */
-    rdma->cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
-            NULL, rdma->comp_channel, 0);
-    if (!rdma->cq) {
-        error_report("failed to allocate completion queue");
+    rdma->recv_cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
+                                  NULL, rdma->recv_comp_channel, 0);
+    if (!rdma->recv_cq) {
+        error_report("failed to allocate receive completion queue");
+        goto err_alloc_pd_cq;
+    }
+
+    /* create send completion channel */
+    rdma->send_comp_channel = ibv_create_comp_channel(rdma->verbs);
+    if (!rdma->send_comp_channel) {
+        error_report("failed to allocate send completion channel");
+        goto err_alloc_pd_cq;
+    }
+
+    rdma->send_cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
+                                  NULL, rdma->send_comp_channel, 0);
+    if (!rdma->send_cq) {
+        error_report("failed to allocate send completion queue");
         goto err_alloc_pd_cq;
     }
 
@@ -1083,11 +1098,19 @@ err_alloc_pd_cq:
     if (rdma->pd) {
         ibv_dealloc_pd(rdma->pd);
     }
-    if (rdma->comp_channel) {
-        ibv_destroy_comp_channel(rdma->comp_channel);
+    if (rdma->recv_comp_channel) {
+        ibv_destroy_comp_channel(rdma->recv_comp_channel);
+    }
+    if (rdma->send_comp_channel) {
+        ibv_destroy_comp_channel(rdma->send_comp_channel);
+    }
+    if (rdma->recv_cq) {
+        ibv_destroy_cq(rdma->recv_cq);
+        rdma->recv_cq = NULL;
     }
     rdma->pd = NULL;
-    rdma->comp_channel = NULL;
+    rdma->recv_comp_channel = NULL;
+    rdma->send_comp_channel = NULL;
     return -1;
 
 }
@@ -1104,8 +1127,8 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
     attr.cap.max_recv_wr = 3;
     attr.cap.max_send_sge = 1;
     attr.cap.max_recv_sge = 1;
-    attr.send_cq = rdma->cq;
-    attr.recv_cq = rdma->cq;
+    attr.send_cq = rdma->send_cq;
+    attr.recv_cq = rdma->recv_cq;
     attr.qp_type = IBV_QPT_RC;
 
     ret = rdma_create_qp(rdma->cm_id, rdma->pd, &attr);
@@ -1496,14 +1519,14 @@ static void qemu_rdma_signal_unregister(RDMAContext *rdma, uint64_t index,
  * (of any kind) has completed.
  * Return the work request ID that completed.
  */
-static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
-                               uint32_t *byte_len)
+static uint64_t qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
+                               uint64_t *wr_id_out, uint32_t *byte_len)
 {
     int ret;
     struct ibv_wc wc;
     uint64_t wr_id;
 
-    ret = ibv_poll_cq(rdma->cq, 1, &wc);
+    ret = ibv_poll_cq(cq, 1, &wc);
 
     if (!ret) {
         *wr_id_out = RDMA_WRID_NONE;
@@ -1575,7 +1598,8 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
 /* Wait for activity on the completion channel.
  * Returns 0 on success, none-0 on error.
  */
-static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
+static int qemu_rdma_wait_comp_channel(RDMAContext *rdma,
+                                       struct ibv_comp_channel *comp_channel)
 {
     struct rdma_cm_event *cm_event;
     int ret = -1;
@@ -1586,7 +1610,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
      */
     if (rdma->migration_started_on_destination &&
         migration_incoming_get_current()->state == MIGRATION_STATUS_ACTIVE) {
-        yield_until_fd_readable(rdma->comp_channel->fd);
+        yield_until_fd_readable(comp_channel->fd);
     } else {
         /* This is the source side, we're in a separate thread
          * or destination prior to migration_fd_process_incoming()
@@ -1597,7 +1621,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
          */
         while (!rdma->error_state  && !rdma->received_error) {
             GPollFD pfds[2];
-            pfds[0].fd = rdma->comp_channel->fd;
+            pfds[0].fd = comp_channel->fd;
             pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
             pfds[0].revents = 0;
 
@@ -1655,6 +1679,17 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
     return rdma->error_state;
 }
 
+static struct ibv_comp_channel *to_channel(RDMAContext *rdma, int wrid)
+{
+    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_comp_channel :
+           rdma->recv_comp_channel;
+}
+
+static struct ibv_cq *to_cq(RDMAContext *rdma, int wrid)
+{
+    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_cq : rdma->recv_cq;
+}
+
 /*
  * Block until the next work request has completed.
  *
@@ -1675,13 +1710,15 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
     struct ibv_cq *cq;
     void *cq_ctx;
     uint64_t wr_id = RDMA_WRID_NONE, wr_id_in;
+    struct ibv_comp_channel *ch = to_channel(rdma, wrid_requested);
+    struct ibv_cq *poll_cq = to_cq(rdma, wrid_requested);
 
-    if (ibv_req_notify_cq(rdma->cq, 0)) {
+    if (ibv_req_notify_cq(poll_cq, 0)) {
         return -1;
     }
     /* poll cq first */
     while (wr_id != wrid_requested) {
-        ret = qemu_rdma_poll(rdma, &wr_id_in, byte_len);
+        ret = qemu_rdma_poll(rdma, poll_cq, &wr_id_in, byte_len);
         if (ret < 0) {
             return ret;
         }
@@ -1702,12 +1739,12 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
     }
 
     while (1) {
-        ret = qemu_rdma_wait_comp_channel(rdma);
+        ret = qemu_rdma_wait_comp_channel(rdma, ch);
         if (ret) {
             goto err_block_for_wrid;
         }
 
-        ret = ibv_get_cq_event(rdma->comp_channel, &cq, &cq_ctx);
+        ret = ibv_get_cq_event(ch, &cq, &cq_ctx);
         if (ret) {
             perror("ibv_get_cq_event");
             goto err_block_for_wrid;
@@ -1721,7 +1758,7 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
         }
 
         while (wr_id != wrid_requested) {
-            ret = qemu_rdma_poll(rdma, &wr_id_in, byte_len);
+            ret = qemu_rdma_poll(rdma, poll_cq, &wr_id_in, byte_len);
             if (ret < 0) {
                 goto err_block_for_wrid;
             }
@@ -2437,13 +2474,21 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma_destroy_qp(rdma->cm_id);
         rdma->qp = NULL;
     }
-    if (rdma->cq) {
-        ibv_destroy_cq(rdma->cq);
-        rdma->cq = NULL;
+    if (rdma->recv_cq) {
+        ibv_destroy_cq(rdma->recv_cq);
+        rdma->recv_cq = NULL;
+    }
+    if (rdma->send_cq) {
+        ibv_destroy_cq(rdma->send_cq);
+        rdma->send_cq = NULL;
+    }
+    if (rdma->recv_comp_channel) {
+        ibv_destroy_comp_channel(rdma->recv_comp_channel);
+        rdma->recv_comp_channel = NULL;
     }
-    if (rdma->comp_channel) {
-        ibv_destroy_comp_channel(rdma->comp_channel);
-        rdma->comp_channel = NULL;
+    if (rdma->send_comp_channel) {
+        ibv_destroy_comp_channel(rdma->send_comp_channel);
+        rdma->send_comp_channel = NULL;
     }
     if (rdma->pd) {
         ibv_dealloc_pd(rdma->pd);
@@ -3115,10 +3160,14 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
     if (io_read) {
-        aio_set_fd_handler(ctx, rioc->rdmain->comp_channel->fd,
+        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
+                           false, io_read, io_write, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
     } else {
-        aio_set_fd_handler(ctx, rioc->rdmaout->comp_channel->fd,
+        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
+                           false, io_read, io_write, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
     }
 }
@@ -3332,7 +3381,22 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
      */
     while (1) {
         uint64_t wr_id, wr_id_in;
-        int ret = qemu_rdma_poll(rdma, &wr_id_in, NULL);
+        int ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
+        if (ret < 0) {
+            error_report("rdma migration: polling error! %d", ret);
+            goto err;
+        }
+
+        wr_id = wr_id_in & RDMA_WRID_TYPE_MASK;
+
+        if (wr_id == RDMA_WRID_NONE) {
+            break;
+        }
+    }
+
+    while (1) {
+        uint64_t wr_id, wr_id_in;
+        int ret = qemu_rdma_poll(rdma, rdma->send_cq, &wr_id_in, NULL);
         if (ret < 0) {
             error_report("rdma migration: polling error! %d", ret);
             goto err;
-- 
2.31.1




