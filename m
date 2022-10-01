Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D178D5F1DD2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:44:58 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefbl-0006AN-UB
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHe-0006mq-Ba
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:10 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHb-0006DP-TS
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:09 -0400
Received: by mail-qt1-x831.google.com with SMTP id cj27so4336958qtb.7
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nVf0XoPBuFuQPXtT3jzdB8OzBoWMzBFYm3DKP93Thek=;
 b=Nm8jHM29wOTokPOMRAZcF4uyA0asZGULi+kSEv5C5K6cwB6ccKk4yZqLI6yQZ54TiF
 lHYKjycZQbUYAaXO4ouVRgYiNJFWUalmkok3fMpvMunrVI9lu+9Sy92dfWVkpxKs8NB3
 koPa0dDJ1QjG2fyz4SpkXdX2lTZ2mp7O6h4q11XzKhDblKYlLXvD8F54y/idB4kU1Dyb
 Knaq5Rr8acvj4w6300Fax05kA6/VuQTkkb2KRSBLu0m9BxtsCeUcY38hhNc4ajoTRtGA
 ROh7b3ov8KKKjPRVginE0SIE3tG+OZ1BxK5CrURvh3w0w0apZ2+sRVJFCjdyRhryq2KW
 prnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nVf0XoPBuFuQPXtT3jzdB8OzBoWMzBFYm3DKP93Thek=;
 b=UDA66ya/WN78ae5Rn6LuVmbVKHpc+rzH6+ec/A/cMHBPIL6NY8P+PMQET/lhG9DcMw
 qUL/LSo3T9ak0Mx0U80cbsnLbx0XKuH+R3OFN4tFC7pe+UZhFioe+UywqsvkU+NO0Z1p
 hz7PPeBAJHhhQmFH78whXqp/fMudjziAbDxiYKpMvUB7cwtCr6U6aAMfxdArNcpG8CRz
 3YS6CeOC60GoV5M0uo34IoL1epCAFRXGWAaNjJtB7zqAGbGtl6Sj3819b3Tdospud3Yl
 G+uW9LeqNn7K6rCmHkuiNhpIVODEkSnS9eSrs/ixlaViakdEwUfKTGuCTMHWjGSPkuk9
 brdw==
X-Gm-Message-State: ACrzQf3wjUHzbqab5vYlt4EVpJy/q4yuH1r0MxoPsIfZDUGxS+/A9b6I
 OC/tZ+0irKFNze0gdE50U6GG+SLrO2XrWQ==
X-Google-Smtp-Source: AMsMyM6QGSI9G/mQkt1LpRpuyOcBIL6yqIDBMzcvgiJrwqqDLZPhkMTr5HY56ZxBevacU/325XsZ4w==
X-Received: by 2002:ac8:4e48:0:b0:35d:5831:af31 with SMTP id
 e8-20020ac84e48000000b0035d5831af31mr11204447qtw.188.1664641447117; 
 Sat, 01 Oct 2022 09:24:07 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/42] target/arm: Split out get_phys_addr_disabled
Date: Sat,  1 Oct 2022 09:22:54 -0700
Message-Id: <20221001162318.153420-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 138 +++++++++++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 64 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7bf79779da..e494a9de67 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2272,6 +2272,78 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
     return ret;
 }
 
+/*
+ * MMU disabled.  S1 addresses within aa64 translation regimes are
+ * still checked for bounds -- see AArch64.S1DisabledOutput().
+ */
+static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
+                                   MMUAccessType access_type,
+                                   ARMMMUIdx mmu_idx, bool is_secure,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    uint64_t hcr;
+    uint8_t memattr;
+
+    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+        int r_el = regime_el(env, mmu_idx);
+        if (arm_el_is_aa64(env, r_el)) {
+            int pamax = arm_pamax(env_archcpu(env));
+            uint64_t tcr = env->cp15.tcr_el[r_el];
+            int addrtop, tbi;
+
+            tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+            if (access_type == MMU_INST_FETCH) {
+                tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+            }
+            tbi = (tbi >> extract64(address, 55, 1)) & 1;
+            addrtop = (tbi ? 55 : 63);
+
+            if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                fi->type = ARMFault_AddressSize;
+                fi->level = 0;
+                fi->stage2 = false;
+                return 1;
+            }
+
+            /*
+             * When TBI is disabled, we've just validated that all of the
+             * bits above PAMax are zero, so logically we only need to
+             * clear the top byte for TBI.  But it's clearer to follow
+             * the pseudocode set of addrdesc.paddress.
+             */
+            address = extract64(address, 0, 52);
+        }
+    }
+
+    result->phys = address;
+    result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    result->page_size = TARGET_PAGE_SIZE;
+
+    /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
+    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    result->cacheattrs.shareability = 0;
+    result->cacheattrs.is_s2_format = false;
+    if (hcr & HCR_DC) {
+        if (hcr & HCR_DCT) {
+            memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+        } else {
+            memattr = 0xff;  /* Normal, WB, RWA */
+        }
+    } else if (access_type == MMU_INST_FETCH) {
+        if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+            memattr = 0xee;  /* Normal, WT, RA, NT */
+        } else {
+            memattr = 0x44;  /* Normal, NC, No */
+        }
+        result->cacheattrs.shareability = 2; /* outer sharable */
+    } else {
+        memattr = 0x00;      /* Device, nGnRnE */
+    }
+    result->cacheattrs.attrs = memattr;
+    return 0;
+}
+
 bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool is_secure, GetPhysAddrResult *result,
@@ -2432,71 +2504,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
-        uint64_t hcr;
-        uint8_t memattr;
-
-        /*
-         * MMU disabled.  S1 addresses within aa64 translation regimes are
-         * still checked for bounds -- see AArch64.TranslateAddressS1Off.
-         */
-        if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-            int r_el = regime_el(env, mmu_idx);
-            if (arm_el_is_aa64(env, r_el)) {
-                int pamax = arm_pamax(env_archcpu(env));
-                uint64_t tcr = env->cp15.tcr_el[r_el];
-                int addrtop, tbi;
-
-                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-                if (access_type == MMU_INST_FETCH) {
-                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
-                }
-                tbi = (tbi >> extract64(address, 55, 1)) & 1;
-                addrtop = (tbi ? 55 : 63);
-
-                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
-                    fi->type = ARMFault_AddressSize;
-                    fi->level = 0;
-                    fi->stage2 = false;
-                    return 1;
-                }
-
-                /*
-                 * When TBI is disabled, we've just validated that all of the
-                 * bits above PAMax are zero, so logically we only need to
-                 * clear the top byte for TBI.  But it's clearer to follow
-                 * the pseudocode set of addrdesc.paddress.
-                 */
-                address = extract64(address, 0, 52);
-            }
-        }
-        result->phys = address;
-        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        result->page_size = TARGET_PAGE_SIZE;
-
-        /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-        result->cacheattrs.shareability = 0;
-        result->cacheattrs.is_s2_format = false;
-        if (hcr & HCR_DC) {
-            if (hcr & HCR_DCT) {
-                memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-            } else {
-                memattr = 0xff;  /* Normal, WB, RWA */
-            }
-        } else if (access_type == MMU_INST_FETCH) {
-            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-                memattr = 0xee;  /* Normal, WT, RA, NT */
-            } else {
-                memattr = 0x44;  /* Normal, NC, No */
-            }
-            result->cacheattrs.shareability = 2; /* outer sharable */
-        } else {
-            memattr = 0x00;      /* Device, nGnRnE */
-        }
-        result->cacheattrs.attrs = memattr;
-        return 0;
+        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
+                                      is_secure, result, fi);
     }
-
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
                                   is_secure, false, result, fi);
-- 
2.34.1


