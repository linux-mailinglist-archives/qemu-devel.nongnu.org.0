Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14450A50F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:14:34 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZRx-0002iq-Vm
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZV-0007UZ-9O
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:17 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZS-0006J4-VV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:17 -0400
Received: by mail-pl1-x633.google.com with SMTP id h12so1497777plf.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8C0hG9nUeAmbkxuWD9ITgea/jSx6I8RasjfIBbL2Yes=;
 b=hAiakueJWylUL3SSX7ab7pPx6i86iZaIHfr5zKSqD9O0rh/czhRMmkNmivtZsUaUoQ
 FViRg312I5R2wP3MexqY7xFH1jngOPs6izIIL/D6i7QcXFphhV26+gd0PQRBAyqnPo8B
 xbqn8S4gkKOVN33c9iP9fkndFIvr5RGVbqP99v/Y8puqVmrIAh0+Ex4phdVyW44M2i+2
 AEY7+XQ5nD23j34yjs5AIade/714S3mms4JCYwdSYkltHkLe0ZfJneQR+Gqh9RptIM7T
 xcppY8xfTKJyQw+ExNCg+IqBBAWhH+f5Kvh20M89sEWnO/VFED0IbHhDLG3z8gVrU2Q6
 VnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8C0hG9nUeAmbkxuWD9ITgea/jSx6I8RasjfIBbL2Yes=;
 b=nkNiEYl6XsWrmk/Qicxy9phMPs4U1vVw4mRvytrNr8FOHt08leHVSPXGFLZRigwTR/
 iT/1jEIJ0tccPKaZrKxWILrbgWcqnNzWq5Pw8cqNSu6j1YRLjN+8OIcD/LM9/cK62Cz7
 dMtj//C5KRbmfoENe08TlAtuVum+WUKFMeEIVlZsUOBj5Mu5GkZOZSOLUznNmqRxAITn
 OXGTI0kfaTQ25R0pw+xFv+TnqP7eR2nHkTmsfpH5MMLCPyaYYbLiAMU7LfhN9LtHQiht
 EgxsWWxePg5ZzZTaLNY/z/oxDI9iAQt2hDQJ04y+iztRhT3LRhrqkZjmfPiVnWKBTu40
 B4Yg==
X-Gm-Message-State: AOAM532BmKgb4DKTWHeZFsTCIsz01348x4blZr1Nz0AjG30L4cc/qpSJ
 qQWKygC3wMu//IXalsL73UcnE8DnJr5s4w==
X-Google-Smtp-Source: ABdhPJzgPilNIhBvQ9wbwAjPgTDBleAaKKgwHofcruHTHxhZ7Uu3xjXXbDU97XeCTSrua38z5W7iSw==
X-Received: by 2002:a17:90b:33cc:b0:1ce:a3fe:af41 with SMTP id
 lk12-20020a17090b33cc00b001cea3feaf41mr120723pjb.229.1650554293612; 
 Thu, 21 Apr 2022 08:18:13 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/64] target/nios2: Clean up nios2_cpu_dump_state
Date: Thu, 21 Apr 2022 08:16:54 -0700
Message-Id: <20220421151735.31996-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


