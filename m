Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E803D028D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:11:08 +0200 (CEST)
Received: from localhost ([::1]:54714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5w55-0008GY-R4
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpb-0007Qw-59
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpZ-0008Bz-ID
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id o4so18922458pgs.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZ4MKQyFA9AM/nKrT7V33vlow5VjeOIvrBUMrcM4oVg=;
 b=zlHXvJmPMsx7hwbF/dmrgYNfD1/aZBIKdRmIzugkkXXie5quda3BoPHvjqShArxea0
 qPjmOJ0MB3Cyl3NBDXGuYsFrPsv2i6Yr+SuWwEYJYbpaqQJt+XhQVkPjBMtyqSQ4ecZs
 /uzUtxG5MARpZnVy7KkdITOWMZZvQy5Den511HUvSjMU5iNJibJo47jdt7hFG5nUzYU2
 Wky6rgYQaq8lOYBnEhyoWwwPz0B5I7CNVGgSwcSsHErUfiNf9VLpz3XXgzWZKiZFun2C
 6IBbJwdc7H4gwqpnOCLjKlIXUrO5s0ymyrNi1J8qQiCCTvvwcoFK5I1yaIlBgDdVGa5Z
 d92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZ4MKQyFA9AM/nKrT7V33vlow5VjeOIvrBUMrcM4oVg=;
 b=PfPsmNbtHQTlp0hamWVDd4JqULLnm5kYP7jsGwRvh067FfhGltDCXC5BlJAZosKihj
 TYMi8vQQZBA9MEVfg66cVQu2FVMV/mzwlplkORezhe2iAylqClA/NPZ534sFr4k1924T
 BfAzlFAnJNMqMM1jMRup1fqetqTKBx6UuPzN/fJZMoVgW+jE+bsj4cH9EQYywxQVavDU
 CB0g26M9oDdPGSSCWhcjxBHN+VkWNQG/df8aAfjHXMtQW2JohfKQ+kDRfolAPzhBbr0O
 g4C4C3kpyh/lJzd88OG16ZvsD4/LslNnr6n+/FYoaVJVccKM+u0LJN6aFT1tETjpurWn
 pwtA==
X-Gm-Message-State: AOAM5322manT4Zgs/med7nFHGF55tJssfKWAafC/s5w9yuis9NWKKSFy
 YZ42FpccGtLYBeKs9xaQXqJThLEMWzMwwA==
X-Google-Smtp-Source: ABdhPJwIJ7+Gi++UkKhrhDO74IsG8M6cVVAauI3zwmeWcSCST4h2UfFvTnkLBT53W1J9amEwHgY6Ow==
X-Received: by 2002:aa7:90c9:0:b029:307:49ca:dedd with SMTP id
 k9-20020aa790c90000b029030749cadeddmr33477869pfk.9.1626810904116; 
 Tue, 20 Jul 2021 12:55:04 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:55:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 16/17] accel/tcg: Hoist tb_cflags to a local in
 translator_loop
Date: Tue, 20 Jul 2021 09:54:38 -1000
Message-Id: <20210720195439.626594-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

The access internal to tb_cflags() is atomic.
Avoid re-reading it as such for the multiple uses.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 4f3728c278..b45337f3ba 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -50,6 +50,7 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
+    uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -72,8 +73,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb,
-                                         tb_cflags(db->tb) & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
@@ -88,14 +88,13 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
            update db->pc_next and db->is_jmp to indicate what should be
            done next -- either exiting this loop or locate the start of
            the next instruction.  */
-        if (db->num_insns == db->max_insns
-            && (tb_cflags(db->tb) & CF_LAST_IO)) {
+        if (db->num_insns == db->max_insns && (cflags & CF_LAST_IO)) {
             /* Accept I/O on the last instruction.  */
             gen_io_start();
             ops->translate_insn(db, cpu);
         } else {
             /* we should only see CF_MEMI_ONLY for io_recompile */
-            tcg_debug_assert(!(tb_cflags(db->tb) & CF_MEMI_ONLY));
+            tcg_debug_assert(!(cflags & CF_MEMI_ONLY));
             ops->translate_insn(db, cpu);
         }
 
-- 
2.25.1


