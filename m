Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF850440B56
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:49:50 +0200 (CEST)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtQL-0003Jh-Pk
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1y-0001aY-0X
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:34 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1w-0002Gs-4O
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:33 -0400
Received: by mail-pf1-x429.google.com with SMTP id m14so12292816pfc.9
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7mVMLvhvHhRE4SNYEq8lTvIaJ67DT2EyP7H4YHihO6k=;
 b=e9tFOewGX8cs8ldY+qy3eJoZ1SCcY+REGjWps39XAIFleMUQv/RUMdD8tAx3OtwJHJ
 7cqBHvKlSVinGdtI5A0zWKq2YSj+FYHimq746T7GF9xi2zsBOm8+w7l9HT1Ii+GLoZLd
 SJVbG4w07av2hXlsQElwuDSnh83GDsGzA1mij3f86a3J2nhLqwlApj6MaWr2OVajBNHG
 dDzNLBLoW7FH/SQZz1At/ShE3cnnkPzU73nm3DY6g6k2ugaAkpFyk+TgQTP0xvVYFS4V
 EUIzHwOXVILTPumaZbVoqnJl4mfxvya9FkdWIRfexq34x0teWX7yyH7MsJDinVSn3fLI
 4DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mVMLvhvHhRE4SNYEq8lTvIaJ67DT2EyP7H4YHihO6k=;
 b=aB6HYmudgpamAIn5ASdxnd65UDo9fTWQecatICmXdSMYTr7TwOpNazkpoz0eCTZkeI
 1rrzG7REnoUjgG1FHZPG+VcvLzfuq7r2BOhbVhM9dcS7hsd0PX6pzUI1MyWor7gFGtDl
 vMXjdywOavLdxFvnU5aFrTpgrXrKyftfo8oByj3crVZfuA9Brk1r0+zduwtw76WHah2w
 hc/jnMpZCdd0eNoCKo6jggvc/pLOO4G16eQq1VMaYdjXbcz6008gY5jQhXwZf4o91Ni3
 qf/ZtB8k+6x3hZXbs7Wyq1UVVSu+WvlKR0RgUd8Veec66QzJiAdVsD7vjwGjtjMmquwJ
 O1zw==
X-Gm-Message-State: AOAM530ciweM6NU+N0/vurZzQoK/umzSDmDpH7SYQ6zN7krxlrOQxPOz
 KLt/Z/5zCdY+lRWOKDhvPtw+afKc5lXGPw==
X-Google-Smtp-Source: ABdhPJycbYIj2QjN//k7kU+MPo6jKFNIB7BRU5VDT2eZlY+ELKIgeTQgiHtOFVArTsyaWW3Fksh1Nw==
X-Received: by 2002:a63:3716:: with SMTP id e22mr13756546pga.75.1635614430899; 
 Sat, 30 Oct 2021 10:20:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 59/66] tcg: Add helper_unaligned_{ld,
 st} for user-only sigbus
Date: Sat, 30 Oct 2021 10:16:28 -0700
Message-Id: <20211030171635.1689530-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be called from tcg generated code on hosts that support
unaligned accesses natively, in response to an access that
is supposed to be aligned.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  5 +++++
 accel/tcg/user-exec.c  | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 8c86365611..bf40942de4 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 
+#else
+
+void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong addr);
+void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong addr);
+
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index aaf47d89d2..1528a21fad 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "tcg/tcg-ldst.h"
 #include "internal.h"
 
 __thread uintptr_t helper_retaddr;
@@ -215,6 +216,16 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
+void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
+}
+
+void helper_unaligned_st(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
+}
+
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-- 
2.25.1


