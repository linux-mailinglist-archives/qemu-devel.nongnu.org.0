Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A383CEE1F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:30:18 +0200 (CEST)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aq9-00046H-3j
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj1-00047R-Qr
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:55 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj0-0000qT-9r
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:55 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b2so5800622plx.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UqlmS05MkTOxmP5dwcL3fhQ/lw1WJjbK9e+xb00mPGM=;
 b=XWA9z9KNqiimWGdfnOcrMx6pjVsVpcKmWLhUIYFxSUQ44WxWh0oXKwLCjbNMUxphIO
 VIzAbgH+608Hlxa28tiHl5r/WZO1ipJ53vFaHNRtxhghCGCzaH6nV4ODu5VQbRRjgT3q
 2xj4uEzTnllMP7wdY1XgEruPpmvb6cUbalAeEtnIu51vE5GeFjjpV87qBi5k0/rkYADr
 ZzEHAHA1D7Cjfs5LZ8EfBrf8el0K5GUIHZTJUfvHmQHmnuzq+EdEkpmw7hYmeCRFYalC
 nExjxRjM0d7DqA835gVXS+ltB17Egb6gJ+/bOBtnL3luHuWGQNv9gJuCW4pJDpN+Td6d
 lyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UqlmS05MkTOxmP5dwcL3fhQ/lw1WJjbK9e+xb00mPGM=;
 b=tHt1wO2DNuBNJd6EdHEH8+DqA4fP+4lZqMpFgRdcIROgGebhFP80xmArf3jEMaGlo8
 lJ7jZp6bYzpH8E4Nfw7zmOXa3FrmshdodvrM5T4mJdO2k3Qq0cWAeX1XMXrTDe2dUxL5
 mHAPFpdEPOdVYIWgeCbs+E2O2B38r0FIARwRtTEQOFoOo0xb2MDESyfPudRhZ+kIdwJA
 gJGCtpc0vUKnvtn7jp2KgIJ+yLIcQLvyu2BemWXKMDEmheFcKFyvl5bc1hytSVTBn3gp
 g+uMIBsg1KP20vUXLt2xu0nq0/rjJJgtrLPpttt8assqh4CPpoCLmjms0hBz8dP1bPl1
 FFvQ==
X-Gm-Message-State: AOAM533I30b2FZU0rEkocoZQvNincIhgjj+EoMNwMSkVXUnmjcoZI4nl
 2VpngwSpw9pcOBmr2dE/OH5iVnBDL/5jxg==
X-Google-Smtp-Source: ABdhPJznCszhPGgACwVLE0mryA9lVuk438Ms89+0HWt/Crq9dfXsKFIU6PtA+d+o2TDkMkUzlBpAuQ==
X-Received: by 2002:a17:90a:b78d:: with SMTP id
 m13mr21219354pjr.60.1626729773068; 
 Mon, 19 Jul 2021 14:22:53 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 07/15] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
Date: Mon, 19 Jul 2021 11:22:31 -1000
Message-Id: <20210719212239.428740-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Request that the one TB returns immediately, so that
we release the exclusive lock as soon as possible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210717221851.2124573-7-richard.henderson@linaro.org>
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


