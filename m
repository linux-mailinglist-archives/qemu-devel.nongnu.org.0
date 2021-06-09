Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90743A0FF2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:07:39 +0200 (CEST)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv7a-0003FX-Ub
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5G-0000Lw-FV
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:14 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5D-0006tM-8L
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:14 -0400
Received: by mail-lf1-x12c.google.com with SMTP id j20so7812097lfe.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDjdmfF5W2tPz/BdMjDQWwRdeLRUFtNW7LLUnye9n/s=;
 b=SU1sSngvAC17c6KusTyJXkfrccBkxleILzVV7lds4iDftKbTpCkQohTtsMqjS0ZHlP
 5cyVwWBKCeRK73yjb63uJGPhaOzIeiqLDnH+ojc+hN1vFZHMC2lBKMObBPHxpITrW0uE
 lubpCvTYhf4ZSBa3v345cqrqcbu+cCpnrVdbnJIyBTzqrtmqxXDRoXYWpUjFjVSMHGQ+
 TUXmAFk0FjsGN+5MEQFuRn4/I5c0TeYaghRpUYYEryNNsK1HgSYuOPcwObUgm/Q2dNTN
 JymX9X9OV+00Ux5vSX9y4OlQHRhY2Ef9BhhkVANH8eL7/tP4qWu2RNIoixFObrCMIjp9
 BqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zDjdmfF5W2tPz/BdMjDQWwRdeLRUFtNW7LLUnye9n/s=;
 b=YokJZwKOwpqSjM1aM/IrRJLrb+Tcp3lO2OgXLKCjbKlYxVLHzEOQifCI4wcAMUi1mB
 p7FdA1AwWuZcVwJeehRf0BwFCT1Jb5C+3j8kHP36WwpoRfdPVGC/5a6erfbttrenRxHI
 YbFcRdwhRvOe4gGEgqhhh0GylAlLdUXY/ExmSV+S1LK8IPkxFbGC7dNluLWvERRcTggW
 KPLpBM9lcn4ZllaUN/WfSSnHhXCJwIn44HQudYjUJ6sKj/ZK9YSdekLQ20zNx8V+M31E
 BHeUWqdM8t+BOyKAedo8Rs4aASyWabPDVRmtQcHZ1IKQpvSmGUf6KRs1AKMpIlaP0zuO
 okYA==
X-Gm-Message-State: AOAM531AGUJ+MOcCrPVDgbM1V63LE8J+JM/ehg6nwNJKL1Og53r4x3PO
 15J2MtjHwe6FlNHB7tHsRPnefA==
X-Google-Smtp-Source: ABdhPJyxSBJPJ5B8vgm/AHMlKszteU+SP8CJUtec49W/iWGjA89DP/et5rhXDOQJmnvZgQV7I9bZtg==
X-Received: by 2002:a05:6512:507:: with SMTP id
 o7mr2795921lfb.453.1623233109030; 
 Wed, 09 Jun 2021 03:05:09 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id l12sm333590lfk.10.2021.06.09.03.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:05:08 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [RFC PATCH 3/5] ebpf_rss_helper: Added helper for eBPF RSS.
Date: Wed,  9 Jun 2021 13:04:55 +0300
Message-Id: <20210609100457.142570-4-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609100457.142570-1-andrew@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12c;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12c.google.com
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

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/qemu-ebpf-rss-helper.c | 130 ++++++++++++++++++++++++++++++++++++
 meson.build                 |   8 +++
 2 files changed, 138 insertions(+)
 create mode 100644 ebpf/qemu-ebpf-rss-helper.c

diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c
new file mode 100644
index 0000000000..f0379dddf2
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
+    fprintf(stderr, "FD %s\n", fd_string);
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
index 626cf932c1..ce26bddead 100644
--- a/meson.build
+++ b/meson.build
@@ -2413,6 +2413,14 @@ if have_tools
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


