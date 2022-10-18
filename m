Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF85602C12
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:48:35 +0200 (CEST)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okm1J-0002O7-HH
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1oklgp-0003HR-R4
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:27:37 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1oklgo-0000zI-Er
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:27:23 -0400
Received: by mail-qt1-x82b.google.com with SMTP id s3so9474247qtn.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mfjf1Tc7IXcbp2Q6LD7MVGT/R7JEM3N3t6jHDxFPvNA=;
 b=SkSTLt4qXOYN4um5sdUPhZE6lNATHO4/g90ONRSvIEDHN7ND880OHu60UM1Bh9w3aL
 1W156gz5A2e09wRQp5VlGSQNDlbzbJN8xreRY4LXwXMMYeeQEOmJxHaaKtjlsggm78gj
 0NCH2ELyJ2jZzDdnKaZlz9pbjE1JiW0JEpPQP9yR08nyDGkTC1W+wq+FfXtOLY9LaPp/
 FFmas1E9D2uJl81HKRRHuZmTHqMGmn3lfQBtiSpgAZzMuDXU72CtJw7bwPzCG9+HPHB+
 8lFgtnA11inZTKnRWSdT+N8o/PicjRUNeGF/NuDAGaPgEWH4blaN9W52Npb82t/URNkq
 8/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mfjf1Tc7IXcbp2Q6LD7MVGT/R7JEM3N3t6jHDxFPvNA=;
 b=DTwXAbRQzbyO8Td7eQmOvteNBKiQrk2I/BHUYAh/GcBnIRGNEUiXXJZ/UPfOCcHkIJ
 d+gahbizxgXFbYy8hd5eTxSEhNc5ivMHUmILtd5K6+16D7k8cAmNe1/G+jxEguwbm0Jc
 1QYYSwxVH4BZO7c9zYsK9nw1zDKDs2TCH8fOHJL1WKnZF2biIXZiJ6jyzYnzxYQrkc4z
 E0ZNf03as6uI4p8H2hH49krMi8cK6KhvDWVCWuCtOjTeQOVgaw00yL6WX9fw+p26Nv2Q
 w4Lgx9OmEc5nhpFkVaiNKcpH8aJ2PlUReZ1Xi0tw4ly+c3RKt6EJh9Lpa09XYMRfFrhq
 uauw==
X-Gm-Message-State: ACrzQf181xbAHdN+fI6hqPo2cNO9Zawcocjo3ZivIa3ycXxQ9qDUu0z9
 Is19oomqsDnvmjr9oj7S997hRs2spacr5Q==
X-Google-Smtp-Source: AMsMyM7sS/SPtIYhaVyfsJfDQSOd/0OGaufskr6BNrnabNAbN2pQA1LpM+RiM4hizRNJKdSY9lJ9LQ==
X-Received: by 2002:a05:622a:205:b0:39c:de34:b87c with SMTP id
 b5-20020a05622a020500b0039cde34b87cmr1847863qtx.568.1666096039330; 
 Tue, 18 Oct 2022 05:27:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:1970:50d6:9900::a196])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a284700b006ecb9dfdd15sm2276248qkp.92.2022.10.18.05.27.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Oct 2022 05:27:18 -0700 (PDT)
From: Chris Friedt <chrisfriedt@gmail.com>
X-Google-Original-From: Chris Friedt <cfriedt@meta.com>
To: qemu-devel@nongnu.org
Cc: cfriedt@meta.com,
	jslaby@suse.cz
Subject: [PATCH v4 3/3] hw: misc: edu: use qemu_log_mask instead of hw_error
Date: Tue, 18 Oct 2022 08:25:51 -0400
Message-Id: <20221018122551.94567-3-cfriedt@meta.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221018122551.94567-1-cfriedt@meta.com>
References: <20221018122551.94567-1-cfriedt@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qt1-x82b.google.com
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

Log a guest error instead of a hardware error when
the guest tries to DMA to / from an invalid address.

Signed-off-by: Chris Friedt <cfriedt@meta.com>
---
 hw/misc/edu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 52afbd792a..a18f803815 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -118,9 +118,10 @@ static void edu_check_range(uint64_t xfer_start, uint64_t xfer_size,
         return;
     }
 
-    hw_error("EDU: DMA range 0x%016"PRIx64"-0x%016"PRIx64
-             " out of bounds (0x%016"PRIx64"-0x%016"PRIx64")!",
-            xfer_start, xfer_end - 1, dma_start, dma_end - 1);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "EDU: DMA range 0x%016"PRIx64"-0x%016"PRIx64
+                  " out of bounds (0x%016"PRIx64"-0x%016"PRIx64")!",
+                  xfer_start, xfer_end - 1, dma_start, dma_end - 1);
 }
 
 static dma_addr_t edu_clamp_addr(const EduState *edu, dma_addr_t addr)
@@ -128,7 +129,9 @@ static dma_addr_t edu_clamp_addr(const EduState *edu, dma_addr_t addr)
     dma_addr_t res = addr & edu->dma_mask;
 
     if (addr != res) {
-        printf("EDU: clamping DMA %#.16"PRIx64" to %#.16"PRIx64"!\n", addr, res);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "EDU: clamping DMA %#.16"PRIx64" to %#.16"PRIx64"!",
+                      addr, res);
     }
 
     return res;
-- 
2.36.1


