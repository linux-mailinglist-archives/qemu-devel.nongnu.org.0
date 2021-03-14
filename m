Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72B33A840
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:35:31 +0100 (CET)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYOY-0006Jx-2D
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH7-0006Af-8X
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:50 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH4-0008FX-UY
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:48 -0400
Received: by mail-qk1-x72b.google.com with SMTP id 130so29879780qkh.11
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sT6m1DvpyLSK/jDOR0ljz9XPvbGUXpvhChthbdvn53o=;
 b=IeOquCASz++uCfIdkVxgpsokUq3b6/XFmUwxxHnNoDlD/Keo8t8Aupy+esjdmvOxPK
 k1qLAeD9nKE2Udc3HW41gY499a+FF7kKTu89jC1qfcFA6syooUgYg8tXClPWDND+yeQc
 t3n3sXxb+hwEqyggy9aw6VSth3q7wZpdFOPioZPmsSdSGCLHQX8/GESD7Kty0YC+Ph7x
 JjngljYuHVyysLmCb2AcPkuxUYhrgZGoa8zLo/zSA9x2UW6c1xgNhKP4p+a4OnmUhEii
 wj1/+1y6GtUgxkb2rfBuc9OOM7tcV1AXgJsY+7csl4qPuBpluO+YCHqnDShhqx8O2TYC
 jwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sT6m1DvpyLSK/jDOR0ljz9XPvbGUXpvhChthbdvn53o=;
 b=nIVrWcOxipi+Mo/H+Fl9z/+dUT+wYyCMTXedb9l34zobkxHQOawEYRd8Ir8uUK7zHf
 oGM/an0cTwdhX1i7BaGDJKMMrftiI8/q+RYRzDGZY5edipKzFoOVzBh/qYHhOSj01gtq
 7U7bdtt+UY66yID1ZLRo+wBDwxAFEW/2nUPeVGtd0dZLHskBpaTrZWxYFDSe308udjUY
 k4oexXfiISiJ0iJgo0s2LkllT4Qg3bF76Le1tAh7sGg+le0TSTfCWHvAPsIAOSLYDAVP
 2Bxt5BMqEmlplw8sqQlZMigwMQf1SEwxXVQppwWpiRDe2qFMIP/vzZ2Z6SXLRW8J0ghH
 A5uw==
X-Gm-Message-State: AOAM531tBWE5SyU+E+iqEMC6RowHqFtAzER1tsoHXW8R6dLlW+3XIM4d
 F/SOAimX65ECGeFhFE8gnfFzNIwGkum4yZHA
X-Google-Smtp-Source: ABdhPJz2qk/nm4DqEav8rl8SKLbeZdZtz7x70fefLczJYoApEwyMau8xFljjggHxFr3GE2M4OsBuJw==
X-Received: by 2002:a05:620a:14f:: with SMTP id
 e15mr22266912qkn.315.1615757265954; 
 Sun, 14 Mar 2021 14:27:45 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/29] tcg: Rename region.start to region.after_prologue
Date: Sun, 14 Mar 2021 15:27:12 -0600
Message-Id: <20210314212724.1917075-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give the field a name reflecting its actual meaning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 8e4dd0480b..23261561a1 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -46,8 +46,8 @@ struct tcg_region_state {
     QemuMutex lock;
 
     /* fields set at init time */
-    void *start;
     void *start_aligned;
+    void *after_prologue;
     size_t total_size; /* size of entire buffer */
     size_t n;
     size_t size; /* size of one region */
@@ -276,7 +276,7 @@ static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
     end = start + region.size;
 
     if (curr_region == 0) {
-        start = region.start;
+        start = region.after_prologue;
     }
     if (curr_region == region.n - 1) {
         end = region.start_aligned + region.total_size;
@@ -851,7 +851,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     region.n = n_regions;
     region.size = region_size - page_size;
     region.stride = region_size;
-    region.start = buf;
+    region.after_prologue = buf;
     region.start_aligned = aligned;
     /* page-align the end, since its last page will be a guard page */
     end = QEMU_ALIGN_PTR_DOWN(buf + total_size, page_size);
@@ -888,15 +888,16 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 void tcg_region_prologue_set(TCGContext *s)
 {
     /* Deduct the prologue from the first region.  */
-    g_assert(region.start == s->code_gen_buffer);
-    region.start = s->code_ptr;
+    g_assert(region.start_aligned == s->code_gen_buffer);
+    region.after_prologue = s->code_ptr;
 
     /* Recompute boundaries of the first region. */
     tcg_region_assign(s, 0);
 
     /* Register the balance of the buffer with gdb. */
-    tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.start_aligned + region.total_size - region.start);
+    tcg_register_jit(tcg_splitwx_to_rx(region.after_prologue),
+                     region.start_aligned + region.total_size -
+                     region.after_prologue);
 }
 
 /*
-- 
2.25.1


