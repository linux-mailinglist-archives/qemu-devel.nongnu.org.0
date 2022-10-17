Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1716015EB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 20:05:16 +0200 (CEST)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okUUF-0007Zh-6u
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 14:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1okUOQ-00026G-H0
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:59:15 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1okUON-00073K-VS
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:59:13 -0400
Received: by mail-qt1-x82a.google.com with SMTP id h24so7870559qta.7
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5x4dBfAZ68fvL+9myHdMYj1PuVW+JTaBlIoAiFAXd+M=;
 b=ljIJt6j5KWZE6TJvhz9dR0cl5kyY7OsQDB2JwAgR+RwCrTSRkJg4Bb9HBsH1PzTMBT
 stXusIx1JgdftkdDjSO4ICL9ltfVm2NfrimPNXPQHMT8HsUy9vmIFJLElDqNDrn6keOi
 FC2zZHh1AZZxPJ4zrsDiBp+31s1SAUpmAipFjpt8gh1ASvgs1/cGObpP7mpD9Pwy/6BW
 Wfq3Vt708a9jfCzRduLd6R0izf+QHPxFjPHKCkQMijVc8n0Z8Yy48oyyzTQsebh8iLtK
 AYRaXpUasxdfubdpVOuMR2SHhW+GWFsYBHEWrt7Yw4MDta0Nnx6t/dsAJpWOMQZxF24u
 XXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5x4dBfAZ68fvL+9myHdMYj1PuVW+JTaBlIoAiFAXd+M=;
 b=lVmVJ1Ek8QM5xGGGX2OiPxWXrnTUxfxyY1wXbEzvts8A8COUqpWXr5F9FL5nQp4O88
 9bVafl5MQ1AZdDEimwRQ4Hmp1deNvo9FTH7Rakq08CPNwfEAYZDGTEgEYgxGX1Uk1OOj
 GKA4i6hh+yRfqbS80v1ctTLKBWl1W7lBZrbSBMXLO//a+yKiW2614GQPyIAtUJ8dMcPs
 TmwGXQ2Icf8SabtCE3Z5hSmV0SYUZsgojHSiui45zxJeUeTssIxklXCkWLX36PAsqWKp
 4KS9eZCNenHZjBDXVMBMNMij8UhztJMcmnCDtB5zLB+kpDZHU8xV4vW/Q/ik43G38Lbp
 TEVw==
X-Gm-Message-State: ACrzQf29V5E3679gTXylGLf0S3uPaXV/BQ5OOyiqFEGaWdKUKgio/Bmo
 XvClySBpvvP8SBYYrY3TZ3MjeV0W7Uitgw==
X-Google-Smtp-Source: AMsMyM4ThfaUg/uX7JDQsfLzb48w5ByACa9tfKDzKzRMdbnw15AXfcFew6DGM/cRX/+hKNrKQYAy0A==
X-Received: by 2002:a05:622a:2d0:b0:395:e96a:8eeb with SMTP id
 a16-20020a05622a02d000b00395e96a8eebmr10066477qtx.176.1666029549496; 
 Mon, 17 Oct 2022 10:59:09 -0700 (PDT)
Received: from ChristophersAir.hitronhub.home ([2001:1970:50d6:9900::765d])
 by smtp.gmail.com with ESMTPSA id
 r2-20020ae9d602000000b006ceb933a9fesm291685qkk.81.2022.10.17.10.59.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Oct 2022 10:59:08 -0700 (PDT)
From: Chris Friedt <chrisfriedt@gmail.com>
X-Google-Original-From: Chris Friedt <cfriedt@meta.com>
To: qemu-devel@nongnu.org
Cc: cfriedt@meta.com,
	jslaby@suse.cz
Subject: [PATCH v3 2/2] hw: misc: edu: rename local vars in edu_check_range
Date: Mon, 17 Oct 2022 13:58:29 -0400
Message-Id: <20221017175829.92074-2-cfriedt@meta.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221017175829.92074-1-cfriedt@meta.com>
References: <20221017175829.92074-1-cfriedt@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This serves to make the local variables a bit less ambiguous.

The latter two arguments are named to match DMA_START, and
DMA_SIZE.

Signed-off-by: Chris Friedt <cfriedt@meta.com>
---
 hw/misc/edu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index b3de8d206a..52afbd792a 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -103,24 +103,24 @@ static void edu_lower_irq(EduState *edu, uint32_t val)
     }
 }
 
-static void edu_check_range(uint64_t addr, uint64_t size1,
-                uint64_t start, uint64_t size2)
+static void edu_check_range(uint64_t xfer_start, uint64_t xfer_size,
+                uint64_t dma_start, uint64_t dma_size)
 {
-    uint64_t end1 = addr + size1;
-    uint64_t end2 = start + size2;
+    uint64_t xfer_end = xfer_start + xfer_size;
+    uint64_t dma_end = dma_start + dma_size;
 
     /*
      * 1. ensure we aren't overflowing
-     * 2. ensure that [addr, end1) is within [start, size2)
+     * 2. ensure that xfer is within dma address range
      */
-    if (end2 >= start && end1 >= addr &&
-        addr >= start && end1 <= end2) {
+    if (dma_end >= dma_start && xfer_end >= xfer_start &&
+        xfer_start >= dma_start && xfer_end <= dma_end) {
         return;
     }
 
     hw_error("EDU: DMA range 0x%016"PRIx64"-0x%016"PRIx64
              " out of bounds (0x%016"PRIx64"-0x%016"PRIx64")!",
-            addr, end1 - 1, start, end2 - 1);
+            xfer_start, xfer_end - 1, dma_start, dma_end - 1);
 }
 
 static dma_addr_t edu_clamp_addr(const EduState *edu, dma_addr_t addr)
-- 
2.36.1


