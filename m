Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A467A553C39
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:56:43 +0200 (CEST)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kvS-0002mM-Oq
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klw-0006bs-Ac
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klq-000154-R4
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:52 -0400
Received: by mail-pg1-x52a.google.com with SMTP id g186so14178166pgc.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rcQQvkjuqgahHehXyIb2ynncqemhUxF2dHu+EZxsI7w=;
 b=GyS9p8iQqVYmEYsnQycF/9Clo0dlYdE72tpZhsh9ai2eJvXipPZg3G/zi9kW4ID289
 5RWgHm1yjPhzMofr6b5JzcAuL2cjU0gAqTUjil8ZACmqoV418C3PS+xhL+Rv6JNRJw3N
 wGRmJ4RuOIZENmMs7a3n5grLzR6KnMujpUWTDSppRS9Ujt6vxsBexf8QEQJE8QLRM5Dj
 fCNvnY+Puitp4X9jVl3hy6IkgbAaQDl8i6Ujx5CAXZOaqRoKdSRYercN7npGLo7rla1D
 93cH+abSMJAVrnxwlR7kOqfvuMOtpBzLNlnzKzvynLTi26qI/sB604A4L4c534jRlj7L
 T0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rcQQvkjuqgahHehXyIb2ynncqemhUxF2dHu+EZxsI7w=;
 b=sGcQan479lkOwRxM5ObdwnmtZF15fPhnuttByczpV3yPychHAnp2as3tSTXXaIHP4r
 KqpqpKhugWJWZ/4J5iWz+7neCBaAEI1hknWKc8Zby9qae+KIpAwxu45fYJwoEX1ia676
 Yz4o0GYRycU0xwJWxqpY11l5ciBoi4SVBHH6pw+Tul97LmR4Ds2lgi30CTh/8V3n4sNm
 49wVW4T45qbKZBo5ugVXKz6L0A3xqXsJoCFLzGEJMJUNqphc4vK58bw/HcMPMstmUZGj
 9a1mO/zYU7QgslpZeSUN89wcNUZawC/DjNGhns6r4hqBeA8r9KQAgX4JlbVMy0qlsSRX
 teog==
X-Gm-Message-State: AJIora9HwPVbceIIqDp5QmoLw4XufPVYfo23zwc+ndgmmLuIOxMv9xQH
 KKi/UfWk+Lv6Ox3fuZbOQdCb+o6jXYzXzA==
X-Google-Smtp-Source: AGRyM1tqXy+CcWrpOZtNefOZ9Jl5VDC6az5pn0wV+D60GME3yNxT73AKqkU3aIXskyenl0U7JzxlNg==
X-Received: by 2002:a63:82c1:0:b0:407:65bd:5710 with SMTP id
 w184-20020a6382c1000000b0040765bd5710mr27545462pgd.76.1655844405314; 
 Tue, 21 Jun 2022 13:46:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 1/9] tcg/ppc: implement rem[u]_i{32,64} with mod[su][wd]
Date: Tue, 21 Jun 2022 13:46:35 -0700
Message-Id: <20220621204643.371397-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>

Power ISA v3.0 introduced mod[su][wd] insns that can be used to
implement rem[u]_i{32,64}.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |  4 ++--
 tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index e6cf72503f..b5cd225cfa 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -83,7 +83,7 @@ extern bool have_vsx;
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
-#define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_rem_i32          have_isa_3_00
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_ext8s_i32        1
 #define TCG_TARGET_HAS_ext16s_i32       1
@@ -117,7 +117,7 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
 #define TCG_TARGET_HAS_div_i64          1
-#define TCG_TARGET_HAS_rem_i64          0
+#define TCG_TARGET_HAS_rem_i64          have_isa_3_00
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_ext8s_i64        1
 #define TCG_TARGET_HAS_ext16s_i64       1
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index de4483e43b..1cbd047ab3 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -371,6 +371,8 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define MULHWU XO31( 11)
 #define DIVW   XO31(491)
 #define DIVWU  XO31(459)
+#define MODSW  XO31(779)
+#define MODUW  XO31(267)
 #define CMP    XO31(  0)
 #define CMPL   XO31( 32)
 #define LHBRX  XO31(790)
@@ -403,6 +405,8 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define MULHDU XO31(  9)
 #define DIVD   XO31(489)
 #define DIVDU  XO31(457)
+#define MODSD  XO31(777)
+#define MODUD  XO31(265)
 
 #define LBZX   XO31( 87)
 #define LHZX   XO31(279)
@@ -2806,6 +2810,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out32(s, DIVWU | TAB(args[0], args[1], args[2]));
         break;
 
+    case INDEX_op_rem_i32:
+        tcg_out32(s, MODSW | TAB(args[0], args[1], args[2]));
+        break;
+
+    case INDEX_op_remu_i32:
+        tcg_out32(s, MODUW | TAB(args[0], args[1], args[2]));
+        break;
+
     case INDEX_op_shl_i32:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
@@ -2947,6 +2959,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         tcg_out32(s, DIVDU | TAB(args[0], args[1], args[2]));
         break;
+    case INDEX_op_rem_i64:
+        tcg_out32(s, MODSD | TAB(args[0], args[1], args[2]));
+        break;
+    case INDEX_op_remu_i64:
+        tcg_out32(s, MODUD | TAB(args[0], args[1], args[2]));
+        break;
 
     case INDEX_op_qemu_ld_i32:
         tcg_out_qemu_ld(s, args, false);
@@ -3722,6 +3740,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_div_i32:
     case INDEX_op_divu_i32:
+    case INDEX_op_rem_i32:
+    case INDEX_op_remu_i32:
     case INDEX_op_nand_i32:
     case INDEX_op_nor_i32:
     case INDEX_op_muluh_i32:
@@ -3732,6 +3752,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_nor_i64:
     case INDEX_op_div_i64:
     case INDEX_op_divu_i64:
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i64:
     case INDEX_op_mulsh_i64:
     case INDEX_op_muluh_i64:
         return C_O1_I2(r, r, r);
-- 
2.34.1


