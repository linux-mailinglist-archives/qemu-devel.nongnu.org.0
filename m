Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DAB3D0287
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:07:26 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5w1V-0002Ae-K6
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpW-0007Jh-1s
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:02 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpU-00087Y-B5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c15so11944729pls.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3LffqvNinoZOAp9QjnMZFhnvMGiYvkKM9rqwGaZZAo=;
 b=gIJdBLu1v+m0e/ELQ+bky6yFBhRDSJXKETDvVjOaT3N8Q9xQNPFIEouMmqG5rZIdO8
 /bIrcwZUbI/SBrWlNb1FDzrd3oSwNP9QdEIvQ3KMDFcImu6QMGeIWTcekHdJ0qb2SzET
 ZEbET6yq6IPnJJTLI9qtXErUg9xWHC/ojInphQt2jIQ5aWeJMeDKqsg0iwcXeliVEHk6
 1+5/I1MsLYPXaxF542NvXQ4GD+Lh7ITrA7513fYScFPHmVqlebZPZEJFqA8kvKvWki48
 61CIMVXm9C+5IucB+virUpMtc+R7pbO3RmZglD5LfMXydy20XTfXtb428XH4YHhYi/v/
 0V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3LffqvNinoZOAp9QjnMZFhnvMGiYvkKM9rqwGaZZAo=;
 b=f0PmgYLfAw5XXAoQmH4xI1lNFP5F64wqyaUKubNEXAdxaEmXXFpw+ADrPNt4XahvUT
 rzcyz2SsNB1jxhwpe2BUcBFcd+tJGZzBSudmfAoJbOhcbnDhFTDmTqOjCCGfSG4UpdAC
 eJgANhetmdvkXa3VV1qOPrfMvAhs8ISbCaoaw2VPbDwTLOPb3dg31maE+HRXdigy1Tk2
 HefUSSCzDrIkz4q6lkUlILFkP7Uwzs/+oogIgp2P6IITid1pAetJyOLUWI+KT2/AII3u
 0tIuwct10vgz48nUQGFUwzTTZs4wGvLlfsa4/u5g8wojru9OuIK79RoRBYJD8sXGFlQu
 G7kg==
X-Gm-Message-State: AOAM532axEQEoJMtuPtiZ3v81DSSKXtwyxG+WeZ8LOqT9FoBPjBFN+BE
 FnLQDh2nlzrt2WZGsiBT/C9ZV2g1od0MFQ==
X-Google-Smtp-Source: ABdhPJynl8Od31bLxex8houqF1q0nV0TUwcYHSQuLtaqWtdcHLIiWr9C3hbskxddYt0V3R/AF0tEkg==
X-Received: by 2002:a17:90b:1484:: with SMTP id
 js4mr31554311pjb.155.1626810898537; 
 Tue, 20 Jul 2021 12:54:58 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 12/17] target/avr: Implement gdb_adjust_breakpoint
Date: Tue, 20 Jul 2021 09:54:34 -1000
Message-Id: <20210720195439.626594-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure at registration that all breakpoints are in
code space, not data space.

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


