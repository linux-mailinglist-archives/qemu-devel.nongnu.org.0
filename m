Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA745AE36A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:49:25 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUGq-0005yN-6u
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6J-0002dj-CH
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6H-0005Wi-L5
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id c11so10072558wrp.11
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gUYWndQQ8pFmIauaAuMmFCedmEzSZQGaU3WPNExELkk=;
 b=YJPu8vRIR0CWOlnSgM+bi0cJkHIVqU/wq6eKGRxpO1++OUlBU53FkX7k9pLMY1Nv8y
 HxoJ4oAwBDOBMWjTo/V9dqkhgtW5iD8hw2J7ptP/y2X4Owuza43COFzaR/EUF8QyfusO
 VoVREo0XAi9vnszFzO4fKiCxnT4K8zBWrfF4N7RXxn2KYeiJc+4adGowFdwl6ph2CMlk
 WMyNkFeHS9zUKXoNwDj0Tj7thdV4MWYBkCXMUZnDmdFCx5SY6n72eQl8rWNO7KLqrdH8
 /F7uQYMrgZjbLAmn84BjenjjCNJZcTxg941S4D/Qcp5MqFKXp2cQoFzNyRehqqHsULGK
 eXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gUYWndQQ8pFmIauaAuMmFCedmEzSZQGaU3WPNExELkk=;
 b=IsgWe2VBN9UZgJyKs87Zq9+uGmYxgA7RBzwZm41Gxws7S/fyKcenURMBzvBy6+nSPg
 52sWeXp8JxnoIFmvVrDucagln9CQnz/TACLk4bcUHzoaiLAr2SLYu4cvH0H/o/x0pccv
 OkT77RuIrkl8dCmEUnDx8QhTmsbTRxugendtl+SoIT64afWlEtopRg5g7s2OL2f8sl9l
 Jh84Jp0n3ahSRAl4HwAiqhMlyUmzci4y14Wm+tOn5TlZTQr+3lDBfD5YpCe1iFc9twR+
 HxUUV3oA11DkRSf1wPnwUFKXKIRCz7AzUD5EJawDqZ8bNjU0xJtVc7118nYSdluyt2pJ
 1vqA==
X-Gm-Message-State: ACgBeo1yzx40abAqndu/2ie1w5Cn5Jc1P5O0ubeCeNoyUgT6axLWaHLK
 HqNvvbjeTQ8Z1et0pb+WyNzaxxqDQzH4Ovp9
X-Google-Smtp-Source: AA6agR6Nw9ZdUGAMo/VbhtJq5UxW6PZo5c8ASqXMTFQ3cA5tcLHCpJuXrssM3qjUqTH1SmIX+LNWnQ==
X-Received: by 2002:a05:6000:144a:b0:220:7181:9283 with SMTP id
 v10-20020a056000144a00b0022071819283mr25380932wrx.158.1662453508345; 
 Tue, 06 Sep 2022 01:38:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 09/20] accel/tcg: Unlock mmap_lock after longjmp
Date: Tue,  6 Sep 2022 09:38:04 +0100
Message-Id: <20220906083815.252478-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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


