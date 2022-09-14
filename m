Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A380F5B8914
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:26:54 +0200 (CEST)
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSPl-0003kQ-PL
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1oYRKt-0001n2-1T
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 08:17:47 -0400
Received: from mail-m11880.qiye.163.com ([115.236.118.80]:52942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1oYRKh-0004o6-8V
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 08:17:42 -0400
Received: from localhost.localdomain (unknown
 [IPV6:240e:3b7:327b:69f0:59f1:859a:4343:98e3])
 by mail-m11880.qiye.163.com (Hmail) with ESMTPA id D4A63201B9;
 Wed, 14 Sep 2022 20:17:22 +0800 (CST)
From: Ding Hui <dinghui@sangfor.com.cn>
To: dmitry.fleytman@gmail.com,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org, georgmueller@gmx.net,
 Ding Hui <dinghui@sangfor.com.cn>
Subject: [PATCH v2] e1000e: set RX desc status with DD flag in a separate
 operation
Date: Wed, 14 Sep 2022 20:16:47 +0800
Message-Id: <20220914121647.11585-1-dinghui@sangfor.com.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0xIVkMaTUJCShpLTR5LH1UTARMWGhIXJBQOD1
 lXWRgSC1lBWUlPSx5BSBlMQUhJTBlBTUIdS0FOQh1KQUNOQhpBT0hPSEFCQx5IWVdZFhoPEhUdFF
 lBWU9LSFVKSktISkNVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBA6Lyo5Nz0ZMi4JGSsaFwMd
 ChBPCyNVSlVKTU1ISk5MQ09ISExJVTMWGhIXVR8SFRwTDhI7CBoVHB0UCVUYFBZVGBVFWVdZEgtZ
 QVlJT0seQUgZTEFISUwZQU1CHUtBTkIdSkFDTkIaQU9IT0hBQkMeSFlXWQgBWUFPSkpLNwY+
X-HM-Tid: 0a833beeb43e2eb6kusnd4a63201b9
Received-SPF: pass client-ip=115.236.118.80;
 envelope-from=dinghui@sangfor.com.cn; helo=mail-m11880.qiye.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Like commit 034d00d48581 ("e1000: set RX descriptor status in
a separate operation"), there is also same issue in e1000e, which
would cause lost packets or stop sending packets to VM with DPDK.

Do similar fix in e1000e.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/402
Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
---
 hw/net/e1000e_core.c | 53 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

---
v2: use uint8_t/uint32_t directly instead of typeof

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 208e3e0d79..a570b366b2 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1364,6 +1364,57 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
     }
 }
 
+static inline void
+e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
+                             uint8_t *desc, dma_addr_t len)
+{
+    PCIDevice *dev = core->owner;
+
+    if (e1000e_rx_use_legacy_descriptor(core)) {
+        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
+        size_t offset = offsetof(struct e1000_rx_desc, status);
+        uint8_t status = d->status;
+
+        d->status &= ~E1000_RXD_STAT_DD;
+        pci_dma_write(dev, addr, desc, len);
+
+        if (status & E1000_RXD_STAT_DD) {
+            d->status = status;
+            pci_dma_write(dev, addr + offset, &status, sizeof(status));
+        }
+    } else {
+        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
+            union e1000_rx_desc_packet_split *d =
+                (union e1000_rx_desc_packet_split *) desc;
+            size_t offset = offsetof(union e1000_rx_desc_packet_split,
+                wb.middle.status_error);
+            uint32_t status = d->wb.middle.status_error;
+
+            d->wb.middle.status_error &= ~E1000_RXD_STAT_DD;
+            pci_dma_write(dev, addr, desc, len);
+
+            if (status & E1000_RXD_STAT_DD) {
+                d->wb.middle.status_error = status;
+                pci_dma_write(dev, addr + offset, &status, sizeof(status));
+            }
+        } else {
+            union e1000_rx_desc_extended *d =
+                (union e1000_rx_desc_extended *) desc;
+            size_t offset = offsetof(union e1000_rx_desc_extended,
+                wb.upper.status_error);
+            uint32_t status = d->wb.upper.status_error;
+
+            d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
+            pci_dma_write(dev, addr, desc, len);
+
+            if (status & E1000_RXD_STAT_DD) {
+                d->wb.upper.status_error = status;
+                pci_dma_write(dev, addr + offset, &status, sizeof(status));
+            }
+        }
+    }
+}
+
 typedef struct e1000e_ba_state_st {
     uint16_t written[MAX_PS_BUFFERS];
     uint8_t cur_idx;
@@ -1600,7 +1651,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
         e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
-        pci_dma_write(d, base, &desc, core->rx_desc_len);
+        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
 
         e1000e_ring_advance(core, rxi,
                             core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
-- 
2.17.1


