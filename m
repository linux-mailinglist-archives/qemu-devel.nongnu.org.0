Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F1C26E1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 22:44:16 +0200 (CEST)
Received: from localhost ([::1]:57090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF2Wl-0000hg-EY
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 16:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iF2B7-0004tq-GM
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:21:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iF2B4-0005kK-OM
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:21:53 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iF2B4-0005k8-GJ
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:21:50 -0400
Received: by mail-pf1-x442.google.com with SMTP id b128so6246703pfa.1
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jLNbcp2nOrZ2ZLaJ9eyqETFPjvsCI5cyn5OFcvkWp5Q=;
 b=oAh3toL23wpmK4aaBtMy6MtJNdsZc0xeeAzmnriU5Fx5fbsEOohg+2penPNQ78iEOH
 rJfW+l8EuImOhw4KkdVCO0hrrcgOH4ZbCa1l1+kzPlalDjOmfuaBDWGNvBjogVaVUXMG
 YcfMDOoQ7HohxWmlywi0ThKFUwyDFbt1W9cZerJSg5kw+DgrQVjX/iDR/U6+naee/xZW
 sX/CCzmmSnanLEuswyJXQ4V4UAkC4uUEsVV5W31qfu3vOBPdVrL2N4SqKM4ChieXRSvF
 SKI0rjyuBKDdmrcC75B3KEuQNUf5p3CI49GOiMbEUDB4fnOGKPFZFfM+5Y8JlCacyPcL
 zoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jLNbcp2nOrZ2ZLaJ9eyqETFPjvsCI5cyn5OFcvkWp5Q=;
 b=UvlkAS0isLtgrR8uGcw1kxafQBWQJooF7ajQ4c6dCe3LCzzAFfHrXdMRAoiDK4C01j
 dnOhGXCF90ul7bgvZ23WYdi3vgfEu3FZ/zeUVSm/dPv4Fu4oB41IrEpLAhmvAYaY32VN
 oWd8+wR4UPwj/Bz1AMwiSFHVZfJUWHntjyr4DttYwibepmmhiY3g5UOjK0g6uUIlTS7j
 fFWqUkKk9J9En8kqxXXM4IvwgnL3w5uJmxQwrHbavp//ps4N88+0Q8gIScS/FtAcnO+S
 9/bxjBqFDRFRvqjk3GbqwW5scJQU/J3Qi/g4wnzsnWD/BQIWxW70IdLJGGWNhEZxd5kf
 DjRQ==
X-Gm-Message-State: APjAAAXOYh4VrJpb9RM45Mjio0IOOjCjSG6WLd0Z1LSJgrll9eTK1hSj
 01VF9bqrhQi3lDQrqNNm1I6Ve2vU8ww=
X-Google-Smtp-Source: APXvYqzQ0CYK41eAKARvmiU//P99FfBYhmy+fNUCObFc8t6VKpFZzqsygdmeplu2dQZbx/uSeW7foA==
X-Received: by 2002:a62:5cc3:: with SMTP id q186mr23133716pfb.15.1569874909135; 
 Mon, 30 Sep 2019 13:21:49 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r28sm15336802pfg.62.2019.09.30.13.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 13:21:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/22] tcg/ppc: Update vector support for v2.07 Altivec
Date: Mon, 30 Sep 2019 13:21:20 -0700
Message-Id: <20190930202125.21064-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930202125.21064-1-richard.henderson@linaro.org>
References: <20190930202125.21064-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: mark.cave-ayland@ilande.co.uk, amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These new instructions are conditional only on MSR.VEC and
are thus part of the Altivec instruction set, and not VSX.
This includes lots of double-word arithmetic and a few extra
logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |  4 +-
 tcg/ppc/tcg-target.inc.c | 85 ++++++++++++++++++++++++++++++----------
 2 files changed, 67 insertions(+), 22 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index c974ca274a..13197eddce 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -61,6 +61,7 @@ typedef enum {
 typedef enum {
     tcg_isa_base,
     tcg_isa_2_06,
+    tcg_isa_2_07,
     tcg_isa_3_00,
 } TCGPowerISA;
 
@@ -69,6 +70,7 @@ extern bool have_altivec;
 extern bool have_vsx;
 
 #define have_isa_2_06  (have_isa >= tcg_isa_2_06)
+#define have_isa_2_07  (have_isa >= tcg_isa_2_07)
 #define have_isa_3_00  (have_isa >= tcg_isa_3_00)
 
 /* optional instructions automatically implemented */
@@ -155,7 +157,7 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_v256             0
 
 #define TCG_TARGET_HAS_andc_vec         1
-#define TCG_TARGET_HAS_orc_vec          0
+#define TCG_TARGET_HAS_orc_vec          have_isa_2_07
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_abs_vec          0
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 2388958405..bc3a669cb4 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -484,6 +484,7 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VADDSWS    VX4(896)
 #define VADDUWS    VX4(640)
 #define VADDUWM    VX4(128)
+#define VADDUDM    VX4(192)       /* v2.07 */
 
 #define VSUBSBS    VX4(1792)
 #define VSUBUBS    VX4(1536)
@@ -494,47 +495,62 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VSUBSWS    VX4(1920)
 #define VSUBUWS    VX4(1664)
 #define VSUBUWM    VX4(1152)
+#define VSUBUDM    VX4(1216)      /* v2.07 */
 
 #define VMAXSB     VX4(258)
 #define VMAXSH     VX4(322)
 #define VMAXSW     VX4(386)
+#define VMAXSD     VX4(450)       /* v2.07 */
 #define VMAXUB     VX4(2)
 #define VMAXUH     VX4(66)
 #define VMAXUW     VX4(130)
+#define VMAXUD     VX4(194)       /* v2.07 */
 #define VMINSB     VX4(770)
 #define VMINSH     VX4(834)
 #define VMINSW     VX4(898)
+#define VMINSD     VX4(962)       /* v2.07 */
 #define VMINUB     VX4(514)
 #define VMINUH     VX4(578)
 #define VMINUW     VX4(642)
+#define VMINUD     VX4(706)       /* v2.07 */
 
 #define VCMPEQUB   VX4(6)
 #define VCMPEQUH   VX4(70)
 #define VCMPEQUW   VX4(134)
+#define VCMPEQUD   VX4(199)       /* v2.07 */
 #define VCMPGTSB   VX4(774)
 #define VCMPGTSH   VX4(838)
 #define VCMPGTSW   VX4(902)
+#define VCMPGTSD   VX4(967)       /* v2.07 */
 #define VCMPGTUB   VX4(518)
 #define VCMPGTUH   VX4(582)
 #define VCMPGTUW   VX4(646)
+#define VCMPGTUD   VX4(711)       /* v2.07 */
 
 #define VSLB       VX4(260)
 #define VSLH       VX4(324)
 #define VSLW       VX4(388)
+#define VSLD       VX4(1476)      /* v2.07 */
 #define VSRB       VX4(516)
 #define VSRH       VX4(580)
 #define VSRW       VX4(644)
+#define VSRD       VX4(1732)      /* v2.07 */
 #define VSRAB      VX4(772)
 #define VSRAH      VX4(836)
 #define VSRAW      VX4(900)
+#define VSRAD      VX4(964)       /* v2.07 */
 #define VRLB       VX4(4)
 #define VRLH       VX4(68)
 #define VRLW       VX4(132)
+#define VRLD       VX4(196)       /* v2.07 */
 
 #define VMULEUB    VX4(520)
 #define VMULEUH    VX4(584)
+#define VMULEUW    VX4(648)       /* v2.07 */
 #define VMULOUB    VX4(8)
 #define VMULOUH    VX4(72)
+#define VMULOUW    VX4(136)       /* v2.07 */
+#define VMULUWM    VX4(137)       /* v2.07 */
 #define VMSUMUHM   VX4(38)
 
 #define VMRGHB     VX4(12)
@@ -552,6 +568,9 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VNOR       VX4(1284)
 #define VOR        VX4(1156)
 #define VXOR       VX4(1220)
+#define VEQV       VX4(1668)      /* v2.07 */
+#define VNAND      VX4(1412)      /* v2.07 */
+#define VORC       VX4(1348)      /* v2.07 */
 
 #define VSPLTB     VX4(524)
 #define VSPLTH     VX4(588)
@@ -2904,26 +2923,37 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_andc_vec:
     case INDEX_op_not_vec:
         return 1;
+    case INDEX_op_orc_vec:
+        return have_isa_2_07;
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_smax_vec:
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+        return vece <= MO_32 || have_isa_2_07;
     case INDEX_op_ssadd_vec:
     case INDEX_op_sssub_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
-    case INDEX_op_shlv_vec:
-    case INDEX_op_shrv_vec:
-    case INDEX_op_sarv_vec:
         return vece <= MO_32;
     case INDEX_op_cmp_vec:
-    case INDEX_op_mul_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
-        return vece <= MO_32 ? -1 : 0;
+        return vece <= MO_32 || have_isa_2_07 ? -1 : 0;
+    case INDEX_op_mul_vec:
+        switch (vece) {
+        case MO_8:
+        case MO_16:
+            return -1;
+        case MO_32:
+            return have_isa_2_07 ? 1 : -1;
+        }
+        return 0;
     case INDEX_op_bitsel_vec:
         return have_vsx;
     default:
@@ -3027,28 +3057,28 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            const TCGArg *args, const int *const_args)
 {
     static const uint32_t
-        add_op[4] = { VADDUBM, VADDUHM, VADDUWM, 0 },
-        sub_op[4] = { VSUBUBM, VSUBUHM, VSUBUWM, 0 },
-        eq_op[4]  = { VCMPEQUB, VCMPEQUH, VCMPEQUW, 0 },
-        gts_op[4] = { VCMPGTSB, VCMPGTSH, VCMPGTSW, 0 },
-        gtu_op[4] = { VCMPGTUB, VCMPGTUH, VCMPGTUW, 0 },
+        add_op[4] = { VADDUBM, VADDUHM, VADDUWM, VADDUDM },
+        sub_op[4] = { VSUBUBM, VSUBUHM, VSUBUWM, VSUBUDM },
+        eq_op[4]  = { VCMPEQUB, VCMPEQUH, VCMPEQUW, VCMPEQUD },
+        gts_op[4] = { VCMPGTSB, VCMPGTSH, VCMPGTSW, VCMPGTSD },
+        gtu_op[4] = { VCMPGTUB, VCMPGTUH, VCMPGTUW, VCMPGTUD },
         ssadd_op[4] = { VADDSBS, VADDSHS, VADDSWS, 0 },
         usadd_op[4] = { VADDUBS, VADDUHS, VADDUWS, 0 },
         sssub_op[4] = { VSUBSBS, VSUBSHS, VSUBSWS, 0 },
         ussub_op[4] = { VSUBUBS, VSUBUHS, VSUBUWS, 0 },
-        umin_op[4] = { VMINUB, VMINUH, VMINUW, 0 },
-        smin_op[4] = { VMINSB, VMINSH, VMINSW, 0 },
-        umax_op[4] = { VMAXUB, VMAXUH, VMAXUW, 0 },
-        smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, 0 },
-        shlv_op[4] = { VSLB, VSLH, VSLW, 0 },
-        shrv_op[4] = { VSRB, VSRH, VSRW, 0 },
-        sarv_op[4] = { VSRAB, VSRAH, VSRAW, 0 },
+        umin_op[4] = { VMINUB, VMINUH, VMINUW, VMINUD },
+        smin_op[4] = { VMINSB, VMINSH, VMINSW, VMINSD },
+        umax_op[4] = { VMAXUB, VMAXUH, VMAXUW, VMAXUD },
+        smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, VMAXSD },
+        shlv_op[4] = { VSLB, VSLH, VSLW, VSLD },
+        shrv_op[4] = { VSRB, VSRH, VSRW, VSRD },
+        sarv_op[4] = { VSRAB, VSRAH, VSRAW, VSRAD },
         mrgh_op[4] = { VMRGHB, VMRGHH, VMRGHW, 0 },
         mrgl_op[4] = { VMRGLB, VMRGLH, VMRGLW, 0 },
-        muleu_op[4] = { VMULEUB, VMULEUH, 0, 0 },
-        mulou_op[4] = { VMULOUB, VMULOUH, 0, 0 },
+        muleu_op[4] = { VMULEUB, VMULEUH, VMULEUW, 0 },
+        mulou_op[4] = { VMULOUB, VMULOUH, VMULOUW, 0 },
         pkum_op[4] = { VPKUHUM, VPKUWUM, 0, 0 },
-        rotl_op[4] = { VRLB, VRLH, VRLW, 0 };
+        rotl_op[4] = { VRLB, VRLH, VRLW, VRLD };
 
     TCGType type = vecl + TCG_TYPE_V64;
     TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
@@ -3071,6 +3101,10 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sub_vec:
         insn = sub_op[vece];
         break;
+    case INDEX_op_mul_vec:
+        tcg_debug_assert(vece == MO_32 && have_isa_2_07);
+        insn = VMULUWM;
+        break;
     case INDEX_op_ssadd_vec:
         insn = ssadd_op[vece];
         break;
@@ -3120,6 +3154,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         insn = VNOR;
         a2 = a1;
         break;
+    case INDEX_op_orc_vec:
+        insn = VORC;
+        break;
 
     case INDEX_op_cmp_vec:
         switch (args[3]) {
@@ -3200,7 +3237,7 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
 {
     bool need_swap = false, need_inv = false;
 
-    tcg_debug_assert(vece <= MO_32);
+    tcg_debug_assert(vece <= MO_32 || have_isa_2_07);
 
     switch (cond) {
     case TCG_COND_EQ:
@@ -3264,6 +3301,7 @@ static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
 	break;
 
     case MO_32:
+        tcg_debug_assert(!have_isa_2_07);
         t3 = tcg_temp_new_vec(type);
         t4 = tcg_temp_new_vec(type);
         tcg_gen_dupi_vec(MO_8, t4, -16);
@@ -3554,6 +3592,11 @@ static void tcg_target_init(TCGContext *s)
     if (hwcap & PPC_FEATURE_ARCH_2_06) {
         have_isa = tcg_isa_2_06;
     }
+#ifdef PPC_FEATURE2_ARCH_2_07
+    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
+        have_isa = tcg_isa_2_07;
+    }
+#endif
 #ifdef PPC_FEATURE2_ARCH_3_00
     if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
         have_isa = tcg_isa_3_00;
-- 
2.17.1


