Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668D3EDCCD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:06:04 +0200 (CEST)
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgzr-0006FA-7b
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx6-0002dd-Ni
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:03:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx3-0004bw-TJ
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:03:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q11so24811654wrr.9
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Cu4H8n9Z1bc76Lx0NocvUz9gleAslEdWynQ2KHVsWo=;
 b=JuJWEkKamTZxqZjmhAUVX2NKvw3HcOB/kG2ZCrkRpzrh959b95acSMH5yx6AXEV1Dx
 d1pRdLNLkRmdatGBD+R6tpHhVsfICQgzELoKKYCqilVHFjV4oDku8QiNZC/sAt9hEq9d
 0arj0tsroNk/xE50+ltZZNMqPRtK61yczefRjHASGdI8n4+escw+dob8LPVF3x+GFv52
 ym/nG+WnpesuH32v4gU9MIPxf+D0uOQLTHDEszGKtnuEu5bxnaqcsSrlMScKpge4cBq8
 nP/jKaQ/yRmOChvYrjItrcZ9BKcDceS1qJeRQ/t5aCwct9CUiGLLWPmimWDxPLIIpbPx
 KMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Cu4H8n9Z1bc76Lx0NocvUz9gleAslEdWynQ2KHVsWo=;
 b=XiisBEU3G8uDfG31ebqdGppGWWDR7nE34WGeccvSE939rjJTXtvxTQWM9FtGQIpYNf
 XOFNS+JvjPbJwIUn7yGnnD32BqOI7KagetAgmuoPkHa24fNzlrgDOnsz6iYxhPL8UOyg
 pOV8L3wKxgKa2guaXaE5nv/03194z+uK/qWonbKQlUIdM/PiD0cLJwv95U72WxIpm1QW
 lIXEfBny/UQndzvwvJsF03lZ25MgShNy33n24AbIb7RTFJbRGCtCeoCn26aqTVoRrdYO
 qbCwBE2O3YfU6ClwwwNZ+8UQiYf+L86ByCn7tdHpBiSpn9leKaAw3d4gPnNdKYgD76qk
 /1Cw==
X-Gm-Message-State: AOAM532l5IX5uE7u+23adQDDaxFhuXdcUsAB5KixkY41gCe69f+LV5bj
 +/1Wn81XsMzPxj5fjd179TRY1+UTjiXS9g==
X-Google-Smtp-Source: ABdhPJwAVEP5+yGqsSGpd1S/i5kd1VKtSFTKPb/uu/mscdzyDYbABgCnxNOxox//XUMP+/FQBPq4TA==
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr7646400wrw.150.1629136988403; 
 Mon, 16 Aug 2021 11:03:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u16sm240053wmc.41.2021.08.16.11.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:03:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Implement HSTR.TTEE
Date: Mon, 16 Aug 2021 19:03:04 +0100
Message-Id: <20210816180305.20137-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816180305.20137-1-peter.maydell@linaro.org>
References: <20210816180305.20137-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

In v7, the HSTR register has a TTEE bit which allows EL0/EL1 accesses
to the Thumb2EE TEECR and TEEHBR registers to be trapped to the
hypervisor. Implement these traps.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d50..cf3c90f768a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1536,6 +1536,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_ENSCXT            (1U << 25)
 #define SCR_ATA               (1U << 26)
 
+#define HSTR_TTEE (1 << 16)
+
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 155d8bf2399..262e787f690 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2446,20 +2446,34 @@ static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->teecr = value;
 }
 
+static CPAccessResult teecr_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    /*
+     * HSTR.TTEE only exists in v7A, not v8A, but v8A doesn't have T2EE
+     * at all, so we don't need to check whether we're v8A.
+     */
+    if (arm_current_el(env) < 2 && !arm_is_secure_below_el3(env) &&
+        (env->cp15.hstr_el2 & HSTR_TTEE)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
     if (arm_current_el(env) == 0 && (env->teecr & 1)) {
         return CP_ACCESS_TRAP;
     }
-    return CP_ACCESS_OK;
+    return teecr_access(env, ri, isread);
 }
 
 static const ARMCPRegInfo t2ee_cp_reginfo[] = {
     { .name = "TEECR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, teecr),
       .resetvalue = 0,
-      .writefn = teecr_write },
+      .writefn = teecr_write, .accessfn = teecr_access },
     { .name = "TEEHBR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, teehbr),
       .accessfn = teehbr_access, .resetvalue = 0 },
-- 
2.20.1


