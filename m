Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305840DE4D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:42:35 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtWy-0004rz-UR
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLQ-0001Fp-LZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:36 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLO-0002Qp-OT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:36 -0400
Received: by mail-pg1-x52e.google.com with SMTP id h3so6479691pgb.7
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+sL6u8bXsTKjedcptTkC5TsAqmI7f7iPpsRjw30zQg=;
 b=QE+qMyCSwLWL5uZLgEsUmXsngvI9g0Dc+Lc36Wlz/jCrWnR2aRJx1t+1vIfqcg5rQa
 stdniSM7jXDJZr1PcpJ2nT96ah7R5l/zZUfzi6WrluzV5NN3N89KYicx37WJTC64YQQ0
 I0rlBAvQxABFvpWZXIhoEAdWoxR+NwCZvcQcoA34YAngG9s+xQCsUlQlKcNGkN+D2PBY
 b47GiskaQ+KYmHcMgcm1o+Op4Bg6cNb+i0o5F+U8/d1/TZkPHRclfDcrhkdPPijnCjl0
 HpZ0r/Drc4KyQoAngou1ksloTx2gYHaM4gMdUmBUG3Y+YpcNnXQOBgN+EYsX5j4+3ntO
 +24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+sL6u8bXsTKjedcptTkC5TsAqmI7f7iPpsRjw30zQg=;
 b=k/QaK2Ccw+dBgIcoISILWyWzwMFIdP4/OmV2pbA7qoPg00Ouxrm5XrGoQb1gtytpRY
 GI927eEnLIR78tMDwkWIqgqo73dVmLTqZ2wZi5pyI1JDsdH4Mz6b/pegJPhQCp4hy4uu
 f6f1inDV0iyUdXlzDaINCqvC1gy9lxbPuhz7W19RGa/bZWDg6/XKLexYWTYwX4gH38QP
 QZO2RWmTYM2JUBk4A8kihZO8GSs7O/fMSDcAYOxWha+QRpUEFu/Y5pIf6X07H3aT1Xjm
 5/A8DR4GruGneq9ltUrMJjmqKnxlwqF/c/5hXc+Vp+NxZwCRRE2IS1LXtVmTPppWx4Q/
 FpAg==
X-Gm-Message-State: AOAM530hMqxKUcIYwrmcFiU11FJNyU1f98wmpBwPiZtLoTqvKFIqlwG7
 8eYwQ2Ay3UB6gjQqPh1blhZ2gw7D3rDNwg==
X-Google-Smtp-Source: ABdhPJwtKqWaJGMgAf98dmO2Scka+91pjs3jkOlsTXPFYiL9C3cKSAE2MtrWK6kSb9ZEnsa3c8CRlQ==
X-Received: by 2002:aa7:8893:0:b0:416:4ed7:e4c4 with SMTP id
 z19-20020aa78893000000b004164ed7e4c4mr5729264pfe.83.1631806232446; 
 Thu, 16 Sep 2021 08:30:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/35] target/alpha: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:29:59 -0700
Message-Id: <20210916153025.1944763-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-9-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb..1ca601cac5 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -47,6 +48,7 @@ static bool alpha_cpu_has_work(CPUState *cs)
                                     | CPU_INTERRUPT_SMP
                                     | CPU_INTERRUPT_MCHK);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -221,6 +223,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = alpha_cpu_has_work,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
@@ -238,7 +241,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
-    cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
-- 
2.25.1


