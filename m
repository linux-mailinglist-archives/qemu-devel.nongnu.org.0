Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B005D397660
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:17:35 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo698-0000Gp-Kc
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5u7-0002jO-4B
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:02:03 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5to-0002lC-SN
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:02:02 -0400
Received: by mail-io1-xd2a.google.com with SMTP id o21so15620743iow.13
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FnlsR+WZ/wh0XCcNKaHActmkwxmy9chqA5pOHI4KJO8=;
 b=Luv0k11DSMAR+lUzSZXq/PS7I8noyYEQRpSGcbpuls1RkaMry8+9Goy/n52tLQv69n
 U6CltkmNku3n5n7FG2XIDTfcH1Le6kE654BOHFZ9HMxLXYeSaUjjKSFJEA9A/jxdtW93
 cF8PLnXjCM89hJuvDn3VvBgqrDSFJkQ5NxzS16jmIwe/UeyXb9S2pZCnp5G6OgsY5v+g
 S1iAA93hD5Wg+5DwdojuAHl7xe3xVC/6Bqd9XZ7VPQ5SeiD9tCnpeV7jFRJesc8dycGa
 GO53HCZsf/8QVRkrImLhSQl0Gaq2QL6wmd+cd5HyFLCvhzZeB2JzpLBV8uz/dNym2jYp
 3JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnlsR+WZ/wh0XCcNKaHActmkwxmy9chqA5pOHI4KJO8=;
 b=H5xtZjUS7nIDPiqrEWYJ4IQeLPImWn/c3cuEfaFdoleIBunrDkjLFo4hjf5GnTK45V
 jsH16Hek8pVKcpjBq4qxNWuY8EobHTrXs6Xa5PhAywIKQYBoiwFCNcZmL+dBH4Sw+FrT
 ubHE8KEjiSIa6nopLa/pA8eFWqYOGr3bhcFutg4hPCiz1enYxkFBRABeWXCwLtbsU5hX
 5CN7IuHLC7J8sFO+Eo6Iw0lc4T1wElGdsMEo9yWLYfAmS+Kb8psqDZkpv1Y1KLvuS0oN
 j0+h5V/HnCJ2jGFrsxlG2tJZYZoXWpEF1tkjLR2nubQ60horltmIozM6/q1x/b4eawlK
 7IMA==
X-Gm-Message-State: AOAM5321jxYRn79qtiQPY8xGiLIoQ84ldawpiMdgrTcZo/eHZv4kMzJP
 Uy3Ii1poTUtU4rIU9y4PfL5SiNk+5z4hVVzz
X-Google-Smtp-Source: ABdhPJwDCbHlLkcV1Z7Mpds3QUSnffXZFCAdvu3LwGYN1dU+kUSWj+9iPVNkyfxuoIz/b+uocN+7Pw==
X-Received: by 2002:a02:b107:: with SMTP id r7mr26526185jah.8.1622559701120;
 Tue, 01 Jun 2021 08:01:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 24/27] Revert "tcg/tci: Use exec/cpu_ldst.h interfaces"
Date: Tue,  1 Jun 2021 08:01:03 -0700
Message-Id: <20210601150106.12761-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 73 ++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 36558210a1..8b17b244bf 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -286,34 +286,51 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
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


