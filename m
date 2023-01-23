Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDEF677C9B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:37:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx06-0006Jo-NO; Mon, 23 Jan 2023 08:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzl-00061B-Se
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzj-0002V3-6I
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so10623040wma.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lVUlCzuReKpCyyuTgLiiDtMEzcD1jFlaCUDrec+Vc7s=;
 b=kCq36M9RpBcQ9OiJsNu7YWOPSnOPf8gFGynIC/pbdNL1vD8XLr/lJs+r6B1Th+TaFP
 dQaXKbRY3Vl48TrLMmPPqmIXfjcwUd5HK3zTW+p9SIWZeMuUjH+EJNhETCJQjGUaCTzl
 6kR6+kUXlnoNjGu6WBmfehujQcl7TQ9xppnmgm471N6BVcu6hDyp6+Z5tVUk/AL22HaW
 nrvsKKpSHryqRUJ/qdQ8r6Q3cf+g++8C02BrX8h+XjU+OrphDKoa9qUzTPT7vv8QklaS
 4g3gkmtPqLPdv6trPFtizm+RChny1ggcRSjGgWca1I7Qhlur9rhM5inD42f+WlRNuari
 3WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVUlCzuReKpCyyuTgLiiDtMEzcD1jFlaCUDrec+Vc7s=;
 b=ibQ4jTqUuqGIy/hKiyoniGcEkgxlY2j6H7ioJ/rnMNI2PPLZp6tNus1ajkWSH7pXKv
 crVEA3m9Eyvvzw07gIP4Vnb6zC8FbJyI5QOuCD+s+XFHOtbaZlSYebaWEV84ClWGvmrm
 wmubzRrZdUCZojYrX7ZzkFEksL5bTVakb1HavRd+s44GVG9dosnRCXL59TDDzMWq6I3I
 wxyrx9zkLOYpVOxNciMlwlAAdriyqfy9VgA+aN83RRclkjj8kFaYlt//xYyDWNzL8vKU
 80yZbfFcRtjUY5lIgvg3z5JP5hmBs8hmdzK9rHwdOyZhelylfXjrKmHGlaI0r4PP3S0t
 mHkA==
X-Gm-Message-State: AFqh2koCyw8w9dLE5JKeoZkl7nN/hysWM6CX3fwkNAuoRQOIuXwXKYj5
 S39w0fegWBvUAMuNAOhNSs5m5VUTALSHMt/m
X-Google-Smtp-Source: AMrXdXu/ppWhGeTMw4RL5oa+pglHL4GQTnJgezkdqZr+WpqlUjzQyRt2kU20ZLgtiCbAPotkS+llMg==
X-Received: by 2002:a05:600c:3596:b0:3da:1357:4ca2 with SMTP id
 p22-20020a05600c359600b003da13574ca2mr25198195wmq.11.1674480977818; 
 Mon, 23 Jan 2023 05:36:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/26] target/arm: Reorg do_coproc_insn
Date: Mon, 23 Jan 2023 13:35:52 +0000
Message-Id: <20230123133553.2171158-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Move the ri == NULL case to the top of the function and return.
This allows the else to be removed and the code unindented.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20230106194451.1213153-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 406 ++++++++++++++++++++---------------------
 1 file changed, 203 insertions(+), 203 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1dcaefb8e75..40f9f07ea30 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4715,220 +4715,220 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                            bool isread, int rt, int rt2)
 {
     const ARMCPRegInfo *ri;
+    bool need_exit_tb;
 
     ri = get_arm_cp_reginfo(s->cp_regs,
             ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
-    if (ri) {
-        bool need_exit_tb;
 
-        /* Check access permissions */
-        if (!cp_access_ok(s->current_el, ri, isread)) {
-            unallocated_encoding(s);
-            return;
-        }
-
-        if (s->hstr_active || ri->accessfn ||
-            (arm_dc_feature(s, ARM_FEATURE_XSCALE) && cpnum < 14)) {
-            /* Emit code to perform further access permissions checks at
-             * runtime; this may result in an exception.
-             * Note that on XScale all cp0..c13 registers do an access check
-             * call in order to handle c15_cpar.
-             */
-            uint32_t syndrome;
-
-            /* Note that since we are an implementation which takes an
-             * exception on a trapped conditional instruction only if the
-             * instruction passes its condition code check, we can take
-             * advantage of the clause in the ARM ARM that allows us to set
-             * the COND field in the instruction to 0xE in all cases.
-             * We could fish the actual condition out of the insn (ARM)
-             * or the condexec bits (Thumb) but it isn't necessary.
-             */
-            switch (cpnum) {
-            case 14:
-                if (is64) {
-                    syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                                 isread, false);
-                } else {
-                    syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                                rt, isread, false);
-                }
-                break;
-            case 15:
-                if (is64) {
-                    syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                                 isread, false);
-                } else {
-                    syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                                rt, isread, false);
-                }
-                break;
-            default:
-                /* ARMv8 defines that only coprocessors 14 and 15 exist,
-                 * so this can only happen if this is an ARMv7 or earlier CPU,
-                 * in which case the syndrome information won't actually be
-                 * guest visible.
-                 */
-                assert(!arm_dc_feature(s, ARM_FEATURE_V8));
-                syndrome = syn_uncategorized();
-                break;
-            }
-
-            gen_set_condexec(s);
-            gen_update_pc(s, 0);
-            gen_helper_access_check_cp_reg(cpu_env,
-                                           tcg_constant_ptr(ri),
-                                           tcg_constant_i32(syndrome),
-                                           tcg_constant_i32(isread));
-        } else if (ri->type & ARM_CP_RAISES_EXC) {
-            /*
-             * The readfn or writefn might raise an exception;
-             * synchronize the CPU state in case it does.
-             */
-            gen_set_condexec(s);
-            gen_update_pc(s, 0);
-        }
-
-        /* Handle special cases first */
-        switch (ri->type & ARM_CP_SPECIAL_MASK) {
-        case 0:
-            break;
-        case ARM_CP_NOP:
-            return;
-        case ARM_CP_WFI:
-            if (isread) {
-                unallocated_encoding(s);
-                return;
-            }
-            gen_update_pc(s, curr_insn_len(s));
-            s->base.is_jmp = DISAS_WFI;
-            return;
-        default:
-            g_assert_not_reached();
-        }
-
-        if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-            gen_io_start();
-        }
-
-        if (isread) {
-            /* Read */
-            if (is64) {
-                TCGv_i64 tmp64;
-                TCGv_i32 tmp;
-                if (ri->type & ARM_CP_CONST) {
-                    tmp64 = tcg_constant_i64(ri->resetvalue);
-                } else if (ri->readfn) {
-                    tmp64 = tcg_temp_new_i64();
-                    gen_helper_get_cp_reg64(tmp64, cpu_env,
-                                            tcg_constant_ptr(ri));
-                } else {
-                    tmp64 = tcg_temp_new_i64();
-                    tcg_gen_ld_i64(tmp64, cpu_env, ri->fieldoffset);
-                }
-                tmp = tcg_temp_new_i32();
-                tcg_gen_extrl_i64_i32(tmp, tmp64);
-                store_reg(s, rt, tmp);
-                tmp = tcg_temp_new_i32();
-                tcg_gen_extrh_i64_i32(tmp, tmp64);
-                tcg_temp_free_i64(tmp64);
-                store_reg(s, rt2, tmp);
-            } else {
-                TCGv_i32 tmp;
-                if (ri->type & ARM_CP_CONST) {
-                    tmp = tcg_constant_i32(ri->resetvalue);
-                } else if (ri->readfn) {
-                    tmp = tcg_temp_new_i32();
-                    gen_helper_get_cp_reg(tmp, cpu_env, tcg_constant_ptr(ri));
-                } else {
-                    tmp = load_cpu_offset(ri->fieldoffset);
-                }
-                if (rt == 15) {
-                    /* Destination register of r15 for 32 bit loads sets
-                     * the condition codes from the high 4 bits of the value
-                     */
-                    gen_set_nzcv(tmp);
-                    tcg_temp_free_i32(tmp);
-                } else {
-                    store_reg(s, rt, tmp);
-                }
-            }
+    if (!ri) {
+        /*
+         * Unknown register; this might be a guest error or a QEMU
+         * unimplemented feature.
+         */
+        if (is64) {
+            qemu_log_mask(LOG_UNIMP, "%s access to unsupported AArch32 "
+                          "64 bit system register cp:%d opc1: %d crm:%d "
+                          "(%s)\n",
+                          isread ? "read" : "write", cpnum, opc1, crm,
+                          s->ns ? "non-secure" : "secure");
         } else {
-            /* Write */
-            if (ri->type & ARM_CP_CONST) {
-                /* If not forbidden by access permissions, treat as WI */
-                return;
-            }
-
-            if (is64) {
-                TCGv_i32 tmplo, tmphi;
-                TCGv_i64 tmp64 = tcg_temp_new_i64();
-                tmplo = load_reg(s, rt);
-                tmphi = load_reg(s, rt2);
-                tcg_gen_concat_i32_i64(tmp64, tmplo, tmphi);
-                tcg_temp_free_i32(tmplo);
-                tcg_temp_free_i32(tmphi);
-                if (ri->writefn) {
-                    gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri),
-                                            tmp64);
-                } else {
-                    tcg_gen_st_i64(tmp64, cpu_env, ri->fieldoffset);
-                }
-                tcg_temp_free_i64(tmp64);
-            } else {
-                TCGv_i32 tmp = load_reg(s, rt);
-                if (ri->writefn) {
-                    gen_helper_set_cp_reg(cpu_env, tcg_constant_ptr(ri), tmp);
-                    tcg_temp_free_i32(tmp);
-                } else {
-                    store_cpu_offset(tmp, ri->fieldoffset, 4);
-                }
-            }
+            qemu_log_mask(LOG_UNIMP, "%s access to unsupported AArch32 "
+                          "system register cp:%d opc1:%d crn:%d crm:%d "
+                          "opc2:%d (%s)\n",
+                          isread ? "read" : "write", cpnum, opc1, crn,
+                          crm, opc2, s->ns ? "non-secure" : "secure");
         }
-
-        /* I/O operations must end the TB here (whether read or write) */
-        need_exit_tb = ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) &&
-                        (ri->type & ARM_CP_IO));
-
-        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
-            /*
-             * A write to any coprocessor register that ends a TB
-             * must rebuild the hflags for the next TB.
-             */
-            gen_rebuild_hflags(s, ri->type & ARM_CP_NEWEL);
-            /*
-             * We default to ending the TB on a coprocessor register write,
-             * but allow this to be suppressed by the register definition
-             * (usually only necessary to work around guest bugs).
-             */
-            need_exit_tb = true;
-        }
-        if (need_exit_tb) {
-            gen_lookup_tb(s);
-        }
-
+        unallocated_encoding(s);
         return;
     }
 
-    /* Unknown register; this might be a guest error or a QEMU
-     * unimplemented feature.
-     */
-    if (is64) {
-        qemu_log_mask(LOG_UNIMP, "%s access to unsupported AArch32 "
-                      "64 bit system register cp:%d opc1: %d crm:%d "
-                      "(%s)\n",
-                      isread ? "read" : "write", cpnum, opc1, crm,
-                      s->ns ? "non-secure" : "secure");
-    } else {
-        qemu_log_mask(LOG_UNIMP, "%s access to unsupported AArch32 "
-                      "system register cp:%d opc1:%d crn:%d crm:%d opc2:%d "
-                      "(%s)\n",
-                      isread ? "read" : "write", cpnum, opc1, crn, crm, opc2,
-                      s->ns ? "non-secure" : "secure");
+    /* Check access permissions */
+    if (!cp_access_ok(s->current_el, ri, isread)) {
+        unallocated_encoding(s);
+        return;
     }
 
-    unallocated_encoding(s);
-    return;
+    if (s->hstr_active || ri->accessfn ||
+        (arm_dc_feature(s, ARM_FEATURE_XSCALE) && cpnum < 14)) {
+        /*
+         * Emit code to perform further access permissions checks at
+         * runtime; this may result in an exception.
+         * Note that on XScale all cp0..c13 registers do an access check
+         * call in order to handle c15_cpar.
+         */
+        uint32_t syndrome;
+
+        /*
+         * Note that since we are an implementation which takes an
+         * exception on a trapped conditional instruction only if the
+         * instruction passes its condition code check, we can take
+         * advantage of the clause in the ARM ARM that allows us to set
+         * the COND field in the instruction to 0xE in all cases.
+         * We could fish the actual condition out of the insn (ARM)
+         * or the condexec bits (Thumb) but it isn't necessary.
+         */
+        switch (cpnum) {
+        case 14:
+            if (is64) {
+                syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
+                                             isread, false);
+            } else {
+                syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
+                                            rt, isread, false);
+            }
+            break;
+        case 15:
+            if (is64) {
+                syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
+                                             isread, false);
+            } else {
+                syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
+                                            rt, isread, false);
+            }
+            break;
+        default:
+            /*
+             * ARMv8 defines that only coprocessors 14 and 15 exist,
+             * so this can only happen if this is an ARMv7 or earlier CPU,
+             * in which case the syndrome information won't actually be
+             * guest visible.
+             */
+            assert(!arm_dc_feature(s, ARM_FEATURE_V8));
+            syndrome = syn_uncategorized();
+            break;
+        }
+
+        gen_set_condexec(s);
+        gen_update_pc(s, 0);
+        gen_helper_access_check_cp_reg(cpu_env,
+                                       tcg_constant_ptr(ri),
+                                       tcg_constant_i32(syndrome),
+                                       tcg_constant_i32(isread));
+    } else if (ri->type & ARM_CP_RAISES_EXC) {
+        /*
+         * The readfn or writefn might raise an exception;
+         * synchronize the CPU state in case it does.
+         */
+        gen_set_condexec(s);
+        gen_update_pc(s, 0);
+    }
+
+    /* Handle special cases first */
+    switch (ri->type & ARM_CP_SPECIAL_MASK) {
+    case 0:
+        break;
+    case ARM_CP_NOP:
+        return;
+    case ARM_CP_WFI:
+        if (isread) {
+            unallocated_encoding(s);
+            return;
+        }
+        gen_update_pc(s, curr_insn_len(s));
+        s->base.is_jmp = DISAS_WFI;
+        return;
+    default:
+        g_assert_not_reached();
+    }
+
+    if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
+        gen_io_start();
+    }
+
+    if (isread) {
+        /* Read */
+        if (is64) {
+            TCGv_i64 tmp64;
+            TCGv_i32 tmp;
+            if (ri->type & ARM_CP_CONST) {
+                tmp64 = tcg_constant_i64(ri->resetvalue);
+            } else if (ri->readfn) {
+                tmp64 = tcg_temp_new_i64();
+                gen_helper_get_cp_reg64(tmp64, cpu_env,
+                                        tcg_constant_ptr(ri));
+            } else {
+                tmp64 = tcg_temp_new_i64();
+                tcg_gen_ld_i64(tmp64, cpu_env, ri->fieldoffset);
+            }
+            tmp = tcg_temp_new_i32();
+            tcg_gen_extrl_i64_i32(tmp, tmp64);
+            store_reg(s, rt, tmp);
+            tmp = tcg_temp_new_i32();
+            tcg_gen_extrh_i64_i32(tmp, tmp64);
+            tcg_temp_free_i64(tmp64);
+            store_reg(s, rt2, tmp);
+        } else {
+            TCGv_i32 tmp;
+            if (ri->type & ARM_CP_CONST) {
+                tmp = tcg_constant_i32(ri->resetvalue);
+            } else if (ri->readfn) {
+                tmp = tcg_temp_new_i32();
+                gen_helper_get_cp_reg(tmp, cpu_env, tcg_constant_ptr(ri));
+            } else {
+                tmp = load_cpu_offset(ri->fieldoffset);
+            }
+            if (rt == 15) {
+                /* Destination register of r15 for 32 bit loads sets
+                 * the condition codes from the high 4 bits of the value
+                 */
+                gen_set_nzcv(tmp);
+                tcg_temp_free_i32(tmp);
+            } else {
+                store_reg(s, rt, tmp);
+            }
+        }
+    } else {
+        /* Write */
+        if (ri->type & ARM_CP_CONST) {
+            /* If not forbidden by access permissions, treat as WI */
+            return;
+        }
+
+        if (is64) {
+            TCGv_i32 tmplo, tmphi;
+            TCGv_i64 tmp64 = tcg_temp_new_i64();
+            tmplo = load_reg(s, rt);
+            tmphi = load_reg(s, rt2);
+            tcg_gen_concat_i32_i64(tmp64, tmplo, tmphi);
+            tcg_temp_free_i32(tmplo);
+            tcg_temp_free_i32(tmphi);
+            if (ri->writefn) {
+                gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri), tmp64);
+            } else {
+                tcg_gen_st_i64(tmp64, cpu_env, ri->fieldoffset);
+            }
+            tcg_temp_free_i64(tmp64);
+        } else {
+            TCGv_i32 tmp = load_reg(s, rt);
+            if (ri->writefn) {
+                gen_helper_set_cp_reg(cpu_env, tcg_constant_ptr(ri), tmp);
+                tcg_temp_free_i32(tmp);
+            } else {
+                store_cpu_offset(tmp, ri->fieldoffset, 4);
+            }
+        }
+    }
+
+    /* I/O operations must end the TB here (whether read or write) */
+    need_exit_tb = ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) &&
+                    (ri->type & ARM_CP_IO));
+
+    if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
+        /*
+         * A write to any coprocessor register that ends a TB
+         * must rebuild the hflags for the next TB.
+         */
+        gen_rebuild_hflags(s, ri->type & ARM_CP_NEWEL);
+        /*
+         * We default to ending the TB on a coprocessor register write,
+         * but allow this to be suppressed by the register definition
+         * (usually only necessary to work around guest bugs).
+         */
+        need_exit_tb = true;
+    }
+    if (need_exit_tb) {
+        gen_lookup_tb(s);
+    }
 }
 
 /* Decode XScale DSP or iWMMXt insn (in the copro space, cp=0 or 1) */
-- 
2.34.1


