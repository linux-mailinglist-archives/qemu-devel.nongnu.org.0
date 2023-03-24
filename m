Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251D6C8161
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:37:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfgzV-0006as-3L; Fri, 24 Mar 2023 08:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfgzQ-0006aS-E6
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:57:52 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfgz0-0004UE-2o
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:57:52 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w133so1204268oib.1
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679662635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8gAoCq9svhNvT0uN2j6sX7fDer4Kg0xH49mLwsRo18=;
 b=e8K8jZzmKQ8cZzw2IiZ8XVT/KdD+WgOumUTt+0PpsCv1C/QvXO8mEsPy62NlfWGfto
 lat3CJwfza1qwvTKvXQcw0dhMmGbyJJtpolZbWB0bYiH9csE5GMaZh376UhaO69jM1jp
 qPtU39vYE//VLAAaeT5KcVdzSU+eJH8b52pEiNGtIepcMqoqTmVQqFvfFLatU8lFDC8I
 9eo87t1oytaNFJSszSdhUWaPHBHyyMiVl00OfUiKndawhA9qCNNVmZalecOFjzQ22S3Q
 ZY67cPfp+Z/MqtoMixlxjvvhczMQIEzGGo2SWyAorvzeQB1NfnWbGpT1udJiJ74Eg5ms
 Igpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679662635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8gAoCq9svhNvT0uN2j6sX7fDer4Kg0xH49mLwsRo18=;
 b=g1iVZ1IayDr0pPaPt9pD5RgYzPg/XyNi+6BQVE2ipesG3SB9/AuC7MDIK1qZnU10Pe
 +qVKIsLGBc9s8L5h9xwkjWIh8J0SKpC4wHe9Fq4n56ZuIbjO2N/kVuRs98dtvYub7kos
 5+P/Shs/kBkI+g+faqGSR3Ys6T+E7Zl0kOFsamCj/fnrpW4Mo34CNynnGUQKpMD9BLot
 wwfVKtrt5v42LdSXQkY4FgOYwYSMRzbTWIKnXw7FlNQd06JG5xTTLMtJE6c4xnWLMRFx
 y/hD3Ic/MB9lhKAm+SKsVut6n1KmpZudkpwZ1ZYuKSP9wjaTv0vAaBhy1tKTovN+dfFU
 c7PA==
X-Gm-Message-State: AO0yUKWbRA6BIbhrd6q21guEjnaWbKdEQ4csX4kU4Ou8LD8u1P1xJjyE
 LQlXtn2mEhPqI0ZCgWtgkwqFw4lvObj+FoehoZZDow==
X-Google-Smtp-Source: AKy350ZohLsJTHwiWEzP6yp1/aMxDrxPNcW8okkgLYf1aN2vj1tutghfqDmxhn9cLUvAAXkje9Ha3w==
X-Received: by 2002:a17:903:110e:b0:1a1:f5dd:2dd5 with SMTP id
 n14-20020a170903110e00b001a1f5dd2dd5mr2908594plh.13.1679651703169; 
 Fri, 24 Mar 2023 02:55:03 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902748500b001963bc7bdb8sm13785614pll.274.2023.03.24.02.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:55:02 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0 2/4] igb: Fix DMA requester specification for Tx packet
Date: Fri, 24 Mar 2023 18:54:32 +0900
Message-Id: <20230324095434.44973-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324095434.44973-1-akihiko.odaki@daynix.com>
References: <20230324095434.44973-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oi1-x22d.google.com
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

igb used to specify the PF as DMA requester when reading Tx packets.
This made Tx requests from VFs to be performed on the address space of
the PF, defeating the purpose of SR-IOV. Add some logic to change the
requester depending on the queue, which can be assigned to a VF.

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c |  6 +++---
 hw/net/igb_core.c    | 13 ++++++++-----
 hw/net/net_tx_pkt.c  |  3 ++-
 hw/net/net_tx_pkt.h  |  3 ++-
 hw/net/vmxnet3.c     |  4 ++--
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 4d9679ca0b..c0c09b6965 100644
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
index 7708333c2a..78d30738e6 100644
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
index 986a3adfe9..cb606cc84b 100644
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
index f57b4e034b..e5ce6f20bc 100644
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
index 1068b80868..f7b874c139 100644
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
2.39.2


