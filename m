Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6AF59C393
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:00:20 +0200 (CEST)
Received: from localhost ([::1]:40194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9qc-0001xM-QG
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lv-0000dH-E5
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lc-0000sT-7A
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:34 -0400
Received: by mail-pg1-x52a.google.com with SMTP id w13so4595263pgq.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ilw+7P1s37Y2jNcUV45jTcqxm83VECE5VnusacIVBZ0=;
 b=wBnjAVA3P+8srMrTF+7tQdaEZukzf/oEtqCvHzPPqPbkPMCMLWgHMQUkeY+UMwgx1h
 jWTUTTTvKrWZRYR5NQl72p8FEqXXTpXMC/QtALipLBMcn97B6DCeO3sdnVVf5mO6lG2H
 LPX2+RvYWVjMPwG3l6XBnicpiQmh6UI2yjnKSVgFxTuSQ7suU1NJTxE0iLFQH2K+s608
 pXFZJ3j2un7xPCyay9KCA+S7+rYImb7/V9q3yfUzQkkqKayZbuYWd+rkwlg4hIxRVyHi
 B8gHkSblioksn2Dg8tgU0hj3F1EORgTzYHHreosxXC51pdKtT49Z7BHqOie/g9HG0akm
 GOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ilw+7P1s37Y2jNcUV45jTcqxm83VECE5VnusacIVBZ0=;
 b=ws2z/I/j97xb5Va0XwGCQCMJ39BsZujSzh+JsRaRfm+u/fqdXy2CxRpA3Z6Em0rH3D
 NWLTdKddpZ4moGvljB3ehEuPuFYrFOTa6qCXzDhOfqJBsX+aSzg1eZO0CFU0xELh7au4
 cmu7X28AsVhmjmlAPCHvaAibAcaC9WRrN7Wf6cuF85ZUXk4q9ZdaGGShSqIKivXXZLKK
 gmbL/FqAeRCVgmOgX7Ml1zb7bQcwA0rkR4vNKn6lzPmA2+o0V2yp+0hevERmBYJWt5Pw
 DxtR39GccvnIg9GFup44ESsCJ5hWn502RV+ZmcXW/y7E/8eBg2boENL4PUgGRWItBS6j
 CjTg==
X-Gm-Message-State: ACgBeo0S7tS9Wcs3MxhnSdZFy3j13bwcuUOiPr6bbZCbNHKkdm86B2zG
 G4fFkUqjZzHf0dwiioITbcMfN37pOL9bsA==
X-Google-Smtp-Source: AA6agR7ZALECQCY95E7aGDb/vgoCc1/gRPXwgzpg1LO1Oe1nGJ5J4SQuPVmveWG0PPlUXf6c96Sl2A==
X-Received: by 2002:a63:fb4a:0:b0:429:8605:6ebf with SMTP id
 w10-20020a63fb4a000000b0042986056ebfmr17273940pgj.225.1661182094863; 
 Mon, 22 Aug 2022 08:28:14 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 36/66] target/arm: Reorg get_phys_addr_disabled
Date: Mon, 22 Aug 2022 08:27:11 -0700
Message-Id: <20220822152741.1617527-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a switch.  Do not apply memattr or shareability for Stage2
translations. Make sure to apply HCR_{DC,DCT} only to Regime_EL10,
per the pseudocode in AArch64.S1DisabledOutput.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 115 +++++++++++++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 48 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c798b30db2..fa76f98b04 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2281,64 +2281,83 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
 {
-    uint64_t hcr;
-    uint8_t memattr;
+    uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    uint8_t memattr, shareability;
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        int r_el = regime_el(env, mmu_idx);
-        if (arm_el_is_aa64(env, r_el)) {
-            int pamax = arm_pamax(env_archcpu(env));
-            uint64_t tcr = env->cp15.tcr_el[r_el];
-            int addrtop, tbi;
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
+        memattr = 0x00;    /* unused, but Device, nGnRnE */
+        shareability = 0;  /* unused, but non-shareable */
+        break;
 
-            tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-            if (access_type == MMU_INST_FETCH) {
-                tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        if (hcr & HCR_DC) {
+            if (hcr & HCR_DCT) {
+                memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+            } else {
+                memattr = 0xff;  /* Normal, WB, RWA */
             }
-            tbi = (tbi >> extract64(address, 55, 1)) & 1;
-            addrtop = (tbi ? 55 : 63);
-
-            if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
-                fi->type = ARMFault_AddressSize;
-                fi->level = 0;
-                fi->stage2 = false;
-                return 1;
-            }
-
-            /*
-             * When TBI is disabled, we've just validated that all of the
-             * bits above PAMax are zero, so logically we only need to
-             * clear the top byte for TBI.  But it's clearer to follow
-             * the pseudocode set of addrdesc.paddress.
-             */
-            address = extract64(address, 0, 52);
+            shareability = 0;    /* non-shareable */
+            goto check_range;
         }
+        /* fall through */
+
+    default:
+        if (access_type == MMU_INST_FETCH) {
+            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+                memattr = 0xee;  /* Normal, WT, RA, NT */
+            } else {
+                memattr = 0x44;  /* Normal, NC, No */
+            }
+            shareability = 2;    /* Outer sharable */
+        } else {
+            memattr = 0x00;      /* unused, but Device, nGnRnE */
+            shareability = 0;    /* non-shareable */
+        }
+        /* fall through */
+
+    check_range:
+        {
+            int r_el = regime_el(env, mmu_idx);
+            if (arm_el_is_aa64(env, r_el)) {
+                int pamax = arm_pamax(env_archcpu(env));
+                uint64_t tcr = env->cp15.tcr_el[r_el];
+                int addrtop, tbi;
+
+                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+                if (access_type == MMU_INST_FETCH) {
+                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+                }
+                tbi = (tbi >> extract64(address, 55, 1)) & 1;
+                addrtop = (tbi ? 55 : 63);
+
+                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                    fi->type = ARMFault_AddressSize;
+                    fi->level = 0;
+                    fi->stage2 = false;
+                    return 1;
+                }
+
+                /*
+                 * When TBI is disabled, we've just validated that all of
+                 * the bits above PAMax are zero, so logically we only
+                 * need to clear the top byte for TBI.  But it's clearer
+                 * to follow the pseudocode set of addrdesc.paddress.
+                 */
+                address = extract64(address, 0, 52);
+            }
+        }
+        break;
     }
 
     result->phys = address;
     result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     result->page_size = TARGET_PAGE_SIZE;
-
-    /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-    result->cacheattrs.shareability = 0;
     result->cacheattrs.is_s2_format = false;
-    if (hcr & HCR_DC) {
-        if (hcr & HCR_DCT) {
-            memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-        } else {
-            memattr = 0xff;  /* Normal, WB, RWA */
-        }
-    } else if (access_type == MMU_INST_FETCH) {
-        if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-            memattr = 0xee;  /* Normal, WT, RA, NT */
-        } else {
-            memattr = 0x44;  /* Normal, NC, No */
-        }
-        result->cacheattrs.shareability = 2; /* outer sharable */
-    } else {
-        memattr = 0x00;      /* Device, nGnRnE */
-    }
+    result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
     return 0;
 }
-- 
2.34.1


