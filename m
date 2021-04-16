Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CFF362887
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:21:14 +0200 (CEST)
Received: from localhost ([::1]:43316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXU1h-0006oK-KI
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThm-0003qY-6R
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:38 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThS-0004LI-PE
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:37 -0400
Received: by mail-pg1-x533.google.com with SMTP id w10so19823024pgh.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHk5nVHWEzvUPbJqkpxdTXVHC+WlIvNKPTV6ov5dVNQ=;
 b=tVFp49xi/mYyOMV0Pgrbax8MhuVM3A8UD6UCyYg07pTfJmNGXHUmJp7K6j5P41x5NK
 18vL3YVnVj3M7/HEA8ZWcLMYXBVQrxA8tNhMwIjfboX9hZQcmwPxYzR3uzobjAuU8y97
 Bl2MvIZiyPV53SCMB1ojjCrKrkXirQcuo0/UHHd68Kuox6fPJO9L+blkRbzohjO9cKur
 ZA99/WDcrViuxWt4oFI/lE2CWPfhUU1veuAvFEu3MH6CaScxu+38X0rjY10yvaz5WLhT
 agCBjVY9ESfxPbBtFf9X3hvin6rcGBtrzhvGfeX5nL3w1afqe6S4I+2MmUYRo35yuzj7
 5ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHk5nVHWEzvUPbJqkpxdTXVHC+WlIvNKPTV6ov5dVNQ=;
 b=sTExbzrbrWGwNVKVB8sKgj1lMfEpQTNs0gRMhCwfzIjwmio1fHMoE8ACh8Xm901siJ
 9/tQ076M0qMMo7Db/m5jX7+Oq2d/M8NQ6kKzxCoh0TIF4TfusCoTbbvp9PhzPHIVB+AY
 XPM6n/sWOV8sQVDQ8Ln1pmVNAOuudUmtEzcJ4uVehPTbSctGzuYY1bwmj+15ZeTAdcIV
 KWLhkLC7y1FbI8XYiQtc+n0cBuv1CVVd8NIn5NSXaY7plkHTDBrLt6xpby/0bOFiDvsE
 Mi2YFE0f2hZ1vhIG/lqYkFPQAquHJuFQQVrdSHWKUMM0MM48MoFLi+SlSfffQfh9buE2
 ADmg==
X-Gm-Message-State: AOAM531+tOOOrrxHPAmA7KmF1xYP26sKAOi+3s0PvvNVo0M86gTpy/Wn
 7Qm5Awsu4zHMaaBVX/v+QOH3NgWHPswqxA==
X-Google-Smtp-Source: ABdhPJw8tenYXGx03RYjZVM6NlNxMDcmjpMg9jvj9S0N4qWmYREplAIrpifmMLqAWKq3EdzyaG2Aww==
X-Received: by 2002:a63:1a48:: with SMTP id a8mr469017pgm.81.1618599614010;
 Fri, 16 Apr 2021 12:00:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/30] target/arm: Enforce word alignment for LDRD/STRD
Date: Fri, 16 Apr 2021 11:59:43 -0700
Message-Id: <20210416185959.1520974-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7472e98f09..63c665fb4e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6512,13 +6512,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6541,13 +6541,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6649,13 +6649,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6688,13 +6688,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
-- 
2.25.1


