Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCC24CC5EB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:20:44 +0100 (CET)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr0E-0004wh-RT
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:20:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvt-00027g-BJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:13 -0500
Received: from [2607:f8b0:4864:20::1035] (port=32911
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvo-0007UN-Bd
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:12 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so6721437pjq.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KnojlxdJvLZ10xztEz7NOsevcqMVQEVsVSU9aLxpzTg=;
 b=qz6RvfJFMgigWzzM1vRT/5gb9lGxqkQWy6iTWqwlLwVxc4Di62FNOYwztB/Nf83cB5
 2d633BfUoHMevCAR2acUejkqcTJQHOHT1wuDl61Nfz9kNJ9YsAjWGga2PC9aNYvf4P3F
 Dk9a111+jCaDg567I8EeUTjWHzuCGXtgfn51vzenakFOHBGIjXO/IbYVcQjywe0yGSmw
 keW3rxsMYgKz/3YUdYgb6X7aMGw0AuEs2V7lVH7FGnhrvkkhNym5bg39EYZnj/NZo8Bx
 fTVPQaG9JgW9coh+Z9Eu5M+jvMCQgMri8kBaxr/HRSnib+TWVagcHBE3UfxtKRofDGMT
 ZWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KnojlxdJvLZ10xztEz7NOsevcqMVQEVsVSU9aLxpzTg=;
 b=hlywM21ej7xcX/32Uvnv8wI14YRYVy1I8hjxd75onT31VBuwH0N3bUEVT4pbg/pC8I
 i7ufybW5ScnFFgmQ24gwfpV7dxtS4YQhhWYyTUMaf1Wi4i5tFCv3UFpCPQtBOaiFcQVG
 HhWH0WPMVwAK+1r4eLgEGBCtW+AHprV+BDA3YYYHO4Tm1lOlyHEXbekfoSGmaTNFz2cp
 ONDAOpCjCqy7qtX0nqqGQda5Hx2GTYPmq5uWWXFR95fBtv9UbddhGQvaF6Bt9RD+RZ0W
 LDs8erf0c/LL73OesCLl324Sgrf2MebOJ8bst6CZGKVxlwfoXMKoJINui0ktSN45dqbL
 gIpQ==
X-Gm-Message-State: AOAM530XIaUc1lDH7B13SXQvfSD9DVL7ddiXZKfnN0D8CAPyM7qe0gZB
 d3imlCv/J3HOC/R6k+TP1mCH8ugRfzaeWQ==
X-Google-Smtp-Source: ABdhPJwD5tjnIeiyD16cT49Zxn0ZpH46vFyhdTyyA+O04FkB/VIQbhowFuuOfxd/L0zCnwkkQcw8XA==
X-Received: by 2002:a17:902:9348:b0:14f:c715:2a94 with SMTP id
 g8-20020a170902934800b0014fc7152a94mr38082555plp.66.1646334967036; 
 Thu, 03 Mar 2022 11:16:07 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:16:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 09:15:51 -1000
Message-Id: <20220303191551.466631-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All 32-bit LoongArch operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Cc: WANG Xuerui <git@xen0n.name>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-sa32.h |  2 +-
 tcg/loongarch64/tcg-target.c.inc  | 15 ++++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-sa32.h b/tcg/loongarch64/tcg-target-sa32.h
index cb185b1526..aaffd777bf 100644
--- a/tcg/loongarch64/tcg-target-sa32.h
+++ b/tcg/loongarch64/tcg-target-sa32.h
@@ -1 +1 @@
-#define TCG_TARGET_SIGNED_ADDR32 0
+#define TCG_TARGET_SIGNED_ADDR32 1
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a3debf6da7..425f6629ca 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -880,8 +880,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_fail_alignment(s, l);
 }
 
-#endif /* CONFIG_SOFTMMU */
-
 /*
  * `ext32u` the address register into the temp register given,
  * if target is 32-bit, no-op otherwise.
@@ -891,12 +889,13 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
                                           TCGReg addr, TCGReg tmp)
 {
-    if (TARGET_LONG_BITS == 32) {
+    if (TARGET_LONG_BITS == 32 && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, tmp, addr);
         return tmp;
     }
     return addr;
 }
+#endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
                                    TCGReg rk, MemOp opc, TCGType type)
@@ -944,8 +943,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
     tcg_insn_unit *label_ptr[1];
 #else
     unsigned a_bits;
-#endif
     TCGReg base;
+#endif
 
     data_regl = *args++;
     addr_regl = *args++;
@@ -954,8 +953,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
 
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, data_regl, base, TCG_REG_TMP2, opc, type);
+    tcg_out_qemu_ld_indexed(s, data_regl, addr_regl, TCG_REG_TMP2, opc, type);
     add_qemu_ldst_label(s, 1, oi, type,
                         data_regl, addr_regl,
                         s->code_ptr, label_ptr);
@@ -1004,8 +1002,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
     tcg_insn_unit *label_ptr[1];
 #else
     unsigned a_bits;
-#endif
     TCGReg base;
+#endif
 
     data_regl = *args++;
     addr_regl = *args++;
@@ -1014,8 +1012,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
 
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
+    tcg_out_qemu_st_indexed(s, data_regl, addr_regl, TCG_REG_TMP2, opc);
     add_qemu_ldst_label(s, 0, oi,
                         0, /* type param is unused for stores */
                         data_regl, addr_regl,
-- 
2.25.1


