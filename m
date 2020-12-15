Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD22DB6F4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:12:50 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJUv-0006Cf-MU
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHu-0004oh-Eh
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:22 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHs-0003w4-Lu
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:22 -0500
Received: by mail-ed1-x542.google.com with SMTP id u19so22845104edx.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r721GGoO1vJJZamWSQ/I62tzPtsotRE5k1CFdAPPmsI=;
 b=ksGYyZqUjnjTpQUlnJkwvhrtsTgCJRP3j5mC6OARLNZQF2ZrJ1V+UhVw8CojGWW3/3
 WO5B8qupZBGOhKvfYWG4DItmratQ+a/4+qPS1HLXosQWnWKkPc/nkPvCs4l+Jov8kDx/
 t8HSxfIh8b5woyVg5KHKoYSQqbU2txnbWYDuKV6NSfRJQ/j+skrIqCkyHWey8VVbqiOM
 XM9lf20J9/7RHu09BygD1EfvPu3uGCxO3lFf1xFqjRZUCHqPNhVX/Xkxqw6aBL8HTfbW
 UPhbdt4btRRu8RbClKYwtZcbkLrYPvFR9aadTWTEpUQ0BSzijYdMj1wdVlse/Vx66Doe
 SxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r721GGoO1vJJZamWSQ/I62tzPtsotRE5k1CFdAPPmsI=;
 b=ehonGOPq0HHB2MO38AG6so5VJyMjtoXidVEKd6Wa3RgJQLURIZvYBfa2o/eOu4Mset
 yK0iih8IkZQsG1oGpiHLSQaqwj67fBxg26RVswt9RqNM4cgmowRvN+WWLWmvX1qIwZiF
 oSgZP1PQhoG9hpMQscL1oTSl/YPxuJtpwma4N8oOnCXnqBFgow2CZiWEuHc9VHBIOZJ2
 kip+ExGAtUB2+0TIrYMcrA9SoILiDmuLvBe1QeoN9HOg3MFYr2yA8vFOX7U1Lx9HqxBM
 RpmnK/EOMmOeMlCmE3A8ghDaqyx4FaiYhnnlWhbo8pRg66gVDb2l4eeEynIN7XdlILRp
 cS5Q==
X-Gm-Message-State: AOAM5314l7zl/AdlKdEro+Wf1WHjLqCkWIiKhLHwgZclbsRnjy4cGQDT
 XJveX8LFqMibA/Rz3id3DHw=
X-Google-Smtp-Source: ABdhPJzDX2qNpMB5rixf8fmszl3M6Xc5Sf7KCB17rbtRfsvmzCRyz1COJgMcmCqIhuY2FxDNAuNTPQ==
X-Received: by 2002:aa7:d75a:: with SMTP id a26mr30675115eds.230.1608073159415; 
 Tue, 15 Dec 2020 14:59:19 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f11sm20317375edy.59.2020.12.15.14.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:59:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/24] target/mips: Move msa_reset() to mod-msa_helper.c
Date: Tue, 15 Dec 2020 23:57:47 +0100
Message-Id: <20201215225757.764263-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

translate_init.c.inc mostly contains CPU definitions.
msa_reset() doesn't belong here, move it with the MSA
helpers.

One comment style is updated to avoid checkpatch.pl warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h       |  2 ++
 target/mips/cpu.c            |  1 +
 target/mips/mod-msa_helper.c | 36 ++++++++++++++++++++++++++++++++++++
 target/mips/cpu-defs.c.inc   | 36 ------------------------------------
 4 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1ab2454e61d..76269cfc7bb 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -199,6 +199,8 @@ static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
 
 void mips_tcg_init(void);
 
+void msa_reset(CPUMIPSState *env);
+
 /* cp0_timer.c */
 uint32_t cpu_mips_get_count(CPUMIPSState *env);
 void cpu_mips_store_count(CPUMIPSState *env, uint32_t value);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 77ebd94c655..26e110b687e 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -33,6 +33,7 @@
 #include "hw/qdev-clock.h"
 #include "hw/semihosting/semihost.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "fpu_helper.h"
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/mips/mod-msa_helper.c b/target/mips/mod-msa_helper.c
index b89b4c44902..f0d728c03f0 100644
--- a/target/mips/mod-msa_helper.c
+++ b/target/mips/mod-msa_helper.c
@@ -8201,3 +8201,39 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     msa_move_v(pwd, pwx);
 }
+
+void msa_reset(CPUMIPSState *env)
+{
+    if (!ase_msa_available(env)) {
+        return;
+    }
+
+#ifdef CONFIG_USER_ONLY
+    /* MSA access enabled */
+    env->CP0_Config5 |= 1 << CP0C5_MSAEn;
+    env->CP0_Status |= (1 << CP0St_CU1) | (1 << CP0St_FR);
+#endif
+
+    /*
+     * MSA CSR:
+     * - non-signaling floating point exception mode off (NX bit is 0)
+     * - Cause, Enables, and Flags are all 0
+     * - round to nearest / ties to even (RM bits are 0)
+     */
+    env->active_tc.msacsr = 0;
+
+    restore_msa_fp_status(env);
+
+    /* tininess detected after rounding.*/
+    set_float_detect_tininess(float_tininess_after_rounding,
+                              &env->active_tc.msa_fp_status);
+
+    /* clear float_status exception flags */
+    set_float_exception_flags(0, &env->active_tc.msa_fp_status);
+
+    /* clear float_status nan mode */
+    set_default_nan_mode(0, &env->active_tc.msa_fp_status);
+
+    /* set proper signanling bit meaning ("1" means "quiet") */
+    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
+}
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 325b24b8e2c..320ebf29f1f 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -18,8 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "fpu_helper.h"
-
 /* CPU / CPU family specific config register values. */
 
 /* Have config1, uncached coherency */
@@ -973,37 +971,3 @@ static void mvp_init(CPUMIPSState *env)
                              (0x0 << CP0MVPC1_PCX) | (0x0 << CP0MVPC1_PCP2) |
                              (0x1 << CP0MVPC1_PCP1);
 }
-
-static void msa_reset(CPUMIPSState *env)
-{
-    if (!ase_msa_available(env)) {
-        return;
-    }
-
-#ifdef CONFIG_USER_ONLY
-    /* MSA access enabled */
-    env->CP0_Config5 |= 1 << CP0C5_MSAEn;
-    env->CP0_Status |= (1 << CP0St_CU1) | (1 << CP0St_FR);
-#endif
-
-    /* MSA CSR:
-       - non-signaling floating point exception mode off (NX bit is 0)
-       - Cause, Enables, and Flags are all 0
-       - round to nearest / ties to even (RM bits are 0) */
-    env->active_tc.msacsr = 0;
-
-    restore_msa_fp_status(env);
-
-    /* tininess detected after rounding.*/
-    set_float_detect_tininess(float_tininess_after_rounding,
-                              &env->active_tc.msa_fp_status);
-
-    /* clear float_status exception flags */
-    set_float_exception_flags(0, &env->active_tc.msa_fp_status);
-
-    /* clear float_status nan mode */
-    set_default_nan_mode(0, &env->active_tc.msa_fp_status);
-
-    /* set proper signanling bit meaning ("1" means "quiet") */
-    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
-}
-- 
2.26.2


