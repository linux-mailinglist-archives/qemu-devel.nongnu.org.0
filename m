Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30CA504929
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:05:19 +0200 (CEST)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAD0-0001k4-H9
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fP-0000Qy-GI
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fL-0001kV-EU
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:34 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so12317534pja.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZIO39CrK6cbWNfd2NQXA1gGk6SjPN+qnguxl1tyc930=;
 b=eeDaK54IFqYyOfxElbiM4h9TnI6QKI0Gg1+Qp5+Q7MiF5jhSP2SQnvwPlehvERfY6v
 tKcv/I1RQdXP8GCjfAGMIpsfGe0xArCdgMbmsnV73n7NbqpkExcSQB54e7hJxGXm3gwL
 ZnC07ieuh0TwV3NhrhGVjFNGkTxxDyAZU/rQZVzD4KorGAClAxv3oCQybzvFpajVKBv/
 aUNQN3qrszLgFMc55k/hqITokuaBoVtbXC0uBZIjnu68AHtkFsF/fjcK9TWuPxsj3e6M
 nCQNpSd8v0MibkrrY5arZTW6QHr0ibDYR1umpaJZoiK7cRniR6L4Wkl5f8ek0u5rXzHK
 pkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZIO39CrK6cbWNfd2NQXA1gGk6SjPN+qnguxl1tyc930=;
 b=oRbcQA1n5fggQ3x6UG8vDA5EFOW6mhk9T8NXmjwmGRqAWYbUEFR8JBtKcnsNLpSmWu
 JphuxRVklODTh3sLOfoXHNhYGagOUmEowpE1SXZ4B67kh87MG3hUHubaO3MAJ2S6npJS
 mkcrCOCCYipwm43bjGd91BQR0ltcTuPlL/A2h5u0gaXqP2c/kr3flZgKyvsMHQPSBy3t
 b7SVrURAj529sgesRSZ3vE04+1833FXAkGfYWlR3mdc/LonkxVgIobw0cCLsctdOm97z
 NRY3U05I0FnXBBps3YwQ2jkhpR+j0aHLLYV/Z9wOmkMnQoy0rbYXokL1WBfxNcVqsqFc
 CUXg==
X-Gm-Message-State: AOAM532HL+rYsBk0Dbze2HAMAvS46AoHt1GAUO0VpAtGyP0gtcTLJYuT
 TMEiE3RQl6nAJjbKWPIIIT3LuesXeCWubQ==
X-Google-Smtp-Source: ABdhPJy3slpogUC0Xf+CZH5F9SlJhmuMmGuw5AcRghTIC6EQ6sOFH8ZQRvLVwsGohFZRxp8DAMLx7w==
X-Received: by 2002:a17:903:124a:b0:154:c860:6d52 with SMTP id
 u10-20020a170903124a00b00154c8606d52mr7924784plh.159.1650220227921; 
 Sun, 17 Apr 2022 11:30:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/39] *: Use fprintf between qemu_log_trylock/unlock
Date: Sun, 17 Apr 2022 11:29:49 -0700
Message-Id: <20220417183019.755276-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inside qemu_log, we perform qemu_log_trylock/unlock, which need
not be done if we have already performed the lock beforehand.

Always check the result of qemu_log_trylock -- only checking
qemu_loglevel_mask races with the acquisition of the lock on
the logfile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h          |   2 +-
 accel/tcg/cpu-exec.c        |  16 ++---
 accel/tcg/translate-all.c   | 117 +++++++++++++++++++-----------------
 accel/tcg/translator.c      |  10 +--
 cpu.c                       |  14 +++--
 hw/net/can/can_sja1000.c    |  24 ++++----
 net/can/can_socketcan.c     |  23 ++++---
 target/i386/tcg/translate.c |  14 +++--
 tcg/tcg.c                   |  74 +++++++++++++----------
 9 files changed, 162 insertions(+), 132 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index fb595d1eb7..648f4d2263 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -73,7 +73,7 @@ static inline void log_page_dump(const char *operation)
 {
     FILE *logfile = qemu_log_trylock();
     if (logfile) {
-        qemu_log("page layout changed following %s\n", operation);
+        fprintf(logfile, "page layout changed following %s\n", operation);
         page_dump(logfile);
     }
     qemu_log_unlock(logfile);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8d0315de75..8a896e772d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -216,16 +216,18 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 #if defined(DEBUG_DISAS)
         if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             FILE *logfile = qemu_log_trylock();
-            int flags = 0;
+            if (logfile) {
+                int flags = 0;
 
-            if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
-                flags |= CPU_DUMP_FPU;
-            }
+                if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
+                    flags |= CPU_DUMP_FPU;
+                }
 #if defined(TARGET_I386)
-            flags |= CPU_DUMP_CCOP;
+                flags |= CPU_DUMP_CCOP;
 #endif
-            log_cpu_state(cpu, flags);
-            qemu_log_unlock(logfile);
+                log_cpu_state(cpu, flags);
+                qemu_log_unlock(logfile);
+            }
         }
 #endif /* DEBUG_DISAS */
     }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 71ab863c18..4812619f00 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1529,68 +1529,75 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
         qemu_log_in_addr_range(tb->pc)) {
         FILE *logfile = qemu_log_trylock();
-        int code_size, data_size;
-        const tcg_target_ulong *rx_data_gen_ptr;
-        size_t chunk_start;
-        int insn = 0;
+        if (logfile) {
+            int code_size, data_size;
+            const tcg_target_ulong *rx_data_gen_ptr;
+            size_t chunk_start;
+            int insn = 0;
 
-        if (tcg_ctx->data_gen_ptr) {
-            rx_data_gen_ptr = tcg_splitwx_to_rx(tcg_ctx->data_gen_ptr);
-            code_size = (const void *)rx_data_gen_ptr - tb->tc.ptr;
-            data_size = gen_code_size - code_size;
-        } else {
-            rx_data_gen_ptr = 0;
-            code_size = gen_code_size;
-            data_size = 0;
-        }
-
-        /* Dump header and the first instruction */
-        qemu_log("OUT: [size=%d]\n", gen_code_size);
-        qemu_log("  -- guest addr 0x" TARGET_FMT_lx " + tb prologue\n",
-                 tcg_ctx->gen_insn_data[insn][0]);
-        chunk_start = tcg_ctx->gen_insn_end_off[insn];
-        log_disas(tb->tc.ptr, chunk_start);
-
-        /*
-         * Dump each instruction chunk, wrapping up empty chunks into
-         * the next instruction. The whole array is offset so the
-         * first entry is the beginning of the 2nd instruction.
-         */
-        while (insn < tb->icount) {
-            size_t chunk_end = tcg_ctx->gen_insn_end_off[insn];
-            if (chunk_end > chunk_start) {
-                qemu_log("  -- guest addr 0x" TARGET_FMT_lx "\n",
-                         tcg_ctx->gen_insn_data[insn][0]);
-                log_disas(tb->tc.ptr + chunk_start, chunk_end - chunk_start);
-                chunk_start = chunk_end;
+            if (tcg_ctx->data_gen_ptr) {
+                rx_data_gen_ptr = tcg_splitwx_to_rx(tcg_ctx->data_gen_ptr);
+                code_size = (const void *)rx_data_gen_ptr - tb->tc.ptr;
+                data_size = gen_code_size - code_size;
+            } else {
+                rx_data_gen_ptr = 0;
+                code_size = gen_code_size;
+                data_size = 0;
             }
-            insn++;
-        }
 
-        if (chunk_start < code_size) {
-            qemu_log("  -- tb slow paths + alignment\n");
-            log_disas(tb->tc.ptr + chunk_start, code_size - chunk_start);
-        }
+            /* Dump header and the first instruction */
+            fprintf(logfile, "OUT: [size=%d]\n", gen_code_size);
+            fprintf(logfile,
+                    "  -- guest addr 0x" TARGET_FMT_lx " + tb prologue\n",
+                    tcg_ctx->gen_insn_data[insn][0]);
+            chunk_start = tcg_ctx->gen_insn_end_off[insn];
+            disas(logfile, tb->tc.ptr, chunk_start);
 
-        /* Finally dump any data we may have after the block */
-        if (data_size) {
-            int i;
-            qemu_log("  data: [size=%d]\n", data_size);
-            for (i = 0; i < data_size / sizeof(tcg_target_ulong); i++) {
-                if (sizeof(tcg_target_ulong) == 8) {
-                    qemu_log("0x%08" PRIxPTR ":  .quad  0x%016" TCG_PRIlx "\n",
-                             (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
-                } else if (sizeof(tcg_target_ulong) == 4) {
-                    qemu_log("0x%08" PRIxPTR ":  .long  0x%08" TCG_PRIlx "\n",
-                             (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
-                } else {
-                    qemu_build_not_reached();
+            /*
+             * Dump each instruction chunk, wrapping up empty chunks into
+             * the next instruction. The whole array is offset so the
+             * first entry is the beginning of the 2nd instruction.
+             */
+            while (insn < tb->icount) {
+                size_t chunk_end = tcg_ctx->gen_insn_end_off[insn];
+                if (chunk_end > chunk_start) {
+                    fprintf(logfile, "  -- guest addr 0x" TARGET_FMT_lx "\n",
+                            tcg_ctx->gen_insn_data[insn][0]);
+                    disas(logfile, tb->tc.ptr + chunk_start,
+                          chunk_end - chunk_start);
+                    chunk_start = chunk_end;
+                }
+                insn++;
+            }
+
+            if (chunk_start < code_size) {
+                fprintf(logfile, "  -- tb slow paths + alignment\n");
+                disas(logfile, tb->tc.ptr + chunk_start,
+                      code_size - chunk_start);
+            }
+
+            /* Finally dump any data we may have after the block */
+            if (data_size) {
+                int i;
+                fprintf(logfile, "  data: [size=%d]\n", data_size);
+                for (i = 0; i < data_size / sizeof(tcg_target_ulong); i++) {
+                    if (sizeof(tcg_target_ulong) == 8) {
+                        fprintf(logfile,
+                                "0x%08" PRIxPTR ":  .quad  0x%016" TCG_PRIlx "\n",
+                                (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
+                    } else if (sizeof(tcg_target_ulong) == 4) {
+                        fprintf(logfile,
+                                "0x%08" PRIxPTR ":  .long  0x%08" TCG_PRIlx "\n",
+                                (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
+                    } else {
+                        qemu_build_not_reached();
+                    }
                 }
             }
+            fprintf(logfile, "\n");
+            qemu_log_flush();
+            qemu_log_unlock(logfile);
         }
-        qemu_log("\n");
-        qemu_log_flush();
-        qemu_log_unlock(logfile);
     }
 #endif
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 1506755f3c..af8798f98b 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -140,10 +140,12 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(db->pc_first)) {
         FILE *logfile = qemu_log_trylock();
-        qemu_log("----------------\n");
-        ops->disas_log(db, cpu);
-        qemu_log("\n");
-        qemu_log_unlock(logfile);
+        if (logfile) {
+            fprintf(logfile, "----------------\n");
+            ops->disas_log(db, cpu);
+            fprintf(logfile, "\n");
+            qemu_log_unlock(logfile);
+        }
     }
 #endif
 }
diff --git a/cpu.c b/cpu.c
index ddcbfc724d..3340bb7538 100644
--- a/cpu.c
+++ b/cpu.c
@@ -401,12 +401,14 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
     if (qemu_log_separate()) {
         FILE *logfile = qemu_log_trylock();
-        qemu_log("qemu: fatal: ");
-        qemu_log_vprintf(fmt, ap2);
-        qemu_log("\n");
-        log_cpu_state(cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-        qemu_log_flush();
-        qemu_log_unlock(logfile);
+        if (logfile) {
+            fprintf(logfile, "qemu: fatal: ");
+            vfprintf(logfile, fmt, ap2);
+            fprintf(logfile, "\n");
+            cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
+            qemu_log_flush();
+            qemu_log_unlock(logfile);
+        }
         qemu_log_close();
     }
     va_end(ap2);
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 300313dfb8..23d634af6f 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -249,19 +249,21 @@ static void can_display_msg(const char *prefix, const qemu_can_frame *msg)
     int i;
     FILE *logfile = qemu_log_trylock();
 
-    qemu_log("%s%03X [%01d] %s %s",
-             prefix,
-             msg->can_id & QEMU_CAN_EFF_MASK,
-             msg->can_dlc,
-             msg->can_id & QEMU_CAN_EFF_FLAG ? "EFF" : "SFF",
-             msg->can_id & QEMU_CAN_RTR_FLAG ? "RTR" : "DAT");
+    if (logfile) {
+        fprintf(logfile, "%s%03X [%01d] %s %s",
+                prefix,
+                msg->can_id & QEMU_CAN_EFF_MASK,
+                msg->can_dlc,
+                msg->can_id & QEMU_CAN_EFF_FLAG ? "EFF" : "SFF",
+                msg->can_id & QEMU_CAN_RTR_FLAG ? "RTR" : "DAT");
 
-    for (i = 0; i < msg->can_dlc; i++) {
-        qemu_log(" %02X", msg->data[i]);
+        for (i = 0; i < msg->can_dlc; i++) {
+            fprintf(logfile, " %02X", msg->data[i]);
+        }
+        fprintf(logfile, "\n");
+        qemu_log_flush();
+        qemu_log_unlock(logfile);
     }
-    qemu_log("\n");
-    qemu_log_flush();
-    qemu_log_unlock(logfile);
 }
 
 static void buff2frame_pel(const uint8_t *buff, qemu_can_frame *frame)
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index 4a505643e9..a6388563c3 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -77,18 +77,21 @@ static void can_host_socketcan_display_msg(struct qemu_can_frame *msg)
 {
     int i;
     FILE *logfile = qemu_log_trylock();
-    qemu_log("[cansocketcan]: %03X [%01d] %s %s",
-             msg->can_id & QEMU_CAN_EFF_MASK,
-             msg->can_dlc,
-             msg->can_id & QEMU_CAN_EFF_FLAG ? "EFF" : "SFF",
-             msg->can_id & QEMU_CAN_RTR_FLAG ? "RTR" : "DAT");
 
-    for (i = 0; i < msg->can_dlc; i++) {
-        qemu_log(" %02X", msg->data[i]);
+    if (logfile) {
+        fprintf(logfile, "[cansocketcan]: %03X [%01d] %s %s",
+                msg->can_id & QEMU_CAN_EFF_MASK,
+                msg->can_dlc,
+                msg->can_id & QEMU_CAN_EFF_FLAG ? "EFF" : "SFF",
+                msg->can_id & QEMU_CAN_RTR_FLAG ? "RTR" : "DAT");
+
+        for (i = 0; i < msg->can_dlc; i++) {
+            fprintf(logfile, " %02X", msg->data[i]);
+        }
+        fprintf(logfile, "\n");
+        qemu_log_flush();
+        qemu_log_unlock(logfile);
     }
-    qemu_log("\n");
-    qemu_log_flush();
-    qemu_log_unlock(logfile);
 }
 
 static void can_host_socketcan_read(void *opaque)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 3fb8b530d8..d71bd2b0f4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2581,14 +2581,16 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
 
     if (qemu_loglevel_mask(LOG_UNIMP)) {
         FILE *logfile = qemu_log_trylock();
-        target_ulong pc = s->pc_start, end = s->pc;
+        if (logfile) {
+            target_ulong pc = s->pc_start, end = s->pc;
 
-        qemu_log("ILLOPC: " TARGET_FMT_lx ":", pc);
-        for (; pc < end; ++pc) {
-            qemu_log(" %02x", cpu_ldub_code(env, pc));
+            fprintf(logfile, "ILLOPC: " TARGET_FMT_lx ":", pc);
+            for (; pc < end; ++pc) {
+                fprintf(logfile, " %02x", cpu_ldub_code(env, pc));
+            }
+            fprintf(logfile, "\n");
+            qemu_log_unlock(logfile);
         }
-        qemu_log("\n");
-        qemu_log_unlock(logfile);
     }
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2f09114bf9..892f640fce 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -757,31 +757,35 @@ void tcg_prologue_init(TCGContext *s)
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
         FILE *logfile = qemu_log_trylock();
-        qemu_log("PROLOGUE: [size=%zu]\n", prologue_size);
-        if (s->data_gen_ptr) {
-            size_t code_size = s->data_gen_ptr - s->code_gen_ptr;
-            size_t data_size = prologue_size - code_size;
-            size_t i;
+        if (logfile) {
+            fprintf(logfile, "PROLOGUE: [size=%zu]\n", prologue_size);
+            if (s->data_gen_ptr) {
+                size_t code_size = s->data_gen_ptr - s->code_gen_ptr;
+                size_t data_size = prologue_size - code_size;
+                size_t i;
 
-            log_disas(s->code_gen_ptr, code_size);
+                disas(logfile, s->code_gen_ptr, code_size);
 
-            for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
-                if (sizeof(tcg_target_ulong) == 8) {
-                    qemu_log("0x%08" PRIxPTR ":  .quad  0x%016" PRIx64 "\n",
-                             (uintptr_t)s->data_gen_ptr + i,
-                             *(uint64_t *)(s->data_gen_ptr + i));
-                } else {
-                    qemu_log("0x%08" PRIxPTR ":  .long  0x%08x\n",
-                             (uintptr_t)s->data_gen_ptr + i,
-                             *(uint32_t *)(s->data_gen_ptr + i));
+                for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
+                    if (sizeof(tcg_target_ulong) == 8) {
+                        fprintf(logfile,
+                                "0x%08" PRIxPTR ":  .quad  0x%016" PRIx64 "\n",
+                                (uintptr_t)s->data_gen_ptr + i,
+                                *(uint64_t *)(s->data_gen_ptr + i));
+                    } else {
+                        fprintf(logfile,
+                                "0x%08" PRIxPTR ":  .long  0x%08x\n",
+                                (uintptr_t)s->data_gen_ptr + i,
+                                *(uint32_t *)(s->data_gen_ptr + i));
+                    }
                 }
+            } else {
+                disas(logfile, s->code_gen_ptr, prologue_size);
             }
-        } else {
-            log_disas(s->code_gen_ptr, prologue_size);
+            fprintf(logfile, "\n");
+            qemu_log_flush();
+            qemu_log_unlock(logfile);
         }
-        qemu_log("\n");
-        qemu_log_flush();
-        qemu_log_unlock(logfile);
     }
 #endif
 
@@ -4201,10 +4205,12 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
                  && qemu_log_in_addr_range(tb->pc))) {
         FILE *logfile = qemu_log_trylock();
-        qemu_log("OP:\n");
-        tcg_dump_ops(s, false);
-        qemu_log("\n");
-        qemu_log_unlock(logfile);
+        if (logfile) {
+            fprintf(logfile, "OP:\n");
+            tcg_dump_ops(s, false);
+            fprintf(logfile, "\n");
+            qemu_log_unlock(logfile);
+        }
     }
 #endif
 
@@ -4246,10 +4252,12 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_IND)
                      && qemu_log_in_addr_range(tb->pc))) {
             FILE *logfile = qemu_log_trylock();
-            qemu_log("OP before indirect lowering:\n");
-            tcg_dump_ops(s, false);
-            qemu_log("\n");
-            qemu_log_unlock(logfile);
+            if (logfile) {
+                fprintf(logfile, "OP before indirect lowering:\n");
+                tcg_dump_ops(s, false);
+                fprintf(logfile, "\n");
+                qemu_log_unlock(logfile);
+            }
         }
 #endif
         /* Replace indirect temps with direct temps.  */
@@ -4267,10 +4275,12 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
                  && qemu_log_in_addr_range(tb->pc))) {
         FILE *logfile = qemu_log_trylock();
-        qemu_log("OP after optimization and liveness analysis:\n");
-        tcg_dump_ops(s, true);
-        qemu_log("\n");
-        qemu_log_unlock(logfile);
+        if (logfile) {
+            fprintf(logfile, "OP after optimization and liveness analysis:\n");
+            tcg_dump_ops(s, true);
+            fprintf(logfile, "\n");
+            qemu_log_unlock(logfile);
+        }
     }
 #endif
 
-- 
2.25.1


