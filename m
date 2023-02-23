Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E16A13A6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKrD-00007s-Mi; Thu, 23 Feb 2023 18:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKrC-00007k-2i
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:34 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKrA-0000Vt-5J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:33 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so12351254wrz.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pc+uWjRhNl81loTW604SLsJvgt5iDIM0pzxWzAFHTyw=;
 b=VwF7F5J/WHO8Q6TQav31X0j0wxgfd5PbHwMQGiA8AzDKhhQS0MD6q2py3+7ORPaRR8
 8phHUh7mTi3k4qhnOj5Z4cUKIuhyOFBSBCRJlXETmKZsyr1mUPDur9KB6TYGMYCKwpJP
 DVUD4wa0dr8fwEhJWZjGvVpJzarJu4SZxWLdY77F86lwnBoKrGXcjPNAsPoFtXiaMhAK
 4d66TUopJOWBa96fzCNFJik1ti4Kj8FwOFvFAxSzrkLDG6vMyiAHkQNcxwjhMkSQFBb6
 RrzZ9KbQvPhatVttYA891GGbwG/A2kbPn+tHgYfuqD2aJ+d65DjL+H2ryDFYwj+1e+Ax
 oLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pc+uWjRhNl81loTW604SLsJvgt5iDIM0pzxWzAFHTyw=;
 b=qm8Yu6yPW0yihcaI6OZHkP+F97m2SiiYpuOG+7uKXJpNhP+hH8eiAFacdu41rZ6re5
 9hz41+RmaLmk4zg4Wy7gApjpsENmrpZK8wFYSaGoW1FtnzXnpEyCNuLnO5FSb5T6fWA0
 DYtHx3pTo7PcALLMmuzAvbL34YwwgRUTVgKMjNv942HRQvhBONfnNTdVGs0b+zZ0L09F
 H4oUGHzZxY3jUdNDNqaxrfEU/ojIoXeygeMVYOgrk3fYQqdA+gW6Zgegg9r6niB+LvvR
 GMBFRyWbtuSftmuAkfQt4iSMHoklKPHygRBSKyeznc5Rt4xXHnNBn6W0SgnDNAPfG126
 +XCg==
X-Gm-Message-State: AO0yUKXNjCs2CJwNjlRXnwQcYYeua7e3r12Hk4XnZ3M/CCNaAgXk25jN
 YjqKlev567SYcupig/9w2kjFSecOomK046OZ
X-Google-Smtp-Source: AK7set8Z/mlds5imz4sj60SQatj0wKqVqyzUqSa2tkezIBTT7+J0kw+c/XMQd/fPKImTZcespOZ/Iw==
X-Received: by 2002:adf:dcc5:0:b0:2c7:ce2:6479 with SMTP id
 x5-20020adfdcc5000000b002c70ce26479mr6427257wrm.40.1677194310431; 
 Thu, 23 Feb 2023 15:18:30 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfe390000000b002c54c8e70b1sm11449411wrm.9.2023.02.23.15.18.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:18:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 6/7] dump: Build once by adding stubs for non-x86 targets
Date: Fri, 24 Feb 2023 00:17:54 +0100
Message-Id: <20230223231755.81633-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223231755.81633-1-philmd@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Extract non-x86 stubs to win_dump-stub.c. We can now
build dump.o once for system emulation. Update meson.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c          | 14 --------------
 dump/meson.build     |  6 ++++--
 dump/win_dump-stub.c | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+), 16 deletions(-)
 create mode 100644 dump/win_dump-stub.c

diff --git a/dump/dump.c b/dump/dump.c
index b33a613d45..7cde3e326e 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -32,20 +32,6 @@
 #include "migration/blocker.h"
 #include "win_dump.h"
 
-#ifndef TARGET_X86_64
-bool win_dump_available(Error **errp)
-{
-    error_setg(errp, "Windows dump is only available for x86-64");
-
-    return false;
-}
-
-void create_win_dump(DumpState *s, Error **errp)
-{
-    win_dump_available(errp);
-}
-#endif
-
 #include <zlib.h>
 #ifdef CONFIG_LZO
 #include <lzo/lzo1x.h>
diff --git a/dump/meson.build b/dump/meson.build
index 2eff29c3ea..6ae07e6fed 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,4 +1,6 @@
 softmmu_ss.add(files('dump-hmp-cmds.c'))
 
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'], if_true: files('win_dump.c'))
+softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
+specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'],
+                if_true: files('win_dump.c'),
+                if_false: files('win_dump-stub.c'))
diff --git a/dump/win_dump-stub.c b/dump/win_dump-stub.c
new file mode 100644
index 0000000000..87cb699e3d
--- /dev/null
+++ b/dump/win_dump-stub.c
@@ -0,0 +1,23 @@
+/*
+ * Windows crashdump stubs for non-x86 targets
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "win_dump.h"
+
+bool win_dump_available(Error **errp)
+{
+    error_setg(errp, "Windows dump is only available for x86-64");
+
+    return false;
+}
+
+void create_win_dump(DumpState *s, Error **errp)
+{
+    win_dump_available(errp);
+}
-- 
2.38.1


