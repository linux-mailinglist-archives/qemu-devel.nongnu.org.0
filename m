Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E8B6F7A84
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujve-00014Y-Kz; Thu, 04 May 2023 21:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvH-0000lc-Nm
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:47 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvF-00084Z-GF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a50cb65c92so8246185ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248861; x=1685840861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HdwrRbA/OYW6yPcUFcCFbJJAD4gHx1WdvFufjwwivA=;
 b=Wre2+t5GBaahKwGwCj/Gu6TDOUzoECSP+gNICI3hHmNaLLh2cQH+I1pVZ3LItmFXH6
 lhImJspHEoz0tmz46+W/IKFixqb349CFD0GPRRYVopoC9TQrW7PGhwtWMAvDLpKptswC
 PHHx+x8qwmebU+OI0+qekAj0GRqYjo1imKV2fgZBy082B444ilSlwFh3R/fqS0W7FrU6
 6ICKYWSgLE3FjOn/sixdwdt/t00k1c3oo82x8GHtz+NFQvMOqX0PSFqztlz6esHP9YFB
 vusVqlV4kD8DLgEO/2mvSx4/o2rhi+Aoam0bdm/lDeeF0Cmv7x7b7IMT2fKWn7VJEsku
 hS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248861; x=1685840861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HdwrRbA/OYW6yPcUFcCFbJJAD4gHx1WdvFufjwwivA=;
 b=FxLLKKHwD5C2MjqescF7Y/XA4Iw/4wfZCa/NIZapng/6VFziotTbtK1wIwqizJeiiC
 KPjls1QI8pcxjRf6upP/Mz3UJ9BfUerBJoTGa/WhyL/3kFIHC0/Z60XfzOlKXG5F0xAn
 7GXfbMu1xVGJfRV8FxEONnx85sQFjn4ZGCdxqgTyaVEALzbn5QAGIIhhlqbqXSHqj55Q
 XbiPKIf/kQXqWF++cRnLUT0TFWeY1O0hHeXOURX9n5QRX5UE0+EoDf11cS01/Afau4Kk
 gIdA7Z+mNVl4xxuuyZ62O0D8knCiCV9a5qYbHxJaDpVKMDl5AR/H917/jzISZo/6gF2w
 sc+Q==
X-Gm-Message-State: AC+VfDz/J72PmioquPF5Aq2at8SnhoyJodcF04VVRz3cVvI2gEWhjye6
 WrKApQcgl/B+z68S3QAhs4pTFXU+asz8YQ==
X-Google-Smtp-Source: ACHHUZ6qhXwY235+b6iqAUA3f0SVV6GtXaLP8bIr7/yIRaNY23WtPwpd+cEevKLS65Uu0EOa9/P4yQ==
X-Received: by 2002:a17:902:a716:b0:1a9:80a0:47fc with SMTP id
 w22-20020a170902a71600b001a980a047fcmr4868075plq.17.1683248860752; 
 Thu, 04 May 2023 18:07:40 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:40 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 76/89] target/riscv: Move leaf pte processing out of level loop
Date: Fri,  5 May 2023 11:02:28 +1000
Message-Id: <20230505010241.21812-77-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move the code that never loops outside of the loop.
Unchain the if-return-else statements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-21-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-21-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 234 ++++++++++++++++++++------------------
 1 file changed, 123 insertions(+), 111 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7c9f89d4d3..c2d083f029 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -865,6 +865,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     int ptshift = (levels - 1) * ptidxbits;
+    target_ulong pte;
+    hwaddr pte_addr;
     int i;
 
 #if !TCG_OVERSIZED_GUEST
@@ -881,7 +883,6 @@ restart:
         }
 
         /* check that physical address of PTE is legal */
-        hwaddr pte_addr;
 
         if (two_stage && first_stage) {
             int vbase_prot;
@@ -913,7 +914,6 @@ restart:
             return TRANSLATE_PMP_FAIL;
         }
 
-        target_ulong pte;
         if (riscv_cpu_mxl(env) == MXL_RV32) {
             pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
@@ -938,128 +938,140 @@ restart:
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
-        } else if (!pbmte && (pte & PTE_PBMT)) {
-            return TRANSLATE_FAIL;
-        } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
-            /* Inner PTE, continue walking */
-            if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
-                return TRANSLATE_FAIL;
-            }
-            base = ppn << PGSHIFT;
-        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-            /* Reserved leaf PTE flags: PTE_W */
-            return TRANSLATE_FAIL;
-        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
-            /* Reserved leaf PTE flags: PTE_W + PTE_X */
-            return TRANSLATE_FAIL;
-        } else if ((pte & PTE_U) && ((mode != PRV_U) &&
-                   (!sum || access_type == MMU_INST_FETCH))) {
-            /* User PTE flags when not U mode and mstatus.SUM is not set,
-               or the access type is an instruction fetch */
-            return TRANSLATE_FAIL;
-        } else if (!(pte & PTE_U) && (mode != PRV_S)) {
-            /* Supervisor PTE flags when not S mode */
-            return TRANSLATE_FAIL;
-        } else if (ppn & ((1ULL << ptshift) - 1)) {
-            /* Misaligned PPN */
-            return TRANSLATE_FAIL;
-        } else if (access_type == MMU_DATA_LOAD && !((pte & PTE_R) ||
-                   ((pte & PTE_X) && mxr))) {
-            /* Read access check failed */
-            return TRANSLATE_FAIL;
-        } else if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
-            /* Write access check failed */
-            return TRANSLATE_FAIL;
-        } else if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
-            /* Fetch access check failed */
+        }
+        if (pte & (PTE_R | PTE_W | PTE_X)) {
+            goto leaf;
+        }
+
+        /* Inner PTE, continue walking */
+        if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
             return TRANSLATE_FAIL;
-        } else {
-            /* if necessary, set accessed and dirty bits. */
-            target_ulong updated_pte = pte | PTE_A |
+        }
+        base = ppn << PGSHIFT;
+    }
+
+    /* No leaf pte at any translation level. */
+    return TRANSLATE_FAIL;
+
+ leaf:
+    if (ppn & ((1ULL << ptshift) - 1)) {
+        /* Misaligned PPN */
+        return TRANSLATE_FAIL;
+    }
+    if (!pbmte && (pte & PTE_PBMT)) {
+        /* Reserved without Svpbmt. */
+        return TRANSLATE_FAIL;
+    }
+    if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
+        /* Reserved leaf PTE flags: PTE_W */
+        return TRANSLATE_FAIL;
+    }
+    if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
+        /* Reserved leaf PTE flags: PTE_W + PTE_X */
+        return TRANSLATE_FAIL;
+    }
+    if ((pte & PTE_U) &&
+        ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
+        /*
+         * User PTE flags when not U mode and mstatus.SUM is not set,
+         * or the access type is an instruction fetch.
+         */
+        return TRANSLATE_FAIL;
+    }
+    if (!(pte & PTE_U) && (mode != PRV_S)) {
+        /* Supervisor PTE flags when not S mode */
+        return TRANSLATE_FAIL;
+    }
+    if (access_type == MMU_DATA_LOAD &&
+        !((pte & PTE_R) || ((pte & PTE_X) && mxr))) {
+        /* Read access check failed */
+        return TRANSLATE_FAIL;
+    }
+    if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
+        /* Write access check failed */
+        return TRANSLATE_FAIL;
+    }
+    if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
+        /* Fetch access check failed */
+        return TRANSLATE_FAIL;
+    }
+
+    /* If necessary, set accessed and dirty bits. */
+    target_ulong updated_pte = pte | PTE_A |
                 (access_type == MMU_DATA_STORE ? PTE_D : 0);
 
-            /* Page table updates need to be atomic with MTTCG enabled */
-            if (updated_pte != pte) {
-                if (!hade) {
-                    return TRANSLATE_FAIL;
-                }
+    /* Page table updates need to be atomic with MTTCG enabled */
+    if (updated_pte != pte) {
+        if (!hade) {
+            return TRANSLATE_FAIL;
+        }
 
-                /*
-                 * - if accessed or dirty bits need updating, and the PTE is
-                 *   in RAM, then we do so atomically with a compare and swap.
-                 * - if the PTE is in IO space or ROM, then it can't be updated
-                 *   and we return TRANSLATE_FAIL.
-                 * - if the PTE changed by the time we went to update it, then
-                 *   it is no longer valid and we must re-walk the page table.
-                 */
-                MemoryRegion *mr;
-                hwaddr l = sizeof(target_ulong), addr1;
-                mr = address_space_translate(cs->as, pte_addr, &addr1, &l,
-                                             false, MEMTXATTRS_UNSPECIFIED);
-                if (memory_region_is_ram(mr)) {
-                    target_ulong *pte_pa =
-                        qemu_map_ram_ptr(mr->ram_block, addr1);
+        /*
+         * - if accessed or dirty bits need updating, and the PTE is
+         *   in RAM, then we do so atomically with a compare and swap.
+         * - if the PTE is in IO space or ROM, then it can't be updated
+         *   and we return TRANSLATE_FAIL.
+         * - if the PTE changed by the time we went to update it, then
+         *   it is no longer valid and we must re-walk the page table.
+         */
+        MemoryRegion *mr;
+        hwaddr l = sizeof(target_ulong), addr1;
+        mr = address_space_translate(cs->as, pte_addr, &addr1, &l,
+                                     false, MEMTXATTRS_UNSPECIFIED);
+        if (memory_region_is_ram(mr)) {
+            target_ulong *pte_pa = qemu_map_ram_ptr(mr->ram_block, addr1);
 #if TCG_OVERSIZED_GUEST
-                    /*
-                     * MTTCG is not enabled on oversized TCG guests so
-                     * page table updates do not need to be atomic
-                     */
-                    *pte_pa = pte = updated_pte;
+            /*
+             * MTTCG is not enabled on oversized TCG guests so
+             * page table updates do not need to be atomic
+             */
+            *pte_pa = pte = updated_pte;
 #else
-                    target_ulong old_pte =
-                        qatomic_cmpxchg(pte_pa, pte, updated_pte);
-                    if (old_pte != pte) {
-                        goto restart;
-                    } else {
-                        pte = updated_pte;
-                    }
-#endif
-                } else {
-                    /*
-                     * misconfigured PTE in ROM (AD bits are not preset) or
-                     * PTE is in IO space and can't be updated atomically
-                     */
-                    return TRANSLATE_FAIL;
-                }
+            target_ulong old_pte = qatomic_cmpxchg(pte_pa, pte, updated_pte);
+            if (old_pte != pte) {
+                goto restart;
             }
-
+            pte = updated_pte;
+#endif
+        } else {
             /*
-             * for superpage mappings, make a fake leaf PTE for the TLB's
-             * benefit.
+             * Misconfigured PTE in ROM (AD bits are not preset) or
+             * PTE is in IO space and can't be updated atomically.
              */
-            target_ulong vpn = addr >> PGSHIFT;
-
-            if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
-                napot_bits = ctzl(ppn) + 1;
-                if ((i != (levels - 1)) || (napot_bits != 4)) {
-                    return TRANSLATE_FAIL;
-                }
-            }
+            return TRANSLATE_FAIL;
+        }
+    }
 
-            napot_mask = (1 << napot_bits) - 1;
-            *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
-                          (vpn & (((target_ulong)1 << ptshift) - 1))
-                         ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
+    /* For superpage mappings, make a fake leaf PTE for the TLB's benefit. */
+    target_ulong vpn = addr >> PGSHIFT;
 
-            /* set permissions on the TLB entry */
-            if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-                *prot |= PAGE_READ;
-            }
-            if (pte & PTE_X) {
-                *prot |= PAGE_EXEC;
-            }
-            /*
-             * add write permission on stores or if the page is already dirty,
-             * so that we TLB miss on later writes to update the dirty bit
-             */
-            if ((pte & PTE_W) &&
-                (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
-                *prot |= PAGE_WRITE;
-            }
-            return TRANSLATE_SUCCESS;
+    if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
+        napot_bits = ctzl(ppn) + 1;
+        if ((i != (levels - 1)) || (napot_bits != 4)) {
+            return TRANSLATE_FAIL;
         }
     }
-    return TRANSLATE_FAIL;
+
+    napot_mask = (1 << napot_bits) - 1;
+    *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
+                  (vpn & (((target_ulong)1 << ptshift) - 1))
+                 ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
+
+    /* set permissions on the TLB entry */
+    if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
+        *prot |= PAGE_READ;
+    }
+    if (pte & PTE_X) {
+        *prot |= PAGE_EXEC;
+    }
+    /*
+     * Add write permission on stores or if the page is already dirty,
+     * so that we TLB miss on later writes to update the dirty bit.
+     */
+    if ((pte & PTE_W) && (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
+        *prot |= PAGE_WRITE;
+    }
+    return TRANSLATE_SUCCESS;
 }
 
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
-- 
2.40.0


