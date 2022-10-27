Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8360F47B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:09:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzjd-0007pL-Tr; Thu, 27 Oct 2022 06:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjQ-00078d-DT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:28 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjO-0004GB-4f
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:23 -0400
Received: by mail-pg1-x530.google.com with SMTP id h185so827529pgc.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oz6SbhxWMBqT3eH0LGJA5+0yBaJCELCj9GF6rT/F9o0=;
 b=Z6IpPF6YEC3aoReax7k9p+yt6O0jopCUepnfq6j0IY2m9QhiFdxG25MilVlY7fyO1L
 2pG7HIxRblOvfXPWX7aGJspS1g1dGagzFsHv64x5CVhz0BfvhJh9tY6i3bvpeEHwtPx9
 RmKD5PnnHF9Efs8k4R8krWCXDZfn23W72JUZ36ufTIWi2ioJQgF6HEnGFt3sd59e5EqQ
 0RNFPtVI10WE71JEYNoLiZdBN+BbGesPzoKlrjUeDkB3wDmYtLBjIMtRodGpECe9/X4U
 oixXO+JLFaJ7SlhrRkJZA6sDn3+GkCzg5F9hkDCoY18tyHQyFKsH728T4zD+EVyKpK54
 Jp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oz6SbhxWMBqT3eH0LGJA5+0yBaJCELCj9GF6rT/F9o0=;
 b=vMRJPVfgV7BhRie1jTgLfIlHV9nFMLVRp9JNkQrGDjukwdM50g0XldgptBcPiHTuPR
 jyhu1EZPegM54b87yVXmm35cYdaj4IshombJc+eD6QP97LpxN2Sy/rfVqUhiUNb4/+cQ
 CIO0Qqi6Qdk/fE2F0i8CzT9hIU+g2mNRBq/EBvrVwCWJ2BCYBvdIlbUo/q7WMW2BpcU2
 rXp5IxhtqwZ8p2G5luW933n/N9n8GPbCO02QB+hIYeO87a8mQqq0CKBdWz+yKkk+iVwK
 F4v0ENe8j99msMRrzXQkEROnG+2WnA3pPlh05LzIsr4bof/l5292k2mMOmBeKNYFea7G
 TmsA==
X-Gm-Message-State: ACrzQf1H74I0i8IK07DKwvJqvv1vWFvKk4l06GmiYV6c3mfwkAZVv3qz
 8f5xWuG0aFIKOJw1bGFsrLomQristhEx5kDX
X-Google-Smtp-Source: AMsMyM57l56RZ16vJayfbFJ3SBO/32a1MCsASmXACW/SmeMTKEXqjHbZypxbY5cDlkGCwwj+5fF2Xg==
X-Received: by 2002:a63:e211:0:b0:43b:f03e:3cc5 with SMTP id
 q17-20020a63e211000000b0043bf03e3cc5mr41866170pgh.256.1666864999682; 
 Thu, 27 Oct 2022 03:03:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a17090a2bcd00b0020a825fc912sm2354631pje.45.2022.10.27.03.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:03:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cfontana@suse.de
Subject: [PATCH v2 4/6] target/openrisc: Use cpu_unwind_state_data for mfspr
Date: Thu, 27 Oct 2022 21:02:52 +1100
Message-Id: <20221027100254.215253-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027100254.215253-1-richard.henderson@linaro.org>
References: <20221027100254.215253-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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


