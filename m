Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07636B3AF9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:42:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZAt-0003Lg-Qw; Fri, 10 Mar 2023 04:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAj-0003ED-As
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAh-0008Lp-C4
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678440978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryMCyp1vtep2pPAMJb6ttMSfPr7AAFLitYPp+rHzm1w=;
 b=VYQzONfHQ+8WtoSC6lTXO1PBbnwd1b4WlBc07UNW0nKHNsvCcy9/s7mkQg6Lzk+1sfpe+Y
 W/Me91o3rrZ7oai+siI94DmhdBo6Wyis1Xh419g9TAERFoCfdQKIORU49CLKlPnrk6qBpv
 88wFPDm2iAZd7wSgruB/cwRUpn431H4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-YmAkj9PnM0KIj4DytGNe-w-1; Fri, 10 Mar 2023 04:36:15 -0500
X-MC-Unique: YmAkj9PnM0KIj4DytGNe-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8EB8811E9C;
 Fri, 10 Mar 2023 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEB1D40C1106;
 Fri, 10 Mar 2023 09:36:12 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 16/44] e1000e: Introduce e1000_rx_desc_union
Date: Fri, 10 Mar 2023 17:34:58 +0800
Message-Id: <20230310093526.30828-17-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Before this change, e1000e_write_packet_to_guest() allocated the
receive descriptor buffer as an array of uint8_t. This does not ensure
the buffer is sufficiently aligned.

Introduce e1000_rx_desc_union type, a union type of all receive
descriptor types to correct this.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000_regs.h  |   1 -
 hw/net/e1000e_core.c | 115 +++++++++++++++++++++++++--------------------------
 2 files changed, 57 insertions(+), 59 deletions(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 6a36573..4545fe2 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -1061,7 +1061,6 @@ union e1000_rx_desc_packet_split {
 #define E1000_RING_DESC_LEN_SHIFT (4)
 
 #define E1000_MIN_RX_DESC_LEN   E1000_RING_DESC_LEN
-#define E1000_MAX_RX_DESC_LEN   (sizeof(union e1000_rx_desc_packet_split))
 
 /* Receive Descriptor bit definitions */
 #define E1000_RXD_STAT_DD       0x01    /* Descriptor Done */
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index b867066..d8c17ba 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -55,6 +55,12 @@
 
 #define E1000E_MAX_TX_FRAGS (64)
 
+union e1000_rx_desc_union {
+    struct e1000_rx_desc legacy;
+    union e1000_rx_desc_extended extended;
+    union e1000_rx_desc_packet_split packet_split;
+};
+
 static inline void
 e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
 
@@ -1053,29 +1059,28 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
 }
 
 static inline void
-e1000e_read_lgcy_rx_descr(E1000ECore *core, uint8_t *desc, hwaddr *buff_addr)
+e1000e_read_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
+                          hwaddr *buff_addr)
 {
-    struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
-    *buff_addr = le64_to_cpu(d->buffer_addr);
+    *buff_addr = le64_to_cpu(desc->buffer_addr);
 }
 
 static inline void
-e1000e_read_ext_rx_descr(E1000ECore *core, uint8_t *desc, hwaddr *buff_addr)
+e1000e_read_ext_rx_descr(E1000ECore *core, union e1000_rx_desc_extended *desc,
+                         hwaddr *buff_addr)
 {
-    union e1000_rx_desc_extended *d = (union e1000_rx_desc_extended *) desc;
-    *buff_addr = le64_to_cpu(d->read.buffer_addr);
+    *buff_addr = le64_to_cpu(desc->read.buffer_addr);
 }
 
 static inline void
-e1000e_read_ps_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_read_ps_rx_descr(E1000ECore *core,
+                        union e1000_rx_desc_packet_split *desc,
                         hwaddr (*buff_addr)[MAX_PS_BUFFERS])
 {
     int i;
-    union e1000_rx_desc_packet_split *d =
-        (union e1000_rx_desc_packet_split *) desc;
 
     for (i = 0; i < MAX_PS_BUFFERS; i++) {
-        (*buff_addr)[i] = le64_to_cpu(d->read.buffer_addr[i]);
+        (*buff_addr)[i] = le64_to_cpu(desc->read.buffer_addr[i]);
     }
 
     trace_e1000e_rx_desc_ps_read((*buff_addr)[0], (*buff_addr)[1],
@@ -1083,17 +1088,17 @@ e1000e_read_ps_rx_descr(E1000ECore *core, uint8_t *desc,
 }
 
 static inline void
-e1000e_read_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_read_rx_descr(E1000ECore *core, union e1000_rx_desc_union *desc,
                      hwaddr (*buff_addr)[MAX_PS_BUFFERS])
 {
     if (e1000e_rx_use_legacy_descriptor(core)) {
-        e1000e_read_lgcy_rx_descr(core, desc, &(*buff_addr)[0]);
+        e1000e_read_lgcy_rx_descr(core, &desc->legacy, &(*buff_addr)[0]);
         (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            e1000e_read_ps_rx_descr(core, desc, buff_addr);
+            e1000e_read_ps_rx_descr(core, &desc->packet_split, buff_addr);
         } else {
-            e1000e_read_ext_rx_descr(core, desc, &(*buff_addr)[0]);
+            e1000e_read_ext_rx_descr(core, &desc->extended, &(*buff_addr)[0]);
             (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
         }
     }
@@ -1264,7 +1269,7 @@ func_exit:
 }
 
 static inline void
-e1000e_write_lgcy_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
                            struct NetRxPkt *pkt,
                            const E1000E_RSSInfo *rss_info,
                            uint16_t length)
@@ -1272,71 +1277,66 @@ e1000e_write_lgcy_rx_descr(E1000ECore *core, uint8_t *desc,
     uint32_t status_flags, rss, mrq;
     uint16_t ip_id;
 
-    struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
-
     assert(!rss_info->enabled);
 
-    d->length = cpu_to_le16(length);
-    d->csum = 0;
+    desc->length = cpu_to_le16(length);
+    desc->csum = 0;
 
     e1000e_build_rx_metadata(core, pkt, pkt != NULL,
                              rss_info,
                              &rss, &mrq,
                              &status_flags, &ip_id,
-                             &d->special);
-    d->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
-    d->status = (uint8_t) le32_to_cpu(status_flags);
+                             &desc->special);
+    desc->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
+    desc->status = (uint8_t) le32_to_cpu(status_flags);
 }
 
 static inline void
-e1000e_write_ext_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_ext_rx_descr(E1000ECore *core, union e1000_rx_desc_extended *desc,
                           struct NetRxPkt *pkt,
                           const E1000E_RSSInfo *rss_info,
                           uint16_t length)
 {
-    union e1000_rx_desc_extended *d = (union e1000_rx_desc_extended *) desc;
-
-    memset(&d->wb, 0, sizeof(d->wb));
+    memset(&desc->wb, 0, sizeof(desc->wb));
 
-    d->wb.upper.length = cpu_to_le16(length);
+    desc->wb.upper.length = cpu_to_le16(length);
 
     e1000e_build_rx_metadata(core, pkt, pkt != NULL,
                              rss_info,
-                             &d->wb.lower.hi_dword.rss,
-                             &d->wb.lower.mrq,
-                             &d->wb.upper.status_error,
-                             &d->wb.lower.hi_dword.csum_ip.ip_id,
-                             &d->wb.upper.vlan);
+                             &desc->wb.lower.hi_dword.rss,
+                             &desc->wb.lower.mrq,
+                             &desc->wb.upper.status_error,
+                             &desc->wb.lower.hi_dword.csum_ip.ip_id,
+                             &desc->wb.upper.vlan);
 }
 
 static inline void
-e1000e_write_ps_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_ps_rx_descr(E1000ECore *core,
+                         union e1000_rx_desc_packet_split *desc,
                          struct NetRxPkt *pkt,
                          const E1000E_RSSInfo *rss_info,
                          size_t ps_hdr_len,
                          uint16_t(*written)[MAX_PS_BUFFERS])
 {
     int i;
-    union e1000_rx_desc_packet_split *d =
-        (union e1000_rx_desc_packet_split *) desc;
 
-    memset(&d->wb, 0, sizeof(d->wb));
+    memset(&desc->wb, 0, sizeof(desc->wb));
 
-    d->wb.middle.length0 = cpu_to_le16((*written)[0]);
+    desc->wb.middle.length0 = cpu_to_le16((*written)[0]);
 
     for (i = 0; i < PS_PAGE_BUFFERS; i++) {
-        d->wb.upper.length[i] = cpu_to_le16((*written)[i + 1]);
+        desc->wb.upper.length[i] = cpu_to_le16((*written)[i + 1]);
     }
 
     e1000e_build_rx_metadata(core, pkt, pkt != NULL,
                              rss_info,
-                             &d->wb.lower.hi_dword.rss,
-                             &d->wb.lower.mrq,
-                             &d->wb.middle.status_error,
-                             &d->wb.lower.hi_dword.csum_ip.ip_id,
-                             &d->wb.middle.vlan);
+                             &desc->wb.lower.hi_dword.rss,
+                             &desc->wb.lower.mrq,
+                             &desc->wb.middle.status_error,
+                             &desc->wb.lower.hi_dword.csum_ip.ip_id,
+                             &desc->wb.middle.vlan);
 
-    d->wb.upper.header_status =
+    desc->wb.upper.header_status =
         cpu_to_le16(ps_hdr_len | (ps_hdr_len ? E1000_RXDPS_HDRSTAT_HDRSP : 0));
 
     trace_e1000e_rx_desc_ps_write((*written)[0], (*written)[1],
@@ -1344,20 +1344,21 @@ e1000e_write_ps_rx_descr(E1000ECore *core, uint8_t *desc,
 }
 
 static inline void
-e1000e_write_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_rx_descr(E1000ECore *core, union e1000_rx_desc_union *desc,
 struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
     size_t ps_hdr_len, uint16_t(*written)[MAX_PS_BUFFERS])
 {
     if (e1000e_rx_use_legacy_descriptor(core)) {
         assert(ps_hdr_len == 0);
-        e1000e_write_lgcy_rx_descr(core, desc, pkt, rss_info, (*written)[0]);
+        e1000e_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
+                                   (*written)[0]);
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            e1000e_write_ps_rx_descr(core, desc, pkt, rss_info,
+            e1000e_write_ps_rx_descr(core, &desc->packet_split, pkt, rss_info,
                                       ps_hdr_len, written);
         } else {
             assert(ps_hdr_len == 0);
-            e1000e_write_ext_rx_descr(core, desc, pkt, rss_info,
+            e1000e_write_ext_rx_descr(core, &desc->extended, pkt, rss_info,
                                        (*written)[0]);
         }
     }
@@ -1365,12 +1366,12 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
 
 static inline void
 e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
-                             uint8_t *desc, dma_addr_t len)
+                             union e1000_rx_desc_union *desc, dma_addr_t len)
 {
     PCIDevice *dev = core->owner;
 
     if (e1000e_rx_use_legacy_descriptor(core)) {
-        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
+        struct e1000_rx_desc *d = &desc->legacy;
         size_t offset = offsetof(struct e1000_rx_desc, status);
         uint8_t status = d->status;
 
@@ -1383,8 +1384,7 @@ e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
         }
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            union e1000_rx_desc_packet_split *d =
-                (union e1000_rx_desc_packet_split *) desc;
+            union e1000_rx_desc_packet_split *d = &desc->packet_split;
             size_t offset = offsetof(union e1000_rx_desc_packet_split,
                 wb.middle.status_error);
             uint32_t status = d->wb.middle.status_error;
@@ -1397,8 +1397,7 @@ e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
                 pci_dma_write(dev, addr + offset, &status, sizeof(status));
             }
         } else {
-            union e1000_rx_desc_extended *d =
-                (union e1000_rx_desc_extended *) desc;
+            union e1000_rx_desc_extended *d = &desc->extended;
             size_t offset = offsetof(union e1000_rx_desc_extended,
                 wb.upper.status_error);
             uint32_t status = d->wb.upper.status_error;
@@ -1542,7 +1541,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 {
     PCIDevice *d = core->owner;
     dma_addr_t base;
-    uint8_t desc[E1000_MAX_RX_DESC_LEN];
+    union e1000_rx_desc_union desc;
     size_t desc_size;
     size_t desc_offset = 0;
     size_t iov_ofs = 0;
@@ -1578,7 +1577,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
         trace_e1000e_rx_descr(rxi->idx, base, core->rx_desc_len);
 
-        e1000e_read_rx_descr(core, desc, &ba);
+        e1000e_read_rx_descr(core, &desc, &ba);
 
         if (ba[0]) {
             if (desc_offset < size) {
@@ -1648,9 +1647,9 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
             is_last = true;
         }
 
-        e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
+        e1000e_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
-        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
+        e1000e_pci_dma_write_rx_desc(core, base, &desc, core->rx_desc_len);
 
         e1000e_ring_advance(core, rxi,
                             core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
-- 
2.7.4


