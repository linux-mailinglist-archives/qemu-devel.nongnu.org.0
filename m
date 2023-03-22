Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD306C4187
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 05:22:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pepy7-0000IK-9R; Wed, 22 Mar 2023 00:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pepy5-0000Hs-32
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 00:20:57 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pepy3-0006Bx-3q
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 00:20:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so22461181pjt.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 21:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679458853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9L2/5sYCp+YP7XCsKeBzXQzihKkwgSFDtEJfzakkyRY=;
 b=HeLXSOjnIXvKdN0RW6FCXQzIwFiqwM3X5cpUZMPU7MoJXUhTSFLpcT+H5B988aHeTz
 p9bRjPmkLbejLgEf+59LA64HuXZWmA2az7NcpIujjzbpoATYjSdsGzNEapGywMLdtfUr
 Sks2Tzk4a7QwrS+HTiFXFEjTBqcyBRmL6jUH1jvbMVnMZ5/0oUpQzjpYGSu1pa/7twPf
 3+z5zapwi51/JE/bG80T8eyDt+XjCbgEvIyT2t9jGYADfUnPt5sq7KXJOLzsG1W2oE+A
 YEAsu4APD0g4LDFrP7YMV3696KZc/t8mQtT3YYnH0jk9mxb+rhdqwsoziGRHP/d4Fo//
 bZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679458853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9L2/5sYCp+YP7XCsKeBzXQzihKkwgSFDtEJfzakkyRY=;
 b=avSXlEISRYrqPNzJ2vIAJKiiQIOUss+wM6bRyJ3PQy6GJ/2zGQXraMHhj+8XUMu9uz
 HOql3UdmKUFRmc9tcpN6y+mHFuY/gd0xe6s3+qmFebk8Htq0YrQ1gjyLOEV/crhY2JgV
 F5xfKriAj4jqAETcLrcDZ0RYtEbIUmprF6YZDAmiQUXW5hl/HswU9wYsgsHS6RWHlRcZ
 SWknLaQdOzKpDO7Y2iHPQEmnp14MRCXTlfoZrQerQOsjoDLSU+EwVnSgJoFGI9a5TxNZ
 hiPY/sPMu59m4lbuCfHRquQnU21yAxcs0WZr2cUq9syVDv+HjVPrY/Sclneoqa5lWATa
 em7Q==
X-Gm-Message-State: AO0yUKWLZ7v6+Nd091eJrdgM0j2sKSw+Kkf2vTKQ7rJ7jSzoNjDK4VLD
 6mFR6VRHgRTpeueHXIMfCRrUtluZhhMhHwfF7wXMig==
X-Google-Smtp-Source: AK7set+RRaPxiobRDZ63OoGyxac2RLy+p25uWnbc4uBboy30HC4J5R1lRljFGGi+wPN/IgobZALChw==
X-Received: by 2002:a05:6a20:c754:b0:da:6dd4:84a2 with SMTP id
 hj20-20020a056a20c75400b000da6dd484a2mr4165303pzb.13.1679458853048; 
 Tue, 21 Mar 2023 21:20:53 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 d13-20020aa78e4d000000b00622e01989cbsm9302760pfr.176.2023.03.21.21.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 21:20:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: "qemu-devel @ nongnu . org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "quintela @ redhat . com" <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0 v2] igb: Save more Tx states
Date: Wed, 22 Mar 2023 13:20:44 +0900
Message-Id: <20230322042044.25136-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
---
V1 -> V2: Removed references to old variables in igb_reset()

Supersedes: <20230316155707.27007-1-akihiko.odaki@daynix.com>

 hw/net/igb.c      | 25 ++++++++++++++++++-------
 hw/net/igb_core.c | 39 +++++++++++++++++++--------------------
 hw/net/igb_core.h |  8 +++-----
 3 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/hw/net/igb.c b/hw/net/igb.c
index c6d753df87..7c05896325 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -502,16 +502,27 @@ static int igb_post_load(void *opaque, int version_id)
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
index a7c7bfdc75..7708333c2a 100644
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
index 814c1e264b..8914e0b801 100644
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
2.39.2


