Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55B45EBCE0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:12:43 +0200 (CEST)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5hp-0005eH-Rp
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od537-0003Yr-3i
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od533-0001hO-GS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uiLtQ7op7uNuXOe4ggw13CBcCs3U+ChvC4yFgB0L8wc=;
 b=D/M+n7346p+znjzzsf+1FXY2FqlU9z41hTYYgrcKUBi0HlkEqnS5J5giwbt8v6Y4VanmbY
 LXiM376sMoHOOqWQWTMC/Ta/Ctw5XUcOi+B7lkzyuET1RjZ2sikzbo3DHcDyv05Jhmh0Ow
 9cDEo9xU+09Z80z3Sp4GWV8NOM1+E4g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-gL7JNTJ0N1WjckI-YYsm_g-1; Tue, 27 Sep 2022 03:30:31 -0400
X-MC-Unique: gL7JNTJ0N1WjckI-YYsm_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED8F638164CD;
 Tue, 27 Sep 2022 07:30:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 412952166B26;
 Tue, 27 Sep 2022 07:30:27 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	stefanha@redhat.com
Cc: Ding Hui <dinghui@sangfor.com.cn>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 1/8] e1000e: set RX desc status with DD flag in a separate
 operation
Date: Tue, 27 Sep 2022 15:30:15 +0800
Message-Id: <20220927073022.28378-2-jasowang@redhat.com>
In-Reply-To: <20220927073022.28378-1-jasowang@redhat.com>
References: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ding Hui <dinghui@sangfor.com.cn>

Like commit 034d00d48581 ("e1000: set RX descriptor status in
a separate operation"), there is also same issue in e1000e, which
would cause lost packets or stop sending packets to VM with DPDK.

Do similar fix in e1000e.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/402
Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 82aa61f..fc9cdb4 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1364,6 +1364,57 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
     }
 }
 
+static inline void
+e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
+                             uint8_t *desc, dma_addr_t len)
+{
+    PCIDevice *dev = core->owner;
+
+    if (e1000e_rx_use_legacy_descriptor(core)) {
+        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
+        size_t offset = offsetof(struct e1000_rx_desc, status);
+        uint8_t status = d->status;
+
+        d->status &= ~E1000_RXD_STAT_DD;
+        pci_dma_write(dev, addr, desc, len);
+
+        if (status & E1000_RXD_STAT_DD) {
+            d->status = status;
+            pci_dma_write(dev, addr + offset, &status, sizeof(status));
+        }
+    } else {
+        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
+            union e1000_rx_desc_packet_split *d =
+                (union e1000_rx_desc_packet_split *) desc;
+            size_t offset = offsetof(union e1000_rx_desc_packet_split,
+                wb.middle.status_error);
+            uint32_t status = d->wb.middle.status_error;
+
+            d->wb.middle.status_error &= ~E1000_RXD_STAT_DD;
+            pci_dma_write(dev, addr, desc, len);
+
+            if (status & E1000_RXD_STAT_DD) {
+                d->wb.middle.status_error = status;
+                pci_dma_write(dev, addr + offset, &status, sizeof(status));
+            }
+        } else {
+            union e1000_rx_desc_extended *d =
+                (union e1000_rx_desc_extended *) desc;
+            size_t offset = offsetof(union e1000_rx_desc_extended,
+                wb.upper.status_error);
+            uint32_t status = d->wb.upper.status_error;
+
+            d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
+            pci_dma_write(dev, addr, desc, len);
+
+            if (status & E1000_RXD_STAT_DD) {
+                d->wb.upper.status_error = status;
+                pci_dma_write(dev, addr + offset, &status, sizeof(status));
+            }
+        }
+    }
+}
+
 typedef struct e1000e_ba_state_st {
     uint16_t written[MAX_PS_BUFFERS];
     uint8_t cur_idx;
@@ -1600,7 +1651,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
         e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
-        pci_dma_write(d, base, &desc, core->rx_desc_len);
+        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
 
         e1000e_ring_advance(core, rxi,
                             core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
-- 
2.7.4


