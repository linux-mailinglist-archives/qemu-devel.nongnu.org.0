Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4C40A214
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:35:09 +0200 (CEST)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwPk-0006LT-37
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6b-0001n3-3W
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:23 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6U-0007k6-1Z
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:19 -0400
Received: by mail-pf1-x436.google.com with SMTP id j6so10139764pfa.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96+yjCsm8YeUrpyWCuPcD+HMYxAClVzCyhU0lunkMlQ=;
 b=HVm2q8jdSlGzu5PXrz57iDkfT7nges8rgF+0CuZca1KNk+QOqWwCx8WeEtseoeFU8y
 xazc9ti9mrYAcsncJuCQcYYpxrnT6fTKuKaB2RdsU1RqmQaZi1VxrjXz7E6Nj6XYGfTW
 3qkfQxramrE8JQLneTyvfnDec4cQoJ7NA6oY3t06UJCm9/2jh6G1C0IpIW9qgu7OaTMR
 8ihAixGqhpTDdqRBqr4LKObM7CyJ9LV5kRD8t6jHk3RK/moCrv2qThI9Ny0zSPd6bihS
 RWtr/hRbBK+x6+aeyka8+hfrc98sBKpzwaIMEEluU06rmcwnGwryEw/q/EH8KVBJ9g4X
 fz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96+yjCsm8YeUrpyWCuPcD+HMYxAClVzCyhU0lunkMlQ=;
 b=pZ10aXMOo7tNngd1QwzZD5B22A260ghzY7zDBdaRtwEznN8IMs+hIasM08YH89VH/d
 lMh5c/ZVhxr9Wyym7hbvqmvw55xFcuSBSAsPleLNeydeCK2pFP3sR0yQiac4/BdTnbmD
 yhe7Hl9/B9PFJ90pLapdyhbGaM6WItDmLkqRZ/OZ3K+lox0BuMLbQZ7WP2ApEXXnTkf0
 A1FmbNGlw1dFTBd807Kl+FPDdl38dkhcHRraJBmiq/ysUmCpqOJxicnJ1pXr4vLoQwPh
 swE623pIEMmFp+nzPU8rPb1l35G9WCgULn0hT8UH+e+N6wcbL7fSIV/t0uh0tqJ65fHs
 JTzQ==
X-Gm-Message-State: AOAM532kMH/cdX98ZSNIz1VUov3xIYvLfBP6Y18Y4+nEPLvFewt+Ekq+
 onuyiPpxQdSYXlpQKhktS5DX+DN5gWkIlA==
X-Google-Smtp-Source: ABdhPJx8cxmlAJLdqODViSku+sSICNITcxEF5TsFX/Cfl2dJQSCnh0tcDaxR1KV1+9jxfl/0GsTiug==
X-Received: by 2002:aa7:8ecc:0:b0:434:d4fe:311b with SMTP id
 b12-20020aa78ecc000000b00434d4fe311bmr1970136pfr.22.1631578512745; 
 Mon, 13 Sep 2021 17:15:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/44] target/m68k: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:32 -0700
Message-Id: <20210914001456.793490-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-13-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h       |  2 ++
 target/m68k/cpu.c       |  2 +-
 target/m68k/op_helper.c | 16 +++-------------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 997d588911..550eb028b6 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -166,8 +166,10 @@ struct M68kCPU {
 };
 
 
+#ifndef CONFIG_USER_ONLY
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 72de6e9726..66d22d1189 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -515,10 +515,10 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d006d1cb3e..5d624838ae 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -24,18 +24,7 @@
 #include "semihosting/semihost.h"
 #include "tcg/tcg.h"
 
-#if defined(CONFIG_USER_ONLY)
-
-void m68k_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
-static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
-{
-}
-
-#else
+#if !defined(CONFIG_USER_ONLY)
 
 static void cf_rte(CPUM68KState *env)
 {
@@ -516,7 +505,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
         cpu_loop_exit(cs);
     }
 }
-#endif
 
 bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -538,6 +526,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
-- 
2.25.1


