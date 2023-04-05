Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E56D7F49
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:24:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk42n-0006ff-VO; Wed, 05 Apr 2023 10:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pk42m-0006fS-F7
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:23:24 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pk42k-0007kf-Id
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:23:24 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230405142315euoutp01fc3c3d638066f32fa2b907594e20e493~TD_zdzzt92467024670euoutp01k
 for <qemu-devel@nongnu.org>; Wed,  5 Apr 2023 14:23:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230405142315euoutp01fc3c3d638066f32fa2b907594e20e493~TD_zdzzt92467024670euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680704595;
 bh=mbnC4zMMUPY3JfkzKKQ3OOndFoIh4DZWA8IWJz1vi48=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vbZU2j1b+ck5X85XCy+uaKpxGUUqTwDCp6MppNIJHQbFngBP4vHmTWXDPbu9tJqJX
 n42hQJmdulxAu6USVAtV1WSdmYxK1zem4Ewm14i27X05DLZxNW50iXGfRBX2Q6FUbU
 S4G1O0vhfEALdzhmmb+e8Gj2LYTHoWmWkOWDxpS8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230405142315eucas1p2a9d824679b0f6e02e03a55381680308f~TD_zNizri1163611636eucas1p2q;
 Wed,  5 Apr 2023 14:23:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 53.65.09966.3548D246; Wed,  5
 Apr 2023 15:23:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230405142315eucas1p119a1df91ea88687d83e734c3616834dc~TD_y390p52779627796eucas1p1c;
 Wed,  5 Apr 2023 14:23:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230405142315eusmtrp275cffe7b096018bf8de6c8256acbfcfc~TD_y3YFWQ2348123481eusmtrp2i;
 Wed,  5 Apr 2023 14:23:15 +0000 (GMT)
X-AuditID: cbfec7f4-d4fff700000026ee-fd-642d8453bdce
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1F.77.09583.3548D246; Wed,  5
 Apr 2023 15:23:15 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230405142314eusmtip1f548fcf37438d3cad7b48017742b0d05~TD_yLtM0a1045510455eusmtip1N;
 Wed,  5 Apr 2023 14:23:14 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com, jasowang@redhat.com, k.kwiecien@samsung.com
Subject: [PATCH] igb: fix VFs traffic with IOMMU
Date: Wed,  5 Apr 2023 16:23:06 +0200
Message-Id: <20230405142306.1287-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsWy7djP87rBLbopBqfvKVt8PrWW3WLZpc9M
 Fo3z57BaHO/dweLA4nHi7UFWjyfXNjN5vN93lc2jb8sqxgCWKC6blNSczLLUIn27BK6M9lU3
 2AvWSVX8+vuXrYFxjkgXIyeHhICJxIz11xi7GLk4hARWMEpMWtYB5XxhlOhsfMgO4XxmlNj+
 djYzTMuNx91QieWMEt1zV7BBOO1MEg1v+8Cq2ATMJB59mccKYosISEr87joNFmcW8JRY2v4M
 LC4sYCDxcsUbdhCbRUBV4selRrAaXgEniamPH7NDbJOXmHnpOztEXFDi5MwnLBBz5CWat4Jc
 xAVU08ohMXfFQhaIBheJ44vnMkHYwhKvjm+BGiQj8X/nfKh4ucTPs9vYIZpbGCX2TJ0MVWQt
 cWnrT6DrOIA2aEqs36UPEXaUOP6zjx0kLCHAJ3HjrSDEDXwSk7ZNZ4YI80p0tAlBVOtIfNs0
 kw0iLCWx8EYdRNhDYtL/NrAPhQRiJZ49bWGcwKgwC8ljs5A8NgvhhAWMzKsYxVNLi3PTU4uN
 8lLL9YoTc4tL89L1kvNzNzECk8jpf8e/7GBc/uqj3iFGJg7GQ4wSHMxKIryqXVopQrwpiZVV
 qUX58UWlOanFhxilOViUxHm1bU8mCwmkJ5akZqemFqQWwWSZODilGpjEF0/6dvu/fq7ng1Lh
 5NDcY+wcL/YubTqdpBujLO61WdjuTNe1mX9MT7XseqVfcvXCO6lzIqKfN+v681tqrtgUfoBh
 BlNmwBZvrptpux5uuRW81yxV6OuBjOWb2x9xLgn8aGm7NDjwyI47rFLL9FXuvVhvmX7q5Ayn
 vdGXui/v3RqUp7fyodLcN88FjVzY/1kzdJiydR0Q5j90sILtnr/wqVkb5lwyOnqa0S1nx0xG
 iQmpG/syHTgWbwz+vzgvxVRDJtlusrWfdnRS2NPjO+w2nnm8ewLTicXGF24+TmN7OuuabetR
 rRyBfw/Dt1b9d9m0zJ25VeS893374J5ZYQJ8zzr3qGTciNmoeif3+TNTJZbijERDLeai4kQA
 GRJNYpEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsVy+t/xu7rBLbopBrf/8Vp8PrWW3WLZpc9M
 Fo3z57BaHO/dweLA4nHi7UFWjyfXNjN5vN93lc2jb8sqxgCWKD2bovzSklSFjPziElulaEML
 Iz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M9lU32AvWSVX8+vuXrYFxjkgXIyeH
 hICJxI3H3exdjFwcQgJLGSVmPlnPCpGQktjX858dwhaW+HOtiw2iqJVJYtaEo0wgCTYBM4lH
 X+aBNYgISEr87jrNDGIzC/hKzD3yjxHEFhYwkHi54g3YIBYBVYkflxrBangFnCSmPn4MtUBe
 Yual7+wQcUGJkzOfsEDMkZdo3jqbeQIj3ywkqVlIUgsYmVYxiqSWFuem5xYb6RUn5haX5qXr
 JefnbmIEhu+2Yz+37GBc+eqj3iFGJg7GQ4wSHMxKIryqXVopQrwpiZVVqUX58UWlOanFhxhN
 ge6byCwlmpwPjKC8knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQam
 rW/XCB9ZcHuh0L47765ujhM6ua8lvKIqavLMN4dm3zzg/VY99/WxiC0XTZlcEjI02R6mi8YF
 fQrSYxDXj//1+uT/2SuKnhaJOdyYHVYwdTPvoy2z5rL4zl4Z1pj+6pF92ofE2FPfb27feTwy
 IOXBIxab7Z8XBFyu+LLE9etz3jsXrc65Pwmueiez8ExCkffFj/Kyk+5w+CR3Gb/MMb5Wn/Xh
 oVFR6kK/Z+2bzVdOks28emifQN/hxCsTTPS1xOSn/FrKLp6S+l7fU+7r1xSD4mvCc3d6hJya
 4eTMWH/MiaWu6sOFRS5P1UzWcB7P3PMp4aKc6OcHD597OXVZbK5mmnv2X5js++fLMi55fJ95
 8ZUSS3FGoqEWc1FxIgCWSQpU6AIAAA==
X-CMS-MailID: 20230405142315eucas1p119a1df91ea88687d83e734c3616834dc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230405142315eucas1p119a1df91ea88687d83e734c3616834dc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230405142315eucas1p119a1df91ea88687d83e734c3616834dc
References: <CGME20230405142315eucas1p119a1df91ea88687d83e734c3616834dc@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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

Use proper PCI device for net_tx_pkt provided to
net_tx_pkt_add_raw_fragment.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/igb.c      |  8 ++++++++
 hw/net/igb_core.c | 47 +++++++++++++++++++++++++++++++++++++++++------
 hw/net/igb_core.h |  3 +++
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/hw/net/igb.c b/hw/net/igb.c
index c6d753df87..a67497ff48 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -97,11 +97,19 @@ struct IGBState {
 static void igb_write_config(PCIDevice *dev, uint32_t addr,
     uint32_t val, int len)
 {
+    uint16_t num_vfs_curr;
     IGBState *s = IGB(dev);
+    PCIESriovPF *pf = &dev->exp.sriov_pf;
 
+    uint16_t num_vfs_prev = pf->num_vfs;
     trace_igb_write_config(addr, val, len);
     pci_default_write_config(dev, addr, val, len);
 
+    num_vfs_curr = pf->num_vfs;
+    if (num_vfs_curr != num_vfs_prev) {
+        igb_core_num_vfs_change_handle(&s->core);
+    }
+
     if (range_covers_byte(addr, len, PCI_COMMAND) &&
         (dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
         igb_start_recv(&s->core);
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index a7c7bfdc75..e1b99f312b 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -3810,24 +3810,59 @@ igb_vm_state_change(void *opaque, bool running, RunState state)
     }
 }
 
+static void
+igb_core_init_queues_tx_packet(IGBCore *core)
+{
+    PCIDevice *dev;
+    int i;
+
+    for (i = 0; i < IGB_NUM_QUEUES; i++) {
+        dev = pcie_sriov_get_vf_at_index(core->owner, i % 8);
+        if (!dev) {
+            dev = core->owner;
+        }
+
+        net_tx_pkt_init(&core->tx[i].tx_pkt, dev, E1000E_MAX_TX_FRAGS);
+    }
+}
+
+static void
+igb_core_uninit_queues_tx_packet(IGBCore *core)
+{
+    int i;
+
+    for (i = 0; i < IGB_NUM_QUEUES; i++) {
+        net_tx_pkt_reset(core->tx[i].tx_pkt);
+        net_tx_pkt_uninit(core->tx[i].tx_pkt);
+    }
+}
+
+static void
+igb_core_reinit_queues_tx_packet(IGBCore *core)
+{
+    igb_core_uninit_queues_tx_packet(core);
+    igb_core_init_queues_tx_packet(core);
+}
+
+void
+igb_core_num_vfs_change_handle(IGBCore *core)
+{
+    igb_core_reinit_queues_tx_packet(core);
+}
+
 void
 igb_core_pci_realize(IGBCore        *core,
                      const uint16_t *eeprom_templ,
                      uint32_t        eeprom_size,
                      const uint8_t  *macaddr)
 {
-    int i;
-
     core->autoneg_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
                                        igb_autoneg_timer, core);
     igb_intrmgr_pci_realize(core);
 
     core->vmstate = qemu_add_vm_change_state_handler(igb_vm_state_change, core);
 
-    for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
-    }
-
+    igb_core_init_queues_tx_packet(core);
     net_rx_pkt_init(&core->rx_pkt);
 
     e1000x_core_prepare_eeprom(core->eeprom,
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index 814c1e264b..8a32195d74 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -143,4 +143,7 @@ igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt);
 void
 igb_start_recv(IGBCore *core);
 
+void
+igb_core_num_vfs_change_handle(IGBCore *core);
+
 #endif
-- 
2.25.1


