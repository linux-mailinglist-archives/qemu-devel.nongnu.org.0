Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E666EBCF8
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:26:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqREb-0008Hk-W6; Sun, 23 Apr 2023 00:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDm-0006M7-OO
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:11 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDf-0001M1-W3
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:05 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-51f6461af24so2633060a12.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223659; x=1684815659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUASrVPY9bBz/EN5xysffHy9wsKX/LQEO5dQ1No285o=;
 b=bGdFK9QWHuAbIxkRRTnBO3tB2Jt6Y/7vKe6wmZ/MWMRXjgoxgeVcx3EI6o9r8ut9Ks
 k9s8IWifRRZ12NfFLZgXe6hH0PamHb/tYzKqbD+sIekS69NSeZ61iPTYZCIxlLJT52Af
 BxfINoLu0DxprYoOoShtZU1rZ+bjoOS02/yRY73pVcJRr+MD3c+cmbsfLpB/z6c6ta9a
 jrkZRfSxyyJV11fRTaj6PY2onBDLcQOjVNPoqtbHysayM+7pYBJHlOQ2oFnIEf1S5Qj7
 g7LiQxOIg0Hx9kcoOex2uUlFyW7RZkR+rDBNegNkmFkOHskdCbKhT/ANxauana7oPybQ
 d70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223659; x=1684815659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUASrVPY9bBz/EN5xysffHy9wsKX/LQEO5dQ1No285o=;
 b=KPLoqJ1TrXKYug9neC6cNfA6OgJVETOpkhS8v0XV16yBEb1A08fElhXExy/9c0yWnH
 efhNUtijXEuAsW10nHNu5w/qjutkMSNI2GNHfqChyeNK9XVS8s5dAiO1WKmEdnVvEYjr
 dHoxIqfAsy5XI8XsgiKwYTt14dzXVtQXD9rT5j7etwiFw4GdzhFYfmyp9LwUN6fCL5G6
 DL78W0tteEm0+jLJHIVC8La5471c8nj1wjpBSiRJTT62ejBDpERrac+HOnutPoYPxiiD
 Kl8wprqj9XqBXRqatuO0GjTKYkf05yYzHz29CuNybuaOUlC0j/pC1wBcSUKiJnu2cbDj
 DLuA==
X-Gm-Message-State: AAQBX9c5ldp67AnodmyYwV89k8U9Plhn9eZomx7BfX0NcCEWkgxScu3K
 CLyd4AIXnPJNdu/BsRjCb00IfQ==
X-Google-Smtp-Source: AKy350ZLe0ZQtvn2yDpOkCDZZCIpFDsWGXR2wenm8ouLsMFuXRCW46+ZqQkjAB3PgEQ4qmKZ8idPEg==
X-Received: by 2002:a17:902:d492:b0:1a9:3447:71fb with SMTP id
 c18-20020a170902d49200b001a9344771fbmr12049490plg.39.1682223658787; 
 Sat, 22 Apr 2023 21:20:58 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 40/47] igb: Implement igb-specific oversize check
Date: Sun, 23 Apr 2023 13:18:26 +0900
Message-Id: <20230423041833.5302-41-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

igb has a configurable size limit for LPE, and uses different limits
depending on whether the packet is treated as a VLAN packet.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 667ff47701..16c563cf36 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -980,16 +980,13 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
-static bool
-igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
+static bool igb_rx_is_oversized(IGBCore *core, const struct eth_header *ehdr,
+                                size_t size, size_t vlan_num,
+                                bool lpe, uint16_t rlpml)
 {
-    uint16_t pool = qn % IGB_NUM_VM_POOLS;
-    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
-    int max_ethernet_lpe_size =
-        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
-    int max_ethernet_vlan_size = 1522;
-
-    return size > (lpe ? max_ethernet_lpe_size : max_ethernet_vlan_size);
+    size_t vlan_header_size = sizeof(struct vlan_header) * vlan_num;
+    size_t header_size = sizeof(struct eth_header) + vlan_header_size;
+    return lpe ? size + ETH_FCS_LEN > rlpml : size > header_size + ETH_MTU;
 }
 
 static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
@@ -1002,6 +999,8 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     uint16_t queues = 0;
     uint16_t oversized = 0;
     size_t vlan_num = 0;
+    bool lpe;
+    uint16_t rlpml;
     int i;
 
     memset(rss_info, 0, sizeof(E1000E_RSSInfo));
@@ -1021,6 +1020,14 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         }
     }
 
+    lpe = !!(core->mac[RCTL] & E1000_RCTL_LPE);
+    rlpml = core->mac[RLPML];
+    if (!(core->mac[RCTL] & E1000_RCTL_SBP) &&
+        igb_rx_is_oversized(core, ehdr, size, vlan_num, lpe, rlpml)) {
+        trace_e1000x_rx_oversized(size);
+        return queues;
+    }
+
     if (vlan_num &&
         !e1000x_rx_vlan_filter(core->mac, l2_header->vlan + vlan_num - 1)) {
         return queues;
@@ -1106,7 +1113,11 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         queues &= core->mac[VFRE];
         if (queues) {
             for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
-                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
+                lpe = !!(core->mac[VMOLR0 + i] & E1000_VMOLR_LPE);
+                rlpml = core->mac[VMOLR0 + i] & E1000_VMOLR_RLPML_MASK;
+                if ((queues & BIT(i)) &&
+                    igb_rx_is_oversized(core, ehdr, size, vlan_num,
+                                        lpe, rlpml)) {
                     oversized |= BIT(i);
                 }
             }
@@ -1662,11 +1673,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         iov_to_buf(iov, iovcnt, iov_ofs, &min_buf, sizeof(min_buf.l2_header));
     }
 
-    /* Discard oversized packets if !LPE and !SBP. */
-    if (e1000x_is_oversized(core->mac, size)) {
-        return orig_size;
-    }
-
     net_rx_pkt_set_packet_type(core->rx_pkt,
                                get_eth_packet_type(&min_buf.l2_header.eth));
     net_rx_pkt_set_protocols(core->rx_pkt, iov, iovcnt, iov_ofs);
-- 
2.40.0


