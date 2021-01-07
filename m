Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E672EE8DE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:39:14 +0100 (CET)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdw1-00054g-9Q
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdk8-0003OL-89
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:56 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdk6-0006Er-GS
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:55 -0500
Received: by mail-wr1-x430.google.com with SMTP id q18so7159458wrn.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bnGMuEIL+4VmlV+xdWwg0SJvZ11jLh/bemgKxGT4D88=;
 b=Sbw38LZaOgKRsa2cr7ciETm4KuxJk1r/FTDMGg1cFdjsnLucprvjzuOP7dWJP4GOB/
 rkUsNjC0bgAwZxDolwnejxMTHZ6s3GqpH32OY2Vn9yq0m7hO78ySx3f2zJF/m2pXng7i
 qmG+M8wmkx2e8qWt11DlBj9ZTLfdcjmhcElcGNQxp2wr38xJbxPiSA3qw1yd5qGpiB9G
 PgLSJa2zZRi77oo6gFaGWQCFDs8Ucx4vuWBZdSORt3w76fXwyNIN2oDEND2pa0cEe2h1
 kq+LWM/Sx4IV44XlnQivufBXnPza4me3f3y83wbwxgU7wbMa0VpSH3U3SWMEJ+g0eifA
 fGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bnGMuEIL+4VmlV+xdWwg0SJvZ11jLh/bemgKxGT4D88=;
 b=iCUaVzcW6KqtBAH4GX7LtNOuwm1jqIv23qP3u0P2A8GUyeTToqEqzYqeHa06/9oN+2
 m34udlI0y/HE6gvAcABHkPa6R/ZgI1k0Zj+NHZMwEflFLA571oflyTK9kS38gHlkc1Qp
 gpbeBKYfPkQeK1xYeyMkDrmzv7EkWUOB+JWKj1EgCsAAyfELcnOqOHf8udtncqIMkS70
 Vlsa/iT1anb0nJnt0NwxIOS8GOfXElVlxOXZDcS1Qp0gWSv4Ocmu1QlXKNW7ulK0briK
 VSDd0QDKrolMHBbAwXwnkacFNRh9MrKsWTQUa/EwxQfmNNB1Lsx9yn6p3DMZhLtkjyRX
 lWcg==
X-Gm-Message-State: AOAM530xurZtJV6Rema6MgkL0xyxLVxeOgAqAz+eg1diYg/3WkGjOJQZ
 Xyqw4y5c12ZQ+fw2QQvMHgEO5clKfZo=
X-Google-Smtp-Source: ABdhPJxePIlJhzELurqoS+K7alNqibaKNHaRCBr8+ZkgFJMw/suk4RQ4msNEseH0yAh1UdMXMgkIOQ==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr687776wrn.208.1610058413020; 
 Thu, 07 Jan 2021 14:26:53 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id n9sm10110262wrq.41.2021.01.07.14.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/66] target/mips: Move msa_reset() to msa_helper.c
Date: Thu,  7 Jan 2021 23:22:33 +0100
Message-Id: <20210107222253.20382-47-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

translate_init.c.inc mostly contains CPU definitions.
msa_reset() doesn't belong here, move it with the MSA
helpers.

One comment style is updated to avoid checkpatch.pl warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-15-f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/internal.h     |  2 ++
 target/mips/cpu.c          |  1 +
 target/mips/msa_helper.c   | 36 ++++++++++++++++++++++++++++++++++++
 target/mips/cpu-defs.c.inc | 36 ------------------------------------
 4 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1048781bcf4..5dd17ff7333 100644
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
index 4c590b90b25..f45164012a4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -33,6 +33,7 @@
 #include "hw/qdev-clock.h"
 #include "hw/semihosting/semihost.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "fpu_helper.h"
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index b89b4c44902..f0d728c03f0 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
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
index 3d44b394773..ba22ff4bcd1 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -18,8 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "fpu_helper.h"
-
 /* CPU / CPU family specific config register values. */
 
 /* Have config1, uncached coherency */
@@ -975,37 +973,3 @@ static void mvp_init(CPUMIPSState *env)
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


