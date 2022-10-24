Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AE60AA86
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:35:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSb-0003Iy-FW; Mon, 24 Oct 2022 09:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSU-0003Ha-FL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:38 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSR-00040A-Tz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:37 -0400
Received: by mail-pg1-x533.google.com with SMTP id s196so8692244pgs.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H/cPsGaUjgmGlP0QyiiNiz2LFpmmITkWidJGp9/RY14=;
 b=fOs+L40VFkQzf1o+GTZhN+/jyoeQgOABqwB4Kqyzt4MyVS88t4A+CuxHMVw65eUT4E
 agygreCpklIBW6/uNDotP/zhtTIm0ox8bKw9rr3oQT2mmEvfe01e9aQrbuO7Cr4QFbHK
 r3dXdAskAg05KxNL4+z85wz7TjIT4D550j/f7rzLy0zd4NBp3MaZZmeAjYf96jc/Ujwq
 XVrVWKyYZgHZ5HrwRSBVViahgopBhiKowRPL9XXZhVGuAVJze9PyyuwNUtnZr4DZ9oqf
 fHbaNVCbkDJgdDfHPWEt42y7PTdIkOsQjQH72uWtixrsk4g5UOqHyCosfrWuR509RelD
 oxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H/cPsGaUjgmGlP0QyiiNiz2LFpmmITkWidJGp9/RY14=;
 b=4ANbXzQfWJhvfU0Xc7fLyUOYvQ5DXVvjXencIMmN6SzPNk/9gitlnwLmIjYlDSz+y9
 ZJS88m49TJN6dhhIETsFTKNFoHBBrPm6LHmcrsMrzJ+cxfkC1ymIPR8kMtssuvq36Cqk
 22lgmkwspY1Yfq8e4ly6644PSQ4r8BPeUKRpMbU26oOW12tDoskXFerPfVz5knoNkXhI
 HQuFl62AE/y325V3RIhpOFz120+Si9RntpYS6sMp0YSuJDaUUY5p5Y4UIlBs4iqVKvIr
 wQj3TpsEekSliS8bW9s3dIFp9s/z0INdd1caNKQBfgTat5ZHaSePllEL6cSiUGoEowee
 KQEA==
X-Gm-Message-State: ACrzQf2ILWMD+NXktlyUXeJZDfNMGT7MRIt02NYW/Yro4seW6G9I+NUa
 LRJXT2Q/hKfFjeXY4cs5y0Z/aF7ArV9xvw==
X-Google-Smtp-Source: AMsMyM7fAMpWKYSLeNtysXAh9wQLgXrhQiOZdrtggWiOdsbjIjKmYbLHxqWLLhq6xq1xK//c4LcU/Q==
X-Received: by 2002:a05:6a00:1810:b0:56b:f29d:cc8e with SMTP id
 y16-20020a056a00181000b0056bf29dcc8emr2533779pfa.33.1666617934385; 
 Mon, 24 Oct 2022 06:25:34 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/29] target/loongarch: Convert to tcg_ops
 restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:39 +1000
Message-Id: <20221024132459.3229709-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c       | 11 +++++++++++
 target/loongarch/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 1722ed2a4d..49393d95d8 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -319,6 +319,16 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 
     env->pc = tb_pc(tb);
 }
+
+static void loongarch_restore_state_to_opc(CPUState *cs,
+                                           const TranslationBlock *tb,
+                                           const uint64_t *data)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    env->pc = data[0];
+}
 #endif /* CONFIG_TCG */
 
 static bool loongarch_cpu_has_work(CPUState *cs)
@@ -651,6 +661,7 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+    .restore_state_to_opc = loongarch_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = loongarch_cpu_tlb_fill,
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 95b37ea180..6091772349 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -272,9 +272,3 @@ void loongarch_translate_init(void)
     cpu_llval = tcg_global_mem_new(cpu_env,
                     offsetof(CPULoongArchState, llval), "llval");
 }
-
-void restore_state_to_opc(CPULoongArchState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


