Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B024D4639
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:47:08 +0100 (CET)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHG8-0005nM-0k
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxK-0005Ge-Q5
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:42 -0500
Received: from [2607:f8b0:4864:20::102b] (port=35645
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxJ-0007wr-7t
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:42 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso8015301pjb.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO5qDCidg6tXT/kBs+ctrp9mOI+zlSE5VUcpn5RQSbI=;
 b=Mq0oxVi4HUaSZ9l0SxP5Z2LoFJrv2mz+s/HxKiAVEp/qeJo93dDTlWsohwcdFsZe4W
 rzybK2xVNehIfg3GyhEjNQBhmY3vUrvV8NskGfvI8EznR0iFSB7CeEonGkrI+8W2+sZa
 Sy2WskG3gl44gi9fXvsolAieLNWPAZaHSH+W2stOZkIZPhQuDrFajUXgXFR94348kbZN
 5OnTOqhH236pASucXt12FNnq7hAkE34S8p8PqdYYbOE6TY88o/wjqSQfoh7acQRBo7tF
 /awe3sb9g1oIeMBXsI+lf5/9eJ5x01ai7Bi3mb2zWC0z3Fn2Ur2FR2OOhhP++Y/v1JIw
 l5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO5qDCidg6tXT/kBs+ctrp9mOI+zlSE5VUcpn5RQSbI=;
 b=zyib/qOz2JwjhzWos8WwMTa/Uk1f1VTrCKVFj91EYBsWio9767iTmtMpb85mBZxNJ/
 rQovL6Yjg+B5zUCwPLKyczyrSnMYcCjrIL3xZkAsVVbknut7itWQxTds+ZyhyA+86agL
 umRUdisw+lZmUKCudGY3Tsz0A53Rd0v/ASvDqyV0xSsGVk/rWCZ/n+6ToJZ2I4U6R7jp
 pf4jExfRamh5wOPpwRON49WzObxbdmUb+NcfrS6XS+QLR4Dt2zTybsDpV88pYwYbXhA+
 mm1PXMIP2lO64N4eFaQbQyapYX8wuHYGtMC07lsK5+iqpC9JZYRmQoCVDkKvk1L6FMde
 1qrg==
X-Gm-Message-State: AOAM530SKVIA8PjyoDmhSzW3pJxwzBpni6ffF1rUlkFKU0ywczAx7/hT
 gIqqjntawZH4HvIPrqFpKnvjzwhBIkpgMQ==
X-Google-Smtp-Source: ABdhPJwtyk+vsd4pg58WWkjiEbkElhj+pmR2skMX0Wf2aKt/7TDWdc0oEcDiICzRqhNkMtD0AI4qRw==
X-Received: by 2002:a17:902:ab4c:b0:151:eb86:dcb5 with SMTP id
 ij12-20020a170902ab4c00b00151eb86dcb5mr4470962plb.126.1646911659982; 
 Thu, 10 Mar 2022 03:27:39 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/48] target/nios2: Clean up nios2_cpu_dump_state
Date: Thu, 10 Mar 2022 03:26:49 -0800
Message-Id: <20220310112725.570053-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not print control registers for user-only mode.
Rename reserved control registers to "resN", where
N is the control register index.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2e486651f5..45fe2f9a05 100644
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
 
@@ -904,10 +906,6 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUNios2State *env = &cpu->env;
     int i;
 
-    if (!env) {
-        return;
-    }
-
     qemu_fprintf(f, "IN: PC=%x %s\n", env->pc, lookup_symbol(env->pc));
 
     for (i = 0; i < NUM_GP_REGS; i++) {
@@ -916,13 +914,14 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
2.25.1


