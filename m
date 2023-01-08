Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1AB6616C1
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:40:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYhz-0000wE-4i; Sun, 08 Jan 2023 11:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYhx-0000tI-66
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:41 -0500
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYhv-0002ei-Dp
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:40 -0500
Received: by mail-qv1-xf32.google.com with SMTP id o17so4631600qvn.4
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2355NoDCE5lj81ub3moTL5Yl3xuNfaymEqLI/iKbB2c=;
 b=M54ZFBoM26eP7s4T6OEu1TrNnE/34XHoPdfcM2I8VCYh6Sa1+TXrcbqiCKNpy+PjtS
 /txv9JoXJ3j3gRrDPqtHhs7uSeWfrzry/qwihZytk1G7c9ZAyjCmJNmETSD9QL5BRj+I
 fTOB6TLx8Trfcjyk3RvIfXIUhBxhJHaNx+WAsfwyuLnrIstHpvDFzXxmjaaCUs0V9/Gt
 lsKLNSmiXNvvhZX5PXRYVIbs7jY4Hj6/HTCrw6LM3HQGFaJFiN5l4lVmJw8DwzBfGOFg
 DhaR3XMtAQclBp7eQs678QK07ijwrG8ZJK/W/iP6mfXqt2srhEXW0zFlJ2lRux91zYQu
 Ud9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2355NoDCE5lj81ub3moTL5Yl3xuNfaymEqLI/iKbB2c=;
 b=lisqOLFUZAGx1wwZeszNva9eXupCnOgchyqyPfODsaQAh69KamzT7zCfTJLey8j6jO
 croENMEiAUX6QOoWQDiljNCnnPpdwRuwpzC6zE/VdMwiRHUcg5sRVR0uOJ+9KQ+Wo6bt
 P8rbEdFUvzYGps5TECc+g74MR7piosc7qdTRhElgfk8qwCcjmi0GeOAIoqBo7QgGXiUq
 kksKz1lGMXNOrfmpWVgT8bUUvhuuijZkAhVWxO6kn9C5FYofsFMgXF2peO/HiGTnxL//
 kTp3wuTOp2Rd+tvhqrB9gyOni2O7XtLCzfflBYaxc+2cgoWoHugNmgY5rEDanUsS2TfO
 W7RQ==
X-Gm-Message-State: AFqh2krcG+CQyH0WmyYx3BVR9cL6sc6C9LElsj2vPJaq7qa4hcbFsi1U
 KG5CYDU6XlXLqSsjqO2gQ1WEcNyvdqkrwMhtR73mJA==
X-Google-Smtp-Source: AMrXdXvRsyCtLTP3Q4yeOHrsNMM6HRWGMKLr7/8nmRpxT0TFQC/ufj/152YsgDHtXKeLWN8pG2nT/Q==
X-Received: by 2002:a05:6214:5e04:b0:4bb:7a71:c35f with SMTP id
 li4-20020a0562145e0400b004bb7a71c35fmr86857142qvb.46.1673195978154; 
 Sun, 08 Jan 2023 08:39:38 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 dm42-20020a05620a1d6a00b00705bac8891esm92429qkb.40.2023.01.08.08.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:39:37 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH 1/4] cpu: free cpu->tb_jmp_cache with RCU
Date: Sun,  8 Jan 2023 11:39:02 -0500
Message-Id: <20230108163905.59601-2-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108163905.59601-1-cota@braap.org>
References: <20230108163905.59601-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::f32;
 envelope-from=cota@braap.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Fixes the appended use-after-free. The root cause is that
during tb invalidation we use CPU_FOREACH, and therefore
to safely free a vCPU we must wait for an RCU grace period
to elapse.

$ x86_64-linux-user/qemu-x86_64 tests/tcg/x86_64-linux-user/munmap-pthread
=================================================================
==1800604==ERROR: AddressSanitizer: heap-use-after-free on address 0x62d0005f7418 at pc 0x5593da6704eb bp 0x7f4961a7ac70 sp 0x7f4961a7ac60
READ of size 8 at 0x62d0005f7418 thread T2
    #0 0x5593da6704ea in tb_jmp_cache_inval_tb ../accel/tcg/tb-maint.c:244
    #1 0x5593da6704ea in do_tb_phys_invalidate ../accel/tcg/tb-maint.c:290
    #2 0x5593da670631 in tb_phys_invalidate__locked ../accel/tcg/tb-maint.c:306
    #3 0x5593da670631 in tb_invalidate_phys_page_range__locked ../accel/tcg/tb-maint.c:542
    #4 0x5593da67106d in tb_invalidate_phys_range ../accel/tcg/tb-maint.c:614
    #5 0x5593da6a64d4 in target_munmap ../linux-user/mmap.c:766
    #6 0x5593da6dba05 in do_syscall1 ../linux-user/syscall.c:10105
    #7 0x5593da6f564c in do_syscall ../linux-user/syscall.c:13329
    #8 0x5593da49e80c in cpu_loop ../linux-user/x86_64/../i386/cpu_loop.c:233
    #9 0x5593da6be28c in clone_func ../linux-user/syscall.c:6633
    #10 0x7f496231cb42 in start_thread nptl/pthread_create.c:442
    #11 0x7f49623ae9ff  (/lib/x86_64-linux-gnu/libc.so.6+0x1269ff)

0x62d0005f7418 is located 28696 bytes inside of 32768-byte region [0x62d0005f0400,0x62d0005f8400)
freed by thread T148 here:
    #0 0x7f49627b6460 in __interceptor_free ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:52
    #1 0x5593da5ac057 in cpu_exec_unrealizefn ../cpu.c:180
    #2 0x5593da81f851  (/home/cota/src/qemu/build/qemu-x86_64+0x484851)

Signed-off-by: Emilio Cota <cota@braap.org>
---
 accel/tcg/cpu-exec.c  | 1 -
 cpu.c                 | 7 +++++++
 include/hw/core/cpu.h | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 356fe348de..ca95d21528 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1070,7 +1070,6 @@ void tcg_exec_unrealizefn(CPUState *cpu)
 #endif /* !CONFIG_USER_ONLY */
 
     tlb_destroy(cpu);
-    g_free(cpu->tb_jmp_cache);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/cpu.c b/cpu.c
index 4a7d865427..564200559f 100644
--- a/cpu.c
+++ b/cpu.c
@@ -164,6 +164,12 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #endif /* CONFIG_USER_ONLY */
 }
 
+static void cpu_free_rcu(CPUState *cpu)
+{
+    /* .tb_jmp_cache is NULL except under TCG */
+    g_free(cpu->tb_jmp_cache);
+}
+
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
 #ifndef CONFIG_USER_ONLY
@@ -181,6 +187,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     }
 
     cpu_list_remove(cpu);
+    call_rcu(cpu, cpu_free_rcu, rcu);
 }
 
 /*
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..9fefad5656 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -266,6 +266,7 @@ struct qemu_work_item;
 
 /**
  * CPUState:
+ * @rcu: Used for safe deferred memory reclamation.
  * @cpu_index: CPU index (informative).
  * @cluster_index: Identifies which cluster this CPU is in.
  *   For boards which don't define clusters or for "loose" CPUs not assigned
@@ -321,6 +322,8 @@ struct qemu_work_item;
  * State of one CPU core or thread.
  */
 struct CPUState {
+    struct rcu_head rcu;
+
     /*< private >*/
     DeviceState parent_obj;
     /* cache to avoid expensive CPU_GET_CLASS */
-- 
2.34.1


