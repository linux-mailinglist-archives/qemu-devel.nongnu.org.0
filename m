Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA65228372
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 17:19:35 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxu3K-0001eG-HD
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 11:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1jxu1s-0000CD-3x
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 11:18:04 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:37908)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1jxu1k-0004c0-FH
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 11:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=LX1r6UYEMMR99TVv0H
 qbAyZ6SpgW/oGQ1MXAJ8cuMGk=; b=gpS8V+DEkckV6jNUgPtricDy2idilNVDEZ
 tpIgHZmVrVBlw1FUr0+mg1i3Ru2yCGBfXdi4RTOZOjm5SgXU1Y+cqH15sm5YonAs
 6gaf1TtCKw7eAb5LUlolPDr7kaZgkwL5EZjzmY3C/khKqS7QhDmYp1wU5Ffcte9h
 /x35fOIxQ=
Received: from localhost.localdomain (unknown [115.199.195.7])
 by smtp5 (Coremail) with SMTP id HdxpCgBXEwsPBxdfdT58Dg--.162S4;
 Tue, 21 Jul 2020 23:17:37 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: dmitry.fleytman@gmail.com,
	jasowang@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH v3] e1000e: using bottom half to send packets
Date: Tue, 21 Jul 2020 08:17:28 -0700
Message-Id: <20200721151728.112395-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HdxpCgBXEwsPBxdfdT58Dg--.162S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw4DJr47tw1fGFy8Jr4ruFg_yoW3Kr1xpa
 97GwsxXr15Gry3Ars7Wry5Jr15Xr48J397Wr4Uu34FqFZ3A34DJr10ga1UZFZxZa9FvrZY
 kF45tr9F9rWDXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDb1nUUUUU=
X-Originating-IP: [115.199.195.7]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbitBFobVSIh+n63wAAs3
Received-SPF: pass client-ip=123.126.97.5; envelope-from=liq3ea@163.com;
 helo=mail-m975.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 11:17:45
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alxndr@bu.edu, Li Qiang <liq3ea@163.com>, liq3ea@gmail.com,
 qemu-devel@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexander Bulekov reported a UAF bug related e1000e packets send.

-->https://bugs.launchpad.net/qemu/+bug/1886362

This is because the guest trigger a e1000e packet send and set the
data's address to e1000e's MMIO address. So when the e1000e do DMA
it will write the MMIO again and trigger re-entrancy and finally
causes this UAF.

Paolo suggested to use a bottom half whenever MMIO is doing complicate
things in here:
-->https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg03342.html

Reference here:
'The easiest solution is to delay processing of descriptors to a bottom
half whenever MMIO is doing something complicated.  This is also better
for latency because it will free the vCPU thread more quickly and leave
the work to the I/O thread.'

This patch fixes this UAF.

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Li Qiang <liq3ea@163.com>
---
Change since v2:
1. Add comments for the tx bh schdule when VM resumes
2. Leave the set ics code in 'e1000e_start_xmit'
3. Cancel the tx bh and reset tx_waiting in e1000e_core_reset

Change since v1:
Per Jason's review here:
-- https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg05368.html
1. Cancel and schedule the tx bh when VM is stopped or resume
2. Add a tx_burst for e1000e configuration to throttle the bh execution
3. Add a tx_waiting to record whether the bh is pending or not
Don't use BQL in the tx_bh handler as when tx_bh is executed, the BQL is
acquired.

 hw/net/e1000e.c      |   6 +++
 hw/net/e1000e_core.c | 107 +++++++++++++++++++++++++++++++++++--------
 hw/net/e1000e_core.h |   8 ++++
 3 files changed, 101 insertions(+), 20 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index fda34518c9..24e35a78bf 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -77,10 +77,14 @@ typedef struct E1000EState {
 
     bool disable_vnet;
 
+    int32_t tx_burst;
+
     E1000ECore core;
 
 } E1000EState;
 
+#define TX_BURST 256
+
 #define E1000E_MMIO_IDX     0
 #define E1000E_FLASH_IDX    1
 #define E1000E_IO_IDX       2
@@ -263,6 +267,7 @@ static void e1000e_core_realize(E1000EState *s)
 {
     s->core.owner = &s->parent_obj;
     s->core.owner_nic = s->nic;
+    s->core.tx_burst = s->tx_burst;
 }
 
 static void
@@ -665,6 +670,7 @@ static Property e1000e_properties[] = {
                         e1000e_prop_subsys_ven, uint16_t),
     DEFINE_PROP_SIGNED("subsys", E1000EState, subsys, 0,
                         e1000e_prop_subsys, uint16_t),
+    DEFINE_PROP_INT32("x-txburst", E1000EState, tx_burst, TX_BURST),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index bcd186cac5..2fdfc23204 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -910,18 +910,17 @@ e1000e_rx_ring_init(E1000ECore *core, E1000E_RxRing *rxr, int idx)
 }
 
 static void
-e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
+e1000e_start_xmit(struct e1000e_tx *q)
 {
+    E1000ECore *core = q->core;
     dma_addr_t base;
     struct e1000_tx_desc desc;
-    bool ide = false;
-    const E1000E_RingInfo *txi = txr->i;
-    uint32_t cause = E1000_ICS_TXQE;
+    const E1000E_RingInfo *txi;
+    E1000E_TxRing txr;
+    int32_t num_packets = 0;
 
-    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
-        trace_e1000e_tx_disabled();
-        return;
-    }
+    e1000e_tx_ring_init(core, &txr, q - &core->tx[0]);
+    txi = txr.i;
 
     while (!e1000e_ring_empty(core, txi)) {
         base = e1000e_ring_head_descr(core, txi);
@@ -931,14 +930,24 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
         trace_e1000e_tx_descr((void *)(intptr_t)desc.buffer_addr,
                               desc.lower.data, desc.upper.data);
 
-        e1000e_process_tx_desc(core, txr->tx, &desc, txi->idx);
-        cause |= e1000e_txdesc_writeback(core, base, &desc, &ide, txi->idx);
+        e1000e_process_tx_desc(core, txr.tx, &desc, txi->idx);
+        q->cause |= e1000e_txdesc_writeback(core, base, &desc,
+                                            &q->ide, txi->idx);
 
         e1000e_ring_advance(core, txi, 1);
+        if (++num_packets >= core->tx_burst) {
+            break;
+        }
+    }
+
+    if (num_packets >= core->tx_burst) {
+        qemu_bh_schedule(q->tx_bh);
+        q->tx_waiting = 1;
+        return;
     }
 
-    if (!ide || !e1000e_intrmgr_delay_tx_causes(core, &cause)) {
-        e1000e_set_interrupt_cause(core, cause);
+    if (!q->ide || !e1000e_intrmgr_delay_tx_causes(core, &q->cause)) {
+        e1000e_set_interrupt_cause(core, q->cause);
     }
 }
 
@@ -2423,32 +2432,41 @@ e1000e_set_dbal(E1000ECore *core, int index, uint32_t val)
 static void
 e1000e_set_tctl(E1000ECore *core, int index, uint32_t val)
 {
-    E1000E_TxRing txr;
     core->mac[index] = val;
 
     if (core->mac[TARC0] & E1000_TARC_ENABLE) {
-        e1000e_tx_ring_init(core, &txr, 0);
-        e1000e_start_xmit(core, &txr);
+        if (core->tx[0].tx_waiting) {
+            return;
+        }
+        core->tx[0].tx_waiting = 1;
+        if (!core->vm_running) {
+            return;
+        }
+        qemu_bh_schedule(core->tx[0].tx_bh);
     }
 
     if (core->mac[TARC1] & E1000_TARC_ENABLE) {
-        e1000e_tx_ring_init(core, &txr, 1);
-        e1000e_start_xmit(core, &txr);
+        if (core->tx[1].tx_waiting) {
+            return;
+        }
+        core->tx[1].tx_waiting = 1;
+        if (!core->vm_running) {
+            return;
+        }
+        qemu_bh_schedule(core->tx[1].tx_bh);
     }
 }
 
 static void
 e1000e_set_tdt(E1000ECore *core, int index, uint32_t val)
 {
-    E1000E_TxRing txr;
     int qidx = e1000e_mq_queue_idx(TDT, index);
     uint32_t tarc_reg = (qidx == 0) ? TARC0 : TARC1;
 
     core->mac[index] = val & 0xffff;
 
     if (core->mac[tarc_reg] & E1000_TARC_ENABLE) {
-        e1000e_tx_ring_init(core, &txr, qidx);
-        e1000e_start_xmit(core, &txr);
+        qemu_bh_schedule(core->tx[qidx].tx_bh);
     }
 }
 
@@ -3315,11 +3333,52 @@ e1000e_vm_state_change(void *opaque, int running, RunState state)
         trace_e1000e_vm_state_running();
         e1000e_intrmgr_resume(core);
         e1000e_autoneg_resume(core);
+        core->vm_running = 1;
+
+        for (int i = 0; i < E1000E_NUM_QUEUES; i++) {
+            /*
+             * Schedule tx bh unconditionally to make sure
+             * tx work after live migration since we don't
+             * migrate tx_waiting.
+             */
+            qemu_bh_schedule(core->tx[i].tx_bh);
+        }
+
     } else {
         trace_e1000e_vm_state_stopped();
+
+        for (int i = 0; i < E1000E_NUM_QUEUES; i++) {
+            qemu_bh_cancel(core->tx[i].tx_bh);
+        }
+
         e1000e_autoneg_pause(core);
         e1000e_intrmgr_pause(core);
+        core->vm_running = 0;
+    }
+}
+
+
+static void e1000e_core_tx_bh(void *opaque)
+{
+    struct e1000e_tx *q = opaque;
+    E1000ECore *core = q->core;
+
+    if (!core->vm_running) {
+        assert(q->tx_waiting);
+        return;
+    }
+
+    q->tx_waiting = 0;
+
+    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
+        trace_e1000e_tx_disabled();
+        return;
     }
+
+    q->cause = E1000_ICS_TXQE;
+    q->ide = false;
+
+    e1000e_start_xmit(q);
 }
 
 void
@@ -3334,12 +3393,15 @@ e1000e_core_pci_realize(E1000ECore     *core,
                                        e1000e_autoneg_timer, core);
     e1000e_intrmgr_pci_realize(core);
 
+    core->vm_running = runstate_is_running();
     core->vmstate =
         qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
 
     for (i = 0; i < E1000E_NUM_QUEUES; i++) {
         net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
                         E1000E_MAX_TX_FRAGS, core->has_vnet);
+        core->tx[i].core = core;
+        core->tx[i].tx_bh = qemu_bh_new(e1000e_core_tx_bh, &core->tx[i]);
     }
 
     net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
@@ -3367,6 +3429,9 @@ e1000e_core_pci_uninit(E1000ECore *core)
     for (i = 0; i < E1000E_NUM_QUEUES; i++) {
         net_tx_pkt_reset(core->tx[i].tx_pkt);
         net_tx_pkt_uninit(core->tx[i].tx_pkt);
+        qemu_bh_cancel(core->tx[i].tx_bh);
+        qemu_bh_delete(core->tx[i].tx_bh);
+        core->tx[i].tx_bh = NULL;
     }
 
     net_rx_pkt_uninit(core->rx_pkt);
@@ -3480,6 +3545,8 @@ e1000e_core_reset(E1000ECore *core)
         net_tx_pkt_reset(core->tx[i].tx_pkt);
         memset(&core->tx[i].props, 0, sizeof(core->tx[i].props));
         core->tx[i].skip_cp = false;
+        qemu_bh_cancel(core->tx[i].tx_bh);
+        core->tx[i].tx_waiting = 0;
     }
 }
 
diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index aee32f7e48..0c16dce3a6 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -77,10 +77,18 @@ struct E1000Core {
         unsigned char sum_needed;
         bool cptse;
         struct NetTxPkt *tx_pkt;
+        QEMUBH *tx_bh;
+        uint32_t tx_waiting;
+        uint32_t cause;
+        bool ide;
+        E1000ECore *core;
     } tx[E1000E_NUM_QUEUES];
 
     struct NetRxPkt *rx_pkt;
 
+    int32_t tx_burst;
+
+    bool vm_running;
     bool has_vnet;
     int max_queue_num;
 
-- 
2.17.1


