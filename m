Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CE63C97E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 21:43:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07Qe-0008T4-2R; Tue, 29 Nov 2022 15:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p07Qb-0008Sr-I8
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:42:05 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p07QM-0000G0-Rj
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:42:05 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 21so1698814pfw.4
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 12:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2EDNra23sGvUPG32j4s9gi5jRur5KEpDjh0nhJcQejI=;
 b=b++WvPK9J5R+CJq5Tywt7ivc68yc3Yewu9rvGGs7igEbDyApjpKwPuP6YhQK06eFZC
 2FL1fwWwR2RBdwpnZ2hk7hkQEjnUDWxUfq3+uvlvtWaDqOnUAAdZEx3adoU0utx/JPCz
 1jN47d7m14/ziMbuaxPPmskP01bnXqfs/R4ERrgmfKe1oSY1VXSgK6qVmHW9pgasjaEp
 t4LInWPpwI5y5m9ca4qddhq/1zp+DIJMcD2QR1DSIdac3mx2Yuv7xWWb1E66QQPbtyFF
 qc/sMbcdMyURthPHYHH3Uy2XQQXUqnYD3/B6/SXco5UqfzWuEwlUBjWUJCmqmBJNkKxs
 sY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2EDNra23sGvUPG32j4s9gi5jRur5KEpDjh0nhJcQejI=;
 b=ZNVc5hlBHDqbQ2MY5m0OhQe7NQ+bowQwYJvq/M8IgQ3zGYwwaFKvVkbR5uYu4Na13s
 ivCS5Q6egUe3bGe7nM+aiV7fO0jKmEn2FUSCF1qJtyx7yaC2Dszi93AQjUb6vzsMYw3I
 1t8JzxIfw/EP0yDXmmwMJ0x2VSjiqGNNI8XHpKdT/cU0A0IvEtjuTj1VwMj5QcPke2cB
 cwWsjfGsdRQ0LtYvYDS/shet5OQnMlwRhE6bhmg8yPy8ZdrxoNBethvRpqSudfN7Dx0f
 QeQEeCtaBY3Q2Rhr9lHxNmpBdGC7M7RZD6dqbveoKm8frglVmz92kyMS8x26dIJISy+n
 9Ccw==
X-Gm-Message-State: ANoB5pksPPpUamOh+FC+IkiB+LdW9YWqwHkhqs5cG2fTZ6GzqQthtX2Y
 pRRxVbm1utKoKTjhFrXgpv96wqp/6QdOtA==
X-Google-Smtp-Source: AA0mqf7dQuxe6EWD2WBmJD+w30EyVByVBcL/xqlmfo7/f0enwHbfranHDYDUM6/JdHI65+0kPTR4kw==
X-Received: by 2002:a05:6a00:1825:b0:56c:f16d:2f29 with SMTP id
 y37-20020a056a00182500b0056cf16d2f29mr61488420pfa.53.1669754508377; 
 Tue, 29 Nov 2022 12:41:48 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:9f9e:e00f:d585:c303])
 by smtp.gmail.com with ESMTPSA id
 k30-20020aa79d1e000000b00574f83c5d51sm6372521pfp.198.2022.11.29.12.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:41:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH for-7.2] target/arm: Set TCGCPUOps.restore_state_to_opc for v7m
Date: Tue, 29 Nov 2022 12:41:46 -0800
Message-Id: <20221129204146.550394-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This setting got missed, breaking v7m.

Fixes: 56c6c98df85c ("target/arm: Convert to tcg_ops restore_state_to_opc")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1347
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

The patch is unchanged from the correct suggestion in the issue.
If Evgeny would like to reply with his s-o-b, this patch could be
commited with updated Author.


r~

---
 target/arm/internals.h | 4 ++++
 target/arm/cpu.c       | 6 +++---
 target/arm/cpu_tcg.c   | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d9121d9ff8..161e42d50f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -185,6 +185,10 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
+void arm_restore_state_to_opc(CPUState *cs,
+                              const TranslationBlock *tb,
+                              const uint64_t *data);
+
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a021df9e9e..38d066c294 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -91,9 +91,9 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
     }
 }
 
-static void arm_restore_state_to_opc(CPUState *cs,
-                                     const TranslationBlock *tb,
-                                     const uint64_t *data)
+void arm_restore_state_to_opc(CPUState *cs,
+                              const TranslationBlock *tb,
+                              const uint64_t *data)
 {
     CPUARMState *env = cs->env_ptr;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 60ff539fa1..9a2cef7d05 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1035,6 +1035,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .debug_excp_handler = arm_debug_excp_handler,
+    .restore_state_to_opc = arm_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = arm_cpu_record_sigsegv,
-- 
2.34.1


