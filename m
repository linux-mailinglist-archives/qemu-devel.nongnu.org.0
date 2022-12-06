Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E1643C2F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:22:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POl-0003QN-Ie; Mon, 05 Dec 2022 23:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POj-0003Pc-Es
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:37 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POh-0006z3-AD
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:37 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 s9-20020a05683004c900b0066e7414466bso8566020otd.12
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3NQPdkO/a3hKfT01ZxYAHQgw+2ISUzBitXvh20BqPrU=;
 b=rR1gFmMGhsaIi8UwLgFFqBxzbgq6C27P3ZgopOrEzaCSWMKHESH6ZVQoh5bedfBtM6
 +8slplf9tkB70H4Aa2bnE371bNXSkJ+ArpsrH1uwt89H8KAvwrX5UwUr8mtzf60tF1B5
 OIIwdpCcXT5iNBuYePf565VU2a5YHDpj/pyp48s1UdDfWc5O6eFnFiYs6YZdmWLODMhW
 kWGUnT5iXUuErQrVsR7Np91DBZCkT2Pgm/Wh8iprUNuKr5ikAxmcxUSp8Jb9zcoUAgKF
 EgosNK83ujQXV/e5mNOQsC8hEVlTY4ZTXnvhx09vR0cAZvEI/nybGyglUPT2Q13eORCZ
 zMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3NQPdkO/a3hKfT01ZxYAHQgw+2ISUzBitXvh20BqPrU=;
 b=QINZ8WB7TRVamO6B35VZfPDnji9zMilfvVJS2dat7yJYXlG+Lhk/FTu21NjTbdK6lm
 BP/xb5bhljd7Nnewg2LZqNvu/FPV41o7bPr49Lo31BKfJ13MkCvo4dRIPSvvRpOUTFbb
 WjRaHNzxgUKfKVvkOQnpv6I0DkjpajnqoJ3oehMZIizsWukoqtsJbRQs7NoJ0JpqWH1+
 SsIAx1Bo2nBmoQEVISJEu0vOMi3RE8d+GoFryXZ0D+JN3Q6VSJOuDDoqHLXUUlgZTHJL
 8ZU+zNlvzAS5zlyKodUu67z3X+SNBIq1dBXo6YOAdZEyVsrTwSZzaOvGLrwiaBGAd6WD
 XAFA==
X-Gm-Message-State: ANoB5pk8gdix2ssLTBXFXZwVZoyFiGeiK3PMcoDaUuSTG0rb7oS4GXHl
 2RJlVe/4fvHOi+LdbN0uyeIaqZL1IyI9RLRmONI=
X-Google-Smtp-Source: AA0mqf44CZx2JfcOx5Ha+9K7LmYuOgQEV21sC41auSLdNHMDOUSU8q24e3sW+sfg2vLnOuEhHL2WNA==
X-Received: by 2002:a9d:64c6:0:b0:66e:a8a1:3be2 with SMTP id
 n6-20020a9d64c6000000b0066ea8a13be2mr5093104otl.250.1670300254018; 
 Mon, 05 Dec 2022 20:17:34 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 12/22] tcg: Change tb_target_set_jmp_target arguments
Date: Mon,  5 Dec 2022 22:17:05 -0600
Message-Id: <20221206041715.314209-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace 'tc_ptr' and 'addr' with 'tb' and 'n'.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h         |  3 ++-
 tcg/arm/tcg-target.h             |  3 ++-
 tcg/i386/tcg-target.h            |  9 ++-------
 tcg/loongarch64/tcg-target.h     |  3 ++-
 tcg/mips/tcg-target.h            |  3 ++-
 tcg/ppc/tcg-target.h             |  3 ++-
 tcg/riscv/tcg-target.h           |  3 ++-
 tcg/s390x/tcg-target.h           | 10 ++--------
 tcg/sparc64/tcg-target.h         |  3 ++-
 tcg/tci/tcg-target.h             |  3 ++-
 accel/tcg/cpu-exec.c             |  6 +++---
 tcg/aarch64/tcg-target.c.inc     |  5 +++--
 tcg/i386/tcg-target.c.inc        |  9 +++++++++
 tcg/loongarch64/tcg-target.c.inc |  5 +++--
 tcg/ppc/tcg-target.c.inc         |  7 ++++---
 tcg/s390x/tcg-target.c.inc       | 10 ++++++++++
 tcg/sparc64/tcg-target.c.inc     |  7 ++++---
 17 files changed, 56 insertions(+), 36 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 485f685bd2..9b0927012c 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -152,7 +152,8 @@ typedef enum {
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *, int,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 7e96495392..743a725aa7 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -152,7 +152,8 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 00fcbe297d..b64317bf40 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -218,13 +218,8 @@ extern bool have_movbe;
 #define TCG_TARGET_extract_i64_valid(ofs, len) \
     (((ofs) == 8 && (len) == 8) || ((ofs) + (len)) == 32)
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                                            uintptr_t jmp_rw, uintptr_t addr)
-{
-    /* patch the branch destination */
-    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
-    /* no need to flush icache explicitly */
-}
+void tb_target_set_jmp_target(const TranslationBlock *, int,
+                              uintptr_t, uintptr_t);
 
 /* This defines the natural memory order supported by this
  * architecture before guarantees made by various barrier
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index a659c8d6fd..6a6c8d6941 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -170,7 +170,8 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 7669213175..57154ec808 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -204,7 +204,8 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t)
     QEMU_ERROR("code path is reachable");
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index b5cd225cfa..02764c3331 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -180,7 +180,8 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 11c9b3e4f4..21d455a081 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -161,7 +161,8 @@ typedef enum {
 #endif
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 23e2063667..d9a45e20a8 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -172,14 +172,8 @@ extern uint64_t s390_facilities[3];
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                                            uintptr_t jmp_rw, uintptr_t addr)
-{
-    /* patch the branch destination */
-    intptr_t disp = addr - (jmp_rx - 2);
-    qatomic_set((int32_t *)jmp_rw, disp / 2);
-    /* no need to flush icache explicitly */
-}
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw);
 
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 8655acdbe5..f70fa9e350 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -154,7 +154,8 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index ceb36c4f7a..5d1a77d078 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -170,6 +170,7 @@ typedef enum {
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #endif /* TCG_TARGET_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a87fbf74f4..ac5b581e52 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -574,11 +574,11 @@ void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
 {
     tb->jmp_target_addr[n] = addr;
     if (TCG_TARGET_HAS_direct_jump) {
+        const TranslationBlock *c_tb = tcg_splitwx_to_rx(tb);
         uintptr_t offset = tb->jmp_insn_offset[n];
-        uintptr_t tc_ptr = (uintptr_t)tb->tc.ptr;
-        uintptr_t jmp_rx = tc_ptr + offset;
+        uintptr_t jmp_rx = (uintptr_t)tb->tc.ptr + offset;
         uintptr_t jmp_rw = jmp_rx - tcg_splitwx_diff;
-        tb_target_set_jmp_target(tc_ptr, jmp_rx, jmp_rw, addr);
+        tb_target_set_jmp_target(c_tb, n, jmp_rx, jmp_rw);
     }
 }
 
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 072d32f355..af30f9db69 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1352,9 +1352,10 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
+    uintptr_t addr = tb->jmp_target_addr[n];
     tcg_insn_unit i1, i2;
     TCGType rt = TCG_TYPE_I64;
     TCGReg  rd = TCG_REG_TMP;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d3cef242ef..6650e2eda3 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2373,6 +2373,15 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* patch the branch destination */
+    uintptr_t addr = tb->jmp_target_addr[n];
+    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
+    /* no need to flush icache explicitly */
+}
+
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                               const TCGArg args[TCG_MAX_OP_ARGS],
                               const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index dbe64b7d8b..c05b19a084 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1038,11 +1038,12 @@ static void tcg_out_nop(TCGContext *s)
     tcg_out32(s, NOP);
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
     tcg_insn_unit i1, i2;
     ptrdiff_t upper, lower;
+    uintptr_t addr = tb->jmp_target_addr[n];
     ptrdiff_t offset = (ptrdiff_t)(addr - jmp_rx) >> 2;
 
     if (offset == sextreg(offset, 0, 26)) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index ec13ea3171..592b8d6498 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1886,11 +1886,12 @@ static inline void ppc64_replace4(uintptr_t rx, uintptr_t rw,
     flush_idcache_range(rx, rw, 16);
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
     tcg_insn_unit i0, i1, i2, i3;
-    intptr_t tb_diff = addr - tc_ptr;
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t tb_diff = addr - (uintptr_t)tb->tc.ptr;
     intptr_t br_diff = addr - (jmp_rx + 4);
     intptr_t lo, hi;
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a60edc18cf..82435ecadb 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2116,6 +2116,16 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     }
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* patch the branch destination */
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t disp = addr - (jmp_rx - 2);
+    qatomic_set((int32_t *)jmp_rw, disp / 2);
+    /* no need to flush icache explicitly */
+}
+
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_,x),_i32): \
         case glue(glue(INDEX_op_,x),_i64)
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index ed8efa413c..96d58f30b1 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1884,10 +1884,11 @@ void tcg_register_jit(const void *buf, size_t buf_size)
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
-    intptr_t tb_disp = addr - tc_ptr;
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t tb_disp = addr - (uintptr_t)tb->tc.ptr;
     intptr_t br_disp = addr - jmp_rx;
     tcg_insn_unit i1, i2;
 
-- 
2.34.1


