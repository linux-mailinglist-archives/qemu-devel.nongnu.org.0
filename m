Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB914D42F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 00:58:11 +0100 (CET)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwxDn-0005JB-0V
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 18:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iwxC4-0003ba-Jy
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:56:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iwxC3-0006uR-Io
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:56:24 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41213)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iwxC3-0006oN-CS
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 18:56:23 -0500
Received: by mail-pl1-x644.google.com with SMTP id t14so588633plr.8
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 15:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PmDfkex8faZiFVa2YT06LK4J0KkoEf2XMftdZIEA0Nc=;
 b=v8g1T32AifPZB7jyQKDicRKIARuPDmWsReSnjbwn3V6oDy4R61KCbmrzWZwPdz54wd
 02aXfQp7JcryVGq6hm4aL4jMtEW+dpVCgcDq8o4nxx/9Mz1YGrphltVfOt3esi3XyHNO
 5XL6YJpwpUqDRlG09Nbua8XKiZAOnMpnAvd08ZVO1Oks7SlQ61KcLVkXIh5HBiVjN601
 gy6lL/Uu2WSoVywl4Yo1/FqOu8e/eRHU9hcVKQ/NpLBSYqPH7mrYbc74wFGmQH0IHLgI
 9nVixQNI5ONr8tD9ci5cNUTiLRnlOKZoHOVMMdoHsmCAfoEr64frGrBsOFbOvD3OO11A
 Yo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PmDfkex8faZiFVa2YT06LK4J0KkoEf2XMftdZIEA0Nc=;
 b=BuSf50GUt/0Tf/xB+nURkyxtLdB7qOAAUKvHkRCzDyLML/rZFBueg+LnJJx7W/E2W4
 bJOmYFFa8ELMvGKdVIXiR6oF3U3E30PTs/m1tKyNLtuFxAiRJuFPlXIMnB4HgVuXbcOn
 Yf4i4SDXTubkRqmuTWXV2YKZ//9KLZDjy4ORgBQZqCp7ga0Q51JRK8mPVeCx53aFC5CZ
 9bPyp7Q41XRofVMl8R0LYGxuIBtGwns7NN+tgnWm+UNFUQ8SJPgpxTZc+l2Z4XHTJsNc
 PFrtwsCJZZ9dS7v6oQSbRlDPP1c9mmVjONI6Shx3L/RsMXaPm/I6qMrgjrWlw78eH/m3
 G6yA==
X-Gm-Message-State: APjAAAUBZ6G9xn70kPk9By6BJiHXPRhHBzy03DByDne3obpXX2+8aUhJ
 QxU+nK4im7Ic+ohSa4PJLisLtBuIsMY=
X-Google-Smtp-Source: APXvYqy3E2wxG8Vi0jva06AC3RgscRlAPrriJpIX05H/5qqx4FEjnTxbq4qUbjeRFdWMVEG0jvudCg==
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr1879338plk.141.1580342181172; 
 Wed, 29 Jan 2020 15:56:21 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm3953626pfg.145.2020.01.29.15.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 15:56:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/41] target/arm: Add TTBR1_EL2
Date: Wed, 29 Jan 2020 15:55:37 -0800
Message-Id: <20200129235614.29829-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129235614.29829-1-richard.henderson@linaro.org>
References: <20200129235614.29829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, add writefn to TTBR0_EL2 and TCR_EL2.
A later patch will update any ASID therein.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Do not update TCR_EL2 yet; delay that til we handle ASIDs.
---
 target/arm/helper.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b3ba81dc0a..8b8d2213cf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3533,6 +3533,13 @@ static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /* TODO: There are ASID fields in here with HCR_EL2.E2H */
+    raw_write(env, ri, value);
+}
+
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -4979,7 +4986,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[2]) },
     { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .resetvalue = 0,
+      .access = PL2_RW, .resetvalue = 0, .writefn = vmsa_tcr_ttbr_el2_write,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
     { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
       .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
@@ -7095,6 +7102,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
               .access = PL2_RW,
               .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
+            { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
+              .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
+              .fieldoffset = offsetof(CPUARMState, cp15.ttbr1_el[2]) },
             REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, vhe_reginfo);
-- 
2.20.1


