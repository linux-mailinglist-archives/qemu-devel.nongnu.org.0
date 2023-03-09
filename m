Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5536B2E8A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMgW-0007DQ-IA; Thu, 09 Mar 2023 15:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMgN-0006QT-EZ
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:16:11 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMgL-0002s7-4F
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:16:11 -0500
Received: by mail-pj1-x102f.google.com with SMTP id nn12so3160909pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMeG1HwbQDXPwGHTmyb1B+zs2kscYWiAZRcxkV3XrFk=;
 b=bVJ+aaPAh0RouOjtJTNFrr/yOv+/aYxxMYjxuwDhsU71tKfMCz+a+EkUKWKSuMZ1OA
 GAHoCjOQrer2jWvByBJPFf2tXAr4jxixT+QgcC1BbHmdof6YdUbLrPU/zZ0Tely4aV52
 aLFyHXWMBCiNWLDhjWnEIv3ah9KNL+xRS3Pn4eT7POpn7aCQXGZ0Z42xRPJmwGKVF4n5
 2P6iVrJMamynCxgIi9z/U8EfpZtjNlMaVAqZ5p8CNCraRSYb74rL1yWlEvJ+vco3xSYB
 VbrYI9LZMpk4O7CPzRBOY/v+x0b9hyosjaBcUWBum/uVjuziwDjnV53wA1E5HzMpQjlI
 ryPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMeG1HwbQDXPwGHTmyb1B+zs2kscYWiAZRcxkV3XrFk=;
 b=3crPar8V7EfZb5TpeNqkuyw10YIhPpboUclU26rKfyk58k0sKkkLj9CFb6rFQoM8RQ
 lxCIzS+wO4dpXpHffT/BIPZzQcsGhEMQSTLYT1lmTthHHXW0SkFvd7jUZB8L36vSd16z
 Ai/Jot92AP3AzDjW/U5HDkCqo4cuYdfXUsr+QTCUSPhURq2jagYtIhCHb3NhOYtXV5Tk
 ndx7jjN6kkIZkkwkBMX6D5gm6SP1M9C17UUHYpjsIqOXQVK/yMO883AocHJqceJfNKWm
 tesN4weEK7XMR1xIISfhlr0XcVvmWFUTSNyiPxWNoEC6CGf5KtWooF5/UjwECJ1VO/eW
 6Upw==
X-Gm-Message-State: AO0yUKViX9qlva7aEL7yeJ0qpqdnzv6by1EJXnxpItO0E4KPbB3NfVdw
 GuCA0ukUPT9MmRpoXtCcx7342HGFKzzseV577uI=
X-Google-Smtp-Source: AK7set9sQoJd8/rLMyz01IkgjsDrpGr9fZchI9oqDmW9g4tJjzw9/Ula6i1pBqqDv2FF5IY3RRj/ww==
X-Received: by 2002:a17:90b:38c7:b0:234:b03:5a70 with SMTP id
 nn7-20020a17090b38c700b002340b035a70mr23946139pjb.35.1678392967338; 
 Thu, 09 Mar 2023 12:16:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a17090a1b8400b0023377b98c7csm304094pjc.38.2023.03.09.12.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:16:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 2/2] linux-user/m68k: Handle EXCP_ADDRESS in cpu_loop
Date: Thu,  9 Mar 2023 12:16:04 -0800
Message-Id: <20230309201604.3885359-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309201604.3885359-1-richard.henderson@linaro.org>
References: <20230309201604.3885359-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

This exception can be raised by illegal instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c     |  5 ++++-
 tests/tcg/m68k/excp-address.c  | 32 ++++++++++++++++++++++++++++++++
 tests/tcg/m68k/Makefile.target |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/m68k/excp-address.c

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index caead1cb74..84b5d290c0 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -35,7 +35,10 @@ void cpu_loop(CPUM68KState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        switch(trapnr) {
+        switch (trapnr) {
+        case EXCP_ADDRESS:
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->pc);
+            break;
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
diff --git a/tests/tcg/m68k/excp-address.c b/tests/tcg/m68k/excp-address.c
new file mode 100644
index 0000000000..1dbdddef58
--- /dev/null
+++ b/tests/tcg/m68k/excp-address.c
@@ -0,0 +1,32 @@
+/*
+ * Test m68k address exception
+ */
+
+#define _GNU_SOURCE 1
+#include <signal.h>
+#include <stdlib.h>
+
+static void sig_handler(int sig, siginfo_t *si, void *puc)
+{
+    exit(0);
+}
+
+int main(int argc, char **argv)
+{
+    struct sigaction act = {
+        .sa_sigaction = sig_handler,
+        .sa_flags = SA_SIGINFO
+    };
+
+    sigaction(SIGBUS, &act, NULL);
+
+    /*
+     * addl %d0,#0 -- with immediate as destination is illegal.
+     * Buggy qemu interpreted the insn as 5 words: 2 for immediate source
+     * and another 2 for immediate destination.  Provide all that padding
+     * so that abort gets called.
+     */
+    asm volatile(".word 0xd1bc,0,0,0,0");
+
+    abort();
+}
diff --git a/tests/tcg/m68k/Makefile.target b/tests/tcg/m68k/Makefile.target
index 1163c7ef03..d3b0bc48a3 100644
--- a/tests/tcg/m68k/Makefile.target
+++ b/tests/tcg/m68k/Makefile.target
@@ -4,6 +4,7 @@
 #
 
 VPATH += $(SRC_PATH)/tests/tcg/m68k
+TESTS += excp-address
 TESTS += trap
 
 # On m68k Linux supports 4k and 8k pages (but 8k is currently broken)
-- 
2.34.1


