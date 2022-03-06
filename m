Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF14CEE6A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:23:13 +0100 (CET)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0DX-0007YJ-QU
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:23:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR091-0006eA-4j; Sun, 06 Mar 2022 18:18:32 -0500
Received: from [2a00:1450:4864:20::42c] (port=36805
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR08z-0007Mh-Eu; Sun, 06 Mar 2022 18:18:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r10so20674333wrp.3;
 Sun, 06 Mar 2022 15:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3oE10bEiyixc2uXJpKqOp4Nvl3FEz90xEnyLDQlRTXc=;
 b=nVRhgWmB8IrWpY15THJ0z3MEV3zW0LBSw3uaxXzKs4Q3wmELLNRe6mM4U3jkqYSYFx
 edP+jTisQ+3tUBD6JmM9yfCbSWabtETTyHYi2NuygCUrIXk09KA0cpLoS+Zn3aTED7iO
 sIJT+jShUrHc4nrg2bWEFVgBcquWx0qd1tvwM93Feq7PPaybeT3DJugi8Yn60bTBfL8D
 wdPl8h14PNEr91bnfjvDOBJewijowJD7z7VxKyovRB0GQVO8A3iKNgurFIxA/JGo+O/U
 yma4KKH1/nGPSGrkaJw8fAT80zHIvwnciZ4b6p4v7Sb9H8YiUz+C9qdSfIZLfBJqzl1t
 RZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3oE10bEiyixc2uXJpKqOp4Nvl3FEz90xEnyLDQlRTXc=;
 b=ZnpFtl+qdWu1M3u7qVATKDLa2niGxJZAjVZFuapJEAHDmQah+k7rFab0MdzpBA0Hpo
 jnh+HVWePxku4XsYxIf8lnL+wfxCilUX4v9saljovPOGV4r4AvFhhjt9bnwTm1yOx3qH
 fRF1QfxkLw3NJQiohXOW6fjkLfhvhg7R2Mt8OWHhgHEoApqLfhLQbOAQ8ksz2KpzD8aI
 l1cBvXbvcQzoKSZ1smhj8qaVKsK0VW/V/9Pgduh8+X62sPVLgn2R8G/dImYmwchM+tH6
 pkIO55OaVbtiApvySRhod/Kdv6OQJZECw70dabG6Q5XVLsXi/kzkoeLTkB4vSWA4NuxD
 3yJA==
X-Gm-Message-State: AOAM530FC2WusPXubdXZMl+kjGiLbBfOCUDqaVB0FKIh4d6mGCKM4CmO
 aQ1xVXNlVfLygH2QwY3sfKIIAt7g790=
X-Google-Smtp-Source: ABdhPJxMZRPHq5veC5HzibBDBbuHotZCVFrJGRpVHTzfyWyqmnRKR2syVb4qMYjnnwwY9Np0loYfdA==
X-Received: by 2002:a5d:6392:0:b0:1f0:651d:51ac with SMTP id
 p18-20020a5d6392000000b001f0651d51acmr6524203wru.253.1646608707758; 
 Sun, 06 Mar 2022 15:18:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm22191017wmq.40.2022.03.06.15.18.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/22] hvf: Fix OOB write in RDTSCP instruction decode
Date: Mon,  7 Mar 2022 00:17:37 +0100
Message-Id: <20220306231753.50277-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cameron Esfahani <dirty@apple.com>

A guest could craft a specific stream of instructions that will have QEMU
write 0xF9 to inappropriate locations in memory.  Add additional asserts
to check for this.  Generate a #UD if there are more than 14 prefix bytes.

Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>

Signed-off-by: Cameron Esfahani <dirty@apple.com>
Message-Id: <20220219063831.35356-1-dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86_decode.c | 12 ++++++++++--
 target/i386/hvf/x86hvf.c     |  8 ++++++++
 target/i386/hvf/x86hvf.h     |  1 +
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index 062713b1a4..5d051252b4 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -24,8 +24,10 @@
 #include "vmx.h"
 #include "x86_mmu.h"
 #include "x86_descr.h"
+#include "x86hvf.h"
 
 #define OPCODE_ESCAPE   0xf
+#define X86_MAX_INSN_PREFIX_LENGTH (14)
 
 static void decode_invalid(CPUX86State *env, struct x86_decode *decode)
 {
@@ -541,7 +543,8 @@ static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
     };
     decode->cmd = group[decode->modrm.reg];
     if (0xf9 == decode->modrm.modrm) {
-        decode->opcode[decode->len++] = decode->modrm.modrm;
+        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
+        decode->opcode[decode->opcode_len++] = decode->modrm.modrm;
         decode->cmd = X86_DECODE_CMD_RDTSCP;
     }
 }
@@ -1847,7 +1850,8 @@ void calc_modrm_operand(CPUX86State *env, struct x86_decode *decode,
 
 static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
 {
-    while (1) {
+    /* At most X86_MAX_INSN_PREFIX_LENGTH prefix bytes. */
+    for (int i = 0; i < X86_MAX_INSN_PREFIX_LENGTH; i++) {
         /*
          * REX prefix must come after legacy prefixes.
          * REX before legacy is ignored.
@@ -1892,6 +1896,8 @@ static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
             return;
         }
     }
+    /* Too many prefixes!  Generate #UD. */
+    hvf_inject_ud(env);
 }
 
 void set_addressing_size(CPUX86State *env, struct x86_decode *decode)
@@ -2090,11 +2096,13 @@ static void decode_opcodes(CPUX86State *env, struct x86_decode *decode)
     uint8_t opcode;
 
     opcode = decode_byte(env, decode);
+    VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
     decode->opcode[decode->opcode_len++] = opcode;
     if (opcode != OPCODE_ESCAPE) {
         decode_opcode_1(env, decode, opcode);
     } else {
         opcode = decode_byte(env, decode);
+        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
         decode->opcode[decode->opcode_len++] = opcode;
         decode_opcode_2(env, decode, opcode);
     }
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index bec9fc5814..a338c207b7 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -423,6 +423,14 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
             & (CPU_INTERRUPT_INIT | CPU_INTERRUPT_TPR));
 }
 
+void hvf_inject_ud(CPUX86State *env)
+{
+    env->exception_nr = EXCP06_ILLOP;
+    env->exception_injected = 1;
+    env->has_error_code = false;
+    env->error_code = 0;
+}
+
 int hvf_process_events(CPUState *cpu_state)
 {
     X86CPU *cpu = X86_CPU(cpu_state);
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index db6003d6bd..427cdc1c13 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -22,6 +22,7 @@
 
 int hvf_process_events(CPUState *);
 bool hvf_inject_interrupts(CPUState *);
+void hvf_inject_ud(CPUX86State *);
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
 void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
-- 
2.34.1


