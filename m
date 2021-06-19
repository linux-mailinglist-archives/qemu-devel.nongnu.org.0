Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CA3ADB15
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:28:19 +0200 (CEST)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luelW-0006Iv-C5
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejq-0003QR-Oe
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:34 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejo-0003ZX-VC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:34 -0400
Received: by mail-pl1-x634.google.com with SMTP id x19so6305368pln.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LWmu+dTNMI/txdqEE+yhKRacDvD3OHPjYjOyiCQwuBU=;
 b=Pe1bii0hzAhdzwxZvdgGicTQVdxn9y1NX/fJyGjWNCeWLSkaBeu6NKCw4YLgXxMsCC
 35gORmYnhmODWDuEKIFOS4qbR1bnHygtE0FZgTu8AOK/TEgb3zkMo2VQ6NI8TsQQroxV
 4v1eNrX1vyZRKbyHg7kY8igTPuzmJmFI+r7s5RjgM4usN0Jx8Ah9GXk8/zU92RtRrlyn
 d1dYusNiGkzG0+WWnfQpK9oZJgvr10imvlXTnbqZybESLn+eNEZqqksHRhqGSt0kGl+U
 XhfVUTWa6neaAck1d0jYtJ4uOAC2bWA4WNlae1YXUm1s9F15VJm5XoTN5yickoDDfqAW
 63HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LWmu+dTNMI/txdqEE+yhKRacDvD3OHPjYjOyiCQwuBU=;
 b=q/bUXvtZJ7QtJMlOD2mzXKT0Hojx+xmWsXA+ELvk4CACqV9mWkDwsrXfH6WYwrluMK
 bsPeue1dMZCWhySOrQ2tWDXfUI5ndwXq4NBzeNfS2DnXwRE68EPLEv75C/zu/ZwWDPir
 GV11HY5Fc3ZNcFenFZzvmZ2NtWV25UF1UizRsAo8Znq2acRI9EsMhnLWfjscg+jq+VS6
 FQHBk3h/YsbbuPAyFphN/tq3V4S//awgXp8AlmXh7FkFVHroSLuUAH2sd4cloJqnVRT4
 t4or+NxijQzXMVSIT2u1Mvf+1KiAAASr+FFX9FKsB6dwXqbV1/TbBqvaYP7qcsIDaY0G
 6jTA==
X-Gm-Message-State: AOAM533TWSQ78og+Ej/h6wOQKa/ibdpchPFBJDDbIQpbH1EHqBw6SznO
 X+a5J9htxTTd+Gj/Ry4qorR8CwhAs/7zGg==
X-Google-Smtp-Source: ABdhPJzXpu2vPipW8fUlzXv7Fjsqf8lcTwUw4vR9fHpGP04xhs1XKev2yjYohE6GA9v8QFlcTW4WYg==
X-Received: by 2002:a17:90b:4c44:: with SMTP id
 np4mr17625046pjb.121.1624123591786; 
 Sat, 19 Jun 2021 10:26:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/15] softmmu/memory: Inline memory_region_dispatch_read1
Date: Sat, 19 Jun 2021 10:26:17 -0700
Message-Id: <20210619172626.875885-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inline the body into the only caller of this function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/memory.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index f0161515e9..744c5a80bd 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1408,29 +1408,6 @@ bool memory_region_access_valid(MemoryRegion *mr,
     return true;
 }
 
-static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
-                                                hwaddr addr,
-                                                uint64_t *pval,
-                                                unsigned size,
-                                                MemTxAttrs attrs)
-{
-    *pval = 0;
-
-    if (mr->ops->read) {
-        return access_with_adjusted_size(addr, pval, size,
-                                         mr->ops->impl.min_access_size,
-                                         mr->ops->impl.max_access_size,
-                                         memory_region_read_accessor,
-                                         mr, attrs);
-    } else {
-        return access_with_adjusted_size(addr, pval, size,
-                                         mr->ops->impl.min_access_size,
-                                         mr->ops->impl.max_access_size,
-                                         memory_region_read_with_attrs_accessor,
-                                         mr, attrs);
-    }
-}
-
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
@@ -1445,7 +1422,20 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
         return MEMTX_DECODE_ERROR;
     }
 
-    r = memory_region_dispatch_read1(mr, addr, pval, size, attrs);
+    *pval = 0;
+    if (mr->ops->read) {
+        r = access_with_adjusted_size(addr, pval, size,
+                                      mr->ops->impl.min_access_size,
+                                      mr->ops->impl.max_access_size,
+                                      memory_region_read_accessor,
+                                      mr, attrs);
+    } else {
+        r = access_with_adjusted_size(addr, pval, size,
+                                      mr->ops->impl.min_access_size,
+                                      mr->ops->impl.max_access_size,
+                                      memory_region_read_with_attrs_accessor,
+                                      mr, attrs);
+    }
     adjust_endianness(mr, pval, op);
     return r;
 }
-- 
2.25.1


