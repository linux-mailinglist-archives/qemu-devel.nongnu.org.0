Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AC56F5217
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6to-0005JE-8v; Wed, 03 May 2023 03:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tf-0004yi-1U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6td-0005aZ-7C
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso49291785e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098848; x=1685690848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVmsUx5trCwxWekmTd1RE9Nb9Hhxj1t4Uos0U6OmJ/w=;
 b=bVSLDY45RGiOBfftG04a09IoZOCmGZmec7YAo23an3gGw8yPPBgBGT4h+Sv6Nod2eM
 cPX98h7wRm5qJpkrneIPFt1uuyfnwl9cVXCv+6KsWQL5tTZdcdqyGSeiaBCe1q2dKQyE
 MkzicHXdat+YymOIrIMLXLY/LhDjnPJXN72BqIKbc0mWAXTqesZX0TeQOAMBz2mr+K2u
 i+MXgqAj5Nc9KlqmmGCCiS3kiIPGSdDgm04NKabQx6WxU/JlaQzPuxEfjQKoE8fd8QJh
 iM9dHC02PGPO69Xua6otJzPuuq4KzAfABZ93bSLZoVUa1Tqh2oth3b6z7LslcECbd/2f
 dd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098848; x=1685690848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVmsUx5trCwxWekmTd1RE9Nb9Hhxj1t4Uos0U6OmJ/w=;
 b=dwhM4qVdCAe4feCwEha/lX4nf0fA0GMWef7vqpUSEOem8JbBiBE3bOdH67N0OXc/4t
 8JkyxVLpAHVDXbDqiRpz5e7PKgzzqHBkAw5DocZLDDan2/LlpXUyG6oCPjHF8MvyMJxQ
 fPAnhFVHOXR7vsHJCTy7yoag1mEDgnnxFRZRjcByq5aGJxk1fU5dZMSgJ46c2ACUCRzP
 nbnn9yLHRdhTW3rNpNHMDgiBTXFtg1xev6LpyK2RSCRSS0OjFLx8K+PFTlGf2nNN526C
 2BbfHEEYSNIbGIJ2iVuUXz7vdsEwkZ5J66fINQmF5WWVor8F+CMtk/E0QC3YsjgXq0jD
 pYqg==
X-Gm-Message-State: AC+VfDy8BKpLjceUN/kpzr3GzOv2qeOmEohAtCqVcEnuLWcD2nZLA8HB
 zM4y2m83ywJ8yzfE8UxtS+dZIgptLijf8UWlH+WwDw==
X-Google-Smtp-Source: ACHHUZ5ohmmlRegKPuUBJg9OuO3NGYiz3FntmnoqwvXb6m7NSlGngFEMGIofdQ4uIBFbPl8HQSETeg==
X-Received: by 2002:adf:f551:0:b0:306:2fd3:2eeb with SMTP id
 j17-20020adff551000000b003062fd32eebmr6490341wrp.12.1683098848425; 
 Wed, 03 May 2023 00:27:28 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 74/84] tcg: Fix PAGE/PROT confusion
Date: Wed,  3 May 2023 08:23:21 +0100
Message-Id: <20230503072331.1747057-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The bug was hidden because they happen to have the same values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 34ac124081..184e684b04 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -507,6 +507,14 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     return PROT_READ | PROT_WRITE;
 }
 #elif defined(_WIN32)
+/*
+ * Local source-level compatibility with Unix.
+ * Used by tcg_region_init below.
+ */
+#define PROT_READ   1
+#define PROT_WRITE  2
+#define PROT_EXEC   4
+
 static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
     void *buf;
@@ -527,7 +535,7 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
     region.start_aligned = buf;
     region.total_size = size;
 
-    return PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    return PROT_READ | PROT_WRITE | PROT_EXEC;
 }
 #else
 static int alloc_code_gen_buffer_anon(size_t size, int prot,
@@ -796,10 +804,10 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
      * buffer -- let that one use hugepages throughout.
      * Work with the page protections set up with the initial mapping.
      */
-    need_prot = PAGE_READ | PAGE_WRITE;
+    need_prot = PROT_READ | PROT_WRITE;
 #ifndef CONFIG_TCG_INTERPRETER
     if (tcg_splitwx_diff == 0) {
-        need_prot |= PAGE_EXEC;
+        need_prot |= PROT_EXEC;
     }
 #endif
     for (size_t i = 0, n = region.n; i < n; i++) {
@@ -809,9 +817,9 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
         if (have_prot != need_prot) {
             int rc;
 
-            if (need_prot == (PAGE_READ | PAGE_WRITE | PAGE_EXEC)) {
+            if (need_prot == (PROT_READ | PROT_WRITE | PROT_EXEC)) {
                 rc = qemu_mprotect_rwx(start, end - start);
-            } else if (need_prot == (PAGE_READ | PAGE_WRITE)) {
+            } else if (need_prot == (PROT_READ | PROT_WRITE)) {
                 rc = qemu_mprotect_rw(start, end - start);
             } else {
                 g_assert_not_reached();
-- 
2.34.1


