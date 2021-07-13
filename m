Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0713C7370
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:41:24 +0200 (CEST)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KXD-0007aU-5f
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU6-0001sS-BY
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:10 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:33482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU4-0003NH-B0
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:10 -0400
Received: by mail-lf1-x143.google.com with SMTP id t17so51083916lfq.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIFAXXtJz54daRTppnZxbaS/RHnutE31+CJVsDQf4oc=;
 b=zRHYWcqDyKrr2FfgrJHygQskkaOyed6fs3usEC87yJ1K3ML9Tz0NT7cXRw/bOXWJli
 kbgpzbRTHwaKY7N88H3z2amU84x5omO6Qb/itST9w8fPMpSJghX4mUOKN6bKDyAS38Dm
 UJehZ34rmpcnYdOIie65DzP8nRTcoj7eiz8QIUQWghhX07dX7lIZpfdb9urS9ihwS+sg
 3OML7Sp7JgVWKYskU4Lsq01I7+ZtgpEAgYe+vPVgJsyd/TRnK7o573ICJgEzy093cGKC
 nSeNh0PCym1/pOMJX2vLsZggyFI5ih9kvBTSK9LxwBg3XL3i9Sm/7XHkNeGIor7WMGVp
 f/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AIFAXXtJz54daRTppnZxbaS/RHnutE31+CJVsDQf4oc=;
 b=EYLfq4DXmhFuAC1jD7aAYXUvi5yBkv7gjY4mC4WnWxCmm/g+GGmVHyiAyMXPdtYG/n
 0S/Ldw4Ut541d5S8Psq6Wc6gPAOUdW6hEo01gTLPfbH15Vb9z/8H2ujB7avG7ZDewQo4
 f75yWgYkiBZi28ywwFpF/VACBDIX7IDZFzBS/Td5vEXYkX8Kks8WGK9s8xFPFyebOzDs
 IwzxLe7Q0UFcc/UgV38bKBAlSQL9eO1yry+FlPveQphGP95XlZybBu+q2Y1adZ+7tPiZ
 fp+2MDfFXzIcg0KN79UhYRIqe8UTw4BBZ3Meo8L8/Y32o9vF4ndHin7OeKopCqG8Hyuz
 ywmg==
X-Gm-Message-State: AOAM531fa2a1NeiCG0u7IXGBdoOTCS60qT2J9icxF44CYryjKRxcLYzw
 GDKl1tD+wjQW/iLgowqQay4Zig==
X-Google-Smtp-Source: ABdhPJwLGFC0z0qPgIwF7Spg2yEq3i+x3sKAlXxUdxNa21hni/79LFz84N0nDgbbA7HuZnGfGDJ8iQ==
X-Received: by 2002:ac2:4e08:: with SMTP id e8mr4125719lfr.74.1626190686779;
 Tue, 13 Jul 2021 08:38:06 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id i5sm131447lfv.246.2021.07.13.08.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:38:06 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
Date: Tue, 13 Jul 2021 18:37:57 +0300
Message-Id: <20210713153758.323614-5-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713153758.323614-1-andrew@daynix.com>
References: <20210713153758.323614-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::143;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x143.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Helper program. Loads eBPF RSS program and maps and passes them through unix socket.
Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
Also, libbpf dependency now exclusively for Linux.
Libbpf is used for eBPF RSS steering, which is supported only by Linux TAP.
There is no reason yet to build eBPF loader and helper for non Linux systems,
even if libbpf is present.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/qemu-ebpf-rss-helper.c | 130 ++++++++++++++++++++++++++++++++++++
 meson.build                 |  37 ++++++----
 2 files changed, 154 insertions(+), 13 deletions(-)
 create mode 100644 ebpf/qemu-ebpf-rss-helper.c

diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c
new file mode 100644
index 0000000000..fe68758f57
--- /dev/null
+++ b/ebpf/qemu-ebpf-rss-helper.c
@@ -0,0 +1,130 @@
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
+#include "qemu-helper-stamp.h"
+
+void QEMU_HELPER_STAMP(void) {}
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
index 257e51d91b..913aa1fee5 100644
--- a/meson.build
+++ b/meson.build
@@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
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
 
@@ -2423,6 +2426,14 @@ if have_tools
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
 
   if 'CONFIG_IVSHMEM' in config_host
-- 
2.31.1


