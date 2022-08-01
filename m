Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93852586CAA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:14:33 +0200 (CEST)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWBk-0000wh-AR
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIW9b-0007n6-Td
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:12:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIW9a-0001Ri-3g
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:12:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id l4so14301521wrm.13
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=txsqDPS1i3EMdQyF7OyAzvmQcZVumVt5Z3kF4ROjLXo=;
 b=B3s0Ib7hS+wRGIWxrToFZe9c8XH7fYBtMH/FOOPnJ3mz8ptBSm2KrBJKTKC5lFzwll
 QXvDyv+HAVzBfCjhzdZ1ojqoYXsHCguTzjyaEosmlqAEDsnRG0wBHgsj2kKIjD8QE9wj
 HSJJ99P7OmlxhjZkRwgUwZlopY83kkyv4HgOou0e1CadCPftdIDjR0LgsrJtSJ7vsg+R
 ilrXKB160RC7h2IDtQwvcZCa6nk5IwaRcS70rpXwIIwmGA20pdZjNcQ3rwrJoZ1H8I2p
 6LIf7WNlpSWshRSQvCH89KOg8L3f50EkJc1azD9AX9iQ6Va4NvYjpoQfjCl+BLIfBWmA
 BmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=txsqDPS1i3EMdQyF7OyAzvmQcZVumVt5Z3kF4ROjLXo=;
 b=WkrqjFG0b2GIgR7DSC6uhqnPkWIlSp6nx0YSz5y/uTPD/vRZrYkN3jR0aPnWhNuVSc
 eJ8esNuraqFIH/pMr6pGFyzPdWMuQA+W/pD7k3grpEYWSs9/lszi2+kG81mhZG6RjjoE
 +4kSzs2BbJFcuQT/EPMvcVERK5vjK6q4z5kJwKhJTFXpsllNDCber/Rr0S1ADaT+m7rJ
 tnOXE1YOC1f2qb9HdFJSNKOfBFvY3mzHnRS1dKU++lOTASfcfIiySa+OMbgWewVP+Tb9
 4J7ohf3zskOv2hRSmJ8kI80J7dN2bjgMihU6N0aJSv/KJb0rcQZMO1vkx9DiM1OZao7a
 5SpA==
X-Gm-Message-State: ACgBeo2svxsz/xmtkWV/r8/qhhwDyzrSleBRRyn/ajbYSS/NDDLXkHy/
 EJonNH1/bNkRN0t3B8fESrFknw==
X-Google-Smtp-Source: AA6agR4soZ/XCKbSZKvbg4BXlGlFV+HhcklO5rCJ/dS4ZzWCKFa5JmUBoa0ysdA5NK8j4sdOIkglOQ==
X-Received: by 2002:adf:d1e8:0:b0:21d:ac9c:983d with SMTP id
 g8-20020adfd1e8000000b0021dac9c983dmr10508855wrd.629.1659363136332; 
 Mon, 01 Aug 2022 07:12:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a7bc5ca000000b003a2e7c13a3asm14569684wmk.42.2022.08.01.07.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 07:12:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B01931FFB7;
 Mon,  1 Aug 2022 15:12:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] util: add a qemu_backtrace utility function
Date: Mon,  1 Aug 2022 15:12:09 +0100
Message-Id: <20220801141209.2184305-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When debugging failures in CI which can't be replicated locally it can
be useful to dump a backtrace. However ad-hoc debug code is likely to
fail to compile on numerous hosts so lets package up a utility
function with proper compiler detection.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                | 29 +++++++++++++++++++++++++++++
 include/qemu/backtrace.h | 28 ++++++++++++++++++++++++++++
 util/backtrace.c         | 37 +++++++++++++++++++++++++++++++++++++
 util/meson.build         |  1 +
 4 files changed, 95 insertions(+)
 create mode 100644 include/qemu/backtrace.h
 create mode 100644 util/backtrace.c

diff --git a/configure b/configure
index 2c19329d58..e3482fc3f6 100755
--- a/configure
+++ b/configure
@@ -1828,6 +1828,27 @@ EOF
   fi
 fi
 
+##########################################
+# check for backtrace support
+
+have_backtrace=no
+
+cat > $TMPC << EOF
+#include <execinfo.h>
+#include <stdio.h>
+int main(void) {
+    int nptrs;
+    void *buffer[100];
+
+    nptrs = backtrace(buffer, 100);
+    printf("backtrace() returned %d addresses\n", nptrs);
+}
+EOF
+
+if compile_prog "$CPU_CFLAGS -rdynamic" ""; then
+    have_backtrace=yes
+fi
+
 ##########################################
 # check for slirp
 
@@ -2276,6 +2297,10 @@ if test "$have_ubsan" = "yes"; then
   QEMU_CFLAGS="-fsanitize=undefined $QEMU_CFLAGS"
   QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
 fi
+if test "$have_backtrace" = "yes" ; then
+  QEMU_CFLAGS="-rdynamic $QEMU_CFLAGS"
+  QEMU_LDFLAGS="-rdynamic $QEMU_LDFLAGS"
+fi
 
 ##########################################
 
@@ -2480,6 +2505,10 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
     echo "CONFIG_TSAN=y" >> $config_host_mak
 fi
 
+if test "$have_backtrace" = "yes" ; then
+    echo "CONFIG_BACKTRACE=y" >> $config_host_mak
+fi
+
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
diff --git a/include/qemu/backtrace.h b/include/qemu/backtrace.h
new file mode 100644
index 0000000000..5888081b83
--- /dev/null
+++ b/include/qemu/backtrace.h
@@ -0,0 +1,28 @@
+/*
+ * Backtrace Functions
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _BACKTRACE_H_
+#define _BACKTRACE_H_
+
+#ifdef CONFIG_BACKTRACE
+/**
+ * qemu_backtrace() - return a backtrace of current thread
+ * max: maximum number of lines of backtrace
+ *
+ * Return an allocated GString containing the backtrace of the current
+ * thread. Caller frees the GString once done.
+ */
+GString *qemu_backtrace(int max);
+#else
+static inline GString *qemu_backtrace(int max)
+{
+    return NULL;
+}
+#endif
+
+#endif /* _BACKTRACE_H_ */
diff --git a/util/backtrace.c b/util/backtrace.c
new file mode 100644
index 0000000000..880232a0b0
--- /dev/null
+++ b/util/backtrace.c
@@ -0,0 +1,37 @@
+/*
+ * Backtrace abstraction to gloss over the differences between architectures.
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/backtrace.h"
+#include <execinfo.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#define BT_BUF_SIZE 128
+
+GString *qemu_backtrace(int max)
+{
+    int nptrs;
+    void *buffer[BT_BUF_SIZE];
+    char **strings;
+    GString *res = g_string_new("");
+
+    nptrs = backtrace(buffer, BT_BUF_SIZE);
+    strings = backtrace_symbols(buffer, nptrs);
+    if (strings == NULL) {
+        g_string_printf(res, "Failed to extract symbols");
+    } else {
+        for (int j = 0; j < MIN(max, nptrs); j++) {
+            g_string_append_printf(res, "%s\n", strings[j]);
+        }
+        free(strings);
+    }
+
+    return res;
+}
diff --git a/util/meson.build b/util/meson.build
index 5e282130df..abad5a5377 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -55,6 +55,7 @@ util_ss.add(files('guest-random.c'))
 util_ss.add(files('yank.c'))
 util_ss.add(files('int128.c'))
 util_ss.add(files('memalign.c'))
+util_ss.add(when: 'CONFIG_BACKTRACE', if_true: files('backtrace.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
-- 
2.30.2


