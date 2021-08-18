Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F333F0BEA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:40:00 +0200 (CEST)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRPr-0001oJ-SB
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6M-0000k0-Dc
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6K-00009i-NN
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:50 -0400
Received: by mail-pg1-x534.google.com with SMTP id w8so3308251pgf.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEBOVW9O1dlBltQunJCEwMsScX5fXnJ/74StUxWznz4=;
 b=vI/33+7Cidh3tYXuQV/ey5+ZPK/20bBumvcl8dWWac+C450GeI66i/XiSH2SeiykUI
 sOyWLIP3+EhqTntD/IwReC+ifYs8AUJPTiOHfMe/y7t4MsnO8CiERj1S3f29R//FsL8P
 jIq4Qn0bbKYawmgny6+r1+fLAkZ5d+0xJkyZggRmZzlNZdTA5kXSbeZ6zjCkQtf4JrH2
 s4MYWzPyziARHPZpXc06xRXFf6EAdVZq4pCEANRwhzHe36lmAlKcwJ13c5UzQGbmeLTW
 PSXECzocOrZKpkzQdGFavaN94L6q08ld2TUY7S7tfM1uUaaSg4bH70v4qJYGStCDSh3B
 R8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEBOVW9O1dlBltQunJCEwMsScX5fXnJ/74StUxWznz4=;
 b=oXc4F9VrL9WdWaboKVw8hYhMXZPduTChQc8pxRNRRXJCDpmMgVEk2g9KUxtNAqoMmw
 lrf3u72HhZGbdnronYIAJ0MLPGzQs8v3MyXUVuHoV+JEKwG0FqwYYZDdVqLoWATxE8/7
 WsvFPtexYayYThP9dsTBVOGzhnBRiwDh3RK2LK7Tb/dJnvw1oVP1crETC1UpGKoVkQ//
 gvlgh7U7pDXYHSNGUFIWQAyzkirl/D+LYd58ttS+obzvWc6eJtN6NSxQ4Y5fO1hGefaY
 qfpbo/B3XU3I1Hc2YgCgixvRwZ0WkDqjo+S90HBq//sASOcf0Ft+UM3rSeR5UrxT0QW2
 bq6w==
X-Gm-Message-State: AOAM533koSkN8I87xOGDTGGagWDHmCPM2ya2vfVbDQNNl8YL2C26wLxW
 b+lWQ2wSJqxd4HpwkA1oMjkcUyfSEkf5EA==
X-Google-Smtp-Source: ABdhPJzfPd3eZvpowHU7zJt6FvsPfvJvIBwJlQSkaN48njVv/98x4FUpD5yVCXIdN8iXamR4g2HL7w==
X-Received: by 2002:a05:6a00:2150:b029:399:711c:826f with SMTP id
 o16-20020a056a002150b0290399711c826fmr10792827pfk.14.1629314387467; 
 Wed, 18 Aug 2021 12:19:47 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/66] target/xtensa: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:34 -1000
Message-Id: <20210818191920.390759-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.c    |  2 +-
 target/xtensa/helper.c | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a0862..41816d91f6 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -195,11 +195,11 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
+    .do_unaligned_access = xtensa_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
-    .do_unaligned_access = xtensa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index f18ab383fd..a5296399c5 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -242,6 +242,21 @@ void xtensa_cpu_list(void)
     }
 }
 
+void xtensa_cpu_do_unaligned_access(CPUState *cs,
+                                    vaddr addr, MMUAccessType access_type,
+                                    int mmu_idx, uintptr_t retaddr)
+{
+    XtensaCPU *cpu = XTENSA_CPU(cs);
+    CPUXtensaState *env = &cpu->env;
+
+    assert(xtensa_option_enabled(env->config,
+                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
+    cpu_restore_state(CPU(cpu), retaddr, true);
+    HELPER(exception_cause_vaddr)(env,
+                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
+                                  addr);
+}
+
 #ifdef CONFIG_USER_ONLY
 
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -263,21 +278,6 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #else /* !CONFIG_USER_ONLY */
 
-void xtensa_cpu_do_unaligned_access(CPUState *cs,
-                                    vaddr addr, MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr)
-{
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
-
-    assert(xtensa_option_enabled(env->config,
-                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
-    cpu_restore_state(CPU(cpu), retaddr, true);
-    HELPER(exception_cause_vaddr)(env,
-                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
-                                  addr);
-}
-
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
-- 
2.25.1


