Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715FC4004D5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:27:10 +0200 (CEST)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDu9-00058l-En
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDib-0007V3-8u
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:15:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDiZ-0007rM-Ry
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:15:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v10so9366659wrd.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XDdCTWhNSphOhcKgiFEIqlNw+yCG1qrFu8xcV1vFb0=;
 b=GuNK6L+TdflbIylqIjnvpTEBsk46IgcudjaZFQiUJn4kIaBEwwHZ0/hloLaAJVIGhc
 gTo9UPOyINgjYkSIwdseQ+meWql+IcPXjx0WKgsGlaFbnPc90lwrQa7IslFLQIl9fCAe
 YyDKpb8VCdFGW2O8s5Df4N0lR3puLWqd5aq/u6fLE5CFEUklsN85/jI77Gl6qr73lIFn
 FCqDcTn7QCcrXLEPQM56RZ4GsigdPlZh2ZJKBFA29k6d8il7eKL5AOSABVAGX+BfsfAa
 FDx81CPdbQ8pwp07eLIaB0X+Fs2nNK9sOldXkwAD3khx5RHdrO0J5ISSFPOyivVRQQAL
 QUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2XDdCTWhNSphOhcKgiFEIqlNw+yCG1qrFu8xcV1vFb0=;
 b=alz/dx/fd61MDMxyCYlfr85J5MWfJcihva52F9yMOZw/clS9I57RwjA6RZeccDQEqV
 Dm7mkyk+74eDNg8z7sKi4r35FEpL5UDpOVmpKq7iB/QWolRtYoWQaH0cBJ62KOH45G3v
 zQnywj8nBsbjA6RUftb5vua68+PJk9WPYgVy+EsKJLSvS9C2IJH2JyoeoGiQMjwF025v
 ME+AQIMmjH8ODD+36IMPIaODqj5tXYmoqlixtIWrRAy6DVeLN+pLD6ASE7xUEPpN6vd2
 DWvDRkXZJYULp9K1/bykqeqZ9OWI5XtXxDRQDiuJCnFKLlFp844i/pxFQ9cMMDZy446z
 JhVQ==
X-Gm-Message-State: AOAM533pB0ZFXj+kbAWM2GubRdyPih6INUFPrphz3IHocYg7Gw7jELm7
 AVlAjw5YeiG/uxryZTo8K/wl7Q+Uo8I=
X-Google-Smtp-Source: ABdhPJzdGRKyFrna0qEwRKciZVqiGspoB7sCYnCdKKXRWFz2Ckdxswl4Du9RPoqtG1xD+KW/2QKd1g==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr394398wrs.149.1630692910271;
 Fri, 03 Sep 2021 11:15:10 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n4sm6225370wro.81.2021.09.03.11.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:15:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/30] target/xtensa: Restrict has_work() handler to sysemu
 and TCG
Date: Fri,  3 Sep 2021 20:15:07 +0200
Message-Id: <20210903181507.761808-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c1cbd03595e..f7c3f368737 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -43,18 +43,19 @@ static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#ifndef CONFIG_USER_ONLY
+
+#if defined(CONFIG_TCG)
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     XtensaCPU *cpu = XTENSA_CPU(cs);
 
     return !cpu->env.runstall && cpu->env.pending_irq_level;
-#else
-    return true;
-#endif
 }
+#endif /* CONFIG_TCG */
+
+#else /* CONFIG_USER_ONLY*/
 
-#ifdef CONFIG_USER_ONLY
 static bool abi_call0;
 
 void xtensa_set_abi_call0(void)
@@ -66,7 +67,8 @@ bool xtensa_abi_call0(void)
 {
     return abi_call0;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
 
 static void xtensa_cpu_reset(DeviceState *dev)
 {
@@ -196,6 +198,7 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = xtensa_cpu_has_work,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
@@ -215,7 +218,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
-- 
2.31.1


