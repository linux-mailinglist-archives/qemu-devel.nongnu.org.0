Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE469D703
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYg-0004Ev-0I; Mon, 20 Feb 2023 18:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYa-00044B-Dy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:52 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYY-0000Ly-HF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:52 -0500
Received: by mail-pl1-x62e.google.com with SMTP id ky4so4300889plb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01eI1hEc43nacXFE44/G2p50ZjHhh23ihEX6wOuioA8=;
 b=HLA5kCka6JXxRy3XBdm/Wk+vRHf0cF8EQuJSwUkcjrHtAdGHyfzdweVt96dBE42so2
 Z2wix15PGpX8SbvT0KkC1N3XVzAXbtDf9VQH2wyQ0fzTvWI4z6Tr4kV7frDNnLpGtGY5
 NrRqChIAQ0s+D68iOOvXFZOXA8Bkzz+x3/cxla6iRix7Om66gQVVw3Vk9poKirncq+Fb
 N0mpT6wa2o75RTWDMpuMdHFl98V6HIf4LRUdVdmnE0xnpr02BHfymqjKem8p05UA8vts
 eUm3QHnJDdjvqJJ1LU47LSS5LcPTjuizEYIZrN5u9lGCqigRQkhkKuKkzG0QmD83+xQ7
 pKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01eI1hEc43nacXFE44/G2p50ZjHhh23ihEX6wOuioA8=;
 b=hOER+6IoUQyKSn+NN1gosp+6cZc9nvPrTm7myITNPKWU7xCf1a9bh8dmC/lGvoPLe7
 VPd17SHVZYKrtGOSvfV6yokcNJflI562/tCsGprWZTZQ/rGeb816YvInNprOdt5Zx2We
 WwrJKu2mjW7EkEu0EhtIrPAVkI+dVOu0CV7M1oPABgrMQI+bjszEtQ5w44whgMWLFlIN
 xdadkfu5Oiwh1rE1pvuqrdysBBNj56oOZolOkZlx1whvTB1l+QnE3HMzasiSLGGAeo4D
 Ma/bVXfZDRgqXEzeAbR+tiEJ6FNslo9xizACnf2tYnQ4odiq7/Soqqbl+JowlpZq4blk
 I5aw==
X-Gm-Message-State: AO0yUKXekEAtjol0AiFz20A1aVNCxBsDz//h5bUSwcxLkvPHkLfDIB1y
 SUnsmVOqGVN7bQIV0ml+YQdiUnaYLsyxhLgBK5U=
X-Google-Smtp-Source: AK7set+CSAxoGH4S3wbdlT/g3dDhx1vwft/R/emKIbg3Qag7M9J2qWU3Lp7j+Z3WOH/S6rF8iNN7pg==
X-Received: by 2002:a17:902:d4c8:b0:199:30a6:376c with SMTP id
 o8-20020a170902d4c800b0019930a6376cmr3190508plg.68.1676935609584; 
 Mon, 20 Feb 2023 15:26:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 12/21] target/arm: Handle Block and Page bits for security
 space
Date: Mon, 20 Feb 2023 13:26:17 -1000
Message-Id: <20230220232626.429947-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

With Realm security state, bit 55 of a block or page descriptor during
the stage2 walk becomes the NS bit; during the stage1 walk the bit 5
NS bit is RES0.  With Root security state, bit 11 of the block or page
descriptor during the stage1 walk becomes the NSE bit.

Rather than collecting an NS bit and applying it later, compute the
output pa space from the input pa space and unconditionally assign.
This means that we no longer need to adjust the output space earlier
for the NSTable bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 91 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d612e5f38a..a9a9a8a403 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -956,12 +956,14 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
  * @mmu_idx: MMU index indicating required translation regime
  * @is_aa64: TRUE if AArch64
  * @ap:      The 2-bit simple AP (AP[2:1])
- * @ns:      NS (non-secure) bit
  * @xn:      XN (execute-never) bit
  * @pxn:     PXN (privileged execute-never) bit
+ * @in_pa:   The original input pa space
+ * @out_pa:  The output pa space, modified by NSTable, NS, and NSE
  */
 static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-                      int ap, int ns, int xn, int pxn)
+                      int ap, int xn, int pxn,
+                      ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
 {
     bool is_user = regime_is_user(env, mmu_idx);
     int prot_rw, user_rw;
@@ -982,7 +984,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         }
     }
 
-    if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
+    if (out_pa == ARMSS_NonSecure && in_pa == ARMSS_Secure &&
+        (env->cp15.scr_el3 & SCR_SIF)) {
         return prot_rw;
     }
 
@@ -1250,11 +1253,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     int32_t stride;
     int addrsize, inputsize, outputsize;
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    int ap, ns, xn, pxn;
+    int ap, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     uint64_t descriptor, new_descriptor;
+    ARMSecuritySpace out_space;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1437,8 +1441,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
         ptw->in_space = ARMSS_NonSecure;
-        result->f.attrs.secure = false;
-        result->f.attrs.space = ARMSS_NonSecure;
     }
 
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
@@ -1556,15 +1558,75 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     }
 
     ap = extract32(attrs, 6, 2);
+    out_space = ptw->in_space;
     if (regime_is_stage2(mmu_idx)) {
-        ns = mmu_idx == ARMMMUIdx_Stage2;
+        /*
+         * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
+         * The bit remains ignored for other security states.
+         */
+        if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
+            out_space = ARMSS_NonSecure;
+        }
         xn = extract64(attrs, 53, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
-        ns = extract32(attrs, 5, 1);
+        int nse, ns = extract32(attrs, 5, 1);
+        switch (out_space) {
+        case ARMSS_Root:
+            /*
+             * R_GVZML: Bit 11 becomes the NSE field in the EL3 regime.
+             * R_XTYPW: NSE and NS together select the output pa space.
+             */
+            nse = extract32(attrs, 11, 1);
+            out_space = (nse << 1) | ns;
+            if (out_space == ARMSS_Secure &&
+                !cpu_isar_feature(aa64_sel2, cpu)) {
+                out_space = ARMSS_NonSecure;
+            }
+            break;
+        case ARMSS_Secure:
+            if (ns) {
+                out_space = ARMSS_NonSecure;
+            }
+            break;
+        case ARMSS_Realm:
+            switch (mmu_idx) {
+            case ARMMMUIdx_Stage1_E0:
+            case ARMMMUIdx_Stage1_E1:
+            case ARMMMUIdx_Stage1_E1_PAN:
+                /* I_CZPRF: For Realm EL1&0 stage1, NS bit is RES0. */
+                break;
+            case ARMMMUIdx_E2:
+            case ARMMMUIdx_E20_0:
+            case ARMMMUIdx_E20_2:
+            case ARMMMUIdx_E20_2_PAN:
+                /*
+                 * R_LYKFZ, R_WGRZN: For Realm EL2 and EL2&1,
+                 * NS changes the output to non-secure space.
+                 */
+                if (ns) {
+                    out_space = ARMSS_NonSecure;
+                }
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            break;
+        case ARMSS_NonSecure:
+            /* R_QRMFF: For NonSecure state, the NS bit is RES0. */
+            break;
+        default:
+            g_assert_not_reached();
+        }
         xn = extract64(attrs, 54, 1);
         pxn = extract64(attrs, 53, 1);
-        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
+
+        /*
+         * Note that we modified ptw->in_space earlier for NSTable, but
+         * result->f.attrs retains a copy of the original security space.
+         */
+        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
+                                    result->f.attrs.space, out_space);
     }
 
     if (!(result->f.prot & (1 << access_type))) {
@@ -1591,15 +1653,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         }
     }
 
-    if (ns) {
-        /*
-         * The NS bit will (as required by the architecture) have no effect if
-         * the CPU doesn't support TZ or this is a non-secure translation
-         * regime, because the attribute will already be non-secure.
-         */
-        result->f.attrs.secure = false;
-        result->f.attrs.space = ARMSS_NonSecure;
-    }
+    result->f.attrs.space = out_space;
+    result->f.attrs.secure = arm_space_is_secure(out_space);
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-- 
2.34.1


