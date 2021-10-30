Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D9D440AF2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:20:40 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsy7-00088K-4y
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgrye-0002Ha-Ie
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryd-0000CS-2M
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:08 -0400
Received: by mail-pf1-x434.google.com with SMTP id l1so5877141pfu.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zhmoQq400LN3ckB+F14vIMLu76bali80G5XXiJl040k=;
 b=bytSKraKSabTEwyj0IjM65jDl1g6qC4xLDbk+wEPfhLA8vBgOD7A8pU9tewfr0FMOS
 /MDpUj7zJOB1DMM/ALteRrclPQc8pb2YHMIgzxK/nCJLDX6w1yS/zPdIhZR+Ledft+FQ
 Bx302SrxDiAVvpu2AfSmknMLTxsfGbXxMa3pND4FUEV79niQh0JllMUF07fN3PG/QaHN
 Oh4nXrhhz3YJkGdTmWDmcOY9qJrwRwhxrs1kWu7wQmVqVWWyYWPAJesPix7v826Bftk8
 PyyZJibrCxzqVX60YpdYa0dffdf28Qptn30ubVgQiBcUxWQueLHpc+85yBttF5Tjpvkl
 5tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zhmoQq400LN3ckB+F14vIMLu76bali80G5XXiJl040k=;
 b=1Ui7Uu03wM9EKhrxVQ3wqhJEXU3N8CrlWyBvniLRdMXTtHgJlLkmuQrBXzfZRfQD18
 HjzUydq6sNXO8tYh+HHzEj9ipCBib+tftTnte7a4WRAvQl1sdkqGc+LyIkHGNfGG+WMV
 uvUU81aR+Y+Dh3PZi/Ve2ytZqjGpgGPgwlMcnPSGLmxSxAR5slOvnduBd07fqXPCXCHd
 jO1rbArIQsV5Xp6pgUnneFKWxMw+hBoIrytLG2ZqZcskQ5q560SM53i+EKNROk5iIv3m
 YO4nZNIWf9UOXECwEsnXcjWKIBRdLKxLucqAmALKkmlpQZV7I/3PG/AC0Q1WaI4X5KNc
 e2gw==
X-Gm-Message-State: AOAM530wRSaAB7PPWL05x6kCzJKsURMicUWTxNHsp/tIg6ep9uP5WzLE
 zdeE0Q5ztd7G/0IcrSU/ZB3XmAeZ9/yt4w==
X-Google-Smtp-Source: ABdhPJz7LE7tOukFfQdrHcn9TbZwra3O7Ihe3lZtQ6lESbFYhAm61e1iEhoAh92c4BQ5gZsOcPw8nw==
X-Received: by 2002:a05:6a00:a23:b0:43d:e856:a3d4 with SMTP id
 p35-20020a056a000a2300b0043de856a3d4mr18377721pfh.17.1635614225417; 
 Sat, 30 Oct 2021 10:17:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 31/66] target/nios2: Implement nios2_cpu_record_sigsegv
Date: Sat, 30 Oct 2021 10:16:00 -0700
Message-Id: <20211030171635.1689530-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because the linux-user kuser page handling is currently implemented
by detecting magic addresses in the unnamed 0xaa trap, we cannot
simply remove nios2_cpu_tlb_fill and rely on the fallback code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    | 6 ++++++
 target/nios2/cpu.c    | 6 ++++--
 target/nios2/helper.c | 7 ++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a80587338a..1a69ed7a49 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -218,9 +218,15 @@ static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
                                                   MMU_SUPERVISOR_IDX;
 }
 
+#ifdef CONFIG_USER_ONLY
+void nios2_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t ra);
+#else
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+#endif
 
 static inline int cpu_interrupts_enabled(CPUNios2State *env)
 {
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 58ecd27d75..4cade61e93 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -216,9 +216,11 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .tlb_fill = nios2_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = nios2_cpu_record_sigsegv,
+#else
+    .tlb_fill = nios2_cpu_tlb_fill,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 53be8398e9..e5c98650e1 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -38,10 +38,11 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     env->regs[R_EA] = env->regs[R_PC] + 4;
 }
 
-bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
+void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t retaddr)
 {
+    /* FIXME: Disentangle kuser page from linux-user sigsegv handling. */
     cs->exception_index = 0xaa;
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


