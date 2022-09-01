Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C25A8F63
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:09:50 +0200 (CEST)
Received: from localhost ([::1]:58300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeKk-0001Dw-14
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4Q-0005wY-RO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4O-0003Gc-Hu
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id n17so21009012wrm.4
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gUYWndQQ8pFmIauaAuMmFCedmEzSZQGaU3WPNExELkk=;
 b=IM7jwaxmOUDVeG2/cg1ZPLivWqbYBIxS52tq3zFVJtiCLm92JdI/a48MItt0w22vrl
 JRm1VJz1ke4g/CaU9xaFeRdvXGStdU2gSs9TxuiWzOGA5BmtT+ilRaAIpQyZ5iEY7jyB
 aSMOHihdKrssF8K20WZPiECt8mm5MkwkECkzjFdIoQ1JD+SfvhaiM6GaESBh2rc30glQ
 CcwX19XmOrafpoEm9qw3KA3LrfdvdhyM6SyR5H9YegtneUtzzaDES4o8N/xC0ZZyqb8h
 8oHi4/uZRljJyDmEOfm/iQWucPQoKQVb1SwuUCIMf3YpQPIXvqzLr5PTVkrPF4Wkk9ON
 3ZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gUYWndQQ8pFmIauaAuMmFCedmEzSZQGaU3WPNExELkk=;
 b=j7YvohPk+e+2LB04KIo/nHP74WHeduoKVpxe5vQPKacEuWVuSXFiHYMGD7aclHE498
 jOh5jforUBrfCEVQsLfQIWQ734S6Lkkz8h+8ljd84eJsT72QX40QeOa783Ko6qnQieLf
 bbAm0eBcm8WdLO4bQ1KfLI0AhfNVOiJVLJG/PbMmLX572jqkicaXTo4MOmutjcViDj+7
 anDTsWQpRxWMUya1Bmos383Kj5lvNYoOWF0bJcGS2XFPAt6EYcAXd4GLQ7gZIaTMxpRg
 TdanOR7OabyExDEh8wT23YP5OxDBRZ1c5+MH0cZWQFefHVYv8ofLY++EzJz0pbS54fsH
 2VCA==
X-Gm-Message-State: ACgBeo2zN1FEM8nNwn67pI1M18gencbF2uHBSocP3UxOcVcoEYA41SeP
 KKKEMm8pt/Jhnc9qkG2V+XlVECqkwWO5ns15
X-Google-Smtp-Source: AA6agR5eduiWgDYQGWmub894VlZnEs9Y0nZNoqxHncpWJYa6w7W2JvHQfIThq4xahfj6Fhb49nc64Q==
X-Received: by 2002:adf:e310:0:b0:226:d19c:de22 with SMTP id
 b16-20020adfe310000000b00226d19cde22mr12826757wrj.314.1662015173733; 
 Wed, 31 Aug 2022 23:52:53 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 09/20] accel/tcg: Unlock mmap_lock after longjmp
Date: Thu,  1 Sep 2022 07:51:59 +0100
Message-Id: <20220901065210.117081-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

The mmap_lock is held around tb_gen_code.  While the comment
is correct that the lock is dropped when tb_gen_code runs out
of memory, the lock is *not* dropped when an exception is
raised reading code for translation.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c  | 12 ++++++------
 accel/tcg/user-exec.c |  3 ---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a565a3f8ec..d18081ca6f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -462,13 +462,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
-        /*
-         * The mmap_lock is dropped by tb_gen_code if it runs out of
-         * memory.
-         */
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
@@ -936,7 +934,9 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 2bc4394b80..521aa8b61e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -80,10 +80,7 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
          * (and if the translator doesn't handle page boundaries correctly
          * there's little we can do about that here).  Therefore, do not
          * trigger the unwinder.
-         *
-         * Like tb_gen_code, release the memory lock before cpu_loop_exit.
          */
-        mmap_unlock();
         *pc = 0;
         return MMU_INST_FETCH;
     }
-- 
2.34.1


