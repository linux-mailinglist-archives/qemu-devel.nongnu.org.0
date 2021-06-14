Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52A3A5E9D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:51:50 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiJw-0001aO-57
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6w-0002Qr-O8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6n-0003ao-86
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id e1so6151761plh.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4hwXCHaT/vW/aMtR3cJ4Vr8bzsPcCgTPjrmVdwIPgV4=;
 b=cpc/6/7O7brmAkDc73FOJrUFTku3lMRMK+BbT81o8hyEWz+OGii/FMVxNQ6Qg5hAAQ
 JSq6JpCeROUVT+19Kk2Dk3nvKgambMo2DTKxzNEpvOEAuXlQ7Q17Y3yhe6XTV4mwP6Wm
 VnPqy5g3xLkpjWXTBpu8fI8ADEF+wkI1zIMPmryTjTTkXQH3V99b8wDaCNg950r6MiuW
 m+TnT1O5b8jZZWmryKU+9RWj58YB/jqAbK+HPIOpMIYY9uXxnhjfk9tvSFTwi3pFD+4g
 v1tvJgZkOQ2RsKkXax9ksexo7jLBsuEks269ptKhRKNvpFO2GLK3XGo3Muug4C4qLIjJ
 O48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4hwXCHaT/vW/aMtR3cJ4Vr8bzsPcCgTPjrmVdwIPgV4=;
 b=nmj563aEODYbImySUKMNsaemkYg4dd4pS36+3q157NDRpuDk+Eqw/3b25LW3tFsinh
 yGA6y2fotE68/z34vsffMhtEA/5GpyK6KZ5PNQrSM/e1PcFwVFeqXqttX2Glizcgkf+0
 N5fh0Vw1b6gONihQQ1GCa3bEYoL04lwjiJMwtj5uWIMH/Lua+I/y+ivKRThm7eLwROS8
 +fXshIzNjgnS+uXpMnDa2qlJuRdMI63EjqVrXY5aEArFaOxxq2CD6T5bD2+Umb0BHFeg
 GQ4EZ+F/FD4VpSpyci0V/DhDxrmz53/l3G4p5Z9tizD4S7x7MhbVMPV4pXblWS9f7hOc
 WLSQ==
X-Gm-Message-State: AOAM533bHb2x1THNidusKy7HvI4lPS/m+PVFy8UgvxbGPFDx39xgki4L
 YcPFxn0oSsQVolgcJl6XL04W8xubLaBHNg==
X-Google-Smtp-Source: ABdhPJym7NHzTVg3dK+HqLj5hYGddY1rNxKsCzfBgCaFDB+DXYCu+heEB8S/gGWzy9sA7T2PmcaBvg==
X-Received: by 2002:a17:90a:398f:: with SMTP id
 z15mr17854680pjb.183.1623659891820; 
 Mon, 14 Jun 2021 01:38:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/28] tcg: Add flags argument to tcg_gen_bswap16_*,
 tcg_gen_bswap32_i64
Date: Mon, 14 Jun 2021 01:37:49 -0700
Message-Id: <20210614083800.1166166-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the new semantics in the fallback expansion.
Change all callers to supply the flags that keep the
semantics unchanged locally.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h            |   8 +--
 target/arm/translate-a64.c      |  12 ++--
 target/arm/translate.c          |   2 +-
 target/i386/tcg/translate.c     |   2 +-
 target/mips/tcg/mxu_translate.c |   2 +-
 target/s390x/translate.c        |   4 +-
 target/sh4/translate.c          |   2 +-
 tcg/tcg-op.c                    | 121 ++++++++++++++++++++++----------
 8 files changed, 99 insertions(+), 54 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index ef8a008ea7..caf6ba2149 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -330,7 +330,7 @@ void tcg_gen_ext8s_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_ext16s_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_ext8u_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg);
-void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg);
+void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg, int flags);
 void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg);
 void tcg_gen_smin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_smax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
@@ -525,8 +525,8 @@ void tcg_gen_ext32s_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_ext8u_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_ext16u_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_ext32u_i64(TCGv_i64 ret, TCGv_i64 arg);
-void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg);
-void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg);
+void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
+void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
 void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_smin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_smax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
@@ -1185,7 +1185,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_ext32u_tl tcg_gen_mov_i32
 #define tcg_gen_ext32s_tl tcg_gen_mov_i32
 #define tcg_gen_bswap16_tl tcg_gen_bswap16_i32
-#define tcg_gen_bswap32_tl tcg_gen_bswap32_i32
+#define tcg_gen_bswap32_tl(D, S, F) tcg_gen_bswap32_i32(D, S)
 #define tcg_gen_bswap_tl tcg_gen_bswap32_i32
 #define tcg_gen_concat_tl_i64 tcg_gen_concat_i32_i64
 #define tcg_gen_extr_i64_tl tcg_gen_extr_i64_i32
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8713dfec17..e0785ce859 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5437,15 +5437,15 @@ static void handle_rev32(DisasContext *s, unsigned int sf,
 
         /* bswap32_i64 requires zero high word */
         tcg_gen_ext32u_i64(tcg_tmp, tcg_rn);
-        tcg_gen_bswap32_i64(tcg_rd, tcg_tmp);
+        tcg_gen_bswap32_i64(tcg_rd, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp);
+        tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         tcg_gen_concat32_i64(tcg_rd, tcg_rd, tcg_tmp);
 
         tcg_temp_free_i64(tcg_tmp);
     } else {
         tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, rn));
-        tcg_gen_bswap32_i64(tcg_rd, tcg_rd);
+        tcg_gen_bswap32_i64(tcg_rd, tcg_rd, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     }
 }
 
@@ -12436,10 +12436,12 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
             read_vec_element(s, tcg_tmp, rn, i, grp_size);
             switch (grp_size) {
             case MO_16:
-                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
+                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp,
+                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
                 break;
             case MO_32:
-                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp);
+                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp,
+                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
                 break;
             case MO_64:
                 tcg_gen_bswap64_i64(tcg_tmp, tcg_tmp);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8e0e55c1e0..6b88163e3a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -342,7 +342,7 @@ void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
 {
     tcg_gen_ext16u_i32(var, var);
-    tcg_gen_bswap16_i32(var, var);
+    tcg_gen_bswap16_i32(var, var, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     tcg_gen_ext16s_i32(dest, var);
 }
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a7f5c0c8f2..e8a9dcd21a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7203,7 +7203,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         {
             gen_op_mov_v_reg(s, MO_32, s->T0, reg);
             tcg_gen_ext32u_tl(s->T0, s->T0);
-            tcg_gen_bswap32_tl(s->T0, s->T0);
+            tcg_gen_bswap32_tl(s->T0, s->T0, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             gen_op_mov_reg_v(s, MO_32, reg, s->T0);
         }
         break;
diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index fb0a811af6..c12cf78df7 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -861,7 +861,7 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
 
     if (sel == 1) {
         /* S32LDDR */
-        tcg_gen_bswap32_tl(t1, t1);
+        tcg_gen_bswap32_tl(t1, t1, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     }
     gen_store_mxu_gpr(t1, XRa);
 
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index e243624d2a..03dab9f350 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -3939,13 +3939,13 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_rev16(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_bswap16_i64(o->out, o->in2);
+    tcg_gen_bswap16_i64(o->out, o->in2, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_rev32(DisasContext *s, DisasOps *o)
 {
-    tcg_gen_bswap32_i64(o->out, o->in2);
+    tcg_gen_bswap32_i64(o->out, o->in2, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     return DISAS_NEXT;
 }
 
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 9312790623..147219759b 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -677,7 +677,7 @@ static void _decode_opc(DisasContext * ctx)
 	{
             TCGv low = tcg_temp_new();
 	    tcg_gen_ext16u_i32(low, REG(B7_4));
-	    tcg_gen_bswap16_i32(low, low);
+	    tcg_gen_bswap16_i32(low, low, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
 	    tcg_temp_free(low);
 	}
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index dc65577e2f..3763285bb0 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1001,20 +1001,35 @@ void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg)
     }
 }
 
-/* Note: we assume the two high bytes are set to zero */
-void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
+void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg, int flags)
 {
+    /* Only one extension flag may be present. */
+    tcg_debug_assert(!(flags & TCG_BSWAP_OS) || !(flags & TCG_BSWAP_OZ));
+
     if (TCG_TARGET_HAS_bswap16_i32) {
-        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg,
-                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg, flags);
     } else {
         TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t1 = tcg_temp_new_i32();
 
-        tcg_gen_ext8u_i32(t0, arg);
-        tcg_gen_shli_i32(t0, t0, 8);
-        tcg_gen_shri_i32(ret, arg, 8);
-        tcg_gen_or_i32(ret, ret, t0);
+        tcg_gen_shri_i32(t0, arg, 8);
+        if (!(flags & TCG_BSWAP_IZ)) {
+            tcg_gen_ext8u_i32(t0, t0);
+        }
+
+        if (flags & TCG_BSWAP_OS) {
+            tcg_gen_shli_i32(t1, t1, 24);
+            tcg_gen_sari_i32(t1, t1, 16);
+        } else if (flags & TCG_BSWAP_OZ) {
+            tcg_gen_ext8u_i32(t1, arg);
+            tcg_gen_shli_i32(t1, t1, 8);
+        } else {
+            tcg_gen_shli_i32(t1, arg, 8);
+        }
+
+        tcg_gen_or_i32(ret, t0, t1);
         tcg_temp_free_i32(t0);
+        tcg_temp_free_i32(t1);
     }
 }
 
@@ -1655,51 +1670,79 @@ void tcg_gen_ext32u_i64(TCGv_i64 ret, TCGv_i64 arg)
     }
 }
 
-/* Note: we assume the six high bytes are set to zero */
-void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg)
+void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg, int flags)
 {
+    /* Only one extension flag may be present. */
+    tcg_debug_assert(!(flags & TCG_BSWAP_OS) || !(flags & TCG_BSWAP_OZ));
+
     if (TCG_TARGET_REG_BITS == 32) {
-        tcg_gen_bswap16_i32(TCGV_LOW(ret), TCGV_LOW(arg));
-        tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
+        tcg_gen_bswap16_i32(TCGV_LOW(ret), TCGV_LOW(arg), flags);
+        if (flags & TCG_BSWAP_OS) {
+            tcg_gen_sari_i32(TCGV_HIGH(ret), TCGV_LOW(ret), 31);
+        } else {
+            tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
+        }
     } else if (TCG_TARGET_HAS_bswap16_i64) {
-        tcg_gen_op3i_i64(INDEX_op_bswap16_i64, ret, arg,
-                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        tcg_gen_op3i_i64(INDEX_op_bswap16_i64, ret, arg, flags);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t1 = tcg_temp_new_i64();
 
-        tcg_gen_ext8u_i64(t0, arg);
-        tcg_gen_shli_i64(t0, t0, 8);
-        tcg_gen_shri_i64(ret, arg, 8);
-        tcg_gen_or_i64(ret, ret, t0);
+        tcg_gen_shri_i64(t0, arg, 8);
+        if (!(flags & TCG_BSWAP_IZ)) {
+            tcg_gen_ext8u_i64(t0, t0);
+        }
+
+        if (flags & TCG_BSWAP_OS) {
+            tcg_gen_shli_i64(t1, t1, 56);
+            tcg_gen_sari_i64(t1, t1, 48);
+        } else if (flags & TCG_BSWAP_OZ) {
+            tcg_gen_ext8u_i64(t1, arg);
+            tcg_gen_shli_i64(t1, t1, 8);
+        } else {
+            tcg_gen_shli_i64(t1, arg, 8);
+        }
+
+        tcg_gen_or_i64(ret, t0, t1);
         tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
     }
 }
 
-/* Note: we assume the four high bytes are set to zero */
-void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
+void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags)
 {
+    /* Only one extension flag may be present. */
+    tcg_debug_assert(!(flags & TCG_BSWAP_OS) || !(flags & TCG_BSWAP_OZ));
+
     if (TCG_TARGET_REG_BITS == 32) {
         tcg_gen_bswap32_i32(TCGV_LOW(ret), TCGV_LOW(arg));
-        tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
+        if (flags & TCG_BSWAP_OS) {
+            tcg_gen_sari_i32(TCGV_HIGH(ret), TCGV_LOW(ret), 31);
+        } else {
+            tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
+        }
     } else if (TCG_TARGET_HAS_bswap32_i64) {
-        tcg_gen_op3i_i64(INDEX_op_bswap32_i64, ret, arg,
-                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        tcg_gen_op3i_i64(INDEX_op_bswap32_i64, ret, arg, flags);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
         TCGv_i64 t2 = tcg_constant_i64(0x00ff00ff);
 
-                                        /* arg = ....abcd */
-        tcg_gen_shri_i64(t0, arg, 8);   /*  t0 = .....abc */
-        tcg_gen_and_i64(t1, arg, t2);   /*  t1 = .....b.d */
-        tcg_gen_and_i64(t0, t0, t2);    /*  t0 = .....a.c */
-        tcg_gen_shli_i64(t1, t1, 8);    /*  t1 = ....b.d. */
-        tcg_gen_or_i64(ret, t0, t1);    /* ret = ....badc */
+                                            /* arg = xxxxabcd */
+        tcg_gen_shri_i64(t0, arg, 8);       /*  t0 = .xxxxabc */
+        tcg_gen_and_i64(t1, arg, t2);       /*  t1 = .....b.d */
+        tcg_gen_and_i64(t0, t0, t2);        /*  t0 = .....a.c */
+        tcg_gen_shli_i64(t1, t1, 8);        /*  t1 = ....b.d. */
+        tcg_gen_or_i64(ret, t0, t1);        /* ret = ....badc */
 
-        tcg_gen_shli_i64(t1, ret, 48);  /*  t1 = dc...... */
-        tcg_gen_shri_i64(t0, ret, 16);  /*  t0 = ......ba */
-        tcg_gen_shri_i64(t1, t1, 32);   /*  t1 = ....dc.. */
-        tcg_gen_or_i64(ret, t0, t1);    /* ret = ....dcba */
+        tcg_gen_shli_i64(t1, ret, 48);      /*  t1 = dc...... */
+        tcg_gen_shri_i64(t0, ret, 16);      /*  t0 = ......ba */
+        if (flags & TCG_BSWAP_OS) {
+            tcg_gen_sari_i64(t1, t1, 32);   /*  t1 = ssssdc.. */
+        } else {
+            tcg_gen_shri_i64(t1, t1, 32);   /*  t1 = ....dc.. */
+        }
+        tcg_gen_or_i64(ret, t0, t1);        /* ret = ssssdcba */
 
         tcg_temp_free_i64(t0);
         tcg_temp_free_i64(t1);
@@ -2846,7 +2889,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_bswap16_i32(val, val);
+            tcg_gen_bswap16_i32(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             if (orig_memop & MO_SIGN) {
                 tcg_gen_ext16s_i32(val, val);
             }
@@ -2874,7 +2917,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
         switch (memop & MO_SIZE) {
         case MO_16:
             tcg_gen_ext16u_i32(swap, val);
-            tcg_gen_bswap16_i32(swap, swap);
+            tcg_gen_bswap16_i32(swap, swap, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             break;
         case MO_32:
             tcg_gen_bswap32_i32(swap, val);
@@ -2935,13 +2978,13 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_bswap16_i64(val, val);
+            tcg_gen_bswap16_i64(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             if (orig_memop & MO_SIGN) {
                 tcg_gen_ext16s_i64(val, val);
             }
             break;
         case MO_32:
-            tcg_gen_bswap32_i64(val, val);
+            tcg_gen_bswap32_i64(val, val, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             if (orig_memop & MO_SIGN) {
                 tcg_gen_ext32s_i64(val, val);
             }
@@ -2975,11 +3018,11 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         switch (memop & MO_SIZE) {
         case MO_16:
             tcg_gen_ext16u_i64(swap, val);
-            tcg_gen_bswap16_i64(swap, swap);
+            tcg_gen_bswap16_i64(swap, swap, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             break;
         case MO_32:
             tcg_gen_ext32u_i64(swap, val);
-            tcg_gen_bswap32_i64(swap, swap);
+            tcg_gen_bswap32_i64(swap, swap, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             break;
         case MO_64:
             tcg_gen_bswap64_i64(swap, val);
-- 
2.25.1


