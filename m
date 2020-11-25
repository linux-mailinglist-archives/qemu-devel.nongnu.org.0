Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6851C2C37E3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:08:47 +0100 (CET)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khm6o-0006QO-6Z
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4v-0004fA-W5
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:50 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4u-00060n-9R
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:49 -0500
Received: by mail-pg1-x541.google.com with SMTP id 81so1218822pgf.0
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nu/Ovkj+6UMFJbUMB5ay1PUB81CaPlCNyUgEjjeQxrc=;
 b=AKEyKHrJslwxk/lcm9Q9s77PG0gmeaWgvdWkQD3YenuURG8qC+p+BffZbgnDgKX582
 EG+iK++2sVR+LMp0/l9RY10u/eHGsc7RdIIFWCsjL5vdiicHfz6aQiI2BHYM1WspI4xb
 QjCYzS1eURaqZ0XyoOTCqoRPU81pctycyrifMRnjB3z7SdPJe1ga8WZExbBGT5sprnfY
 eIl38jh5BtrBJ0OA46rjXLvHKzdElawTWFjQXC8BCviPOEi8kROVd09+mlDDEfL4Y7CX
 B4tYnyaLmUarvQjfyeJEpGfLbu9PVyLmHZXYJ7ITJCGykE1YAcDSWM3fsWFtYAqWx3rm
 nhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nu/Ovkj+6UMFJbUMB5ay1PUB81CaPlCNyUgEjjeQxrc=;
 b=pPRdHLhui83E5mIZzeRWDft39rxrZK+ZxVpDesontU02joBG7TrLjFnWj08do/hmq+
 V6p2cYySyR2HT00emtDktwsiMusG9aPb8jZNujLdSrEdk3z4Z2oS65Ez6LM7HRsIyGJU
 LFhxWcYJ0s0Azyj4OFN3jaBlIsZcM4C+wRH8IA1L54gF0WVmKbwEi+m+ZID/AQtVvW7D
 /nuvNxqyV8d2Aq6A25337bV0n2EifN1hPaEtzb817EXNRh0XnLaBhtf7VSzJLF3ux2L0
 7oEjByqtLRlrKJzpeFWXw4U8w53itNEpg3J7OuSpPURsE1qh8a2cCCIJZ3CEGlL2ojjG
 NtjQ==
X-Gm-Message-State: AOAM531/sr+O5jyi+NN/71h4NE+sHpWQ48snQcSNwCf1cpAf7Z/Ni12y
 dIJ8/P5jU4C7vDMLrrdSZ9kn8fSDxL8u6Q==
X-Google-Smtp-Source: ABdhPJzenlruFW3fiTaLsvcQeMEWw5lyBCOpLVf1z4C8pNVvakNOGdXgzdtGDSPYa5Yb+zTptjVoqA==
X-Received: by 2002:a17:90a:fe0e:: with SMTP id
 ck14mr1773081pjb.80.1606277206639; 
 Tue, 24 Nov 2020 20:06:46 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] target/arm: Enforce word alignment for LDRD/STRD
Date: Tue, 24 Nov 2020 20:06:32 -0800
Message-Id: <20201125040642.2339476-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d04ca3a8a..17883d00f4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6458,7 +6458,7 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
@@ -6487,7 +6487,7 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
@@ -6595,7 +6595,7 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
@@ -6634,7 +6634,7 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
-- 
2.25.1


