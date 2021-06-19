Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520183ADB5E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:34:11 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufnG-0006Ke-BX
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUw-0000us-JT
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:14 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUq-0002MG-5r
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:14 -0400
Received: by mail-pj1-x1033.google.com with SMTP id g4so7565504pjk.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Df7s7cK7c8SL/IAlkHACnvMM9CkTin1F/Jwc/gsLKKI=;
 b=ssu4qkwFkLYvbhiRMJT94wB7YMgb0s/Lhm5m2DP7+I9QADs/WEPYi2EcYcxm+4XB/q
 +UTrq8+05vSG+y9LTYsvbicIYy4OexCkxrFOXgHIrhS5YLOtNSetkxKmP/0cOv2BFX7v
 kmxZhlkTR62M/fqCbmQwJeXCn0n+AmGfpH3OhvlH2RPFozu7JYk8N+l5p2n3d2JNS/ah
 T7QMJQTOEiiXHyYUit4WokdorHHl4c3UzdCda1rn1r+5sHGsNBIi65mtaV49oQyfjBkq
 iPIZwLhkhnyUE+JyHDZVLQ6NF5d5QvHsnCYNlAsFmDaSUSlbd3cLFtosAxRl+401RpmY
 Bo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Df7s7cK7c8SL/IAlkHACnvMM9CkTin1F/Jwc/gsLKKI=;
 b=H0YHGVpRtzXoDlnyL9rBdLM7buOuQ8RcSoBsZdGScvSFsXW5nxSEkRcCdftaClLvkI
 wD6OsM+92IQM0vCHDt1eoPTyN0MSjR/RRM9ibPYWCdjunvpIOPuPwmszTIbkvme0M0cs
 V6J4vCC6IVx42o/LE3l5xawA4nzFup7lgH7UV46v7SGIzSTswxwPMgZpEn0w0nvwZc9h
 O4yV2iLSjt0uUyNEiKuf9OYbDAUPvSnHdfLM75JqDTM8Ox4wGAfaWdaTNl0xHdW4AZb/
 TV2KAqg+/NgtvgwugAJxAV6Hot4U8FH+ERaID4NpxOWVYMZCFLt/StZI3noeg2YOhKxJ
 Oh/g==
X-Gm-Message-State: AOAM5326baXa7l1A4Xo/LnQLnSkxFx/KrKe+8jXR0Y4uO7xSX2s8FTTJ
 6k34GwvmswidA9/T0fVqgVFAy3mMDjgwNw==
X-Google-Smtp-Source: ABdhPJwKs7hlC3FFtQliODpCJchsMJzGk4eybilBwYwESnC3MxdVr33usi5I/yD2DLCXcJcs1iGccQ==
X-Received: by 2002:a17:90b:3147:: with SMTP id
 ip7mr17848067pjb.8.1624126506814; 
 Sat, 19 Jun 2021 11:15:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/33] Revert "tcg/tci: Use exec/cpu_ldst.h interfaces"
Date: Sat, 19 Jun 2021 11:14:43 -0700
Message-Id: <20210619181452.877683-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit dc09f047eddec8f4a1991c4f5f4a428d7aa3f2c0.

For tcg, tracepoints are expanded inline in tcg opcodes.
Using a helper which generates a second tracepoint is incorrect.

For system mode, the extraction and re-packing of MemOp and mmu_idx
lost the alignment information from MemOp.  So we were no longer
raising alignment exceptions for !TARGET_ALIGNED_ONLY guests.
This can be seen in tests/tcg/xtensa/test_load_store.S.

For user mode, we must update to the new signature of g2h() so that
the revert compiles.  We can leave set_helper_retaddr for later.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 73 ++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5520537abe..cbe1afa289 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -288,34 +288,51 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
     return result;
 }
 
-#define qemu_ld_ub \
-    cpu_ldub_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_leuw \
-    cpu_lduw_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_leul \
-    cpu_ldl_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_leq \
-    cpu_ldq_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_beuw \
-    cpu_lduw_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_beul \
-    cpu_ldl_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_beq \
-    cpu_ldq_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_b(X) \
-    cpu_stb_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_lew(X) \
-    cpu_stw_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_lel(X) \
-    cpu_stl_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_leq(X) \
-    cpu_stq_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_bew(X) \
-    cpu_stw_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_bel(X) \
-    cpu_stl_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_beq(X) \
-    cpu_stq_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#ifdef CONFIG_SOFTMMU
+# define qemu_ld_ub \
+    helper_ret_ldub_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
+# define qemu_ld_leuw \
+    helper_le_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
+# define qemu_ld_leul \
+    helper_le_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
+# define qemu_ld_leq \
+    helper_le_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
+# define qemu_ld_beuw \
+    helper_be_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
+# define qemu_ld_beul \
+    helper_be_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
+# define qemu_ld_beq \
+    helper_be_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
+# define qemu_st_b(X) \
+    helper_ret_stb_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
+# define qemu_st_lew(X) \
+    helper_le_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
+# define qemu_st_lel(X) \
+    helper_le_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
+# define qemu_st_leq(X) \
+    helper_le_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
+# define qemu_st_bew(X) \
+    helper_be_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
+# define qemu_st_bel(X) \
+    helper_be_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
+# define qemu_st_beq(X) \
+    helper_be_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
+#else
+# define qemu_ld_ub      ldub_p(g2h(env_cpu(env), taddr))
+# define qemu_ld_leuw    lduw_le_p(g2h(env_cpu(env), taddr))
+# define qemu_ld_leul    (uint32_t)ldl_le_p(g2h(env_cpu(env), taddr))
+# define qemu_ld_leq     ldq_le_p(g2h(env_cpu(env), taddr))
+# define qemu_ld_beuw    lduw_be_p(g2h(env_cpu(env), taddr))
+# define qemu_ld_beul    (uint32_t)ldl_be_p(g2h(env_cpu(env), taddr))
+# define qemu_ld_beq     ldq_be_p(g2h(env_cpu(env), taddr))
+# define qemu_st_b(X)    stb_p(g2h(env_cpu(env), taddr), X)
+# define qemu_st_lew(X)  stw_le_p(g2h(env_cpu(env), taddr), X)
+# define qemu_st_lel(X)  stl_le_p(g2h(env_cpu(env), taddr), X)
+# define qemu_st_leq(X)  stq_le_p(g2h(env_cpu(env), taddr), X)
+# define qemu_st_bew(X)  stw_be_p(g2h(env_cpu(env), taddr), X)
+# define qemu_st_bel(X)  stl_be_p(g2h(env_cpu(env), taddr), X)
+# define qemu_st_beq(X)  stq_be_p(g2h(env_cpu(env), taddr), X)
+#endif
 
 static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
                             TCGMemOpIdx oi, const void *tb_ptr)
-- 
2.25.1


