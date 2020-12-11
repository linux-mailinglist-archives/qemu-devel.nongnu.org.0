Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD72D6D34
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:21:22 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knX7Z-0002U6-7A
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knX1Q-0007U9-Ue
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:15:00 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knX1O-0003FM-Op
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:15:00 -0500
Received: by mail-ot1-x341.google.com with SMTP id q25so6815593otn.10
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ChWbo8pCkilSscl8Nvk8H32jPYHXmE0qYcGF6cTcqcA=;
 b=G7RTT1FI0O9Drllak6GE91ipa+JdfNn4torfAicB82sdlpda00reYVd8aFfAvUpcUW
 b8W24fxsxY6lzfaZndAYhjhJ8BWUUOsHfaeSuqqd9WY73FT9tuetYhIOofBCx8culOeU
 QwP3bWvnH1B2DrQE9dHA4/rbg0LrjWElizxyrK7VrMaafFJ/DT0spoC+4XeQuglxHKmp
 rfZqswJl2PR9AGFH3blNntB3NPMCtW900wA+UFFZJXBSW1dP+SbMYm814BNZ4PUD38if
 F2zt4+smhBqOXByxIWDU2u6oCPhM8BWjuE4WxTvahXuo/oibXL/TvwyYH9yM/ZJGcOjU
 h6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ChWbo8pCkilSscl8Nvk8H32jPYHXmE0qYcGF6cTcqcA=;
 b=S7URMpzwpw5Ak3WQ/3WWMl9+oJzVEpXMsuEJ8umU66iD1sxSZwuNVGadFGDlkm9sF7
 V19CFrm8gMfKGBo/ZT0jlync9PvfThUBjS+r94ygROXZ9i9JiXm8NOIoe9jx2NHmFytb
 agV9yILRyKx4xFRGaYjsmJIZ/qwq2vS6mEbtjDr8zPRCbEARIBSJXxt9oymGhk+QsOq4
 sfGz6rijbVF7U0+bLEteR1rgEMQE981kVePUYn36b2LgPPeB8ARYPz0enyBQbO3vSsNf
 QqivY09flZBYN2hj+0V4KGStAaCjGoSU4RDJYJ/bNJWZOQlQFNww52AQ4Sj0gxZDWCuz
 OjGw==
X-Gm-Message-State: AOAM530GJ8iSZ136JT8fOwQlDSlALAQH+g83QndNEKvOjDQQtQjXZZSQ
 vrSPwfAklPwesyQsgUNwqPWB9CMH2BSozzB+
X-Google-Smtp-Source: ABdhPJwg2NYVGvEsJB+6O6Gm7ngNAAby7Mk3+tLr2aio+nqS1mjEig1KiLzWCGxeS5GqB/mmTwklqA==
X-Received: by 2002:a9d:72c4:: with SMTP id d4mr8222432otk.149.1607649297148; 
 Thu, 10 Dec 2020 17:14:57 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h93sm1495135otb.29.2020.12.10.17.14.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:14:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg/i386: Adjust TCG_TARGET_HAS_MEMORY_BSWAP
Date: Thu, 10 Dec 2020 19:14:52 -0600
Message-Id: <20201211011453.475155-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211011453.475155-1-richard.henderson@linaro.org>
References: <20201211011453.475155-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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

Always true when movbe is available, otherwise leave
this to generic code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |   3 +-
 tcg/i386/tcg-target.c.inc | 119 ++++++++++++++------------------------
 2 files changed, 47 insertions(+), 75 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index abd4ac7fc0..89700ab6af 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -101,6 +101,7 @@ extern bool have_bmi1;
 extern bool have_popcnt;
 extern bool have_avx1;
 extern bool have_avx2;
+extern bool have_movbe;
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div2_i32         1
@@ -229,7 +230,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-#define TCG_TARGET_HAS_MEMORY_BSWAP  1
+#define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d8797ed398..01588cdcb4 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -154,13 +154,12 @@ bool have_bmi1;
 bool have_popcnt;
 bool have_avx1;
 bool have_avx2;
+bool have_movbe;
 
 #ifdef CONFIG_CPUID_H
-static bool have_movbe;
 static bool have_bmi2;
 static bool have_lzcnt;
 #else
-# define have_movbe 0
 # define have_bmi2 0
 # define have_lzcnt 0
 #endif
@@ -1986,13 +1985,14 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
                                    int seg, bool is64, MemOp memop)
 {
-    const MemOp real_bswap = memop & MO_BSWAP;
-    MemOp bswap = real_bswap;
+    bool use_movbe = false;
     int rexw = is64 * P_REXW;
     int movop = OPC_MOVL_GvEv;
 
-    if (have_movbe && real_bswap) {
-        bswap = 0;
+    /* Do big-endian loads with movbe.  */
+    if (memop & MO_BSWAP) {
+        tcg_debug_assert(have_movbe);
+        use_movbe = true;
         movop = OPC_MOVBE_GyMy;
     }
 
@@ -2006,23 +2006,28 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                  base, index, 0, ofs);
         break;
     case MO_UW:
-        tcg_out_modrm_sib_offset(s, OPC_MOVZWL + seg, datalo,
-                                 base, index, 0, ofs);
-        if (real_bswap) {
-            tcg_out_rolw_8(s, datalo);
-        }
-        break;
-    case MO_SW:
-        if (real_bswap) {
-            if (have_movbe) {
+        if (use_movbe) {
+            /* There is no extending movbe; only low 16-bits are modified.  */
+            if (datalo != base && datalo != index) {
+                /* XOR breaks dependency chains.  */
+                tgen_arithr(s, ARITH_XOR, datalo, datalo);
                 tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
                                          datalo, base, index, 0, ofs);
             } else {
-                tcg_out_modrm_sib_offset(s, OPC_MOVZWL + seg, datalo,
-                                         base, index, 0, ofs);
-                tcg_out_rolw_8(s, datalo);
+                tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
+                                         datalo, base, index, 0, ofs);
+                tcg_out_ext16u(s, datalo, datalo);
             }
-            tcg_out_modrm(s, OPC_MOVSWL + rexw, datalo, datalo);
+        } else {
+            tcg_out_modrm_sib_offset(s, OPC_MOVZWL + seg, datalo,
+                                     base, index, 0, ofs);
+        }
+        break;
+    case MO_SW:
+        if (use_movbe) {
+            tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
+                                     datalo, base, index, 0, ofs);
+            tcg_out_ext16s(s, datalo, datalo, rexw);
         } else {
             tcg_out_modrm_sib_offset(s, OPC_MOVSWL + rexw + seg,
                                      datalo, base, index, 0, ofs);
@@ -2030,18 +2035,12 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         break;
     case MO_UL:
         tcg_out_modrm_sib_offset(s, movop + seg, datalo, base, index, 0, ofs);
-        if (bswap) {
-            tcg_out_bswap32(s, datalo);
-        }
         break;
 #if TCG_TARGET_REG_BITS == 64
     case MO_SL:
-        if (real_bswap) {
-            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+        if (use_movbe) {
+            tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + seg, datalo,
                                      base, index, 0, ofs);
-            if (bswap) {
-                tcg_out_bswap32(s, datalo);
-            }
             tcg_out_ext32s(s, datalo, datalo);
         } else {
             tcg_out_modrm_sib_offset(s, OPC_MOVSLQ + seg, datalo,
@@ -2053,12 +2052,9 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
-            if (bswap) {
-                tcg_out_bswap64(s, datalo);
-            }
         } else {
-            if (real_bswap) {
-                int t = datalo;
+            if (use_movbe) {
+                TCGReg t = datalo;
                 datalo = datahi;
                 datahi = t;
             }
@@ -2073,14 +2069,10 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                 tcg_out_modrm_sib_offset(s, movop + seg, datalo,
                                          base, index, 0, ofs);
             }
-            if (bswap) {
-                tcg_out_bswap32(s, datalo);
-                tcg_out_bswap32(s, datahi);
-            }
         }
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -2128,24 +2120,27 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
                                    int seg, MemOp memop)
 {
-    /* ??? Ideally we wouldn't need a scratch register.  For user-only,
-       we could perform the bswap twice to restore the original value
-       instead of moving to the scratch.  But as it is, the L constraint
-       means that TCG_REG_L0 is definitely free here.  */
     const TCGReg scratch = TCG_REG_L0;
-    const MemOp real_bswap = memop & MO_BSWAP;
-    MemOp bswap = real_bswap;
+    bool use_movbe = false;
     int movop = OPC_MOVL_EvGv;
 
-    if (have_movbe && real_bswap) {
-        bswap = 0;
+    /*
+     * Do big-endian stores with movbe or softmmu.
+     * User-only without movbe will have its swapping done generically.
+     */
+    if (memop & MO_BSWAP) {
+        tcg_debug_assert(have_movbe);
+        use_movbe = true;
         movop = OPC_MOVBE_MyGy;
     }
 
     switch (memop & MO_SIZE) {
     case MO_8:
-        /* In 32-bit mode, 8-bit stores can only happen from [abcd]x.
-           Use the scratch register if necessary.  */
+        /*
+         * In 32-bit mode, 8-bit stores can only happen from [abcd]x.
+         * TODO: Adjust constraints such that this is is forced,
+         * then we won't need a scratch at all for user-only.
+         */
         if (TCG_TARGET_REG_BITS == 32 && datalo >= 4) {
             tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
             datalo = scratch;
@@ -2154,43 +2149,19 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                  datalo, base, index, 0, ofs);
         break;
     case MO_16:
-        if (bswap) {
-            tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
-            tcg_out_rolw_8(s, scratch);
-            datalo = scratch;
-        }
         tcg_out_modrm_sib_offset(s, movop + P_DATA16 + seg, datalo,
                                  base, index, 0, ofs);
         break;
     case MO_32:
-        if (bswap) {
-            tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
-            tcg_out_bswap32(s, scratch);
-            datalo = scratch;
-        }
         tcg_out_modrm_sib_offset(s, movop + seg, datalo, base, index, 0, ofs);
         break;
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
-            if (bswap) {
-                tcg_out_mov(s, TCG_TYPE_I64, scratch, datalo);
-                tcg_out_bswap64(s, scratch);
-                datalo = scratch;
-            }
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
-        } else if (bswap) {
-            tcg_out_mov(s, TCG_TYPE_I32, scratch, datahi);
-            tcg_out_bswap32(s, scratch);
-            tcg_out_modrm_sib_offset(s, OPC_MOVL_EvGv + seg, scratch,
-                                     base, index, 0, ofs);
-            tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
-            tcg_out_bswap32(s, scratch);
-            tcg_out_modrm_sib_offset(s, OPC_MOVL_EvGv + seg, scratch,
-                                     base, index, 0, ofs + 4);
         } else {
-            if (real_bswap) {
-                int t = datalo;
+            if (use_movbe) {
+                TCGReg t = datalo;
                 datalo = datahi;
                 datahi = t;
             }
@@ -2201,7 +2172,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         }
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


