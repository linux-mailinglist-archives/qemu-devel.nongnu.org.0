Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D248B67E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:08:10 +0100 (CET)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MV7-0000ZS-F5
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:08:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7W-00044j-VL; Tue, 11 Jan 2022 13:43:47 -0500
Received: from [2a00:1450:4864:20::335] (port=39896
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7T-0005z8-H7; Tue, 11 Jan 2022 13:43:45 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso2012085wma.4; 
 Tue, 11 Jan 2022 10:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+lDAXEOTcm4u7MlOE1caLxtILFoWnaSvPcbQGLiji8=;
 b=JC0/+LYchDEJIrqYSOW/9UfetmvgTgvO5ZhnBDTvUX/0ZZzC1ZIsVierhl7+dBROx7
 If17DzWgT6jJeAB7K//dBBlg3uAkGld0iIqvFNfBrh5A8nw1rwY/GKfgfHhYnFB+SiFq
 C0cPXZSUcXh1bmmEzGMJjoIGp4AbfVN1JkP9LyiaFoZueslE/QDzRW1l45Zcs0DEO7uu
 5rBbtvdyjDye5iDHPtPPc0ZJrT2Mm7IBQod51EvxKjkpUqm2R8gaNAP9hE2lTgX96rH3
 GJhzIoErOWPrUzM7RPPfXiWbRiz+BjCsvRv06bZIoXFGgaBXH29Le7kYh0MgLJU/zLUw
 Zpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h+lDAXEOTcm4u7MlOE1caLxtILFoWnaSvPcbQGLiji8=;
 b=7XivVedkAWff8zCwQprJWb+OhwojNKFHmLz/9QI8GTtn0XtzKduZh3vDjQp8xVzh8H
 TeIleR70yzlkjY+jO+5UD8RhXcoL4qtRhym4OY1LkdV5k1IUOwqRJFW1Mb/mt64EyAT/
 fdTnir4iKmibCscLGXU6yY3a0zKUXS7QkytCiwu2oMaPsRJjqhrKKmJqaNalFUpjUCsS
 Ld1iylQgeBKOeTAZbwbI6gIDrsHoG2LD1PAOsZZ254agg+JFI9JS/baqWr88XvYOlC+U
 2RYt3gbYzjkANb67asx6mhTZoYGpjta8k0UtrsSe1BsyQqKt6eNyCteYC7Z85lzYNdaY
 oh7g==
X-Gm-Message-State: AOAM533ZJv/QyqOgNUR0CC0iBOJpp1B/LXi2vlIrYooMTLlrX1ySq/f2
 fk4pmKOb4Y4nRVwubPk8oXECY7VQ2K8clQ==
X-Google-Smtp-Source: ABdhPJyJWow6mrIf71LqkIIiyDhO1LLcZzexX3QTCwpP5nefautqjiIS9Rkj1xRnzyYLBvxrr81HAA==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr3724346wmk.191.1641926621389; 
 Tue, 11 Jan 2022 10:43:41 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id 1sm10888427wrb.13.2022.01.11.10.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/10] hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len'
 argument
Date: Tue, 11 Jan 2022 19:43:05 +0100
Message-Id: <20220111184309.28637-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Various APIs use 'pval' naming for 'pointer to val'.
rdma_pci_dma_map() uses 'plen' for 'PCI length', but since
'PCI' is already explicit in the function name, simplify
and rename the argument 'len'. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.34.1


