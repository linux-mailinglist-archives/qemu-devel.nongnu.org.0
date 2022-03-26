Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392694E8128
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:48:12 +0100 (CET)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6m3-000555-1m
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:48:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qt-0007V8-5D
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:22 -0400
Received: from [2001:4860:4864:20::2a] (port=42179
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qm-0005O6-3p
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:14 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso10716476fac.9
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=srb8zYnrls4BFF2+J2DHCJQ2uN96wtiF9F7er96M9hY=;
 b=FX1UT3paPQJP0shwoIwQJ8m+73l3C5Deh02NEOi5L2qAXv4ozTmaj4w1H2j05uNpAa
 EaGl5Rq/uLyjylw60X2rW2mTIggrX322x3J23Khs//Nb0Zhcnv4M6+ETCKR3TkNT9Dok
 hYUaWRJwrIiaPt1Es0usxiMmNRuTbd+jRSQvUSht+bpkqGJQzNd1TqyoM7xPFRAS8aZ7
 1G3Qbct256VW8hA1bwudExbvS7/4dlQAAglQRfpOp1LbeGe8j2L5Tbs6EjurnDT74xgw
 8JbrkYaBjjcnkfYOAcRuHUlsRvE5xAXxbJYJxiSBFkIuf2m3lj6L5iT2I4m3GZPJ/aSl
 e32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=srb8zYnrls4BFF2+J2DHCJQ2uN96wtiF9F7er96M9hY=;
 b=z5JgtPunT+JyE+6f0p+2NPZaf+4kbHyZSpe2m+5UcvARvnDuxUVZnbcDk7xC1hnFMV
 53TqvX1FIltTrx8UOyZp2EvWEiV1f4WoVGL83PzGBLk81Nuz+7sa/K96YQ+FK3SzqD8V
 KvODFF+irBdJXNUBpBuPUHXpMAM09ji8H+bOpptmpRT2shXY7AEL3QwsQnchL64PDTjO
 Ju+XV48z63mWnF/WgvFAW2x5yWTzhas6JFaOTOxjs3I6WzGdYHo3oAb7nlZQOLIdfZpb
 mZxuGquAIZe9VUqCmQX9HeAxSv/L5otwsGrg8DBs8wqR5uQ725QfcTpersrZil71hqGo
 fRcQ==
X-Gm-Message-State: AOAM532URR9bvBZpSrHNq+9Kno/i8mdjmGyxwTtYMu1vpIVvj0OgDhVY
 jKIOtaWTPhJubHAmrGG6sClsJS5Zoud8I5cS
X-Google-Smtp-Source: ABdhPJyok8pXOCl2ssKSYnjfHgS2q37dh9h4E7stWDd8Z8tociWw8JNqjhw+N1OuBl/VDgbYmaet6A==
X-Received: by 2002:a05:6870:4688:b0:dd:b535:f9c1 with SMTP id
 a8-20020a056870468800b000ddb535f9c1mr11291065oap.37.1648301164315; 
 Sat, 26 Mar 2022 06:26:04 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/39] exec/translator: Pass the locked filepointer to
 disas_log hook
Date: Sat, 26 Mar 2022 07:25:07 -0600
Message-Id: <20220326132534.543738-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index d1a59fad9c..87ae8b7571 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14962,12 +14962,12 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


