Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11D4D1102
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:31:53 +0100 (CET)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUK0-0002VO-3U
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8z-0005BC-8b
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:31 -0500
Received: from [2607:f8b0:4864:20::633] (port=41580
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8w-0006J3-ED
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:29 -0500
Received: by mail-pl1-x633.google.com with SMTP id z3so7793806plg.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3vLmi9mxL7cFMKRdu4UOiQru6HR/JU1cXc1YHcKyCQ=;
 b=MwCkyL59sQOH4eTJil2uh4zMEA9mb0N2g2SiZsw5VL/ScfJXiofrJGmTsk+X2uM2wC
 mKYZvfx7wsFX+EnlkhWbOjHeObtGjuUm9zTVR8yoLQrcxcivhZsgv8vnzfAWUClx2LdU
 igbDBfsipWZUHO+nKTvw8lXol6+GwtiC3ysYUNLZZIUIwU+IiJRijUnnmfA7I5Pg4fWE
 OKzdP86rnLdj4EPjoFRCaHrbV7QpfZr/UiVCceuIsobEJ2G6A6LVJsbGFBTwxdgnF8HL
 JUhKUQrp+0HddA2pIOBDuq7A2PhfsuOsPC3/j1iRv4xS+mPn3yfLOF5OJhInXwU0Dr3o
 XI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3vLmi9mxL7cFMKRdu4UOiQru6HR/JU1cXc1YHcKyCQ=;
 b=EM70V9nP2aik7cXYGERIpVE4zYhSf3W2oKFhOikgrparndLfCMJwh6hvqGtAlgZkaM
 JkuQ6hHW899qurgbEh9eV2ZEJUzsNO5uLGaOo4mlTaog3mSGK+p1ZobV41qNfoiOpnxd
 uEoRlcONbnI7+TA3y6u5DAmXEEe4M44TQPB1915X2hLyiA/ck87ai56Cd88N7Id46aTL
 8yGXYc8UuzWMQiZ5b4HrAcnqECLX/+k0xTzNpnzIvhNT5Gt51Yd6PuTwV4nhaT8WToHb
 BzeSqltn72FS5ecKADr9PodWoHsF1VjBnclEUKZUaSn7UL0UzuLunbq9YFk1Q39WcWVR
 2sCA==
X-Gm-Message-State: AOAM532ccGvYw5OdcdTwrHD8zX3Q94Y/Udgvqt5LNTwqJrPRdkg8BXXE
 nnxW2ZR+3ieCmczWjMS+e2eh/1+BI2NDjA==
X-Google-Smtp-Source: ABdhPJzn7gi7R6DBHfAp9VQf+/od2/S5fGASAkyXyMuyVeKrGbckrX/qtH4+OKBHjn72k7myixf3VQ==
X-Received: by 2002:a17:902:9682:b0:14e:fe33:64af with SMTP id
 n2-20020a170902968200b0014efe3364afmr15976856plp.160.1646724025180; 
 Mon, 07 Mar 2022 23:20:25 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/33] target/nios2: Clean up nios2_cpu_dump_state
Date: Mon,  7 Mar 2022 21:19:42 -1000
Message-Id: <20220308072005.307955-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2942921724..7a32e6626d 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -754,7 +754,7 @@ illegal_op:
     t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
 }
 
-static const char * const gr_regnames[] = {
+static const char * const gr_regnames[NUM_GP_REGS] = {
     "zero",       "at",         "r2",         "r3",
     "r4",         "r5",         "r6",         "r7",
     "r8",         "r9",         "r10",        "r11",
@@ -765,17 +765,18 @@ static const char * const gr_regnames[] = {
     "fp",         "ea",         "ba",         "ra",
 };
 
-static const char * const cr_regnames[] = {
+#ifndef CONFIG_USER_ONLY
+static const char * const cr_regnames[NUM_CR_REGS] = {
     "status",     "estatus",    "bstatus",    "ienable",
-    "ipending",   "cpuid",      "reserved0",  "exception",
+    "ipending",   "cpuid",      "res6",       "exception",
     "pteaddr",    "tlbacc",     "tlbmisc",    "reserved1",
     "badaddr",    "config",     "mpubase",    "mpuacc",
-    "reserved2",  "reserved3",  "reserved4",  "reserved5",
-    "reserved6",  "reserved7",  "reserved8",  "reserved9",
-    "reserved10", "reserved11", "reserved12", "reserved13",
-    "reserved14", "reserved15", "reserved16", "reserved17",
-    "rpc"
+    "res16",      "res17",      "res18",      "res19",
+    "res20",      "res21",      "res22",      "res23",
+    "res24",      "res25",      "res26",      "res27",
+    "res28",      "res29",      "res30",      "res31",
 };
+#endif
 
 #include "exec/gen-icount.h"
 
@@ -899,13 +900,14 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


