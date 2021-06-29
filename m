Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3493B7899
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:28:20 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJP9-0005Cu-8M
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItV-0000G5-OS
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:37 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItD-0000xE-68
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:37 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o3so43294plg.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kCiP3VSDiYczcJLXUPyx80NLpZIuJ9ygaJY4dh71cMc=;
 b=aYBeWqjqR0inrjIkOAZ0L24XThIsboDf+kFSi+snnC3vvraaBQaP8LOPWSnI65cJJh
 /eWP6bYSe9dKTo4IJUpo7xhAtGKDx6Swf4/1pR4blLaCqKWfWoDPaZdUde+wpSo8vKjH
 Hibk2HLdM/NalygVy+hEtLie0KVjOs9+Zt/fIDq1HfLzOVvMWTNvBHByCj2BlaAfjV7E
 bGYuhY8n8vnVzIJCGj63h/cJdpug2VBc9ufrhUcjVjgiIoLCVm/gIPiPPL7MwXAvap9n
 g42p9vHV2J7dPv1IQeCEdKRcRC8VFqRoyYw/ZsPpj9jjtLZ4OSsFMC6c80F3ETutAwAx
 pbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kCiP3VSDiYczcJLXUPyx80NLpZIuJ9ygaJY4dh71cMc=;
 b=I9QV5/Nr4SfazwTrrd5UrFMqXY8AH8HbX7kVJAmp4Sn5Vll8uxZF4wxC5RRE50drqj
 AIgSTF30aZhryuqx+iAabeT7yXtaAwZIoCx5aQlTdvnmyBf6CCxXECFzDyM6oDWznNDv
 fYyBiEAvPd71aE5ORhVZFO/T6EYJYgkVPLUxy/8RLB/0vy4P+sAmnnUTI1XGABf5/Lg5
 bBmHsKPv5vTySH/6grHD3yYrQMR4nzxXHn6OGNdX1gQO1xECmz7lR5rw+ACUranDO6NP
 mIgTNiW3jnC2OQGuSVAIm6WHVtXsRhrz1KLw6k1/V5y4s5N+vnkoYPyd4HpgwVEJlOnh
 4mNA==
X-Gm-Message-State: AOAM531jlS4doUdJsbiOJLDVX7SupGb4oRSnve2QVUsDpv5QQExsCk2y
 99xSUpPeFAfyWRPjmqoh8/toNkVUQryt4g==
X-Google-Smtp-Source: ABdhPJz7zYJgr1fheqhKxeWA49/3WWU9j9nYdWePNtPvC0FsdS8SsxnVWbgwyuZBocuIVOwbuulPcQ==
X-Received: by 2002:a17:902:8ec9:b029:11f:f1dc:6c8d with SMTP id
 x9-20020a1709028ec9b029011ff1dc6c8dmr28673232plo.34.1624992917828; 
 Tue, 29 Jun 2021 11:55:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/63] tcg: Add flags argument to bswap opcodes
Date: Tue, 29 Jun 2021 11:54:27 -0700
Message-Id: <20210629185455.3131172-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will eventually simplify front-end usage, and will allow
backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
optimization.

The argument is added during expansion, not currently exposed to the
front end translators.  The backends currently only support a flags
value of either TCG_BSWAP_IZ, or (TCG_BSWAP_IZ | TCG_BSWAP_OZ),
since they all require zero top bytes and leave them that way.
At the existing call sites we pass in (TCG_BSWAP_IZ | TCG_BSWAP_OZ),
except for the flags-ignored cases of a 32-bit swap of a 32-bit
value and or a 64-bit swap of a 64-bit value, where we pass 0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h | 10 +++++-----
 include/tcg/tcg.h     | 12 ++++++++++++
 tcg/tcg-op.c          | 13 ++++++++-----
 tcg/tcg.c             | 28 ++++++++++++++++++++++++++++
 tcg/README            | 22 ++++++++++++++--------
 5 files changed, 67 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 5bbec858aa..993992373e 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -96,8 +96,8 @@ DEF(ext8s_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext8s_i32))
 DEF(ext16s_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext16s_i32))
 DEF(ext8u_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext8u_i32))
 DEF(ext16u_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext16u_i32))
-DEF(bswap16_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_bswap16_i32))
-DEF(bswap32_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_bswap32_i32))
+DEF(bswap16_i32, 1, 1, 1, IMPL(TCG_TARGET_HAS_bswap16_i32))
+DEF(bswap32_i32, 1, 1, 1, IMPL(TCG_TARGET_HAS_bswap32_i32))
 DEF(not_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_i32))
 DEF(neg_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_i32))
 DEF(andc_i32, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_i32))
@@ -165,9 +165,9 @@ DEF(ext32s_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext32s_i64))
 DEF(ext8u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext8u_i64))
 DEF(ext16u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext16u_i64))
 DEF(ext32u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext32u_i64))
-DEF(bswap16_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap16_i64))
-DEF(bswap32_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap32_i64))
-DEF(bswap64_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap64_i64))
+DEF(bswap16_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap16_i64))
+DEF(bswap32_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap32_i64))
+DEF(bswap64_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap64_i64))
 DEF(not_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_not_i64))
 DEF(neg_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_neg_i64))
 DEF(andc_i64, 1, 2, 0, IMPL64 | IMPL(TCG_TARGET_HAS_andc_i64))
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2dad364240..899493701c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -408,6 +408,18 @@ typedef TCGv_ptr TCGv_env;
 /* Used to align parameters.  See the comment before tcgv_i32_temp.  */
 #define TCG_CALL_DUMMY_ARG      ((TCGArg)0)
 
+/*
+ * Flags for the bswap opcodes.
+ * If IZ, the input is zero-extended, otherwise unknown.
+ * If OZ or OS, the output is zero- or sign-extended respectively,
+ * otherwise the high bits are undefined.
+ */
+enum {
+    TCG_BSWAP_IZ = 1,
+    TCG_BSWAP_OZ = 2,
+    TCG_BSWAP_OS = 4,
+};
+
 typedef enum TCGTempVal {
     TEMP_VAL_DEAD,
     TEMP_VAL_REG,
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index dcc2ed0bbc..dc65577e2f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1005,7 +1005,8 @@ void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg)
 void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
 {
     if (TCG_TARGET_HAS_bswap16_i32) {
-        tcg_gen_op2_i32(INDEX_op_bswap16_i32, ret, arg);
+        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg,
+                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     } else {
         TCGv_i32 t0 = tcg_temp_new_i32();
 
@@ -1020,7 +1021,7 @@ void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
 void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
 {
     if (TCG_TARGET_HAS_bswap32_i32) {
-        tcg_gen_op2_i32(INDEX_op_bswap32_i32, ret, arg);
+        tcg_gen_op3i_i32(INDEX_op_bswap32_i32, ret, arg, 0);
     } else {
         TCGv_i32 t0 = tcg_temp_new_i32();
         TCGv_i32 t1 = tcg_temp_new_i32();
@@ -1661,7 +1662,8 @@ void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg)
         tcg_gen_bswap16_i32(TCGV_LOW(ret), TCGV_LOW(arg));
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
     } else if (TCG_TARGET_HAS_bswap16_i64) {
-        tcg_gen_op2_i64(INDEX_op_bswap16_i64, ret, arg);
+        tcg_gen_op3i_i64(INDEX_op_bswap16_i64, ret, arg,
+                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
 
@@ -1680,7 +1682,8 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
         tcg_gen_bswap32_i32(TCGV_LOW(ret), TCGV_LOW(arg));
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
     } else if (TCG_TARGET_HAS_bswap32_i64) {
-        tcg_gen_op2_i64(INDEX_op_bswap32_i64, ret, arg);
+        tcg_gen_op3i_i64(INDEX_op_bswap32_i64, ret, arg,
+                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
@@ -1717,7 +1720,7 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
         tcg_temp_free_i32(t0);
         tcg_temp_free_i32(t1);
     } else if (TCG_TARGET_HAS_bswap64_i64) {
-        tcg_gen_op2_i64(INDEX_op_bswap64_i64, ret, arg);
+        tcg_gen_op3i_i64(INDEX_op_bswap64_i64, ret, arg, 0);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5e53c3348f..5150ed700e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1778,6 +1778,14 @@ static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
     [MO_ALIGN_64 >> MO_ASHIFT] = "al64+",
 };
 
+static const char bswap_flag_name[][6] = {
+    [TCG_BSWAP_IZ] = "iz",
+    [TCG_BSWAP_OZ] = "oz",
+    [TCG_BSWAP_OS] = "os",
+    [TCG_BSWAP_IZ | TCG_BSWAP_OZ] = "iz,oz",
+    [TCG_BSWAP_IZ | TCG_BSWAP_OS] = "iz,os",
+};
+
 static inline bool tcg_regset_single(TCGRegSet d)
 {
     return (d & (d - 1)) == 0;
@@ -1921,6 +1929,26 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                     i = 1;
                 }
                 break;
+            case INDEX_op_bswap16_i32:
+            case INDEX_op_bswap16_i64:
+            case INDEX_op_bswap32_i32:
+            case INDEX_op_bswap32_i64:
+            case INDEX_op_bswap64_i64:
+                {
+                    TCGArg flags = op->args[k];
+                    const char *name = NULL;
+
+                    if (flags < ARRAY_SIZE(bswap_flag_name)) {
+                        name = bswap_flag_name[flags];
+                    }
+                    if (name) {
+                        col += qemu_log(",%s", name);
+                    } else {
+                        col += qemu_log(",$0x%" TCG_PRIlx, flags);
+                    }
+                    i = k = 1;
+                }
+                break;
             default:
                 i = 0;
                 break;
diff --git a/tcg/README b/tcg/README
index 8510d823e3..c2e7762a37 100644
--- a/tcg/README
+++ b/tcg/README
@@ -295,19 +295,25 @@ ext32u_i64 t0, t1
 
 8, 16 or 32 bit sign/zero extension (both operands must have the same type)
 
-* bswap16_i32/i64 t0, t1
+* bswap16_i32/i64 t0, t1, flags
 
-16 bit byte swap on a 32/64 bit value. It assumes that the two/six high order
-bytes are set to zero.
+16 bit byte swap on the low bits of a 32/64 bit input.
+If flags & TCG_BSWAP_IZ, then t1 is known to be zero-extended from bit 15.
+If flags & TCG_BSWAP_OZ, then t0 will be zero-extended from bit 15.
+If flags & TCG_BSWAP_OS, then t0 will be sign-extended from bit 15.
+If neither TCG_BSWAP_OZ nor TCG_BSWAP_OS are set, then the bits of
+t0 above bit 15 may contain any value.
 
-* bswap32_i32/i64 t0, t1
+* bswap32_i64 t0, t1, flags
 
-32 bit byte swap on a 32/64 bit value. With a 64 bit value, it assumes that
-the four high order bytes are set to zero.
+32 bit byte swap on a 64-bit value.  The flags are the same as for bswap16,
+except they apply from bit 31 instead of bit 15.
 
-* bswap64_i64 t0, t1
+* bswap32_i32 t0, t1, flags
+* bswap64_i64 t0, t1, flags
 
-64 bit byte swap
+32/64 bit byte swap.  The flags are ignored, but still present
+for consistency with the other bswap opcodes.
 
 * discard_i32/i64 t0
 
-- 
2.25.1


