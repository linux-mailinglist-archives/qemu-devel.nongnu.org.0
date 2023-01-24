Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E967A0D0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:04:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcU-0001eP-1O; Tue, 24 Jan 2023 13:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNcF-0001al-VP
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:52 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc2-00066a-SO
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m7so1049571wru.8
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftsHmsTGZgDT5Qa4G5a0O07a98aZVecpYU74M0jo0rk=;
 b=h3R0AHc5vyoZjG/S3OaXzMXJ1Z2rsw09AHzm7pRNKTiQq1Tgkcp/Tk48stLAymfHph
 2BUoIqRkPsjnRr9IXBc62Se8HI9wf87iVUlc9qwwRUWCQxcnbGIhoyHD+K7/FWLPQeh1
 ihTbdejWD8TOHVfF7dzDu6mx4Pmj174Y/Xk/LKw4Ec60lOG/VJDPFeNmSRSa9vsyVDc1
 MBxxe3ZjMRXFLKWGwI2jOZQS9LzfEKEr/P9enQk5uDDKNdA35cu6wMkGRWzufrc3TLWJ
 sx/Efd8QnlsVhMwv4U/3kx7LDeUAaPnBuXHzCOxQnYml9zLfo9njlYO0kBLqyKQcFv7f
 IY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ftsHmsTGZgDT5Qa4G5a0O07a98aZVecpYU74M0jo0rk=;
 b=w9Ff3wtpt35uPXNzQ9Eg6o9Hsbcw+26qN6EJ815ASj2e9nYcBXquBgZNAYjXWCLxqS
 lY1fn0cZ1CKF+vd9gnU7mq3jzd51Tr0zsbUQvqqSish8BJYFAr4CmX8QXy8MSmES+6bF
 jISOJm+jaHyz/xVxjYsJOqRPhzORw98/i/M0wEj8ASAK4GHD3tMYxQplOB9IOPtiRMPa
 8pKiWafGLf5UQToptqUJQoWl/cfFyIklg482KdDHafxe1kgCJUr5Oa42k/VZA3t63fdw
 8ozwxsjo2wTZMt5hDknYEcn0wgB3aNUUXhmhxItX2eUc/vyrTWK1he+Xq6ySI4FeQsQ1
 0vYA==
X-Gm-Message-State: AFqh2ko0HgIewgMXBgKq+quoFJ6xLII7iqn8FS3H5qCHELUNau2G7zR9
 2rjzFC5cklgAhtCy0S8B1WKK4w==
X-Google-Smtp-Source: AMrXdXsVGUuyZ6jtV3MVc7xWRcM3rtfXRjQUzL1FHA38EQ9/ITo2pnKqJJbICeGcCX8yZOSXfZTL2A==
X-Received: by 2002:adf:de81:0:b0:2bd:dc5c:7e4c with SMTP id
 w1-20020adfde81000000b002bddc5c7e4cmr24950707wrl.15.1674583296234; 
 Tue, 24 Jan 2023 10:01:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g9-20020adff3c9000000b002bfb29d19e4sm1552773wrp.88.2023.01.24.10.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCB241FFCE;
 Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 26/35] cpu: free cpu->tb_jmp_cache with RCU
Date: Tue, 24 Jan 2023 18:01:18 +0000
Message-Id: <20230124180127.1881110-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


