Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915924CC74C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:48:54 +0100 (CET)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsNZ-0004DA-CT
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:48:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLZ-0001WB-CS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:49 -0500
Received: from [2607:f8b0:4864:20::533] (port=34667
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLX-0000wP-SE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:49 -0500
Received: by mail-pg1-x533.google.com with SMTP id t187so1444715pgb.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sr43F1qKCGNfyfFMtktSEPXi0bm2RtNt/DXzayyQjPs=;
 b=ngfp9dNNdzQXnNCNQ0vi7BgVDjoAeFXy6yBiwoV+K1FM+7aCdqS4ODJK5z7oqQPRC0
 DOLnwjUZDnvT3KVVjskkupizmvgClkeKrE1uOX8f/lPS2YcyKIP6CMUj7o0VfDnUiB7p
 7ymS56ou5w+YCyjutood+1UgXOddjniBEt7ej6DnUyZf47ALwkqfgE4k1DWojhJqgTHr
 jDqr8UNIiuxbOyl1o8gyXNFq+hS7Lsz3Py8HeSbGHznsdkYdy33oWjDharGfCwHJ0xfW
 XeXqZxICuahMBH/iOTremQSeFhHos18dTfRs56H1DSWeydc1gAzft5h3CwfqttCJIyxJ
 jGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sr43F1qKCGNfyfFMtktSEPXi0bm2RtNt/DXzayyQjPs=;
 b=WLhG1J3eRzZmr2Y2NZy7C9RjDPc5U13GTAo1mILXhqKlR1EpKwk5Y5U1V/0OLs/EtU
 rvlfFEeIQhFREqmrZcfEf8pTkPs4SERkmmrT7Siq9gHIQW0smSLtkffGR/ekJyyBODhX
 VKMgOdEi/njT2V1oZNayFwoW4LjYestIVwyY4Ipyo6H17+Ezx3an5AkW2avRaphCrnUD
 IE0vVwrgC9CuAK3/wdD+2thGsF6bh4b0D+gaPJMWhnJvMkgyF1D4KnszlUkx6fWBJIZS
 3xSlpcg5USXmN2IzjDjhuPThOMm97wlkSRyUCSK8UkNJzIewtP7kC1jS7aqgEYCemDt6
 Dc1A==
X-Gm-Message-State: AOAM530PTiUdft+I97LZ+YKGeRoSnSiilbRGDuJIP+f76bvw3mt9zNPW
 DhOgLKW+1T9+jXMeXulb9sWH2xUsp3uRIw==
X-Google-Smtp-Source: ABdhPJywYA+pifPFPYIzkyxA44RHA7IJSeF6nZh01n+3Rrra0Hwr47wq+KPfjpoPLXza2qNnhy8O8Q==
X-Received: by 2002:a63:2a43:0:b0:37c:52d6:60de with SMTP id
 q64-20020a632a43000000b0037c52d660demr4660292pgq.488.1646340388700; 
 Thu, 03 Mar 2022 12:46:28 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] target/nios2: Remove mmu_read_debug
Date: Thu,  3 Mar 2022 10:46:18 -1000
Message-Id: <20220303204624.468786-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
References: <20220303204624.468786-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This functionality can be had via plugins, if desired.
In the meantime, it is unused code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.h    |  1 -
 target/nios2/mmu.h       |  1 -
 target/nios2/mmu.c       | 20 --------------------
 target/nios2/op_helper.c |  5 -----
 target/nios2/translate.c | 17 -----------------
 5 files changed, 44 deletions(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 6c8f0b5b35..6d8eec1814 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,7 +21,6 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
-DEF_HELPER_2(mmu_read_debug, void, env, i32)
 DEF_HELPER_3(mmu_write, void, env, i32, i32)
 DEF_HELPER_1(check_interrupts, void, env)
 #endif
diff --git a/target/nios2/mmu.h b/target/nios2/mmu.h
index 4f46fbb82e..b7785b46c0 100644
--- a/target/nios2/mmu.h
+++ b/target/nios2/mmu.h
@@ -44,7 +44,6 @@ void mmu_flip_um(CPUNios2State *env, unsigned int um);
 unsigned int mmu_translate(CPUNios2State *env,
                            Nios2MMULookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx);
-void mmu_read_debug(CPUNios2State *env, uint32_t rn);
 void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v);
 void mmu_init(CPUNios2State *env);
 
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 2545c06761..5616c39d54 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -35,26 +35,6 @@
 #define MMU_LOG(x)
 #endif
 
-void mmu_read_debug(CPUNios2State *env, uint32_t rn)
-{
-    switch (rn) {
-    case CR_TLBACC:
-        MMU_LOG(qemu_log("TLBACC READ %08X\n", env->regs[rn]));
-        break;
-
-    case CR_TLBMISC:
-        MMU_LOG(qemu_log("TLBMISC READ %08X\n", env->regs[rn]));
-        break;
-
-    case CR_PTEADDR:
-        MMU_LOG(qemu_log("PTEADDR READ %08X\n", env->regs[rn]));
-        break;
-
-    default:
-        break;
-    }
-}
-
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(CPUNios2State *env,
                            Nios2MMULookup *lu,
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a59003855a..61fc4dc903 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -26,11 +26,6 @@
 #include "qemu/main-loop.h"
 
 #if !defined(CONFIG_USER_ONLY)
-void helper_mmu_read_debug(CPUNios2State *env, uint32_t rn)
-{
-    mmu_read_debug(env, rn);
-}
-
 void helper_mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
 {
     mmu_write(env, rn, v);
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f9abc2fdd2..194c8ebafd 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -448,23 +448,6 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_check_supervisor(dc);
 
     switch (instr.imm5 + CR_BASE) {
-    case CR_PTEADDR:
-    case CR_TLBACC:
-    case CR_TLBMISC:
-    {
-#if !defined(CONFIG_USER_ONLY)
-        if (likely(instr.c != R_ZERO)) {
-            tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
-#ifdef DEBUG_MMU
-            TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
-            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-#endif
-        }
-#endif
-        break;
-    }
-
     default:
         if (likely(instr.c != R_ZERO)) {
             tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
-- 
2.25.1


