Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174C6A65BF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCVQ-0005Vj-4n; Tue, 28 Feb 2023 21:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCVO-0005VL-PR
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:47:46 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCVM-0000gU-Nn
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:47:46 -0500
Received: by mail-pj1-x1044.google.com with SMTP id kb15so11916012pjb.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=klkoOEYiLjCwPEMw+PE6EXEPDAYCAUIdZ4jSX5n/V7M=;
 b=hzqa86M9GD8xKXJNevf8CmTN2vV9ErIVGW/qHgGJd8aiz7ipG2ipduMEsnmfLlfCOt
 kzsMjNLa3vPALmbvXQi4Il7FhP1at6M9B7uhx0oAkgmBiab41yc8foTnuUDhRSWZObs2
 43MfEi5UfcoaRvMkeW+U4l/0IPU605ZSQGu4wDKm/SLhA2j9YIlqEMekpItZwmhZvhS9
 rn22dO/UsP5RO3n+XpvTPLIz/wgz0vki1H9b66ifBS0R9mb3sfKhwBMr2tqXUvl/mPiK
 HGstcRtMK9gXZy1h8vRcRHR5IBpkApFFgZdn0xYBfW1H9vPdnVLDOWbsEuFY1nruAiFO
 deEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=klkoOEYiLjCwPEMw+PE6EXEPDAYCAUIdZ4jSX5n/V7M=;
 b=3bD09FU+f/O1t/++uDnz/snGriFl8tLeyUGKzhl5uAGQNIMjLGZQnybIDPPox9RCGo
 bsfu0QaPqNwzOmTG6iJgeHMhOsUWVqXCl6RMEUsycCzqCJgMnAyQJoX52g69JOvcQ80k
 dWqs8JeM/Nh2u66VhKkAI2yFGaXa5AKjv1hERvc1bMc32RiIDp2lBv1Q8Bxefa4NiUQZ
 /if0MOZRvsCF7p5JCT0HI6p+VAGaDXluaNOrNmsWDqTjmisyUOm8vQu1pc5g9VhKJDs3
 kI9gWxem/+ejpbJcusoNyo3tMXCMXUguCvOszfj5o17qMSmfnddXvPfr/w4RxEbJXRHG
 2qAQ==
X-Gm-Message-State: AO0yUKWnM1PyiSvlpT/sLndvYXL3vJAnEbHi/ivVo/JN+6GEFLijAFd0
 KdpylPg2W7ugpW2e/yuUymjQrh/KP/eo0plfpx76TQ==
X-Google-Smtp-Source: AK7set/tM3E8OZbc3EIHC+1Qj6VhStLbtRXYMOwyYdCwJe/QqGFRxvYCTxmtz/AUwswEWJ2fZkUlEw==
X-Received: by 2002:a05:6a20:3ca2:b0:cc:e0fb:a835 with SMTP id
 b34-20020a056a203ca200b000cce0fba835mr7389502pzj.47.1677638863129; 
 Tue, 28 Feb 2023 18:47:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 y18-20020aa78052000000b005a8aab9ae7esm6708449pfm.216.2023.02.28.18.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:47:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org, aaron@os.amperecomputing.com,
 frederic.petrot@univ-grenoble-alpes.fr
Subject: [PATCH 1/2] tcg: Clear plugin_mem_cbs on TB exit
Date: Tue, 28 Feb 2023 16:47:36 -1000
Message-Id: <20230301024737.1210851-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301024737.1210851-1-richard.henderson@linaro.org>
References: <20230301024737.1210851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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

Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
adjacent to where we reset can_do_io.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 4 ++++
 accel/tcg/cpu-exec.c        | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index c7bc8c6efa..e136b0843c 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -65,6 +65,10 @@ void cpu_loop_exit(CPUState *cpu)
 {
     /* Undo the setting in cpu_tb_exec.  */
     cpu->can_do_io = 1;
+#ifdef CONFIG_PLUGIN
+    /* Undo any setting in generated code. */
+    cpu->plugin_mem_cbs = NULL;
+#endif
     siglongjmp(cpu->jmp_env, 1);
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56aaf58b9d..2831fcafee 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -459,6 +459,9 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
+#ifdef CONFIG_PLUGIN
+    cpu->plugin_mem_cbs = NULL;
+#endif
     /*
      * TODO: Delay swapping back to the read-write region of the TB
      * until we actually need to modify the TB.  The read-only copy,
@@ -526,7 +529,6 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
-    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -1004,7 +1006,6 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
-            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(sc, cpu);
-- 
2.34.1


