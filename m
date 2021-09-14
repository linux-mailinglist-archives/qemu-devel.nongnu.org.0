Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42D40A227
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:45:05 +0200 (CEST)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwZM-0002Sh-Ai
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6V-0001li-He
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6S-0007hg-6H
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:15 -0400
Received: by mail-pf1-x42d.google.com with SMTP id q22so10472455pfu.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+BdDex9OoPB6btR3YF/isZH4CkbrrWSEyI/6Ee8ZVc=;
 b=Jfo9gzBrCqkPRFXqh8qrL7p2lvRhGrSYm2iE4ne569gMqj79I3bua2s/wxuTDkhVqA
 VFDxp78N7IBHS31dVuZYBw1yzEU8SgJMPj/F3a6WO+BXj0nqrPlWAIKnF/Ww/5wAeuo6
 C+vYL9SzYDhx1vWt6OZKWyMwl3toKisS3Kq6+RDw2K4HqbjeAEOl04VV1g/91xp5RT96
 PbY7ymm6hc6WUls9hax1IPkIgHTQwXPwEqMXfaG0vkQ1/z3m3S/vdMI5OcYYrX5pNDAO
 Z+Q//Ve/8EWGsqh5/qZFPMuJDDCmYm1Z4WQeVVmsVXO0WteOzBLT+m4IiNIFWaVe7+2c
 ML/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+BdDex9OoPB6btR3YF/isZH4CkbrrWSEyI/6Ee8ZVc=;
 b=Um1RASYv6Xs6ChoL+vhf8kfn/CJXH4q4tfhogKtGof1GF3XmWbGan2mE9vK3mjk6YW
 o2aXvPLvbsAHiKZnHNKqzlfTIRD9c1v+R7bZFriaGtbnlHe4FcxR+XiyzThuZiH04Q14
 Us5R5MKr3Mo67zRo5NO7SBIkB8eEmep3CIuJAexnA8G3i1+SaLRK63aAUPPtz4tTKtJZ
 vVoyv4uDMUysz1+grr12erAGG9pat8ISZmpe044jJp6hQ1xEe6FkRMTD6Br6sN5/v3PK
 rprdnELgkV4DZXZ8rmhw8oVKJZXEDkYl8NX/jLgaqJv7pt0OznIzdGHDNC0FqPMzP7p2
 kRcg==
X-Gm-Message-State: AOAM530iSSOA8Dr4xpZV/Kz6+Yz6sH99XWH7g1JgxN3ru4cL9NxL+ftR
 Ya0RhCJYjrdCbdCG+Zwnuf4FQRKz5dITLg==
X-Google-Smtp-Source: ABdhPJyQipii99lh3o7wgoX52yRgFYFCuH8UtZxJFWXHP/o65oVSD295omfwU6G1/Dwrub2HRjWZAg==
X-Received: by 2002:aa7:9a06:0:b0:3f4:1f0a:4fc6 with SMTP id
 w6-20020aa79a06000000b003f41f0a4fc6mr1916105pfj.58.1631578509844; 
 Mon, 13 Sep 2021 17:15:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/44] target/cris: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:28 -0700
Message-Id: <20210914001456.793490-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-9-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/cpu.h    |  2 +-
 target/cris/cpu.c    |  4 ++--
 target/cris/helper.c | 17 ++---------------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b6492909..be021899ae 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -185,11 +185,11 @@ struct CRISCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_cris_cpu;
-#endif
 
 void cris_cpu_do_interrupt(CPUState *cpu);
 void crisv10_cpu_do_interrupt(CPUState *cpu);
 bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 70932b1f8c..c2e7483f5b 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 911867f3b4..36926faf32 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -41,20 +41,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void cris_cpu_do_interrupt(CPUState *cs)
-{
-    CRISCPU *cpu = CRIS_CPU(cs);
-    CPUCRISState *env = &cpu->env;
-
-    cs->exception_index = -1;
-    env->pregs[PR_ERP] = env->pc;
-}
-
-void crisv10_cpu_do_interrupt(CPUState *cs)
-{
-    cris_cpu_do_interrupt(cs);
-}
-
 bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
@@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
     return phy;
 }
-#endif
 
 bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
     return ret;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


