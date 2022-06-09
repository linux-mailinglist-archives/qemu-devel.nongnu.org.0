Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9405455B2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:33:37 +0200 (CEST)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOqV-0006dM-Vj
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmB-0003QQ-Ma
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:07 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOm9-0008QZ-P9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:07 -0400
Received: by mail-pj1-x1035.google.com with SMTP id cx11so22331417pjb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=45/1OP9sKZiLrriwOZd01nWrvZCCplxvhdpmrJtm+Zo=;
 b=YDnrQ2v6WhH/ui7xH/Tg/6xrTudcXNeQLpK5jsqelBYi+1si6d7hFBA+55J5x0Hv9M
 stTLyJ//uVywXEUGR2x/T0f+nyKQZtMXy1HVjllBCzORjbAzANwrefT619PL/B8Mh2Wv
 gJQ7tYOcBi6OLbC9BKcqp3uVssOz0eteXzBcOak9whB8eU5OQ1ReSHnnihQPzJP6nZy/
 lsOGDa8Slpf2LC5yDRifgAqS+XSVgdhCw1ZWZyoz49DQrtmLI59iv3nfwzz1W82nsPZl
 j7udzgm+YxOcLDW+DePQk57MVARTYpF3jkTxLuHt9HLpjJXTHn8+tNZnrBk4kEzr+QKz
 kcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=45/1OP9sKZiLrriwOZd01nWrvZCCplxvhdpmrJtm+Zo=;
 b=I9XoLrB3BCniLEekIXfVsYk4ahqnAfrC7IyBrF/7YOwFCmuiRwsmtMAImvpq4Fg9RV
 peI73bs3p0c9hl8TQFAAWkTQw3+8rF12NOV7565bSxAR/hNLXRfFmI9mrRGPsrlcI7t5
 wmXmR/L2XgCyV7e5ms7dXL53U6P6/rvQk1c7yv5BGkcVFzgEU/hHTA86g3Ho3NrF7nVo
 fD80nKNaWS+v+1cTDCZ2iYQtEBfppvGr9dDH0O3MdSXAmis/lGBOFojkyO940+WLYx22
 6tL/8qCdliShWBvE2GFpBF/seRUok0azNgSLcQ8n6Ta7r2+tguZT7gomsglqbNA5wV1X
 WcgA==
X-Gm-Message-State: AOAM533HwCGubb3sv1NYraJdipA61uMd+CS29TFVXYoFeuW//lOr8vi8
 wrvJagPH9iT2ZUcgAMLZaaudiccWF25SKQ==
X-Google-Smtp-Source: ABdhPJwQVdbKIOcJkUXUbK4Ur5HsdGgNtsTLVZApvJPWENHrzvGM1dx58ebBRW0QjefxXeVXpRQAtw==
X-Received: by 2002:a17:90b:4c88:b0:1e6:71da:5eb0 with SMTP id
 my8-20020a17090b4c8800b001e671da5eb0mr5048751pjb.185.1654806544397; 
 Thu, 09 Jun 2022 13:29:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 02/23] target/arm: Add coproc parameter to
 syn_fp_access_trap
Date: Thu,  9 Jun 2022 13:28:40 -0700
Message-Id: <20220609202901.1177572-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With ARMv8, this field is always RES0.
With ARMv7, targeting EL2 and TA=0, it is always 0xA.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h      |  7 ++++---
 target/arm/translate-a64.c |  3 ++-
 target/arm/translate-vfp.c | 14 ++++++++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 0cb26dde7d..c105f9e6ba 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -185,12 +185,13 @@ static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
         | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
 }
 
-static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
+static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit,
+                                          int coproc)
 {
-    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 coproc == 0xa */
+    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 */
     return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
         | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | 0xa;
+        | (cv << 24) | (cond << 20) | coproc;
 }
 
 static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d438fb89e7..e752589090 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1162,7 +1162,8 @@ static bool fp_access_check(DisasContext *s)
         s->fp_access_checked = true;
 
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+                           syn_fp_access_trap(1, 0xe, false, 0),
+                           s->fp_excp_el);
         return false;
     }
     s->fp_access_checked = true;
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 40a513b822..0f797c56fd 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -219,8 +219,18 @@ static void gen_update_fp_context(DisasContext *s)
 static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+        /*
+         * The full syndrome is only used for HSR when HCPTR traps:
+         * For v8, when TA==0, coproc is RES0.
+         * For v7, any use of a Floating-point instruction or access
+         * to a Floating-point Extension register that is trapped to
+         * Hyp mode because of a trap configured in the HCPTR sets
+         * this field to 0xA.
+         */
+        int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
+        uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
+
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
     }
 
-- 
2.34.1


