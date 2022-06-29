Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6755FC63
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:50:50 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ULQ-0003Fl-Vx
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1o6UCI-0000bq-Nt
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:41:27 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:61552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1o6UCA-0003XP-Dp
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:41:17 -0400
Received: from localhost.localdomain (unknown
 [IPV6:240e:3b7:327f:42d0:f5c8:c03c:a916:7078])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 04099980438;
 Wed, 29 Jun 2022 17:41:01 +0800 (CST)
From: Ding Hui <dinghui@sangfor.com.cn>
To: jasowang@redhat.com,
	asm@asm.pp.ru
Cc: qemu-devel@nongnu.org, zhangjing@sangfor.com.cn, lifan38153@sangfor.com.cn,
 Ding Hui <dinghui@sangfor.com.cn>, Stefan Hajnoczi <stefanha@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org
Subject: [PATCH] e1000: set RX descriptor status in a separate operation
Date: Wed, 29 Jun 2022 17:40:26 +0800
Message-Id: <20220629094026.558-1-dinghui@sangfor.com.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTU1NVkwZS0NLGkpKTkpCS1UTARMWGhIXJBQOD1
 lXWRgSC1lBWUlPSx5BSBlMQUhJTB1BT0kfS0EdThhDQRhLSBhBGkJKTUFMS0xDWVdZFhoPEhUdFF
 lBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSI6Qio6Kj03AjVNATIvCR80
 DS4KCixVSlVKTU5NT0JOTU1JTExJVTMWGhIXVR8SFRwTDhI7CBoVHB0UCVUYFBZVGBVFWVdZEgtZ
 QVlJT0seQUgZTEFISUwdQU9JH0tBHU4YQ0EYS0gYQRpCSk1BTEtMQ1lXWQgBWUFPSE9INwY+
X-HM-Tid: 0a81aed5e4e5d992kuws04099980438
Received-SPF: pass client-ip=59.111.176.37;
 envelope-from=dinghui@sangfor.com.cn; helo=mail-m17637.qiye.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The code of setting RX descriptor status field maybe work fine in
previously, however with the update of glibc version, it shows two
issues when guest using dpdk receive packets:

  1. The dpdk has a certain probability getting wrong buffer_addr

     this impact may be not obvious, such as lost a packet once in
     a while

  2. The dpdk may consume a packet twice when scan the RX desc queue
     over again

     this impact will lead a infinite wait in Qemu, since the RDT
     (tail pointer) be inscreased to equal to RDH by unexpected,
     which regard as the RX desc queue is full

Write a whole of RX desc with DD flag on is not quite correct, because
when the underlying implementation of memcpy using XMM registers to
copy e1000_rx_desc (when AVX or something else CPU feature is usable),
the bytes order of desc writing to memory is indeterminacy

We can use full-scale test case to reproduce the issue-2 by
https://github.com/BASM/qemu_dpdk_e1000_test (thanks to Leonid Myravjev)

I also write a POC test case at https://github.com/cdkey/e1000_poc
which can reproduce both of them, and easy to verify the patch effect.

The hw watchpoint also shows that, when Qemu using XMM related instructions
writing 16 bytes e1000_rx_desc, concurrent with DPDK using movb
writing 1 byte status, the final result of writing to memory will be one
of them, if it made by Qemu which DD flag is on, DPDK will consume it
again.

Setting DD status in a separate operation, can prevent the impact of
disorder memory writing by memcpy, also avoid unexpected data when
concurrent writing status by qemu and guest dpdk.

Links: https://lore.kernel.org/qemu-devel/20200102110504.GG121208@stefanha-x1.localdomain/T/

Reported-by: Leonid Myravjev <asm@asm.pp.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-stable@nongnu.org
Tested-by: Jing Zhang <zhangjing@sangfor.com.cn>
Reviewed-by: Frank Lee <lifan38153@sangfor.com.cn>
Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
---
 hw/net/e1000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index f5bc81296d..e26e0a64c1 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -979,7 +979,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         base = rx_desc_base(s) + sizeof(desc) * s->mac_reg[RDH];
         pci_dma_read(d, base, &desc, sizeof(desc));
         desc.special = vlan_special;
-        desc.status |= (vlan_status | E1000_RXD_STAT_DD);
+        desc.status &= ~E1000_RXD_STAT_DD;
         if (desc.buffer_addr) {
             if (desc_offset < size) {
                 size_t iov_copy;
@@ -1013,6 +1013,9 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
             DBGOUT(RX, "Null RX descriptor!!\n");
         }
         pci_dma_write(d, base, &desc, sizeof(desc));
+        desc.status |= (vlan_status | E1000_RXD_STAT_DD);
+        pci_dma_write(d, base + offsetof(struct e1000_rx_desc, status),
+                      &desc.status, sizeof(desc.status));
 
         if (++s->mac_reg[RDH] * sizeof(desc) >= s->mac_reg[RDLEN])
             s->mac_reg[RDH] = 0;
-- 
2.17.1


