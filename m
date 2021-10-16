Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57C43042C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:24:56 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboMW-0005ub-HC
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDZ-0008NX-A7
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDT-0001zt-1X
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:36 -0400
Received: by mail-pj1-x1032.google.com with SMTP id oa4so9488187pjb.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aH4wmbhXo3MUB100CaL5SL6bOpUQ8oceNuJttk5Btqw=;
 b=nZNEraTSXkf6q40LDQT20Gpu1BJpVpEbzz7GikLaVyhipkDml90Sbpc0K9RXhDzWfq
 AWmKztujillLOFe64+YIsJ1c4FtExANRocXfan17HUN+lhu8c3P8HeLlNQytXW3o8va+
 mPgESPW1Z6TUxRM526NBoaBSTIZy6g6i3qziD9E2hh4ThuXXeTlEgKgkMNvj0tXNkhpr
 SmEa3MnaI0IIkVsmAeZvgey6EfXpyZqgsVaG25xOwXgT4JqzpkuQoYZ6frbDojDLdz8z
 ovlhUNDhIsPepY/SdrCcwwOcpX/ngEfHM12UevGAvrPmhAsS/LO3MbPTmdZRxhYvjxQo
 udWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aH4wmbhXo3MUB100CaL5SL6bOpUQ8oceNuJttk5Btqw=;
 b=HD9LsEpY/YGjcZwp4WKLI0ri10ojaCWOx0NWHPznWfcZcQyEhvhyuP7fNqo/JLyRIu
 qxciJX3Pn+ys1LAicJmctEsUvaQAF0BkNX72bZLYzb3RDJkAXR1e/cEAK48w0hmLUz1b
 +RZrFhBpAikz9jY83ewWOJxnqfJRplslOTRNEdQxQWS80k3hogQzPMZaljepsa5dGyw9
 ESCxfb+3t33OmK+lcpkAdcOqPMonEuKlZX03OhXyxOrNsS77YiCyEcqWczX+BEE0UxZO
 qq0UbAU0JV+bsBSDuP8G8SpQSHjNC6DdLlWlKkhFRxtUvpQqm7Y15JZf/MNLrEB5SmXY
 aIdQ==
X-Gm-Message-State: AOAM5333oi5xMiieqFkgifqGcT+hei+a4mbgOQEQvhPcDThoVnO+IqpT
 WJxFr7XTzOWVzpk6yQGDc9zROa31BeFLkQ==
X-Google-Smtp-Source: ABdhPJxQuihKRrhJuAJ5t6i2lyCl3S+KNqeJcV/Ip95qeD1m+w5YTw2LAkmIICAR9DopgsoMqPf/DA==
X-Received: by 2002:a17:90b:3e84:: with SMTP id
 rj4mr20101726pjb.177.1634408128149; 
 Sat, 16 Oct 2021 11:15:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/24] target/mips: Fix single stepping
Date: Sat, 16 Oct 2021 11:15:03 -0700
Message-Id: <20211016181514.3165661-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per an ancient comment in mips_tr_translate_insn about the
expectations of gdb, when restarting the insn in a delay slot
we also re-execute the branch.  Which means that we are
expected to execute two insns in this case.

This has been broken since 8b86d6d2580, where we forced max_insns
to 1 while single-stepping.  This resulted in an exit from the
translator loop after the branch but before the delay slot is
translated.

Increase the max_insns to 2 for this case.  In addition, bypass
the end-of-page check, for when the branch itself ends the page.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 148afec9dc..f239f9ffc0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16016,6 +16016,16 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS_R6 |
                                   INSN_LOONGSON3A)) ? MO_UNALN : MO_ALIGN;
 
+    /*
+     * Execute a branch and its delay slot as a single instruction.
+     * This is what GDB expects and is consistent with what the
+     * hardware does (e.g. if a delay slot instruction faults, the
+     * reported PC is the PC of the branch).
+     */
+    if (ctx->base.singlestep_enabled && (ctx->hflags & MIPS_HFLAG_BMASK)) {
+        ctx->base.max_insns = 2;
+    }
+
     LOG_DISAS("\ntb %p idx %d hflags %04x\n", ctx->base.tb, ctx->mem_idx,
               ctx->hflags);
 }
@@ -16085,17 +16095,14 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (ctx->base.is_jmp != DISAS_NEXT) {
         return;
     }
+
     /*
-     * Execute a branch and its delay slot as a single instruction.
-     * This is what GDB expects and is consistent with what the
-     * hardware does (e.g. if a delay slot instruction faults, the
-     * reported PC is the PC of the branch).
+     * End the TB on (most) page crossings.
+     * See mips_tr_init_disas_context about single-stepping a branch
+     * together with its delay slot.
      */
-    if (ctx->base.singlestep_enabled &&
-        (ctx->hflags & MIPS_HFLAG_BMASK) == 0) {
-        ctx->base.is_jmp = DISAS_TOO_MANY;
-    }
-    if (ctx->base.pc_next - ctx->page_start >= TARGET_PAGE_SIZE) {
+    if (ctx->base.pc_next - ctx->page_start >= TARGET_PAGE_SIZE
+        && !ctx->base.singlestep_enabled) {
         ctx->base.is_jmp = DISAS_TOO_MANY;
     }
 }
-- 
2.25.1


