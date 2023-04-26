Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CD76EF22B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:38:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcWk-0007Zz-NK; Wed, 26 Apr 2023 06:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWi-0007ZK-9H
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:32 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWg-0002i5-GY
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:31 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so8910790b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505449; x=1685097449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/pDwl8AWifWnquycf9eti2pt0sVkbePe+g+hr0tUgQ=;
 b=qTjoz4Kcjzgk6XpvtKa4u6mV4KvKzisduE6VVwVIC0fscvdYUie+/lgNaCr11uuqG4
 glEmRG1CtqsantQcniuTI/l4rSbdZq16aUJz2JNHu8J8OXRJDmP6LEZ8N9QfidGxpq5K
 vvlpn0IUuoaK4CumdmKkh+SqYVvkwHKrOSywV1jh0bmI0PYHcWFTuU6NTKtp/4QLDrFo
 0fd3cy3EErX6VKufhgXsSJDNX+zQoWRhY/boEmr3KdWsWwF1DuteHnKHygHwM3adcq+1
 VdTcvS/tXEG6m3T9X9iQ56neFrYuLpPc56PtIYi43cbAR/d89xCUQ/S1BiYiX2BB42Gh
 u2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505449; x=1685097449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/pDwl8AWifWnquycf9eti2pt0sVkbePe+g+hr0tUgQ=;
 b=ei0WiMTgydAvRsd1XGHApf1AsbiHd9N2hhkjzH5B7vgHfYek3pwlkoynDq4FN8gmoR
 0HQfYpvj2I7LZBpdGrgj19Y+ZJIwpvMo5pMkK8oGG/mQkJsyh3PTF+sVfbr40vV2TYcQ
 aYkSPPZHj+xQDv23hqqwrsPIAY0C1i6lNLs1xJOO36JVTgo6Cj76S0QZTMzeqNLHN+ts
 HuW8fMRJ8TUxhnnj8QfqX3ztzrkWH1nGCDCzrSi0IcJYZrOAL1pscouxetGmcDC3MAec
 WxwekDH+XcSkmHKQ/sHCmMWTLAIwVJxBHKy32yJ+jLq6yiS5S3CaiQYW6Uqu7VpK5x3P
 wNOQ==
X-Gm-Message-State: AAQBX9eq4iS14qGGrUqxSp8P8ZehJOz9zfyEAQwsRxMjYIR2d4d/w6xe
 7/jhJblnXhufA3N7scuinwHbXQ==
X-Google-Smtp-Source: AKy350YdBDZNuN95DUe+wkztT0W+JGkOR5S5rm/eOxgmNF/qLDSBRHvm5dSWQ7NCZ91hiu95qwCT3g==
X-Received: by 2002:a05:6a21:7889:b0:f0:42b4:d428 with SMTP id
 bf9-20020a056a21788900b000f042b4d428mr25452429pzc.61.1682505449070; 
 Wed, 26 Apr 2023 03:37:29 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:37:28 -0700 (PDT)
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
Subject: [PATCH v4 01/48] hw/net/net_tx_pkt: Decouple implementation from PCI
Date: Wed, 26 Apr 2023 19:36:29 +0900
Message-Id: <20230426103716.26279-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

This is intended to be followed by another change for the interface.
It also fixes the leak of memory mapping when the specified memory is
partially mapped.

Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.h |  9 ++++++++
 hw/net/net_tx_pkt.c | 53 ++++++++++++++++++++++++++++-----------------
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index e5ce6f20bc..5eb123ef90 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -153,6 +153,15 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt);
  */
 void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
 
+/**
+ * Unmap a fragment mapped from a PCI device.
+ *
+ * @context:        PCI device owning fragment
+ * @base:           pointer to fragment
+ * @len:            length of fragment
+ */
+void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len);
+
 /**
  * Send packet to qemu. handles sw offloads if vhdr is not supported.
  *
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 8dc8568ba2..aca12ff035 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -384,10 +384,9 @@ void net_tx_pkt_setup_vlan_header_ex(struct NetTxPkt *pkt,
     }
 }
 
-bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
-    size_t len)
+static bool net_tx_pkt_add_raw_fragment_common(struct NetTxPkt *pkt,
+                                               void *base, size_t len)
 {
-    hwaddr mapped_len = 0;
     struct iovec *ventry;
     assert(pkt);
 
@@ -395,23 +394,12 @@ bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
         return false;
     }
 
-    if (!len) {
-        return true;
-     }
-
     ventry = &pkt->raw[pkt->raw_frags];
-    mapped_len = len;
+    ventry->iov_base = base;
+    ventry->iov_len = len;
+    pkt->raw_frags++;
 
-    ventry->iov_base = pci_dma_map(pkt->pci_dev, pa,
-                                   &mapped_len, DMA_DIRECTION_TO_DEVICE);
-
-    if ((ventry->iov_base != NULL) && (len == mapped_len)) {
-        ventry->iov_len = mapped_len;
-        pkt->raw_frags++;
-        return true;
-    } else {
-        return false;
-    }
+    return true;
 }
 
 bool net_tx_pkt_has_fragments(struct NetTxPkt *pkt)
@@ -465,8 +453,9 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
         assert(pkt->raw);
         for (i = 0; i < pkt->raw_frags; i++) {
             assert(pkt->raw[i].iov_base);
-            pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base,
-                          pkt->raw[i].iov_len, DMA_DIRECTION_TO_DEVICE, 0);
+            net_tx_pkt_unmap_frag_pci(pkt->pci_dev,
+                                      pkt->raw[i].iov_base,
+                                      pkt->raw[i].iov_len);
         }
     }
     pkt->pci_dev = pci_dev;
@@ -476,6 +465,30 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
     pkt->l4proto = 0;
 }
 
+void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len)
+{
+    pci_dma_unmap(context, base, len, DMA_DIRECTION_TO_DEVICE, 0);
+}
+
+bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
+    size_t len)
+{
+    dma_addr_t mapped_len = len;
+    void *base = pci_dma_map(pkt->pci_dev, pa, &mapped_len,
+                             DMA_DIRECTION_TO_DEVICE);
+    if (!base) {
+        return false;
+    }
+
+    if (mapped_len != len ||
+        !net_tx_pkt_add_raw_fragment_common(pkt, base, len)) {
+        net_tx_pkt_unmap_frag_pci(pkt->pci_dev, base, mapped_len);
+        return false;
+    }
+
+    return true;
+}
+
 static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt,
                                   struct iovec *iov, uint32_t iov_len,
                                   uint16_t csl)
-- 
2.40.0


