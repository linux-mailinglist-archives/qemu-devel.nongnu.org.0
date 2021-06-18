Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6803AC8FB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:39:36 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBuS-0003Qd-1q
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1luBn7-0005lZ-N6
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:01 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:19407
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1luBn2-0004AC-Qw
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:01 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AJC7sT6zJs0wN3DgxE/ZFKrPwxL1zdoMgy1kn?=
 =?us-ascii?q?xilNoRw8SKKlfqeV7ZAmPH7P+VEssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOgg?=
 =?us-ascii?q?LBR+sO0WKI+Vzd8kPFmdK1rZ0QEZSWFueAdmRSvILr5hWiCdY8zJ2i+KCsv+3X?=
 =?us-ascii?q?yHBgVmhRGthdxjY8GgCGCVd3WQUDIZI4EaCX7s1BqyHlVm8Qaq2AdwE4dtmGt9?=
 =?us-ascii?q?vWj4jnfBJDIxYm7TOFhTSu5KW/MzXw5GZ5bw9y?=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="109833660"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Jun 2021 18:31:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id BEDC54C36A11;
 Fri, 18 Jun 2021 18:31:44 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Jun 2021 18:31:44 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 18 Jun 2021 18:31:45 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 1/2] migration/rdma: Fix out of order wrid
Date: Fri, 18 Jun 2021 18:36:11 +0800
Message-ID: <20210618103612.152817-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: BEDC54C36A11.AE2DD
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
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

NOTE: soft RoCE as the rdma device.
[root@iaas-rpma images]# rdma link show rxe_eth0/1
link rxe_eth0/1 state ACTIVE physical_state LINK_UP netdev eth0

This migration cannot be completed since out of order(OOO) CQ event occurs.
OOO cases will occur in both source side and destination side. And it
happens on only SEND and RECV are out of order. OOO between 'WRITE RDMA' and
'RECV' doesn't matter.

below the OOO sequence:
	  source                     destination
  qemu_rdma_write_one()          qemu_rdma_registration_handle()
1.	post_recv X                 post_recv Y
2.			            post_send X
3.			            wait X CQ event
4.	X CQ event
5.	post_send Y
6.	wait Y CQ event
7.			            Y CQ event (dropped)
8.	Y CQ event(send Y done)
9.			            X CQ event(send X done)
10.                                 wait Y CQ event(dropped at (7), blocks forever)

Looks it only happens on soft RoCE rdma device in my a hundred of runs,
a hardware IB device works fine.

Here we introduce a independent send completion queue to distinguish
ibv_post_send completion queue from the original mixed completion queue.
It helps us to poll the specific CQE we are really interesting in.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
V2 Introduce send completion queue
---
 migration/rdma.c | 94 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 79 insertions(+), 15 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index d90b29a4b51..16fe0688858 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -359,8 +359,10 @@ typedef struct RDMAContext {
     struct rdma_event_channel   *channel;
     struct ibv_qp *qp;                      /* queue pair */
     struct ibv_comp_channel *comp_channel;  /* completion channel */
+    struct ibv_comp_channel *send_comp_channel;  /* send completion channel */
     struct ibv_pd *pd;                      /* protection domain */
     struct ibv_cq *cq;                      /* completion queue */
+    struct ibv_cq *send_cq;                 /* send completion queue */
 
     /*
      * If a previous write failed (perhaps because of a failed
@@ -1067,8 +1069,7 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
     }
 
     /*
-     * Completion queue can be filled by both read and write work requests,
-     * so must reflect the sum of both possible queue sizes.
+     * Completion queue can be filled by read work requests.
      */
     rdma->cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
             NULL, rdma->comp_channel, 0);
@@ -1077,6 +1078,20 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
         goto err_alloc_pd_cq;
     }
 
+    /* create send completion channel */
+    rdma->send_comp_channel = ibv_create_comp_channel(rdma->verbs);
+    if (!rdma->send_comp_channel) {
+        error_report("failed to allocate completion channel");
+        goto err_alloc_pd_cq;
+    }
+
+    rdma->send_cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
+                                  NULL, rdma->send_comp_channel, 0);
+    if (!rdma->send_cq) {
+        error_report("failed to allocate completion queue");
+        goto err_alloc_pd_cq;
+    }
+
     return 0;
 
 err_alloc_pd_cq:
@@ -1086,8 +1101,16 @@ err_alloc_pd_cq:
     if (rdma->comp_channel) {
         ibv_destroy_comp_channel(rdma->comp_channel);
     }
+    if (rdma->send_comp_channel) {
+        ibv_destroy_comp_channel(rdma->send_comp_channel);
+    }
+    if (rdma->cq) {
+        ibv_destroy_cq(rdma->cq);
+        rdma->cq = NULL;
+    }
     rdma->pd = NULL;
     rdma->comp_channel = NULL;
+    rdma->send_comp_channel = NULL;
     return -1;
 
 }
@@ -1104,7 +1127,7 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
     attr.cap.max_recv_wr = 3;
     attr.cap.max_send_sge = 1;
     attr.cap.max_recv_sge = 1;
-    attr.send_cq = rdma->cq;
+    attr.send_cq = rdma->send_cq;
     attr.recv_cq = rdma->cq;
     attr.qp_type = IBV_QPT_RC;
 
@@ -1420,14 +1443,14 @@ static void qemu_rdma_signal_unregister(RDMAContext *rdma, uint64_t index,
  * (of any kind) has completed.
  * Return the work request ID that completed.
  */
-static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
-                               uint32_t *byte_len)
+static uint64_t qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
+                              uint64_t *wr_id_out, uint32_t *byte_len)
 {
     int ret;
     struct ibv_wc wc;
     uint64_t wr_id;
 
-    ret = ibv_poll_cq(rdma->cq, 1, &wc);
+    ret = ibv_poll_cq(cq, 1, &wc);
 
     if (!ret) {
         *wr_id_out = RDMA_WRID_NONE;
@@ -1499,7 +1522,8 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
 /* Wait for activity on the completion channel.
  * Returns 0 on success, none-0 on error.
  */
-static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
+static int qemu_rdma_wait_comp_channel(RDMAContext *rdma,
+                                       struct ibv_comp_channel *ch)
 {
     struct rdma_cm_event *cm_event;
     int ret = -1;
@@ -1510,7 +1534,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
      */
     if (rdma->migration_started_on_destination &&
         migration_incoming_get_current()->state == MIGRATION_STATUS_ACTIVE) {
-        yield_until_fd_readable(rdma->comp_channel->fd);
+        yield_until_fd_readable(ch->fd);
     } else {
         /* This is the source side, we're in a separate thread
          * or destination prior to migration_fd_process_incoming()
@@ -1521,7 +1545,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
          */
         while (!rdma->error_state  && !rdma->received_error) {
             GPollFD pfds[2];
-            pfds[0].fd = rdma->comp_channel->fd;
+            pfds[0].fd = ch->fd;
             pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
             pfds[0].revents = 0;
 
@@ -1579,6 +1603,17 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
     return rdma->error_state;
 }
 
+static struct ibv_comp_channel *to_channel(RDMAContext *rdma, int wrid)
+{
+    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_comp_channel :
+           rdma->comp_channel;
+}
+
+static struct ibv_cq *to_cq(RDMAContext *rdma, int wrid)
+{
+    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_cq : rdma->cq;
+}
+
 /*
  * Block until the next work request has completed.
  *
@@ -1599,13 +1634,15 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
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
@@ -1626,12 +1663,12 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
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
@@ -1645,7 +1682,7 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
         }
 
         while (wr_id != wrid_requested) {
-            ret = qemu_rdma_poll(rdma, &wr_id_in, byte_len);
+            ret = qemu_rdma_poll(rdma, poll_cq, &wr_id_in, byte_len);
             if (ret < 0) {
                 goto err_block_for_wrid;
             }
@@ -2365,10 +2402,18 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         ibv_destroy_cq(rdma->cq);
         rdma->cq = NULL;
     }
+    if (rdma->send_cq) {
+        ibv_destroy_cq(rdma->send_cq);
+        rdma->send_cq = NULL;
+    }
     if (rdma->comp_channel) {
         ibv_destroy_comp_channel(rdma->comp_channel);
         rdma->comp_channel = NULL;
     }
+    if (rdma->send_comp_channel) {
+        ibv_destroy_comp_channel(rdma->send_comp_channel);
+        rdma->send_comp_channel = NULL;
+    }
     if (rdma->pd) {
         ibv_dealloc_pd(rdma->pd);
         rdma->pd = NULL;
@@ -3041,9 +3086,13 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
     if (io_read) {
         aio_set_fd_handler(ctx, rioc->rdmain->comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
+                           false, io_read, io_write, NULL, opaque);
     } else {
         aio_set_fd_handler(ctx, rioc->rdmaout->comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
+                           false, io_read, io_write, NULL, opaque);
     }
 }
 
@@ -3256,7 +3305,22 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
      */
     while (1) {
         uint64_t wr_id, wr_id_in;
-        int ret = qemu_rdma_poll(rdma, &wr_id_in, NULL);
+        int ret = qemu_rdma_poll(rdma, rdma->cq, &wr_id_in, NULL);
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




