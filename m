Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6D2F9406
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:50:56 +0100 (CET)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BGR-0005k1-0W
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BEB-00045R-MS
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BE9-0001s3-LF
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c124so11493974wma.5
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+HpPEQqognf7v2xJO1YwF1kLY3q7UZCQOxgisP0pmM=;
 b=mJ679iFbMt3sP7yU0ineY+fyD72GONZTja09Y9dg17a4/Ketas17aGVpUkQhXHtTYI
 C3bXG376c6LWwP5d8jj/bJ1PI/dJGTq58wUeyhJ80C2k0CgcQbhU9pq+0Yzrw3QFOY7F
 CaNgZxPmy7XA4e4XZ+Qa0dkymG1qu9qTXrGItryg7KcBSXyJqOCinpfiQx0X0nypY75E
 ASjNon1piPd60kvUFAiza4gSU/MUnkRsm8jUs6eIvRyBqpVTaGSOJ9wIO4xIgcli1RYq
 U3IIT0rpCm5fmbPCVmmdts3TRU7uQwYRdmnmL5gkFRrvESVRQahskNbo56ZNodpAlxS4
 nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M+HpPEQqognf7v2xJO1YwF1kLY3q7UZCQOxgisP0pmM=;
 b=COZ+mcUYoH5AnduFE1QjUbNyL3LAKHIRix0UXxRXHGcsEvzus66q72MohYT2QogbLX
 GBwUYKiSfCK71+UeF8P7omI+YW5NXjgLVw4xSwG1P+svYBXzcCVmMxcDJ7iisfjI4eI2
 eD0sw4m968MIqsxa8AnoJtx58+PeNQUpVg7XSUNUxkOXYApv7XzRz/WYL+VPZ9VyAw9a
 +Qh0I4TORJvDyk9LJLe17woy8Qz+K9HUrUf0V2HUWjr6Jkl7HxjVtm1xnXTn7xoOAL36
 m98QRsVJnl2CcebhdVGwGd02kREPQaUvWR1431iXRx9dL4xoP+yZUJO21r2x/tPzH5fL
 plHg==
X-Gm-Message-State: AOAM532JpKjeExsqEIirOAVDfHWvtMUKLBZZZDZ5OQ27CtyN3XJS6dfT
 CMG1I8/Lc6HGSYHWEHO/yJGUkO7aROM=
X-Google-Smtp-Source: ABdhPJzp9vjIIGvDeVzlAXp2DZjbQFoWApyHnpsOnF507hGOciz+x7QHsxRErpen725WDVu+dL3f7A==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr15192145wmq.188.1610902111757; 
 Sun, 17 Jan 2021 08:48:31 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m21sm20417930wml.13.2021.01.17.08.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:48:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] accel/tcg: Restrict tb_gen_code() from other accelerators
Date: Sun, 17 Jan 2021 17:48:10 +0100
Message-Id: <20210117164813.4101761-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117164813.4101761-1-f4bug@amsat.org>
References: <20210117164813.4101761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tb_gen_code() is only called within TCG accelerator,
declare it locally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/internal.h    | 5 +++++
 include/exec/exec-all.h | 5 -----
 accel/tcg/cpu-exec.c    | 1 +
 accel/tcg/user-exec.c   | 1 +
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 4981d98dbfd..f7e18c3498b 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -11,6 +11,11 @@
 
 #include "exec/exec-all.h"
 
+TranslationBlock *tb_gen_code(CPUState *cpu,
+                              target_ulong pc, target_ulong cs_base,
+                              uint32_t flags,
+                              int cflags);
+
 void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
 
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 1e3e7cf8e78..3acc7c2943a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -64,11 +64,6 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
 
 void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
 void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
-TranslationBlock *tb_gen_code(CPUState *cpu,
-                              target_ulong pc, target_ulong cs_base,
-                              uint32_t flags,
-                              int cflags);
-
 void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
 void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
 void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e0df9b6a1dd..43676ae8d13 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -41,6 +41,7 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "internal.h"
 
 /* -icount align implementation. */
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 1215b55ca08..05f3c09cbf9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -28,6 +28,7 @@
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
+#include "internal.h"
 
 #undef EAX
 #undef ECX
-- 
2.26.2


