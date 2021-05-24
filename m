Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D8938F21E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:16:57 +0200 (CEST)
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llECG-0002q8-No
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE10-0002PG-HZ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE0y-000476-PP
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id r12so29276082wrp.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VNPWa+cTpvFPOmCcmkrw+1H8tZqA2fr+Oi3ez/kimWw=;
 b=iGngkWfPk4JO6u6IU1cdKIgWNoZzsyR18+kdoRzzA2uxWnvwY+xXY66HQpXR2KADGC
 1xWH89+XFCfwyytwcw9vhESXLI1yvTIg5c/43nnY/jBgHy9PwhuqZMOMkcNXYIR4lk63
 FBnVzdid3jxQQglrPFwCYZ4P+oXtRXYD65YAxl45E3SpepMWIXi3J1ekJTtzGzOsQ+di
 DP1axjW2eaH5PilzeRPZWnWpknqe/Uis27pjUiWu5g/0Mjw1bOcO6dKeCXT1suKXHYGM
 B0pi0tNcIJ48eoxb5l3t/StzXvHF/ar10bQP0K4AuLFXDp4aqiMBDZRBmPL1MoV/3c1S
 sMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VNPWa+cTpvFPOmCcmkrw+1H8tZqA2fr+Oi3ez/kimWw=;
 b=Yy+gwRUHiN2WoBsFVKcVqrVsgD6dyrvN80v/eVkMOtlQXmEmPkpDNj5oSSn6g9lPhV
 JT5QYSGfyk0gNJZL1WHUuuIHidXYb3Ao6Jtjj90oVP7S9KC0MUR0oKbvit/riYsAguvT
 K8XrC9/7ulm1TjFSmGVR2roTjV2xLuIn+vxC5iMHPkzczrErqi1tYDJUlwuOUKqJLHLj
 Jfaq/yfGA/bcFhchFt9guRyX0cbC3Z82YaM34VbZIWxnks2G80PVNk4/vzxzoe08fnCD
 Cd+0eNPr7DQjW0eDD7/gh3pyMUM82CToEArgaCT+NqNh0hv3KW9lXpOZlmpOnsxVmwsL
 Ki1Q==
X-Gm-Message-State: AOAM531hODTUF8Do0uQJvNeLI7bGVQygHT56ZMKuhzdcc8P525vELTeF
 2KJlklBiw4AV9krDB6JMB01EW3WN/Oz9QA==
X-Google-Smtp-Source: ABdhPJzZWHyz1/QCgtHusYOFQhXCYwyGW4Fk/TtXhgRtKq8ylFyVrMgFP6ZgbJJbS6aeg74v3Dobfg==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr8248926wra.399.1621875915073; 
 Mon, 24 May 2021 10:05:15 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a11sm13024252wrr.48.2021.05.24.10.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 10:05:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] accel/tcg: Keep TranslationBlock headers local to TCG
Date: Mon, 24 May 2021 19:04:53 +0200
Message-Id: <20210524170453.3791436-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210524170453.3791436-1-f4bug@amsat.org>
References: <20210524170453.3791436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the TCG accelerator uses the TranslationBlock API.
Move the tb-context.h / tb-hash.h / tb-lookup.h from the
global namespace to the TCG one (in accel/tcg).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 {include/exec => accel/tcg}/tb-context.h | 0
 {include/exec => accel/tcg}/tb-hash.h    | 0
 {include/exec => accel/tcg}/tb-lookup.h  | 2 +-
 accel/tcg/cpu-exec.c                     | 6 +++---
 accel/tcg/cputlb.c                       | 2 +-
 accel/tcg/tcg-runtime.c                  | 2 +-
 accel/tcg/translate-all.c                | 4 ++--
 MAINTAINERS                              | 1 -
 8 files changed, 8 insertions(+), 9 deletions(-)
 rename {include/exec => accel/tcg}/tb-context.h (100%)
 rename {include/exec => accel/tcg}/tb-hash.h (100%)
 rename {include/exec => accel/tcg}/tb-lookup.h (98%)

diff --git a/include/exec/tb-context.h b/accel/tcg/tb-context.h
similarity index 100%
rename from include/exec/tb-context.h
rename to accel/tcg/tb-context.h
diff --git a/include/exec/tb-hash.h b/accel/tcg/tb-hash.h
similarity index 100%
rename from include/exec/tb-hash.h
rename to accel/tcg/tb-hash.h
diff --git a/include/exec/tb-lookup.h b/accel/tcg/tb-lookup.h
similarity index 98%
rename from include/exec/tb-lookup.h
rename to accel/tcg/tb-lookup.h
index 29d61ceb340..9c9e0079dad 100644
--- a/include/exec/tb-lookup.h
+++ b/accel/tcg/tb-lookup.h
@@ -14,7 +14,7 @@
 #endif
 
 #include "exec/exec-all.h"
-#include "exec/tb-hash.h"
+#include "tb-hash.h"
 
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 10e11f27bbe..ad1279d2ed7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -29,9 +29,6 @@
 #include "qemu/compiler.h"
 #include "qemu/timer.h"
 #include "qemu/rcu.h"
-#include "exec/tb-hash.h"
-#include "exec/tb-lookup.h"
-#include "exec/tb-context.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
@@ -41,6 +38,9 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "tb-hash.h"
+#include "tb-lookup.h"
+#include "tb-context.h"
 #include "internal.h"
 
 /* -icount align implementation. */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 84e7d91a5ca..8f4925680c1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -24,7 +24,6 @@
 #include "exec/memory.h"
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
-#include "exec/tb-hash.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "tcg/tcg.h"
@@ -36,6 +35,7 @@
 #include "exec/translate-all.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
+#include "tb-hash.h"
 #include "internal.h"
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 49f5de37e87..66ac830e2f2 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -30,7 +30,7 @@
 #include "disas/disas.h"
 #include "exec/log.h"
 #include "tcg/tcg.h"
-#include "exec/tb-lookup.h"
+#include "tb-lookup.h"
 
 /* 32-bit helpers */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9f4de5190d..1eefe6ea8d4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -47,8 +47,6 @@
 #endif
 
 #include "exec/cputlb.h"
-#include "exec/tb-hash.h"
-#include "exec/tb-context.h"
 #include "exec/translate-all.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
@@ -61,6 +59,8 @@
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "tb-hash.h"
+#include "tb-context.h"
 #include "internal.h"
 
 /* #define DEBUG_TB_INVALIDATE */
diff --git a/MAINTAINERS b/MAINTAINERS
index a77f2465694..5f55404f2fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -128,7 +128,6 @@ F: docs/devel/decodetree.rst
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/helper*.h
-F: include/exec/tb-hash.h
 F: include/sysemu/cpus.h
 F: include/sysemu/tcg.h
 F: include/hw/core/tcg-cpu-ops.h
-- 
2.26.3


