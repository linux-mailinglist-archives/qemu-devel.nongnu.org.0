Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9031A4B00F0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:07:47 +0100 (CET)
Received: from localhost ([::1]:59936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHw3u-0008HA-Mx
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxR-0004MI-88
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:09 -0500
Received: from [2607:f8b0:4864:20::102b] (port=54258
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxN-000341-Tj
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:03 -0500
Received: by mail-pj1-x102b.google.com with SMTP id qe15so3539256pjb.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVoz6YEbx/9/Yq7TfZCDi3JHFpcg93bStHzLwpIyIF4=;
 b=ELqQOGviw81bBseU5jTswyC99nlt8hKYjvxkD91SABkRQ1NW9VJ5aERgGxbvETnN1k
 MbrqoXuMLGLG3GTGV7QikrVR0gVpH617qE4/aLAiHbmqHtja0R9YOxU6fhizwZaqoRhr
 jwF/LJVpyy2/MstZ4wTOg4NwsflpsxOmyH0B6WRZHRkqoe8YApaWGzW0MIQl67DYNgKI
 8p88xpWjIGu48lZZvs6DnLJSxL7Di5aBWtDBWSKafvtMUii8lNQZZuGhESMpMj7RhR+e
 bQ5Ijg3Y17XIjYqxtchwC+XFL39/6LcmyQnX/4pPlpSoXT2IproSULI+uYy0CJ3ggvDT
 BOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wVoz6YEbx/9/Yq7TfZCDi3JHFpcg93bStHzLwpIyIF4=;
 b=Tx3MTt/yUbR7BbzlA4rtsuyuSeIfPuTq91zsWs1uFVd1bk/5g6JQkbekRmAySsAAKO
 o+gNbYJsHbE3UCtERv2gh04X/HxmCR2oR10TUeckp/UzhrLQlIJ0yHts53kBL19NRdOU
 yVoS4RN+K4r4YXQH/dGcHo54OnRJWCbgyzq9FgzyxzUH1FP1pZ/Na6dJ1VMyxVK7m0yn
 nN91c9y0hKJ024uZt8LCzcYizL1QEfgWzEMsqC/gedJT2WBfP+qUz3J7vHy+lt6MDSFG
 AK5Dnc89CNvHbzxbXZ0MZYmeUAuH5F4ROC8hATHnz99+7HuePzOdkt65Fjk5aYWTJMVY
 WMIg==
X-Gm-Message-State: AOAM533HvzDoQKNk805sLtyttTglLZh2MTuNZKHSZgiiSLo0G2Nf12cz
 INwdIPJRUjtL8T5s8AUXBK0UOtvazOg=
X-Google-Smtp-Source: ABdhPJzhZ7Ee/eZtm2i6P9bpDpFBMqfgtIdhzt0fYfsBXiMVZDLcgqG4J18kjAAxEfyUZpPPCfsCpw==
X-Received: by 2002:a17:90a:8409:: with SMTP id
 j9mr5195325pjn.101.1644447660508; 
 Wed, 09 Feb 2022 15:01:00 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o2sm8834715pga.57.2022.02.09.15.00.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:01:00 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 3/9] include: Move exec/user/ to user/
Date: Thu, 10 Feb 2022 00:00:24 +0100
Message-Id: <20220209230030.93987-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Avoid spreading the headers in multiple directories,
unify exec/user/ and user/.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/qemu.h                     | 4 ++--
 include/exec/cpu-all.h              | 2 +-
 include/{exec => }/user/abitypes.h  | 0
 include/user/safe-syscall.h         | 6 +++---
 include/{exec => }/user/thunk.h     | 2 +-
 linux-user/qemu.h                   | 2 +-
 linux-user/thunk.c                  | 2 +-
 linux-user/user-internals.h         | 2 +-
 scripts/coverity-scan/COMPONENTS.md | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)
 rename include/{exec => }/user/abitypes.h (100%)
 rename include/{exec => }/user/thunk.h (99%)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 02921ac8b3..2f67776b0b 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -25,7 +25,7 @@
 
 #undef DEBUG_REMAP
 
-#include "exec/user/abitypes.h"
+#include "user/abitypes.h"
 
 extern char **environ;
 
@@ -36,7 +36,7 @@ enum BSDType {
 };
 extern enum BSDType bsd_type;
 
-#include "exec/user/thunk.h"
+#include "user/thunk.h"
 #include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index c0f0fab28a..08b2894274 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -145,7 +145,7 @@ static inline void tswap64s(uint64_t *s)
 /* MMU memory access macros */
 
 #if defined(CONFIG_USER_ONLY)
-#include "exec/user/abitypes.h"
+#include "user/abitypes.h"
 
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
diff --git a/include/exec/user/abitypes.h b/include/user/abitypes.h
similarity index 100%
rename from include/exec/user/abitypes.h
rename to include/user/abitypes.h
diff --git a/include/user/safe-syscall.h b/include/user/safe-syscall.h
index 61a04e2b5a..b2cb76e05b 100644
--- a/include/user/safe-syscall.h
+++ b/include/user/safe-syscall.h
@@ -1,5 +1,5 @@
 /*
- * safe-syscall.h: prototypes for linux-user signal-race-safe syscalls
+ * safe-syscall.h: prototypes for user signal-race-safe syscalls
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -15,8 +15,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef LINUX_USER_SAFE_SYSCALL_H
-#define LINUX_USER_SAFE_SYSCALL_H
+#ifndef USER_SAFE_SYSCALL_H
+#define USER_SAFE_SYSCALL_H
 
 /**
  * safe_syscall:
diff --git a/include/exec/user/thunk.h b/include/user/thunk.h
similarity index 99%
rename from include/exec/user/thunk.h
rename to include/user/thunk.h
index 300a840d58..b5796f4304 100644
--- a/include/exec/user/thunk.h
+++ b/include/user/thunk.h
@@ -21,7 +21,7 @@
 #define THUNK_H
 
 #include "cpu.h"
-#include "exec/user/abitypes.h"
+#include "user/abitypes.h"
 
 /* types enums definitions */
 
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 7910ce59cc..b6775f112b 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -6,7 +6,7 @@
 
 #undef DEBUG_REMAP
 
-#include "exec/user/abitypes.h"
+#include "user/abitypes.h"
 
 #include "syscall_defs.h"
 #include "target_syscall.h"
diff --git a/linux-user/thunk.c b/linux-user/thunk.c
index dac4bf11c6..cd85bbc825 100644
--- a/linux-user/thunk.c
+++ b/linux-user/thunk.c
@@ -20,7 +20,7 @@
 #include "qemu/log.h"
 
 #include "qemu.h"
-#include "exec/user/thunk.h"
+#include "user/thunk.h"
 
 //#define DEBUG
 
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index a8fdd6933b..4d0f682aea 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -18,7 +18,7 @@
 #ifndef LINUX_USER_USER_INTERNALS_H
 #define LINUX_USER_USER_INTERNALS_H
 
-#include "exec/user/thunk.h"
+#include "user/thunk.h"
 #include "exec/exec-all.h"
 #include "qemu/log.h"
 
diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index cea6695ecd..0571362a45 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -127,7 +127,7 @@ usb
   ~ (/qemu)?(/hw/usb/.*|/include/hw/usb/.*)
 
 user
-  ~ (/qemu)?(/common-user/.*|/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
+  ~ (/qemu)?(/common-user/.*|/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/user/.*)
 
 util
   ~ (/qemu)?(/util/.*|/include/qemu/.*)
-- 
2.34.1


