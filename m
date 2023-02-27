Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF696A4F79
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:04:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVZ-0000m0-PI; Mon, 27 Feb 2023 18:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVD-0007w8-Od
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVA-00013x-37
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:50 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so6807799pla.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNo1abJPmKBNh/vFLOZMsXlNw7z0lrzbcY3tJpdOOx8=;
 b=mqmlJ+7fY3f9OsbmAn+FuYU7GfWjo36K2WF6bsKZaFN5hUZpCaX1+XH9imPNSVgC8I
 EC0EQkj+xHq+v58Fa98jjLQmwkBRRyuXUqiaQjkWkMVC1lCobz6lNUzHupVnBcBSvxoW
 RUp8RpuDxCIZ3Uz4f7HGhIfN9GiaaGz/A/MrJ7PuNMnEIJc8sinmDpRJFLZSNXxJW/pC
 TDywzz/ZKqOQkYNe+qrS/fx2dbfVStTy0iyAcSxiHVxZGIi4EIktzdIrxEcnY+C9TdDP
 gDUyzhhsGuTmthDrgWMF/9qWRQr3RTmwl5I5lnZ4/JWiNZ9WiltGr9qETwvDthTNUn+l
 UmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNo1abJPmKBNh/vFLOZMsXlNw7z0lrzbcY3tJpdOOx8=;
 b=sZOMDj65RO8xdYIZVHq+ks94vCAU/uEmHvfgF/1QkUwlcd1uLO5C7BotOQA8sj1Z+a
 01GcsTor7WNemIN5ixD33SFq3yHbGViS8oKLJFZMl0M9jevpGbrjwM4P2v/ZASDUrimn
 SaS/A7ShSkDO1GkG0iqSea3/tS9BeNbg5mAxqWWa71leX9SzDXs0NStX5hF6hkdVmWf7
 zhZJdbMXIk5Wa7qS9IFE/LH1fDFfTMiza2uR+JmYCJwQ1I2ulGxcxYHyyamzn69Lr32K
 DMOxQWwYy/8WUz9ypR5jg/hx3Kzg++FvXpYKZ9hJ3r1cfHH3Au8LJwdwuivAkSret7Iz
 jcfw==
X-Gm-Message-State: AO0yUKVthIMDS2mBJAZnpiOesmpjl2GbLKSQNvuoyycuTscMlK1rpI1C
 IdRr1Pj1krnyvyBQsh1jdZkNSYQEa/jJmi0a+aQ=
X-Google-Smtp-Source: AK7set8ZfQY9/w6yI2lD3gmEsvseWlD0ZeJK/bWe7C4qWM/E3Dn7I509f9MVTkGcd9onivUex5nGIA==
X-Received: by 2002:a17:90b:3881:b0:234:1645:5266 with SMTP id
 mu1-20020a17090b388100b0023416455266mr825456pjb.30.1677538906751; 
 Mon, 27 Feb 2023 15:01:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 13/21] target/arm: Handle no-execute for Realm and
 Root regimes
Date: Mon, 27 Feb 2023 13:01:14 -1000
Message-Id: <20230227230122.816702-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

While Root and Realm may read and write data from other spaces,
neither may execute from other pa spaces.

This happens for Stage1 EL3, EL2, EL2&0, and Stage2 EL1&0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 52 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 887c91ed13..2eae7a69cb 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -911,7 +911,7 @@ do_fault:
  * @xn:      XN (execute-never) bits
  * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
  */
-static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+static int get_S2prot_noexecute(int s2ap)
 {
     int prot = 0;
 
@@ -921,6 +921,12 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
     if (s2ap & 2) {
         prot |= PAGE_WRITE;
     }
+    return prot;
+}
+
+static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+{
+    int prot = get_S2prot_noexecute(s2ap);
 
     if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
         switch (xn) {
@@ -986,9 +992,39 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         }
     }
 
-    if (out_pa == ARMSS_NonSecure && in_pa == ARMSS_Secure &&
-        (env->cp15.scr_el3 & SCR_SIF)) {
-        return prot_rw;
+    if (in_pa != out_pa) {
+        switch (in_pa) {
+        case ARMSS_Root:
+            /*
+             * R_ZWRVD: permission fault for insn fetched from non-Root,
+             * I_WWBFB: SIF has no effect in EL3.
+             */
+            return prot_rw;
+        case ARMSS_Realm:
+            /*
+             * R_PKTDS: permission fault for insn fetched from non-Realm,
+             * for Realm EL2 or EL2&0.  The corresponding fault for EL1&0
+             * happens during any stage2 translation.
+             */
+            switch (mmu_idx) {
+            case ARMMMUIdx_E2:
+            case ARMMMUIdx_E20_0:
+            case ARMMMUIdx_E20_2:
+            case ARMMMUIdx_E20_2_PAN:
+                return prot_rw;
+            default:
+                break;
+            }
+            break;
+        case ARMSS_Secure:
+            if (env->cp15.scr_el3 & SCR_SIF) {
+                return prot_rw;
+            }
+            break;
+        default:
+            /* Input NonSecure must have output NonSecure. */
+            g_assert_not_reached();
+        }
     }
 
     /* TODO have_wxn should be replaced with
@@ -1565,12 +1601,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         /*
          * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
          * The bit remains ignored for other security states.
+         * R_YMCSL: Executing an insn fetched from non-Realm causes
+         * a stage2 permission fault.
          */
         if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
             out_space = ARMSS_NonSecure;
+            result->f.prot = get_S2prot_noexecute(ap);
+        } else {
+            xn = extract64(attrs, 53, 2);
+            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
         }
-        xn = extract64(attrs, 53, 2);
-        result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         int nse, ns = extract32(attrs, 5, 1);
         switch (out_space) {
-- 
2.34.1


