Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C46B512E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:54:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1painU-0001Fc-O8; Fri, 10 Mar 2023 14:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painR-0001Eh-P9
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:57 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painQ-0004eO-3k
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:57 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso10997829pjb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VinaJbb8DVp1aqRzxC41hI4XOXtUHZDUYlixLfYKlTE=;
 b=QVgDh/oG7rju73BZIwWWatnasdnyMMg2uy1Q0BGBudUyW8znYFapWoZ+BdGdxebsPo
 qrTQL4PQ2BrikqFXmpGDf+udozzflkgLBTlFs1OOac0AQbIaxt1uUhp3MS9/3/s42glQ
 MfnTDbTsHOBFhM409sHZkxABhu1ARjMxu2SUd6gjXHAaQ62UIep/+sP1iEOJPH8G6JYB
 MG3/tpNU7oqNLs6EW0zv3QlyYfUW9sQRvu7fjAXDXjVi7wZHNvDWV3I7oqTsAbo7IbU3
 jd09Swhk6FIOcmcRrxGwQD9+nj1pW8MZjQg49DuPyios8hZbLFZ1fkBzr+bAqHJhkH6i
 1hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VinaJbb8DVp1aqRzxC41hI4XOXtUHZDUYlixLfYKlTE=;
 b=gMJccwcb8koSqmEYR/PvdJo886hxpITKxcMfhIzNv7b8Fxt2ca/rQAeMBybklBDKp1
 0hnfMZ5yeCVnEVFy9mPv6O/eHgOby34waM22rzWp7NByXfRo73Ar1x3oyQU1EQKvwfqp
 KEtiYyeKbo5DJD8WhYulydo4vo4L9HtC3JS4HeHsCCgkHUsmUcp8ZF2u2/RzH4xHvgX5
 GIAIuEfV/Y5XSqbJb/kbugXIrffz4wjLQcBDC0SuTuJx8RS4u3IiyZOzcVoldGwxGuj+
 qwSNShceLSBci059podo/KGeXEd0iMFCiW6WuJ/9AawfhcJjg7BlpCZrLZbsJZ9tKhMj
 1BFg==
X-Gm-Message-State: AO0yUKW9gMg62ijh0XwreKlp/hErO/f4i8VhqpekDzkoIa0BTU0BfQvj
 2w5z0u4rC9kJs9f31FugrD9iVYZdKf17UwEYf/0=
X-Google-Smtp-Source: AK7set873ur+bw8nN1ZBjRREo9cm3PArc2QHFgY+AeqajRZFTD4GlYfoygcHViVAUHzRcAYaPUo2Tw==
X-Received: by 2002:a17:903:11c8:b0:19f:1bd9:505 with SMTP id
 q8-20020a17090311c800b0019f1bd90505mr1139716plh.36.1678477974401; 
 Fri, 10 Mar 2023 11:52:54 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 1/7] tcg: Clear plugin_mem_cbs on TB exit
Date: Fri, 10 Mar 2023 11:52:46 -0800
Message-Id: <20230310195252.210956-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
adjacent to where we reset can_do_io.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 2 ++
 accel/tcg/cpu-exec.c        | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index c7bc8c6efa..176ea57281 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -65,6 +65,8 @@ void cpu_loop_exit(CPUState *cpu)
 {
     /* Undo the setting in cpu_tb_exec.  */
     cpu->can_do_io = 1;
+    /* Undo any setting in generated code.  */
+    qemu_plugin_disable_mem_helpers(cpu);
     siglongjmp(cpu->jmp_env, 1);
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56aaf58b9d..c815f2dbfd 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -459,6 +459,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
+    qemu_plugin_disable_mem_helpers(cpu);
     /*
      * TODO: Delay swapping back to the read-write region of the TB
      * until we actually need to modify the TB.  The read-only copy,
@@ -526,7 +527,6 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
-    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -580,7 +580,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
             qemu_mutex_unlock_iothread();
         }
         assert_no_pages_locked();
-        qemu_plugin_disable_mem_helpers(cpu);
     }
 
     /*
@@ -1004,7 +1003,6 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
-            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(sc, cpu);
@@ -1029,7 +1027,6 @@ static int cpu_exec_setjmp(CPUState *cpu, SyncClocks *sc)
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
         }
-        qemu_plugin_disable_mem_helpers(cpu);
 
         assert_no_pages_locked();
     }
-- 
2.34.1


