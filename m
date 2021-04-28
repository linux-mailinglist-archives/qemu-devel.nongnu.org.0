Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8136DE16
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:20:18 +0200 (CEST)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnrF-0006Np-3z
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnd5-0000Dk-8D
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnd3-0006E0-77
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l2so11513484wrm.9
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOOn5441pcRfPUiL4gXBm9CusRAuENaccyMye79jHuY=;
 b=Z0tSAEFI6kYmFOx4S1Y6JI2+pN7eBczEWvQzcwjgHcheFNRoYCRoWpzpHQ3YKtHdkS
 9tSvKZW9Bir4x7h+U3HNONRv3aW7zrEV4c4szV9CrXV0LqA7WElbGcZQNeJCpfkgWlnN
 q/E6H16inR3qQ+gIw9h/uO//PNbi7Rj+Ga4i5uiSmoJlqPnd9EEMF0VF0ibvcoHqRI1a
 E/EBmruLztjokDvlMLZ5hUPMYqVB8URmd9uHaP4cAjUmEcHT+EBrBPhMx+yfxlO2qEgF
 T0KXkOJA9YFUR+fKKSpvktd/QWGnDpmKS7bQ2C2V+RBxh1uGon7u6WsNJDzx9AA9MsjA
 V8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aOOn5441pcRfPUiL4gXBm9CusRAuENaccyMye79jHuY=;
 b=A6iIM2/kA1If8nYqsJdH4tpjj++gmoiU+1WcJMKe5pxjn53r0uboGWCrVITdXr31lF
 rCwhdbFwMFuLKAvOT+xQUuCvEmAO+dDnaytGsek6kG8i4aRjxnciX63fh4XTlW016ZrV
 h+8OH7AvWcfELcvwfq9DC5eWxXVTV/lL03/y8xNXhIytrgwC/Nxb81IjU2kIpfADgKVJ
 brDiK8IeUftwano+QLgsYLEf4FBdGrBSBA5A3iGJW7KFpA6tk05AmLCw34VT2sXAOmF9
 gPMAmiCQsvJL4m6kFXBSfMrhgXQmyoddkE0TCd3zFcWdXJQRZxbP9aQuE4swUdRRFC7G
 QdIA==
X-Gm-Message-State: AOAM532MNRHdz/o+FlAmGc6ogZDX4LNF4Ia1uSEp1WKbluHyWfReMuWm
 xR29lNPERDNKnJg5tQjLRJtq3aT9iQayoA==
X-Google-Smtp-Source: ABdhPJwDeRwSjy9iWd7kSd3BsIAiOyJ2wUqVhXBa9ekdipC8IuARpOfeheumpd0YLMJD1lJEVJmDoA==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr24184426wrv.254.1619629535693; 
 Wed, 28 Apr 2021 10:05:35 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t7sm460285wrw.60.2021.04.28.10.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/30] target/mips: Add simple user-mode
 mips_cpu_do_interrupt()
Date: Wed, 28 Apr 2021 19:03:53 +0200
Message-Id: <20210428170410.479308-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


