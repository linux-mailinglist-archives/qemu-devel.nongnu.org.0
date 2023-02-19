Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4469C157
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 17:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTmhc-0006PO-Uu; Sun, 19 Feb 2023 11:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmha-0006P6-Rq
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:15 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhY-0006mU-FK
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:14 -0500
Received: by mail-ed1-x534.google.com with SMTP id k5so4176908edo.3
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUnT3ujPcgcf9Q4OleidIWlUvOyf8yl/vIkF0lAkYrk=;
 b=79QX9xSL2gUe4/u4ZHGcx+ulxchMGyHAC2QAoYChECC1DJSQBa1e8G3gcqsvi1PRDA
 VcHClz+BK0dsqiS1tMk/T3BVqpwITYA2Xjurdo2+hbJp0haGFZUfe3stqDtM/1CDf1Tr
 TKqWgA+4efBRqKxz3VEZb8/x5mkZL5NKcWwoVrnzIw2h+PtyNTsVU3gWi+crYMHoyLhO
 +D4bvYrBqLHAb44gD+wHJZ5BPaZ45LzgetQZ16Dq+M3v7FAb/q9mZZGSsl6whY4A/lHk
 mlp0vLkfgfn83WJsbhrXVt8zbo6sGk1FCWxz1M8hJdSH9Nld9ITGZz62ku+sQarLGeEU
 o32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sUnT3ujPcgcf9Q4OleidIWlUvOyf8yl/vIkF0lAkYrk=;
 b=CxwwIoGUbTccuzVNeJ7uWLHY6JvNxUsQL8d84/eogjzYrliMmRZKY62JxqMWn8QFgT
 yh3ZtlqqhOFHPUMhep4MwKKz7h81NClgzRx8L77I05GOkI6pb/KiiayxMFKyUeTN7zdM
 Q2jEhHjRBlw4IRp1dcZ5fC9kI02OFdNtTQlpVX1G8X4akkJ3rDmH03eXOtRw69cTu0Ac
 IJu442u+RVnG+IDkh3dZn4X/eic27nDU5XsSbsKMymHxzHFqacsyxK8DmipYNqhCOUjF
 HkFd6B8yHZX9qZehRMB1HeydoDzg/vHK0JzwI3TbZmtbeqDc5bM0YVOhrMgxpK065wK6
 Uyug==
X-Gm-Message-State: AO0yUKU0OAumg8Lg5bwjneI6vtDKqTEgy8tozh8No/TwVxT9Is0uEX1B
 Tnc0EQn1GzeOAFONzmsUftxZyQ==
X-Google-Smtp-Source: AK7set9u2M4Qi4kBIcXcrX4ozbwOvbqVRpr2Rp4TSBRaPXCbLDLq9oo3O3+ONFwHhtgz41YClj+xHQ==
X-Received: by 2002:a17:906:d154:b0:881:44e3:baae with SMTP id
 br20-20020a170906d15400b0088144e3baaemr4914519ejb.54.1676824690979; 
 Sun, 19 Feb 2023 08:38:10 -0800 (PST)
Received: from localhost.localdomain ([193.33.38.48])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1709066b8d00b008cdb0628991sm647516ejr.57.2023.02.19.08.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:38:09 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
Date: Sun, 19 Feb 2023 18:20:59 +0200
Message-Id: <20230219162100.174318-5-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230219162100.174318-1-andrew@daynix.com>
References: <20230219162100.174318-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Helper program. Loads eBPF RSS program and maps and passes them through unix socket.
Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
Also, libbpf dependency for now is exclusively for Linux.
Libbpf is used for eBPF RSS steering, which is supported only by Linux TAP.
There is no reason yet to build eBPF loader and helper for non-Linux systems,
even if libbpf is present.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/qemu-ebpf-rss-helper.c | 132 ++++++++++++++++++++++++++++++++++++
 meson.build                 |  37 ++++++----
 2 files changed, 156 insertions(+), 13 deletions(-)
 create mode 100644 ebpf/qemu-ebpf-rss-helper.c

diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c
new file mode 100644
index 0000000000..348d26bcdd
--- /dev/null
+++ b/ebpf/qemu-ebpf-rss-helper.c
@@ -0,0 +1,132 @@
+/*
+ * eBPF RSS Helper
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Description: This is helper program for libvirtd.
+ *              It loads eBPF RSS program and passes fds through unix socket.
+ *              Built by meson, target - 'qemu-ebpf-rss-helper'.
+ */
+
+#include <stdio.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <getopt.h>
+#include <memory.h>
+#include <errno.h>
+#include <sys/socket.h>
+
+#include "ebpf_rss.h"
+
+#include "qemu-ebpf-rss-helper-stamp.h"
+
+void QEMU_EBPF_RSS_HELPER_STAMP(void) {}
+
+static int send_fds(int socket, int *fds, int n)
+{
+    struct msghdr msg = {};
+    struct cmsghdr *cmsg = NULL;
+    char buf[CMSG_SPACE(n * sizeof(int))];
+    char dummy_buffer = 0;
+    struct iovec io = { .iov_base = &dummy_buffer,
+                        .iov_len = sizeof(dummy_buffer) };
+
+    memset(buf, 0, sizeof(buf));
+
+    msg.msg_iov = &io;
+    msg.msg_iovlen = 1;
+    msg.msg_control = buf;
+    msg.msg_controllen = sizeof(buf);
+
+    cmsg = CMSG_FIRSTHDR(&msg);
+    cmsg->cmsg_level = SOL_SOCKET;
+    cmsg->cmsg_type = SCM_RIGHTS;
+    cmsg->cmsg_len = CMSG_LEN(n * sizeof(int));
+
+    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
+
+    return sendmsg(socket, &msg, 0);
+}
+
+static void print_help_and_exit(const char *prog, int exitcode)
+{
+    fprintf(stderr, "%s - load eBPF RSS program for qemu and pass eBPF fds"
+            " through unix socket.\n", prog);
+    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file descriptor"
+            " used to pass eBPF fds.\n");
+    fprintf(stderr, "\t--help, -h - this help.\n");
+    exit(exitcode);
+}
+
+int main(int argc, char **argv)
+{
+    char *fd_string = NULL;
+    int unix_fd = 0;
+    struct EBPFRSSContext ctx = {};
+    int fds[EBPF_RSS_MAX_FDS] = {};
+    int ret = -1;
+
+    for (;;) {
+        int c;
+        static struct option long_options[] = {
+                {"help",  no_argument, 0, 'h'},
+                {"fd",  required_argument, 0, 'f'},
+                {0, 0, 0, 0}
+        };
+        c = getopt_long(argc, argv, "hf:",
+                long_options, NULL);
+
+        if (c == -1) {
+            break;
+        }
+
+        switch (c) {
+        case 'f':
+            fd_string = optarg;
+            break;
+        case 'h':
+        default:
+            print_help_and_exit(argv[0],
+                    c == 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
+        }
+    }
+
+    if (!fd_string) {
+        fprintf(stderr, "Unix file descriptor not present.\n");
+        print_help_and_exit(argv[0], EXIT_FAILURE);
+    }
+
+    unix_fd = atoi(fd_string);
+
+    if (!unix_fd) {
+        fprintf(stderr, "Unix file descriptor is invalid.\n");
+        return EXIT_FAILURE;
+    }
+
+    ebpf_rss_init(&ctx);
+    if (!ebpf_rss_load(&ctx)) {
+        fprintf(stderr, "Can't load ebpf.\n");
+        return EXIT_FAILURE;
+    }
+    fds[0] = ctx.program_fd;
+    fds[1] = ctx.map_configuration;
+    fds[2] = ctx.map_toeplitz_key;
+    fds[3] = ctx.map_indirections_table;
+
+    ret = send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
+    if (ret < 0) {
+        fprintf(stderr, "Issue while sending fds: %s.\n", strerror(errno));
+    }
+
+    ebpf_rss_unload(&ctx);
+
+    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
diff --git a/meson.build b/meson.build
index b409912aed..6e6e2f3e40 100644
--- a/meson.build
+++ b/meson.build
@@ -1632,19 +1632,22 @@ elif get_option('vduse_blk_export').disabled()
 endif
 
 # libbpf
-libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
-if libbpf.found() and not cc.links('''
-   #include <bpf/libbpf.h>
-   int main(void)
-   {
-     bpf_object__destroy_skeleton(NULL);
-     return 0;
-   }''', dependencies: libbpf)
-  libbpf = not_found
-  if get_option('bpf').enabled()
-    error('libbpf skeleton test failed')
-  else
-    warning('libbpf skeleton test failed, disabling')
+libbpf = not_found
+if targetos == 'linux'
+  libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
+  if libbpf.found() and not cc.links('''
+    #include <bpf/libbpf.h>
+    int main(void)
+    {
+      bpf_object__destroy_skeleton(NULL);
+      return 0;
+    }''', dependencies: libbpf)
+    libbpf = not_found
+    if get_option('bpf').enabled()
+      error('libbpf skeleton test failed')
+    else
+      warning('libbpf skeleton test failed, disabling')
+    endif
   endif
 endif
 
@@ -3646,6 +3649,14 @@ if have_tools
                dependencies: [authz, crypto, io, qom, qemuutil,
                               libcap_ng, mpathpersist],
                install: true)
+
+    if libbpf.found()
+        executable('qemu-ebpf-rss-helper', files(
+                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c'),
+                   dependencies: [qemuutil, libbpf, glib],
+                   install: true,
+                   install_dir: get_option('libexecdir'))
+    endif
   endif
 
   if have_ivshmem
-- 
2.39.1


