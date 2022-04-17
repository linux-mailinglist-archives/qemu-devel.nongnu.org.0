Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC45504922
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:01:25 +0200 (CEST)
Received: from localhost ([::1]:46716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA9D-0002PE-RP
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fQ-0000R1-3j
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fN-0001kr-4J
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:35 -0400
Received: by mail-pg1-x534.google.com with SMTP id t4so15089592pgc.1
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JxdrupjedL7TusPBC2C5rWsyl7C1sZI9UtLEc+dbxkM=;
 b=QCKIc7lGLF2LVMIYMXgTbm555GefAfFA8gNu2x57GTjGEBuyseL33/t74m3c30GhYT
 vjJiwmLAjiddCB+4bxY+2NKs3UAAcc2PAP+E/hByqS5x3uWygFUs3GL70QbTTbGNHL0r
 i2NjV3bzyouNstVj3RUMb5kyx29bvdrCDk1MjC52ivm81Vm6pVKXOGlrN0mG9cfZB4k8
 lzjpgEnbZn0sHcYRK65OpIIL6Xo1wRSkt08DadJEqtivXNdEt+qrXhWzuX0sboS++nHX
 UTSzEe6tM2IuSltTKsXNNftP1Ki9ESTtgxNmmgfuE6W0cYZkPqYdeTj3Z4LeysdnC3fc
 WdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JxdrupjedL7TusPBC2C5rWsyl7C1sZI9UtLEc+dbxkM=;
 b=7MyO018pG75VhGmmHw+TT1qEdQZ0/sRqP41p/rjeJ0OUFiLJw8xWuYYtqzg/t0aNRx
 82cWZGPh/gcfryBLi31IjcQEDNsOtT4OQTks4AIxgpJNrOqbI2Edo70ifXOnW9X3GNmN
 lR656iWG2U2+tf8ROQbZQBgQ+Q1c2ulMfOoHcCLEnWu3aLtR9CK39lV5tcRlHzs8/CxG
 bfIi/3r2JvEiaI42hKVIXyVe9bVUm1Q1buWdKBICjUDemgMvP9c1oT3Oa6FUb2n/FHHi
 JPy2m3/lLPTHsVdtKS2YfhZFCJNfWP40/NHlOxO7V3is0pzIy+k31HImGbjobDgJUfd9
 vM2w==
X-Gm-Message-State: AOAM532iUZJPu7sUobrkr2ur+iBCgW0k8IGnzP5ugr6sm2orJcFaXXKN
 D5P2lonXpBGzClx4c38oi048xlnbe79bCA==
X-Google-Smtp-Source: ABdhPJzorc/STDkmT9/B1edOSFVX940urK8QR2LwcTrdZwkXTAfZ0UwYU3OlPisZ2RQc+S2wJ2tjUg==
X-Received: by 2002:a63:78c3:0:b0:398:2d6d:c275 with SMTP id
 t186-20020a6378c3000000b003982d6dc275mr7177840pgc.565.1650220230627; 
 Sun, 17 Apr 2022 11:30:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/39] exec/translator: Pass the locked filepointer to
 disas_log hook
Date: Sun, 17 Apr 2022 11:29:52 -0700
Message-Id: <20220417183019.755276-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

We have fetched and locked the logfile in translator_loop.
Pass the filepointer down to the disas_log hook so that it
need not be fetched and locked again.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h     |  2 +-
 accel/tcg/translator.c        |  2 +-
 target/alpha/translate.c      |  7 ++++---
 target/arm/translate-a64.c    |  6 +++---
 target/arm/translate.c        |  7 ++++---
 target/avr/translate.c        |  7 ++++---
 target/cris/translate.c       |  7 ++++---
 target/hexagon/translate.c    |  7 ++++---
 target/hppa/translate.c       | 15 ++++++++-------
 target/i386/tcg/translate.c   |  6 +++---
 target/m68k/translate.c       |  7 ++++---
 target/microblaze/translate.c |  7 ++++---
 target/mips/tcg/translate.c   |  7 ++++---
 target/nios2/translate.c      |  7 ++++---
 target/openrisc/translate.c   |  7 ++++---
 target/ppc/translate.c        |  7 ++++---
 target/riscv/translate.c      | 10 ++++++----
 target/rx/translate.c         |  7 ++++---
 target/s390x/tcg/translate.c  | 11 ++++++-----
 target/sh4/translate.c        |  7 ++++---
 target/sparc/translate.c      |  7 ++++---
 target/tricore/translate.c    |  7 ++++---
 target/xtensa/translate.c     |  7 ++++---
 23 files changed, 92 insertions(+), 72 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 9bc46eda59..31d3fa76ff 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -118,7 +118,7 @@ typedef struct TranslatorOps {
     void (*insn_start)(DisasContextBase *db, CPUState *cpu);
     void (*translate_insn)(DisasContextBase *db, CPUState *cpu);
     void (*tb_stop)(DisasContextBase *db, CPUState *cpu);
-    void (*disas_log)(const DisasContextBase *db, CPUState *cpu);
+    void (*disas_log)(const DisasContextBase *db, CPUState *cpu, FILE *f);
 } TranslatorOps;
 
 /**
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index af8798f98b..fe7af9b943 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -142,7 +142,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "----------------\n");
-            ops->disas_log(db, cpu);
+            ops->disas_log(db, cpu, logfile);
             fprintf(logfile, "\n");
             qemu_log_unlock(logfile);
         }
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 66768ab47a..b1f78cff53 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -3027,10 +3027,11 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void alpha_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void alpha_tr_disas_log(const DisasContextBase *dcbase,
+                               CPUState *cpu, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps alpha_tr_ops = {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9333d7be41..19c09c3b53 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14967,12 +14967,12 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 }
 
 static void aarch64_tr_disas_log(const DisasContextBase *dcbase,
-                                      CPUState *cpu)
+                                 CPUState *cpu, FILE *logfile)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-    log_target_disas(cpu, dc->base.pc_first, dc->base.tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dc->base.pc_first));
+    target_disas(logfile, cpu, dc->base.pc_first, dc->base.tb->size);
 }
 
 const TranslatorOps aarch64_translator_ops = {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bf2196b9e2..783a43b4ae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9891,12 +9891,13 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void arm_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void arm_tr_disas_log(const DisasContextBase *dcbase,
+                             CPUState *cpu, FILE *logfile)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-    log_target_disas(cpu, dc->base.pc_first, dc->base.tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dc->base.pc_first));
+    target_disas(logfile, cpu, dc->base.pc_first, dc->base.tb->size);
 }
 
 static const TranslatorOps arm_translator_ops = {
diff --git a/target/avr/translate.c b/target/avr/translate.c
index af8a3e0f9c..dc9c3d6bcc 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -3015,10 +3015,11 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void avr_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void avr_tr_disas_log(const DisasContextBase *dcbase,
+                             CPUState *cs, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cs, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps avr_tr_ops = {
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 3656cd6db1..ac101344a3 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3268,11 +3268,12 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void cris_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void cris_tr_disas_log(const DisasContextBase *dcbase,
+                              CPUState *cpu, FILE *logfile)
 {
     if (!DISAS_CRIS) {
-        qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-        log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+        fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+        target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
     }
 }
 
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 98f1452cad..d4fc92f7e9 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -833,10 +833,11 @@ static void hexagon_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void hexagon_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void hexagon_tr_disas_log(const DisasContextBase *dcbase,
+                                 CPUState *cpu, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 5c0b1eb274..c24d3ce3b8 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4305,29 +4305,30 @@ static void hppa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void hppa_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void hppa_tr_disas_log(const DisasContextBase *dcbase,
+                              CPUState *cs, FILE *logfile)
 {
     target_ulong pc = dcbase->pc_first;
 
 #ifdef CONFIG_USER_ONLY
     switch (pc) {
     case 0x00:
-        qemu_log("IN:\n0x00000000:  (null)\n");
+        fprintf(logfile, "IN:\n0x00000000:  (null)\n");
         return;
     case 0xb0:
-        qemu_log("IN:\n0x000000b0:  light-weight-syscall\n");
+        fprintf(logfile, "IN:\n0x000000b0:  light-weight-syscall\n");
         return;
     case 0xe0:
-        qemu_log("IN:\n0x000000e0:  set-thread-pointer-syscall\n");
+        fprintf(logfile, "IN:\n0x000000e0:  set-thread-pointer-syscall\n");
         return;
     case 0x100:
-        qemu_log("IN:\n0x00000100:  syscall\n");
+        fprintf(logfile, "IN:\n0x00000100:  syscall\n");
         return;
     }
 #endif
 
-    qemu_log("IN: %s\n", lookup_symbol(pc));
-    log_target_disas(cs, pc, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(pc));
+    target_disas(logfile, cs, pc, dcbase->tb->size);
 }
 
 static const TranslatorOps hppa_tr_ops = {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d71bd2b0f4..4659a212b2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8690,12 +8690,12 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 }
 
 static void i386_tr_disas_log(const DisasContextBase *dcbase,
-                              CPUState *cpu)
+                              CPUState *cpu, FILE *logfile)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-    log_target_disas(cpu, dc->base.pc_first, dc->base.tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dc->base.pc_first));
+    target_disas(logfile, cpu, dc->base.pc_first, dc->base.tb->size);
 }
 
 static const TranslatorOps i386_tr_ops = {
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index af43c8eab8..4026572ed8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6257,10 +6257,11 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void m68k_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void m68k_tr_disas_log(const DisasContextBase *dcbase,
+                              CPUState *cpu, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps m68k_tr_ops = {
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 2561b904b9..bf01384d33 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1833,10 +1833,11 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
     }
 }
 
-static void mb_tr_disas_log(const DisasContextBase *dcb, CPUState *cs)
+static void mb_tr_disas_log(const DisasContextBase *dcb,
+                            CPUState *cs, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcb->pc_first));
-    log_target_disas(cs, dcb->pc_first, dcb->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcb->pc_first));
+    target_disas(logfile, cs, dcb->pc_first, dcb->tb->size);
 }
 
 static const TranslatorOps mb_tr_ops = {
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index b82a7ec6ad..6de5b66650 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16141,10 +16141,11 @@ static void mips_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void mips_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void mips_tr_disas_log(const DisasContextBase *dcbase,
+                              CPUState *cs, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cs, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps mips_tr_ops = {
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f89271dbed..89b97ef520 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -833,10 +833,11 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void nios2_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void nios2_tr_disas_log(const DisasContextBase *dcbase,
+                               CPUState *cpu, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps nios2_tr_ops = {
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index ca79e609da..7b8ad43d5f 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1687,12 +1687,13 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void openrisc_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void openrisc_tr_disas_log(const DisasContextBase *dcbase,
+                                  CPUState *cs, FILE *logfile)
 {
     DisasContext *s = container_of(dcbase, DisasContext, base);
 
-    qemu_log("IN: %s\n", lookup_symbol(s->base.pc_first));
-    log_target_disas(cs, s->base.pc_first, s->base.tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(s->base.pc_first));
+    target_disas(logfile, cs, s->base.pc_first, s->base.tb->size);
 }
 
 static const TranslatorOps openrisc_tr_ops = {
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 408ae26173..e0c9f74da4 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7769,10 +7769,11 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void ppc_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void ppc_tr_disas_log(const DisasContextBase *dcbase,
+                             CPUState *cs, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cs, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps ppc_tr_ops = {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fac998a6b5..6495726302 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1155,18 +1155,20 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void riscv_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void riscv_tr_disas_log(const DisasContextBase *dcbase,
+                               CPUState *cpu, FILE *logfile)
 {
 #ifndef CONFIG_USER_ONLY
     RISCVCPU *rvcpu = RISCV_CPU(cpu);
     CPURISCVState *env = &rvcpu->env;
 #endif
 
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
 #ifndef CONFIG_USER_ONLY
-    qemu_log("Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n", env->priv, env->virt);
+    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n",
+            env->priv, env->virt);
 #endif
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps riscv_tr_ops = {
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 5db8f79a82..c8a8991a63 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2342,10 +2342,11 @@ static void rx_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void rx_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void rx_tr_disas_log(const DisasContextBase *dcbase,
+                            CPUState *cs, FILE *logfile)
 {
-    qemu_log("IN:\n");  /* , lookup_symbol(dcbase->pc_first)); */
-    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cs, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps rx_tr_ops = {
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 5acfc0ff9b..1e7f470c4b 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6660,16 +6660,17 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void s390x_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void s390x_tr_disas_log(const DisasContextBase *dcbase,
+                               CPUState *cs, FILE *logfile)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (unlikely(dc->ex_value)) {
-        /* ??? Unfortunately log_target_disas can't use host memory.  */
-        qemu_log("IN: EXECUTE %016" PRIx64, dc->ex_value);
+        /* ??? Unfortunately target_disas can't use host memory.  */
+        fprintf(logfile, "IN: EXECUTE %016" PRIx64, dc->ex_value);
     } else {
-        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-        log_target_disas(cs, dc->base.pc_first, dc->base.tb->size);
+        fprintf(logfile, "IN: %s\n", lookup_symbol(dc->base.pc_first));
+        target_disas(logfile, cs, dc->base.pc_first, dc->base.tb->size);
     }
 }
 
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 43bc88b7b3..f1b190e7cf 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2352,10 +2352,11 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void sh4_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+static void sh4_tr_disas_log(const DisasContextBase *dcbase,
+                             CPUState *cs, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cs, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps sh4_tr_ops = {
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 4c7c7b5347..2e28222d31 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5901,10 +5901,11 @@ static void sparc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     }
 }
 
-static void sparc_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void sparc_tr_disas_log(const DisasContextBase *dcbase,
+                               CPUState *cpu, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps sparc_tr_ops = {
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 417edbd3f0..d170500fa5 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8861,10 +8861,11 @@ static void tricore_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void tricore_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void tricore_tr_disas_log(const DisasContextBase *dcbase,
+                                 CPUState *cpu, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps tricore_tr_ops = {
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b1491ed625..a9e69c4153 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1296,10 +1296,11 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
-static void xtensa_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+static void xtensa_tr_disas_log(const DisasContextBase *dcbase,
+                                CPUState *cpu, FILE *logfile)
 {
-    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
-    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
 
 static const TranslatorOps xtensa_translator_ops = {
-- 
2.25.1


