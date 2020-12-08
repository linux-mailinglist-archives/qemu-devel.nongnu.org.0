Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B542D1F57
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:49:59 +0100 (CET)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmRCX-0003zX-OT
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR17-0004IU-QI
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:09 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR12-0001No-Al
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:06 -0500
Received: by mail-ed1-x542.google.com with SMTP id cw27so15768777edb.5
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJfC/h9BxA47xiAn2bX5wMEFeliUIBESbbbnkjnhevs=;
 b=eKoyJyPo4jM7ONO8s65eXNGeIdy/J0u0dvc7qFl+zwSrKcgtsv1CyYoetFAl4oxqga
 rjKkh09MKAAgAb9y9TvqJVSX62Gns09fezDlJjNAQ250m/yZgovS8fD1OgAKgMo4396N
 eQnIY+fqpdHcsxjsNDixxQB2DYx3NpsN6Ds4tNqgvNC8jbSIUYhnU0jC0u7eeyNhRue3
 g9NZAmQdUdekBT9YKQJDlUHdYCN9/Lmdaoik3Ga+GKh3eyQKbFsMccHwpycSNwlRdl0f
 GqCCPydPYccc3dOtbgGiuUSb3DFycMO1kCtTbRnQboGXAlKN3AKngA98Ncv+Sv+lzwAS
 /4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HJfC/h9BxA47xiAn2bX5wMEFeliUIBESbbbnkjnhevs=;
 b=AV8uA0bauH4Fc2ACTvU89ScpWdbu2pPpbol+8zsTLGIkAUWwav4AFnPvuSr+rIsFNx
 Plmu59n4Dn2TPSuucHRmikavZGnqQhjVka1GEvKG5fg9qBYh42yl7dj5XZzMCdfHeYlM
 Va/YY7PtxPp0HEYZNZ8HEcvUd3dkQNbp+S5a0u0dEuziwwam5hly+rARmqV7frIgteD2
 u+SuWppuTvOHbNMsQVhOH2pOvpmRKA7K4LQm+8RoqEmw6bJ/6fqRGfzTn/V8q76orBA4
 zw7IkuRuFPbERgkUVLtOCLWIFXZ8Y/ndW5MlH9x4PhSm+SRaNUB1coJWkGD5L753OYBt
 p2Eg==
X-Gm-Message-State: AOAM533xZC+Hik5EJHPiifinUh9fxjxdRISYCvYQlN01q81PiBDrLIQT
 iT3zxOVISkAhWQqW4JrhrTT8d2Tn/BM=
X-Google-Smtp-Source: ABdhPJxkiRvPIJh42/zO15MexanV2Iy2soVWu7CEZ0SXqdozNkWFmgT9/GcL7BMOFXuDT6E2+NgCRA==
X-Received: by 2002:a50:e715:: with SMTP id a21mr22536767edn.285.1607387882785; 
 Mon, 07 Dec 2020 16:38:02 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id cb14sm13977041ejb.105.2020.12.07.16.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:38:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] target/mips: Move msa_reset() to mod-msa_helper.c
Date: Tue,  8 Dec 2020 01:36:56 +0100
Message-Id: <20201208003702.4088927-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

translate_init.c.inc mostly contains CPU definitions.
msa_reset() doesn't belong here, move it with the MSA
helpers.

One comment style is updated to avoid checkpatch.pl warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h           |  2 ++
 target/mips/mod-msa_helper.c     | 36 ++++++++++++++++++++++++++++++++
 target/mips/translate_init.c.inc | 34 ------------------------------
 3 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 3bd41239b1d..7813eb224c9 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -201,6 +201,8 @@ void mips_tcg_init(void);
 void cpu_state_reset(CPUMIPSState *s);
 void cpu_mips_realize_env(CPUMIPSState *env);
 
+void msa_reset(CPUMIPSState *env);
+
 /* cp0_timer.c */
 uint32_t cpu_mips_get_count(CPUMIPSState *env);
 void cpu_mips_store_count(CPUMIPSState *env, uint32_t value);
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
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index f6752d00afe..4856f4c5a4a 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -1021,37 +1021,3 @@ static void mvp_init(CPUMIPSState *env)
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


