Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1253F469
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:20:31 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPle-000382-3s
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG9-0007Kt-An
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:57 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG7-0000OZ-Dq
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:56 -0400
Received: by mail-pf1-x430.google.com with SMTP id z17so14274064pff.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fpGwv3kCXG8ZtfQZNZua0/iQeuwiDUTLYdlJx9okG4=;
 b=Gtj4lgnlDJP0UcCIfJj0C4utjUIMBCR3LwbDYJBzEo2BGgQvzWu+R5Vo7F6bZK26VE
 J6Gs341t8bpbgmDfl60Vpqvn6NuBAXZyGEeMyeUQcMEXueyKZleRi5jkl+r/bWWeQOLe
 KNLjp0bktfXUnfbrvu/A+nvjeuiAjTEOGwnmRYY30yVKuTg1TsA9XZTWLUASX5DdN/rz
 u5U+dU4VDRbgv4yGbL2SXU22MypoSgCfnoM+PrvFisZFq+CV8sdvuyki7wkXyMmbyVqp
 RMFXn33tao0M0GcfX6Q6iyW8nL32ZeB51v5zAlnWU+wyRzKbl5FZ4793QiAFfLQCqQJd
 ODgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fpGwv3kCXG8ZtfQZNZua0/iQeuwiDUTLYdlJx9okG4=;
 b=ydf1KNjZVIqYTbO+zAzkmqi6UczUiO1VeLrMCgITtfIrvlqnJIkdtJto3Yn5apJLJ6
 UKkIfW3D552cUkZKxGh4Y/swC6OJ9hEWe7ISgVfiM78uqu/sqkskpd3LXha7mtROmOQm
 y4LhlF7wvZKgaTOeYcc/Br2cU1hjCtEZJZv+zfw1ACFjsIg50kmDOZcMPwj1XlNZzfKg
 9BawBO2R0AGUPBTUUxvzyM74mmpTb/H3JrTqvnV+BUA4h1SclYEbOQeGpyBaTP/4K4PS
 u1mjJUrcM/xwVTpVM7QfJW/xNd0R97UnFbyzICw4krf087p2g1ttWAvb/g8L04SN1CrN
 /BTg==
X-Gm-Message-State: AOAM533r+DdImOZ1novT0vNQDf6gvGV8EvPbkBew/40dVMIW0BncTLjE
 1MPSJppuoacdb3dHJtw4InK7mo0otW/31Q==
X-Google-Smtp-Source: ABdhPJzIBQWpvrd1kUjm63CdH3NVAxfXJaQkaLjnoHL08HMTkKVGWBY5SvMFULBP2cHoDJ9v0wiHPQ==
X-Received: by 2002:a63:fa56:0:b0:3fc:d3d2:ceac with SMTP id
 g22-20020a63fa56000000b003fcd3d2ceacmr23481606pgk.99.1654570073961; 
 Mon, 06 Jun 2022 19:47:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 21/25] target/arm: Remove default_exception_el
Date: Mon,  6 Jun 2022 19:47:30 -0700
Message-Id: <20220607024734.541321-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is no longer used.  At the same time, remove
DisasContext.secure_routed_to_el3, as it in turn becomes unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 16 ----------------
 target/arm/translate-a64.c |  5 -----
 target/arm/translate.c     |  5 -----
 3 files changed, 26 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d7a9acf5a9..b01a58653e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -43,8 +43,6 @@ typedef struct DisasContext {
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sve_len;     /* SVE vector length in bytes */
-    /* Flag indicating that exceptions from secure mode are routed to EL3. */
-    bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
     int vec_stride;
@@ -199,20 +197,6 @@ static inline int get_mem_index(DisasContext *s)
     return arm_to_core_mmu_idx(s->mmu_idx);
 }
 
-/* Function used to determine the target exception EL when otherwise not known
- * or default.
- */
-static inline int default_exception_el(DisasContext *s)
-{
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.  Otherwise,
-     * exceptions can only be routed to ELs above 1, so we target the higher of
-     * 1 or the current EL.
-     */
-    return (s->mmu_idx == ARMMMUIdx_SE10_0 && s->secure_routed_to_el3)
-            ? 3 : MAX(1, s->current_el);
-}
-
 static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 {
     /* We don't need to save all of the syndrome so we mask and shift
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b45039a124..8da2ca8324 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14584,11 +14584,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->condjmp = 0;
 
     dc->aarch64 = true;
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.
-     */
-    dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
-                               !arm_el_is_aa64(env, 3);
     dc->thumb = false;
     dc->sctlr_b = 0;
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 81c27e7c70..6617de775f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9319,11 +9319,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->condjmp = 0;
 
     dc->aarch64 = false;
-    /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
-     * there is no secure EL1, so we route exceptions to EL3.
-     */
-    dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
-                               !arm_el_is_aa64(env, 3);
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     condexec = EX_TBFLAG_AM32(tb_flags, CONDEXEC);
-- 
2.34.1


