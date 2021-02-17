Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11731E028
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:25:31 +0100 (CET)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTO7-0001ha-25
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJi-0006D2-Qn
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:20:58 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJh-0006i2-6Q
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:20:58 -0500
Received: by mail-pg1-x52c.google.com with SMTP id t25so9224681pga.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ItHqhLdC4sOUBCwiiiRcMM+Q2th6s4A0m8xxVBo1Ego=;
 b=fYBvxMpXzbii6KkhMzkkbayjhcohyg2QOHQekpq+hUxR7jCD9JvDw346PULo4DxSe1
 DGccktfIsPNuKB8LbGewhATLAyshMNsavCkvCJ3RZjBllmvAcB9V6qmbXGGDndxTf9hy
 6iU40iSk9fyWLKvrqdPD5QGG3huzxF2+qn8pg5MK8D9T+FxS6JDi3LcfcAOCI4/Pj5xf
 9OQUjd3+BTbtL1YwEYpWSwe/f2SpR0m5E3818PP5Yf18uAkhAK1pUgKl5qL8ajgzTH4G
 NxR589I0bivC35eVpGl0LnbGFM1ybsH7QlmcBywdIszUpvdd7rHZ0kd8hd5rAPXRDKD3
 NV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ItHqhLdC4sOUBCwiiiRcMM+Q2th6s4A0m8xxVBo1Ego=;
 b=uayCFLLTNKXcD/ywUpO8L67tyiU6Asur/uLVz1CL1cfsiKYiJa/J6yhmdooS6YpAq9
 62G3uX4NwgZQuHqplWXq3ly1SvfPSVRtQvmBJ+zsBhbt6Ngxs3M6DfzThEkTiCHyefyL
 1rFK6HI3fBkPIQcZDPzWfZW1htUu44SxTGM5fxwJjc/UsmJGZhMh71FxE4lsihpLG10m
 /iTy5wsX5jXC84/xnrSAN4O9t+ddMY7faBTNOHiGoIIxPovJgRLywYCktXAXiGwm+hYJ
 l0Y1E8H6QW2ylc0mhoVaawyeINXJHQEsdN3RsWQmfTM7C/T/uyVCCKIbxwcgknDXU+KS
 jcxg==
X-Gm-Message-State: AOAM531OWbve4NKZzdpr+siyyacy0/2T3JxGJYgiQuuKnqjIjP7vryIO
 ZAmMfexxv0/wIuyBtNdeP1x9lZke4xKKvQ==
X-Google-Smtp-Source: ABdhPJx+8NM9d51SqWnBxdjXgTK9930zr6ffCtHf5SU8Ql0EEqbIBk58fj0aBFBibPCEZsbRilaHnQ==
X-Received: by 2002:a63:5525:: with SMTP id j37mr935270pgb.191.1613593255782; 
 Wed, 17 Feb 2021 12:20:55 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:20:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/71] tcg/tci: Use exec/cpu_ldst.h interfaces
Date: Wed, 17 Feb 2021 12:19:26 -0800
Message-Id: <20210217202036.1724901-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the provided cpu_ldst.h interfaces.  This fixes the build vs
the unconverted uses of g2h(), adds missed memory trace events,
and correctly recognizes when a SIGSEGV belongs to the guest via
set_helper_retaddr().

Fixes: 3e8f1628e864
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


