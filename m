Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7416F5226
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:46:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6to-0005Oj-SG; Wed, 03 May 2023 03:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tW-0004en-Oj
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tU-0005g5-1K
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2951392f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098838; x=1685690838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSGBkCGTmt43n2aD+eXLzAZsrTUojrhuVsrF7MoFvho=;
 b=tM0gxUyJFw8XTboizF5F0ifCOoUJ5TmEY8naiFqcMOXSX62l7odkNXZz3qr8Fun63q
 tv2Ebbem8uIXcJWTybHye1Ax4FuFtPQFwwnL+z2OeeQ6VnFFyhYojyrVOvKk0LCkfI5e
 1Cej0SMz7U6e4r7LOr9AmRTn1jEgzMj/IvCEMyiGtAv9rhmAwtlD+sgtQZd9p58ewMxu
 IC/2kpCXkcZDf6h6VGh3opbk4RW3HvHP5IIM8Bt611D94PWVWqWqXNbW0P+82e6GX1X0
 PdO5MdOciXI5i5InrxZgbAft2EOSY9VXVW0fxyBmv4xVDd04Ns0BCdmLcSHHz4kBBLYd
 Cpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098838; x=1685690838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSGBkCGTmt43n2aD+eXLzAZsrTUojrhuVsrF7MoFvho=;
 b=G9RayYZG9HDa0dj3betd2+eEldJcodH8s5OaLH7hNGzN/Y8LrG2TkEnlGfi61/tzX6
 DBSf0fS8dCew9PpGb34IMDDMsRaEwZ77HExr8+oTrmZnuE6YRDO6eYSBjxDjlPX4ZzGB
 rN5FFPiLIMtZTxQt+RLqScOM2IPLzbG1vNM/Zkg05TO2IkjO4ARNk5QckHQCUvRqYkxn
 OYUfgOHPXn6DK7MCHvlJu+U9jjtgN14MX+xsO3GKXzvMOwuZBiyyazZXrKc6mBUNQz29
 Mbp9fnvHUz7YjAyMYNyvVgBH/L7ApvaeXjO/gfNqdGlSzKDtOAcqZJ5pOxGIQqStFPKJ
 TG9w==
X-Gm-Message-State: AC+VfDy/CvvKgL/Cvl/C293smI89udaBzun73WeUR1Y60+LXKIlbzUar
 6oAPP9IMF4+/wxZxFf38Edp68oxNTWtuzP7wLGtZSQ==
X-Google-Smtp-Source: ACHHUZ5D6qcw0dKsIMejVFzAgSsI7DMdrtpPEbKLk73BzjyoKcp26CGwwsLUD5EgcJtfD54+O6qSTQ==
X-Received: by 2002:a5d:4e8b:0:b0:306:44d0:2bcd with SMTP id
 e11-20020a5d4e8b000000b0030644d02bcdmr350200wru.9.1683098838350; 
 Wed, 03 May 2023 00:27:18 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 61/84] tcg: Remove DEBUG_DISAS
Date: Wed,  3 May 2023 08:23:08 +0100
Message-Id: <20230503072331.1747057-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This had been set since the beginning, is never undefined,
and it would seem to be harmful to debugging to do so.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 3 ---
 accel/tcg/cpu-exec.c      | 2 --
 accel/tcg/translate-all.c | 2 --
 accel/tcg/translator.c    | 2 --
 target/sh4/translate.c    | 2 --
 target/sparc/translate.c  | 2 --
 tcg/tcg.c                 | 9 +--------
 7 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 58ac1a91c2..a09d754624 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -27,9 +27,6 @@
 #include "qemu/interval-tree.h"
 #include "qemu/clang-tsa.h"
 
-/* allow to see translation results - the slowdown should be negligible, so we leave it */
-#define DEBUG_DISAS
-
 /* Page tracking code uses ram addresses in system mode, and virtual
    addresses in userspace mode.  Define tb_page_addr_t to be an appropriate
    type.  */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 9fe07c31fb..f1eae7b8e5 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -307,7 +307,6 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
                       cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc,
                       tb->flags, tb->cflags, lookup_symbol(pc));
 
-#if defined(DEBUG_DISAS)
         if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             FILE *logfile = qemu_log_trylock();
             if (logfile) {
@@ -323,7 +322,6 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
                 qemu_log_unlock(logfile);
             }
         }
-#endif /* DEBUG_DISAS */
     }
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 347768b979..dd19b3ca78 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -441,7 +441,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     qatomic_set(&prof->search_out_len, prof->search_out_len + search_size);
 #endif
 
-#ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
         qemu_log_in_addr_range(pc)) {
         FILE *logfile = qemu_log_trylock();
@@ -514,7 +513,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             qemu_log_unlock(logfile);
         }
     }
-#endif
 
     qatomic_set(&tcg_ctx->code_gen_ptr, (void *)
         ROUND_UP((uintptr_t)gen_code_buf + gen_code_size + search_size,
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 7bda43ff61..6120ef2a92 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -122,7 +122,6 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     tb->size = db->pc_next - db->pc_first;
     tb->icount = db->num_insns;
 
-#ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(db->pc_first)) {
         FILE *logfile = qemu_log_trylock();
@@ -133,7 +132,6 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
             qemu_log_unlock(logfile);
         }
     }
-#endif
 }
 
 static void *translator_access(CPUArchState *env, DisasContextBase *db,
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 350f88a99f..9d2c7a3337 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -17,8 +17,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#define DEBUG_DISAS
-
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "disas/disas.h"
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index a3fed5e01b..ebaf376500 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -37,8 +37,6 @@
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
-#define DEBUG_DISAS
-
 #define DYNAMIC_PC  1 /* dynamic pc value */
 #define JUMP_PC     2 /* dynamic pc value which takes only two values
                          according to jump_pc[T2] */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 916c143323..c5d7c6abc1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1320,7 +1320,6 @@ void tcg_prologue_init(TCGContext *s)
                         (uintptr_t)s->code_buf, prologue_size);
 #endif
 
-#ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
@@ -1352,7 +1351,6 @@ void tcg_prologue_init(TCGContext *s)
             qemu_log_unlock(logfile);
         }
     }
-#endif
 
 #ifndef CONFIG_TCG_INTERPRETER
     /*
@@ -5906,7 +5904,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
     }
 #endif
 
-#ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
                  && qemu_log_in_addr_range(pc_start))) {
         FILE *logfile = qemu_log_trylock();
@@ -5917,7 +5914,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
             qemu_log_unlock(logfile);
         }
     }
-#endif
 
 #ifdef CONFIG_DEBUG_TCG
     /* Ensure all labels referenced have been emitted.  */
@@ -5954,7 +5950,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
     liveness_pass_1(s);
 
     if (s->nb_indirects > 0) {
-#ifdef DEBUG_DISAS
         if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_IND)
                      && qemu_log_in_addr_range(pc_start))) {
             FILE *logfile = qemu_log_trylock();
@@ -5965,7 +5960,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
                 qemu_log_unlock(logfile);
             }
         }
-#endif
+
         /* Replace indirect temps with direct temps.  */
         if (liveness_pass_2(s)) {
             /* If changes were made, re-run liveness.  */
@@ -5977,7 +5972,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
     qatomic_set(&prof->la_time, prof->la_time + profile_getclock());
 #endif
 
-#ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
                  && qemu_log_in_addr_range(pc_start))) {
         FILE *logfile = qemu_log_trylock();
@@ -5988,7 +5982,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
             qemu_log_unlock(logfile);
         }
     }
-#endif
 
     /* Initialize goto_tb jump offsets. */
     tb->jmp_reset_offset[0] = TB_JMP_OFFSET_INVALID;
-- 
2.34.1


