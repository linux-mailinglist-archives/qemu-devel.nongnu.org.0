Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6087A2EB256
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:19:01 +0100 (CET)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqv6-0001z8-EY
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwqr7-0006X1-Ue
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:14:53 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:43157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwqr5-0005Yu-HH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:14:53 -0500
Received: by mail-qv1-xf36.google.com with SMTP id et9so51765qvb.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mV7K8zjN6xvd7zeJVwxJOLVEKbcXFfIYJrtRMBAMZIk=;
 b=Y88lkKfn1Wxhrx9N9X34tc2c66gTamUHPejSDBZ6zOOILGTupZCycThNZIHe3n+N0q
 x0+U/horIdlvfbIvJkShZktphRewC2qzuVGYBZh4oKqnTZcq9o/nip2R/8jpLChbePHs
 0Jx4sJ5vgffX+Rgq3jv1RNgHY2SN4YmDUPI5wgvaF3gTje3yEtc1D6Gk3JLVrSLsImgO
 H0fWS3L2pBMzmSNv2hRqTU4HRZ0huZM593KwGuoQnYLR0CnGQa5FidL3V9h0E4OOvzA0
 edT8dcZbOlyyPmy8RLV5NyTTEVOssLJd2EHmr0MWhy8ZSFs5dtB8UipUWiPTetVk5AtZ
 5q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mV7K8zjN6xvd7zeJVwxJOLVEKbcXFfIYJrtRMBAMZIk=;
 b=cVMpTgW6PTqxkN0R11vvl/gzkkRBilDa7Wf7l7qcwUJ/nZiU/NOmGoIvi1SWrVbnu1
 FwiX4xnroiJv/V+iwVTB7GRbBFZGS9mYTMecY9nIJMgo9qsSZ5vshDcerHTRgTLReGLn
 lkvqeSuWFbAx+uqwQu89aBuyI+a1VdNbvduF2Z4SRkVftwRObaETenuGYaijckh7DRpJ
 f4/PwBg1ZnPephTc5jpsCrmAWHzVYzZLOcLeyxggbi50RRG4tZmp7gR8gCqFmvcjJOCN
 x5UUlq6dseoszXjGKMrli29IidN9pCrn4qp1ic8T2oFuKUMggt3tZaAcag/eVFmx4/Ze
 HLCA==
X-Gm-Message-State: AOAM532kL1unei8i/8scLywG+mEcRquYZxaFk8zO6Hu5ctHAkcFg2S+D
 UG3q5aXFhh2+3XCfjmunfB2CxnKQHufdpA==
X-Google-Smtp-Source: ABdhPJw8yBxIOjJSAxLm0WEeMiPuhLmFtNCmEbLd6gJr6oiWooEhB50RsQlgWMY5Ss0gn8mQSjzzNA==
X-Received: by 2002:a0c:f046:: with SMTP id b6mr814797qvl.14.1609870490432;
 Tue, 05 Jan 2021 10:14:50 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:63d2:cecd:bc88:6607:5111])
 by smtp.gmail.com with ESMTPSA id k187sm481229qkc.74.2021.01.05.10.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 10:14:49 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] vl.c: do not execute trace_init_backends() before
 daemonizing
Date: Tue,  5 Jan 2021 15:14:37 -0300
Message-Id: <20210105181437.538366-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210105181437.538366-1-danielhb413@gmail.com>
References: <20210105181437.538366-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit v5.2.0-190-g0546c0609c ("vl: split various early command line
options to a separate function") moved the trace backend init code to
the qemu_process_early_options(). Which is now being called before
os_daemonize() via qemu_maybe_daemonize().

Turns out that this change of order causes a problem when executing
QEMU in daemon mode and with CONFIG_TRACE_SIMPLE. The trace thread
is now being created by the parent, and the parent is left waiting for
a trace file flush that was registered via st_init(). The result is
that the parent process never exits.

To reproduce, fire up a QEMU process with -daemonize and with
CONFIG_TRACE_SIMPLE enabled. Two QEMU process will be left in the
host:

$ sudo ./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config -nodefaults \
  -nographic -machine none,accel=kvm:tcg -daemonize

$ ps axf | grep qemu
 529710 pts/3    S+     0:00  |       \_ grep --color=auto qemu
 529697 ?        Ssl    0:00  \_ ./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm:tcg -daemonize
 529699 ?        Sl     0:00      \_ ./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm:tcg -daemonize

The parent thread is hang in flush_trace_file:

$ sudo gdb ./x86_64-softmmu/qemu-system-x86_64 529697
(..)
(gdb) bt
 #0  0x00007f9dac6a137d in syscall () at /lib64/libc.so.6
 #1  0x00007f9dacc3c4f3 in g_cond_wait () at /lib64/libglib-2.0.so.0
 #2  0x0000555d12f952da in flush_trace_file (wait=true) at ../trace/simple.c:140
 #3  0x0000555d12f95b4c in st_flush_trace_buffer () at ../trace/simple.c:383
 #4  0x00007f9dac5e43a7 in __run_exit_handlers () at /lib64/libc.so.6
 #5  0x00007f9dac5e4550 in on_exit () at /lib64/libc.so.6
 #6  0x0000555d12d454de in os_daemonize () at ../os-posix.c:255
 #7  0x0000555d12d0bd5c in qemu_maybe_daemonize (pid_file=0x0) at ../softmmu/vl.c:2408
 #8  0x0000555d12d0e566 in qemu_init (argc=8, argv=0x7fffc594d9b8, envp=0x7fffc594da00) at ../softmmu/vl.c:3459
 #9  0x0000555d128edac1 in main (argc=8, argv=0x7fffc594d9b8, envp=0x7fffc594da00) at ../softmmu/main.c:49
(gdb)

Aside from the 'zombie' process in the host, this is directly impacting
Libvirt. Libvirt waits for the parent process to exit to be sure that the
QMP monitor is available in the daemonized process to fetch QEMU
capabilities, and as is now Libvirt hangs at daemon start waiting
for the parent thread to exit.

The fix is simple: just move the trace backend related code back to
be executed after daemonizing.

Fixes: 0546c0609cb5a8d90c1cbac8e0d64b5a048bbb19
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/vl.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0ed5c5ba93..ddf252f5f0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2354,11 +2354,6 @@ static void qemu_process_early_options(void)
                       cleanup_add_fd, NULL, &error_fatal);
 #endif
 
-    if (!trace_init_backends()) {
-        exit(1);
-    }
-    trace_init_file();
-
     /* Open the logfile at this point and set the log mask if necessary.  */
     qemu_set_log_filename(log_file, &error_fatal);
     if (log_mask) {
@@ -3458,6 +3453,19 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_process_help_options();
     qemu_maybe_daemonize(pid_file);
 
+    /*
+     * The trace backend must be initialized after daemonizing.
+     * trace_init_backends() will call st_init(), which will create the
+     * trace thread in the parent, and also register st_flush_trace_buffer()
+     * in atexit(). This function will force the parent to wait for the
+     * writeout thread to finish, which will not occur, and the parent
+     * process will be left in the host.
+     */
+    if (!trace_init_backends()) {
+        exit(1);
+    }
+    trace_init_file();
+
     qemu_init_main_loop(&error_fatal);
     cpu_timers_init();
 
-- 
2.26.2


