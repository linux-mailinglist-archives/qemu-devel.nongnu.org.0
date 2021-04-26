Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD136AAF3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:05:26 +0200 (CEST)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larYq-0003Rw-3J
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNj-0007wG-Cv
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:55 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNV-0007Xk-Om
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so2184034pjz.0
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z0d/MHZc/lIMcXnltDdxqc+mT2qSBPZpXbhHRl412BM=;
 b=Wa8QVRrNqnW273lfLJ85TO49Shejj0n/Yf/02VHMvDOe4DD/Oc2QLksGGkn87b+rfj
 iacynqcJjiduwAxcPtlqvo3gszLV79V5QSvRUMZuD1bXEPZlBuuqDjs+OcZnVRsfMw/x
 9CutKqWznqa2uKT+hryWSM/zZ3gyqAVzCKtvP+PoPYFtYlsznkbaiez5DQqx7G/IIsJo
 FJkTax1H1telRorjaIWLmld/LrOimWTCggoRW/X47QmEjY1B7QbXegsaqAG7rN12781p
 F7K9NIQGkWmjT0zI3GH9/WTuLBYpXNrRIAGOrZRrvhnMCoX2iKYq4cyuLBiSrqSa2Qv/
 qSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0d/MHZc/lIMcXnltDdxqc+mT2qSBPZpXbhHRl412BM=;
 b=Q7IoM/BKo6m0GX4uIL4QLdJqKMhCzmYZ/jadhtW2ASMrnY3iQv1MXt+2w9kExHrmZx
 jxTnkR8CQMONthKO2jD3yCSGTtgXtzWAwW077vRVoDuEY6a0pWkxIzYXl9ylBveGyCTK
 kqVYLEZBJAWBLWtaFrRdJM6eltaHF1WzJgcPRXNirm6m5iC/rgG6ejSs1rNc1OozzGb+
 dY0s0i6acFpXrbbdA1W8GxFw7qnNqYT1WQ5PJCBsB266MxG5kHV6H31Zah6pcZsY2/BA
 umUEPEOjuFtJsplMFMb7RADFzrwSFcgcFxv50zKXOL/F3sZuIz70kVnwEZ6iJTFF9S+1
 D8Ww==
X-Gm-Message-State: AOAM531aMkBJiRLJOJnMZraYEdbZEtwGtvbv6s1CQClbfeAfScOEHWbf
 Ny4h2DJ8N3wG/EzqP/U7hFKmRD4rkoHyMg==
X-Google-Smtp-Source: ABdhPJzKq0yNDWg6VTsTvTPABzPMP5oQTYBM1Wk9n1xA7LYuH35CK4DxBlr/yX+anA9Y3BlIee55ww==
X-Received: by 2002:a17:90b:2355:: with SMTP id
 ms21mr20017424pjb.226.1619405620189; 
 Sun, 25 Apr 2021 19:53:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/25] linux-user/sparc: Include TARGET_STACK_BIAS in
 get_sp_from_cpustate
Date: Sun, 25 Apr 2021 19:53:14 -0700
Message-Id: <20210426025334.1168495-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move TARGET_STACK_BIAS from signal.c.  Generic code cares about the
logical stack pointer, not the physical one that has a bias applied
for sparc64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_cpu.h | 9 ++++++++-
 linux-user/sparc/signal.c     | 2 --
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/target_cpu.h b/linux-user/sparc/target_cpu.h
index 1fa1011775..1f4bed50f4 100644
--- a/linux-user/sparc/target_cpu.h
+++ b/linux-user/sparc/target_cpu.h
@@ -20,6 +20,12 @@
 #ifndef SPARC_TARGET_CPU_H
 #define SPARC_TARGET_CPU_H
 
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+# define TARGET_STACK_BIAS 2047
+#else
+# define TARGET_STACK_BIAS 0
+#endif
+
 static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
                                         unsigned flags)
 {
@@ -40,6 +46,7 @@ static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
 #endif
         /* ??? The kernel appears to copy one stack frame to the new stack. */
         /* ??? The kernel force aligns the new stack. */
+        /* Userspace provides a biased stack pointer value. */
         env->regwptr[WREG_SP] = newsp;
     }
 
@@ -77,7 +84,7 @@ static inline void cpu_set_tls(CPUSPARCState *env, target_ulong newtls)
 
 static inline abi_ulong get_sp_from_cpustate(CPUSPARCState *state)
 {
-    return state->regwptr[WREG_SP];
+    return state->regwptr[WREG_SP] + TARGET_STACK_BIAS;
 }
 
 #endif
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index d27b7a3af7..76579093a8 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -394,8 +394,6 @@ struct target_reg_window {
     abi_ulong ins[8];
 };
 
-#define TARGET_STACK_BIAS 2047
-
 /* {set, get}context() needed for 64-bit SparcLinux userland. */
 void sparc64_set_context(CPUSPARCState *env)
 {
-- 
2.25.1


