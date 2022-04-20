Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF12E508F28
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:12:01 +0200 (CEST)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEo4-0006vK-V4
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEik-0005Ko-Am
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:30 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEii-0001BZ-6o
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:29 -0400
Received: by mail-pg1-x531.google.com with SMTP id r83so2340661pgr.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D1crAV8qM3lUOm/60yk2vLKxM13f73TQkwkg3i3emao=;
 b=iuDHN92OkRmc8Dl3VHjD67nffHtpdQwDu8XnupGugZND+IeQFrEKgsRonfJp5vMNdn
 tKTb0SWFbxthpZ9pAWPPK5K+cVtDkpazkVJva9EF7fdcWPCbj/bAQj34UzXhA9nEkEg3
 SDNe0mAXDMC6ghynfofrDRXd9UNpI/FqYNLZal8G1wxnEMcNryooISzpQtCEgLcEA1nt
 ktVp7Sac2MFItqY0M/yEG4EP9IY7lWNLNAkUVAdi8tlDPk5a2J6hWDZrze21Ht9kN2oN
 XRMbIccWRrmW3qxQ+sUyaLWdLRBDCsT1hYWCbWYR+1cLzkCBOCiRCLVGTpO0o62dsG5L
 2aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D1crAV8qM3lUOm/60yk2vLKxM13f73TQkwkg3i3emao=;
 b=cBGtmImnp3QoI/ic1RUrnhDKzXjBzAypastulssfwr1sA2t2tnbk8eWm5fKBMdFBd3
 8u7CDYfG75U3892ev6WNy8PYOODWF+Iromydu22FS/roxYDVJRTfhYDjW8vNhEq154fK
 X7EINr+sAlQKx6JAMUXvoIxCcVyfIT6foz82kMiuJLIDKnHJAzzzG+eAIdL4RAFf3BZD
 WAgSKMZRyieKhsNx27rornOmN4SphcVw+wgJofDdg1RswFgWFr1umQui3Qq8Fk/TuBfA
 1AHeYgsCuQvyQJZm6fS+/VO2aFXqkqSF4qm9urqW7v5MhRxK3uM3XxOY5eJcJ98RB4UY
 Jddw==
X-Gm-Message-State: AOAM532pcugov9Z5JYpxc6ViVE1SZDH67AddbXAISWZt+evz8PW46jKI
 8Epwz3OseUQTjHV2weYQ97hny173CHCmpQ==
X-Google-Smtp-Source: ABdhPJyMU49/J+yDq/ZcvTs8W5TMgz5Z+vfMfsgFKIXlD95DMmKWP35fdZv0MbLcZTW5n/En/IZrew==
X-Received: by 2002:a05:6a02:18b:b0:399:365e:f09c with SMTP id
 bj11-20020a056a02018b00b00399365ef09cmr20716002pgb.238.1650477986730; 
 Wed, 20 Apr 2022 11:06:26 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/39] util/log: Rename qemu_log_lock to qemu_log_trylock
Date: Wed, 20 Apr 2022 11:05:46 -0700
Message-Id: <20220420180618.1183855-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function can fail, which makes it more like ftrylockfile
or pthread_mutex_trylock than flockfile or pthread_mutex_lock,
so rename it.

To closer match the other trylock functions, release rcu_read_lock
along the failure path, so that qemu_log_unlock need not be called
on failure.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-8-richard.henderson@linaro.org>
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
index 083ada76b1..f61b056571 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -214,7 +214,7 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 
 #if defined(DEBUG_DISAS)
         if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
-            FILE *logfile = qemu_log_lock();
+            FILE *logfile = qemu_log_trylock();
             int flags = 0;
 
             if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index a6e03c1e50..5937d6b7b2 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1527,7 +1527,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
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
index 0fef70e18e..9db144761d 100644
--- a/cpu.c
+++ b/cpu.c
@@ -399,7 +399,7 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
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
index 3ba1c99fff..f3cffee520 100644
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
index f8542529d0..abe4ef7799 100644
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
index d071400ebc..4c595356ae 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -162,7 +162,7 @@ static void test_logfile_lock(gconstpointer data)
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
2.34.1


