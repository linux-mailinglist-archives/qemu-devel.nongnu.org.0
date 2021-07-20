Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F33D0271
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:01:04 +0200 (CEST)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vvL-0007nk-GF
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpO-0007BP-Gm
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:55 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpN-00082U-2g
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id s18so23523199pgg.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UqlmS05MkTOxmP5dwcL3fhQ/lw1WJjbK9e+xb00mPGM=;
 b=g1DwIPjM1AyjdKeChOvkz8D1AaXFZZDAjBVjt7O9oN2pibMyXXjHXLUBGTfVKsCTLF
 x8VEpLSFAgedtyVQAhTgCqiTAVT4jYvYBslHHOTC0N82nUhN1TpsyNSA8Gxvz9Zr36lr
 2CXLA962CTaM29a7BFQ/351QE+OBhAtNAH7K26WhLTGozu0OSwlLFs00l29n5NZUnP/o
 fEy4gCFYZboRi42YeeMj2Or4dKbaLE9cTt5F17XvywLg+9yguAdwh5t9i6knjyhSUXpd
 dRkHwaBVWWg8oWCT4g6xry9KdI+9ZXhnvuetmtZywiULfQvvFkugbzKFSPaxRA/PQT/5
 +Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UqlmS05MkTOxmP5dwcL3fhQ/lw1WJjbK9e+xb00mPGM=;
 b=a3l8MS1/DkJenqV8pDL3Jg1eMKKp6gLTUAoVMtMSqVfo82F2kAOOP8PZYCw2eH51ck
 EDW+i2I9x6iLheLqapMdi9IqkS7MLA/q9tYApIlB1MCa/UcnoWMH7KORbRGN52wBN7mD
 Uec78rkUItIgfE4N696Kb56s8JZmPhv8FCnRi3f617i8VJi6IUGGJcrHy+wwB4X3hYZz
 Yis6uItIXcqzGDCj8753XpeS5ECygBLK2gNroPrajGIkQ/UuI23blTgLkQKsYlnYTfIk
 RhL+wFdywcEiCfinlecws0MfGmEPH6L4FLRSnh+PJVJeqZmpC1Uj9K5D9TZXxEmncfoV
 O8aw==
X-Gm-Message-State: AOAM53207/ucgharUNLCY6dmuVQWgLCzqkyOmanmOO+viKyqCsQRPQSV
 SeKPZt0TL9NUOSv4f7fUUb3jQEFbLF2xAQ==
X-Google-Smtp-Source: ABdhPJzm8M6f2ufGaXj9jJY0RdN4mP7mRAkEN1cgqgBrZMjIsRyVJ+o3Z8tBWICSGVtfiZNomQ/O6w==
X-Received: by 2002:a65:6111:: with SMTP id z17mr1873612pgu.335.1626810891853; 
 Tue, 20 Jul 2021 12:54:51 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 07/17] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
Date: Tue, 20 Jul 2021 09:54:29 -1000
Message-Id: <20210720195439.626594-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
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


