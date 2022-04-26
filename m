Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112775107BE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:57:21 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQNE-0005Gh-4o
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmf-0002fx-Pv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmc-0004Qk-UZ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:33 -0400
Received: by mail-pg1-x532.google.com with SMTP id k29so16704107pgm.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zXcdhRLjKPOUAo+r01dJ9lV49KSzWQuat06zJqj++Ck=;
 b=ln+tdd4GqCS8BpU1XtGs9Yvp78QwP2R2F7hRhqXZBi+BFBPJdlOgB1Qeezo34z1Afy
 lKtUzt/KwtE+hrMFaOBeIqMCHAcQ5yRHNoAaZ3nc9nucvwKqP6iu+dmVAOzxqofZgY6c
 SQr0BcZfpcI4fD0I96NKzZ3XHW5GXbaCmvfDT0ti27nAYZG34ubmqPLBC7pUZnHMA8ov
 iIoZLlPtzIKfmoa2mjOT6R+9f9Yl5uFUm+D9+W2a4d4Jh0nty8A1/axKjazZX2fUNZ1/
 1bdwcCL9UFQOkOZxIgmcf+hX1sSU78hK90VGlWvUGFlZgBnjowZSCjvXZ8uYeKUTs3Am
 cmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXcdhRLjKPOUAo+r01dJ9lV49KSzWQuat06zJqj++Ck=;
 b=sOw61S/YWWegKyRxqEmPboafRgH/Ci4W38wRc8v0ExCrOfste6ndZbexwZByvLBtP2
 w7EqXYtnn+AVyLOEyHJ4+bEeQZ7H9mZNFzXZi2F5BBcw2bS1canHIM2nSuWR4yoU6M30
 nAaTNVqAg7AOa67xrdoeZ1nYSHaAUuIQ1Cf7h7GSsMvI5C2yw8GywVYcafGixbhBgWsm
 2f/8mJX0BVOEtbvhO3xvYEcLFtV0w2iwS+dT+1+Qe95qopw7EuikZ7UYi3eP33ogBNRV
 9ophhu5NMP1wGVKMKtsjdeymXqjp3MENPZyuoISX1mYKWqzDuN3uDrWCM0heENQI3DzT
 hIww==
X-Gm-Message-State: AOAM5330P0DlhZS2TG/xkufa2sfN7GyNM1hj8zG2W4N2eFcGMtpGoD9O
 A8vdXMRLNjl6PCGqJ9CVBbxq9kGJvaPI5w==
X-Google-Smtp-Source: ABdhPJwu3hB4HcKmiwDAFZQ3mDWqQd8OR7SN+DDrQVMi/3cila4k1Y4jn+i3ga+acWBuAaOdasNKDg==
X-Received: by 2002:a05:6a00:a94:b0:4fd:c14b:21cb with SMTP id
 b20-20020a056a000a9400b004fdc14b21cbmr25724690pfl.53.1650997169270; 
 Tue, 26 Apr 2022 11:19:29 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/68] target/nios2: Clean up nios2_cpu_dump_state
Date: Tue, 26 Apr 2022 11:18:22 -0700
Message-Id: <20220426181907.103691-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not print control registers for user-only mode.
Rename reserved control registers to "resN", where
N is the control register index.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-24-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 308da8057c..fc49a7101f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -783,16 +783,18 @@ static const char * const gr_regnames[NUM_GP_REGS] = {
     "fp",         "ea",         "ba",         "ra",
 };
 
+#ifndef CONFIG_USER_ONLY
 static const char * const cr_regnames[NUM_CR_REGS] = {
     "status",     "estatus",    "bstatus",    "ienable",
-    "ipending",   "cpuid",      "reserved0",  "exception",
+    "ipending",   "cpuid",      "res6",       "exception",
     "pteaddr",    "tlbacc",     "tlbmisc",    "reserved1",
     "badaddr",    "config",     "mpubase",    "mpuacc",
-    "reserved2",  "reserved3",  "reserved4",  "reserved5",
-    "reserved6",  "reserved7",  "reserved8",  "reserved9",
-    "reserved10", "reserved11", "reserved12", "reserved13",
-    "reserved14", "reserved15", "reserved16", "reserved17",
+    "res16",      "res17",      "res18",      "res19",
+    "res20",      "res21",      "res22",      "res23",
+    "res24",      "res25",      "res26",      "res27",
+    "res28",      "res29",      "res30",      "res31",
 };
+#endif
 
 #include "exec/gen-icount.h"
 
@@ -905,10 +907,6 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUNios2State *env = &cpu->env;
     int i;
 
-    if (!env) {
-        return;
-    }
-
     qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
     for (i = 0; i < NUM_GP_REGS; i++) {
@@ -917,13 +915,14 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             qemu_fprintf(f, "\n");
         }
     }
+
+#if !defined(CONFIG_USER_ONLY)
     for (i = 0; i < NUM_CR_REGS; i++) {
         qemu_fprintf(f, "%9s=%8.8x ", cr_regnames[i], env->ctrl[i]);
         if ((i + 1) % 4 == 0) {
             qemu_fprintf(f, "\n");
         }
     }
-#if !defined(CONFIG_USER_ONLY)
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
                  env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
                  (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
-- 
2.34.1


