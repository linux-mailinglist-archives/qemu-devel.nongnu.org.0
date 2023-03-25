Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8E6C8F49
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 17:03:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg6Jy-0007Tt-1E; Sat, 25 Mar 2023 12:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg6Jn-0007QW-NS
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:00:36 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg6Jl-0004Xd-Gu
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:00:35 -0400
Received: by mail-ua1-f50.google.com with SMTP id s23so3443318uae.5
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679760022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Db2qT2jh78jwLCtmu1Fy3YVg9jzge5vvujRcJ1Hc/vE=;
 b=kXMiZnagFXwsVtCKTtMjnKCE0IL7E3o3Vo48wGQ9S1lzON3GNI/VLoGDuv2qsiQCUj
 /vEVwCK2yLDZj8QR0GKQOkj6T/ZvdWxw6RP4ZgVrIWCSnmnaxTo3ugfo6muztuYZoZcZ
 zJbEkcyxvS8s59TBnDHSRC2uiiDNa6rHp5JdSgGoSGSks00ERVEUQpLLdRuISTwBn29n
 hXz7rH7xuaU3+sUx6W6eCJtPt/oySxG/bXwIYeL/BlEg/9sSV2w3B//peSU3T/wKqXSz
 oitxbF12CmHQ5J5ww7Fb1AZEyr/BB1X7zUZtP27dNXGjYm+zg1Aaseltp80+mbeUObYc
 m/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679760022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Db2qT2jh78jwLCtmu1Fy3YVg9jzge5vvujRcJ1Hc/vE=;
 b=1dYq+GxDCxkaEruQDF/SqSl0gcvHkqw7RjNbysTFfsbeO5g8oEnE9e48xhplJzZ4EW
 imBTkQiSQN5a8Ap9eBlCpgIK/4nNij/3jD21pfpaJrDOT0pflKAyoYggSejvILDvYBs1
 7mcEnsmD/6NpmkwMBmSBp5uEoHWs2T8QTlPpe0A6RxwjfUC/q96YndS1C6Mo/IpaPxUA
 R2Q/8V0vtK3WcBVP9CDlCUWZNuU14r1eyl7mm6pFg60oxdFh2WkY+scOUZDHgslvRmfK
 JsjxV0lvTOD6n0yPG70gWQLxzAUO0c2y90eYBJzTkovkBVbQVl6dyJAFTuc2fRDd8ywu
 vsiw==
X-Gm-Message-State: AO0yUKWT1HFjfMNkK1UOu1fwItCRUs9kxusiYLHgNElquz173OkmRgbN
 6mvIrGL61DRa53Pez1pRL19sJoBCGqtgqVBG+FM=
X-Google-Smtp-Source: AKy350Zz8F9sKetDdj28HBfzTuBn3+jn0SHhAI3J5tKruinn8i2C91PxlDamEQFpyVK7Z9jr0idxFA==
X-Received: by 2002:a17:90b:1b0a:b0:23d:2532:ae34 with SMTP id
 nu10-20020a17090b1b0a00b0023d2532ae34mr5097974pjb.2.1679741688474; 
 Sat, 25 Mar 2023 03:54:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 20/25] target/riscv: Move leaf pte processing out of level
 loop
Date: Sat, 25 Mar 2023 03:54:24 -0700
Message-Id: <20230325105429.1142530-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.222.50;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-f50.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Move the code that never loops outside of the loop.
Unchain the if-return-else statements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 234 +++++++++++++++++++++-----------------
 1 file changed, 127 insertions(+), 107 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 00f70a3dd5..ce12dcec1d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -879,6 +879,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     int ptshift = (levels - 1) * ptidxbits;
+    target_ulong pte;
+    hwaddr pte_addr;
     int i;
 
 #if !TCG_OVERSIZED_GUEST
@@ -895,7 +897,6 @@ restart:
         }
 
         /* check that physical address of PTE is legal */
-        hwaddr pte_addr;
 
         if (two_stage && first_stage) {
             int vbase_prot;
@@ -927,7 +928,6 @@ restart:
             return TRANSLATE_PMP_FAIL;
         }
 
-        target_ulong pte;
         if (riscv_cpu_mxl(env) == MXL_RV32) {
             pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
@@ -952,120 +952,140 @@ restart:
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
-        } else if (!pbmte && (pte & PTE_PBMT)) {
+        }
+        if (pte & (PTE_R | PTE_W | PTE_X)) {
+            goto leaf;
+        }
+
+        /* Inner PTE, continue walking */
+        if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
             return TRANSLATE_FAIL;
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
-            return TRANSLATE_FAIL;
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
-                mr = address_space_translate(cs->as, pte_addr,
-                    &addr1, &l, false, MEMTXATTRS_UNSPECIFIED);
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
+        mr = address_space_translate(cs->as, pte_addr, &addr1, &l, false,
+                                     MEMTXATTRS_UNSPECIFIED);
+        if (memory_region_is_ram(mr)) {
+            target_ulong *pte_pa = qemu_map_ram_ptr(mr->ram_block, addr1);
 #if TCG_OVERSIZED_GUEST
-                    /* MTTCG is not enabled on oversized TCG guests so
-                     * page table updates do not need to be atomic */
-                    *pte_pa = pte = updated_pte;
+            /*
+             * MTTCG is not enabled on oversized TCG guests so
+             * page table updates do not need to be atomic.
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
+            target_ulong old_pte = qatomic_cmpxchg(pte_pa, pte, updated_pte);
+            if (old_pte != pte) {
+                goto restart;
+            }
+            pte = updated_pte;
 #endif
-                } else {
-                    /* misconfigured PTE in ROM (AD bits are not preset) or
-                     * PTE is in IO space and can't be updated atomically */
-                    return TRANSLATE_FAIL;
-                }
-            }
-
-            /* for superpage mappings, make a fake leaf PTE for the TLB's
-               benefit. */
-            target_ulong vpn = addr >> PGSHIFT;
-
-            if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
-                napot_bits = ctzl(ppn) + 1;
-                if ((i != (levels - 1)) || (napot_bits != 4)) {
-                    return TRANSLATE_FAIL;
-                }
-            }
-
-            napot_mask = (1 << napot_bits) - 1;
-            *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
-                          (vpn & (((target_ulong)1 << ptshift) - 1))
-                         ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
-
-            /* set permissions on the TLB entry */
-            if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-                *prot |= PAGE_READ;
-            }
-            if ((pte & PTE_X)) {
-                *prot |= PAGE_EXEC;
-            }
-            /* add write permission on stores or if the page is already dirty,
-               so that we TLB miss on later writes to update the dirty bit */
-            if ((pte & PTE_W) &&
-                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
-                *prot |= PAGE_WRITE;
-            }
-            return TRANSLATE_SUCCESS;
+        } else {
+            /*
+             * Misconfigured PTE in ROM (AD bits are not preset) or
+             * PTE is in IO space and can't be updated atomically.
+             */
+            return TRANSLATE_FAIL;
         }
     }
-    return TRANSLATE_FAIL;
+
+    /* For superpage mappings, make a fake leaf PTE for the TLB's benefit. */
+    target_ulong vpn = addr >> PGSHIFT;
+
+    if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
+        napot_bits = ctzl(ppn) + 1;
+        if ((i != (levels - 1)) || (napot_bits != 4)) {
+            return TRANSLATE_FAIL;
+        }
+    }
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
2.34.1


