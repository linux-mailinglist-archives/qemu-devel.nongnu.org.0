Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2268F30EA86
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:58:13 +0100 (CET)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UqS-0006EG-2J
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tt9-0001Cy-5t
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:56:55 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tt4-00076R-J6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:56:54 -0500
Received: by mail-pl1-x633.google.com with SMTP id s15so890952plr.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kzUnbpFd4N7AqVaseztP0v4eZMlcZVSSr/zLlepL4IA=;
 b=lmL2/T428QnpkEah5HXAYc+5a0JwCcKvT17Hdj3FIsN641G0YU3XXvYPNguIMV2x6j
 QnQlzywxJWfhTncjDeebU9Ai6Q+f2edW7ITATUl8tS7YG9lQSo1OaDKmy+kaRc4JgDgN
 ysxbC6xLcqBprCgSJCYvWhfZp924koSboP47KSjW41MzpehirMFaAaH4yQWyjiOykkYV
 yDLmYfX/EFJBMU4uon3r0NGpDckcxpAp3YPQFl0nUo8fXFu9ZXzHSk8LGa2QYcG9vA9s
 Hx2WcwKqowocGGWJtIBiOFW3juTFPhB4lkpPVj2D6i/5ghaOB6eEhbR2HJxp1+3HiFr3
 Gn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kzUnbpFd4N7AqVaseztP0v4eZMlcZVSSr/zLlepL4IA=;
 b=pPsvbUS1tAiEXjGLK7Ftwn6Iia2SDxFhBKIPBLK6iMJT9TrYTdloGpYfFVwKrDIEJx
 245vap+IhLBOrVzNV2mPC+qXIixP4p1LKVnDfhGc3/sQGnTzAAEgR4Cw6Ldw/CWFslzL
 3Tm/T7e1NJGyJP65OWJvFD4rRu6+5x0PtNj42LIBuhP7BX74+20ko+9y+sL742MwM8br
 nFLPbnQt6bIMNnKIvyaAmXPISYjyYogWENzl/z/xYEELlOUkiAKpYkVBCwEm4FfD+dQG
 N13VZ4Gojp+MUStFGKjoFDQEOQhBOTOOlQzfluu8ttq0jZXzqixJ1rs/CW8UY4x456Rh
 H2EQ==
X-Gm-Message-State: AOAM531NMttsbxR9gX2TrcmwHKkP1q+081lob+YN7o5W1fgy5RoIoEMQ
 Yrls+uJhPrOkoLNXlOkK3/PXhM/aa/unoBCG
X-Google-Smtp-Source: ABdhPJw4IEH9CMwoecppM3+FAnPN7OhiueYHVsWEzBP13imEdz7jFUz2d5arUL5SjoeOvqk3WZssmA==
X-Received: by 2002:a17:90a:de2:: with SMTP id 89mr5735238pjv.26.1612403807757; 
 Wed, 03 Feb 2021 17:56:47 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l13sm3222390pjq.30.2021.02.03.17.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:56:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 86/93] tcg/tci: Change encoding to uint32_t units
Date: Wed,  3 Feb 2021 15:56:44 -1000
Message-Id: <20210204015644.885606-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes all of the problems with unaligned accesses
to the bytecode stream.

With an 8-bit opcode at the bottom, we have 24 bits remaining,
which are generally split into 6 4-bit slots.  This fits well
with the maximum length opcodes, e.g. INDEX_op_add2_i386, which
have 6 register operands.

We have, in previous patches, rearranged things such that there
are no operations with a label, which have more than one other
operand.  Which leaves us with a 20-bit field in which to encode
a label, giving us a maximum TB size of 512k -- easily large.

Change the INDEX_op_tci_movi_{i32,i64} opcodes to tci_mov[il].
The former puts the immediate in the upper 20 bits of the insn,
like we do for the label displacement.  The later uses a label
to reference an entry in the constant pool.  Thus, in the worst
case we still have a single memory reference for any constant,
but now the constants are out-of-line of the bytecode and can
be shared between different moves saving space.

Change INDEX_op_call to use a label to reference a pair of
pointers in the constant pool.  This removes the only slightly
dodgy link with the layout of struct TCGHelperInfo.

The re-encode cannot be done in pieces.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h    |   4 +-
 tcg/tci/tcg-target.h     |   3 +-
 tcg/tci.c                | 534 +++++++++++++++------------------------
 tcg/tci/tcg-target.c.inc | 386 +++++++++++++---------------
 tcg/tci/README           |  20 +-
 5 files changed, 380 insertions(+), 567 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index bbb0884af8..5bbec858aa 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -277,8 +277,8 @@ DEF(last_generic, 0, 0, 0, TCG_OPF_NOT_PRESENT)
 
 #ifdef TCG_TARGET_INTERPRETER
 /* These opcodes are only for use between the tci generator and interpreter. */
-DEF(tci_movi_i32, 1, 0, 1, TCG_OPF_NOT_PRESENT)
-DEF(tci_movi_i64, 1, 0, 1, TCG_OPF_64BIT | TCG_OPF_NOT_PRESENT)
+DEF(tci_movi, 1, 0, 1, TCG_OPF_NOT_PRESENT)
+DEF(tci_movl, 1, 0, 1, TCG_OPF_NOT_PRESENT)
 #endif
 
 #undef TLADDR_ARGS
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 1558a6e44e..d953f2ead3 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -41,7 +41,7 @@
 #define TCG_TARGET_H
 
 #define TCG_TARGET_INTERPRETER 1
-#define TCG_TARGET_INSN_UNIT_SIZE 1
+#define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
 
 #if UINTPTR_MAX == UINT32_MAX
@@ -165,6 +165,7 @@ typedef enum {
 #define TCG_TARGET_STACK_ALIGN          8
 
 #define HAVE_TCG_QEMU_TB_EXEC
+#define TCG_TARGET_NEED_POOL_LABELS
 
 /* We could notice __i386__ or __s390x__ and reduce the barriers depending
    on the host.  But if you want performance, you use the normal backend.
diff --git a/tcg/tci.c b/tcg/tci.c
index 4f81cbb904..c4f0a7e82d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -49,49 +49,6 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
     return ((uint64_t)high << 32) + low;
 }
 
-/* Read constant byte from bytecode. */
-static uint8_t tci_read_b(const uint8_t **tb_ptr)
-{
-    return *(tb_ptr[0]++);
-}
-
-/* Read register number from bytecode. */
-static TCGReg tci_read_r(const uint8_t **tb_ptr)
-{
-    uint8_t regno = tci_read_b(tb_ptr);
-    tci_assert(regno < TCG_TARGET_NB_REGS);
-    return regno;
-}
-
-/* Read constant (native size) from bytecode. */
-static tcg_target_ulong tci_read_i(const uint8_t **tb_ptr)
-{
-    tcg_target_ulong value = *(const tcg_target_ulong *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-
-/* Read unsigned constant (32 bit) from bytecode. */
-static uint32_t tci_read_i32(const uint8_t **tb_ptr)
-{
-    uint32_t value = *(const uint32_t *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-
-/* Read signed constant (32 bit) from bytecode. */
-static int32_t tci_read_s32(const uint8_t **tb_ptr)
-{
-    int32_t value = *(const int32_t *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-
-static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
-{
-    return tci_read_i(tb_ptr);
-}
-
 /*
  * Load sets of arguments all at once.  The naming convention is:
  *   tci_args_<arguments>
@@ -106,209 +63,128 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
-static void check_size(const uint8_t *start, const uint8_t **tb_ptr)
+static void tci_args_l(uint32_t insn, const void *tb_ptr, void **l0)
 {
-    const uint8_t *old_code_ptr = start - 2;
-    uint8_t op_size = old_code_ptr[1];
-    tci_assert(*tb_ptr == old_code_ptr + op_size);
+    int diff = sextract32(insn, 12, 20);
+    *l0 = diff ? (void *)tb_ptr + diff : NULL;
 }
 
-static void tci_args_l(const uint8_t **tb_ptr, void **l0)
+static void tci_args_nl(uint32_t insn, const void *tb_ptr,
+                        uint8_t *n0, void **l1)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *l0 = (void *)tci_read_label(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *n0 = extract32(insn, 8, 4);
+    *l1 = sextract32(insn, 12, 20) + (void *)tb_ptr;
 }
 
-static void tci_args_nl(const uint8_t **tb_ptr, uint8_t *n0, void **l1)
+static void tci_args_rl(uint32_t insn, const void *tb_ptr,
+                        TCGReg *r0, void **l1)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *n0 = tci_read_b(tb_ptr);
-    *l1 = (void *)tci_read_label(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *l1 = sextract32(insn, 12, 20) + (void *)tb_ptr;
 }
 
-static void tci_args_rl(const uint8_t **tb_ptr, TCGReg *r0, void **l1)
+static void tci_args_rr(uint32_t insn, TCGReg *r0, TCGReg *r1)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *l1 = (void *)tci_read_label(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
 }
 
-static void tci_args_rr(const uint8_t **tb_ptr,
-                        TCGReg *r0, TCGReg *r1)
+static void tci_args_ri(uint32_t insn, TCGReg *r0, tcg_target_ulong *i1)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *i1 = sextract32(insn, 12, 20);
 }
 
-static void tci_args_ri(const uint8_t **tb_ptr,
-                        TCGReg *r0, tcg_target_ulong *i1)
+static void tci_args_rrm(uint32_t insn, TCGReg *r0,
+                         TCGReg *r1, TCGMemOpIdx *m2)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *i1 = tci_read_i32(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *m2 = extract32(insn, 20, 12);
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void tci_args_rI(const uint8_t **tb_ptr,
-                        TCGReg *r0, tcg_target_ulong *i1)
+static void tci_args_rrr(uint32_t insn, TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *i1 = tci_read_i(tb_ptr);
-
-    check_size(start, tb_ptr);
-}
-#endif
-
-static void tci_args_rrm(const uint8_t **tb_ptr,
-                         TCGReg *r0, TCGReg *r1, TCGMemOpIdx *m2)
-{
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *m2 = tci_read_i32(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
 }
 
-static void tci_args_rrr(const uint8_t **tb_ptr,
-                         TCGReg *r0, TCGReg *r1, TCGReg *r2)
+static void tci_args_rrs(uint32_t insn, TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *i2 = sextract32(insn, 16, 16);
 }
 
-static void tci_args_rrs(const uint8_t **tb_ptr,
-                         TCGReg *r0, TCGReg *r1, int32_t *i2)
-{
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *i2 = tci_read_s32(tb_ptr);
-
-    check_size(start, tb_ptr);
-}
-
-static void tci_args_rrrc(const uint8_t **tb_ptr,
+static void tci_args_rrrc(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *c3 = tci_read_b(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
+    *c3 = extract32(insn, 20, 4);
 }
 
-static void tci_args_rrrm(const uint8_t **tb_ptr,
+static void tci_args_rrrm(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGMemOpIdx *m3)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *m3 = tci_read_i32(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
+    *m3 = extract32(insn, 20, 12);
 }
 
-static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+static void tci_args_rrrbb(uint32_t insn, TCGReg *r0, TCGReg *r1,
                            TCGReg *r2, uint8_t *i3, uint8_t *i4)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *i3 = tci_read_b(tb_ptr);
-    *i4 = tci_read_b(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
+    *i3 = extract32(insn, 20, 6);
+    *i4 = extract32(insn, 26, 6);
 }
 
-static void tci_args_rrrrm(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
-                           TCGReg *r2, TCGReg *r3, TCGMemOpIdx *m4)
+static void tci_args_rrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
+                           TCGReg *r2, TCGReg *r3, TCGReg *r4)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *r3 = tci_read_r(tb_ptr);
-    *m4 = tci_read_i32(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
+    *r3 = extract32(insn, 20, 4);
+    *r4 = extract32(insn, 24, 4);
 }
 
 #if TCG_TARGET_REG_BITS == 32
-static void tci_args_rrrr(const uint8_t **tb_ptr,
+static void tci_args_rrrr(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *r3 = tci_read_r(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
+    *r3 = extract32(insn, 20, 4);
 }
 
-static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *r3 = tci_read_r(tb_ptr);
-    *r4 = tci_read_r(tb_ptr);
-    *c5 = tci_read_b(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
+    *r3 = extract32(insn, 20, 4);
+    *r4 = extract32(insn, 24, 4);
+    *c5 = extract32(insn, 28, 4);
 }
 
-static void tci_args_rrrrrr(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *r3 = tci_read_r(tb_ptr);
-    *r4 = tci_read_r(tb_ptr);
-    *r5 = tci_read_r(tb_ptr);
-
-    check_size(start, tb_ptr);
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *r2 = extract32(insn, 16, 4);
+    *r3 = extract32(insn, 20, 4);
+    *r4 = extract32(insn, 24, 4);
+    *r5 = extract32(insn, 28, 4);
 }
 #endif
 
@@ -464,7 +340,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                                             const void *v_tb_ptr)
 {
-    const uint8_t *tb_ptr = v_tb_ptr;
+    const uint32_t *tb_ptr = v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
                    / sizeof(uint64_t)];
@@ -476,8 +352,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     tci_assert(tb_ptr);
 
     for (;;) {
-        TCGOpcode opc = tb_ptr[0];
-        TCGReg r0, r1, r2, r3;
+        uint32_t insn;
+        TCGOpcode opc;
+        TCGReg r0, r1, r2, r3, r4;
         tcg_target_ulong t1;
         TCGCond condition;
         target_ulong taddr;
@@ -485,23 +362,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r4, r5;
+        TCGReg r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
         void *ptr;
 
-        /* Skip opcode and size entry. */
-        tb_ptr += 2;
+        insn = *tb_ptr++;
+        opc = extract32(insn, 0, 8);
 
         switch (opc) {
         case INDEX_op_call:
-            /*
-             * We are passed a pointer to the TCGHelperInfo, which contains
-             * the function pointer followed by the ffi_cif pointer.
-             */
-            tci_args_nl(&tb_ptr, &len, &ptr);
+            tci_args_nl(insn, tb_ptr, &len, &ptr);
 
             /* Helper functions may need to access the "return address" */
             tci_tb_ptr = (uintptr_t)tb_ptr;
@@ -519,8 +392,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             }
 
             /*
-             * Call the helper function.  Any result winds up
-             * "left-aligned" in the stack[0] slot.
+             * We are passed a pointer into the constant pool, which
+             * contains a pair of the function pointer and the cif pointer.
+             * Any result winds up "left-aligned" in the stack[0] slot.
              */
             {
                 void **pptr = ptr;
@@ -545,76 +419,80 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 
         case INDEX_op_br:
-            tci_args_l(&tb_ptr, &ptr);
+            tci_args_l(insn, tb_ptr, &ptr);
             tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
-            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            tci_args_rrrc(insn, &r0, &r1, &r2, &condition);
             regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
-            tci_args_rrrrrc(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &condition);
+            tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &condition);
             T1 = tci_uint64(regs[r2], regs[r1]);
             T2 = tci_uint64(regs[r4], regs[r3]);
             regs[r0] = tci_compare64(T1, T2, condition);
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            tci_args_rrrc(insn, &r0, &r1, &r2, &condition);
             regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
 #endif
         CASE_32_64(mov)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = regs[r1];
             break;
-        case INDEX_op_tci_movi_i32:
-            tci_args_ri(&tb_ptr, &r0, &t1);
+        case INDEX_op_tci_movi:
+            tci_args_ri(insn, &r0, &t1);
             regs[r0] = t1;
             break;
+        case INDEX_op_tci_movl:
+            tci_args_rl(insn, tb_ptr, &r0, &ptr);
+            regs[r0] = *(tcg_target_ulong *)ptr;
+            break;
 
             /* Load/store operations (32 bit). */
 
         CASE_32_64(ld8u)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             regs[r0] = *(uint8_t *)ptr;
             break;
         CASE_32_64(ld8s)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             regs[r0] = *(int8_t *)ptr;
             break;
         CASE_32_64(ld16u)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             regs[r0] = *(uint16_t *)ptr;
             break;
         CASE_32_64(ld16s)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             regs[r0] = *(int16_t *)ptr;
             break;
         case INDEX_op_ld_i32:
         CASE_64(ld32u)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             regs[r0] = *(uint32_t *)ptr;
             break;
         CASE_32_64(st8)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             *(uint8_t *)ptr = regs[r0];
             break;
         CASE_32_64(st16)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             *(uint16_t *)ptr = regs[r0];
             break;
         case INDEX_op_st_i32:
         CASE_64(st32)
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             *(uint32_t *)ptr = regs[r0];
             break;
@@ -622,171 +500,166 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Arithmetic operations (mixed 32/64 bit). */
 
         CASE_32_64(add)
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] + regs[r2];
             break;
         CASE_32_64(sub)
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] - regs[r2];
             break;
         CASE_32_64(mul)
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] * regs[r2];
             break;
         CASE_32_64(and)
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] & regs[r2];
             break;
         CASE_32_64(or)
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] | regs[r2];
             break;
         CASE_32_64(xor)
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] ^ regs[r2];
             break;
 
             /* Arithmetic operations (32 bit). */
 
         case INDEX_op_div_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (int32_t)regs[r1] / (int32_t)regs[r2];
             break;
         case INDEX_op_divu_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint32_t)regs[r1] / (uint32_t)regs[r2];
             break;
         case INDEX_op_rem_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (int32_t)regs[r1] % (int32_t)regs[r2];
             break;
         case INDEX_op_remu_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint32_t)regs[r1] % (uint32_t)regs[r2];
             break;
 
             /* Shift/rotate operations (32 bit). */
 
         case INDEX_op_shl_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint32_t)regs[r1] << (regs[r2] & 31);
             break;
         case INDEX_op_shr_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint32_t)regs[r1] >> (regs[r2] & 31);
             break;
         case INDEX_op_sar_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (int32_t)regs[r1] >> (regs[r2] & 31);
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = rol32(regs[r1], regs[r2] & 31);
             break;
         case INDEX_op_rotr_i32:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = ror32(regs[r1], regs[r2] & 31);
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
         case INDEX_op_deposit_i32:
-            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+            tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
             regs[r0] = deposit32(regs[r1], pos, len, regs[r2]);
             break;
 #endif
         case INDEX_op_brcond_i32:
-            tci_args_rl(&tb_ptr, &r0, &ptr);
+            tci_args_rl(insn, tb_ptr, &r0, &ptr);
             if ((uint32_t)regs[r0]) {
                 tb_ptr = ptr;
             }
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_add2_i32:
-            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
         case INDEX_op_sub2_i32:
-            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
         case INDEX_op_mulu2_i32:
-            tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
+            tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
             tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = (int8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
         CASE_32_64(ext16s)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = (int16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
         CASE_32_64(ext8u)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = (uint8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
         CASE_32_64(ext16u)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = (uint16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(bswap16)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = bswap16(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
         CASE_32_64(bswap32)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = bswap32(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
         CASE_32_64(not)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = ~regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
         CASE_32_64(neg)
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = -regs[r1];
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
-        case INDEX_op_tci_movi_i64:
-            tci_args_rI(&tb_ptr, &r0, &t1);
-            regs[r0] = t1;
-            break;
-
             /* Load/store operations (64 bit). */
 
         case INDEX_op_ld32s_i64:
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             regs[r0] = *(int32_t *)ptr;
             break;
         case INDEX_op_ld_i64:
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             regs[r0] = *(uint64_t *)ptr;
             break;
         case INDEX_op_st_i64:
-            tci_args_rrs(&tb_ptr, &r0, &r1, &ofs);
+            tci_args_rrs(insn, &r0, &r1, &ofs);
             ptr = (void *)(regs[r1] + ofs);
             *(uint64_t *)ptr = regs[r0];
             break;
@@ -794,71 +667,71 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Arithmetic operations (64 bit). */
 
         case INDEX_op_div_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (int64_t)regs[r1] / (int64_t)regs[r2];
             break;
         case INDEX_op_divu_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint64_t)regs[r1] / (uint64_t)regs[r2];
             break;
         case INDEX_op_rem_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (int64_t)regs[r1] % (int64_t)regs[r2];
             break;
         case INDEX_op_remu_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint64_t)regs[r1] % (uint64_t)regs[r2];
             break;
 
             /* Shift/rotate operations (64 bit). */
 
         case INDEX_op_shl_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] << (regs[r2] & 63);
             break;
         case INDEX_op_shr_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] >> (regs[r2] & 63);
             break;
         case INDEX_op_sar_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (int64_t)regs[r1] >> (regs[r2] & 63);
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = rol64(regs[r1], regs[r2] & 63);
             break;
         case INDEX_op_rotr_i64:
-            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = ror64(regs[r1], regs[r2] & 63);
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
         case INDEX_op_deposit_i64:
-            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+            tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
             regs[r0] = deposit64(regs[r1], pos, len, regs[r2]);
             break;
 #endif
         case INDEX_op_brcond_i64:
-            tci_args_rl(&tb_ptr, &r0, &ptr);
+            tci_args_rl(insn, tb_ptr, &r0, &ptr);
             if (regs[r0]) {
                 tb_ptr = ptr;
             }
             break;
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext_i32_i64:
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = (int32_t)regs[r1];
             break;
         case INDEX_op_ext32u_i64:
         case INDEX_op_extu_i32_i64:
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = (uint32_t)regs[r1];
             break;
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
-            tci_args_rr(&tb_ptr, &r0, &r1);
+            tci_args_rr(insn, &r0, &r1);
             regs[r0] = bswap64(regs[r1]);
             break;
 #endif
@@ -867,20 +740,20 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* QEMU specific operations. */
 
         case INDEX_op_exit_tb:
-            tci_args_l(&tb_ptr, &ptr);
+            tci_args_l(insn, tb_ptr, &ptr);
             return (uintptr_t)ptr;
 
         case INDEX_op_goto_tb:
-            tci_args_l(&tb_ptr, &ptr);
+            tci_args_l(insn, tb_ptr, &ptr);
             tb_ptr = *(void **)ptr;
             break;
 
         case INDEX_op_qemu_ld_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
             } else {
-                tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
@@ -916,14 +789,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_qemu_ld_i64:
             if (TCG_TARGET_REG_BITS == 64) {
-                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
             } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-                tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                 taddr = regs[r2];
             } else {
-                tci_args_rrrrm(&tb_ptr, &r0, &r1, &r2, &r3, &oi);
+                tci_args_rrrrr(insn, &r0, &r1, &r2, &r3, &r4);
                 taddr = tci_uint64(regs[r3], regs[r2]);
+                oi = regs[r4];
             }
             switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
@@ -974,10 +848,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_qemu_st_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
             } else {
-                tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
             tmp32 = regs[r0];
@@ -1004,16 +878,17 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_qemu_st_i64:
             if (TCG_TARGET_REG_BITS == 64) {
-                tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+                tci_args_rrm(insn, &r0, &r1, &oi);
                 taddr = regs[r1];
                 tmp64 = regs[r0];
             } else {
                 if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
-                    tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+                    tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                     taddr = regs[r2];
                 } else {
-                    tci_args_rrrrm(&tb_ptr, &r0, &r1, &r2, &r3, &oi);
+                    tci_args_rrrrr(insn, &r0, &r1, &r2, &r3, &r4);
                     taddr = tci_uint64(regs[r3], regs[r2]);
+                    oi = regs[r4];
                 }
                 tmp64 = tci_uint64(regs[r1], regs[r0]);
             }
@@ -1097,14 +972,14 @@ static const char *str_c(TCGCond c)
 /* Disassemble TCI bytecode. */
 int print_insn_tci(bfd_vma addr, disassemble_info *info)
 {
-    uint8_t buf[256];
-    int length, status;
+    const uint32_t *tb_ptr = (const void *)(uintptr_t)addr;
     const TCGOpDef *def;
     const char *op_name;
+    uint32_t insn;
     TCGOpcode op;
-    TCGReg r0, r1, r2, r3;
+    TCGReg r0, r1, r2, r3, r4;
 #if TCG_TARGET_REG_BITS == 32
-    TCGReg r4, r5;
+    TCGReg r5;
 #endif
     tcg_target_ulong i1;
     int32_t s2;
@@ -1112,71 +987,54 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     TCGMemOpIdx oi;
     uint8_t pos, len;
     void *ptr;
-    const uint8_t *tb_ptr;
 
-    status = info->read_memory_func(addr, buf, 2, info);
-    if (status != 0) {
-        info->memory_error_func(status, addr, info);
-        return -1;
-    }
-    op = buf[0];
-    length = buf[1];
+    /* TCI is always the host, so we don't need to load indirect. */
+    insn = *tb_ptr++;
 
-    if (length < 2) {
-        info->fprintf_func(info->stream, "invalid length %d", length);
-        return 1;
-    }
-
-    status = info->read_memory_func(addr + 2, buf + 2, length - 2, info);
-    if (status != 0) {
-        info->memory_error_func(status, addr + 2, info);
-        return -1;
-    }
+    info->fprintf_func(info->stream, "%08x  ", insn);
 
+    op = extract32(insn, 0, 8);
     def = &tcg_op_defs[op];
     op_name = def->name;
-    tb_ptr = buf + 2;
 
     switch (op) {
     case INDEX_op_br:
     case INDEX_op_exit_tb:
     case INDEX_op_goto_tb:
-        tci_args_l(&tb_ptr, &ptr);
+        tci_args_l(insn, tb_ptr, &ptr);
         info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
         break;
 
     case INDEX_op_call:
-        tci_args_nl(&tb_ptr, &len, &ptr);
+        tci_args_nl(insn, tb_ptr, &len, &ptr);
         info->fprintf_func(info->stream, "%-12s  %d,%p", op_name, len, ptr);
         break;
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        tci_args_rl(&tb_ptr, &r0, &ptr);
+        tci_args_rl(insn, tb_ptr, &r0, &ptr);
         info->fprintf_func(info->stream, "%-12s  %s,0,ne,%p",
                            op_name, str_r(r0), ptr);
         break;
 
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
-        tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &c);
+        tci_args_rrrc(insn, &r0, &r1, &r2, &c);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
                            op_name, str_r(r0), str_r(r1), str_r(r2), str_c(c));
         break;
 
-    case INDEX_op_tci_movi_i32:
-        tci_args_ri(&tb_ptr, &r0, &i1);
+    case INDEX_op_tci_movi:
+        tci_args_ri(insn, &r0, &i1);
         info->fprintf_func(info->stream, "%-12s  %s,0x%" TCG_PRIlx "",
                            op_name, str_r(r0), i1);
         break;
 
-#if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_tci_movi_i64:
-        tci_args_rI(&tb_ptr, &r0, &i1);
-        info->fprintf_func(info->stream, "%-12s  %s,0x%" TCG_PRIlx "",
-                           op_name, str_r(r0), i1);
+    case INDEX_op_tci_movl:
+        tci_args_rl(insn, tb_ptr, &r0, &ptr);
+        info->fprintf_func(info->stream, "%-12s  %s,%p",
+                           op_name, str_r(r0), ptr);
         break;
-#endif
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
@@ -1197,7 +1055,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
-        tci_args_rrs(&tb_ptr, &r0, &r1, &s2);
+        tci_args_rrs(insn, &r0, &r1, &s2);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%d",
                            op_name, str_r(r0), str_r(r1), s2);
         break;
@@ -1224,7 +1082,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_not_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
-        tci_args_rr(&tb_ptr, &r0, &r1);
+        tci_args_rr(insn, &r0, &r1);
         info->fprintf_func(info->stream, "%-12s  %s,%s",
                            op_name, str_r(r0), str_r(r1));
         break;
@@ -1259,28 +1117,28 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
-        tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+        tci_args_rrr(insn, &r0, &r1, &r2);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s",
                            op_name, str_r(r0), str_r(r1), str_r(r2));
         break;
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+        tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%d,%d",
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
-        tci_args_rrrrrc(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &c);
+        tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
                            op_name, str_r(r0), str_r(r1), str_r(r2),
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
     case INDEX_op_mulu2_i32:
-        tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
+        tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
                            op_name, str_r(r0), str_r(r1),
                            str_r(r2), str_r(r3));
@@ -1288,7 +1146,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+        tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
                            op_name, str_r(r0), str_r(r1), str_r(r2),
                            str_r(r3), str_r(r4), str_r(r5));
@@ -1306,30 +1164,38 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
         len += DIV_ROUND_UP(TARGET_LONG_BITS, TCG_TARGET_REG_BITS);
         switch (len) {
         case 2:
-            tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+            tci_args_rrm(insn, &r0, &r1, &oi);
             info->fprintf_func(info->stream, "%-12s  %s,%s,%x",
                                op_name, str_r(r0), str_r(r1), oi);
             break;
         case 3:
-            tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+            tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
             info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%x",
                                op_name, str_r(r0), str_r(r1), str_r(r2), oi);
             break;
         case 4:
-            tci_args_rrrrm(&tb_ptr, &r0, &r1, &r2, &r3, &oi);
-            info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%x",
+            tci_args_rrrrr(insn, &r0, &r1, &r2, &r3, &r4);
+            info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s",
                                op_name, str_r(r0), str_r(r1),
-                               str_r(r2), str_r(r3), oi);
+                               str_r(r2), str_r(r3), str_r(r4));
             break;
         default:
             g_assert_not_reached();
         }
         break;
 
+    case 0:
+        /* tcg_out_nop_fill uses zeros */
+        if (insn == 0) {
+            info->fprintf_func(info->stream, "align");
+            break;
+        }
+        /* fall through */
+
     default:
         info->fprintf_func(info->stream, "illegal opcode %d", op);
         break;
     }
 
-    return length;
+    return sizeof(insn);
 }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e06d4e9380..0df8384be7 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -22,20 +22,7 @@
  * THE SOFTWARE.
  */
 
-/* TODO list:
- * - See TODO comments in code.
- */
-
-/* Marker for missing code. */
-#define TODO() \
-    do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
-                __FILE__, __LINE__, __func__); \
-        tcg_abort(); \
-    } while (0)
-
-/* Bitfield n...m (in 32 bit value). */
-#define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
+#include "../tcg-pool.c.inc"
 
 static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
@@ -226,52 +213,16 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
-    /* tcg_out_reloc always uses the same type, addend. */
-    tcg_debug_assert(type == sizeof(tcg_target_long));
+    intptr_t diff = value - (intptr_t)(code_ptr + 1);
+
     tcg_debug_assert(addend == 0);
-    tcg_debug_assert(value != 0);
-    if (TCG_TARGET_REG_BITS == 32) {
-        tcg_patch32(code_ptr, value);
-    } else {
-        tcg_patch64(code_ptr, value);
-    }
-    return true;
-}
-
-/* Write value (native size). */
-static void tcg_out_i(TCGContext *s, tcg_target_ulong v)
-{
-    if (TCG_TARGET_REG_BITS == 32) {
-        tcg_out32(s, v);
-    } else {
-        tcg_out64(s, v);
-    }
-}
-
-/* Write opcode. */
-static void tcg_out_op_t(TCGContext *s, TCGOpcode op)
-{
-    tcg_out8(s, op);
-    tcg_out8(s, 0);
-}
-
-/* Write register. */
-static void tcg_out_r(TCGContext *s, TCGArg t0)
-{
-    tcg_debug_assert(t0 < TCG_TARGET_NB_REGS);
-    tcg_out8(s, t0);
-}
-
-/* Write label. */
-static void tci_out_label(TCGContext *s, TCGLabel *label)
-{
-    if (label->has_value) {
-        tcg_out_i(s, label->u.value);
-        tcg_debug_assert(label->u.value);
-    } else {
-        tcg_out_reloc(s, s->code_ptr, sizeof(tcg_target_ulong), label, 0);
-        s->code_ptr += sizeof(tcg_target_ulong);
+    tcg_debug_assert(type == 20);
+
+    if (diff == sextract32(diff, 0, type)) {
+        tcg_patch32(code_ptr, deposit32(*code_ptr, 32 - type, type, diff));
+        return true;
     }
+    return false;
 }
 
 static void stack_bounds_check(TCGReg base, target_long offset)
@@ -285,251 +236,236 @@ static void stack_bounds_check(TCGReg base, target_long offset)
 
 static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tci_out_label(s, l0);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_out_reloc(s, s->code_ptr, 20, l0, 0);
+    insn = deposit32(insn, 0, 8, op);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
+    intptr_t diff;
 
-    tcg_out_op_t(s, op);
-    tcg_out_i(s, (uintptr_t)p0);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    /* Special case for exit_tb: map null -> 0. */
+    if (p0 == NULL) {
+        diff = 0;
+    } else {
+        diff = p0 - (void *)(s->code_ptr + 1);
+        tcg_debug_assert(diff != 0);
+        if (diff != sextract32(diff, 0, 20)) {
+            tcg_raise_tb_overflow(s);
+        }
+    }
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 12, 20, diff);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    tcg_out_op_t(s, op);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
-}
-
-static void tcg_out_op_np(TCGContext *s, TCGOpcode op,
-                          uint8_t n0, const void *p1)
-{
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    tcg_out_op_t(s, op);
-    tcg_out8(s, n0);
-    tcg_out_i(s, (uintptr_t)p1);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_out32(s, (uint8_t)op);
 }
 
 static void tcg_out_op_ri(TCGContext *s, TCGOpcode op, TCGReg r0, int32_t i1)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out32(s, i1);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_debug_assert(i1 == sextract32(i1, 0, 20));
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 20, i1);
+    tcg_out32(s, insn);
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void tcg_out_op_rI(TCGContext *s, TCGOpcode op,
-                          TCGReg r0, uint64_t i1)
-{
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out64(s, i1);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
-}
-#endif
-
 static void tcg_out_op_rl(TCGContext *s, TCGOpcode op, TCGReg r0, TCGLabel *l1)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tci_out_label(s, l1);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_out_reloc(s, s->code_ptr, 20, l1, 0);
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrm(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, TCGArg m2)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out32(s, m2);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_debug_assert(m2 == extract32(m2, 0, 12));
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 20, 12, m2);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrr(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, TCGReg r2)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_debug_assert(i2 == (int32_t)i2);
-    tcg_out32(s, i2);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_debug_assert(i2 == sextract32(i2, 0, 16));
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 16, i2);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out8(s, c3);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    insn = deposit32(insn, 20, 4, c3);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrrm(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGArg m3)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out32(s, m3);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_debug_assert(m3 == extract32(m3, 0, 12));
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    insn = deposit32(insn, 20, 12, m3);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
                              TCGReg r1, TCGReg r2, uint8_t b3, uint8_t b4)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out8(s, b3);
-    tcg_out8(s, b4);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    tcg_debug_assert(b3 == extract32(b3, 0, 6));
+    tcg_debug_assert(b4 == extract32(b4, 0, 6));
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    insn = deposit32(insn, 20, 6, b3);
+    insn = deposit32(insn, 26, 6, b4);
+    tcg_out32(s, insn);
 }
 
-static void tcg_out_op_rrrrm(TCGContext *s, TCGOpcode op, TCGReg r0,
-                             TCGReg r1, TCGReg r2, TCGReg r3, TCGArg m4)
+static void tcg_out_op_rrrrr(TCGContext *s, TCGOpcode op, TCGReg r0,
+                             TCGReg r1, TCGReg r2, TCGReg r3, TCGReg r4)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out_r(s, r3);
-    tcg_out32(s, m4);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    insn = deposit32(insn, 20, 4, r3);
+    insn = deposit32(insn, 24, 4, r4);
+    tcg_out32(s, insn);
 }
 
 #if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out_r(s, r3);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    insn = deposit32(insn, 20, 4, r3);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out_r(s, r3);
-    tcg_out_r(s, r4);
-    tcg_out8(s, c5);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    insn = deposit32(insn, 20, 4, r3);
+    insn = deposit32(insn, 24, 4, r4);
+    insn = deposit32(insn, 28, 4, c5);
+    tcg_out32(s, insn);
 }
 
 static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGReg r5)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
+    tcg_insn_unit insn = 0;
 
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out_r(s, r3);
-    tcg_out_r(s, r4);
-    tcg_out_r(s, r5);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 4, r2);
+    insn = deposit32(insn, 20, 4, r3);
+    insn = deposit32(insn, 24, 4, r4);
+    insn = deposit32(insn, 28, 4, r5);
+    tcg_out32(s, insn);
 }
 #endif
 
+static void tcg_out_ldst(TCGContext *s, TCGOpcode op, TCGReg val,
+                         TCGReg base, intptr_t offset)
+{
+    stack_bounds_check(base, offset);
+    if (offset != sextract32(offset, 0, 16)) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, offset);
+        tcg_out_op_rrr(s, (TCG_TARGET_REG_BITS == 32
+                           ? INDEX_op_add_i32 : INDEX_op_add_i64),
+                       TCG_REG_TMP, TCG_REG_TMP, base);
+        base = TCG_REG_TMP;
+        offset = 0;
+    }
+    tcg_out_op_rrs(s, op, val, base, offset);
+}
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
-    stack_bounds_check(base, offset);
     switch (type) {
     case TCG_TYPE_I32:
-        tcg_out_op_rrs(s, INDEX_op_ld_i32, val, base, offset);
+        tcg_out_ldst(s, INDEX_op_ld_i32, val, base, offset);
         break;
 #if TCG_TARGET_REG_BITS == 64
     case TCG_TYPE_I64:
-        tcg_out_op_rrs(s, INDEX_op_ld_i64, val, base, offset);
+        tcg_out_ldst(s, INDEX_op_ld_i64, val, base, offset);
         break;
 #endif
     default:
@@ -559,22 +495,33 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 {
     switch (type) {
     case TCG_TYPE_I32:
-        tcg_out_op_ri(s, INDEX_op_tci_movi_i32, ret, arg);
-        break;
 #if TCG_TARGET_REG_BITS == 64
+        arg = (int32_t)arg;
+        /* fall through */
     case TCG_TYPE_I64:
-        tcg_out_op_rI(s, INDEX_op_tci_movi_i64, ret, arg);
-        break;
 #endif
+        break;
     default:
         g_assert_not_reached();
     }
+
+    if (arg == sextract32(arg, 0, 20)) {
+        tcg_out_op_ri(s, INDEX_op_tci_movi, ret, arg);
+    } else {
+        tcg_insn_unit insn = 0;
+
+        new_pool_label(s, arg, 20, s->code_ptr, 0);
+        insn = deposit32(insn, 0, 8, INDEX_op_tci_movl);
+        insn = deposit32(insn, 8, 4, ret);
+        tcg_out32(s, insn);
+    }
 }
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
     const TCGHelperInfo *info;
     uint8_t which;
+    tcg_insn_unit insn = 0;
 
     info = g_hash_table_lookup(helper_table, (gpointer)arg);
     if (info->cif->rtype == &ffi_type_void) {
@@ -586,7 +533,11 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
         which = 2;
     }
 
-    tcg_out_op_np(s, INDEX_op_call, which, info);
+    new_pool_l2(s, 20, s->code_ptr, 0,
+                (uintptr_t)info->func, (uintptr_t)info->cif);
+    insn = deposit32(insn, 0, 8, INDEX_op_call);
+    insn = deposit32(insn, 8, 4, which);
+    tcg_out32(s, insn);
 }
 
 #if TCG_TARGET_REG_BITS == 64
@@ -644,8 +595,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_st_i32:
     CASE_64(st32)
     CASE_64(st)
-        stack_bounds_check(args[1], args[2]);
-        tcg_out_op_rrs(s, opc, args[0], args[1], args[2]);
+        tcg_out_ldst(s, opc, args[0], args[1], args[2]);
         break;
 
     CASE_32_64(add)
@@ -738,8 +688,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         } else if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
             tcg_out_op_rrrm(s, opc, args[0], args[1], args[2], args[3]);
         } else {
-            tcg_out_op_rrrrm(s, opc, args[0], args[1],
-                             args[2], args[3], args[4]);
+            tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_TMP, args[4]);
+            tcg_out_op_rrrrr(s, opc, args[0], args[1],
+                             args[2], args[3], TCG_REG_TMP);
         }
         break;
 
@@ -787,6 +738,11 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
     return arg_ct->ct & TCG_CT_CONST;
 }
 
+static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
+{
+    memset(p, 0, sizeof(*p) * count);
+}
+
 static void tcg_target_init(TCGContext *s)
 {
 #if defined(CONFIG_DEBUG_TCG_INTERPRETER)
diff --git a/tcg/tci/README b/tcg/tci/README
index 9bb7d7a5d3..f72a40a395 100644
--- a/tcg/tci/README
+++ b/tcg/tci/README
@@ -23,10 +23,12 @@ This is what TCI (Tiny Code Interpreter) does.
 Like each TCG host frontend, TCI implements the code generator in
 tcg-target.c.inc, tcg-target.h. Both files are in directory tcg/tci.
 
-The additional file tcg/tci.c adds the interpreter.
+The additional file tcg/tci.c adds the interpreter and disassembler.
 
-The bytecode consists of opcodes (same numeric values as those used by
-TCG), command length and arguments of variable size and number.
+The bytecode consists of opcodes (with only a few exceptions, with
+the same same numeric values and semantics as used by TCG), and up
+to six arguments packed into a 32-bit integer.  See comments in tci.c
+for details on the encoding.
 
 3) Usage
 
@@ -39,11 +41,6 @@ suggest using this option. Setting it automatically would need
 additional code in configure which must be fixed when new native TCG
 implementations are added.
 
-System emulation should work on any 32 or 64 bit host.
-User mode emulation might work. Maybe a new linker script (*.ld)
-is needed. Byte order might be wrong (on big endian hosts)
-and need fixes in configure.
-
 For hosts with native TCG, the interpreter TCI can be enabled by
 
         configure --enable-tcg-interpreter
@@ -118,13 +115,6 @@ u1 = linux-user-test works
   in the interpreter. These opcodes raise a runtime exception, so it is
   possible to see where code must be added.
 
-* The pseudo code is not optimized and still ugly. For hosts with special
-  alignment requirements, it needs some fixes (maybe aligned bytecode
-  would also improve speed for hosts which support byte alignment).
-
-* A better disassembler for the pseudo code would be nice (a very primitive
-  disassembler is included in tcg-target.c.inc).
-
 * It might be useful to have a runtime option which selects the native TCG
   or TCI, so QEMU would have to include two TCGs. Today, selecting TCI
   is a configure option, so you need two compilations of QEMU.
-- 
2.25.1


