Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162F2364AC8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:50:08 +0200 (CEST)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZuJ-0005CZ-6D
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRF-0008In-Tu
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRE-0001cz-8t
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so21211088wmy.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UwCC1UpHM/jSWsuRMtR8URBWtsAsFHj4UD0F2s/h0Ok=;
 b=fv7qWImZs3AEUxNs+qc7ml/ZdGa28Yg5n5a8Tqz571jzDXQ7DxpFaRy08zzgw2kB8D
 lOMxNaMJgexxrFIKaaydstcayMI2IAYE95oA8iPFQ3XvYKzZYp18nby/aHsus+cKnplQ
 310kwe1RZt/L90z2Xw86z5Ga0+5dAPKHJ99nejM3sE4LztOEQ+QIPIetCP02133aBsNZ
 SJiREfb5aJyPfM9lCSIemXs9yNw8fQozIUtm5a+sCODgKYoj3qMlliUv8SGbE5jKlnjt
 h18RA1ZIKos1rZQBeArSAJo+Ab9LqAC+RjucZrwBQ5fb2ObbmFZpLoXAqvaH2tKsJX7s
 7+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UwCC1UpHM/jSWsuRMtR8URBWtsAsFHj4UD0F2s/h0Ok=;
 b=pLoV6hI1jZOUFEcoW5BFT3pWeX5MyNMkQQygR69uZ+34HoB6TnEoKeUHEm0Cw/LXCn
 AKKCfhUzDWzeNoxY644T/AR53PKXqghotq51P3l5ymNtv32rjt8bJ/NEzB2GfY5/2D5d
 NfWTDuiVXyJQg6VFtxwcL1PFvpPwxE0tT04wbCwzsqXFOdGDUd/qdLOWNX2xTPRL2RVv
 VwGlW+Aq02XSm09YMzEhePS39VCUABvuau+6A8PnZ2GkUPl3f7clJgzfTYKn+iJ+ES9C
 SzsEkK8KBUk8aIYas2tqk+bqifZd2TGIBujduSetp5CPqX2fjqAeP+KOTekeL0FBJ+UX
 miCw==
X-Gm-Message-State: AOAM5305gRjMWh45Nt5+j0EcBk2v6l7bxbQ3TMR34wCOxdf2EZGPykK6
 msqwXifW7GJGaqzeDq8p+djyYs8x8Yl5Kw==
X-Google-Smtp-Source: ABdhPJzoBqsZuthHYTUeH6znYQsbEnJI4YV/zEq802EjjBvOvezqMHTzjVvIn7wpQG8ZpF71juUj5A==
X-Received: by 2002:a05:600c:49a4:: with SMTP id
 h36mr593878wmp.102.1618860002718; 
 Mon, 19 Apr 2021 12:20:02 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f6sm23205854wrt.19.2021.04.19.12.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:20:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/30] target/mips: Restrict mmu_init() to TCG
Date: Mon, 19 Apr 2021 21:18:13 +0200
Message-Id: <20210419191823.1555482-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmu_init() is only required by TCG accelerator.
Restrict its declaration and call to TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         | 3 ---
 target/mips/tcg/tcg-internal.h | 2 ++
 target/mips/cpu.c              | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 0bce0950b2c..54e6f08f560 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -233,9 +233,6 @@ void cpu_mips_store_compare(CPUMIPSState *env, uint32_t value);
 void cpu_mips_start_count(CPUMIPSState *env);
 void cpu_mips_stop_count(CPUMIPSState *env);
 
-/* helper.c */
-void mmu_init(CPUMIPSState *env, const mips_def_t *def);
-
 static inline void mips_cpu_set_error_pc(CPUMIPSState *env,
                                          target_ulong error_pc)
 {
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index b65580af211..70655bab45c 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -20,6 +20,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mmu_init(CPUMIPSState *env, const mips_def_t *def);
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index fcbf95c85b9..acc149aa573 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -708,7 +708,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 
     env->exception_base = (int32_t)0xBFC00000;
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     mmu_init(env, env->cpu_model);
 #endif
     fpu_init(env, env->cpu_model);
-- 
2.26.3


