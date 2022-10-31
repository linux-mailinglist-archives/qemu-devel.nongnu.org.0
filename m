Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52698612FD5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNXP-0001hI-EK; Mon, 31 Oct 2022 01:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXM-0001gE-Fp
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:40 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXK-00042A-Ty
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:40 -0400
Received: by mail-oi1-x22f.google.com with SMTP id l5so11883963oif.7
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4EPNlPLvvaNZ49dHiEVCBrThmnHD1d1VYoHkcOJOcWA=;
 b=lP1bUtldjz9AmUUgqlpQQ0W7J+0otT/lOdE6kXkCSj1rYI6eyb/kmT1KCYlDVDBUQy
 B/Z+Q6+d/8R38bPfOD9s8yGf6kgPWARk7NZmL1PGb0th5z4DOpA2gToSD94M0ztutX5l
 jvD021wWWLoClh5ni+X00Bj6pv9lbFDYG5bOY8x45bNgdEp836LdfVL1BzpZjhVHsqqL
 Qy65JGL2f0COnqWVu3xSOc94GtUMKnz54JvqKZPyV3OJlES2RqDUrsi4hYY0Js3TL5qa
 BDsmSSBaZIoHoIIFHV0wiibNmWjueE0QKyFjhZ8myr9+dKIQFlXizg2owOFNUOlfS3Ge
 T39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EPNlPLvvaNZ49dHiEVCBrThmnHD1d1VYoHkcOJOcWA=;
 b=hyja+TyxMt2wjh4mawW9tJjuTz2Xm1Jgl4/cp3J5znlVUHG1nxqbd5PJ4ld+dIVtmB
 WOtpwPLfrfjgB4rnPi7kDEHSUkRrALL1cva3dNRqZeMiSuOxjYfOd20pT0giuFr1/o13
 vYOJgeGpIMtERcElFdGUh1CmpWtMd8tScTLgJYIIiE0vx9zyJDyxGAwMjf21S7nzG8D2
 Fe+SWYh/M9+RUHe16emugooeTAeh//wMC7FqBouaQ11RL/TXSxFWFnwcC3dmSxX+x9hU
 CCB2bwWwL4IuvdddqO+aOb43hdivDDVU6KJQOAqjLixMz2aF52CueS5BLYDtlq34L13J
 2RyA==
X-Gm-Message-State: ACrzQf2oPqyPjFUlkJfhOPvVW3rfHWnNEtaC7yJ5QW1bpu11mEEmFUwn
 f9+6SCL8mXCwDfSb3yynK3DExoMhjay3gg==
X-Google-Smtp-Source: AMsMyM4OLncX4jkh4rEtFbjuqKjJO6wgStkEB6wxeMmJ6j1OCIrkaO7ksJxU3rMXVmexueuPjR1+EA==
X-Received: by 2002:a05:6808:23c9:b0:359:b71b:459a with SMTP id
 bq9-20020a05680823c900b00359b71b459amr12135182oib.10.1667194837655; 
 Sun, 30 Oct 2022 22:40:37 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] target/openrisc: Use cpu_unwind_state_data for mfspr
Date: Mon, 31 Oct 2022 16:39:45 +1100
Message-Id: <20221031053948.3408-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since we do not plan to exit, use cpu_unwind_state_data
and extract exactly the data requested.

This is a bug fix, in that we no longer clobber dflag.

Consider:

        l.j       L2         // branch
        l.mfspr   r1, ppc    // delay

L1:     boom
L2:     l.lwa     r3, (r4)

Here, dflag would be set by cpu_restore_state (because that is the current
state of the cpu), but but not cleared by tb_stop on exiting the TB
(because DisasContext has recorded the current value as zero).

The next TB begins at L2 with dflag incorrectly set.  If the load has a
tlb miss, then the exception will be delivered as per a delay slot:
with DSX set in the status register and PC decremented (delay slots
restart by re-executing the branch). This will cause the return from
interrupt to go to L1, and boom!

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/sys_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index a3508e421d..dde2fa1623 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -199,6 +199,7 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
                            target_ulong spr)
 {
 #ifndef CONFIG_USER_ONLY
+    uint64_t data[TARGET_INSN_START_WORDS];
     MachineState *ms = MACHINE(qdev_get_machine());
     OpenRISCCPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
@@ -232,14 +233,20 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         return env->evbar;
 
     case TO_SPR(0, 16): /* NPC (equals PC) */
-        cpu_restore_state(cs, GETPC(), false);
+        if (cpu_unwind_state_data(cs, GETPC(), data)) {
+            return data[0];
+        }
         return env->pc;
 
     case TO_SPR(0, 17): /* SR */
         return cpu_get_sr(env);
 
     case TO_SPR(0, 18): /* PPC */
-        cpu_restore_state(cs, GETPC(), false);
+        if (cpu_unwind_state_data(cs, GETPC(), data)) {
+            if (data[1] & 2) {
+                return data[0] - 4;
+            }
+        }
         return env->ppc;
 
     case TO_SPR(0, 32): /* EPCR */
-- 
2.34.1


