Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65E518FCC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:13:14 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzpZ-0004Zn-DV
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZr-0000fq-Im
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:57 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZo-0006NQ-Fw
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:54 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i24so15568611pfa.7
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bE76Luy7w0uXkAbzJgphYoFrwUdTwectG5vq9pZqEvA=;
 b=amtZ5k28fisP8nbDDwqUlt/+Op4kpc4KUKos2mdIdTbM8aHvUzcGyxT8BtfAJ0xIUp
 93igYJUJqVn2N2F0b7BvzaxzZ+4ZNpiSAyHfrBqcK7vaLQD5bmff3m4XxyNmbQjd2jpL
 xelW7ZqOMLYunOvbilMwasWOhT913d9G8dDqa1giniLCiUGVwJku9p4xPo8NmMza7Xe2
 OI0xuvG+PgKoBokqlACfRWJPpeXbt/BPtp5EpXrA+DQsC4RA5DgGvegoeYNYCd57YgPO
 KYyBjdKWk5nAueg+WNEaqCczd8mm60mv14aTOYJeA3LfKUu987ysEZ9L2fhSDRTUO9Ej
 Z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bE76Luy7w0uXkAbzJgphYoFrwUdTwectG5vq9pZqEvA=;
 b=fjIstt/MA3D6xpRU/FNcQOGcDnqTxjCOFLuM99jq5I9q0/HuGKcbhFcBCQXIDfX13v
 GfLngLTCxQdmj4wqqZ4hJF+P75LAEufXrXs8+vTVVHFm7OP3FJy0FySiTDZE62DN/S0G
 GkDIM0EhuVo8CZDBoS5FhJWyk8K3F+nKLCd1Brc9sIE0xMjWU8GwsrJMVFIGHtN3lIJ/
 nTVad3goWWHszEGMM/pQzaMm0ZM4t81WZ1VqSbV+BJQI9YLf+oPvEg4KvZDmNM1Z/oXK
 xOlf9BtScHCVohgfVTw6t5eBVd4VpEvYVPIIAT1Dku2oRQ2BmKpEs7kY4PQveuQ3xDIG
 PhxQ==
X-Gm-Message-State: AOAM531rZpPCyd7XmS/xnkoNUmdBWsjU0rbYU0ZGzkhd0bfqWvAnKJiv
 TB8X4NIHyCFV0zev22ijb9FFV2n+7+2EFQ==
X-Google-Smtp-Source: ABdhPJwzKnrH6yIe+9Z8gjvMaTlaj1nPCLKpzN4ep76rlqiG6M42mpGsY1nG1T4obYfByZ3JymJM4g==
X-Received: by 2002:a05:6a00:26c3:b0:50d:d619:e4c6 with SMTP id
 p3-20020a056a0026c300b0050dd619e4c6mr14962734pfw.13.1651607571159; 
 Tue, 03 May 2022 12:52:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 65/74] target/xtensa: Use an exception for semihosting
Date: Tue,  3 May 2022 12:48:34 -0700
Message-Id: <20220503194843.1379101-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Within do_interrupt, we hold the iothread lock, which
is required for Chardev access for the console, and for
the round trip for use_gdb_syscalls().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h         | 2 ++
 target/xtensa/helper.h      | 3 ---
 target/xtensa/exc_helper.c  | 4 ++++
 target/xtensa/translate.c   | 3 ++-
 target/xtensa/xtensa-semi.c | 3 +--
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index d4b8268146..411a128f60 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -259,6 +259,7 @@ enum {
     EXC_USER,
     EXC_DOUBLE,
     EXC_DEBUG,
+    EXC_SEMIHOST,
     EXC_MAX
 };
 
@@ -574,6 +575,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+void xtensa_semihosting(CPUXtensaState *env);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/xtensa/helper.h b/target/xtensa/helper.h
index ae938ceedb..531679cd86 100644
--- a/target/xtensa/helper.h
+++ b/target/xtensa/helper.h
@@ -11,9 +11,6 @@ DEF_HELPER_2(retw, void, env, i32)
 DEF_HELPER_3(window_check, noreturn, env, i32, i32)
 DEF_HELPER_1(restore_owb, void, env)
 DEF_HELPER_2(movsp, void, env, i32)
-#ifndef CONFIG_USER_ONLY
-DEF_HELPER_1(simcall, void, env)
-#endif
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(waiti, void, env, i32, i32)
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index d4823a65cd..d54a518875 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -219,6 +219,10 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
 
     switch (cs->exception_index) {
+    case EXC_SEMIHOST:
+        xtensa_semihosting(env);
+        return;
+
     case EXC_WINDOW_OVERFLOW4:
     case EXC_WINDOW_UNDERFLOW4:
     case EXC_WINDOW_OVERFLOW8:
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 1485df2f22..6ddb2e112e 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2416,7 +2416,8 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     if (semihosting_enabled()) {
-        gen_helper_simcall(cpu_env);
+        tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
+        gen_exception(dc, EXC_SEMIHOST);
     }
 #endif
 }
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index fa21b7e11f..5375f106fc 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -28,7 +28,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "chardev/char-fe.h"
-#include "exec/helper-proto.h"
 #include "semihosting/semihost.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
@@ -188,7 +187,7 @@ void xtensa_sim_open_console(Chardev *chr)
     sim_console = &console;
 }
 
-void HELPER(simcall)(CPUXtensaState *env)
+void xtensa_semihosting(CPUXtensaState *env)
 {
     CPUState *cs = env_cpu(env);
     uint32_t *regs = env->regs;
-- 
2.34.1


