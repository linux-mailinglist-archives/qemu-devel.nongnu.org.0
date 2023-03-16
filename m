Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343046BCF7A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:29:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmjA-0007Xv-F9; Thu, 16 Mar 2023 08:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmj6-0007XP-HZ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:29:00 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmj4-0003t1-Oy
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:29:00 -0400
Received: by mail-pg1-x52b.google.com with SMTP id z18so792422pgj.13
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678969737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=49Rcm+E8kBL1RIMWWY5mnZGO9fEkOBkt9jJtdcI6My0=;
 b=le9i4qS7rqt8LHhDa6Zx1ZYTiqZ2v1M59LOMB7dEodq9SpehDwaNiPbpFFkgzoq4bo
 Sxb6OCKoy8AdYpK3M+gD9J9wu/Mtjg5yH8t/DLRnE3CRbjDn5KXTfdsBQN4qvE4fJ/GW
 4R0ISJzEze2obn3j55IJvH5G4RKNQfE6eEpVWGojL7RnsnWnXWnLcMaZQNN2mSsg99GF
 oEYPpTivap5NoUm7RSM1pmvuVxIRk2wi0RI/H0YrNRrvT76RjWdmKafU/kXjx+kIeSW7
 E60hgica6CEEJG6wdBqrg1K2yHjIT7EGErEMGq0uuJAw3fOCPYvveZZSgDpn2wxIhA9s
 CNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678969737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=49Rcm+E8kBL1RIMWWY5mnZGO9fEkOBkt9jJtdcI6My0=;
 b=45ZNPXWBungZOTE+waDs9K4TY8gAJ+f600Gny+qehwkZCLydstNV4kkBOYUqoMnSQG
 qNOpLsr9xLc2rli7aJuStY7EEKjLnQalt7l5Z2+MUJpUD3Gpm84n8au6Bzcno5UR+eS8
 LileD5CriesEfIer+2xdO5GxKA05GaF0RezJk9ZZA9yPDIg1PBKot05/5Bz/tDt/JTvd
 Rsxhl07wLH+Nr043q6VuJqqfVpnizopfYZ9Eyq3ODV+zWiTmDMkmNszt189PNQixWbNI
 2JBwukF5hyN0jaw3iUNGnrgCVJA/vDrHInwyVy1fN0LsAu/IccPcCftFw/KM21Jih0Py
 Wc+g==
X-Gm-Message-State: AO0yUKUgYw/QOrC2Crl6DsK6gffHwRLe0nasiA3s+fA+6guuskQT47Ym
 iolwJplY/4wJcwDxuOrq0oEweP31A5QayvTPaWTpHA==
X-Google-Smtp-Source: AK7set8ma3M9R1SqfzuVECeC2frbfO3uTXLlUk2uOG1Wb3HkpcSXh7yXRNzL5h2xjf4Ff8JmWjZFaQ==
X-Received: by 2002:a62:5211:0:b0:625:e728:4c5f with SMTP id
 g17-20020a625211000000b00625e7284c5fmr2043458pfb.22.1678969737357; 
 Thu, 16 Mar 2023 05:28:57 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s11-20020aa7828b000000b005ded5d2d571sm5325082pfm.185.2023.03.16.05.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 05:28:57 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0] igb: Save the entire Tx context descriptor
Date: Thu, 16 Mar 2023 21:28:47 +0900
Message-Id: <20230316122847.11003-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52b.google.com
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
context descriptor because it misses some features and sniffs the trait
of the packet instead of respecting the packet type specified in the
descriptor. However, we will certainly need the entire Tx context
descriptor when we update igb to respect these ignored fields. Save the
entire Tx context descriptor to prepare for such a change.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb.c      |  6 ++++--
 hw/net/igb_core.c | 17 ++++++++++-------
 hw/net/igb_core.h |  3 +--
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/net/igb.c b/hw/net/igb.c
index 0792626322..50239a7cb1 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -499,8 +499,10 @@ static const VMStateDescription igb_vmstate_tx = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT16(vlan, struct igb_tx),
-        VMSTATE_UINT16(mss, struct igb_tx),
+        VMSTATE_UINT32(ctx.vlan_macip_lens, struct igb_tx),
+        VMSTATE_UINT32(ctx.seqnum_seed, struct igb_tx),
+        VMSTATE_UINT32(ctx.type_tucmd_mlhl, struct igb_tx),
+        VMSTATE_UINT32(ctx.mss_l4len_idx, struct igb_tx),
         VMSTATE_BOOL(tse, struct igb_tx),
         VMSTATE_BOOL(ixsm, struct igb_tx),
         VMSTATE_BOOL(txsm, struct igb_tx),
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 41d1abae03..dbe24739d0 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -390,7 +390,8 @@ static bool
 igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
     if (tx->tse) {
-        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss)) {
+        uint32_t mss = tx->ctx.mss_l4len_idx >> 16;
+        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
             return false;
         }
 
@@ -551,8 +552,10 @@ igb_process_tx_desc(IGBCore *core,
                    E1000_ADVTXD_DTYP_CTXT) {
             /* advanced transmit context descriptor */
             tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
-            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
-            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
+            tx->ctx.vlan_macip_lens = le32_to_cpu(tx_ctx_desc->vlan_macip_lens);
+            tx->ctx.seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
+            tx->ctx.type_tucmd_mlhl = le32_to_cpu(tx_ctx_desc->type_tucmd_mlhl);
+            tx->ctx.mss_l4len_idx = le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
             return;
         } else {
             /* unknown descriptor type */
@@ -576,8 +579,9 @@ igb_process_tx_desc(IGBCore *core,
     if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
             if (cmd_type_len & E1000_TXD_CMD_VLE) {
-                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
-                    core->mac[VET] & 0xffff);
+                uint16_t vlan = tx->ctx.vlan_macip_lens >> 16;
+                uint16_t vet = core->mac[VET] & 0xffff;
+                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
                 igb_on_tx_done_update_stats(core, tx->tx_pkt);
@@ -4027,8 +4031,7 @@ static void igb_reset(IGBCore *core, bool sw)
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
         tx = &core->tx[i];
         net_tx_pkt_reset(tx->tx_pkt, NULL);
-        tx->vlan = 0;
-        tx->mss = 0;
+        memset(&tx->ctx, 0, sizeof(tx->ctx));
         tx->tse = false;
         tx->ixsm = false;
         tx->txsm = false;
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index 814c1e264b..3483edc655 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -72,8 +72,7 @@ struct IGBCore {
     QEMUTimer *autoneg_timer;
 
     struct igb_tx {
-        uint16_t vlan;  /* VLAN Tag */
-        uint16_t mss;   /* Maximum Segment Size */
+        struct e1000_adv_tx_context_desc ctx;
         bool tse;       /* TCP/UDP Segmentation Enable */
         bool ixsm;      /* Insert IP Checksum */
         bool txsm;      /* Insert TCP/UDP Checksum */
-- 
2.39.2


