Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE7363857
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:56:46 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGLN-00088C-H4
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGo-000395-Tf
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:02 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGm-0000ka-Qe
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id n127so5364324wmb.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDauNKvsnr925xHMPAyQPYL2wWfv0cJQoAYwcXW7WSA=;
 b=VkLB+NYgS5sTQ6UyCjzoNuZIaauqAa+NhOljpsxtYW85p5E9XxlY1Vm02swMszdYV+
 XPMCzLyu6CMvNdXpRsUD2cAuUS9vZ3tqUCIXgZWOUqhV6d4bR4uEi0jXkr3zWVmq4PI8
 2PKN7KZD3LUvCH3nquczO6O8k/2p7SRGW3DFGLGuEtrFXCHdU3ZGvzwuv4yenrtdZBm0
 JHsIoIAPBQ10qiyXcrsYg2shudz+x3hCXCtR0PGiz3b4JeBKU5F85h09aPdKJiyjOjuc
 K0i5FHeDjDBmEgAQDDCQBQGPF0af6XDdcLx/JI7JK5qybtjqofy/nnnt2PKdXbe9Lz/k
 TF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zDauNKvsnr925xHMPAyQPYL2wWfv0cJQoAYwcXW7WSA=;
 b=TdCvuwOlCbrl5smu45okCgS8Wx3ApFJstJw47VCwt99IcgKXpH6lwn2TooAWOSK/62
 68fp0lYIpgF526t+eSESA3i8piJ/O5uOHtFzgKwqCR5EheMsuzItAQGBDpVu1CEga+Qw
 xkeFHx9uOw+VAE76LVVV6JVtXSP2HmBtbOixumo5w1QUc2fhqdLi7fMv+I+vkv82x5UG
 ZBZVyngFVsI26wi0wcxLk4p5xIeXiZHEg4ByQVemOjYG6DMTiMh32mQNx0oLQD0D1HxJ
 jIc8jPI5QnLYl2x1xwsAI0JRSOMIg5o5SM/gPaT4xw6W1U6sU15AA4JP9b0kjnqOQTr0
 eB1Q==
X-Gm-Message-State: AOAM533O/Q8IpyUUc8I3vk/l95P6y9uYHCVzEZ++xCPVwmbVnrIOL97h
 VtSFhHXZTlrm00209zIFtPjYysgJWjWblw==
X-Google-Smtp-Source: ABdhPJx0s2Um4TLIWmEQvnQv1kvnMhnriZdO+qDZabUA5FAl2qEQFJj3DN+Jzc7Sd1qQgoCc5+419g==
X-Received: by 2002:a1c:4045:: with SMTP id n66mr18199239wma.94.1618786317868; 
 Sun, 18 Apr 2021 15:51:57 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b187sm17334211wmh.17.2021.04.18.15.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/29] target/mips: Add simple user-mode
 mips_cpu_do_interrupt()
Date: Mon, 19 Apr 2021 00:50:41 +0200
Message-Id: <20210418225058.1257014-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
index 8d3ea497803..46e9555c9ab 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -964,11 +964,8 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
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
@@ -1271,11 +1268,9 @@ void mips_cpu_do_interrupt(CPUState *cs)
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


