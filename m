Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70950665EE4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcqe-0004w2-3U; Wed, 11 Jan 2023 10:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqb-0004ty-39
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:01 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqX-0001OF-AW
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:00 -0500
Received: by mail-io1-xd34.google.com with SMTP id p9so7702225iod.13
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwzyW7oZ6debHOnGp+1MstVKgcAlJPD9/UuYM93GsSg=;
 b=gRx049Ojzl6oRk4IJwclZMQyYXdiaBXqWsN1Or8ZLw7Kzh/eLgcI7+2mv3CZDLvLtn
 gyki6pQMSNSkGQP65BMBa2k/5W/mGDsGa/NPvlEuDEm0WZITII8EVwjFV/xrDCGaG7RK
 t1k8V2VRcAtctF/Yexpu2M+ic61tYrQ/QEaRBMbvuJf2A3xPQahGNC3Mb+tvfZrKOqm/
 +1aepaoX+ip2+/8nQti1EyFcTXy4KLEY3uZAYVnSFlZbFx6ijyS4q6EXSufD+StfD4xX
 2fG4RfkelANTRURls1WnnliW6P0h9En7s3PWNtcE4GtpCaOYJF6EOAzJR7v/nrwAPJn6
 SnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwzyW7oZ6debHOnGp+1MstVKgcAlJPD9/UuYM93GsSg=;
 b=wWwI/wybbzsn0zspGwguKbl84oCC4QVnJArQOiSAUcs0gqbuBj4OFF/xa9D5Wpw5yt
 ECsPWy/PzZv3Nds75k5zKDGxRMv0nUPNmxZEL5coo/2tMaEyaYv13wXMXbe1cNHA7V3v
 +VYbux9MIRrw1lNg5zjv1yJJVMFlW1ky5NklsIhushP8ibeEZucTI3flpnbY+kRo3cHW
 bCkmDZtXNASLjI74LpEna/p45Dj9jVTZOex2/wxX7PkLhadkgCuShsJTkrXFva3dY21w
 etpmubHFYBRh9dpojPft8ije0lmYc8g7MKiauDHINsCrH1GIYbu414O+c8dU13WVfLL3
 cuOQ==
X-Gm-Message-State: AFqh2ko9xfPlmmILLYW8p4FvVCLo6m30BbxKyYe+vRyq0r6yul8w8nHh
 /UaBVeos3MkmPFt+E+hP7PNZ+rCCmcPaqXbww9k=
X-Google-Smtp-Source: AMrXdXtyfeDVojRHViQnqpQjNC79wVsQka9dN6ikI0tvwvMNUz7i9vi3TjfAS64kXagyaBPlpue9RA==
X-Received: by 2002:a05:6602:87:b0:704:57c7:e440 with SMTP id
 h7-20020a056602008700b0070457c7e440mr1775647iob.5.1673450215855; 
 Wed, 11 Jan 2023 07:16:55 -0800 (PST)
Received: from localhost ([37.19.210.30]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0566022b0f00b006e00556dc9esm5146477iov.16.2023.01.11.07.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:16:55 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v3 1/5] cpu: free cpu->tb_jmp_cache with RCU
Date: Wed, 11 Jan 2023 10:16:24 -0500
Message-Id: <20230111151628.320011-2-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111151628.320011-1-cota@braap.org>
References: <20230111151628.320011-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::d34;
 envelope-from=cota@braap.org; helo=mail-io1-xd34.google.com
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
 accel/tcg/cpu-exec.c     |  3 +--
 accel/tcg/tb-jmp-cache.h |  1 +
 cpu.c                    | 11 ++++++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 356fe348de..6bd29227f3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1064,13 +1064,12 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
 /* undo the initializations in reverse order */
 void tcg_exec_unrealizefn(CPUState *cpu)
 {
-    qemu_plugin_vcpu_exit_hook(cpu);
 #ifndef CONFIG_USER_ONLY
     tcg_iommu_free_notifier_list(cpu);
 #endif /* !CONFIG_USER_ONLY */
 
     tlb_destroy(cpu);
-    g_free(cpu->tb_jmp_cache);
+    g_free_rcu(cpu->tb_jmp_cache, rcu);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index ff5ffc8fc2..b3f6e78835 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -18,6 +18,7 @@
  * a load_acquire/store_release to 'tb'.
  */
 struct CPUJumpCache {
+    struct rcu_head rcu;
     struct {
         TranslationBlock *tb;
 #if TARGET_TB_PCREL
diff --git a/cpu.c b/cpu.c
index 4a7d865427..21cf809614 100644
--- a/cpu.c
+++ b/cpu.c
@@ -176,11 +176,20 @@ void cpu_exec_unrealizefn(CPUState *cpu)
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
     }
 #endif
+
+    /* Call the plugin hook before clearing cpu->cpu_index in cpu_list_remove */
     if (tcg_enabled()) {
-        tcg_exec_unrealizefn(cpu);
+        qemu_plugin_vcpu_exit_hook(cpu);
     }
 
     cpu_list_remove(cpu);
+    /*
+     * Now that the vCPU has been removed from the RCU list, we can call
+     * tcg_exec_unrealizefn, which may free fields using call_rcu.
+     */
+    if (tcg_enabled()) {
+        tcg_exec_unrealizefn(cpu);
+    }
 }
 
 /*
-- 
2.34.1


