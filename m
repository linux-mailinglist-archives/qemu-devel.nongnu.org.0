Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D5660757
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDseH-0005ir-CZ; Fri, 06 Jan 2023 14:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDseB-0005h2-DP
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:44:59 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDse7-0001fz-HG
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:44:58 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso2811360pjf.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp/0IW3cJi9WbPXaPzzkVP5J/ZyF9LGxkPmtqCWwdTQ=;
 b=UiYxQ8EHOD2qgxwZkjbuERDgPPFS+kp5MwQ7cMSvElGEKV9Wqu+Io35C6yIyXoFpb8
 sPLYA5TzzRayLnjMf77SjNW+5ETc4sR/2h7n/aXPTLRanzWQ0U33M/TIqV4J1HTiuBnA
 z8kU0RTK3+lgGyPE4ZOywybQwxp+dk1h4qeSgttsedPvomI0Ginf11vfI+PS6XSHrabm
 e+QA+4srNL7l68tlRJ7RaveFD+sXuM9GNwTYOazlbvAke15csV69HR3T2AH1SJmJYvpx
 AsLM26MELXhK/G2V+Jdhe7LPJRlewRMgsr90Su9WfZq/zSNbNx1QQeZ+GeVNAOTWO7am
 DzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lp/0IW3cJi9WbPXaPzzkVP5J/ZyF9LGxkPmtqCWwdTQ=;
 b=eba75WAe+WsWQpUcfvX+qpnawlM0Iwda2t5sVRMCoGrTCY4s0n286o5ipnvorV+wLw
 3OiTzatMxDhG7tlUBhliSg6dyGH4Wm0rH48ZEz1cacgH+fIgvG1TuBebCGwin2lBWhPp
 KQq1cBY4RX1AP4caXdnvp/AtPZT/Dj/kNYMm+hMyM4CpyNPQzBer6Xs8IRDrDma7RrR/
 eD5isVpO9eYMu1x/76WJSqIrc7wuFX1TCnt8eWow4/VKophgLTztzjvycj0EqmbUgTAd
 FCGOMN/qSXaLSJPHggdJVNkAMU76icnYG/oG8hxs+u8nXhojFXLCBAxMY5rKiraat56D
 0q2A==
X-Gm-Message-State: AFqh2kqK6gzYaltWnnxWCA0UT9boDKP7OLOedUkmrgy0yaz1OZDoC15e
 j6kA/jH+/pn0vvznpuvGhUcFs27/a3zjcRgy
X-Google-Smtp-Source: AMrXdXtWVN3WPbCXJ8Jzld/856H6kA/1Z5g9T76ls9LCPahFjcutPl+VLSsmJhMNFpCCmGmCTGS71A==
X-Received: by 2002:a17:902:b18b:b0:192:6198:a51b with SMTP id
 s11-20020a170902b18b00b001926198a51bmr51226580plr.20.1673034293978; 
 Fri, 06 Jan 2023 11:44:53 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170903228200b001867fdec154sm1277441plh.224.2023.01.06.11.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 11:44:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Reorg do_coproc_insn
Date: Fri,  6 Jan 2023 11:44:50 -0800
Message-Id: <20230106194451.1213153-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106194451.1213153-1-richard.henderson@linaro.org>
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Move the ri == NULL case to the top of the function and return.
This allows the else to be removed and the code unindented.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 406 ++++++++++++++++++++---------------------
 1 file changed, 203 insertions(+), 203 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 74a903072f..a84a02964e 100644
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


