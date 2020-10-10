Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90C28A0FF
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 19:29:24 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRIgN-0002Dc-I6
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 13:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIda-0000T3-T2
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:30 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdZ-0003qy-Ai
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:30 -0400
Received: by mail-wr1-x441.google.com with SMTP id i1so7554568wro.1
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+Ww+Tb9ux5DYpk7DL28NdlwI2XqYxB/b3zmX73nSUY=;
 b=aziUhqskN66qLugiFjiaKanCNVYoV2uzyECr7mXWx5V1tVLiPHlGvrp9t1X0EipdJ3
 fXoyJibEoQCTDW6wT4aGJZPzHa31VyGWBZBU4LSQg5bpuKJQs/625F6W1JBC91+UzDQh
 wUQJ8payE5095KDHcZxaFtdt2b9t98IuuL+OhsjL2pmzh4D9KPkEzHmWpeHXNiZHIj3l
 AyDHhtl0DvQSW53e5sMmeZs/pOxV/sKQHkdU8DwI/wvuzzthZSIiZaeipiZKH447tCJZ
 5aR/eGGkkNxm9OBeyjIQLFJKuJf7rgBxdJCMUivsozRZctJht+MQl28IK+BuxBakoc7A
 gyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w+Ww+Tb9ux5DYpk7DL28NdlwI2XqYxB/b3zmX73nSUY=;
 b=PZLLGd9Xt6ToEHrdsUCafhuR229FVzXGFLOo4+5IesDef1wIkmCoMk1Hxp67jT7096
 hzGF74hNZQtmjVHYfYizZBf4P8Vr1hZrX8aNF4M86d9cbWodys0hIphU/KtU8qyPHHd8
 ios5j2eYyFUIGqRBHk4hwnAxZvN/gHWOMyGrxd7rNLocp27loj046AHhiG6luJDXwzSZ
 f9LqD9wsut6dbbbgO1KGSyBNPEZVGTtxJcEo5dXHy463yXMY5Ck4rnr7W5zCn2UtDtPQ
 VHDtfBDQFuTOoKhmuNwjBx5AjRWSPNCSZTIKFinn2akGzdaFnFEpsIF4XtCsnHC2LYaX
 ZchQ==
X-Gm-Message-State: AOAM5321HUuFtsvoXj8OvHwERsxaSswMNd+gnT+c4NY/ugD+3QfmXBgv
 ciOW5xE1NTDeLlMM02Lo3Z85NmA0X7U=
X-Google-Smtp-Source: ABdhPJyg2MouUJ6BCn3Bt72zmWKeJ1PRFBTmNYJCz2QtbzzYwRLGojyUNDAx89Muhoo4KzG2Gi5ayw==
X-Received: by 2002:adf:8030:: with SMTP id 45mr21406726wrk.177.1602350787800; 
 Sat, 10 Oct 2020 10:26:27 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i11sm16786068wre.32.2020.10.10.10.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 10:26:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/20] target/mips: Move cpu_mips_get_random() with CP0
 helpers
Date: Sat, 10 Oct 2020 19:26:02 +0200
Message-Id: <20201010172617.3079633-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201010172617.3079633-1-f4bug@amsat.org>
References: <20201010172617.3079633-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The get_random() helper uses the CP0_Wired register, which is
unrelated to the CP0_Count register use as timer.
Commit e16fe40c872 ("Move the MIPS CPU timer in a separate file")
incorrectly moved this get_random() helper with timer specific
code. Move it back to generic CP0 helpers.

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h   |  2 +-
 target/mips/cp0_helper.c | 25 +++++++++++++++++++++++++
 target/mips/cp0_timer.c  | 25 -------------------------
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 7f159a9230c..087cabaa6d4 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -144,6 +144,7 @@ void r4k_helper_tlbr(CPUMIPSState *env);
 void r4k_helper_tlbinv(CPUMIPSState *env);
 void r4k_helper_tlbinvf(CPUMIPSState *env);
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
+uint32_t cpu_mips_get_random(CPUMIPSState *env);
 
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
@@ -209,7 +210,6 @@ void cpu_state_reset(CPUMIPSState *s);
 void cpu_mips_realize_env(CPUMIPSState *env);
 
 /* cp0_timer.c */
-uint32_t cpu_mips_get_random(CPUMIPSState *env);
 uint32_t cpu_mips_get_count(CPUMIPSState *env);
 void cpu_mips_store_count(CPUMIPSState *env, uint32_t value);
 void cpu_mips_store_compare(CPUMIPSState *env, uint32_t value);
diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index de64add038b..12143ac55b9 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -203,6 +203,31 @@ static void sync_c0_entryhi(CPUMIPSState *cpu, int tc)
     *tcst |= asid;
 }
 
+/* XXX: do not use a global */
+uint32_t cpu_mips_get_random(CPUMIPSState *env)
+{
+    static uint32_t seed = 1;
+    static uint32_t prev_idx;
+    uint32_t idx;
+    uint32_t nb_rand_tlb = env->tlb->nb_tlb - env->CP0_Wired;
+
+    if (nb_rand_tlb == 1) {
+        return env->tlb->nb_tlb - 1;
+    }
+
+    /* Don't return same value twice, so get another value */
+    do {
+        /*
+         * Use a simple algorithm of Linear Congruential Generator
+         * from ISO/IEC 9899 standard.
+         */
+        seed = 1103515245 * seed + 12345;
+        idx = (seed >> 16) % nb_rand_tlb + env->CP0_Wired;
+    } while (idx == prev_idx);
+    prev_idx = idx;
+    return idx;
+}
+
 /* CP0 helpers */
 target_ulong helper_mfc0_mvpcontrol(CPUMIPSState *env)
 {
diff --git a/target/mips/cp0_timer.c b/target/mips/cp0_timer.c
index bd7efb152dd..9c38e9da1c8 100644
--- a/target/mips/cp0_timer.c
+++ b/target/mips/cp0_timer.c
@@ -29,31 +29,6 @@
 
 #define TIMER_PERIOD 10 /* 10 ns period for 100 Mhz frequency */
 
-/* XXX: do not use a global */
-uint32_t cpu_mips_get_random(CPUMIPSState *env)
-{
-    static uint32_t seed = 1;
-    static uint32_t prev_idx = 0;
-    uint32_t idx;
-    uint32_t nb_rand_tlb = env->tlb->nb_tlb - env->CP0_Wired;
-
-    if (nb_rand_tlb == 1) {
-        return env->tlb->nb_tlb - 1;
-    }
-
-    /* Don't return same value twice, so get another value */
-    do {
-        /*
-         * Use a simple algorithm of Linear Congruential Generator
-         * from ISO/IEC 9899 standard.
-         */
-        seed = 1103515245 * seed + 12345;
-        idx = (seed >> 16) % nb_rand_tlb + env->CP0_Wired;
-    } while (idx == prev_idx);
-    prev_idx = idx;
-    return idx;
-}
-
 /* MIPS R4K timer */
 static void cpu_mips_timer_update(CPUMIPSState *env)
 {
-- 
2.26.2


