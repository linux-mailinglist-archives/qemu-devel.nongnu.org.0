Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36C3C3562
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:57:45 +0200 (CEST)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FMO-0007CC-8t
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exg-0006EJ-GS
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:12 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exe-0002UK-PD
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:12 -0400
Received: by mail-pl1-x630.google.com with SMTP id c15so6622300pls.13
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N9trJ1kjKGoNILkYQrFrW0/ogeTQmik7Rpq4HjTsUMQ=;
 b=tpns8aJPE6wLgu/SUznDn9IsAIvqw6libgybVkfiz6F7Y3v25IAa0nx32UMVNnniNk
 9F80eI4iJZQroZV9B9+uuv/CC40RTKS5gTJ1N5xmPoQ4nJIyHzIHonNp8KSDvADhvPws
 KBMw/BBQp/sl9Vk7ojcB/cpCKGMZSrQUGqMPZsL6TYXjktruW3TPAx+S1lztwULkrtCU
 SQzlhN1tRwSbfrjCJthwBuqKgFD3txkSvaWk0tSVnWtEB3njyIrk54qYX/WiDTXhNZbr
 MOh529cfRrD2uudOY+d1OAh49wP2i74O3XwB7oiaoa+lt1VzPpEkqrIOs37DZ/VTmFh2
 xIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9trJ1kjKGoNILkYQrFrW0/ogeTQmik7Rpq4HjTsUMQ=;
 b=h2QOHa5KPzgMdCBAUjJmrur9+05l534ZMjA4eEsGOE2Vh37QAyQasLrKXop/v3cIh1
 l8oK6Rfiy1mXz3lqikTZrauqnEpjBkCF1x20eVvLLw5HOXnmWvwbmRvpeVU0/Nbn1nGN
 lZXUIP+dnjLPCmnYuPTf1Wcao1hLIJb5Bfhdn7QAdz/dno4B4c85kaIFSkRvMbkzXyRQ
 Uut50YA12NErim+GpB4j2l8jmsplWG/6Z4KgvajMkYkho2F2lyHnn41Nd2dOjMJZsVQH
 Xv3ClbEW4zM6408nAYeysR7hS37FgBVtB1tPifeEzNR3/1ThBJ830kv94vVjrPRGhSOF
 B0uA==
X-Gm-Message-State: AOAM531juDcZL6VYnPeGDhpH1+SSY4HsowrKEEDMucvB8gMNQq2HVbED
 oc6c7WcLqFNlcYE7vWkQ5BNP2VTo9Df+Jg==
X-Google-Smtp-Source: ABdhPJwal1GmSslzL67mW4/0KXALokxZ2sqSeZa4S0jhZ2CzJomMCFCNFKY4s/wZSK9lIv4sRP1xRw==
X-Received: by 2002:a17:902:9895:b029:128:cdfb:f389 with SMTP id
 s21-20020a1709029895b0290128cdfbf389mr35038289plp.45.1625931129519; 
 Sat, 10 Jul 2021 08:32:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/41] accel/tcg: Move tb_lookup to cpu-exec.c
Date: Sat, 10 Jul 2021 08:31:39 -0700
Message-Id: <20210710153143.1320521-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we've moved helper_lookup_tb_ptr, the only user
of tb-lookup.h is cpu-exec.c; merge the contents in.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-lookup.h | 49 -------------------------------------------
 accel/tcg/cpu-exec.c  | 31 ++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 50 deletions(-)
 delete mode 100644 accel/tcg/tb-lookup.h

diff --git a/accel/tcg/tb-lookup.h b/accel/tcg/tb-lookup.h
deleted file mode 100644
index 9c9e0079da..0000000000
--- a/accel/tcg/tb-lookup.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/*
- * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
- *
- * License: GNU GPL, version 2 or later.
- *   See the COPYING file in the top-level directory.
- */
-#ifndef EXEC_TB_LOOKUP_H
-#define EXEC_TB_LOOKUP_H
-
-#ifdef NEED_CPU_H
-#include "cpu.h"
-#else
-#include "exec/poison.h"
-#endif
-
-#include "exec/exec-all.h"
-#include "tb-hash.h"
-
-/* Might cause an exception, so have a longjmp destination ready */
-static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
-                                          target_ulong cs_base,
-                                          uint32_t flags, uint32_t cflags)
-{
-    TranslationBlock *tb;
-    uint32_t hash;
-
-    /* we should never be trying to look up an INVALID tb */
-    tcg_debug_assert(!(cflags & CF_INVALID));
-
-    hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
-
-    if (likely(tb &&
-               tb->pc == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
-    }
-    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
-    if (tb == NULL) {
-        return NULL;
-    }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
-    return tb;
-}
-
-#endif /* EXEC_TB_LOOKUP_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index fb6668606f..0d92698030 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -40,7 +40,6 @@
 #include "sysemu/replay.h"
 #include "exec/helper-proto.h"
 #include "tb-hash.h"
-#include "tb-lookup.h"
 #include "tb-context.h"
 #include "internal.h"
 
@@ -146,6 +145,36 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+/* Might cause an exception, so have a longjmp destination ready */
+static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
+                                          target_ulong cs_base,
+                                          uint32_t flags, uint32_t cflags)
+{
+    TranslationBlock *tb;
+    uint32_t hash;
+
+    /* we should never be trying to look up an INVALID tb */
+    tcg_debug_assert(!(cflags & CF_INVALID));
+
+    hash = tb_jmp_cache_hash_func(pc);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+
+    if (likely(tb &&
+               tb->pc == pc &&
+               tb->cs_base == cs_base &&
+               tb->flags == flags &&
+               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+               tb_cflags(tb) == cflags)) {
+        return tb;
+    }
+    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
+    if (tb == NULL) {
+        return NULL;
+    }
+    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+    return tb;
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
-- 
2.25.1


