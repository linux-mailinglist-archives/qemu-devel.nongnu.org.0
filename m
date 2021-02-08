Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9AF31290D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:49:33 +0100 (CET)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wcG-00059n-73
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRB-00015V-6R
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:05 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR8-0005hT-Lm
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:03 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w18so8750900pfu.9
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YWPrxfItN4c65pZ/52Q4dTydvUr4VWbYL6z0GHLhLqg=;
 b=ky+rgAlw+9vYV5TxoHx5fVMBLP6FeQVBZqfdx7cUcgd7ARLCZVLyNNyZV7gWhL5aPM
 WKM48C3JTrzRL3pBtUhE+UNeRayodQBEYwZx1qhF1EbYyuWfCHL4AESy3IcIcgW+N+Wh
 fNFoE8DJ6lSUjgD4sdc5iY+W7VXKC5Yxea38uUnrWQNyAIpnupQeECdjUz3akmbbVHf6
 KJphoXOk5rcRMrzW+0bUNvF2hj7Y7krnHRiVQJcp7P2hwUVXe/fGn1IzpOUbGfzaKEC3
 Q6n+Lh+RVJaBffayRRS2VESg0PFBHLOZXaeJDpokKzVcIm31p1L9I5XhjZz+0iNfz6dd
 T2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWPrxfItN4c65pZ/52Q4dTydvUr4VWbYL6z0GHLhLqg=;
 b=jtOtfURTCe5NQkTuz/3vOXheby2yXdL2W0MkABAdtD7K7pwjWCxJmzCQZrRlvTasDZ
 ytAFVdLYauqMGyCkC5LlfhBl98VmC3ZzqG+t5aJ+RbD6PUsvq0ZLmXiKIqk7qCxMF6XD
 WePF26Q6oM/nELvKIRdeGYsj5oEknjxsTSLqnbFaMJjTAnjpWWK5MUQNmiQ3MIDlXLOU
 UyW6T6AJfRDpjh6HxltfjhXCcBQzxcLdzUPIGAr6i4JhkDhC8uIKx0sLBZdKejMB5HD6
 UJIA0/4V8IGCUM3axa0k+qbSXHs1WBmMufYgiZrYpuTcbxTpyAdjenzcAJcKZOEplSbP
 JGqw==
X-Gm-Message-State: AOAM531GU9EE7p8fHcs+MWnFrXZ80gpz3le4o2HH2mTcVf0DXlV2RnTr
 6h6oMkmCHq1pSjQicCxwOOJ1CuBw6UO58g==
X-Google-Smtp-Source: ABdhPJwsIbEg/JxfBhddaoXdd8sYlieunDd6HQjV3mbJALnSL0RWxkzHAU+88H0RyAfV72gM9fXjJA==
X-Received: by 2002:a65:44c5:: with SMTP id g5mr15209542pgs.295.1612751881155; 
 Sun, 07 Feb 2021 18:38:01 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/70] tcg/tci: Remove tci_read_r8
Date: Sun,  7 Feb 2021 18:36:47 -0800
Message-Id: <20210208023752.270606-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext8u opcodes, and allow truncation
to happen with the store for st8 opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index fb3c97aaf1..c44a4aec7b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -78,11 +78,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint8_t tci_read_reg8(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint8_t)tci_read_reg(regs, index);
-}
-
 static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint16_t)tci_read_reg(regs, index);
@@ -169,14 +164,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (8 bit) from bytecode. */
-static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    uint8_t value = tci_read_reg8(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
 /* Read indexed register (8 bit signed) from bytecode. */
 static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -550,7 +537,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         CASE_32_64(st8)
-            t0 = tci_read_r8(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
@@ -739,8 +726,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i32
         case INDEX_op_ext8u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32
@@ -933,8 +920,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i64
         case INDEX_op_ext8u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


