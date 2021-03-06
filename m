Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DE832F983
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:58:48 +0100 (CET)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUdy-0002la-Lz
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZp-0005nd-C0
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:29 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZn-00085o-Rl
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id u187so3209298wmg.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpgVdYSzdMxvMpKTq0UQMyhdFpOkljUuOG/KLvehJyo=;
 b=NPmmzIYfDV5vnk1MzI9OUY+YS4Zeg/DfmvF8Kq1/HCGBAcUB378x+Rw3gAJldJGyNp
 htVSnR9KeBtEvF3Lb7Jv/bvrQpnfayiEm6uGJTyX3AdoxlcSSSl/0DfkQWotwS1/RzyO
 2H0f8ZAPtC368Q5elH1zynYBYUNOxQnDFD3Jl2yZrgSN7qelqcShhLGN6yQKxYt7jBa5
 0Ma1RM6zns2ADGghQMRws6WEHz3I9EhHSoJ/gXu3q0Y85jwDCc2dGPhR8eWAaCqxH14E
 dWUIajZ2HVtA+24rcD00WoaebNFhk42le/6+zEpSS8jgn5TCicQvQMJDnomd1ovRrrB9
 Rn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jpgVdYSzdMxvMpKTq0UQMyhdFpOkljUuOG/KLvehJyo=;
 b=lMXNwaKxrQh5DTBrJf5y+nN81N2LK3cLAuuG5stMGlg1xtB/2W6NCIiq6840w9u5ZF
 oqSe5qNJlAuTITxwbJx9uOe817SfLJNQJPZqjY//pxkGjSKirjlBHDVn3PPPl3AFoMgv
 3ma7bnVQBpMBA8KM9AhO968CCV+e8xteEDzvOtnzGqblHQBtuxIkjwZe5Bivy7FKIQq4
 xg2qTKSWtPWvRfEcMoQNlthWvVRcRfBHBiYKeimlBWiAVlZxVZ6f4xoyzsO+uNBMzUOZ
 aRevO9LJnnpsn1ldgpHNiYSCU3JdDhoICs2V/+ZoPWzERdthWMso1xVUUUNn97qaRNq2
 Y5Sg==
X-Gm-Message-State: AOAM533LEjpOKw1dKp2w3Ux4odHpsWO+t9MAdjvDl9ksqqImnIFqX/tU
 KnYlzYYb9skLaoJZfiPQq0fQHI9CjCg=
X-Google-Smtp-Source: ABdhPJyNrTyG2SEZK85bwfGKCYoyZcCr1wi0SB5Vrd82WvL3dGZ4fi4/brGneQjOht/IsHNABnl16g==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr1622742wmc.3.1615028066577; 
 Sat, 06 Mar 2021 02:54:26 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] vl.c: do not execute trace_init_backends() before
 daemonizing
Date: Sat,  6 Mar 2021 11:54:02 +0100
Message-Id: <20210306105419.110503-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

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
Message-Id: <20210105181437.538366-2-danielhb413@gmail.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 10bd8a10a3..7e8110bd6e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2361,11 +2361,6 @@ static void qemu_process_early_options(void)
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
@@ -3475,6 +3470,19 @@ void qemu_init(int argc, char **argv, char **envp)
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
2.29.2



