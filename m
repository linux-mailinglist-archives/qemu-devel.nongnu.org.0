Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9144CC7CD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:17:18 +0100 (CET)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsp3-0005hL-TL
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYU-00062T-Fx
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:10 -0500
Received: from [2607:f8b0:4864:20::1031] (port=55203
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYS-0004HZ-Hr
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id b8so5697167pjb.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EnmFxj+fZU2f2HHas6eAUj0uJ7KzSplIKT7ukEJg/z0=;
 b=HvctizwnTdr3jcUbawyaHLhRcF5Zmc12wg4H3a7hgxwCa4G5GW3a7YZUyKhpjf3bl7
 VFcICgwYq9Tg6Mh9/Q7I5VcBtQI4mEquwU/VZ4ZstF65vIgBpNxfQyccfXslSxsfyori
 WvMT56qfo0r9zcw7+n/JhnFIzkAy1xe8dgdS9p+DEejp8Cspxjyk+Xug/bZEnvKyuXsS
 OZJyN4xKKK2BG0tns08TKVEIPGSybE2/Yr2a+snQfGQV2cMTX2dwj0K2LTvgbnW/MDfd
 msfnNKd3Ao0uW/KMMT+ajwQ2gZYkSQRzicJ3RdP3O9Tnjpi3yjBqTaVWYpL0Zj9RLAUK
 THJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EnmFxj+fZU2f2HHas6eAUj0uJ7KzSplIKT7ukEJg/z0=;
 b=6s63mFOV0C0AreFgB5mTnf05GnWlrc+63RddKQCH2xMe0lm+N82MDeIZ2IoR9YKqOQ
 m3ryvXkk2rgukczjfZic0XPgBDnipm2W+XficwepLy9OcwnNPRW7LtQBXPCySUQnPONl
 9VrgbTYuakkvdQ+pFz5pIcG+3zxmDFdpV6jv9GwLRDlUBRKnwBOnd5L0tqaItiJ9UgID
 +YL9LsgVIgu91H0Mop3luWsYws2dllXEfsMslxvjQxJBbTEBq040S6We/RwzVBDUWPOo
 mwqb0/e/+nv7r4rJC1Pjgn/W7yjZo2AmFns/wufJu7m1xtf24esJ1i53lGjZ/cIv3iEZ
 cM1g==
X-Gm-Message-State: AOAM532sUjzVVkurz9UWz+EmkMHezPlltbrQIVYQK5FRv5/1/4yTu1il
 uJdCuZiyhbElSg+gXFbE37OxtBHcznhu2g==
X-Google-Smtp-Source: ABdhPJxeTQRNAZSCJJ/Ye9SjhltNwVLbO9JcxsIu1Sv+/nF3VcwvmKKCJt2TVaCvF/hV2oM0vkUjyw==
X-Received: by 2002:a17:90b:1e4b:b0:1bd:4c83:56a7 with SMTP id
 pi11-20020a17090b1e4b00b001bd4c8356a7mr7322732pjb.109.1646341207127; 
 Thu, 03 Mar 2022 13:00:07 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/30] tcg/i386: Implement avx512 variable rotate
Date: Thu,  3 Mar 2022 10:59:27 -1000
Message-Id: <20220303205944.469445-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512VL has VPROLVD and VPRORVQ.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 25 ++++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 23a8b2a8c8..da1eff59aa 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -197,7 +197,7 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_abs_vec          1
 #define TCG_TARGET_HAS_roti_vec         have_avx512vl
 #define TCG_TARGET_HAS_rots_vec         0
-#define TCG_TARGET_HAS_rotv_vec         0
+#define TCG_TARGET_HAS_rotv_vec         have_avx512vl
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          1
 #define TCG_TARGET_HAS_shv_vec          have_avx2
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3a9f6a3360..712ae3a168 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -420,6 +420,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
 #define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
 #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
+#define OPC_VPROLVD     (0x15 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPROLVQ     (0x15 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPRORVD     (0x14 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPRORVQ     (0x14 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVW     (0x12 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
 #define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
@@ -2839,6 +2843,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     static int const umax_insn[4] = {
         OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_UD2
     };
+    static int const rotlv_insn[4] = {
+        OPC_UD2, OPC_UD2, OPC_VPROLVD, OPC_VPROLVQ
+    };
+    static int const rotrv_insn[4] = {
+        OPC_UD2, OPC_UD2, OPC_VPRORVD, OPC_VPRORVQ
+    };
     static int const shlv_insn[4] = {
         OPC_UD2, OPC_VPSLLVW, OPC_VPSLLVD, OPC_VPSLLVQ
     };
@@ -2922,6 +2932,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sarv_vec:
         insn = sarv_insn[vece];
         goto gen_simd;
+    case INDEX_op_rotlv_vec:
+        insn = rotlv_insn[vece];
+        goto gen_simd;
+    case INDEX_op_rotrv_vec:
+        insn = rotrv_insn[vece];
+        goto gen_simd;
     case INDEX_op_shls_vec:
         insn = shls_insn[vece];
         goto gen_simd;
@@ -3275,6 +3291,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
@@ -3387,7 +3405,12 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 0;
     case INDEX_op_rotlv_vec:
     case INDEX_op_rotrv_vec:
-        return have_avx2 && vece >= MO_32 ? -1 : 0;
+        switch (vece) {
+        case MO_32:
+        case MO_64:
+            return have_avx512vl ? 1 : have_avx2 ? -1 : 0;
+        }
+        return 0;
 
     case INDEX_op_mul_vec:
         if (vece == MO_8) {
-- 
2.25.1


