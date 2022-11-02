Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93246161E4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:43:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqC8Q-0005FI-Qf; Wed, 02 Nov 2022 07:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7q-00058l-OT
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7l-00055c-RH
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667389297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRE/5HZkVNskGDDtdZR7CgqjPZxiIinW3+ucMgGb+Jo=;
 b=HzERDFOh4CHbD+Kt+jQgpN52u8TOTKSzbSHebguM/NI+MBH63WT7E4yji7On4xQgMaibvG
 cEGoN1uAe+EFEcDI/mS5IVBB+Sk3CxX65kiOkR02vIFB75LV8cf4ZtXs8BCrkeU93ZYKl3
 xlFjEAqV5C7vCJlQnWL5b6058fgZkrs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-Sdik7XHXPtKfxEnI0JwziA-1; Wed, 02 Nov 2022 07:41:36 -0400
X-MC-Unique: Sdik7XHXPtKfxEnI0JwziA-1
Received: by mail-ej1-f72.google.com with SMTP id
 qw17-20020a1709066a1100b0078e25b6a52fso9678781ejc.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 04:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRE/5HZkVNskGDDtdZR7CgqjPZxiIinW3+ucMgGb+Jo=;
 b=maXPAvG6HeI5cE5pVNT6+nmqf1yspB1ZfXA76184vk0kOnZjfIP6HJHiytcaRgUyu5
 gYWaKcQ3WiL+10LJ6e2xgtoD5q7vx+CLv7IIscetuPFRyDcXbG36YSvvvXZlnCcB6I0J
 UZPg2LAR6cwv1m3fP+hI+aWWPykzxkULzydH9E/W1/1UBVb2/+Yd4fyIgvAU5diVrvLI
 5ZEhxmFFnfWWfd8lll5fem+QvZZfvHCHZzQyRrkFD1r2jtsE2ZH1vXy2mbTS+3DDDhuB
 DP3d3jqevb2jKvxwylroIJK2TYse0I+hujPSXmvUgyhyu6LSBs0ntJIQhbOYxNcoJ5Yq
 0OTQ==
X-Gm-Message-State: ACrzQf2VnkC9rKf7ezQWBNT+Ozbi189g1bbcmAnHMkq5cFxwDx3LsP03
 +Mf/3rD1O18/fXFhpmNexTbza/VO8Fgp9dU+AZ3RHsEpnZbjjRMsd0+oFPjXWQcyl5QezrfFBxx
 1BGsHZkZUtrSGUzfzTlC/NC+UhNsDkHjsxlLNltTPuOzrC7V8nNl8YoKM6ISXsjwCqTI=
X-Received: by 2002:a17:907:6288:b0:78d:ab30:c374 with SMTP id
 nd8-20020a170907628800b0078dab30c374mr23376647ejc.266.1667389293686; 
 Wed, 02 Nov 2022 04:41:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5bz4ZYSZjyk3XelgHbtmDRYSl16PxtodEiiHgRm+CPLzoTDowmBuA7tHGAnBs2IL/L6gzjTg==
X-Received: by 2002:a17:907:6288:b0:78d:ab30:c374 with SMTP id
 nd8-20020a170907628800b0078dab30c374mr23376614ejc.266.1667389293294; 
 Wed, 02 Nov 2022 04:41:33 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906218200b0077a8fa8ba55sm5263807eju.210.2022.11.02.04.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:41:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Subject: [PULL 2/5] os-posix: asynchronous teardown for shutdown on Linux
Date: Wed,  2 Nov 2022 12:41:22 +0100
Message-Id: <20221102114125.58902-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102114125.58902-1-pbonzini@redhat.com>
References: <20221102114125.58902-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Imbrenda <imbrenda@linux.ibm.com>

This patch adds support for asynchronously tearing down a VM on Linux.

When qemu terminates, either naturally or because of a fatal signal,
the VM is torn down. If the VM is huge, it can take a considerable
amount of time for it to be cleaned up. In case of a protected VM, it
might take even longer than a non-protected VM (this is the case on
s390x, for example).

Some users might want to shut down a VM and restart it immediately,
without having to wait. This is especially true if management
infrastructure like libvirt is used.

This patch implements a simple trick on Linux to allow qemu to return
immediately, with the teardown of the VM being performed
asynchronously.

If the new commandline option -async-teardown is used, a new process is
spawned from qemu at startup, using the clone syscall, in such way that
it will share its address space with qemu.The new process will have the
name "cleanup/<QEMU_PID>". It will wait until qemu terminates
completely, and then it will exit itself.

This allows qemu to terminate quickly, without having to wait for the
whole address space to be torn down. The cleanup process will exit
after qemu, so it will be the last user of the address space, and
therefore it will take care of the actual teardown. The cleanup
process will share the same cgroups as qemu, so both memory usage and
cpu time will be accounted properly.

If possible, close_range will be used in the cleanup process to close
all open file descriptors. If it is not available or if it fails, /proc
will be used to determine which file descriptors to close.

If the cleanup process is forcefully killed with SIGKILL before the
main qemu process has terminated completely, the mechanism is defeated
and the teardown will not be asynchronous.

This feature can already be used with libvirt by adding the following
to the XML domain definition to pass the parameter to qemu directly:

  <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
  <arg value='-async-teardown'/>
  </commandline>

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Tested-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Message-Id: <20220812133453.82671-1-imbrenda@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/async-teardown.h |  22 +++++
 meson.build                   |   1 +
 os-posix.c                    |   6 ++
 qemu-options.hx               |  19 +++++
 util/async-teardown.c         | 150 ++++++++++++++++++++++++++++++++++
 util/meson.build              |   1 +
 6 files changed, 199 insertions(+)
 create mode 100644 include/qemu/async-teardown.h
 create mode 100644 util/async-teardown.c

diff --git a/include/qemu/async-teardown.h b/include/qemu/async-teardown.h
new file mode 100644
index 000000000000..092e7a37e7af
--- /dev/null
+++ b/include/qemu/async-teardown.h
@@ -0,0 +1,22 @@
+/*
+ * Asynchronous teardown
+ *
+ * Copyright IBM, Corp. 2022
+ *
+ * Authors:
+ *  Claudio Imbrenda <imbrenda@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef QEMU_ASYNC_TEARDOWN_H
+#define QEMU_ASYNC_TEARDOWN_H
+
+#include "config-host.h"
+
+#ifdef CONFIG_LINUX
+void init_async_teardown(void);
+#endif
+
+#endif
diff --git a/meson.build b/meson.build
index 37737913df6a..17834b3c3def 100644
--- a/meson.build
+++ b/meson.build
@@ -1949,6 +1949,7 @@ if targetos == 'windows'
 endif
 
 # has_function
+config_host_data.set('CONFIG_CLOSE_RANGE', cc.has_function('close_range'))
 config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
 config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
diff --git a/os-posix.c b/os-posix.c
index 321fc4bd13b8..4858650c3e38 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -39,6 +39,7 @@
 
 #ifdef CONFIG_LINUX
 #include <sys/prctl.h>
+#include "qemu/async-teardown.h"
 #endif
 
 /*
@@ -150,6 +151,11 @@ int os_parse_cmd_args(int index, const char *optarg)
     case QEMU_OPTION_daemonize:
         daemonize = 1;
         break;
+#if defined(CONFIG_LINUX)
+    case QEMU_OPTION_asyncteardown:
+        init_async_teardown();
+        break;
+#endif
     default:
         return -1;
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index eb38e5dc40bc..e26d1dad3990 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4774,6 +4774,25 @@ HXCOMM Internal use
 DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
 DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
 
+#ifdef __linux__
+DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
+    "-async-teardown enable asynchronous teardown\n",
+    QEMU_ARCH_ALL)
+#endif
+SRST
+``-async-teardown``
+    Enable asynchronous teardown. A new process called "cleanup/<QEMU_PID>"
+    will be created at startup sharing the address space with the main qemu
+    process, using clone. It will wait for the main qemu process to
+    terminate completely, and then exit.
+    This allows qemu to terminate very quickly even if the guest was
+    huge, leaving the teardown of the address space to the cleanup
+    process. Since the cleanup process shares the same cgroups as the
+    main qemu process, accounting is performed correctly. This only
+    works if the cleanup process is not forcefully killed with SIGKILL
+    before the main qemu process has terminated completely.
+ERST
+
 DEF("msg", HAS_ARG, QEMU_OPTION_msg,
     "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
     "                control error message format\n"
diff --git a/util/async-teardown.c b/util/async-teardown.c
new file mode 100644
index 000000000000..62bfce1b3ca8
--- /dev/null
+++ b/util/async-teardown.c
@@ -0,0 +1,150 @@
+/*
+ * Asynchronous teardown
+ *
+ * Copyright IBM, Corp. 2022
+ *
+ * Authors:
+ *  Claudio Imbrenda <imbrenda@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+#include <stdlib.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <dirent.h>
+#include <sys/prctl.h>
+#include <signal.h>
+#include <sched.h>
+#include <unistd.h>
+
+#include "qemu/osdep.h"
+#include "qemu/async-teardown.h"
+
+#ifdef _SC_THREAD_STACK_MIN
+#define CLONE_STACK_SIZE sysconf(_SC_THREAD_STACK_MIN)
+#else
+#define CLONE_STACK_SIZE 16384
+#endif
+
+static pid_t the_ppid;
+
+/*
+ * Close all open file descriptors.
+ */
+static void close_all_open_fd(void)
+{
+    struct dirent *de;
+    int fd, dfd;
+    DIR *dir;
+
+#ifdef CONFIG_CLOSE_RANGE
+    int r = close_range(0, ~0U, 0);
+    if (!r) {
+        /* Success, no need to try other ways. */
+        return;
+    }
+#endif
+
+    dir = opendir("/proc/self/fd");
+    if (!dir) {
+        /* If /proc is not mounted, there is nothing that can be done. */
+        return;
+    }
+    /* Avoid closing the directory. */
+    dfd = dirfd(dir);
+
+    for (de = readdir(dir); de; de = readdir(dir)) {
+        fd = atoi(de->d_name);
+        if (fd != dfd) {
+            close(fd);
+        }
+    }
+    closedir(dir);
+}
+
+static void hup_handler(int signal)
+{
+    /* Check every second if this process has been reparented. */
+    while (the_ppid == getppid()) {
+        /* sleep() is safe to use in a signal handler. */
+        sleep(1);
+    }
+
+    /* At this point the parent process has terminated completely. */
+    _exit(0);
+}
+
+static int async_teardown_fn(void *arg)
+{
+    struct sigaction sa = { .sa_handler = hup_handler };
+    sigset_t hup_signal;
+    char name[16];
+
+    /* Set a meaningful name for this process. */
+    snprintf(name, 16, "cleanup/%d", the_ppid);
+    prctl(PR_SET_NAME, (unsigned long)name);
+
+    /*
+     * Close all file descriptors that might have been inherited from the
+     * main qemu process when doing clone, needed to make libvirt happy.
+     * Not using close_range for increased compatibility with older kernels.
+     */
+    close_all_open_fd();
+
+    /* Set up a handler for SIGHUP and unblock SIGHUP. */
+    sigaction(SIGHUP, &sa, NULL);
+    sigemptyset(&hup_signal);
+    sigaddset(&hup_signal, SIGHUP);
+    sigprocmask(SIG_UNBLOCK, &hup_signal, NULL);
+
+    /* Ask to receive SIGHUP when the parent dies. */
+    prctl(PR_SET_PDEATHSIG, SIGHUP);
+
+    /*
+     * Sleep forever, unless the parent process has already terminated. The
+     * only interruption can come from the SIGHUP signal, which in normal
+     * operation is received when the parent process dies.
+     */
+    if (the_ppid == getppid()) {
+        pause();
+    }
+
+    /* At this point the parent process has terminated completely. */
+    _exit(0);
+}
+
+/*
+ * Allocate a new stack of a reasonable size, and return a pointer to its top.
+ */
+static void *new_stack_for_clone(void)
+{
+    size_t stack_size = CLONE_STACK_SIZE;
+    char *stack_ptr;
+
+    /* Allocate a new stack and get a pointer to its top. */
+    stack_ptr = qemu_alloc_stack(&stack_size);
+#if !defined(HOST_HPPA)
+    /* The top is at the end of the area, except on HPPA. */
+    stack_ptr += stack_size;
+#endif
+
+    return stack_ptr;
+}
+
+/*
+ * Block all signals, start (clone) a new process sharing the address space
+ * with qemu (CLONE_VM), then restore signals.
+ */
+void init_async_teardown(void)
+{
+    sigset_t all_signals, old_signals;
+
+    the_ppid = getpid();
+
+    sigfillset(&all_signals);
+    sigprocmask(SIG_BLOCK, &all_signals, &old_signals);
+    clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
+    sigprocmask(SIG_SETMASK, &old_signals, NULL);
+}
diff --git a/util/meson.build b/util/meson.build
index 5e282130df85..63acd59bb02c 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -2,6 +2,7 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
 if not config_host_data.get('CONFIG_ATOMIC64')
   util_ss.add(files('atomic64.c'))
 endif
+util_ss.add(when: 'CONFIG_LINUX', if_true: files('async-teardown.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
 if config_host_data.get('CONFIG_EPOLL_CREATE1')
-- 
2.38.1


