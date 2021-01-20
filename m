Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC22FC89B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 04:18:05 +0100 (CET)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l240R-0003u6-UH
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 22:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l23zT-0003TS-TP
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:17:03 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l23zS-00066m-1b
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:17:03 -0500
Received: by mail-pl1-x62c.google.com with SMTP id e9so7573847plh.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 19:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUpn7Ox/0rFlRiCofd2dvQX1AqqmItc649QzQuz+ffI=;
 b=kj1YoInfXT0CLzKEN2Hi9a1TWHJcLcwffqZx//U653x+OO7IHOPFtf37v0mjrpt2RK
 +m47lG+NizubqoxP28SOUZa9a/hdAUzpEbioKJ2t1pdcJPj7b/45lE+4tQlKtfOSQsZ4
 g/xF5B95pq+TVjayirb36GrhGSYg+kl/tSzakk6ALjubzwwO1LRCkrJbKdB2INjUpZeb
 gsOs/Y/uuW8o7TIDsVLeGAC9t89AHqqq7D0iWlvvHY8Dpgxxf1Jrji5nJcoWmxmoEouH
 siGshHGCCqb22GkjMDcrUxlg6S9I/MauAQL7bXR5MloR5Bpg33tQcalbTncgXMJqayuA
 sYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUpn7Ox/0rFlRiCofd2dvQX1AqqmItc649QzQuz+ffI=;
 b=nyA8ekGWeOtblJ5rQ76D070ylx2wMpkSfdTSfQAK8iBDK9CWVW5ZBziIc8TIX9UhD2
 98MhYZWv5s8lxHvpZcXKPLEWI4q3AE5Xv3STks0W44rToV1RWSL7wd6JINpPguC2h3al
 tTP6F2KjxM/w8MYyGPnzmK9hhm1KizT2/GG/0ScvjQbUPu1QoTyII6QZW2qJfSjZPJ+8
 iliESyqCeK8BNi8+NH+O6Z2rAUnYklsMpR0lOoUVLCm0bgEzsn9itavX6DnZ6p93rcJH
 og/7xH7MtXkBWBN/uu8oLEy1QcN8e9ry8PQX3MMTEO6ZiWEpLl5HckDR0bD89g/2f073
 xcpg==
X-Gm-Message-State: AOAM530AxOh5a6Xv67LnwmXQ2kChnZf+Pq+TW455QD8tjNaZOt5qgA3B
 zoccxMN7wAoadYNuGV/hiEwYdroikYrFPw==
X-Google-Smtp-Source: ABdhPJxQU70kLzMsX9V31bMAYbTVURho/a79iCCuD4+U8Kxeic3ILU0igG6ecUUS7wKMpTQuuRZDbA==
X-Received: by 2002:a17:90a:f2cf:: with SMTP id
 gt15mr3095177pjb.166.1611112620155; 
 Tue, 19 Jan 2021 19:17:00 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id f24sm347445pjj.5.2021.01.19.19.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 19:16:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Conditionalize DBGDIDR
Date: Tue, 19 Jan 2021 17:16:56 -1000
Message-Id: <20210120031656.737646-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only define the register if it exists for the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

I've pulled this out of a largely defunct 2019 branch.  This will
be required for the cortex-a76, which only implements aa32 at el0.

This did get some review, back in the day,
https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg05171.html

but it has changed enough that I didn't include the proffered r-b.


r~
---
 target/arm/helper.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbd..10102aab3c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6567,11 +6567,21 @@ static void define_debug_regs(ARMCPU *cpu)
      */
     int i;
     int wrps, brps, ctx_cmps;
-    ARMCPRegInfo dbgdidr = {
-        .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
-        .access = PL0_R, .accessfn = access_tda,
-        .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdidr,
-    };
+
+    /*
+     * The Arm ARM says DBGDIDR is optional and deprecated if EL1 cannot
+     * use AArch32.  Given that bit 15 is RES1, if the value is 0 then
+     * the register must not exist for this cpu.
+     */
+    if (cpu->isar.dbgdidr != 0) {
+        ARMCPRegInfo dbgdidr = {
+            .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0,
+            .opc1 = 0, .opc2 = 0,
+            .access = PL0_R, .accessfn = access_tda,
+            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdidr,
+        };
+        define_one_arm_cp_reg(cpu, &dbgdidr);
+    }
 
     /* Note that all these register fields hold "number of Xs minus 1". */
     brps = arm_num_brps(cpu);
@@ -6580,7 +6590,6 @@ static void define_debug_regs(ARMCPU *cpu)
 
     assert(ctx_cmps <= brps);
 
-    define_one_arm_cp_reg(cpu, &dbgdidr);
     define_arm_cp_regs(cpu, debug_cp_reginfo);
 
     if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
-- 
2.25.1


