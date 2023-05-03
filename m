Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC96F5221
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rJ-0004oo-Jh; Wed, 03 May 2023 03:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qH-0002K1-1P
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qF-0001lG-63
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so29710515e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098637; x=1685690637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9rir6NX/kPhI8HP6pX0Ufmiv/ove4hTQETxAc/FKtww=;
 b=EPTf4oDuB/nCghHgX14zCKrMu5FXGLgaVu7pmXhwQm2eIX3POBuEqdm1H7wj6tGa/p
 t4VqRFpuR5176TgSLuI93PVgcWXJ+5KlhzPxIpEEVpZ2AsRJhAYpfJ+xqeIaJEWT2Y6m
 OKkyDX875qWvCV/AViHEKnyokfCwgVcPy4KG2YMEp5Z8z3Rwe2zbYNmfPSPVjnsgc3by
 5x80dG68t8TwyrdwFpP9E+tWLbS1S48JErXqWMQfsNkPb+K/md72h7yAfhK0+R4zN0Ta
 D3+36OgIG9q3A8pJsYESF4RI3S0svIeek+eaF2WMGvG4FmVGWRjvJ3HFlIyUTkv4qnJA
 Dz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098637; x=1685690637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rir6NX/kPhI8HP6pX0Ufmiv/ove4hTQETxAc/FKtww=;
 b=cP/P3SYRlfuEMuwcZJrAM3mp/Aq63D+xQIPjZ76rV4MPzlJYY+3S4LWBi2UBVjvgyd
 Sp5v47idiK6HqU9mVKoh5432LUSxFK1jbhOB4RVSMWqVx9p00/YdEIlKAU89+BoUhC/6
 IL11Y6m96mp1EDDl3z61o9nHiPhT6szBzfLlqZz4tmZ6AH1FkX9aGTsan00rj4TDrmSI
 fwb22vRqWaDuuazzfjo/fcIr4rBtntiMnXio3uyqyUgzQGKY1uk+QVzmY2Eb9AZQbvJS
 I1J657RX0nWw0PAXnlVAgQJw5Gp9TzZScFiyTQHjUBYiUaoAlFpGN+/wlygH8ESZvxWr
 HchA==
X-Gm-Message-State: AC+VfDwTLOLWYl9kaBV+s4VQoxj41A6jBh5Gl1fnIGLssJwkv+yeLNyA
 CsQLDZqFNTZbx2E9OyWouQNrDjTSYs9+/6c/tS+C1Q==
X-Google-Smtp-Source: ACHHUZ7p5999/KTvr0Qyw4g3cPamP3N/zsxw8ARhE59O0VZlQ7e8qVsrUHThEzzfOtnobLX92mYCfw==
X-Received: by 2002:a5d:452b:0:b0:2fe:6b1e:3818 with SMTP id
 j11-20020a5d452b000000b002fe6b1e3818mr13655191wra.51.1683098637736; 
 Wed, 03 May 2023 00:23:57 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 32/84] tcg: Add tlb_dyn_max_bits to TCGContext
Date: Wed,  3 May 2023 08:22:39 +0100
Message-Id: <20230503072331.1747057-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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

Disconnect guest tlb parameters from TCG compilation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 1 +
 accel/tcg/translate-all.c    | 1 +
 tcg/aarch64/tcg-target.c.inc | 2 +-
 tcg/i386/tcg-target.c.inc    | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index c507b0d653..719d719b58 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -556,6 +556,7 @@ struct TCGContext {
 #ifdef CONFIG_SOFTMMU
     int page_mask;
     uint8_t page_bits;
+    uint8_t tlb_dyn_max_bits;
 #endif
 
     TCGRegSet reserved_regs;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 12d7febfee..f6c8ad1a18 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -360,6 +360,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 #ifdef CONFIG_SOFTMMU
     tcg_ctx->page_bits = TARGET_PAGE_BITS;
     tcg_ctx->page_mask = TARGET_PAGE_MASK;
+    tcg_ctx->tlb_dyn_max_bits = CPU_TLB_DYN_MAX_BITS;
 #endif
 
  tb_overflow:
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3819d15563..fa8f3a7629 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1687,7 +1687,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->oi = oi;
     ldst->addrlo_reg = addr_reg;
 
-    mask_type = (s->page_bits + CPU_TLB_DYN_MAX_BITS > 32
+    mask_type = (s->page_bits + s->tlb_dyn_max_bits > 32
                  ? TCG_TYPE_I64 : TCG_TYPE_I32);
 
     /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {x0,x1}.  */
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5f1c23b2a5..9eb4ae15b6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1975,7 +1975,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         trexw = (ttype == TCG_TYPE_I32 ? 0 : P_REXW);
         if (TCG_TYPE_PTR == TCG_TYPE_I64) {
             hrexw = P_REXW;
-            if (s->page_bits + CPU_TLB_DYN_MAX_BITS > 32) {
+            if (s->page_bits + s->tlb_dyn_max_bits > 32) {
                 tlbtype = TCG_TYPE_I64;
                 tlbrexw = P_REXW;
             }
-- 
2.34.1


