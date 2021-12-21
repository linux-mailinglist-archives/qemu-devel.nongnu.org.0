Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671CB47C46A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:01:34 +0100 (CET)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziW5-0003hs-Gc
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:01:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIz-0000Ti-OK
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:01 -0500
Received: from [2607:f8b0:4864:20::630] (port=42659
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIu-0007dj-P7
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:01 -0500
Received: by mail-pl1-x630.google.com with SMTP id u16so5130121plg.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3IfsTdV++ttG/ya2ZB3/Tnu3hCKPlZE3g7VrtqS5qs=;
 b=Yeg8AST4CNOucOgTT6w+X4gPmPq5dcct0qbHq2JkL5nEHNHlh0dx+rISAlupygPxzt
 Ff2jVbxD/KF5PIQK9hxsSLWgH3W821ISL/bXTdcKK9XPZaxs9GVU4wBblVzO12Fq9IJ2
 yYfKKy9+YtlNtfSSWTXpUMHHEEdou7NNbO+JvJt114QPkNRc20QSVpOptQUTRBGlRB4M
 hfr3hR9SlIwz7CZcF889CeqBwooRaBhZouLAcsvymdu2RZ2LreOKzOkkvyenugEELdzF
 mpuMptmYva963iBIqu1ELWPE73mDHSKZ8TQzCKZayjHuRPPP1gblXtdAeLzi1toUKftV
 zxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3IfsTdV++ttG/ya2ZB3/Tnu3hCKPlZE3g7VrtqS5qs=;
 b=xem4hCenScfQAczQX5kO2GG2ADnXbnE1OGRuvYEz3vWDunDD1DoM3VvCv8eB85QhJ+
 Z13GrQqycccNCSHeZzyM2XQfWdn/3zqDDRtMahGLUxHtcjSd8BobUNpd9x5T0HjUYsqf
 NMQFaZnGGEpXoYleEBJmOHizCsZCLDOw/s9jwX5e20L9DxILklp1rXKJ0uM+oLEpR3f1
 NjB2CEgsAPWCdYxH42qRtC/IJe16/fFYdg9Lz4/Jhsx/9pGKf1djRJCZwUqtc1AXzc3b
 e9PYoIsvMBaJWCXN9Vcf6u4tYqU4RKk/y4+RuY7ACVHwEMum+OK1hUiG7fHrK+3n6Vvw
 hmiA==
X-Gm-Message-State: AOAM530Cup0PYcYfAxejewYNr88Q8RG4NU+H11mvhiNyDsKnkj0cSugD
 X60a9Ocux9ayg8CtTv3bnYL2pInmVm3unQ==
X-Google-Smtp-Source: ABdhPJwH+X5zjiqzQBsKClqve+toalfVNu7/BjmEECMO504FSclKvaNHBY1maUg8XLvZwRL2svOykA==
X-Received: by 2002:a17:90b:3b81:: with SMTP id
 pc1mr5095709pjb.67.1640105275604; 
 Tue, 21 Dec 2021 08:47:55 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/31] tcg/loongarch64: Implement
 mul/mulsh/muluh/div/divu/rem/remu ops
Date: Tue, 21 Dec 2021 08:47:24 -0800
Message-Id: <20211221164737.1076007-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-19-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.h         | 16 +++----
 tcg/loongarch64/tcg-target.c.inc     | 65 ++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 4b8ce85897..fb56f3a295 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -23,3 +23,4 @@ C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, rZ, rN)
+C_O1_I2(r, rZ, rZ)
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index d1ded50cb0..05010805e7 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -93,8 +93,8 @@ typedef enum {
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
-#define TCG_TARGET_HAS_div_i32          0
-#define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_div_i32          1
+#define TCG_TARGET_HAS_rem_i32          1
 #define TCG_TARGET_HAS_div2_i32         0
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_deposit_i32      1
@@ -105,8 +105,8 @@ typedef enum {
 #define TCG_TARGET_HAS_sub2_i32         0
 #define TCG_TARGET_HAS_mulu2_i32        0
 #define TCG_TARGET_HAS_muls2_i32        0
-#define TCG_TARGET_HAS_muluh_i32        0
-#define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_muluh_i32        1
+#define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_ext8s_i32        1
 #define TCG_TARGET_HAS_ext16s_i32       1
 #define TCG_TARGET_HAS_ext8u_i32        1
@@ -130,8 +130,8 @@ typedef enum {
 
 /* 64-bit operations */
 #define TCG_TARGET_HAS_movcond_i64      0
-#define TCG_TARGET_HAS_div_i64          0
-#define TCG_TARGET_HAS_rem_i64          0
+#define TCG_TARGET_HAS_div_i64          1
+#define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_div2_i64         0
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_deposit_i64      1
@@ -163,8 +163,8 @@ typedef enum {
 #define TCG_TARGET_HAS_sub2_i64         0
 #define TCG_TARGET_HAS_mulu2_i64        0
 #define TCG_TARGET_HAS_muls2_i64        0
-#define TCG_TARGET_HAS_muluh_i64        0
-#define TCG_TARGET_HAS_mulsh_i64        0
+#define TCG_TARGET_HAS_muluh_i64        1
+#define TCG_TARGET_HAS_mulsh_i64        1
 
 /* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index c71d25d3fe..0ae193fba5 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -717,6 +717,55 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_mul_i32:
+        tcg_out_opc_mul_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_mul_i64:
+        tcg_out_opc_mul_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_mulsh_i32:
+        tcg_out_opc_mulh_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_mulsh_i64:
+        tcg_out_opc_mulh_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_muluh_i32:
+        tcg_out_opc_mulh_wu(s, a0, a1, a2);
+        break;
+    case INDEX_op_muluh_i64:
+        tcg_out_opc_mulh_du(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_div_i32:
+        tcg_out_opc_div_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_div_i64:
+        tcg_out_opc_div_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_divu_i32:
+        tcg_out_opc_div_wu(s, a0, a1, a2);
+        break;
+    case INDEX_op_divu_i64:
+        tcg_out_opc_div_du(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_rem_i32:
+        tcg_out_opc_mod_w(s, a0, a1, a2);
+        break;
+    case INDEX_op_rem_i64:
+        tcg_out_opc_mod_d(s, a0, a1, a2);
+        break;
+
+    case INDEX_op_remu_i32:
+        tcg_out_opc_mod_wu(s, a0, a1, a2);
+        break;
+    case INDEX_op_remu_i64:
+        tcg_out_opc_mod_du(s, a0, a1, a2);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -808,6 +857,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub_i64:
         return C_O1_I2(r, rZ, rN);
 
+    case INDEX_op_mul_i32:
+    case INDEX_op_mul_i64:
+    case INDEX_op_mulsh_i32:
+    case INDEX_op_mulsh_i64:
+    case INDEX_op_muluh_i32:
+    case INDEX_op_muluh_i64:
+    case INDEX_op_div_i32:
+    case INDEX_op_div_i64:
+    case INDEX_op_divu_i32:
+    case INDEX_op_divu_i64:
+    case INDEX_op_rem_i32:
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i32:
+    case INDEX_op_remu_i64:
+        return C_O1_I2(r, rZ, rZ);
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


