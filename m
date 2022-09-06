Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711325AE506
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:10:42 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVXT-0000o9-Jo
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcS-0007WR-8p
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcQ-0002fY-2s
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:43 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b17so1088409wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=SRY4FrKihbAdLBlGm0zlu+Vf4IcbXDY8j/QZi/7lz70=;
 b=djKDvi0Q/VlAIx+Ie8ym7XGIi+yRkXCP4TAaBn7aSQQEloD2E7viUk22y8w6h6JCyc
 Zd7HQcRFe0qBV2Ry/AQVopRy023CHuB6BPbIoK2VhDsIBCYfyuYeQ63bHi3w86FsKCfU
 RG/IvVClEEfS6VBrvbPYpTgzpCuwwYMBXAfuklqstEsj4+PkEJlreWayjmRZX2X5fu+m
 xBlbTrvrSNTTvub1fe4gY4kKuANvtHQiysqqWb8qX6Kgz21g6PDLMLTOqhQYPSqH2hP3
 z+we8Nc/eEwjYWzFTCZFkPYSRAW1cMA9CW6nb0YPcBxbhudhhFgBebm2uX/5jDo+Qd9M
 wuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SRY4FrKihbAdLBlGm0zlu+Vf4IcbXDY8j/QZi/7lz70=;
 b=DJpDEBF8mTq3/2wtpKtyVOvalbm3aZjdDPu+TJqAIkvu8tTp4g/RCO43DmaSks8z7c
 gIVjn7+vUt2QCgor6XYJD9mHPNvlTYFB7mvMz9tHBUAPXs7kjdr57t5gc94d7IW4QmXU
 kYJSTvXzJnhU4TsVKvQ9Ks+1tp6yGT2UQsflsP/ExxlxlyQvGIK3V7d7OWhBG5nJoCM9
 3A7E9UkY2M5r+X3pGCBVD8MKHhFGjzM+N8lH1J1eRzd2SBKTJHfaM5SxqpY5Cwe9U5YO
 cQ3SSAKs3uyQuE4wjqTiPYHWKN3GqZe4FFheyvkZfsCSCEQl/NISnJjidYWAF9j1WsUr
 fpAw==
X-Gm-Message-State: ACgBeo25CiwKdcwuu4hTdvhd7qXiG7kFYF0AGLZQO2fz3sNWLu1JHmrU
 LpEyUeOzuOYLB7GhQi22o+pDWf1cdQp1fe0O
X-Google-Smtp-Source: AA6agR4sdvFnWjvTgwp8ROd3MV2G7H0qbsHnVy5TqFwRwVyWNHtvUvnJJmGUYyJ5tO8Yc0cI5fviRg==
X-Received: by 2002:a5d:6d0e:0:b0:21e:fc95:3dfc with SMTP id
 e14-20020a5d6d0e000000b0021efc953dfcmr26957470wrq.112.1662455500899; 
 Tue, 06 Sep 2022 02:11:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a5ee64cc98sm20094193wmm.33.2022.09.06.02.11.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:11:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/7] accel/tcg: Split log_cpu_exec into inline and slow path
Date: Tue,  6 Sep 2022 10:11:26 +0100
Message-Id: <20220906091126.298041-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906091126.298041-1-richard.henderson@linaro.org>
References: <20220906091126.298041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7fe42269ea..ac8eec7f54 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -292,12 +292,11 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
-static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
-                                const TranslationBlock *tb)
+static void log_cpu_exec1(CPUState *cpu, const TranslationBlock *tb)
 {
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
-        && qemu_log_in_addr_range(pc)) {
+    target_ulong pc = tb_pc_log(tb);
 
+    if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
                       "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
@@ -324,6 +323,13 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static inline void log_cpu_exec(CPUState *cpu, const TranslationBlock *tb)
+{
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))) {
+        log_cpu_exec1(cpu, tb);
+    }
+}
+
 static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
                                   uint32_t *cflags)
 {
@@ -421,7 +427,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         return tcg_code_gen_epilogue;
     }
 
-    log_cpu_exec(pc, cpu, tb);
+    log_cpu_exec(cpu, tb);
 
     return tb->tc.ptr;
 }
@@ -444,7 +450,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    log_cpu_exec(tb_pc_log(itb), cpu, itb);
+    log_cpu_exec(cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
-- 
2.34.1


