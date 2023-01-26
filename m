Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B067C9EA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:30:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Lh-00047S-L7; Thu, 26 Jan 2023 06:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LW-00032u-Ho
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:10 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LU-0004MV-Fb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:10 -0500
Received: by mail-wr1-x429.google.com with SMTP id m14so969117wrg.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJmfcRUvWgySiHRRzSTiq8BtkDV3N+un1/AMo4mWGPE=;
 b=lgcJTr0XRYnZNZfaLecz5ubSSNps8VZmMdDRoDXucd4Buo5d1cQ0sHY1wpLCETngde
 hsD2wm/65/w9mQMlu01nzU1mxVYhc+MvzjNKN4DQczXiH8vhCBHunxnuH0gOatidVPHc
 KGau5cLcA3Kiy/Fba2IKHjeDOThi4wsVCFw+dcN/LJGJGgNL0coUgZywa8ZwZrH/Nkiq
 EIZRzMx3iRiXudN04B1bKTSDj8rQ3N+V2Hb/LfpjibPczB2PMoPxtSCD9VJ9wzXCdMeC
 pjXX1XotWc+0AM4RXkl5/L4XVi+bILUlY8Q5jUUiGE0br197cB39NJb0x/oaojHSuniJ
 c3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJmfcRUvWgySiHRRzSTiq8BtkDV3N+un1/AMo4mWGPE=;
 b=glSdj6nbgeu2WYHSjiqLxzBESR1k5lG+kB+8nLDXEN/uu0HFFrBjn5sw1sccQYGarg
 piJgQRyEiNR+wQXAnnNN1wlJez+U2RxVSSfF+FYn4R4ZqKDGdF+D2RM8fCEYswtWw0by
 MLZEWwBmNKlvwB1rTWjTrly/VTn9OTy7/8N6wfmTV+S/MZzUm/ltOaJbUXhGP2u5b4fA
 RQ2jg8Xco+JkdmsfuVjvzWdm0/8eZXAtJ1QO+bgOjXnAbhla7vT3eDJFF2syYQWp8GB5
 Kp5hln77BFQ8BrXzkKN8Y0TAC8P3Ve1cfCk1g+p/OwUbO0VtbpL3UYM9v7qt29dnP3Nc
 l39g==
X-Gm-Message-State: AFqh2kqfO/CYjVJ8vPt6jAXTOhcouVzK5/SQYZqjTAXRug1H+wqjRcMK
 nq5B7CdmrI+l8bl8E0PcCPJl2A==
X-Google-Smtp-Source: AMrXdXtIvA3iYn9N05YUN9zMGmQMcKGio7IYRAvCQXK80mHlzPcnxBhowQiXr5NWJPYO8rdowfNIsw==
X-Received: by 2002:a5d:6d41:0:b0:2bb:328b:a66d with SMTP id
 k1-20020a5d6d41000000b002bb328ba66dmr30425971wri.60.1674732186648; 
 Thu, 26 Jan 2023 03:23:06 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002be5becdb89sm1067929wru.3.2023.01.26.03.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5AFD51FFCA;
 Thu, 26 Jan 2023 11:22:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 26/35] cpu: free cpu->tb_jmp_cache with RCU
Date: Thu, 26 Jan 2023 11:22:41 +0000
Message-Id: <20230126112250.2584701-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

From: Emilio Cota <cota@braap.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111151628.320011-2-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-27-alex.bennee@linaro.org>

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
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 04cd1f3092..25ec73ef9a 100644
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


