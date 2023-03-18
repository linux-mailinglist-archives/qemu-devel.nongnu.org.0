Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D06BF9AC
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1W-0004oY-Ka; Sat, 18 Mar 2023 07:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1Q-0004mN-6e
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1N-0007CN-IO
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i9so6503439wrp.3
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzwVPyl6zFffVcbALWo6RAkex0HcIAEnoyVVy8mFUiU=;
 b=ka3e1sDULLWog8EgTaZllvHZ94IZfvs8l9gYkgEQGgbfo+Zgnb0wY9CsBP+MmRVqU1
 1u+Phzw8DDEQcacwbf79Br2NNpTtBVg9pk8m7R53tzxAb244mKVZt3Np7FIt0CJM9QYM
 /mk+5VOkFl47FzhW6q+rIQVQhYFXGj3mIelhfIqXgOzgdn8YnUUTeLb5NAww6fLU0xQu
 Lm30EtOnMP9WIQAzZX4GdiYfzH14aZsqp/p73K11n8Y0FjOvYKVDCwJEI0wHkqg7mp34
 L1frCQKlZZOrCXNaXSoPPfkpGlLAj9Ci6uMCeMP405KBcbbTaYjPtWy+H0IJziTiqICi
 ITow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzwVPyl6zFffVcbALWo6RAkex0HcIAEnoyVVy8mFUiU=;
 b=jDEI2SQnTeh+MaTp87VsdJFej+VyyUP4y39bHoPKq8OYRbZCTfGKrjUHLzuQ/16i/k
 3EtkBO02YRTLURG3u2DVBZa3hc/83tTFszRGjWpRXdL9OCj5S2rBMjHRxN0zKOMkrzza
 EQTfz5gRlVCbO46KbNQVC1XvsMJAWECx0DBIPUulkjcojp7E4LrLzE6uqmDPyjJXt0hf
 Hvqd1ooKPuxvboasyPN/mz20swMOWfqZlJtDqkYTek0Bwo9pic1wK1x/BYDKWOdh5TCG
 0KAxNRiwkniV+Gh3YawwmdohUCOUmI48iFSohFv0oP8eI9829YY8GnX27eQ2dNaOBc0+
 LKKQ==
X-Gm-Message-State: AO0yUKV47gfOf/rSr6GF5/ByeixFuCxGVOsocVtUHs7Gm0AG9lndz/dE
 nRT6SluUv6kdfikSBtTopZTwew==
X-Google-Smtp-Source: AK7set9SG5gB1zH/AC7rsJHQlNPdLxahcYf11qvGGtH7pjwcE6l4LMlxE4ZYAI1AbufbF1M43grjSA==
X-Received: by 2002:adf:f5cc:0:b0:2d4:4f2b:965d with SMTP id
 k12-20020adff5cc000000b002d44f2b965dmr2032190wrp.51.1679140008852; 
 Sat, 18 Mar 2023 04:46:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffc48000000b002c8476dde7asm4120308wrs.114.2023.03.18.04.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 708B01FFC1;
 Sat, 18 Mar 2023 11:46:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 09/31] tcg: Clear plugin_mem_cbs on TB exit
Date: Sat, 18 Mar 2023 11:46:22 +0000
Message-Id: <20230318114644.1340899-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
adjacent to where we reset can_do_io.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230310195252.210956-2-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230315174331.2959-12-alex.bennee@linaro.org>

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
2.39.2


