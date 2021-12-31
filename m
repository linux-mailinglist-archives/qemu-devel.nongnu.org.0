Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E514823D7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:55:25 +0100 (CET)
Received: from localhost ([::1]:40540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GVI-0001aE-Ga
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:55:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPZ-0002gb-RS
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPY-0000Jp-DJ
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1gWXzHHA08XyBDnum+yCmIoN801ZHiVaEGOwmKagUU=;
 b=ABH04GNglu3j6Lq4pGtyi5DMAD+CPh6ehvvfAK/YQpNNWVBDJA0FQd79WKAD9lm/+66sz8
 1QFSYhI7yFoLLQBRMSZE6J7nyqXBeOvxYdBRAOVlQZCKGWMORkdUZyMHM1bCk/EWR9BJqR
 edwtU9oz6PXHihCvipSHTRVrtTLwRx0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-PrDHAPf6Ofac7ZZ728YxpQ-1; Fri, 31 Dec 2021 06:49:26 -0500
X-MC-Unique: PrDHAPf6Ofac7ZZ728YxpQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so7446593wrm.8
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1gWXzHHA08XyBDnum+yCmIoN801ZHiVaEGOwmKagUU=;
 b=UX9+mrB3ZwDqSqB+1TYX9KEDNJxJ1VNhjSM5FCpecucvf2G8gAhyhUwZXrVKzHkP4/
 XL/rnwX/4Jpt6tk5rWMsxLLkWnaTHAbNxYVFWMpIcoEIci8v6JTgYUsLr934VCJpbbOZ
 7RwrlAVjkGgkrZCCymJbpN0CCieB+k596g1/wXz8oMGFjI8l71m5asyD96m72216iY0N
 bXcA7djPMhmoqnQO+xVythafK2CmdAsmnSg8YxtmmCxosk/6O4a9h7i1x1oRNjLARbGx
 02Wy4wYXPRK8e6gTW8HNhRqRZnQ9NSXOiTaGbAWBdIH5E2mZL3OsgDf0hJmPM409wMxd
 QQIw==
X-Gm-Message-State: AOAM531f/qHTXB5wxFYYYuanx8Ik1diMTy4Vpgl/Ipa+mrWVG0CVWJ65
 JVBLRyst+eqIffFjjCQhowSmBrnYCEx4LjI3/9lirzJaPsxxgiFuF5wZsCbV2vaAkjOn8e2hngl
 iF1YZVAtvdrT4dU8qJLPdzyS44BFRDTrNkSXE0Z6O1DFJWZjApzSO3eIx/1I2/2pd
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr30217561wrz.350.1640951365627; 
 Fri, 31 Dec 2021 03:49:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk1PB0CJ5V9w98GPEgQGppaZfUg+L1brKLinrifqfcLoq4u//4eSk3Tj3jBGG9MHrHO+v/9Q==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr30217546wrz.350.1640951365458; 
 Fri, 31 Dec 2021 03:49:25 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id p18sm37592945wmq.0.2021.12.31.03.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len' argument
Date: Fri, 31 Dec 2021 12:48:58 +0100
Message-Id: <20211231114901.976937-6-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231114901.976937-1-philmd@redhat.com>
References: <20211231114901.976937-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various APIs use 'pval' naming for 'pointer to val'.
rdma_pci_dma_map() uses 'plen' for 'PCI length', but since
'PCI' is already explicit in the function name, simplify
and rename the argument 'len'. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/rdma/rdma_utils.h |  2 +-
 hw/rdma/rdma_utils.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
index 9fd0efd940b..0c6414e7e0a 100644
--- a/hw/rdma/rdma_utils.h
+++ b/hw/rdma/rdma_utils.h
@@ -38,7 +38,7 @@ typedef struct RdmaProtectedGSList {
     GSList *list;
 } RdmaProtectedGSList;
 
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen);
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len);
 void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len);
 void rdma_protected_gqueue_init(RdmaProtectedGQueue *list);
 void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list);
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 98df58f6897..61cb8ede0fd 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -17,29 +17,29 @@
 #include "trace.h"
 #include "rdma_utils.h"
 
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)
 {
     void *p;
-    hwaddr len = plen;
+    hwaddr pci_len = len;
 
     if (!addr) {
         rdma_error_report("addr is NULL");
         return NULL;
     }
 
-    p = pci_dma_map(dev, addr, &len, DMA_DIRECTION_TO_DEVICE);
+    p = pci_dma_map(dev, addr, &pci_len, DMA_DIRECTION_TO_DEVICE);
     if (!p) {
         rdma_error_report("pci_dma_map fail, addr=0x%"PRIx64", len=%"PRId64,
-                          addr, len);
+                          addr, pci_len);
         return NULL;
     }
 
-    if (len != plen) {
-        rdma_pci_dma_unmap(dev, p, len);
+    if (pci_len != len) {
+        rdma_pci_dma_unmap(dev, p, pci_len);
         return NULL;
     }
 
-    trace_rdma_pci_dma_map(addr, p, len);
+    trace_rdma_pci_dma_map(addr, p, pci_len);
 
     return p;
 }
-- 
2.33.1


