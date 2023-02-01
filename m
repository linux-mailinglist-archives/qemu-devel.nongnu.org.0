Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81046685E0E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3vV-0007KC-PT; Tue, 31 Jan 2023 22:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vU-0007BJ-18
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:48 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vR-0000Qg-Ai
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:47 -0500
Received: by mail-pl1-x636.google.com with SMTP id n13so1679075plf.11
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANZ2tvlymfXtSy2NHTRVgvdqaQF3589MS4UmOOzy0ME=;
 b=jI55CIV84ClhDtgHX3v2dxwrmtZoyUNkOcre8T7g4NlgpE06Q6vuE8GMGMwhx0XzcI
 a8DEXdS4/LUD20H+6/jf3HNWd0ygyilRBEZ1oH91NOXC2pip32H2QtphXwr8ipEUbbZ9
 gEhMLw6RKW/8ui6QMAqD0hyJGgubFBK1fWuv23HGQ+623Ks6G+EEMoSaBX+X44kV0YV4
 sfogy+HUSWzrYrWYlEzABeE7WOGw1ZHdCwZ03NJxsalKAY3s47JjdO5/awiCygBluXur
 IwTcey48vc/dEF292de0tYy8TtqtF3E4hyFHSaCFGldUhbgpLSgnbWdfZNg7hsLqQRyw
 9gFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANZ2tvlymfXtSy2NHTRVgvdqaQF3589MS4UmOOzy0ME=;
 b=YG+fnSFK/nLTEdkj5Mt9LfjKKOSW1aS/uqcZTEFEMBhzGclNZA/Yy8uW6cIkwkcQLg
 Vvo5IoEc1+qQ52hs5UZhPgGZq4xY0y3MqAKgC9/UD/2+UO/HrV9N+2zi5MR7gr8uzXmi
 ttoEXUamyeJKO72xgqN4IijBBPpWfFvCMGQus/HA7SWguRfqBY94lAGuX9F4NGfe/bwr
 7YqBxhZc3RBW/83jJxoM67wVppPxBVoHgHVAKfpb2Wcp0m2dprfZVsO+5SvsctaqOSek
 ZllzmjrMSdR9WCFK6hEHz2kQeiXFDuj0VMX249sevjviP5byOjr0Ld2e8vvrf4OnFKfU
 iTog==
X-Gm-Message-State: AO0yUKXmJMGtl88PIg0MjJxPu5cjYgFJrLrQMUq7DcaeroRn/PIwz6DH
 DsAle6QgPJXunrVx/GiDSqa1cg==
X-Google-Smtp-Source: AK7set/LFxC97SllwUQSL/uzttOqBaXOp2Egv3WKRAPfpInQvcRVHqjuw3eWmh1xLyJuJ8FSTHQEyQ==
X-Received: by 2002:a17:902:e34a:b0:196:7a96:cd8a with SMTP id
 p10-20020a170902e34a00b001967a96cd8amr1113289plc.32.1675222604632; 
 Tue, 31 Jan 2023 19:36:44 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 18/29] net: Check L4 header size
Date: Wed,  1 Feb 2023 12:35:28 +0900
Message-Id: <20230201033539.30049-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
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

net_tx_pkt_build_vheader() inspects TCP header but had no check for
the header size, resulting in an undefined behavior. Check the header
size and drop the packet if the header is too small.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 19 ++++++++++++++-----
 hw/net/net_tx_pkt.c  | 13 ++++++++++---
 hw/net/net_tx_pkt.h  |  3 ++-
 hw/net/vmxnet3.c     | 14 +++++++-------
 4 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index d143f2ae6f..38d374fba3 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -629,23 +629,30 @@ e1000e_rss_parse_packet(E1000ECore *core,
     info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
 }
 
-static void
+static bool
 e1000e_setup_tx_offloads(E1000ECore *core, struct e1000e_tx *tx)
 {
     if (tx->props.tse && tx->cptse) {
-        net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->props.mss);
+        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->props.mss)) {
+            return false;
+        }
+
         net_tx_pkt_update_ip_checksums(tx->tx_pkt);
         e1000x_inc_reg_if_not_full(core->mac, TSCTC);
-        return;
+        return true;
     }
 
     if (tx->sum_needed & E1000_TXD_POPTS_TXSM) {
-        net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0);
+        if (!net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0)) {
+            return false;
+        }
     }
 
     if (tx->sum_needed & E1000_TXD_POPTS_IXSM) {
         net_tx_pkt_update_ip_hdr_checksum(tx->tx_pkt);
     }
+
+    return true;
 }
 
 static bool
@@ -654,7 +661,9 @@ e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
     int target_queue = MIN(core->max_queue_num, queue_index);
     NetClientState *queue = qemu_get_subqueue(core->owner_nic, target_queue);
 
-    e1000e_setup_tx_offloads(core, tx);
+    if (!e1000e_setup_tx_offloads(core, tx)) {
+        return false;
+    }
 
     net_tx_pkt_dump(tx->tx_pkt);
 
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 2533ea2700..8a23899a4d 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -304,10 +304,11 @@ func_exit:
     return rc;
 }
 
-void net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
+bool net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
     bool csum_enable, uint32_t gso_size)
 {
     struct tcp_hdr l4hdr;
+    size_t bytes_read;
     assert(pkt);
 
     /* csum has to be enabled if tso is. */
@@ -328,8 +329,12 @@ void net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
 
     case VIRTIO_NET_HDR_GSO_TCPV4:
     case VIRTIO_NET_HDR_GSO_TCPV6:
-        iov_to_buf(&pkt->vec[NET_TX_PKT_PL_START_FRAG], pkt->payload_frags,
-                   0, &l4hdr, sizeof(l4hdr));
+        bytes_read = iov_to_buf(&pkt->vec[NET_TX_PKT_PL_START_FRAG],
+                                pkt->payload_frags, 0, &l4hdr, sizeof(l4hdr));
+        if (bytes_read < sizeof(l4hdr)) {
+            return false;
+        }
+
         pkt->virt_hdr.hdr_len = pkt->hdr_len + l4hdr.th_off * sizeof(uint32_t);
         pkt->virt_hdr.gso_size = gso_size;
         break;
@@ -354,6 +359,8 @@ void net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
             break;
         }
     }
+
+    return true;
 }
 
 void net_tx_pkt_setup_vlan_header_ex(struct NetTxPkt *pkt,
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 4ec8bbe9bd..2e38a5fa69 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -59,9 +59,10 @@ struct virtio_net_hdr *net_tx_pkt_get_vhdr(struct NetTxPkt *pkt);
  * @tso_enable:     TSO enabled
  * @csum_enable:    CSO enabled
  * @gso_size:       MSS size for TSO
+ * @ret:            operation result
  *
  */
-void net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
+bool net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
     bool csum_enable, uint32_t gso_size);
 
 /**
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index d2ab527ef4..c63bbb59bd 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -440,19 +440,19 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
 {
     switch (s->offload_mode) {
     case VMXNET3_OM_NONE:
-        net_tx_pkt_build_vheader(s->tx_pkt, false, false, 0);
-        break;
+        return net_tx_pkt_build_vheader(s->tx_pkt, false, false, 0);
 
     case VMXNET3_OM_CSUM:
-        net_tx_pkt_build_vheader(s->tx_pkt, false, true, 0);
         VMW_PKPRN("L4 CSO requested\n");
-        break;
+        return net_tx_pkt_build_vheader(s->tx_pkt, false, true, 0);
 
     case VMXNET3_OM_TSO:
-        net_tx_pkt_build_vheader(s->tx_pkt, true, true,
-            s->cso_or_gso_size);
-        net_tx_pkt_update_ip_checksums(s->tx_pkt);
         VMW_PKPRN("GSO offload requested.");
+        if (!net_tx_pkt_build_vheader(s->tx_pkt, true, true,
+            s->cso_or_gso_size)) {
+            return false;
+        }
+        net_tx_pkt_update_ip_checksums(s->tx_pkt);
         break;
 
     default:
-- 
2.39.1


