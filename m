Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C383CC6A3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:26:25 +0200 (CEST)
Received: from localhost ([::1]:56662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4slM-0006XI-7G
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seC-0006u1-Jv
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:00 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seB-0001zY-0E
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:00 -0400
Received: by mail-pg1-x532.google.com with SMTP id t9so14558429pgn.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8YnkwL2N7MCyAYblTwdwFeZAAt2ZW8w1UlaHPMDWJNk=;
 b=SAUvc8JL8Xrg4kgvWXQGioO8ay6EbZW7CdIBHNtFtZ7AvOelmyFOih9Q6FeAPth5GI
 LSV7hiIOd3agDeV9KvcYn9B3Eb+0M3RGXEZG7EWNOAWZYMk7g5j1KD3EWa8/hXI759L1
 9PhWqUKsRuMVtbv1SriQQkyKoMw+DwpRj4qtL7R4y5FntCqcNgPd/CmhfgcxbEGT8+mc
 yxe0nLtXJNfNHWNp8alPSzK5rQr/S9YzIzjh/rhO0/+W8zSMteHLlWMii+ZY0QtDbyER
 Slll1DQMOs1EzBWZIZBk5uZy1r7jG5q+xZGJdo/O/G5qfzZ/WeFI1aKQ4cSAl7Axj+Yj
 YmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YnkwL2N7MCyAYblTwdwFeZAAt2ZW8w1UlaHPMDWJNk=;
 b=h4D29AnBZLoHorRZYogjWDKvfLShsIut+mgmQQ16cTp6ytpNGhEAI+HQqtXHnhNeYj
 kClNrEq1se1kFkxH3hXecufQguWznTou+HduSXhj0dtfNNzko62TSiyuA+5CxrRROmhI
 YHq9eykB7ZB6IkZJ2zg6EnSSVaH91tpEvKPveNyCXCPlz9Tg0R+Lh4kSA7iCc5rdebNF
 KZeHckTp8b24l64pTDGaYl1MDncPKT5c7pXrvNBjjl9Ee6WEctPTcUiCdtLvr82ttBts
 EcJVmd6USZZQeft1i8oMlA6HKNIY2EMe0hcRHQfAHeMMmFZlEVfb+El86fWter84ii9m
 s+nQ==
X-Gm-Message-State: AOAM530strhOv6k7UOudAb94QF3vlV+YkqNqVLiPMoE4fFmj8u8ScUzf
 j+uWSIhEHT+tgRlanmfjV892YFqspHmHAw==
X-Google-Smtp-Source: ABdhPJybgaEacpz1hOSZBzGQWssMlu437mspfhUzDwHsuOD3Vk+Bqie0rNAgU9Dpluhg/blnoMCjxA==
X-Received: by 2002:a65:6191:: with SMTP id c17mr16991607pgv.153.1626560336548; 
 Sat, 17 Jul 2021 15:18:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
Date: Sat, 17 Jul 2021 15:18:44 -0700
Message-Id: <20210717221851.2124573-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Request that the one TB returns immediately, so that
we release the exclusive lock as soon as possible.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2206c463f5..5bb099174f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -330,8 +330,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
-    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
+    uint32_t flags, cflags;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -341,8 +340,14 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu->running = true;
 
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
 
+        cflags = curr_cflags(cpu);
+        /* Execute in a serial context. */
+        cflags &= ~CF_PARALLEL;
+        /* After 1 insn, return and release the exclusive lock. */
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+
+        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
             mmap_lock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-- 
2.25.1


