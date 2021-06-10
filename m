Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB53A2794
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:00:43 +0200 (CEST)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGYL-0008Vk-Rs
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lrGWs-0007nk-TN
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:59:10 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:28528
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1lrGWq-0000r3-3o
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:59:10 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AzFH6F6wsGkT3l7joIxRqKrPwxL1zdoMgy1kn?=
 =?us-ascii?q?xilNoRw8SKKlfqeV7ZAmPH7P+VEssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOgg?=
 =?us-ascii?q?LBR+sO0WKI+Vzd8kPFmdK1rZ0QEZSWFueAdmRSvILr5hWiCdY8zJ2i+KCsv+3X?=
 =?us-ascii?q?yHBgVmhRGthdxjY8GgCGCVd3WQUDIZI4EaCX7s1BqyHlVm8Qaq2AdwE4dtmGt9?=
 =?us-ascii?q?vWj4jnfBJDIxYm7TOFhTSu5KW/MzXw5GZ5bw9y?=
X-IronPort-AV: E=Sophos;i="5.83,263,1616428800"; d="scan'208";a="109455003"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2021 16:59:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3637D4C36A11;
 Thu, 10 Jun 2021 16:58:57 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 10 Jun 2021 16:58:57 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 10 Jun 2021 16:58:58 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [RFC PATCH] migration/rdma: Fix out of order wrid
Date: Thu, 10 Jun 2021 16:58:31 +0800
Message-ID: <20210610085831.19779-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 3637D4C36A11.AB0E7
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
a hardward IB device works fine.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
This is just a draft to address this problem. One possible approach
could be creating their independent CQ for both SEND and RECV, it can
help us to poll the CQ we are really insterested in. But it could be a
big changes.
---
 migration/rdma.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index b703bf1b918..7a2b0a8853e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -364,6 +364,8 @@ typedef struct RDMAContext {
     struct ibv_comp_channel *comp_channel;  /* completion channel */
     struct ibv_pd *pd;                      /* protection domain */
     struct ibv_cq *cq;                      /* completion queue */
+    int64_t ooo_wrid;
+    int64_t ooo_wrid_byte_len;
 
     /*
      * If a previous write failed (perhaps because of a failed
@@ -1612,11 +1614,32 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
         wr_id = wr_id_in & RDMA_WRID_TYPE_MASK;
 
         if (wr_id == RDMA_WRID_NONE) {
+            if (rdma->ooo_wrid >= RDMA_WRID_SEND_CONTROL && rdma->ooo_wrid == wrid_requested) {
+                error_report("get expected ooo wrid %d", wrid_requested);
+                if (byte_len && rdma->ooo_wrid_byte_len != -1) {
+                    *byte_len = rdma->ooo_wrid_byte_len;
+                    rdma->ooo_wrid = RDMA_WRID_NONE;
+                    return 0;
+                }
+            }
             break;
         }
         if (wr_id != wrid_requested) {
             trace_qemu_rdma_block_for_wrid_miss(print_wrid(wrid_requested),
                        wrid_requested, print_wrid(wr_id), wr_id);
+            if (wr_id >= RDMA_WRID_SEND_CONTROL) {
+                if (rdma->ooo_wrid > RDMA_WRID_NONE) {
+                    error_report("more than one out of order wird(%ld, %ld)", rdma->ooo_wrid, wr_id);
+                    return -1;
+                }
+                error_report("get out of order wird(%ld)\n", wr_id);
+                rdma->ooo_wrid = wr_id;
+                if (byte_len) {
+                    rdma->ooo_wrid_byte_len = *byte_len;
+                } else {
+                    rdma->ooo_wrid_byte_len = -1;
+                }
+            }
         }
     }
 
-- 
2.28.0




