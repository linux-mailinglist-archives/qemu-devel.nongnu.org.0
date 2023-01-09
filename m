Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F5661C12
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBq-0000oz-S4; Sun, 08 Jan 2023 20:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBo-0000o3-62
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:04 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBl-0001YB-V8
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:03 -0500
Received: by mail-pl1-x631.google.com with SMTP id b17so456558pld.7
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k6OR+XG0IEsD8via1R4K6HtmWQxfco7OVq+cQ8c/hag=;
 b=PyFZSsMKpDsHNidmfnRTmQ3BVPfxN6XiTb6mYhxqUp9DPhl0TXVnFr1FbbxhhTLjuH
 cowhSzcv++i6Bs8AMgMchB7ZWJ+24Y7AesYCtGNaQ8lMkNdpd86LbFlj16QWqmUxRLd/
 daVzImGAo7julO8L1/L5nGh8EMkL6z9MnNhstoxLMY3FMiJ94dVVpBa+XdQvKzBbF/3r
 Y/CfWXRzz8nPN2672Apr59aAht+uoB3wHRZys/WsPg2zBCyHJXVlYtEqWUGWv4uB9nZk
 XSbSpiDC+nmyX9z7FAg4TRDf1S0WJkZZZqZq6dEo6aOAizQT11jTdLev06lnVsvroaIP
 dg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6OR+XG0IEsD8via1R4K6HtmWQxfco7OVq+cQ8c/hag=;
 b=vKblGwweMoGyIdRm3/lhbfoCEQf7aqGrpkXmIdJni8VQJozvFzYh803HFDwA9ixVUv
 PILvu3hCqpI+6e2ZRvFs/pnj5qy4o69RPf284b0uB7k0PO2TqcdMIbI7X0gKv932kqdb
 Q4ZJIOtZ/94viCATPDuYF5wexO28NsX6n2DEros2UCCnL7b9SbTfhhXgnLdrbIqgAGk5
 k4D/PfwZGpk8gVNwM87lp7fwpaOY5ZuK98BR9q+sQtge+GrE5T0lRtcvSpwy0bu7fmhU
 mAFs31AZ8a3hf/Uq/8wGteQ8r9iheSCbTNomUfG3F23NPP0lRJaTpeC0pm2EpaT4z2Em
 mK1g==
X-Gm-Message-State: AFqh2krCJRkgTH4iiZnmzzVqDMztTmvScm49km40fx0ompPMBUBC/dPu
 PmGSkYxi16f0LUgRzSRH2zbpi2UQT3xi8btE
X-Google-Smtp-Source: AMrXdXuA7X9FGpItGSkXkgFDzbI/CjmVik8v4K+WQgAPFUdyVFWfEP1ltnsC75yD5duBbFfzQIIQ6g==
X-Received: by 2002:a17:903:50e:b0:189:bda4:4a39 with SMTP id
 jn14-20020a170903050e00b00189bda44a39mr61422791plb.49.1673228580590; 
 Sun, 08 Jan 2023 17:43:00 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/22] tcg: Change tb_target_set_jmp_target arguments
Date: Sun,  8 Jan 2023 17:42:38 -0800
Message-Id: <20230109014248.2894281-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
index 413a5410c5..d491c198da 100644
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
index b7843d2d54..4c1433093c 100644
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
index 7edb7f1d9a..7500ceaab9 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -220,13 +220,8 @@ extern bool have_movbe;
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
index e5f7a1f09d..a150c3c7b2 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -171,7 +171,8 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 15721c3e42..d1adf3e326 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -206,7 +206,8 @@ extern bool use_mips32r2_instructions;
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
index 232537ccea..bce164fde2 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -166,7 +166,8 @@ typedef enum {
 #endif
 
 /* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 68dcbc6645..57ba165800 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -175,14 +175,8 @@ extern uint64_t s390_facilities[3];
 
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
index 0044ac8d78..282833bd8d 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -155,7 +155,8 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 94ec541b4e..f9ee83d751 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -177,6 +177,7 @@ typedef enum {
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
index ad35bee8af..0b65f2cac1 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1353,9 +1353,10 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
     tcg_out_call_int(s, target);
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
index 33c4139730..c71c3e664d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2374,6 +2374,15 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
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
index 25de7a9ee0..3174557ce3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1039,11 +1039,12 @@ static void tcg_out_nop(TCGContext *s)
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
index e56f86c613..6f2c8faea6 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1893,11 +1893,12 @@ static inline void ppc64_replace4(uintptr_t rx, uintptr_t rw,
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
index e008f0efcc..2d049a4cc7 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1970,6 +1970,16 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
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
index 594767ded8..fdb711bdf6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1885,10 +1885,11 @@ void tcg_register_jit(const void *buf, size_t buf_size)
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


