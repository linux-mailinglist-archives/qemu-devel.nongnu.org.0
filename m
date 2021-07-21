Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804E3D17F0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:29:27 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IqM-0005rd-5K
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOP-00031a-CN
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOK-0005vE-CR
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:33 -0400
Received: by mail-pl1-x62e.google.com with SMTP id q13so721318plx.7
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKfL9kcE9bZaAS1wP7b8UNPiK9t3sVn3RcrRasY3aLw=;
 b=hvhnNmV4+jjMyuhtuHvPUAq25townmD4SgweCj20USzmdwXqEg4FhhBFKXlU8vcn7p
 fMgPk09SE51Lzacoc/vgYMHCg+5imEnnHxKcesTklka3smzScSQXY7btbCp2mRpxZa2l
 RA41KNViCcWqWkWizJtOc6BaElMcmMFY4yZOHr8//5bpokuc4ay32aZ2wjigrehMpLWt
 JE2fzMOzldckv805G8ty644Wk84+YwA9RDagOCMXtHjG/gngvoUICAI6CEeaMzoYP7Xm
 7WMe7KZBCe1o13ACz5P94SLmbJUl4YVGiGussYQA6niBvfuuuE5DIi+mOkpqkMuVEiNC
 /mPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKfL9kcE9bZaAS1wP7b8UNPiK9t3sVn3RcrRasY3aLw=;
 b=Vi2zFuTAs4kgTeWMgUPI+ZIn7R2N8X37605PRIKjUy7zfTrH6a2/d3BJ0r08M4m4fF
 pR2JQ3tbRccVWKNS43kSboL+2Z1Nb0KXt27SnAKznVdID3fc2bo0HNxRQFkaW/xxtDT2
 ydXtL8LHcRsBFw0gF91aA3ELCfOJZFG80Z60bTtNEuMHf0FwAfoUmUaewdFKSjNbO+tc
 UZKG21zi2pyiwHaeo0eMGzPNrfg8KHtoZMCw55vc59bqGCv1e69zA83CT52nVNgQlWZb
 jh59iqp97pqxVJRoBx2u2MvJaZmnK1xFdDh0ScKI8zbmXcvadJVbG+mv4/Wv9PSSVyv0
 +xag==
X-Gm-Message-State: AOAM530TS5yqUxI56a/KMv4VKDx1Eiq69DETYJQ9f2ReCyMCo5EKAmJn
 ewL+sQEPPXMm2owrL7sRIXZd7wUE65BYAg==
X-Google-Smtp-Source: ABdhPJzrhLsotIvFCBSFxbQmJ4TKGK1cCwr7xpOCiNHEd8jqJvZu69PNIdZfAkhZEsUnyX9BKMmz2A==
X-Received: by 2002:aa7:980d:0:b029:32e:2373:cd63 with SMTP id
 e13-20020aa7980d0000b029032e2373cd63mr38092358pfl.51.1626897626849; 
 Wed, 21 Jul 2021 13:00:26 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/27] target/avr: Implement gdb_adjust_breakpoint
Date: Wed, 21 Jul 2021 09:59:49 -1000
Message-Id: <20210721195954.879535-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure at registration that all breakpoints are in
code space, not data space.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu.h       |  1 +
 target/avr/cpu.c       |  1 +
 target/avr/gdbstub.c   | 13 +++++++++++++
 target/avr/translate.c | 14 --------------
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index d148e8c75a..93e3faa0a9 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -162,6 +162,7 @@ hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_print_insn(bfd_vma addr, disassemble_info *info);
+vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
 static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
 {
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 57e3fab4a0..ea14175ca5 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -223,6 +223,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
+    cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
     cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "avr-cpu.xml";
     cc->tcg_ops = &avr_tcg_ops;
diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
index c28ed67efe..1c1b908c92 100644
--- a/target/avr/gdbstub.c
+++ b/target/avr/gdbstub.c
@@ -82,3 +82,16 @@ int avr_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     return 0;
 }
+
+vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr)
+{
+    /*
+     * This is due to some strange GDB behavior
+     * Let's assume main has address 0x100:
+     * b main   - sets breakpoint at address 0x00000100 (code)
+     * b *0x100 - sets breakpoint at address 0x00800100 (data)
+     *
+     * Force all breakpoints into code space.
+     */
+    return addr % OFFSET_DATA;
+}
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 8237a03c23..f7202a646b 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2958,20 +2958,6 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     TCGLabel *skip_label = NULL;
 
-    /*
-     * This is due to some strange GDB behavior
-     * Let's assume main has address 0x100:
-     * b main   - sets breakpoint at address 0x00000100 (code)
-     * b *0x100 - sets breakpoint at address 0x00800100 (data)
-     *
-     * The translator driver has already taken care of the code pointer.
-     */
-    if (!ctx->base.singlestep_enabled &&
-        cpu_breakpoint_test(cs, OFFSET_DATA + ctx->base.pc_next, BP_ANY)) {
-        gen_breakpoint(ctx);
-        return;
-    }
-
     /* Conditionally skip the next instruction, if indicated.  */
     if (ctx->skip_cond != TCG_COND_NEVER) {
         skip_label = gen_new_label();
-- 
2.25.1


