Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E56A1767
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSfg-0006Uw-C8; Fri, 24 Feb 2023 02:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfe-0006Ub-Lx
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:10 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfd-0006op-1w
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:10 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so1145775wmc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAwFBuxW+pqDLBjdDqPuG5n5VeTuwKH7wxgCavcpmd0=;
 b=tiQvA86HtU6ZDAyxcS1mPZux7f+HELZ/1CuOIo4ovlwRMLHC3HwwlSRXoTImuzG2Xh
 SniCrqsR8albKQOamS3s+GlBhKoHGz7xDeiRshjE4uf9iZQLnJh71JE62u18/5jHLUnk
 QcfoD13zELx7Girtk7pvwjVLA4uf1VLa1CXzPumzCxfi3kkCI9iPk+jv93JsHMJbXNA7
 fnj6T4e08AXwV9HcthicYzrYTnodKfddbqhSi0mMW3dopgA/utkndTQDPotwMuZTR3WD
 0c6A/d+Hd8QeI9p3/mm+0tv5dTW2Z9Ri6CRY8ftkQDkBBYavJWjLUE2nyea3K8LQCy3N
 8o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAwFBuxW+pqDLBjdDqPuG5n5VeTuwKH7wxgCavcpmd0=;
 b=DXyS1jW0ifAkBZVhnmNYoA+DK/ZJe1jHRrnrTNN89w4nQgRnPBqVtQfyU4NhgLavk5
 Km4My3CxPb5S995yaLKinVe/3qyNW6FYo8qmc3BJvs3xqlfDpuLVM8z5CMU9NnAsMbVr
 PBFtsishWa56x4qdmgccr6/rDjXSNLc150awfsFb0oRo88rDadQHKnI/ePEBfHrYlytv
 E/xVCezClCesZzc4AcpTTFyrjkos2MqGdSMYKJ0A4K/o8AFre08xne6NVBQ8nsapIRyB
 n8D9keZfBT25KgEfN14DMfjsv7Fwxvnxmqo8wqen3ZhFihMfXHAs7lYqIONG+Yjs8/zW
 gmdA==
X-Gm-Message-State: AO0yUKWJ7NUCRCqsoXmMeTMOkZMMVmosCrn/SsgJEswwNDAC0MkGG+CX
 57JzjBFqaTS4mG3oN0LJvniNRe6A3wBgxM7q
X-Google-Smtp-Source: AK7set+8Fm7kbJOJ8uNPFlqlgFSNPStDA3nn3lM3YoyFzygJPeacPTZqSScIfyUjAmJxwX3iCNnU2w==
X-Received: by 2002:a05:600c:34cb:b0:3eb:a4e:a2b2 with SMTP id
 d11-20020a05600c34cb00b003eb0a4ea2b2mr1154737wmq.4.1677224347217; 
 Thu, 23 Feb 2023 23:39:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003daf672a616sm1844499wma.22.2023.02.23.23.39.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 23:39:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 3/5] dump: Clean included headers
Date: Fri, 24 Feb 2023 08:38:48 +0100
Message-Id: <20230224073850.84913-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224073850.84913-1-philmd@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

"qemu/win_dump_defs.h" is only required by win_dump.c,
but win_dump.h requires "sysemu/dump.h" which declares
the DumpState type. Remove various unused headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump-hmp-cmds.c |  2 +-
 dump/dump.c          |  6 ++----
 dump/win_dump.c      | 15 +++++----------
 dump/win_dump.h      |  2 +-
 4 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
index e5053b04cd..b038785fee 100644
--- a/dump/dump-hmp-cmds.c
+++ b/dump/dump-hmp-cmds.c
@@ -1,5 +1,5 @@
 /*
- * Human Monitor Interface commands
+ * Windows crashdump (Human Monitor Interface commands)
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
diff --git a/dump/dump.c b/dump/dump.c
index 3784a9054d..a84f78738a 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -14,22 +14,20 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "elf.h"
-#include "exec/hwaddr.h"
+#include "qemu/bswap.h"
 #include "exec/target_page.h"
 #include "monitor/monitor.h"
-#include "sysemu/kvm.h"
 #include "sysemu/dump.h"
-#include "sysemu/memory_mapping.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-dump.h"
 #include "qapi/qapi-events-dump.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
+#include "hw/core/cpu.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
diff --git a/dump/win_dump.c b/dump/win_dump.c
index f20b6051b6..ba7fa404fe 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -1,5 +1,5 @@
 /*
- * Windows crashdump
+ * Windows crashdump (target specific implementations)
  *
  * Copyright (c) 2018 Virtuozzo International GmbH
  *
@@ -9,19 +9,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/cutils.h"
-#include "elf.h"
-#include "exec/hwaddr.h"
-#include "monitor/monitor.h"
-#include "sysemu/kvm.h"
 #include "sysemu/dump.h"
-#include "sysemu/memory_mapping.h"
-#include "sysemu/cpus.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/error-report.h"
-#include "hw/misc/vmcoreinfo.h"
+#include "exec/cpu-defs.h"
+#include "hw/core/cpu.h"
+#include "qemu/win_dump_defs.h"
 #include "win_dump.h"
+#include "cpu.h"
 
 static size_t win_dump_ptr_size(bool x64)
 {
diff --git a/dump/win_dump.h b/dump/win_dump.h
index b8c25348f4..56f63683c3 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -11,7 +11,7 @@
 #ifndef WIN_DUMP_H
 #define WIN_DUMP_H
 
-#include "qemu/win_dump_defs.h"
+#include "sysemu/dump.h"
 
 void create_win_dump(DumpState *s, Error **errp);
 
-- 
2.38.1


