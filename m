Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B822D1FA952
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 08:59:39 +0200 (CEST)
Received: from localhost ([::1]:58774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5ZK-0004hq-Op
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 02:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mi-0001q7-Dk
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33091
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mf-0005kA-LW
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592289992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=0vqoFtVgK7SIrhEAWWD1OBM8pgsuXNy35dko35zy3ts=;
 b=Jh5btcIlwUHlkHpN+Dt4rS3+04kR6HdEQKAms6UWtZc4atRPNzuYIR1qCo1snnazaoqdqK
 iC7apSnnSgVj27m37OtGNUUmSbzVRmfCYxynj99CS3Vm+w5HczAZsBokF7p6iZ4f4dyM4r
 OPRfLNFZTdQu8hRkaohqJ+lbQj0iBaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-M_stS3hoPoeRHF4C9xdwNQ-1; Tue, 16 Jun 2020 02:46:29 -0400
X-MC-Unique: M_stS3hoPoeRHF4C9xdwNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E50680F5C3;
 Tue, 16 Jun 2020 06:46:28 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8A18202D;
 Tue, 16 Jun 2020 06:46:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 16/33] net: cadence_gem: Move tx/rx packet buffert to
 CadenceGEMState
Date: Tue, 16 Jun 2020 14:45:27 +0800
Message-Id: <1592289944-13727-17-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Moving this buffers to CadenceGEMState, as their size will be increased
more when JUMBO frames support is added.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/cadence_gem.c         | 38 +++++++++++++++++---------------------
 include/hw/net/cadence_gem.h |  4 ++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 2e183b5..247a52f 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -928,17 +928,14 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
  */
 static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 {
-    CadenceGEMState *s;
+    CadenceGEMState *s = qemu_get_nic_opaque(nc);
     unsigned   rxbufsize, bytes_to_copy;
     unsigned   rxbuf_offset;
-    uint8_t    rxbuf[2048];
     uint8_t   *rxbuf_ptr;
     bool first_desc = true;
     int maf;
     int q = 0;
 
-    s = qemu_get_nic_opaque(nc);
-
     /* Is this destination MAC address "for us" ? */
     maf = gem_mac_address_filter(s, buf);
     if (maf == GEM_RX_REJECT) {
@@ -994,19 +991,19 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     } else {
         unsigned crc_val;
 
-        if (size > sizeof(rxbuf) - sizeof(crc_val)) {
-            size = sizeof(rxbuf) - sizeof(crc_val);
+        if (size > MAX_FRAME_SIZE - sizeof(crc_val)) {
+            size = MAX_FRAME_SIZE - sizeof(crc_val);
         }
         bytes_to_copy = size;
         /* The application wants the FCS field, which QEMU does not provide.
          * We must try and calculate one.
          */
 
-        memcpy(rxbuf, buf, size);
-        memset(rxbuf + size, 0, sizeof(rxbuf) - size);
-        rxbuf_ptr = rxbuf;
-        crc_val = cpu_to_le32(crc32(0, rxbuf, MAX(size, 60)));
-        memcpy(rxbuf + size, &crc_val, sizeof(crc_val));
+        memcpy(s->rx_packet, buf, size);
+        memset(s->rx_packet + size, 0, MAX_FRAME_SIZE - size);
+        rxbuf_ptr = s->rx_packet;
+        crc_val = cpu_to_le32(crc32(0, s->rx_packet, MAX(size, 60)));
+        memcpy(s->rx_packet + size, &crc_val, sizeof(crc_val));
 
         bytes_to_copy += 4;
         size += 4;
@@ -1152,7 +1149,6 @@ static void gem_transmit(CadenceGEMState *s)
 {
     uint32_t desc[DESC_MAX_NUM_WORDS];
     hwaddr packet_desc_addr;
-    uint8_t     tx_packet[2048];
     uint8_t     *p;
     unsigned    total_bytes;
     int q = 0;
@@ -1168,7 +1164,7 @@ static void gem_transmit(CadenceGEMState *s)
      * Packets scattered across multiple descriptors are gathered to this
      * one contiguous buffer first.
      */
-    p = tx_packet;
+    p = s->tx_packet;
     total_bytes = 0;
 
     for (q = s->num_priority_queues - 1; q >= 0; q--) {
@@ -1198,12 +1194,12 @@ static void gem_transmit(CadenceGEMState *s)
                 break;
             }
 
-            if (tx_desc_get_length(desc) > sizeof(tx_packet) -
-                                               (p - tx_packet)) {
+            if (tx_desc_get_length(desc) > MAX_FRAME_SIZE -
+                                               (p - s->tx_packet)) {
                 DB_PRINT("TX descriptor @ 0x%" HWADDR_PRIx \
                          " too large: size 0x%x space 0x%zx\n",
                          packet_desc_addr, tx_desc_get_length(desc),
-                         sizeof(tx_packet) - (p - tx_packet));
+                         MAX_FRAME_SIZE - (p - s->tx_packet));
                 break;
             }
 
@@ -1248,24 +1244,24 @@ static void gem_transmit(CadenceGEMState *s)
 
                 /* Is checksum offload enabled? */
                 if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
-                    net_checksum_calculate(tx_packet, total_bytes);
+                    net_checksum_calculate(s->tx_packet, total_bytes);
                 }
 
                 /* Update MAC statistics */
-                gem_transmit_updatestats(s, tx_packet, total_bytes);
+                gem_transmit_updatestats(s, s->tx_packet, total_bytes);
 
                 /* Send the packet somewhere */
                 if (s->phy_loop || (s->regs[GEM_NWCTRL] &
                                     GEM_NWCTRL_LOCALLOOP)) {
-                    gem_receive(qemu_get_queue(s->nic), tx_packet,
+                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
                                 total_bytes);
                 } else {
-                    qemu_send_packet(qemu_get_queue(s->nic), tx_packet,
+                    qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
                                      total_bytes);
                 }
 
                 /* Prepare for next packet */
-                p = tx_packet;
+                p = s->tx_packet;
                 total_bytes = 0;
             }
 
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 5c83036..eddac70 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -40,6 +40,8 @@
 #define MAX_TYPE1_SCREENERS             16
 #define MAX_TYPE2_SCREENERS             16
 
+#define MAX_FRAME_SIZE 2048
+
 typedef struct CadenceGEMState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -80,6 +82,8 @@ typedef struct CadenceGEMState {
 
     uint8_t can_rx_state; /* Debug only */
 
+    uint8_t tx_packet[MAX_FRAME_SIZE];
+    uint8_t rx_packet[MAX_FRAME_SIZE];
     uint32_t rx_desc[MAX_PRIORITY_QUEUES][DESC_MAX_NUM_WORDS];
 
     bool sar_active[4];
-- 
2.5.0


