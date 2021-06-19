Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623653ADB3E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:17:41 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufXI-0003fl-Eq
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUi-0000fP-Bm
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:00 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUg-0002Eb-N6
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:00 -0400
Received: by mail-pf1-x430.google.com with SMTP id w71so334886pfd.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6WR/q/XMRsg+9/4YpwLpIga2lF+a4ZN740h5QwBqxQ=;
 b=aMXVnWd56iSrYam62Ts1D8MZVDqvi51XYiGcbsMMZja+05Q6/MPHkPC08/kYQIrCRh
 LOn17q9UTq5KTCykPty9lH0bZjqcbLSDvKX7W1zw0G4hXeOB5IUBBeEy1avdXIVxNCvp
 c4JXWtQVcR87NOioYr7qVIxSu9BuCzB1ieclHuGGPWX/zETqlynuNNP0s09Hw+FHoKBm
 JTxNqCv0HT0H1xFQHAv1Rcm7Yup8ovN3A7G+sN+WstDT9hmesb7jHi/hdwSIwQzlGT8Z
 JK0gEHA+edFn1mYCfqlr5AF1VPT5VMP5iFb55jQDrN3UcXLhiz19Z8NhkmW8suM+XB/q
 jc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6WR/q/XMRsg+9/4YpwLpIga2lF+a4ZN740h5QwBqxQ=;
 b=a6Exac0j7kc+Q11/6ZNqNL2/dOYhmHEfzwgCV5k3HQ3TR8ynbTxZk+WGrqrs5WbPWf
 tGoGMEd0yb1wTnms8XExnPdAkR0gkeYxH/9O1F8BCA+aTimo9WSY51YpPFFq8tbnHAD0
 yAOUMG7sZQ6qmK/COeXPAvEEnB8cxPkPgiCmfwiqxsZaTkTUylTiWaMjHtArmuy2KLQv
 RCybMi85RPtWIfNfUCNPKerPYHJnNHWgGq4Qbu0iw+X2KmJzzKgqYSr3nCJ0aAZzES8D
 b5vmXMHLatQf2tzrDYTsYPUn0HKQL25ECAF2a9OOLuRXj6+jpAe6H9D+B/nYFYMXw4lH
 y0fA==
X-Gm-Message-State: AOAM531BpThFOGPCEcscdZRzVeG8+DtfRnaqOvduxO2IMu82rER+s+XK
 jS8tC2CXD1Np1Ww9d/RcgOTzMgd69mEbaQ==
X-Google-Smtp-Source: ABdhPJxJQLWrbMa502LGv1t/jJI9C4g0IuUVJWZFO2vrN0IDBHEoU5KMpITyqWmTcF+ysBOWPG5wXw==
X-Received: by 2002:a63:d409:: with SMTP id a9mr16044437pgh.304.1624126497342; 
 Sat, 19 Jun 2021 11:14:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/33] tcg: Add tcg_call_func
Date: Sat, 19 Jun 2021 11:14:26 -0700
Message-Id: <20210619181452.877683-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 5 +++++
 tcg/tcg.c          | 5 ++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 6ab8910210..92c91dcde9 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -44,6 +44,11 @@ bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
 void tcg_region_prologue_set(TCGContext *s);
 
+static inline void *tcg_call_func(TCGOp *op)
+{
+    return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op)];
+}
+
 static inline const TCGHelperInfo *tcg_call_info(TCGOp *op)
 {
     return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0dc99cc65b..8f4f1711cd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1740,7 +1740,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             }
         } else if (c == INDEX_op_call) {
             const TCGHelperInfo *info = tcg_call_info(op);
-            void *func;
+            void *func = tcg_call_func(op);
 
             /* variable number of arguments */
             nb_oargs = TCGOP_CALLO(op);
@@ -1754,7 +1754,6 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
              * Note that plugins have a template function for the info,
              * but the actual function pointer comes from the plugin.
              */
-            func = (void *)(uintptr_t)op->args[nb_oargs + nb_iargs];
             if (func == info->func) {
                 col += qemu_log("%s", info->name);
             } else {
@@ -3789,7 +3788,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     int allocate_args;
     TCGRegSet allocated_regs;
 
-    func_addr = (tcg_insn_unit *)(intptr_t)op->args[nb_oargs + nb_iargs];
+    func_addr = tcg_call_func(op);
     flags = tcg_call_flags(op);
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
-- 
2.25.1


