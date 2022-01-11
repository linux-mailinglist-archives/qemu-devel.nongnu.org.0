Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4E48B68B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:13:34 +0100 (CET)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MaK-00051R-B2
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7j-0004FV-JE; Tue, 11 Jan 2022 13:43:59 -0500
Received: from [2a00:1450:4864:20::433] (port=42943
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7h-00060L-Uh; Tue, 11 Jan 2022 13:43:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id k30so17132475wrd.9;
 Tue, 11 Jan 2022 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VcdXVqz6chAbbBWxyWqxGtBbnwx8MK1lJ9E6AYBD0J0=;
 b=WCga5ihu7X+b6Vu7V2KWJp1tqsisVwnzmHlfKRDvB5BUd4XMTwXMai6rLr0BRDoF+P
 eH4NZUkw0kJTbTDckZR2mtMCucSlbNnbU64TG4VujsbYnyFXdRGbgh5L43uMoRI6bveJ
 Qc3Iumo7kFqsMZd+5ExW6+PmZPPCAF8hRvqrkHRl2Qj27sWKYAZDP6MCwHs6ZBTT9a7c
 yBFU+nQ/RmLttPuw31hClIELdTN4hSELp9MbF8WsSwvCyQ3BLdV745ULOEXGra+hIyVz
 bQARd2m+RHZmdsuZgw6qA8rbh9Lx/X5/Bhq5PbbztmSnZKLgLkNmrwE/0dUNkaqeoDy2
 UgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VcdXVqz6chAbbBWxyWqxGtBbnwx8MK1lJ9E6AYBD0J0=;
 b=tukvNQDbKheOynNiF9BjGNVZ1+qZM2DN03I1eNkh8IBOBx2ZynKCfFX4WfihmY5DMZ
 EoQyi/Ld3eaNtAnGcEshVGtB1oJvkyMeIRdlahnqohtc8wjG/MbDpBEXTf2iLOYsz3bf
 PEox5yrHgidcyDWp/k8bVf9mTYNGU5In/lkMTWjImzGzNy2UHbP7A4DDTEdRHfq0PrYQ
 Hl3HghRkxXWpLSibWJeNYKq/AAdB9ZTbnuaShoMrC0LEjqjQP6UulWvfec6ydg6WIovC
 D2bT61GCCbErGJqDMpZPXdF3Uji1dvsmwphzfHjG61dookktpwMwczIei74D1ywC8YwN
 DQOA==
X-Gm-Message-State: AOAM533BLTTX7MlEZx5njtUSh/xUkgVXuSMmuEmfaMnQQ42oAfQGPJe2
 TY7/Y8fCaHIddsGLFSjxgJO0tnd+H1OohQ==
X-Google-Smtp-Source: ABdhPJy1fYqWWmVVL498VuL/kDUZZB+sa2gbQPMKEnvYQ+/rT3/2SxhQ8V2rZdZ8Xh5YX95G/nkKOA==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr4986177wrd.234.1641926636072; 
 Tue, 11 Jan 2022 10:43:56 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id o13sm10619113wrc.111.2022.01.11.10.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/10] hw/dma: Move ScatterGatherEntry / QEMUSGList
 declarations around
Date: Tue, 11 Jan 2022 19:43:08 +0100
Message-Id: <20220111184309.28637-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next commit we will use the dma_addr_t type in the QEMUSGList
structure. Since currently dma_addr_t is defined after QEMUSGList,
move the declarations to have dma_addr_t defined first. This is a
pure code-movement patch.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/dma.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 0db2478a506..c992d9d5d6b 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -15,22 +15,11 @@
 #include "block/block.h"
 #include "block/accounting.h"
 
-typedef struct ScatterGatherEntry ScatterGatherEntry;
-
 typedef enum {
     DMA_DIRECTION_TO_DEVICE = 0,
     DMA_DIRECTION_FROM_DEVICE = 1,
 } DMADirection;
 
-struct QEMUSGList {
-    ScatterGatherEntry *sg;
-    int nsg;
-    int nalloc;
-    size_t size;
-    DeviceState *dev;
-    AddressSpace *as;
-};
-
 /*
  * When an IOMMU is present, bus addresses become distinct from
  * CPU/memory physical addresses and may be a different size.  Because
@@ -43,6 +32,17 @@ typedef uint64_t dma_addr_t;
 #define DMA_ADDR_BITS 64
 #define DMA_ADDR_FMT "%" PRIx64
 
+typedef struct ScatterGatherEntry ScatterGatherEntry;
+
+struct QEMUSGList {
+    ScatterGatherEntry *sg;
+    int nsg;
+    int nalloc;
+    size_t size;
+    DeviceState *dev;
+    AddressSpace *as;
+};
+
 static inline void dma_barrier(AddressSpace *as, DMADirection dir)
 {
     /*
-- 
2.34.1


