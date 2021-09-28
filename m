Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A741B156
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:56:37 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDb2-0005Ht-I4
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY7-0003D6-BA
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:35 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY5-0004b3-BV
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id dj4so83949116edb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3G2rOFbzL2AJNth2e4x1d5wKOFB9Eezzp7M6JLqg3c=;
 b=mlb+KwuMzOZj/Cy9KqyZ2NI9MSDH68FXQm3CycHWppnB2u3zUMWnJshW7X8dpkP7hI
 E/ZMBFVtmAf1ajROCWjpJZ1ZQxV0Fgub27p2UivGsX6WyI4KPwAIP+bKL2W5caDuT379
 etgrCUSSHBktOUUbT2icNLwCQg25ZnyJ54JEsNt45E61Fk9pyf/n/ZeSxJ8Zy0ZmrIxm
 GC68MTTp1bWna60n+Bi6jYjZ+D0/fkm1XlPG25Vx3NGesktm1C0sKBCT172kROoIP10f
 pTKvneNV75wgos5c6aTCKFPhi9sByPB9sr87xBeA9CHMtAX5mNm1112ajSzJyl0AdIFX
 d2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P3G2rOFbzL2AJNth2e4x1d5wKOFB9Eezzp7M6JLqg3c=;
 b=FrRGymb5lJGgoFZm1HD1GIHQNp+Nxb8KgfhbOyPxK2JdtA12L/xqBP27XyZcIQNJLs
 BuBq33TbTdfi7hkcUNELndKO5WbKVIkAVisPvzfYrrqiDiGTfGBewa1LQUOzdK+1dzu1
 wyh6t3Dcg8DcnEj7CEe0HqUlgT+5YrZAhBmSzl8huxHbyliq0J/VrEo+kBcfs4ltPHQj
 Y2/Tkbxu39iYYfrz2dklcyTfKBS6VeXPsbP2rBJkJpPipTcC/UWa4k65rkNqpU0tNqRy
 YCsO/EKH8QO63hTB6chBgUPdcCvZe+5Q994c18xh+lkB3CnIMCYoHH07h3JRR+IpILYc
 Zlsg==
X-Gm-Message-State: AOAM532HXRzLw/lBsNDhLvVi8NA3fNJsiLEHpmZNI8d9gLVavtbtr1pW
 5f0oC7XUeXe9+B6OoRHBszkZ1Rud4Yo=
X-Google-Smtp-Source: ABdhPJz0hlkSXhP1K0AHcKDjOat0Dl8L+VC+C40fB1+g9Zd3P84J0lBne3gK8AYffSwH/+FU5MPSGQ==
X-Received: by 2002:a17:906:fc0b:: with SMTP id
 ov11mr6934640ejb.22.1632837192403; 
 Tue, 28 Sep 2021 06:53:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v13sm10373247ejh.62.2021.09.28.06.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:53:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] socket_scm_helper: remove
Date: Tue, 28 Sep 2021 15:53:07 +0200
Message-Id: <20210928135309.199796-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928135309.199796-1-pbonzini@redhat.com>
References: <20210928135309.199796-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not used anymore, remove the source and all remaning traces of it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/machine/machine.py         |   3 -
 python/qemu/machine/qtest.py           |   2 -
 tests/Makefile.include                 |   5 +-
 tests/meson.build                      |   4 -
 tests/qemu-iotests/iotests.py          |   3 -
 tests/qemu-iotests/meson.build         |   5 -
 tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------
 tests/qemu-iotests/testenv.py          |   8 +-
 8 files changed, 2 insertions(+), 164 deletions(-)
 delete mode 100644 tests/qemu-iotests/meson.build
 delete mode 100644 tests/qemu-iotests/socket_scm_helper.c

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index e4356ea99e..d230915fbf 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -98,7 +98,6 @@ def __init__(self,
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
                  monitor_address: Optional[SocketAddrT] = None,
-                 socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  drain_console: bool = False,
                  console_log: Optional[str] = None,
@@ -113,7 +112,6 @@ def __init__(self,
         @param name: prefix for socket and log file names (default: qemu-PID)
         @param base_temp_dir: default location where temp files are created
         @param monitor_address: address for QMP monitor
-        @param socket_scm_helper: helper program, required for send_fd_scm()
         @param sock_dir: where to create socket (defaults to base_temp_dir)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
@@ -134,7 +132,6 @@ def __init__(self,
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir or self._base_temp_dir
         self._log_dir = log_dir
-        self._socket_scm_helper = socket_scm_helper
 
         if monitor_address is not None:
             self._monitor_address = monitor_address
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 395cc8fbfe..f2f9aaa5e5 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -115,7 +115,6 @@ def __init__(self,
                  wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
-                 socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  qmp_timer: Optional[float] = None):
         # pylint: disable=too-many-arguments
@@ -126,7 +125,6 @@ def __init__(self,
             sock_dir = base_temp_dir
         super().__init__(binary, args, wrapper=wrapper, name=name,
                          base_temp_dir=base_temp_dir,
-                         socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir, qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
         self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7426522bbe..86dc8286b4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -148,17 +148,14 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 check:
 
 ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
-QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
 check: check-block
 export PYTHON
 check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
-		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
+		qemu-io$(EXESUF) qemu-nbd$(EXESUF) \
 		$(filter qemu-system-%, $(ninja-targets))
 	@$<
 endif
 
-check-build: $(QEMU_IOTESTS_HELPERS-y)
-
 check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
diff --git a/tests/meson.build b/tests/meson.build
index 55a7b08275..3f3882748a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -67,10 +67,6 @@ if have_tools and 'CONFIG_VHOST_USER' in config_host and 'CONFIG_LINUX' in confi
              dependencies: [qemuutil, vhost_user])
 endif
 
-if have_system and 'CONFIG_POSIX' in config_host
-  subdir('qemu-iotests')
-endif
-
 test('decodetree', sh,
      args: [ files('decode/check.sh'), config_host['PYTHON'], files('../scripts/decodetree.py') ],
      workdir: meson.current_source_dir() / 'decode',
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index ce06cf5630..9afa258a40 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -109,8 +109,6 @@
 
     qemu_valgrind = ['valgrind', valgrind_logfile, '--error-exitcode=99']
 
-socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
-
 luks_default_secret_object = 'secret,id=keysec0,data=' + \
                              os.environ.get('IMGKEYSECRET', '')
 luks_default_key_secret_opt = 'key-secret=keysec0'
@@ -600,7 +598,6 @@ def __init__(self, path_suffix=''):
         super().__init__(qemu_prog, qemu_opts, wrapper=wrapper,
                          name=name,
                          base_temp_dir=test_dir,
-                         socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir, qmp_timer=timer)
         self._num_drives = 0
 
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
deleted file mode 100644
index 67aed1e492..0000000000
--- a/tests/qemu-iotests/meson.build
+++ /dev/null
@@ -1,5 +0,0 @@
-if 'CONFIG_LINUX' in config_host
-    socket_scm_helper = executable('socket_scm_helper', 'socket_scm_helper.c')
-else
-    socket_scm_helper = []
-endif
diff --git a/tests/qemu-iotests/socket_scm_helper.c b/tests/qemu-iotests/socket_scm_helper.c
deleted file mode 100644
index eb76d31aa9..0000000000
--- a/tests/qemu-iotests/socket_scm_helper.c
+++ /dev/null
@@ -1,136 +0,0 @@
-/*
- * SCM_RIGHTS with unix socket help program for test
- *
- * Copyright IBM, Inc. 2013
- *
- * Authors:
- *  Wenchao Xia    <xiawenc@linux.vnet.ibm.com>
- *
- * This work is licensed under the terms of the GNU LGPL, version 2 or later.
- * See the COPYING.LIB file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include <sys/socket.h>
-#include <sys/un.h>
-
-/* #define SOCKET_SCM_DEBUG */
-
-/*
- * @fd and @fd_to_send will not be checked for validation in this function,
- * a blank will be sent as iov data to notify qemu.
- */
-static int send_fd(int fd, int fd_to_send)
-{
-    struct msghdr msg;
-    struct iovec iov[1];
-    int ret;
-    char control[CMSG_SPACE(sizeof(int))];
-    struct cmsghdr *cmsg;
-
-    memset(&msg, 0, sizeof(msg));
-    memset(control, 0, sizeof(control));
-
-    /* Send a blank to notify qemu */
-    iov[0].iov_base = (void *)" ";
-    iov[0].iov_len = 1;
-
-    msg.msg_iov = iov;
-    msg.msg_iovlen = 1;
-
-    msg.msg_control = control;
-    msg.msg_controllen = sizeof(control);
-
-    cmsg = CMSG_FIRSTHDR(&msg);
-
-    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
-    cmsg->cmsg_level = SOL_SOCKET;
-    cmsg->cmsg_type = SCM_RIGHTS;
-    memcpy(CMSG_DATA(cmsg), &fd_to_send, sizeof(int));
-
-    do {
-        ret = sendmsg(fd, &msg, 0);
-    } while (ret < 0 && errno == EINTR);
-
-    if (ret < 0) {
-        fprintf(stderr, "Failed to send msg, reason: %s\n", strerror(errno));
-    }
-
-    return ret;
-}
-
-/* Convert string to fd number. */
-static int get_fd_num(const char *fd_str, bool silent)
-{
-    int sock;
-    char *err;
-
-    errno = 0;
-    sock = strtol(fd_str, &err, 10);
-    if (errno) {
-        if (!silent) {
-            fprintf(stderr, "Failed in strtol for socket fd, reason: %s\n",
-                    strerror(errno));
-        }
-        return -1;
-    }
-    if (!*fd_str || *err || sock < 0) {
-        if (!silent) {
-            fprintf(stderr, "bad numerical value for socket fd '%s'\n", fd_str);
-        }
-        return -1;
-    }
-
-    return sock;
-}
-
-/*
- * To make things simple, the caller needs to specify:
- * 1. socket fd.
- * 2. path of the file to be sent.
- */
-int main(int argc, char **argv, char **envp)
-{
-    int sock, fd, ret;
-
-#ifdef SOCKET_SCM_DEBUG
-    int i;
-    for (i = 0; i < argc; i++) {
-        fprintf(stderr, "Parameter %d: %s\n", i, argv[i]);
-    }
-#endif
-
-    if (argc != 3) {
-        fprintf(stderr,
-                "Usage: %s < socket-fd > < file-path >\n",
-                argv[0]);
-        return EXIT_FAILURE;
-    }
-
-
-    sock = get_fd_num(argv[1], false);
-    if (sock < 0) {
-        return EXIT_FAILURE;
-    }
-
-    fd = get_fd_num(argv[2], true);
-    if (fd < 0) {
-        /* Now only open a file in readonly mode for test purpose. If more
-           precise control is needed, use python script in file operation, which
-           is supposed to fork and exec this program. */
-        fd = open(argv[2], O_RDONLY);
-        if (fd < 0) {
-            fprintf(stderr, "Failed to open file '%s'\n", argv[2]);
-            return EXIT_FAILURE;
-        }
-    }
-
-    ret = send_fd(sock, fd);
-    if (ret < 0) {
-        close(fd);
-        return EXIT_FAILURE;
-    }
-
-    close(fd);
-    return EXIT_SUCCESS;
-}
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 70da0d60c8..207bafb649 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -68,7 +68,7 @@ class TestEnv(ContextManager['TestEnv']):
     env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
                      'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
                      'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
-                     'SOCKET_SCM_HELPER', 'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
+                     'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
                      'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
                      'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
                      'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
@@ -137,7 +137,6 @@ def init_binaries(self) -> None:
         """Init binary path variables:
              PYTHON (for bash tests)
              QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
-             SOCKET_SCM_HELPER
         """
         self.python = sys.executable
 
@@ -171,10 +170,6 @@ def root(*names: str) -> str:
             if not isxfile(b):
                 sys.exit('Not executable: ' + b)
 
-        helper_path = os.path.join(self.build_iotests, 'socket_scm_helper')
-        if isxfile(helper_path):
-            self.socket_scm_helper = helper_path  # SOCKET_SCM_HELPER
-
     def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  cachemode: Optional[str] = None,
                  imgopts: Optional[str] = None,
@@ -300,7 +295,6 @@ def print_env(self) -> None:
 PLATFORM      -- {platform}
 TEST_DIR      -- {TEST_DIR}
 SOCK_DIR      -- {SOCK_DIR}
-SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
 GDB_OPTIONS   -- {GDB_OPTIONS}
 VALGRIND_QEMU -- {VALGRIND_QEMU}
 PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
-- 
2.31.1



