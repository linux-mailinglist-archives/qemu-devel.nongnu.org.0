Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018E6AD834
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:17:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRSQ-0000w0-FC; Tue, 07 Mar 2023 02:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSN-0000qU-KJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSL-0005V6-Jr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XuobJq8nPtEfuy3ZbksC0txmPUzdbnbwE594wcEClc=;
 b=LL+KpOwZ2AtD+bjaCapmVEgJ9KklYps2qb1/XDDpkr5aaOzebzFjxWTqPhUf40PWkDjfkJ
 AU+rumPKYEQk2FbnrAfz2PM3lD6otZwFu7MNpCZV8phSHO/+dNS2aKN6R6GKXA0ZF6VypF
 g55rEysY227XCTDoREie/fj+nzNkehE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-fNi1KqHsPo-4xgcl1AmbYg-1; Tue, 07 Mar 2023 02:09:49 -0500
X-MC-Unique: fNi1KqHsPo-4xgcl1AmbYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 685FE2808E60;
 Tue,  7 Mar 2023 07:09:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2EC14010E36;
 Tue,  7 Mar 2023 07:09:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 19/51] net: Check L4 header size
Date: Tue,  7 Mar 2023 15:07:44 +0800
Message-Id: <20230307070816.34833-20-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

net_tx_pkt_build_vheader() inspects TCP header but had no check for
the header size, resulting in an undefined behavior. Check the header
size and drop the packet if the header is too small.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 19 ++++++++++++++-----
 hw/net/net_tx_pkt.c  | 13 ++++++++++---
 hw/net/net_tx_pkt.h  |  3 ++-
 hw/net/vmxnet3.c     | 14 +++++++-------
 4 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index d143f2a..38d374f 100644
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
index 2533ea2..8a23899 100644
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
index 4ec8bbe..2e38a5f 100644
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
index 56559cd..d7d492a 100644
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
2.7.4


