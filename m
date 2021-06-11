Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6AE3A4B90
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:00:57 +0200 (CEST)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr56-00077Y-7e
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmm-0002mh-Le
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:00 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmj-0002gr-JX
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:00 -0400
Received: by mail-pf1-x434.google.com with SMTP id x73so5687480pfc.8
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MbFhWXhNwq6PG/hB7MohFhOazYLOvAHs1WJapBuDbmg=;
 b=AnShf189ta5981zcmxajc7/xV5Or5tg65ztR9jtcOwHFzSXNxPAmrDLHSVspV265f2
 8yfAzyYMspWQ0z2g4WFwqj/VXTfw66BC9coz0BcRIW4IkulPCNPKAReRgFRnz6o4CS0q
 MMGj152ICJPLjK/CbAC5nsuUC3DE9hUnexXxjaT9wbHNnb7hTe5AS92xlH66hVP/R3aY
 Jn9ZtoL2aiQcAG3pitT9/ZzYdJBTGwJOECAF5xg8GYCFQUauLos/A2lNsjiKHYt18p/q
 3ZCpcUSUrJNvVbyrO8oZAQ1D97qCQYeMoXULsgX7q9UapzUrRwh/gy+mzQ0nENep8Mnh
 tYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MbFhWXhNwq6PG/hB7MohFhOazYLOvAHs1WJapBuDbmg=;
 b=YbjBQ5WI9mejTDE9IAAm0svA4v3Ox/NQq3YxCSE1YKTX6pvL+IuaqP39cTrH4y79Ci
 tjy6HAtcl/kv76t908A0Z+MrwZiqACJQo2sVAl6XYPJm9Y7/Fn9vWgy5mH5ovFopJKpe
 /qRotmui3Mezkgwgwg94EBTGntd3jfQeBFjO26PkEAn02zWzC1C5C9B9lL0qSqUuD9Pv
 IbUQoUmkT+FSYiVdN40i+baQJZH8+dtg2XIuzJnX0fAQsZ6f9g5Me8CFHLropQLFpzsA
 NMF57sTXemjGRtQFlS6l0hHf1NqkD2qyNxD5RICFVnSRPHW4gFO1QnKP4XS1PKF8Fc+9
 DUNQ==
X-Gm-Message-State: AOAM5327xHIi46s9kXZ6nAoIZdD/A/wr2eL56KGcvTTiw8oBA+gB3zov
 xTnryEhvM9ZiZptzV0xMv3qeVNikTk/8Tg==
X-Google-Smtp-Source: ABdhPJxDvvzxsBS+ImSVE7iC8Zf36rjttIULwQCqa6gxwKJhMDZIk+YOzeM/5JaY9OVz2uqFi6G8QQ==
X-Received: by 2002:a05:6a00:10:b029:2f5:9339:1e8c with SMTP id
 h16-20020a056a000010b02902f593391e8cmr9819647pfk.42.1623454916351; 
 Fri, 11 Jun 2021 16:41:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/34] tcg: Rename region.start to region.after_prologue
Date: Fri, 11 Jun 2021 16:41:28 -0700
Message-Id: <20210611234144.653682-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give the field a name reflecting its actual meaning.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 7a34c96d74..b143eaf69c 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -46,8 +46,8 @@ struct tcg_region_state {
     QemuMutex lock;
 
     /* fields set at init time */
-    void *start;
     void *start_aligned;
+    void *after_prologue;
     size_t n;
     size_t size; /* size of one region */
     size_t stride; /* .size + guard size */
@@ -276,7 +276,7 @@ static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
     end = start + region.size;
 
     if (curr_region == 0) {
-        start = region.start;
+        start = region.after_prologue;
     }
     /* The final region may have a few extra pages due to earlier rounding. */
     if (curr_region == region.n - 1) {
@@ -855,7 +855,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     region.n = n_regions;
     region.size = region_size - page_size;
     region.stride = region_size;
-    region.start = buf;
+    region.after_prologue = buf;
     region.start_aligned = aligned;
     /* page-align the end, since its last page will be a guard page */
     end = QEMU_ALIGN_PTR_DOWN(buf + total_size, page_size);
@@ -895,15 +895,16 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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


