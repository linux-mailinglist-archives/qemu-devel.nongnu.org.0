Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB2364AA7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:37:04 +0200 (CEST)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZhf-0000A9-8q
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQj-0007Na-LA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQg-0001OF-7Q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:32 -0400
Received: by mail-wr1-x431.google.com with SMTP id a4so35190823wrr.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBgfHHnAxbNIphhMkiJAhztZRfqVBkkDkTzuqRjNmCs=;
 b=aWPqm2HMmqpaddzRrak+vsB4Sqm5KKw1x4SgeqMy5Ur3Bw12i4pvBZXIA5FLiBjaCl
 xxWaE4LT9gu9CwPsOzrXClwbOK6Hsl9xdN+muOKUhIo6EJkFg9UEc9WALLyCN9rz6XUe
 bQmitEf3gK59NpIjIHJSDfQWe39iBIqDJOrebjk+g1IwHRgh4DezYCgUbgxCw1yS67KT
 HTasrthhrKGK8C6BLyVo4bQEXfNsxPDFtWE6tNBalxEnBdOOLU9C+06oIeRp5G/m2N9v
 VJxE6K0+TlTrJ5NZUaTiPzTJw3EIk21z97prfPpFOlvfNqF3rXDCSRQzpuvsFF1YyGq/
 wbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wBgfHHnAxbNIphhMkiJAhztZRfqVBkkDkTzuqRjNmCs=;
 b=AEjg399hvY13cZAd4Rf4Exfj1Ro6PLZnezxFZSCpCHoIWi69aKU2ByXaraS4iJwsA9
 3YHLNlhRy4K6ZF1JIOWxjUjotxCtaMe6tQVhL0pZEbwS5uOP7VnYF0W+21RW0mLCNZ0s
 FSDEP+qIWS5FLoTAFZcx8Kk2tvrtC7Zeic/WsS7mdVXxtdSfkW8ooXzusjaGgtf5Ir1I
 Ui2TSegRfaZKJijxGHmfF7bMQhP0Z8GOiVn59MDFv9MPS/JsO3LHdWdJA6Xud54ej3E2
 aTRgyt0j2t8xFCWIr7YzvHhBihHq/lU9kXWAAG/kpdN97Sshke73TXdBmeSpChZbFCMA
 y82Q==
X-Gm-Message-State: AOAM530T8mU6g4cH+YWkR6pGhg+bM4iU7JlCbeUcryqStCshmBDSOPSv
 9Ld9NlAiRY8RXTZHJo259Mc8EbEElNvFbQ==
X-Google-Smtp-Source: ABdhPJwYv7ArzhW5LrBH8XoCnOzN8H9I6ay4nkBGLGf9MTDPjNcqUN7/WUK6uTgBNzN0Sauq+zCnvw==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr16259090wru.305.1618859968505; 
 Mon, 19 Apr 2021 12:19:28 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v7sm24597520wrs.2.2021.04.19.12.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:19:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/30] target/mips: Add simple user-mode
 mips_cpu_do_interrupt()
Date: Mon, 19 Apr 2021 21:18:06 +0200
Message-Id: <20210419191823.1555482-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The #ifdef'ry hides that the user-mode implementation of
mips_cpu_do_interrupt() simply sets exception_index = EXCP_NONE.

Add this simple implementation to tcg/user/tlb_helper.c, and
the corresponding Meson machinery to build this file when user
emulation is configured.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Renamed helper.c -> tlb_helper.c (rth)
---
 target/mips/tcg/user/tlb_helper.c | 28 ++++++++++++++++++++++++++++
 target/mips/tlb_helper.c          |  5 -----
 target/mips/meson.build           |  5 +++++
 target/mips/tcg/meson.build       |  3 +++
 target/mips/tcg/user/meson.build  |  3 +++
 5 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 target/mips/tcg/user/tlb_helper.c
 create mode 100644 target/mips/tcg/meson.build
 create mode 100644 target/mips/tcg/user/meson.build

diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
new file mode 100644
index 00000000000..453b9e9b930
--- /dev/null
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -0,0 +1,28 @@
+/*
+ * MIPS TLB (Translation lookaside buffer) helpers.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "internal.h"
+
+void mips_cpu_do_interrupt(CPUState *cs)
+{
+    cs->exception_index = EXCP_NONE;
+}
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 1ffdc1f8304..78720c4d20a 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -965,11 +965,8 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
     }
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 void mips_cpu_do_interrupt(CPUState *cs)
 {
-#if !defined(CONFIG_USER_ONLY)
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
     bool update_badinstr = 0;
@@ -1272,11 +1269,9 @@ void mips_cpu_do_interrupt(CPUState *cs)
                  env->CP0_Status, env->CP0_Cause, env->CP0_BadVAddr,
                  env->CP0_DEPC);
     }
-#endif
     cs->exception_index = EXCP_NONE;
 }
 
-#if !defined(CONFIG_USER_ONLY)
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 15c2f835c68..ca3cc62cf7a 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -6,6 +6,7 @@
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
 ]
 
+mips_user_ss = ss.source_set()
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
@@ -34,6 +35,9 @@
 ), if_false: files(
   'mxu_translate.c',
 ))
+if 'CONFIG_TCG' in config_all
+  subdir('tcg')
+endif
 
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
@@ -52,3 +56,4 @@
 
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
+target_user_arch += {'mips': mips_user_ss}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
new file mode 100644
index 00000000000..b74fa04303e
--- /dev/null
+++ b/target/mips/tcg/meson.build
@@ -0,0 +1,3 @@
+if have_user
+  subdir('user')
+endif
diff --git a/target/mips/tcg/user/meson.build b/target/mips/tcg/user/meson.build
new file mode 100644
index 00000000000..79badcd3217
--- /dev/null
+++ b/target/mips/tcg/user/meson.build
@@ -0,0 +1,3 @@
+mips_user_ss.add(files(
+  'tlb_helper.c',
+))
-- 
2.26.3


