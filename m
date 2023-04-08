Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE96DB83F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:48:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyY6-00071h-6r; Fri, 07 Apr 2023 22:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY1-0006zm-KO
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:25 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXv-0005Xd-Ky
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:25 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w11so368465plp.13
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8Z832HZqQKW8Arrk8MF1ne9vkkpSKv00XZ/jb+XK6c=;
 b=NXTj4o4MvEQO67QWzrjppeT+6Pins9l+hWHXHYIvb4YNWI2RBasL4LXiwx/dBUZLJY
 SjQ6QmeBsnohp3EVr1BKwPn61Q8VweohzBguobDK+PL96qyvR9nDmQ+m8J+nMnQyejL7
 kw6x361s4jOmdJfLUSnPfBmqhhWTq5Z0b6mIeiwXfAEeigd+ahzww3htYzrgJ39/KbMY
 7U0pi4zv5eIUX/miNXbhlVImmXkXcr036L847c+r+IjGEnVYZ7MRHdzjGmZEHHVPy9YB
 Wcuiy5ff5ZLtziYPkOtAMeSb4Lhd7o+3vqM9CF9w+WhFdyt5CRzzi9z2fF+PS9WrDnW8
 vwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8Z832HZqQKW8Arrk8MF1ne9vkkpSKv00XZ/jb+XK6c=;
 b=iEj+FXWQL+7RVspx6DjF2T2kB78fLIjQ1OTvG300C8oqz5X8EVJ3TYJ8EEmxNod/r2
 f/cGm/bVT9pSX6OZ1ZSH4KMRPr7mXtjjjeFWDV8YcGenY4Pp2m/EMmL7aV/i9CYgu+Km
 3RJL0SWiZ2UkvsdejS4vP5JaMmFtrYDaJsO6HxwqyZ4Px0ppAYJgJKaJsd9UwoUJmNdz
 6a665wDIqSdwh74l59cfqyNBEqZJAhzLBPjiLXFJelK98cGUpU4DHk2uzNlEI11CqQqQ
 tw9I5jr+WcM+GgmURkbgrGOjLGiyagLzp0QNemkTeyaD1CoAYpECAcRh8o+hmrHKsifQ
 yZ7A==
X-Gm-Message-State: AAQBX9dBYvSo8S8OSqOmdcuFZU9RigwqkY7d908jEExYoG/3UCrCgeLA
 ul0D/WGl9faE2QPCx/8S6G9xm/YTfLl1yfSE1Vo=
X-Google-Smtp-Source: AKy350ZshwMEo7EorpuX2EcHNy5LLIs5AHY0ZirJc3G0SMFLQqUMxKP7I/PkjCMthZoQ4iMFjn1x7A==
X-Received: by 2002:a17:902:f94d:b0:1a1:f95a:2505 with SMTP id
 kx13-20020a170902f94d00b001a1f95a2505mr8481688plb.29.1680921797876; 
 Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 02/42] tcg: Replace tcg_abort with g_assert_not_reached
Date: Fri,  7 Apr 2023 19:42:34 -0700
Message-Id: <20230408024314.3357414-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            |  6 ------
 target/i386/tcg/translate.c  | 20 ++++++++++----------
 target/s390x/tcg/translate.c |  4 ++--
 tcg/optimize.c               | 10 ++++------
 tcg/tcg.c                    |  8 ++++----
 tcg/aarch64/tcg-target.c.inc |  4 ++--
 tcg/arm/tcg-target.c.inc     |  2 +-
 tcg/i386/tcg-target.c.inc    | 14 +++++++-------
 tcg/mips/tcg-target.c.inc    | 14 +++++++-------
 tcg/ppc/tcg-target.c.inc     |  8 ++++----
 tcg/s390x/tcg-target.c.inc   |  8 ++++----
 tcg/sparc64/tcg-target.c.inc |  2 +-
 tcg/tci/tcg-target.c.inc     |  2 +-
 13 files changed, 47 insertions(+), 55 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 5cfaa53938..b19e167e1d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -967,12 +967,6 @@ typedef struct TCGTargetOpDef {
     const char *args_ct_str[TCG_MAX_OP_ARGS];
 } TCGTargetOpDef;
 
-#define tcg_abort() \
-do {\
-    fprintf(stderr, "%s:%d: tcg fatal error\n", __FILE__, __LINE__);\
-    abort();\
-} while (0)
-
 bool tcg_op_supported(TCGOpcode op);
 
 void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9dfad2f7bc..91c9c0c478 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -476,7 +476,7 @@ static TCGv gen_op_deposit_reg_v(DisasContext *s, MemOp ot, int reg, TCGv dest,
         break;
 #endif
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     return cpu_regs[reg];
 }
@@ -660,7 +660,7 @@ static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
         }
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 
     if (ovr_seg >= 0) {
@@ -765,7 +765,7 @@ static void gen_helper_in_func(MemOp ot, TCGv v, TCGv_i32 n)
         gen_helper_inl(v, cpu_env, n);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -782,7 +782,7 @@ static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
         gen_helper_outl(cpu_env, v, n);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1932,7 +1932,7 @@ static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,
             break;
 #endif
         default:
-            tcg_abort();
+            g_assert_not_reached();
         }
     } else {
         switch (ot) {
@@ -1951,7 +1951,7 @@ static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,
             break;
 #endif
         default:
-            tcg_abort();
+            g_assert_not_reached();
         }
     }
     /* store */
@@ -2282,7 +2282,7 @@ static AddressParts gen_lea_modrm_0(CPUX86State *env, DisasContext *s,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 
  done:
@@ -2434,7 +2434,7 @@ static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, MemOp ot)
         ret = x86_ldl_code(env, s);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     return ret;
 }
@@ -3723,7 +3723,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
             break;
         default:
-            tcg_abort();
+            g_assert_not_reached();
         }
         break;
     case 0x99: /* CDQ/CWD */
@@ -3748,7 +3748,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
             break;
         default:
-            tcg_abort();
+            g_assert_not_reached();
         }
         break;
     case 0x1af: /* imul Gv, Ev */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 2d9b4bbb1f..46b874e94d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -418,7 +418,7 @@ static int get_mem_index(DisasContext *s)
     case PSW_ASC_HOME >> FLAG_MASK_PSW_SHIFT:
         return MMU_HOME_IDX;
     default:
-        tcg_abort();
+        g_assert_not_reached();
         break;
     }
 #endif
@@ -652,7 +652,7 @@ static void gen_op_calc_cc(DisasContext *s)
         gen_helper_calc_cc(cc_op, cpu_env, cc_op, cc_src, cc_dst, cc_vr);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 
     /* We now have cc in cc_op as constant */
diff --git a/tcg/optimize.c b/tcg/optimize.c
index ce05989c39..9614fa3638 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -453,9 +453,7 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
         return (uint64_t)x % ((uint64_t)y ? : 1);
 
     default:
-        fprintf(stderr,
-                "Unrecognized operation %d in do_constant_folding.\n", op);
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -493,7 +491,7 @@ static bool do_constant_folding_cond_32(uint32_t x, uint32_t y, TCGCond c)
     case TCG_COND_GTU:
         return x > y;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -521,7 +519,7 @@ static bool do_constant_folding_cond_64(uint64_t x, uint64_t y, TCGCond c)
     case TCG_COND_GTU:
         return x > y;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -541,7 +539,7 @@ static bool do_constant_folding_cond_eq(TCGCond c)
     case TCG_COND_EQ:
         return 1;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 100f81edb2..c3a8578951 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3680,7 +3680,7 @@ static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
 
         case TEMP_VAL_DEAD:
         default:
-            tcg_abort();
+            g_assert_not_reached();
         }
         ts->mem_coherent = 1;
     }
@@ -3767,7 +3767,7 @@ static TCGReg tcg_reg_alloc(TCGContext *s, TCGRegSet required_regs,
         }
     }
 
-    tcg_abort();
+    g_assert_not_reached();
 }
 
 static TCGReg tcg_reg_alloc_pair(TCGContext *s, TCGRegSet required_regs,
@@ -3813,7 +3813,7 @@ static TCGReg tcg_reg_alloc_pair(TCGContext *s, TCGRegSet required_regs,
             }
         }
     }
-    tcg_abort();
+    g_assert_not_reached();
 }
 
 /* Make sure the temporary is in a register.  If needed, allocate the register
@@ -3860,7 +3860,7 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
         break;
     case TEMP_VAL_DEAD:
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     set_temp_val_reg(s, ts, reg);
 }
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index a091326f84..1315cb92ab 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1778,7 +1778,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
         tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1800,7 +1800,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
         tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index d06ac60c15..b4daa97e7a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2302,7 +2302,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index aa7ee16b25..f4baf6e6e9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -218,7 +218,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         tcg_patch8(code_ptr, value);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     return true;
 }
@@ -1095,7 +1095,7 @@ static inline void tcg_out_pushi(TCGContext *s, tcg_target_long val)
         tcg_out_opc(s, OPC_PUSH_Iv, 0, 0, 0);
         tcg_out32(s, val);
     } else {
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1359,7 +1359,7 @@ static void tgen_arithi(TCGContext *s, int c, int r0,
         return;
     }
 
-    tcg_abort();
+    g_assert_not_reached();
 }
 
 static void tcg_out_addi(TCGContext *s, int reg, tcg_target_long val)
@@ -1523,7 +1523,7 @@ static void tcg_out_brcond2(TCGContext *s, const TCGArg *args,
                          label_this, small);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     tcg_out_label(s, label_next);
 }
@@ -1958,7 +1958,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         }
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 
     /* Jump to the code corresponding to next IR of qemu_st */
@@ -2788,7 +2788,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             /* load bits 0..15 */
             tcg_out_modrm(s, OPC_MOVL_EvGv | P_DATA16, a2, a0);
         } else {
-            tcg_abort();
+            g_assert_not_reached();
         }
         break;
 
@@ -2841,7 +2841,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 
 #undef OP_32_64
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 80748d892e..668bc73ee6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -798,7 +798,7 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
         break;
 
      default:
-         tcg_abort();
+         g_assert_not_reached();
          break;
      }
 }
@@ -855,7 +855,7 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
         break;
     }
 
@@ -1337,7 +1337,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         }
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     i = tcg_out_call_iarg_imm(s, i, oi);
 
@@ -1527,7 +1527,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1775,7 +1775,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1848,7 +1848,7 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
@@ -2420,7 +2420,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index afadf9a1e3..e696d153b8 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1509,7 +1509,7 @@ static void tcg_out_cmp(TCGContext *s, int cond, TCGArg arg1, TCGArg arg2,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     op |= BF(cr) | ((type == TCG_TYPE_I64) << 21);
 
@@ -1680,7 +1680,7 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1834,7 +1834,7 @@ static void tcg_out_cmp2(TCGContext *s, const TCGArg *args,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -3125,7 +3125,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:   /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:   /* Always emitted via tcg_out_goto_tb.  */
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 844532156b..d07d28bcfd 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1641,7 +1641,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1687,7 +1687,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
         break;
 
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -1818,7 +1818,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
         tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
         break;
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
@@ -2645,7 +2645,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 694f2b9dd4..4ee5732b66 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1701,7 +1701,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c1d34d7bd1..5309c3ffe1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -796,7 +796,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
-- 
2.34.1


