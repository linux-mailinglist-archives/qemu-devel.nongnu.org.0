Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E453F42F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:56:50 +0200 (CEST)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPOj-0005s4-5p
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFx-0006ee-6Q
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFq-0000Gw-Rt
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id b5so13641058plx.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8AfpmQwL0+E6fQxm6ojECpdw/9TThJiZv66f6M94Xg=;
 b=YTsaaHAYR0BLZT+M420CbUXR8IC/0ANMMBDZrQ+OedSOF513xc0LHmg0tad5fb4OWw
 v8xVuOYgfqnMLjuBwnYsAdlWPDBKgSvL5GpNjsNNsFB3K0d5jtmzih4Mrh5d+4tu0DPj
 ZHPTp+F78A1LuFeaV5VmvHIgSasmiXPVIIYPA4BserO+kLGzqwYigOFkT7lEeD3eNWuq
 n+6/JRNELAJL34DgUPbSi6susoiAdjUmd+tCGO8GPC7cB00dnqTczc69c6qCg8UQ3+IE
 92U5oGzWYCwqt4kI7imXzsYB9quay9rDpnFwDkudS4iOjCe60BTK1RFJDyoCAEjfkIJq
 MHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8AfpmQwL0+E6fQxm6ojECpdw/9TThJiZv66f6M94Xg=;
 b=wNQm20frRj2T7tpn7070R22YVByrvB2tgYOOMxOOXi20HT+dzhNBZPWPnnCnn8bdC+
 93PZC/oeB7b24GP6MnVQV+YcYW+SdVpG41e4lNxE0MSkqiOLAZ8ViGHy+MKduib3owb1
 6vIBQ8sRyn+9EZddJxUVuhCmIK2kIVh7MM7/STfzmzfcAhdPpj/55mg4fk7TGkg4kJN3
 48i2NKnyDhg9Vfga1/hPnPYG197YxpjhdKjXN1RREKU0PCACn24vgeFZypGg3Dh3myZD
 82mTlgu7yPygRFKxfJqr72xCDcx7uO+HBkyX3Z7aS2/Ue7ElHiJlsBIxzFmfb4R5pGQl
 EG/Q==
X-Gm-Message-State: AOAM53213AUCWHlnQ3n58TV5JNKyIjoURxaoctrb8pQa9oNXPeUjOBbY
 SKptTxECuEXpeuoh9FtDN1lKH3ZgXmCYZg==
X-Google-Smtp-Source: ABdhPJyRESZpbqsA47M1DNLRoKYsEaE7KKcbTCpotx1kn4rn0mZRcSQkXUGxNwgfucsUKxYVeZk3Dg==
X-Received: by 2002:a17:902:e80b:b0:167:5e77:e697 with SMTP id
 u11-20020a170902e80b00b001675e77e697mr15713154plg.93.1654570057544; 
 Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/25] target/arm: Add coproc parameter to
 syn_fp_access_trap
Date: Mon,  6 Jun 2022 19:47:11 -0700
Message-Id: <20220607024734.541321-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
index 935e1929bb..14b90a37ea 100644
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


