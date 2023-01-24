Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AAF678C8A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kU-0000VM-El; Mon, 23 Jan 2023 19:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kS-0000Ub-Qd
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:13 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kP-0001uO-Vl
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:12 -0500
Received: by mail-pg1-x52d.google.com with SMTP id d10so10220545pgm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLh9VmBezchTJLEcE+qN9RM6YfR7/kG+gCrSbag3gHU=;
 b=v6a4iZy2M5Z9E8Hw3HPddwCpsGwpnFIqA3DpNKxk7PkY+3Ne/qFYtfe/5SN9FxX5Pf
 nTPAuqHNQPAMxXAhF1PvdlF44YxN1jvusvPQqotuwmEywL6IlER0fcq96phkaMhbblhZ
 2+KjXi8YiruEnPBXBSBUxrvBWXVESnkqpR4JjcJYN8WyN+Yb4fnUanOKcoCosZLKcjUQ
 GDlKfjL20R+cZx9kv+p9DH2ttfpygNsLgli8NMwPcV+aB1UzA4K0OmagdOBFyXXHGWVm
 1F+Dc0pnEToViGkT06BS0/hKiCKmfeQf+YQs03xFja8R/N4EGLMRzStEXzzrPrAiosbA
 7a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HLh9VmBezchTJLEcE+qN9RM6YfR7/kG+gCrSbag3gHU=;
 b=0PWorcTky1gP4FU9fMP0o0Yci1hgueCXLfh6iWyDO4OTN0XQaove/5Eh+IojXJZBSV
 Mnz2VD5bSVVPtTnnUb1rybyrHmHfRn14X7o6xcA8t+1A12c3+Z15IglNSUaGgF+oXEd+
 7tliit0NgBris33lUzNUVwqsPdthOKRAurz/x5Xw9Cv1klCuAesQ+u4VYThKYumEnaNr
 D1nUyJZeINVIzPeIII9Olpmxgx9GUZ4HS2CjLOwxbsnuVJ1hRqYnYhWaDYXrNtlK2Zo1
 oK/iMPfbbPeKzj7rbBM6o3ruNVpNcCnGG7fCKE4m7BQ6P6FlmEsXV56ctAJe0KDzAFuh
 MpRw==
X-Gm-Message-State: AFqh2krUxtxNwaXz+AAD+8Xg3fKzckC6OqF/Y+H2rfXfMA98HPaZKjql
 FVNOTMS6jZl5jnyKbwRly/P/GPdkkupBk246
X-Google-Smtp-Source: AMrXdXvKJlXncOW+MhL+i2b2OM/JXSM37+n487B1Z0WsX1pAEpPzw9B+O6ikh150sDQyrM9x7XNJ8w==
X-Received: by 2002:a62:63c6:0:b0:576:ddd4:6a02 with SMTP id
 x189-20020a6263c6000000b00576ddd46a02mr27348655pfb.22.1674518469141; 
 Mon, 23 Jan 2023 16:01:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 13/22] target/arm: Handle Block and Page bits for security
 space
Date: Mon, 23 Jan 2023 14:00:18 -1000
Message-Id: <20230124000027.3565716-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 target/arm/ptw.c | 74 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ddafb1f329..849f5e89ca 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1250,11 +1250,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
@@ -1434,8 +1435,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
         ptw->in_space = ARMSS_NonSecure;
-        result->f.attrs.secure = false;
-        result->f.attrs.space = ARMSS_NonSecure;
     }
 
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
@@ -1552,12 +1551,66 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
+        int ns = extract32(attrs, 5, 1);
+        switch (out_space) {
+        case ARMSS_Root:
+            /*
+             * R_GVZML: Bit 11 becomes the NSE field in the EL3 regime.
+             * R_XTYPW: NSE and NS together select the output pa space.
+             */
+            int nse = extract32(attrs, 11, 1);
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
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
@@ -1587,15 +1640,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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


