Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7842E7DB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:26:44 +0200 (CEST)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEnr-0006ZI-Qr
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ8-0007Sc-8r
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYy-0000Oh-At
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q5so7431227pgr.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=HFNiH3O02qLQBBvg1obEw2pNCXQWPNxXjz71Cf5BbG5AvpYlzdMJe/sD+bvGM6Fx9l
 fiNqUI8Bi5APeNu7pdIuLltRnbVaM7jdeRRSw3Yc+vIfowM6ulpM8yFc8EZv4BeW84Af
 RGf2C3HifUpwLeoqYbhDM5uZ2jh60UfMiove169hA9WSVY4ZkhmMdGOkwoSuB5h+NjXT
 t3CjQISIpblujY6oYVDHjLe9PhC4D5UWacoyabohT/HhV29yminaocXYrSH55fV9IBxJ
 Ko5iCL8zF3L502A4DRqw2Ewfqi6J5+OD7Be1yi0t4na0zkftH/iNppyN/VRiBpOtSHjY
 AqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=tL7ENj2TLlebFz7jltO5JAKUJPK8bfcWQ8QNLcgutXpFoPYm+i/om6WH5j5YdsrDV+
 h5SDsYXQ1MPbRCJEJO9RAQidLQggM2zMHaaOLvFr8NHgCC44s1YgqsKnrRZn8u0Yx0Al
 m0073njPhIiGYty4Xc4pRkKfa7FA43CzXeWPZslKIPveJ75r/I7aeVh4YHDXSGZdhhsn
 uuKhXeoiDFX+1DCXYlvcE+0J+hlARAO88plUSlpB08B7tkfCl4FhXCjO/YIejeCCckIj
 /0ixl+07sWwe4V5L8khlZ2FnKHkmhPs0mdABEJ5XHNkXsQiXnVgCMirIWEhUn9kPcA/6
 otYQ==
X-Gm-Message-State: AOAM530gzQfyhaDdvOvM6DfB/AlAr5fx+zMe3ErXcZvywoE1FKoe1Vgx
 gdr5PIFrJBsBqxkUHETLvHzpgmsoM2KTAw==
X-Google-Smtp-Source: ABdhPJy2sXE27u1ekcYk+V3nKaRKoPOrMiJoqnFJ+uvilE/23y7HLM3tS6RL18r1N4AoWJWv5L9yCA==
X-Received: by 2002:a63:2a92:: with SMTP id q140mr7429761pgq.412.1634271078458; 
 Thu, 14 Oct 2021 21:11:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/67] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Date: Thu, 14 Oct 2021 21:10:14 -0700
Message-Id: <20211015041053.2769193-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for m68k linux-user.

Remove the code from cpu_loop that handled EXCP_ACCESS.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 10 ----------
 target/m68k/cpu.c          |  2 +-
 target/m68k/helper.c       |  6 +-----
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index ebf32be78f..790bd558c3 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -90,16 +90,6 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-        case EXCP_ACCESS:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmu.ar;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d1189..c7aeb7da9c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -515,9 +515,9 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = m68k_cpu_tlb_fill,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 137a3e1a3d..5728e48585 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -978,16 +978,12 @@ void m68k_set_irq_level(M68kCPU *cpu, int level, uint8_t vector)
     }
 }
 
-#endif
-
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType qemu_access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
-
-#ifndef CONFIG_USER_ONLY
     hwaddr physical;
     int prot;
     int access_type;
@@ -1051,12 +1047,12 @@ bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (!(access_type & ACCESS_STORE)) {
         env->mmu.ssw |= M68K_RW_040;
     }
-#endif
 
     cs->exception_index = EXCP_ACCESS;
     env->mmu.ar = address;
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 uint32_t HELPER(bitrev)(uint32_t x)
 {
-- 
2.25.1


