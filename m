Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31A442CB2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:35:21 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs4W-0006GR-Md
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreG-0003sF-AY
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:12 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhre4-0000wH-0L
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:11 -0400
Received: by mail-qt1-x82a.google.com with SMTP id 8so979931qty.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=RCZurs00E5PwKyfhSnL8+fW1JhT86YuTvroVJgzPnEYoehIGQQ1V01+WATT6Co3lvj
 GSpL8EMqcT9PzLojgK70nunfrLRox/kZXPwjrA3SelgKNiVsYxtg2mXukrGquBjd4JkQ
 vHDkwyUcdo+uqLVkWbPHao375zjtrb/QdAxeilk7Ybawt14URouiy3dU/AhcYqw9cn8f
 bCBhl8KKJ4X9wMBHUqIlH6ayVBucwjHPuh/Dnm1V9HxN2OmhjQD27oNsmsY1QRNOa3bm
 p1bLyyudwOcMWTVbw2fnBuOq8pD0fF8v9rgNDKBC9W/WOtimmtGGBJR6+bCbWMaQ8r+6
 wCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/utnMsLyouv7LilvnHYZPxrZ8zRoC/jZ7xS1qGJE894=;
 b=ONtSAwv9ZzltUf7LYz3LiAwJHfmZJMeOAHlpFy8qwsieEO+boKDERATQavQpXkgM9e
 nbmhygcT1NqlRDaGy6+wlXmf+2D5QwjYYDqLaWXnOKfWl27pH1K5BB3pyMiOmA6iaF1K
 7z/HvNEYsYmJi/OcS3tsxEpERDof/6erkmKL/ipo+SFsW1y5qjgIv3grVbNE0QRRuAm6
 3ez5fyb1YiHw1PdEoCD41M0hv+FiICPHSUKKoc2FBY2EfAeKrtGFsvqT9/0KQI4fvj2Y
 UcaUxdp4DN+97Ig5EEuGyuEdZRl6bGjHHiWTV6ukKen5FccPEzDgcaRgSyKZ+vQkh8bl
 EAUQ==
X-Gm-Message-State: AOAM530DUiW9I8g5TltaGn9s7EbteplRuxpbqjJ8xsFq2sF9QB+taG4Z
 chVHxYKlVEE+2aJXL2tQ6GoAjSaabP5+JQ==
X-Google-Smtp-Source: ABdhPJwlZIoWNkwcXMIskYyyzX5zgt9XBa/BBRtWTfhYemytKPGiMntvo7nRe+pG5ueP0tSgPWXTLg==
X-Received: by 2002:ac8:5dd4:: with SMTP id e20mr12156632qtx.8.1635851277951; 
 Tue, 02 Nov 2021 04:07:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/60] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Date: Tue,  2 Nov 2021 07:07:08 -0400
Message-Id: <20211102110740.215699-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


