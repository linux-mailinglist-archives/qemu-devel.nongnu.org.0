Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD135370E05
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:41:27 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF9q-0004cp-Uu
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmZ-00065v-Dl
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmX-0007lb-M8
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id n127so1916993wmb.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fPxVO8YxYE573bf/ors7hmJKmVbhQk08qkmo13FNuuU=;
 b=XPfz2xjfb9fjMJUYM/M1q7UkoqPUzVRJpzvnjbUQAvIHWdIzw1fWzsNxbgGWGon08c
 uz3Ebsw4UuSMCAqYsJ52CCrOGLB/CtgdgEVdlMHgpncidOiYMlYiNIHY0deJnBnZneRD
 vEmqDTQ1C+GloHurT4sm1ROzg4SFa56V29S+mmx5AkZV/XUCk/jjQWUFf/4LWcinavPg
 nIZQV+pj1QWwLW50yuceMHlf6c9v+EE04vYHuDXhgdsBu46Io9vC8xsikUd1Tqw3nuMT
 wD+dcPDhNprBoyFSXfIx1KOlcaYQ/qL3YDZi9RPeWJsT77s8wgmuoctOPxVsn1ncfeKz
 HQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fPxVO8YxYE573bf/ors7hmJKmVbhQk08qkmo13FNuuU=;
 b=MCfTWP/t3nahubLLtyfs1i8jER/RTW5RfMaUFT46JnVtNwnJxcdr+2di2TwOHO3uAQ
 pCniqPXKqxmwryQnd3Tf0mlveNEVd4lmmeyYYiTzRzdhRkxcuYcbYmPh9yS5g75/YMBE
 RLLafy5x8cEc5Gwd2Qdc29Y49mDHE2xLWviNeydVyJpCrXHcUem5s85qmpzWKjg7q/H/
 3tV/3QKlXkp7ucbCfF/NQsl6vjre3wMnK8+Enl5/0aHWzikgTQ17obGFnGs+dHxIJ+Hs
 nhkbX/ZOJ+XLdNtLXxLGCN/ebxWZ0Dvd8rywOEvJJxNjPbQR5BFwnes0LabqcC4d1j7Q
 jWwA==
X-Gm-Message-State: AOAM530FzApkZDflLjJKLOs4iSuIi5mRLsdqLW8hMtAjeH24hhdPTObT
 9WkNVOo5s7P1KW4/wk6nvB9602GsWSX5WTxs
X-Google-Smtp-Source: ABdhPJwowWiVf+cd1CrcreLlsGFIaq45pT0EffdZkMXG1eYZt9VnAZVuXj9WQME09XUX3x7DzfYvWQ==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr17381384wmh.187.1619972240179; 
 Sun, 02 May 2021 09:17:20 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id v15sm12078430wmj.39.2021.05.02.09.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/36] target/mips: Add simple user-mode mips_cpu_do_interrupt()
Date: Sun,  2 May 2021 18:15:21 +0200
Message-Id: <20210502161538.534038-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Message-Id: <20210428170410.479308-14-f4bug@amsat.org>
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


