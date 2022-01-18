Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B849259B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:20:44 +0100 (CET)
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nTf-0000C7-Qh
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:20:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEJ-0006C4-M0; Tue, 18 Jan 2022 07:05:01 -0500
Received: from [2a00:1450:4864:20::331] (port=35388
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEC-0005tp-Qm; Tue, 18 Jan 2022 07:04:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso5299445wmj.0; 
 Tue, 18 Jan 2022 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFVlmnRPeTBD8lOSH8frg7WRVHFkQ8F3wW1ER1eNd50=;
 b=QY8mujHBXD5kQ8UvjT3oiwbEcNXqMllJYeu5nq5ERBr87KYi8LUGzH4aTLSGYW8Pjb
 NGSRum5ucFCx/Bm7/Pr6erpgCEWqc3pcTnQYn1f1JvLCt8vnye8OGeoljZO3sXQA8O8z
 jbzvDLxsacAitt8fhUqt+aZSIV447tgnWmX5A/a+mBYUONGrlaKPhXY7GmNWn9toL4g4
 ygEE9C6XtpdBZOHwPVr06aA/FiS837MLIvYNCjy/U/WLROt6GOSnMIaTXm6RUDb67qks
 TNaAa2IaxMUNK6efCEloN/+MyU7P6Y7JOveGEk5Hce9+0uO+DN6qPAygmkbig7djKFp5
 4sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iFVlmnRPeTBD8lOSH8frg7WRVHFkQ8F3wW1ER1eNd50=;
 b=Od9syoG5DMChw4p2RMRg+D/UA1wJZtUEGwges+vEj1lNiiKDnenEJZBOQZNi9FnmvH
 KE9Ma+tJowkKBrOER5zQ0dM3BAT7VgylaZBQB5prrxc2J28JYGkq68buJtY7VwvrBHUp
 AFUxEFCT9+qpNuwHn0PdYS/HZnALhGHvDjumlmuhso+oic2e6hpBNCfZqms0vTgAjdOj
 sJUcj5lg4TxSOB0S6mQ5eLdvh8co07ydkCuz7+a2I830Rh3kOT5Hi4ICZ6mUD311l54d
 6CD8fkSgaK1qxctoAPBY4MtJw/bQrO9757GgqpGWEhWk689vXe1LDteTX9VlSLlZnjem
 gsbA==
X-Gm-Message-State: AOAM530Yi/KODH1DpaAMl3yLR5M7Md2vwzVE5qWx0014xx+ZGtrHqO4V
 L9JxL4j53+THIP91yMSO8noIY3hp2Gw=
X-Google-Smtp-Source: ABdhPJyKQkpTKFZqMOzFfBCZTokOb9fFWWiwOAIbY1DjsTbFbUbqzr85dpoKX64wlImftwegHZgQNg==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr9982918wrd.231.1642507428205; 
 Tue, 18 Jan 2022 04:03:48 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 e15sm5487832wrg.85.2022.01.18.04.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:47 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 16/19] hw/dma: Move ScatterGatherEntry / QEMUSGList
 declarations around
Date: Tue, 18 Jan 2022 13:02:26 +0100
Message-Id: <20220118120229.196337-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

In the next commit we will use the dma_addr_t type in the QEMUSGList
structure. Since currently dma_addr_t is defined after QEMUSGList,
move the declarations to have dma_addr_t defined first. This is a
pure code-movement patch.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111184309.28637-10-f4bug@amsat.org>
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


