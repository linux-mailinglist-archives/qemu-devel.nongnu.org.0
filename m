Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F46BD480
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:58:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpyk-0006Ny-IF; Thu, 16 Mar 2023 11:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcpyj-0006Nl-2P
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:57:21 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcpyg-00059r-Sq
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:57:20 -0400
Received: by mail-pg1-x530.google.com with SMTP id q189so1197505pga.9
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678982237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YZlLynFW/RDceUWI7sdgfi9zLjOG6tVPwSs5xKXlGBw=;
 b=EwxwasOQ+kBscF0xioGu7zNegvl1PMYMVIVgYScTnpkCHZs8r2G9GXb0g4qS6tPWMQ
 2qybGGwHEZ8+ZqCKRLmdLEdYai0h0YHStXV2NgMR3LeYCrZPiuTHaVF97p++L16v15FK
 mrI+58DRXeWu3FCvgkAd5LHeZzjmbrtJlyczkzKUKgzGgQPR7f5FxAdxLaxdGk0VzWwG
 pT8xbyiphhSsFYmC1R+VmMRfwOnNHI/6rFo2EjkcBOSDRxQkXfSFEjU1+T5kNOx1FXM/
 VwfSdmv2aKbU2XP7c8f1Ak2IXJ6nYwdSiTasodjU9n3dNSMmt52Nk3rF2akQbdYY9Rh6
 FFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678982237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YZlLynFW/RDceUWI7sdgfi9zLjOG6tVPwSs5xKXlGBw=;
 b=2fxId/vwV+QhuubGabgLYXzjAiFOdNast1QGOGtbgFu87IhMcYhCBE6Nh2S3tk1O+Y
 Jo1Lcl2KsdYK6q8n7Ue0tgDOOBrqFT/V1CzZt/fBkHJxOIXdehdyJ98SBVAf4DBO4o72
 UhHHiVzIsBCZtWJhWsYhffuI9a08604oXIA9EFlyagtQpG+j/Qs1bs7qSs5ieKykivwz
 30YX5ZJ5ziORfwqLGbXGUS8tJeYwjwFBs/2LYUI3tcajXjXPsoqjGITeFPw47Qts14Yj
 1lJHkH3eScQbHkJ2PZYPPSEKeYm9ok9XW00Q3SkiF+UXCcLZaMbi0QBuo3kupB8XUmjf
 RuuQ==
X-Gm-Message-State: AO0yUKXNPOh6/BID99gZWwRaXMBjD2XWgKp93usqyidocHpjNaA4xgxI
 lhqObXgF7pt44DN9ppl/T/uP2N47a/IdeRhFAD9pRw==
X-Google-Smtp-Source: AK7set8bgGnwSKhMrPAFSSb+t0VW8TyUiV8C0Fe1PAOvJL1iSFTxzUQfkcnMrR1xlrg2Y+ykd7ymYg==
X-Received: by 2002:a62:4e14:0:b0:625:cc63:642b with SMTP id
 c20-20020a624e14000000b00625cc63642bmr3795540pfb.14.1678982236849; 
 Thu, 16 Mar 2023 08:57:16 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a62e80b000000b005abbfa874d9sm5634011pfi.88.2023.03.16.08.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 08:57:16 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, quintela@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
Date: Fri, 17 Mar 2023 00:57:07 +0900
Message-Id: <20230316155707.27007-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
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
V1 -> V2: Bump igb-tx version

 hw/net/igb.c      | 10 ++++++----
 hw/net/igb_core.c | 17 ++++++++++-------
 hw/net/igb_core.h |  3 +--
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/net/igb.c b/hw/net/igb.c
index c6d753df87..f9ec82fc28 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -504,11 +504,13 @@ static int igb_post_load(void *opaque, int version_id)
 
 static const VMStateDescription igb_vmstate_tx = {
     .name = "igb-tx",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
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
index a7c7bfdc75..304f5d849f 100644
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
 
@@ -550,8 +551,10 @@ igb_process_tx_desc(IGBCore *core,
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
@@ -575,8 +578,9 @@ igb_process_tx_desc(IGBCore *core,
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
@@ -4024,8 +4028,7 @@ static void igb_reset(IGBCore *core, bool sw)
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
         tx = &core->tx[i];
         net_tx_pkt_reset(tx->tx_pkt);
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


