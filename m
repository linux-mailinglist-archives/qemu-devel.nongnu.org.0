Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347914245D3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:15:42 +0200 (CEST)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBS9-0003pX-98
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYBP0-0002Ip-I4
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:12:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYBOy-0004w4-NT
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:12:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id s15so11427163wrv.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sZpfx2bUvI9CqllKUWhSqmnXDEtLWukZ0/HkURdc1jg=;
 b=q5w5DiMWFPrKm03hgW80fA+kosanXWrZNfVDUoP5edv4a71DEOhm7XR1DGH2cNIJRq
 ZthavSq20O1xqtkJAqFYjT9iHl3ZqKoqPb9b6k6ggDBHrRb8qz8XjE7Q4CJFyk7ANQWx
 ZTIxsNPrcbXJnpzC0ELUuS1Q5eX2BLBFAdvWLsWRFm54D2qwZCTUl7qVlNyglJ3y/Yyf
 BhJv6eLXFcraR8CD1IeHDCORdcPG5meju+U1yn79e3c4WKK3urCqIBtY5XsEvJc19vXq
 YZ78h/SwAurTwrpaPiYdMvjHerPsD47D4cI/g8fqRNgu5v8mW9F5REQZsW9ka/+ORBwL
 MNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sZpfx2bUvI9CqllKUWhSqmnXDEtLWukZ0/HkURdc1jg=;
 b=TkTEB+jng0a2a13MAKMkFmBoNxfNf/VRe1B7fYoSUCOm7MqnDpPNb91iUsMPBMWCsr
 z/pmSkMTTlf/fZJgYyI0q2BytYqnYrPdy1FwIcHAdLVUXXSehQ84bL38XGPnuZt+Goo4
 vZ5X6vQAUfuJvQwbr84fNo3IkXEjAbD6OkR+smWLhobwJews3Q/WGJHZZL6KEQiH7hk+
 323J+X001MvRm3IxehIRDy/E3kA9cKuAsr4HlauPpAzGmtZZ54omk5AhMn6COyi0vZXe
 9rk0sZoGkJUm1qO5Te18hkwtfSxi5813LWwVoCb2KtdlWD8qFVvZlzK8/W1RsfWT1nXb
 pVPw==
X-Gm-Message-State: AOAM531CaRuJOn5sd+iqXv2hh3LnB5z38MiIus3LZOvc60ENKCGnyLWW
 y9Mduf2c9SvdLMCysSp4tPNE0pHZMcg=
X-Google-Smtp-Source: ABdhPJyO0/4sZWc4WUmghR7yFs9Q6BOQPM9IvbfZYG+QvXxEwGoH5+jMpylE13Q4aZOtKZvokOWJRA==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr30053569wrc.53.1633543941720; 
 Wed, 06 Oct 2021 11:12:21 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t12sm18572537wrw.12.2021.10.06.11.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 11:12:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/sh4: Split user/system helpers
Date: Wed,  6 Oct 2021 20:12:20 +0200
Message-Id: <20211006181220.213866-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_sh4_is_cached() is the single user-emulation helper:
move the function to its own file and simplify the #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20211006172307.780893-1-richard.henderson@linaro.org>
---
 target/sh4/{helper.c => helper_system.c} | 15 +------------
 target/sh4/helper_user.c                 | 28 ++++++++++++++++++++++++
 target/sh4/meson.build                   | 10 +++++++--
 3 files changed, 37 insertions(+), 16 deletions(-)
 rename target/sh4/{helper.c => helper_system.c} (98%)
 create mode 100644 target/sh4/helper_user.c

diff --git a/target/sh4/helper.c b/target/sh4/helper_system.c
similarity index 98%
rename from target/sh4/helper.c
rename to target/sh4/helper_system.c
index 6a620e36fc3..077b3dd8de5 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper_system.c
@@ -1,5 +1,5 @@
 /*
- *  SH4 emulation
+ *  SH4 system emulation helpers
  *
  *  Copyright (c) 2005 Samuel Tardieu
  *
@@ -23,10 +23,8 @@
 #include "exec/exec-all.h"
 #include "exec/log.h"
 
-#if !defined(CONFIG_USER_ONLY)
 #include "hw/sh4/sh_intc.h"
 #include "sysemu/runstate.h"
-#endif
 
 #define MMU_OK                   0
 #define MMU_ITLB_MISS            (-1)
@@ -43,16 +41,6 @@
 #define MMU_DADDR_ERROR_READ     (-12)
 #define MMU_DADDR_ERROR_WRITE    (-13)
 
-#if defined(CONFIG_USER_ONLY)
-
-int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
-{
-    /* For user mode, only U0 area is cacheable. */
-    return !(addr & 0x80000000);
-}
-
-#else /* !CONFIG_USER_ONLY */
-
 void superh_cpu_do_interrupt(CPUState *cs)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
@@ -860,4 +848,3 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/sh4/helper_user.c b/target/sh4/helper_user.c
new file mode 100644
index 00000000000..b6eba9d085c
--- /dev/null
+++ b/target/sh4/helper_user.c
@@ -0,0 +1,28 @@
+/*
+ *  SH4 user emulation helpers
+ *
+ *  Copyright (c) 2005 Samuel Tardieu
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
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+
+int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
+{
+    /* For user mode, only U0 area is cacheable. */
+    return !(addr & 0x80000000);
+}
diff --git a/target/sh4/meson.build b/target/sh4/meson.build
index 56a57576da7..bbf2bb8aa03 100644
--- a/target/sh4/meson.build
+++ b/target/sh4/meson.build
@@ -2,13 +2,19 @@
 sh4_ss.add(files(
   'cpu.c',
   'gdbstub.c',
-  'helper.c',
   'op_helper.c',
   'translate.c',
 ))
 
+sh4_user_ss = ss.source_set()
+sh4_user_ss.add(files('helper_user.c'))
+
 sh4_softmmu_ss = ss.source_set()
-sh4_softmmu_ss.add(files('monitor.c'))
+sh4_softmmu_ss.add(files(
+  'monitor.c',
+  'helper_system.c',
+))
 
 target_arch += {'sh4': sh4_ss}
 target_softmmu_arch += {'sh4': sh4_softmmu_ss}
+target_user_arch += {'sh4': sh4_user_ss}
-- 
2.31.1


