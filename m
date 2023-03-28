Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299296CB5F3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:22:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph1kJ-0005Ul-14; Tue, 28 Mar 2023 01:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1k6-0005T6-JY
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1k3-0007Kg-CW
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679980770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02jQsYs1HGVMFwbgcvMu3frhS9WzUWnDJGnakPgYwG0=;
 b=Whra7A3vgeqKvDStaEv10P4QG2157lmufBSifLtsmG81r5Bgj2KxHxsZoIVNeYKgDO80tk
 AIJEqwwprneOOV0JK4NzPseSALFSKGah5gWBGRqgVXJeojhYfnTNpTP6YjK5fT8vOtw8YH
 D8TGze+6ktQPjdnzMmf6Y6DIcOuim54=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-olC1a7cHOhiw7q1Nfd2cUQ-1; Tue, 28 Mar 2023 01:19:28 -0400
X-MC-Unique: olC1a7cHOhiw7q1Nfd2cUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94EB1886461;
 Tue, 28 Mar 2023 05:19:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-204.pek2.redhat.com
 [10.72.13.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE0612027040;
 Tue, 28 Mar 2023 05:19:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 02/12] igb: Fix DMA requester specification for Tx packet
Date: Tue, 28 Mar 2023 13:19:07 +0800
Message-Id: <20230328051917.18006-3-jasowang@redhat.com>
In-Reply-To: <20230328051917.18006-1-jasowang@redhat.com>
References: <20230328051917.18006-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

igb used to specify the PF as DMA requester when reading Tx packets.
This made Tx requests from VFs to be performed on the address space of
the PF, defeating the purpose of SR-IOV. Add some logic to change the
requester depending on the queue, which can be assigned to a VF.

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c |  6 +++---
 hw/net/igb_core.c    | 13 ++++++++-----
 hw/net/net_tx_pkt.c  |  3 ++-
 hw/net/net_tx_pkt.h  |  3 ++-
 hw/net/vmxnet3.c     |  4 ++--
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 4d9679c..c0c09b6 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -765,7 +765,7 @@ e1000e_process_tx_desc(E1000ECore *core,
         }
 
         tx->skip_cp = false;
-        net_tx_pkt_reset(tx->tx_pkt);
+        net_tx_pkt_reset(tx->tx_pkt, core->owner);
 
         tx->sum_needed = 0;
         tx->cptse = 0;
@@ -3447,7 +3447,7 @@ e1000e_core_pci_uninit(E1000ECore *core)
     qemu_del_vm_change_state_handler(core->vmstate);
 
     for (i = 0; i < E1000E_NUM_QUEUES; i++) {
-        net_tx_pkt_reset(core->tx[i].tx_pkt);
+        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
         net_tx_pkt_uninit(core->tx[i].tx_pkt);
     }
 
@@ -3572,7 +3572,7 @@ static void e1000e_reset(E1000ECore *core, bool sw)
     e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
 
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
-        net_tx_pkt_reset(core->tx[i].tx_pkt);
+        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
         memset(&core->tx[i].props, 0, sizeof(core->tx[i].props));
         core->tx[i].skip_cp = false;
     }
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 7708333..78d3073 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -523,6 +523,7 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
 
 static void
 igb_process_tx_desc(IGBCore *core,
+                    PCIDevice *dev,
                     struct igb_tx *tx,
                     union e1000_adv_tx_desc *tx_desc,
                     int queue_index)
@@ -588,7 +589,7 @@ igb_process_tx_desc(IGBCore *core,
 
         tx->first = true;
         tx->skip_cp = false;
-        net_tx_pkt_reset(tx->tx_pkt);
+        net_tx_pkt_reset(tx->tx_pkt, dev);
     }
 }
 
@@ -803,6 +804,8 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
         d = core->owner;
     }
 
+    net_tx_pkt_reset(txr->tx->tx_pkt, d);
+
     while (!igb_ring_empty(core, txi)) {
         base = igb_ring_head_descr(core, txi);
 
@@ -811,7 +814,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
         trace_e1000e_tx_descr((void *)(intptr_t)desc.read.buffer_addr,
                               desc.read.cmd_type_len, desc.wb.status);
 
-        igb_process_tx_desc(core, txr->tx, &desc, txi->idx);
+        igb_process_tx_desc(core, d, txr->tx, &desc, txi->idx);
         igb_ring_advance(core, txi, 1);
         eic |= igb_txdesc_writeback(core, base, &desc, txi);
     }
@@ -3828,7 +3831,7 @@ igb_core_pci_realize(IGBCore        *core,
     core->vmstate = qemu_add_vm_change_state_handler(igb_vm_state_change, core);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
+        net_tx_pkt_init(&core->tx[i].tx_pkt, NULL, E1000E_MAX_TX_FRAGS);
     }
 
     net_rx_pkt_init(&core->rx_pkt);
@@ -3853,7 +3856,7 @@ igb_core_pci_uninit(IGBCore *core)
     qemu_del_vm_change_state_handler(core->vmstate);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        net_tx_pkt_reset(core->tx[i].tx_pkt);
+        net_tx_pkt_reset(core->tx[i].tx_pkt, NULL);
         net_tx_pkt_uninit(core->tx[i].tx_pkt);
     }
 
@@ -4026,7 +4029,7 @@ static void igb_reset(IGBCore *core, bool sw)
 
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
         tx = &core->tx[i];
-        net_tx_pkt_reset(tx->tx_pkt);
+        net_tx_pkt_reset(tx->tx_pkt, NULL);
         memset(tx->ctx, 0, sizeof(tx->ctx));
         tx->first = true;
         tx->skip_cp = false;
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 986a3ad..cb606cc 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -443,7 +443,7 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt)
 #endif
 }
 
-void net_tx_pkt_reset(struct NetTxPkt *pkt)
+void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
 {
     int i;
 
@@ -467,6 +467,7 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt)
                           pkt->raw[i].iov_len, DMA_DIRECTION_TO_DEVICE, 0);
         }
     }
+    pkt->pci_dev = pci_dev;
     pkt->raw_frags = 0;
 
     pkt->hdr_len = 0;
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index f57b4e0..e5ce6f2 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -148,9 +148,10 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt);
  * reset tx packet private context (needed to be called between packets)
  *
  * @pkt:            packet
+ * @dev:            PCI device processing the next packet
  *
  */
-void net_tx_pkt_reset(struct NetTxPkt *pkt);
+void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
 
 /**
  * Send packet to qemu. handles sw offloads if vhdr is not supported.
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 1068b80..f7b874c 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -678,7 +678,7 @@ static void vmxnet3_process_tx_queue(VMXNET3State *s, int qidx)
             vmxnet3_complete_packet(s, qidx, txd_idx);
             s->tx_sop = true;
             s->skip_current_tx_pkt = false;
-            net_tx_pkt_reset(s->tx_pkt);
+            net_tx_pkt_reset(s->tx_pkt, PCI_DEVICE(s));
         }
     }
 }
@@ -1159,7 +1159,7 @@ static void vmxnet3_deactivate_device(VMXNET3State *s)
 {
     if (s->device_active) {
         VMW_CBPRN("Deactivating vmxnet3...");
-        net_tx_pkt_reset(s->tx_pkt);
+        net_tx_pkt_reset(s->tx_pkt, PCI_DEVICE(s));
         net_tx_pkt_uninit(s->tx_pkt);
         net_rx_pkt_uninit(s->rx_pkt);
         s->device_active = false;
-- 
2.7.4


