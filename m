Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DA49258F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:17:43 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nQk-0002qS-Jg
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEJ-0006C3-6X; Tue, 18 Jan 2022 07:05:00 -0500
Received: from [2a00:1450:4864:20::32f] (port=39627
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEC-0005tB-Pe; Tue, 18 Jan 2022 07:04:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso5173640wma.4; 
 Tue, 18 Jan 2022 04:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LH1np9mC2V/eUKzC6Bkjy+7mnVJOayOIQUCd7oM8o9s=;
 b=U4bnjt30y5BZpwtBtsgul8P5+WJaUsyJMcRL9xt9c7IwagHgosPZpmofBf8yzgdXer
 5YsKPWmJH3yCmdEry7ZAP0+fGiSgzs9kocfQWfsPd91iB8KgoepIOWSNfJDnexWvWoap
 nxMKtHgVzyd0q620I3UUDuwcLYhMrvzN9LPI+9MPaHn2d4m0iw9UZNEXhITmKTuCY7J0
 ZU6o1EsRjQlRxMYTT+5p4BYEpa1c+BIFEs6AYt3lvTLY4C8Pr8SiSU6KsaVb3k26RGZH
 6UzdUa7mWskJcHqBS6DPwbzo1g2xUQZRkftmjwjAMSiMbBzolA0gCDKOBPgwZ2+v0TeY
 6N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LH1np9mC2V/eUKzC6Bkjy+7mnVJOayOIQUCd7oM8o9s=;
 b=Pe4vwJkheKg0NwDyPHIWQuB8naZ7cQqxFsvCnmsJesZskwrLatyMH0Ov58cIznEznb
 7kW1DooJhQvSgJ9tfUyxmkuS487z49tnGjM979z2X9LD9hGk8N1zFxTsK/SOSauJdyBq
 1Z27J0OGiTiXfYY2FygFQjZj3QIe7ZOP3nxh/HVTQ9o05dwKSBq1dT1Q+cUiD285MSyR
 j6e48yEIHsWUDcprt/f7ZGu1046GuHPHgF2vUy9jIQqNw7xljpUvY1LmOz3HcTvgoGN1
 D7EF5qrXbPP2mG4W9BhhDYlgMc0env2I2qnTNWVYDkPVEtbJGuX7t9l/UdGFPEBm+EiO
 r9eQ==
X-Gm-Message-State: AOAM530yjGJXSeBzx3/M2FLptKwIwzI9kYv7XE0bK3OwvTsANIyrc30E
 CxOlihWshsvEUr/faZrQ4UYApy6SDlI=
X-Google-Smtp-Source: ABdhPJy8RvtjoWCRRiXB4vExUoY2PnEpXsEipkrsNiGZHHRbfsHc3yvWQCP2wbiMSwDPiyGX0znGjQ==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr14092719wry.539.1642507413777; 
 Tue, 18 Jan 2022 04:03:33 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 y8sm937781wrd.11.2022.01.18.04.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:33 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 13/19] hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len'
 argument
Date: Tue, 18 Jan 2022 13:02:23 +0100
Message-Id: <20220118120229.196337-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Various APIs use 'pval' naming for 'pointer to val'.
rdma_pci_dma_map() uses 'plen' for 'PCI length', but since
'PCI' is already explicit in the function name, simplify
and rename the argument 'len'. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Message-Id: <20220111184309.28637-7-f4bug@amsat.org>
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


