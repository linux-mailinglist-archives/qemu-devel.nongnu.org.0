Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32009664C65
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb8-0003XU-9I; Tue, 10 Jan 2023 12:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb5-0003Uh-2U
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:39 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb0-0001Dp-Uf
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id bn26so12618214wrb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPdVE2hCd/x5Gl1DBAkwRbdDFsCMANSJgVBRMiSNU68=;
 b=Bsex59+yEYVB/GABeTSnBAQEghj28lXiJ0latzWwi6j4CigPrKz3uIF7jmGPFv/Gpm
 oWYDqR4M/UZqXEMRcFlsf/u4UHH0RHyj1dgsambVht3UnsavC9IIsvrLLrgg9OYJabtj
 /ZxIhIdr/NBBk8QrVrsnz39qSQweYFcnvqXyFf/4NVXNpbcHo+1V25TN3ukUDivCnNSe
 3eesdanScDDznpyMs7uDzHetsPXiIutyQ4rlWHqsYF7VsjfouWjjNghQA2bH9yPNgcyw
 sPuBN7FGFfMc0xp/Mzz1GRUzUyLAvYXoRe6pz5id3aQIQ5ulT+ATjh907KadRU8lX++p
 ae/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPdVE2hCd/x5Gl1DBAkwRbdDFsCMANSJgVBRMiSNU68=;
 b=4qDFHV/ifnzmRkLbDYv02fROamgBApvYHT2VMYdeSJlIw4DaR+RnJ1XFwChycndsDJ
 l1K//w5fb4P/zo8Gapis5AayYuVbu/4S8Hiq0yHl3MOMf8knrJoMuFuWkhIC9qBENEmc
 PmSSbKXwJNNBv+mSPd9V/zfxCMidfeRI5R8tDI/FSRX+LUJUhwD5lNlcNnnlyvVm/OVg
 bUuDvnUeeGqUaXaqDjTt3m/r7S3oyMGEb8rJDqCtD6Zy/0tI65yCdhO2VI+BI284/3+B
 xggjCa0jqxojtSP57YkAWJB3BTp4CTUNLg/4d/nx+4Nwh9RBzUbGHcS8R9qhKrNIBY6l
 V8og==
X-Gm-Message-State: AFqh2krWYJ39zuNFP9mOGv9/dnHTDjTDqzksYFsU8MS2d8htV6kCEvqV
 GvND4i61iuaYDrKflc9+KnFPgw==
X-Google-Smtp-Source: AMrXdXtbGwyPlgChcWlvW0VdfdzO7eCeQ5yOMD2RFsGc6OWjsr/gQrfEoO7ojJ+FfHoV5apr9wrn0g==
X-Received: by 2002:a5d:5707:0:b0:2b9:d6ba:21f1 with SMTP id
 a7-20020a5d5707000000b002b9d6ba21f1mr12188374wrv.21.1673372374149; 
 Tue, 10 Jan 2023 09:39:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a5d452f000000b0028f9132e9ddsm11737129wra.39.2023.01.10.09.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45F431FFC9;
 Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 18/26] cpu: free cpu->tb_jmp_cache with RCU
Date: Tue, 10 Jan 2023 17:39:14 +0000
Message-Id: <20230110173922.265055-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Message-Id: <20230109224954.161672-2-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/tb-jmp-cache.h |  1 +
 accel/tcg/cpu-exec.c     |  3 +--
 cpu.c                    | 11 ++++++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

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


