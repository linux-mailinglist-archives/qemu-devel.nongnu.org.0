Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017A50BE7F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:24:20 +0200 (CEST)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx11-0004lz-BN
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX6-00010v-SR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:24 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX5-0007J0-C7
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:24 -0400
Received: by mail-pf1-x431.google.com with SMTP id c1so1996312pfo.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zXcdhRLjKPOUAo+r01dJ9lV49KSzWQuat06zJqj++Ck=;
 b=tYtlOgW13hh8LVtQ/m/8BVnjw3Vyl8Wnz1COXn+j15l+6YvYNebcLfJloirpACM4oO
 Ra9vFR2ejwvTjZyvCV0De/5tdquWgCMF0tQfw4qk4U+kQfqSONvz50vNyThgDZEIZ7Qi
 HoDLVYXvo9/XT58SnOma5cgnb77ddqi/DrBKZuRnK9EpJLqK0rMD3kvkuqio6jtmTkhM
 qQK2EyeMTxdl/jWUJ+PB3kfo9kZNtCYrCq2oZ6jBcGMcbLQOjN9h/iKBFNX0irQMxA0w
 YZg2FLz9ndcrywSTFeL7Ke9oMovvuPNlBJ7Ucx/mjc3LHFZPW0QFJFGDknV4p66GXoKt
 FPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXcdhRLjKPOUAo+r01dJ9lV49KSzWQuat06zJqj++Ck=;
 b=tI7y0PfysZ3HHy6RecmFw3zTdgWnzjQG229pdQFc6aQm0d5Fk+8ImFvLijPmPfhLj2
 6fYb9r+VEiQs2qii8FhZpdjY0pq0/WliBLyulUp8SOQY2fACZ/U8EmHzArhkWjIkOBap
 jIxrkT2Cfa9Iw8KMCobhyZ+sdURXIXuiDB0JkJwU5RR0OUp4UryMCeGUgS5EtXIHgzzR
 wzR/Bh8TbkBHpq5PUvgMmkRfPnTmyxV7l1w6RwnW9Tp/KWAuiNG1eG3shFg373HpNyQS
 uGzbUz6gzJFkd317fp4SivO4PCw0hgHvsSS+2WuaUpwK1nv/WoRmas/mcE+SZ/aNditb
 Fgaw==
X-Gm-Message-State: AOAM531C3OjL7y68d9+h4JqIcvBigjy0RiHW4bnLXiuOeiyt084BQSrY
 7bq53dZ+mdIe54mWSnSG65x1LeeUG6h6VDEy
X-Google-Smtp-Source: ABdhPJyVg74zJdi+WmajKVqmXaFS0l1pSRIxlwAtjH7amdOS5tDm8OrxOCyYZSNLJw5zy1JfT+OVeA==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id
 t8-20020a056a0021c800b004c404bddc17mr5843037pfj.57.1650646402068; 
 Fri, 22 Apr 2022 09:53:22 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 23/68] target/nios2: Clean up nios2_cpu_dump_state
Date: Fri, 22 Apr 2022 09:51:53 -0700
Message-Id: <20220422165238.1971496-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not print control registers for user-only mode.
Rename reserved control registers to "resN", where
N is the control register index.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-24-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 308da8057c..fc49a7101f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -783,16 +783,18 @@ static const char * const gr_regnames[NUM_GP_REGS] = {
     "fp",         "ea",         "ba",         "ra",
 };
 
+#ifndef CONFIG_USER_ONLY
 static const char * const cr_regnames[NUM_CR_REGS] = {
     "status",     "estatus",    "bstatus",    "ienable",
-    "ipending",   "cpuid",      "reserved0",  "exception",
+    "ipending",   "cpuid",      "res6",       "exception",
     "pteaddr",    "tlbacc",     "tlbmisc",    "reserved1",
     "badaddr",    "config",     "mpubase",    "mpuacc",
-    "reserved2",  "reserved3",  "reserved4",  "reserved5",
-    "reserved6",  "reserved7",  "reserved8",  "reserved9",
-    "reserved10", "reserved11", "reserved12", "reserved13",
-    "reserved14", "reserved15", "reserved16", "reserved17",
+    "res16",      "res17",      "res18",      "res19",
+    "res20",      "res21",      "res22",      "res23",
+    "res24",      "res25",      "res26",      "res27",
+    "res28",      "res29",      "res30",      "res31",
 };
+#endif
 
 #include "exec/gen-icount.h"
 
@@ -905,10 +907,6 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUNios2State *env = &cpu->env;
     int i;
 
-    if (!env) {
-        return;
-    }
-
     qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
     for (i = 0; i < NUM_GP_REGS; i++) {
@@ -917,13 +915,14 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             qemu_fprintf(f, "\n");
         }
     }
+
+#if !defined(CONFIG_USER_ONLY)
     for (i = 0; i < NUM_CR_REGS; i++) {
         qemu_fprintf(f, "%9s=%8.8x ", cr_regnames[i], env->ctrl[i]);
         if ((i + 1) % 4 == 0) {
             qemu_fprintf(f, "\n");
         }
     }
-#if !defined(CONFIG_USER_ONLY)
     qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
                  env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
                  (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
-- 
2.34.1


