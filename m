Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359131E0C9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:50:33 +0100 (CET)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTmI-0000tP-EK
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLo-00007x-BR
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:08 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLl-0007QD-W0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:08 -0500
Received: by mail-pj1-x102d.google.com with SMTP id gx20so2401736pjb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myNnxOdd6aR6rNRnu4Iw7VN5PbwCEgYK5JJ5Ief1/yY=;
 b=knbUTgwtE/2I+KZHpzgL8r20A6xNB6VqSwh8Xwl0fpDS9jK8homR1Tc2D0unC7tN77
 E8PeHDTZBHC7S6z7d4iWJsIcjAeZbMXrCqXsBrqy9u2+AP4Ag1XdjJ+22EFBQqGpWIVA
 116VL51GTwZKYTZvSq8Ms1VLKa12aqze+fptdqCI9BrXUbpzJC7tpCiEAdK41AGkwjUD
 wPUzJIfc4XNjFrRbUH1Vnpq+Rvk/K25j7NwkdnWP5x6zzXOpxbiQrnQFPEEWkX3JXbsq
 BK6mvLXG4oQDj8Nh868ka2ZIVFpjsRak5w6UOlGm4q8Ot9yIc6p6nfCvv6lqEiqkXryo
 dopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myNnxOdd6aR6rNRnu4Iw7VN5PbwCEgYK5JJ5Ief1/yY=;
 b=Yrt+aaSxKXvkuwxYhsBSZMvMayFw03scDh+YuZMXj9WpCarNlO9bYYPnR80WiVaKd9
 usB6YCt40QOHGj6rsurss7eJ26DvMD5wcc+FU5PA0BZVwVlm9GigquVWRpIi2M5kBqAH
 3lK7HDKyB5tk3Xs7Ody/OXA1E7ytbRGy1pvcAGcm+sC11io4g/GpBS9SGw/+gb4yHlD7
 u5Nk7wlfsx2yoq42g+m+JqRWYu2V/Zhr/23bDZ9zJooos01yzm0Ky+CYWA45kx+mCRyP
 qARxhiYa8nttnbStd0VHloXxWhEGtxJJQuFjRw38ALKEn4A3VAFzg6PCvQle+wcCPeM6
 /Olw==
X-Gm-Message-State: AOAM533QQtQ3VsJ1fYiFS7XcdkARihfhUn2SpdL/iw/mxaPTfXOKQ52j
 k6kTCzmihzcjTfzVfWkQMmVcPP1C/4xdBA==
X-Google-Smtp-Source: ABdhPJzFi3TjMv8tAbaWnrnWS20j9NcwaVT9v9yVJFEYoM+J2NdAWXdoNSj+NWFYQzk1LmpVioAVTQ==
X-Received: by 2002:a17:90a:cd06:: with SMTP id d6mr586546pju.86.1613593384736; 
 Wed, 17 Feb 2021 12:23:04 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/71] tcg/tci: Implement the disassembler properly
Date: Wed, 17 Feb 2021 12:20:01 -0800
Message-Id: <20210217202036.1724901-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually print arguments as opposed to simply the opcodes
and, uselessly, the argument counts.  Reuse all of the helpers
developed as part of the interpreter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build           |   2 +-
 include/tcg/tcg-opc.h |   2 -
 disas/tci.c           |  61 ---------
 tcg/tci.c             | 283 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 284 insertions(+), 64 deletions(-)
 delete mode 100644 disas/tci.c

diff --git a/meson.build b/meson.build
index a923f249d8..da225d68a7 100644
--- a/meson.build
+++ b/meson.build
@@ -1925,7 +1925,7 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'tcg/tcg-op.c',
   'tcg/tcg.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c', 'tcg/tci.c'))
+specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
 
 subdir('backends')
 subdir('disas')
diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 900984c005..bbb0884af8 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -278,10 +278,8 @@ DEF(last_generic, 0, 0, 0, TCG_OPF_NOT_PRESENT)
 #ifdef TCG_TARGET_INTERPRETER
 /* These opcodes are only for use between the tci generator and interpreter. */
 DEF(tci_movi_i32, 1, 0, 1, TCG_OPF_NOT_PRESENT)
-#if TCG_TARGET_REG_BITS == 64
 DEF(tci_movi_i64, 1, 0, 1, TCG_OPF_64BIT | TCG_OPF_NOT_PRESENT)
 #endif
-#endif
 
 #undef TLADDR_ARGS
 #undef DATA64_ARGS
diff --git a/disas/tci.c b/disas/tci.c
deleted file mode 100644
index f1d6c6b469..0000000000
--- a/disas/tci.c
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * Tiny Code Interpreter for QEMU - disassembler
- *
- * Copyright (c) 2011 Stefan Weil
- *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation, either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-#include "disas/dis-asm.h"
-#include "tcg/tcg.h"
-
-/* Disassemble TCI bytecode. */
-int print_insn_tci(bfd_vma addr, disassemble_info *info)
-{
-    int length;
-    uint8_t byte;
-    int status;
-    TCGOpcode op;
-
-    status = info->read_memory_func(addr, &byte, 1, info);
-    if (status != 0) {
-        info->memory_error_func(status, addr, info);
-        return -1;
-    }
-    op = byte;
-
-    addr++;
-    status = info->read_memory_func(addr, &byte, 1, info);
-    if (status != 0) {
-        info->memory_error_func(status, addr, info);
-        return -1;
-    }
-    length = byte;
-
-    if (op >= tcg_op_defs_max) {
-        info->fprintf_func(info->stream, "illegal opcode %d", op);
-    } else {
-        const TCGOpDef *def = &tcg_op_defs[op];
-        int nb_oargs = def->nb_oargs;
-        int nb_iargs = def->nb_iargs;
-        int nb_cargs = def->nb_cargs;
-        /* TODO: Improve disassembler output. */
-        info->fprintf_func(info->stream, "%s\to=%d i=%d c=%d",
-                           def->name, nb_oargs, nb_iargs, nb_cargs);
-    }
-
-    return length;
-}
diff --git a/tcg/tci.c b/tcg/tci.c
index 6b63beea28..41d73edc3a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -1059,3 +1059,286 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         }
     }
 }
+
+/*
+ * Disassembler that matches the interpreter
+ */
+
+static const char *str_r(TCGReg r)
+{
+    static const char regs[TCG_TARGET_NB_REGS][4] = {
+        "r0", "r1", "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
+        "r8", "r9", "r10", "r11", "r12", "r13", "env", "sp"
+    };
+
+    QEMU_BUILD_BUG_ON(TCG_AREG0 != TCG_REG_R14);
+    QEMU_BUILD_BUG_ON(TCG_REG_CALL_STACK != TCG_REG_R15);
+
+    assert((unsigned)r < TCG_TARGET_NB_REGS);
+    return regs[r];
+}
+
+static const char *str_c(TCGCond c)
+{
+    static const char cond[16][8] = {
+        [TCG_COND_NEVER] = "never",
+        [TCG_COND_ALWAYS] = "always",
+        [TCG_COND_EQ] = "eq",
+        [TCG_COND_NE] = "ne",
+        [TCG_COND_LT] = "lt",
+        [TCG_COND_GE] = "ge",
+        [TCG_COND_LE] = "le",
+        [TCG_COND_GT] = "gt",
+        [TCG_COND_LTU] = "ltu",
+        [TCG_COND_GEU] = "geu",
+        [TCG_COND_LEU] = "leu",
+        [TCG_COND_GTU] = "gtu",
+    };
+
+    assert((unsigned)c < ARRAY_SIZE(cond));
+    assert(cond[c][0] != 0);
+    return cond[c];
+}
+
+/* Disassemble TCI bytecode. */
+int print_insn_tci(bfd_vma addr, disassemble_info *info)
+{
+    uint8_t buf[256];
+    int length, status;
+    const TCGOpDef *def;
+    const char *op_name;
+    TCGOpcode op;
+    TCGReg r0, r1, r2, r3;
+#if TCG_TARGET_REG_BITS == 32
+    TCGReg r4, r5;
+#endif
+    tcg_target_ulong i1;
+    int32_t s2;
+    TCGCond c;
+    TCGMemOpIdx oi;
+    uint8_t pos, len;
+    void *ptr;
+    const uint8_t *tb_ptr;
+
+    status = info->read_memory_func(addr, buf, 2, info);
+    if (status != 0) {
+        info->memory_error_func(status, addr, info);
+        return -1;
+    }
+    op = buf[0];
+    length = buf[1];
+
+    if (length < 2) {
+        info->fprintf_func(info->stream, "invalid length %d", length);
+        return 1;
+    }
+
+    status = info->read_memory_func(addr + 2, buf + 2, length - 2, info);
+    if (status != 0) {
+        info->memory_error_func(status, addr + 2, info);
+        return -1;
+    }
+
+    def = &tcg_op_defs[op];
+    op_name = def->name;
+    tb_ptr = buf + 2;
+
+    switch (op) {
+    case INDEX_op_br:
+    case INDEX_op_call:
+    case INDEX_op_exit_tb:
+    case INDEX_op_goto_tb:
+        tci_args_l(&tb_ptr, &ptr);
+        info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
+        break;
+
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        tci_args_rrcl(&tb_ptr, &r0, &r1, &c, &ptr);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%p",
+                           op_name, str_r(r0), str_r(r1), str_c(c), ptr);
+        break;
+
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &c);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
+                           op_name, str_r(r0), str_r(r1), str_r(r2), str_c(c));
+        break;
+
+    case INDEX_op_tci_movi_i32:
+        tci_args_ri(&tb_ptr, &r0, &i1);
+        info->fprintf_func(info->stream, "%-12s  %s,0x%" TCG_PRIlx "",
+                           op_name, str_r(r0), i1);
+        break;
+
+#if TCG_TARGET_REG_BITS == 64
+    case INDEX_op_tci_movi_i64:
+        tci_args_rI(&tb_ptr, &r0, &i1);
+        info->fprintf_func(info->stream, "%-12s  %s,0x%" TCG_PRIlx "",
+                           op_name, str_r(r0), i1);
+        break;
+#endif
+
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld_i32:
+    case INDEX_op_ld_i64:
+    case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i32:
+    case INDEX_op_st_i64:
+        tci_args_rrs(&tb_ptr, &r0, &r1, &s2);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%d",
+                           op_name, str_r(r0), str_r(r1), s2);
+        break;
+
+    case INDEX_op_mov_i32:
+    case INDEX_op_mov_i64:
+    case INDEX_op_ext8s_i32:
+    case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
+    case INDEX_op_bswap16_i32:
+    case INDEX_op_bswap16_i64:
+    case INDEX_op_bswap32_i32:
+    case INDEX_op_bswap32_i64:
+    case INDEX_op_bswap64_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+    case INDEX_op_neg_i32:
+    case INDEX_op_neg_i64:
+        tci_args_rr(&tb_ptr, &r0, &r1);
+        info->fprintf_func(info->stream, "%-12s  %s,%s",
+                           op_name, str_r(r0), str_r(r1));
+        break;
+
+    case INDEX_op_add_i32:
+    case INDEX_op_add_i64:
+    case INDEX_op_sub_i32:
+    case INDEX_op_sub_i64:
+    case INDEX_op_mul_i32:
+    case INDEX_op_mul_i64:
+    case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
+    case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
+    case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
+    case INDEX_op_div_i32:
+    case INDEX_op_div_i64:
+    case INDEX_op_rem_i32:
+    case INDEX_op_rem_i64:
+    case INDEX_op_divu_i32:
+    case INDEX_op_divu_i64:
+    case INDEX_op_remu_i32:
+    case INDEX_op_remu_i64:
+    case INDEX_op_shl_i32:
+    case INDEX_op_shl_i64:
+    case INDEX_op_shr_i32:
+    case INDEX_op_shr_i64:
+    case INDEX_op_sar_i32:
+    case INDEX_op_sar_i64:
+    case INDEX_op_rotl_i32:
+    case INDEX_op_rotl_i64:
+    case INDEX_op_rotr_i32:
+    case INDEX_op_rotr_i64:
+        tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s",
+                           op_name, str_r(r0), str_r(r1), str_r(r2));
+        break;
+
+    case INDEX_op_deposit_i32:
+    case INDEX_op_deposit_i64:
+        tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%d,%d",
+                           op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
+        break;
+
+#if TCG_TARGET_REG_BITS == 32
+    case INDEX_op_setcond2_i32:
+        tci_args_rrrrrc(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &c);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
+                           op_name, str_r(r0), str_r(r1), str_r(r2),
+                           str_r(r3), str_r(r4), str_c(c));
+        break;
+
+    case INDEX_op_brcond2_i32:
+        tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &c, &ptr);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%p",
+                           op_name, str_r(r0), str_r(r1),
+                           str_r(r2), str_r(r3), str_c(c), ptr);
+        break;
+
+    case INDEX_op_mulu2_i32:
+        tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
+                           op_name, str_r(r0), str_r(r1),
+                           str_r(r2), str_r(r3));
+        break;
+
+    case INDEX_op_add2_i32:
+    case INDEX_op_sub2_i32:
+        tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
+                           op_name, str_r(r0), str_r(r1), str_r(r2),
+                           str_r(r3), str_r(r4), str_r(r5));
+        break;
+#endif
+
+    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_st_i64:
+        len = DIV_ROUND_UP(64, TCG_TARGET_REG_BITS);
+        goto do_qemu_ldst;
+    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_st_i32:
+        len = 1;
+    do_qemu_ldst:
+        len += DIV_ROUND_UP(TARGET_LONG_BITS, TCG_TARGET_REG_BITS);
+        switch (len) {
+        case 2:
+            tci_args_rrm(&tb_ptr, &r0, &r1, &oi);
+            info->fprintf_func(info->stream, "%-12s  %s,%s,%x",
+                               op_name, str_r(r0), str_r(r1), oi);
+            break;
+        case 3:
+            tci_args_rrrm(&tb_ptr, &r0, &r1, &r2, &oi);
+            info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%x",
+                               op_name, str_r(r0), str_r(r1), str_r(r2), oi);
+            break;
+        case 4:
+            tci_args_rrrrm(&tb_ptr, &r0, &r1, &r2, &r3, &oi);
+            info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%x",
+                               op_name, str_r(r0), str_r(r1),
+                               str_r(r2), str_r(r3), oi);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
+
+    default:
+        info->fprintf_func(info->stream, "illegal opcode %d", op);
+        break;
+    }
+
+    return length;
+}
-- 
2.25.1


