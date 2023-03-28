Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682116CB5F4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:22:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph1kH-0005Ue-JE; Tue, 28 Mar 2023 01:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1k3-0005RN-Mv
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1k1-0007J1-AQ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679980768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXAvYXuWa79bIJVSM+nmobbqfaaUm6rN/wVaJcjPsFY=;
 b=C324UJmKK8VmXshNmCNiFJJaUm9EnKYxcRBdosTjTz6cKBWFpSlIWJh/sfAcKRPo1cEQ7y
 ISnPxFnvCzdrwg8F65/+qEQWxnvhiCxqu6QvNIYl0/y7e+mt1hytmi3zHehsJ/aQv1Uxt9
 zAaXcjAXvrRknDlYyUyQm/g0DIyeIgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-pQ5De5nFMf-r--5YL-kvFA-1; Tue, 28 Mar 2023 01:19:26 -0400
X-MC-Unique: pQ5De5nFMf-r--5YL-kvFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054CE811E7C;
 Tue, 28 Mar 2023 05:19:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-204.pek2.redhat.com
 [10.72.13.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98CCC202701E;
 Tue, 28 Mar 2023 05:19:23 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 01/12] igb: Save more Tx states
Date: Tue, 28 Mar 2023 13:19:06 +0800
Message-Id: <20230328051917.18006-2-jasowang@redhat.com>
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

The current implementation of igb uses only part of a advanced Tx
context descriptor and first data descriptor because it misses some
features and sniffs the trait of the packet instead of respecting the
packet type specified in the descriptor. However, we will certainly
need the entire Tx context descriptor when we update igb to respect
these ignored fields. Save the entire context descriptor and first
data descriptor except the buffer address to prepare for such a change.

This also introduces the distinction of contexts with different
indexes, which was not present in e1000e but in igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/igb.c      | 26 +++++++++++++++++++-------
 hw/net/igb_core.c | 39 +++++++++++++++++++--------------------
 hw/net/igb_core.h |  8 +++-----
 3 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/hw/net/igb.c b/hw/net/igb.c
index c6d753d..51a7e91 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -502,16 +502,28 @@ static int igb_post_load(void *opaque, int version_id)
     return igb_core_post_load(&s->core);
 }
 
-static const VMStateDescription igb_vmstate_tx = {
-    .name = "igb-tx",
+static const VMStateDescription igb_vmstate_tx_ctx = {
+    .name = "igb-tx-ctx",
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT16(vlan, struct igb_tx),
-        VMSTATE_UINT16(mss, struct igb_tx),
-        VMSTATE_BOOL(tse, struct igb_tx),
-        VMSTATE_BOOL(ixsm, struct igb_tx),
-        VMSTATE_BOOL(txsm, struct igb_tx),
+        VMSTATE_UINT32(vlan_macip_lens, struct e1000_adv_tx_context_desc),
+        VMSTATE_UINT32(seqnum_seed, struct e1000_adv_tx_context_desc),
+        VMSTATE_UINT32(type_tucmd_mlhl, struct e1000_adv_tx_context_desc),
+        VMSTATE_UINT32(mss_l4len_idx, struct e1000_adv_tx_context_desc),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription igb_vmstate_tx = {
+    .name = "igb-tx",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(ctx, struct igb_tx, 2, 0, igb_vmstate_tx_ctx,
+                             struct e1000_adv_tx_context_desc),
+        VMSTATE_UINT32(first_cmd_type_len, struct igb_tx),
+        VMSTATE_UINT32(first_olinfo_status, struct igb_tx),
         VMSTATE_BOOL(first, struct igb_tx),
         VMSTATE_BOOL(skip_cp, struct igb_tx),
         VMSTATE_END_OF_LIST()
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index a7c7bfd..7708333 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -389,8 +389,10 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
 static bool
 igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
-    if (tx->tse) {
-        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss)) {
+    if (tx->first_cmd_type_len & E1000_ADVTXD_DCMD_TSE) {
+        uint32_t idx = (tx->first_olinfo_status >> 4) & 1;
+        uint32_t mss = tx->ctx[idx].mss_l4len_idx >> 16;
+        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
             return false;
         }
 
@@ -399,13 +401,13 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
         return true;
     }
 
-    if (tx->txsm) {
+    if (tx->first_olinfo_status & E1000_ADVTXD_POTS_TXSM) {
         if (!net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0)) {
             return false;
         }
     }
 
-    if (tx->ixsm) {
+    if (tx->first_olinfo_status & E1000_ADVTXD_POTS_IXSM) {
         net_tx_pkt_update_ip_hdr_checksum(tx->tx_pkt);
     }
 
@@ -527,7 +529,7 @@ igb_process_tx_desc(IGBCore *core,
 {
     struct e1000_adv_tx_context_desc *tx_ctx_desc;
     uint32_t cmd_type_len;
-    uint32_t olinfo_status;
+    uint32_t idx;
     uint64_t buffer_addr;
     uint16_t length;
 
@@ -538,20 +540,19 @@ igb_process_tx_desc(IGBCore *core,
             E1000_ADVTXD_DTYP_DATA) {
             /* advanced transmit data descriptor */
             if (tx->first) {
-                olinfo_status = le32_to_cpu(tx_desc->read.olinfo_status);
-
-                tx->tse = !!(cmd_type_len & E1000_ADVTXD_DCMD_TSE);
-                tx->ixsm = !!(olinfo_status & E1000_ADVTXD_POTS_IXSM);
-                tx->txsm = !!(olinfo_status & E1000_ADVTXD_POTS_TXSM);
-
+                tx->first_cmd_type_len = cmd_type_len;
+                tx->first_olinfo_status = le32_to_cpu(tx_desc->read.olinfo_status);
                 tx->first = false;
             }
         } else if ((cmd_type_len & E1000_ADVTXD_DTYP_CTXT) ==
                    E1000_ADVTXD_DTYP_CTXT) {
             /* advanced transmit context descriptor */
             tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
-            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
-            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
+            idx = (le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 4) & 1;
+            tx->ctx[idx].vlan_macip_lens = le32_to_cpu(tx_ctx_desc->vlan_macip_lens);
+            tx->ctx[idx].seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
+            tx->ctx[idx].type_tucmd_mlhl = le32_to_cpu(tx_ctx_desc->type_tucmd_mlhl);
+            tx->ctx[idx].mss_l4len_idx = le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
             return;
         } else {
             /* unknown descriptor type */
@@ -575,8 +576,10 @@ igb_process_tx_desc(IGBCore *core,
     if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
             if (cmd_type_len & E1000_TXD_CMD_VLE) {
-                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
-                    core->mac[VET] & 0xffff);
+                idx = (tx->first_olinfo_status >> 4) & 1;
+                uint16_t vlan = tx->ctx[idx].vlan_macip_lens >> 16;
+                uint16_t vet = core->mac[VET] & 0xffff;
+                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
                 igb_on_tx_done_update_stats(core, tx->tx_pkt);
@@ -4024,11 +4027,7 @@ static void igb_reset(IGBCore *core, bool sw)
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
         tx = &core->tx[i];
         net_tx_pkt_reset(tx->tx_pkt);
-        tx->vlan = 0;
-        tx->mss = 0;
-        tx->tse = false;
-        tx->ixsm = false;
-        tx->txsm = false;
+        memset(tx->ctx, 0, sizeof(tx->ctx));
         tx->first = true;
         tx->skip_cp = false;
     }
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index 814c1e2..8914e0b 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -72,11 +72,9 @@ struct IGBCore {
     QEMUTimer *autoneg_timer;
 
     struct igb_tx {
-        uint16_t vlan;  /* VLAN Tag */
-        uint16_t mss;   /* Maximum Segment Size */
-        bool tse;       /* TCP/UDP Segmentation Enable */
-        bool ixsm;      /* Insert IP Checksum */
-        bool txsm;      /* Insert TCP/UDP Checksum */
+        struct e1000_adv_tx_context_desc ctx[2];
+        uint32_t first_cmd_type_len;
+        uint32_t first_olinfo_status;
 
         bool first;
         bool skip_cp;
-- 
2.7.4


