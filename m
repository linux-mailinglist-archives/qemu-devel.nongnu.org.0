Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6C32A8B9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:51 +0100 (CET)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9N8-0002J4-CY
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HM-0002UU-3C
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:52 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HI-0007Xg-SH
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:51 -0500
Received: by mail-pg1-x529.google.com with SMTP id p21so14332561pgl.12
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qXvTR6xq0CezXE1eROwLDPe0hk6sXQteYv5BD9wz3/8=;
 b=vjtOp1HTg7i3Y3gGSXf/lIijJ2P79qCl+Qs4DLqcyvdc1ezkZiQ+ExLqZskcYVm1lS
 xU+fnHndYR9AOAxTS4OZgVG++W1Pbl9ULLhAQncUkoQ6taeGuv0W+aCEQNZmRIloiSSj
 BCOK1X5WPz5QDaiqXwWnlmOh7MO2BNeBCu+k1CXpJWyFJk/othT8ACynC59+7syYbuOA
 NrFyLNNisuHDjMCfqf6n1+Vaz3Z3fUMTLN3x51cbCceVpsOWljwuVfQHxZTJGNA4N6qu
 FOm+Md1d5pGUUhMYWNC6fYYUAR5qSe1AQabQBbteYNwrrRhvM7x1LPCbOpvMuYFI6MwN
 sakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qXvTR6xq0CezXE1eROwLDPe0hk6sXQteYv5BD9wz3/8=;
 b=KsLeGubn+JgfQSh2Ua0uK/hfTyZkmicUOtHUQlQaK3eTpS7BSju89LF2YCCaOaeGOa
 jSuFafUkPtNlszmMQXYBqV9VEE5JF/DFpFxFLWT4TVaAo8baCiV2nyF2hhirFtVkpvqt
 hPEBw7iEHRZqPoTt/CCvlKqp3bEPtGtF8qfamnE3qMivRpr2b0Btr9sa3tuDcArVrXYA
 v+4fpS4wDmAC0vL5alggLrh4wXWSj1rNm0MaQp85AIzH1S9cSu7NPVA72/3oVNE4hbev
 F05r2b8v06VLOUNwNWeP1gmHqIm98e5E0Xeo0uVYWdPbgln9mipA1obZc3N1Wl4/Vgr1
 jeZg==
X-Gm-Message-State: AOAM532T1qvgL97DMCM4Yt8V4WrYIOWtMLql87juUPw/TPZPqXaI71zl
 GHTkevoRvXR5tV81lflp9IjHkQDGQ3iTfg==
X-Google-Smtp-Source: ABdhPJwNJjfhaU4LzC3+dPBdk8gz0ULF8o3y0tLYVYZu8+cQP2KZK1xiWcS/3He0RmrOf5QC8y3M4g==
X-Received: by 2002:a63:cd41:: with SMTP id a1mr19139870pgj.177.1614707867535; 
 Tue, 02 Mar 2021 09:57:47 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/27] tcg/tci: Use exec/cpu_ldst.h interfaces
Date: Tue,  2 Mar 2021 09:57:18 -0800
Message-Id: <20210302175741.1079851-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the provided cpu_ldst.h interfaces.  This fixes the build vs
the unconverted uses of g2h(), adds missed memory trace events,
and correctly recognizes when a SIGSEGV belongs to the guest via
set_helper_retaddr().

Fixes: 3e8f1628e864
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 73 +++++++++++++++++++++----------------------------------
 1 file changed, 28 insertions(+), 45 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index fb3c97aaf1..1c667537fe 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -346,51 +346,34 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
     return result;
 }
 
-#ifdef CONFIG_SOFTMMU
-# define qemu_ld_ub \
-    helper_ret_ldub_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_leuw \
-    helper_le_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_leul \
-    helper_le_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_leq \
-    helper_le_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_beuw \
-    helper_be_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_beul \
-    helper_be_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_beq \
-    helper_be_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_st_b(X) \
-    helper_ret_stb_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_lew(X) \
-    helper_le_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_lel(X) \
-    helper_le_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_leq(X) \
-    helper_le_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_bew(X) \
-    helper_be_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_bel(X) \
-    helper_be_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_beq(X) \
-    helper_be_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-#else
-# define qemu_ld_ub      ldub_p(g2h(taddr))
-# define qemu_ld_leuw    lduw_le_p(g2h(taddr))
-# define qemu_ld_leul    (uint32_t)ldl_le_p(g2h(taddr))
-# define qemu_ld_leq     ldq_le_p(g2h(taddr))
-# define qemu_ld_beuw    lduw_be_p(g2h(taddr))
-# define qemu_ld_beul    (uint32_t)ldl_be_p(g2h(taddr))
-# define qemu_ld_beq     ldq_be_p(g2h(taddr))
-# define qemu_st_b(X)    stb_p(g2h(taddr), X)
-# define qemu_st_lew(X)  stw_le_p(g2h(taddr), X)
-# define qemu_st_lel(X)  stl_le_p(g2h(taddr), X)
-# define qemu_st_leq(X)  stq_le_p(g2h(taddr), X)
-# define qemu_st_bew(X)  stw_be_p(g2h(taddr), X)
-# define qemu_st_bel(X)  stl_be_p(g2h(taddr), X)
-# define qemu_st_beq(X)  stq_be_p(g2h(taddr), X)
-#endif
+#define qemu_ld_ub \
+    cpu_ldub_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_ld_leuw \
+    cpu_lduw_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_ld_leul \
+    cpu_ldl_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_ld_leq \
+    cpu_ldq_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_ld_beuw \
+    cpu_lduw_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_ld_beul \
+    cpu_ldl_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_ld_beq \
+    cpu_ldq_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_st_b(X) \
+    cpu_stb_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_st_lew(X) \
+    cpu_stw_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_st_lel(X) \
+    cpu_stl_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_st_leq(X) \
+    cpu_stq_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_st_bew(X) \
+    cpu_stw_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_st_bel(X) \
+    cpu_stl_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+#define qemu_st_beq(X) \
+    cpu_stq_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
 
 #if TCG_TARGET_REG_BITS == 64
 # define CASE_32_64(x) \
-- 
2.25.1


