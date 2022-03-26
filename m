Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C364E8124
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:42:28 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6gV-0007b7-IM
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:42:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QZ-0007CY-49
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:59 -0400
Received: from [2607:f8b0:4864:20::234] (port=42682
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QX-0005Mo-5L
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:58 -0400
Received: by mail-oi1-x234.google.com with SMTP id q189so11067733oia.9
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jb3sLSwq3e8jLhUS1JuAKUAWnlmxlh9RM1IiT7+4r04=;
 b=UYUABIR1WCbJya7H4gjzz5qs6UGZVliImq9dTHUYUJYaFBTkxJ6qK+c4LaEeVLSs2u
 BcZgnBBvtd+emJGrTw3N6RDB6E2rrE39r7ltI3oOq9AI45JEe5FrsAbQkxeoHoafU/yz
 4pW4xZEfwro/I+yOEmdTwF6HrXevdxbUYa6YErwYL+nLUXJKFy8EByJJaUIYg5ymoEGA
 aXC/hfmYAI7pUyg8yxB1eS+6PYpNxyNn7kSXgIQ7et7tRLz6zvojrRjFLZa0USaoIIFv
 GNPaUU2b66wmkGLT5Ic0zljfCzL1yrbG/iaHqm66EvofxB12+FfXX+QXgaoijV1oSqyk
 v3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jb3sLSwq3e8jLhUS1JuAKUAWnlmxlh9RM1IiT7+4r04=;
 b=AfhD6xewR2vGX7fnLWi+/shz+ijxF5bXYyBeWCoyaljEEfxO5SQH+1tKCxHNN62AVS
 M6Kb+dKUWtMj6VXa7gR1oKRPLGPv/Zve8rNjTztaRtiDpiYbLGt7rz58VorkeqLw4Me+
 DqRhAkuaT2kHjeb2/0DNY+H8Ol8rthp/5x3lAypnRqVbFT53T2oahXVa+1Xcc3eDQWiQ
 dTKoRuC5Q87v9i9ZFgMmJVqXHBMo75Jgi1A8aTZ5L4AFNWpYXbujpwxZH3xgLS0Hyb19
 b61duvd1dnxSkJC+s5Eosf5ttkMP3R54lyk9TnAJ04wcmbUVkqAinsc3is+r4EgsBjtT
 7nMQ==
X-Gm-Message-State: AOAM530fScCeeuMbYQrZIJ8z24WMSVOJqeuCWyP53McC+L7c4V3Tayg4
 4i5uny9pSCWSGDlN4/7Sp2NDpMpyXtiuR/zA
X-Google-Smtp-Source: ABdhPJwV9oYLO3FqRgcPekKVQeaSImaRwcTBdcDjY+6TJUx3LOptCk4uupJ8MnP2aowx7G0jgbw9Ig==
X-Received: by 2002:a05:6808:302b:b0:2cb:2fea:cf9 with SMTP id
 ay43-20020a056808302b00b002cb2fea0cf9mr7920832oib.117.1648301156109; 
 Sat, 26 Mar 2022 06:25:56 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/39] util/log: Rename qemu_log_lock to qemu_log_trylock
Date: Sat, 26 Mar 2022 07:25:01 -0600
Message-Id: <20220326132534.543738-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function can fail, which makes it more like ftrylockfile
or pthread_mutex_trylock than flockfile or pthread_mutex_lock,
so rename it.

To closer match the other trylock functions, release rcu_read_lock
along the failure path, so that qemu_log_unlock need not be called
on failure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Rename the function as well as change the semantics, so drop r-b.
---
 include/exec/log.h          | 2 +-
 include/qemu/log.h          | 2 +-
 accel/tcg/cpu-exec.c        | 2 +-
 accel/tcg/translate-all.c   | 2 +-
 accel/tcg/translator.c      | 2 +-
 cpu.c                       | 2 +-
 hw/net/can/can_sja1000.c    | 2 +-
 net/can/can_socketcan.c     | 2 +-
 target/i386/tcg/translate.c | 2 +-
 tcg/tcg.c                   | 8 ++++----
 tests/unit/test-logging.c   | 2 +-
 util/log.c                  | 6 ++++--
 12 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index 3c7fa65ead..fb595d1eb7 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -71,7 +71,7 @@ static inline void log_disas(const void *code, unsigned long size)
 /* page_dump() output to the log file: */
 static inline void log_page_dump(const char *operation)
 {
-    FILE *logfile = qemu_log_lock();
+    FILE *logfile = qemu_log_trylock();
     if (logfile) {
         qemu_log("page layout changed following %s\n", operation);
         page_dump(logfile);
diff --git a/include/qemu/log.h b/include/qemu/log.h
index 6a6b1efce5..d090faf22a 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -67,7 +67,7 @@ static inline bool qemu_log_separate(void)
 
 /* Lock/unlock output. */
 
-FILE *qemu_log_lock(void);
+FILE *qemu_log_trylock(void);
 void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c997c2e8e0..8d0315de75 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -215,7 +215,7 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 
 #if defined(DEBUG_DISAS)
         if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
-            FILE *logfile = qemu_log_lock();
+            FILE *logfile = qemu_log_trylock();
             int flags = 0;
 
             if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5971cd53ab..71ab863c18 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1528,7 +1528,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
         qemu_log_in_addr_range(tb->pc)) {
-        FILE *logfile = qemu_log_lock();
+        FILE *logfile = qemu_log_trylock();
         int code_size, data_size;
         const tcg_target_ulong *rx_data_gen_ptr;
         size_t chunk_start;
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index f06c314266..1506755f3c 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -139,7 +139,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(db->pc_first)) {
-        FILE *logfile = qemu_log_lock();
+        FILE *logfile = qemu_log_trylock();
         qemu_log("----------------\n");
         ops->disas_log(db, cpu);
         qemu_log("\n");
diff --git a/cpu.c b/cpu.c
index be1f8b074c..ddcbfc724d 100644
--- a/cpu.c
+++ b/cpu.c
@@ -400,7 +400,7 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     fprintf(stderr, "\n");
     cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
     if (qemu_log_separate()) {
-        FILE *logfile = qemu_log_lock();
+        FILE *logfile = qemu_log_trylock();
         qemu_log("qemu: fatal: ");
         qemu_log_vprintf(fmt, ap2);
         qemu_log("\n");
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 3ba803e947..300313dfb8 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -247,7 +247,7 @@ int can_sja_accept_filter(CanSJA1000State *s,
 static void can_display_msg(const char *prefix, const qemu_can_frame *msg)
 {
     int i;
-    FILE *logfile = qemu_log_lock();
+    FILE *logfile = qemu_log_trylock();
 
     qemu_log("%s%03X [%01d] %s %s",
              prefix,
diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
index 4b68f60c6b..4a505643e9 100644
--- a/net/can/can_socketcan.c
+++ b/net/can/can_socketcan.c
@@ -76,7 +76,7 @@ QEMU_BUILD_BUG_ON(offsetof(qemu_can_frame, data)
 static void can_host_socketcan_display_msg(struct qemu_can_frame *msg)
 {
     int i;
-    FILE *logfile = qemu_log_lock();
+    FILE *logfile = qemu_log_trylock();
     qemu_log("[cansocketcan]: %03X [%01d] %s %s",
              msg->can_id & QEMU_CAN_EFF_MASK,
              msg->can_dlc,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c393913fe0..3fb8b530d8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2580,7 +2580,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
     gen_illegal_opcode(s);
 
     if (qemu_loglevel_mask(LOG_UNIMP)) {
-        FILE *logfile = qemu_log_lock();
+        FILE *logfile = qemu_log_trylock();
         target_ulong pc = s->pc_start, end = s->pc;
 
         qemu_log("ILLOPC: " TARGET_FMT_lx ":", pc);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 33a97eabdb..2f09114bf9 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -756,7 +756,7 @@ void tcg_prologue_init(TCGContext *s)
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
-        FILE *logfile = qemu_log_lock();
+        FILE *logfile = qemu_log_trylock();
         qemu_log("PROLOGUE: [size=%zu]\n", prologue_size);
         if (s->data_gen_ptr) {
             size_t code_size = s->data_gen_ptr - s->code_gen_ptr;
@@ -4200,7 +4200,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
                  && qemu_log_in_addr_range(tb->pc))) {
-        FILE *logfile = qemu_log_lock();
+        FILE *logfile = qemu_log_trylock();
         qemu_log("OP:\n");
         tcg_dump_ops(s, false);
         qemu_log("\n");
@@ -4245,7 +4245,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 #ifdef DEBUG_DISAS
         if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_IND)
                      && qemu_log_in_addr_range(tb->pc))) {
-            FILE *logfile = qemu_log_lock();
+            FILE *logfile = qemu_log_trylock();
             qemu_log("OP before indirect lowering:\n");
             tcg_dump_ops(s, false);
             qemu_log("\n");
@@ -4266,7 +4266,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
                  && qemu_log_in_addr_range(tb->pc))) {
-        FILE *logfile = qemu_log_lock();
+        FILE *logfile = qemu_log_trylock();
         qemu_log("OP after optimization and liveness analysis:\n");
         tcg_dump_ops(s, true);
         qemu_log("\n");
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index 93c6d666e8..54d7e8e33b 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -163,7 +163,7 @@ static void test_logfile_lock(gconstpointer data)
      * our handle remains valid for use due to RCU.
      */
     qemu_set_log_filename(file_path, &error_abort);
-    logfile = qemu_log_lock();
+    logfile = qemu_log_trylock();
     g_assert(logfile);
     fprintf(logfile, "%s 1st write to file\n", __func__);
     fflush(logfile);
diff --git a/util/log.c b/util/log.c
index 1a3121610a..6b7b358573 100644
--- a/util/log.c
+++ b/util/log.c
@@ -36,15 +36,17 @@ static GArray *debug_regions;
 
 /* Lock/unlock output. */
 
-FILE *qemu_log_lock(void)
+FILE *qemu_log_trylock(void)
 {
     QemuLogFile *logfile;
+
     rcu_read_lock();
     logfile = qatomic_rcu_read(&qemu_logfile);
     if (logfile) {
         qemu_flockfile(logfile->fd);
         return logfile->fd;
     } else {
+        rcu_read_unlock();
         return NULL;
     }
 }
@@ -53,8 +55,8 @@ void qemu_log_unlock(FILE *fd)
 {
     if (fd) {
         qemu_funlockfile(fd);
+        rcu_read_unlock();
     }
-    rcu_read_unlock();
 }
 
 /* Return the number of characters emitted.  */
-- 
2.25.1


