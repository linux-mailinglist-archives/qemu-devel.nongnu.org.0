Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7481F689B9A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4x-0006xE-23; Fri, 03 Feb 2023 09:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-0006hn-Lx
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:52 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4U-000560-FF
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:50 -0500
Received: by mail-wm1-x32d.google.com with SMTP id q8so3999939wmo.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dfm26fYv3JIUSRJGZZpIcFrn+v6yWG7PrqTs/YhXiNE=;
 b=LvG8CmYM0h4lkSolWC/d3q1fmqzy3awVjQ4MK12MxKzLt5O7fDSIns4HRLyMRiseev
 biXPop+IHblE0JPHsirvup8HIIJY+ZVgv5tgIs+zEnYysZhqQiufFjNxaHRmg2GNZu9c
 42wMIAKPArisO0X4H/2n6Z2SwuFf7QmN8bP17K2evaVmU9cEF6/e+xT74LgjyyZsyUx0
 MaGK+o+W3bi/qaPrYkmKYjLvuluBMxj79sTMJBdZvnlzZ1ai9FMABUQSZWGo2TdGw9jp
 IF4ZlwXoaw2cbJeo8Td1bhDA+STqigFYQJphg9Fp2c/bVKLfEEJutf8nCJjcGfM6KvCa
 F9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dfm26fYv3JIUSRJGZZpIcFrn+v6yWG7PrqTs/YhXiNE=;
 b=djdhPA7VwtuaeOqsmS9xJIP7QZpv8++utOA6GDLNcZHmsIVfhWzO8L8jaJd2afNhUh
 1vXiO8vcvm63esQy/d833CV5fugULYYh5IDiQnU7hQsVj0/2kBFXzAy+QVe5WNFdUAmm
 fPOyD5cei/rZQURyzHMR/EEaDmaHYToJqECiLh6+LUNh+5X6QAHr/HPsHKOj7Uz2eQ2x
 gRaHbaEFA2LyaSZHoAil/3g5oC84QFMcQMuHRn4rJvffbmvurnqjOMrh5H7+z8NJMbv3
 Wx1i+vUDEW4pw5aehS3p36SoYvd5lUSOGy1F73QzcS9C9lPsZT0qUQmxSxSVRoS4L1ag
 k9UQ==
X-Gm-Message-State: AO0yUKWvRTr/Wxh6l81JwISjSUqy1+16powG+rW2ZXbbgjrxCqOnAiGf
 gkg1OwV/j9TYMLPWieY66AdH5ua2G+k7pkrV
X-Google-Smtp-Source: AK7set+BDIUKdwlVcdkfRSzionBUhTwXkkjstzhMmLqdZic+crE4M2hfrhEN1n2JOjmD2O9FDnn4Bg==
X-Received: by 2002:a7b:ce94:0:b0:3dc:43a0:83bb with SMTP id
 q20-20020a7bce94000000b003dc43a083bbmr10177557wmj.3.1675434580920; 
 Fri, 03 Feb 2023 06:29:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] target/arm: Move do_coproc_insn() syndrome calculation
 earlier
Date: Fri,  3 Feb 2023 14:29:08 +0000
Message-Id: <20230203142927.834793-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Rearrange the code in do_coproc_insn() so that we calculate the
syndrome value for a potential trap early; we're about to add a
second check that wants this value earlier than where it is currently
determined.

(Specifically, a trap to EL2 because of HSTR_EL2 should take
priority over an UNDEF to EL1, even when the UNDEF is because
the register does not exist at all or because its ri->access
bits non-configurably fail the access. So the check we put in
for HSTR_EL2 trapping at EL1 (which needs the syndrome) is
going to have to be done before the check "is the ARMCPRegInfo
pointer NULL".)

This commit is just code motion; the change to HSTR_EL2
handling that will use the 'syndrome' variable is in a
subsequent commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-5-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-5-peter.maydell@linaro.org
---
 target/arm/translate.c | 83 +++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 365e02fb0b8..9252a464a12 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4718,6 +4718,47 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
     TCGv_ptr tcg_ri = NULL;
     bool need_exit_tb;
+    uint32_t syndrome;
+
+    /*
+     * Note that since we are an implementation which takes an
+     * exception on a trapped conditional instruction only if the
+     * instruction passes its condition code check, we can take
+     * advantage of the clause in the ARM ARM that allows us to set
+     * the COND field in the instruction to 0xE in all cases.
+     * We could fish the actual condition out of the insn (ARM)
+     * or the condexec bits (Thumb) but it isn't necessary.
+     */
+    switch (cpnum) {
+    case 14:
+        if (is64) {
+            syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
+                                         isread, false);
+        } else {
+            syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
+                                        rt, isread, false);
+        }
+        break;
+    case 15:
+        if (is64) {
+            syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
+                                         isread, false);
+        } else {
+            syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
+                                        rt, isread, false);
+        }
+        break;
+    default:
+        /*
+         * ARMv8 defines that only coprocessors 14 and 15 exist,
+         * so this can only happen if this is an ARMv7 or earlier CPU,
+         * in which case the syndrome information won't actually be
+         * guest visible.
+         */
+        assert(!arm_dc_feature(s, ARM_FEATURE_V8));
+        syndrome = syn_uncategorized();
+        break;
+    }
 
     if (!ri) {
         /*
@@ -4755,48 +4796,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
          * Note that on XScale all cp0..c13 registers do an access check
          * call in order to handle c15_cpar.
          */
-        uint32_t syndrome;
-
-        /*
-         * Note that since we are an implementation which takes an
-         * exception on a trapped conditional instruction only if the
-         * instruction passes its condition code check, we can take
-         * advantage of the clause in the ARM ARM that allows us to set
-         * the COND field in the instruction to 0xE in all cases.
-         * We could fish the actual condition out of the insn (ARM)
-         * or the condexec bits (Thumb) but it isn't necessary.
-         */
-        switch (cpnum) {
-        case 14:
-            if (is64) {
-                syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                             isread, false);
-            } else {
-                syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                            rt, isread, false);
-            }
-            break;
-        case 15:
-            if (is64) {
-                syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                             isread, false);
-            } else {
-                syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                            rt, isread, false);
-            }
-            break;
-        default:
-            /*
-             * ARMv8 defines that only coprocessors 14 and 15 exist,
-             * so this can only happen if this is an ARMv7 or earlier CPU,
-             * in which case the syndrome information won't actually be
-             * guest visible.
-             */
-            assert(!arm_dc_feature(s, ARM_FEATURE_V8));
-            syndrome = syn_uncategorized();
-            break;
-        }
-
         gen_set_condexec(s);
         gen_update_pc(s, 0);
         tcg_ri = tcg_temp_new_ptr();
-- 
2.34.1


