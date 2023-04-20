Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A46E89B8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9C-0006qW-O6; Thu, 20 Apr 2023 01:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN8y-0006ks-6z
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:45 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN8w-000126-Gf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:43 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-24986ade373so491324a91.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969661; x=1684561661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/pDwl8AWifWnquycf9eti2pt0sVkbePe+g+hr0tUgQ=;
 b=tVhd0bCD1hcM3fyRecqrpCpnFYwnLILgBXThtL9sdTfGJghQSEUtIvAE89iTPBqPn1
 KrJiCuKXdDUnluJpQftqXteMUS/5mFla1WgfHnLzcUs6rQT8aerW8yaHE7lIwAoUnKfk
 3fk5hLRxfTPk0aJLHzloKwaGhpafHbvlLjCREPXIP919ajJybzgwx4MYt2+de9WZn3I0
 1QmmN2doHjg1LxTadKD0Fjjza12wb7VYMQwaFHvnWRaSiqpZ/I1plaC/+2Z7YMLhHMg1
 JQcK6KWpQ92prbVHcWXJmJTjHGPRVr6aJ2WSAaWpOVJyDK9BVS0GEUXssbptxUI2k8SB
 3+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969661; x=1684561661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/pDwl8AWifWnquycf9eti2pt0sVkbePe+g+hr0tUgQ=;
 b=E4+ucdxEwHFVDadFwpl6bclUEMnzzY9fayduJ7rNGiMutPvm4ahEqiWlXWuOJidy0H
 NSJ8tpfAiG+xL8qD/XnoL2+pS1bYeqHBavYqS96us4zq5gLqUqa02DpcjtcgfpA69NdL
 cxGTCys1dVwcQAPYXyP14gjopNnO7tWtzCE6V6b5p7wce0ipbUTcV2rswvoAK3A99RWS
 738UIZuWJjZwiEDL3CvZWBLZijUx0kv9Xu/MZ2kmxa3kGk05EbZdNQO50YGDHezssQgd
 TDT8dW+jhGAIvF7QrssYzBKBv/igEwurkl2bbjn7FlAh8zsS+pTyIVGowlDk7mdFodJM
 SK7A==
X-Gm-Message-State: AAQBX9fyfr8/V5MDXag/glIZgxry4LXjPIAZaXrnH3GiGiP0URKQIbro
 LQP4e7ixo9HQr+oxgV/jSqvA0A==
X-Google-Smtp-Source: AKy350bL5Y6aXnuAt1VzlB5ZDyi2FzsTRx0M1+Nt6hHPpiVznH89GuXrotNV+5pEogcLZNQYWhUbMQ==
X-Received: by 2002:a17:90a:dd89:b0:247:271:c3f4 with SMTP id
 l9-20020a17090add8900b002470271c3f4mr620113pjv.2.1681969661194; 
 Wed, 19 Apr 2023 22:47:41 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:47:40 -0700 (PDT)
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
Subject: [PATCH v2 01/41] hw/net/net_tx_pkt: Decouple implementation from PCI
Date: Thu, 20 Apr 2023 14:46:17 +0900
Message-Id: <20230420054657.50367-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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


