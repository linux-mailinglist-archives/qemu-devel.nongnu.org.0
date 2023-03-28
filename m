Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30376CB5EF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:21:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph1kT-0005Xt-Dp; Tue, 28 Mar 2023 01:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1kQ-0005XS-Ld
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1kP-0007bd-41
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679980792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EulvcD2xcd8txQWrr+P8YjkLdWOwLCZY7LaApO2iQ5s=;
 b=OHjyPygugKATT2MedqIWJx5IhAOcHAGhC3d++XXqh6TUrh4h5mygnGZmGeScsXLpcWFHk0
 A9fIe6YMMojwmgsnVNOoCRv3+KMowNgXFxKvABHnhty4LCCIFxZ9z+x+HDyYIZ98zivn0r
 wZs78GzHiKHI54Zof5Nb8t8odKhVAqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-c4qSVUbQNcSrj9H-gzvxqA-1; Tue, 28 Mar 2023 01:19:48 -0400
X-MC-Unique: c4qSVUbQNcSrj9H-gzvxqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 670C080D08D;
 Tue, 28 Mar 2023 05:19:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-204.pek2.redhat.com
 [10.72.13.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FA57202701E;
 Tue, 28 Mar 2023 05:19:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 09/12] igb: check oversized packets for VMDq
Date: Tue, 28 Mar 2023 13:19:14 +0800
Message-Id: <20230328051917.18006-10-jasowang@redhat.com>
In-Reply-To: <20230328051917.18006-1-jasowang@redhat.com>
References: <20230328051917.18006-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/igb_core.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 753f17b..38aa459 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -921,12 +921,26 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
+static bool
+igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
+{
+    uint16_t pool = qn % IGB_NUM_VM_POOLS;
+    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
+    int max_ethernet_lpe_size =
+        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
+    int max_ethernet_vlan_size = 1522;
+
+    return size > (lpe ? max_ethernet_lpe_size : max_ethernet_vlan_size);
+}
+
 static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
-                                   E1000E_RSSInfo *rss_info, bool *external_tx)
+                                   size_t size, E1000E_RSSInfo *rss_info,
+                                   bool *external_tx)
 {
     static const int ta_shift[] = { 4, 3, 2, 0 };
     uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
     uint16_t queues = 0;
+    uint16_t oversized = 0;
     uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci) & VLAN_VID_MASK;
     bool accepted = false;
     int i;
@@ -1026,9 +1040,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         }
 
         queues &= core->mac[VFRE];
-        igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
-        if (rss_info->queue & 1) {
-            queues <<= 8;
+        if (queues) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
+                    oversized |= BIT(i);
+                }
+            }
+            /* 8.19.37 increment ROC if packet is oversized for all queues */
+            if (oversized == queues) {
+                trace_e1000x_rx_oversized(size);
+                e1000x_inc_reg_if_not_full(core->mac, ROC);
+            }
+            queues &= ~oversized;
+        }
+
+        if (queues) {
+            igb_rss_parse_packet(core, core->rx_pkt,
+                                 external_tx != NULL, rss_info);
+            if (rss_info->queue & 1) {
+                queues <<= 8;
+            }
         }
     } else {
         switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
@@ -1576,7 +1607,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.7.4


