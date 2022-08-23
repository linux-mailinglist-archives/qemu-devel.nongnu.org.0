Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F65B59EEA5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:08:40 +0200 (CEST)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc4d-0005WE-B2
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc23-0008Uu-8P
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:59 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc21-0001Qt-4G
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso16043053pjr.3
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+3sJUNEuXXzy90CNiiHvdm0roersCTY8EGai5wP5MQU=;
 b=zamzqE+XMJqli4/hrVaHxdLpiYKin15Ybh5CUQozwHWGhsgIwIT5NHp4CPru1YjUln
 YiBWoldxh6ty6cMmD/PHUxhg+CkmHMyG2I9j5pSJsBoqtI9bDcDcx4O2QmBtcJGIiuOC
 grvsK3/mYUL4qwo2bLp9L13xLpYDYgo5aWZ1QgqhKlIuO3OhVU1iJ7AQrtkjj7ySWWvI
 j1b0ZAXup/FulVsCxFXadkbLmXXCuroYcQOB5ibHvOUGtuEmllt0Ew5ZMJiLmKflnprE
 7J6nByv00shb8tldW5tMTUnmkKHOugu7rmN/LqEXM78aUEpIVSv69Ds37Ffvv+afaz/P
 O9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+3sJUNEuXXzy90CNiiHvdm0roersCTY8EGai5wP5MQU=;
 b=oo0gChKFYxfNp/tHng21Pc+pv75dkKfv7hUVNlMqGcLql56MYDg4dJ7Wwu5VnBgNOC
 jHc6fl50T8PM6Z+3YYD2OgB+ZINw81WwPtFmMidoogZhLbAe/SLbl3BqMA03mCgenlCG
 YX15YcxQXnaU8sF70fS4Ok5byZetkHfeFCmAbZ1ikinfe8TGqyuEh0hF4wLAcgO6Z55q
 ERsQy+ipbp2U1b0hI38Y1uA2E/Keu/1fZlb99DVy3SwBZavV+/lS685QgSQUi0UjhGg+
 SsIXmmRnN5BZlRDZ5k6UBRjqIz65PzVrd4wMwvYYU0ntXK/YZJ2GZx8q4GhCQTTBK3Fu
 tREg==
X-Gm-Message-State: ACgBeo1ABAiTlE6JKL9aFCN+NQhzwt+oLf5scPlviLrvZmQBrQpZUiKj
 GHChT8T1izXWAbzKTrWKX/sZ+T/Hv29ctQ==
X-Google-Smtp-Source: AA6agR4Agsxwqj+v/I6eJ/2me7lZ8Q+LdA9tUIYmgnK5/Axor0HMvMhxaOIaVggbGfM+tbMHJpFs6w==
X-Received: by 2002:a17:90b:3b89:b0:1fb:765c:8450 with SMTP id
 pc9-20020a17090b3b8900b001fb765c8450mr2114325pjb.205.1661292355539; 
 Tue, 23 Aug 2022 15:05:55 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, laurent@vivier.eu, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 09/20] accel/tcg: Unlock mmap_lock after longjmp
Date: Tue, 23 Aug 2022 15:05:31 -0700
Message-Id: <20220823220542.1993395-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index cd232967e6..a27d814f19 100644
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


