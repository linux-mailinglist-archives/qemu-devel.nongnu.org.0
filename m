Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512F36AAF6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:08:29 +0200 (CEST)
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larbo-0006yp-DP
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNn-00081V-1w
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:59 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNb-0007a4-1t
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:58 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 10so2559430pfl.1
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zrmei2M83kWQ7UG3ZlvrhhKftuKLYs48AQkSQjuWBHY=;
 b=nUhwKhejJgP2FXJ4Ww49yduznspzJWPVXlrht/9KZ012b3QBc7BOpUqsQIXuJ05+20
 qc/pt1tk8sVIbRXWemk0l1MmHozlBoLbes+dOZipoiY5EAYlk/5GSHu/3mPfSlVX8HT0
 Eig+di6vv2rrmxqyvaqcb3ZwDuAVeDTGCMIExljJMKbOrkwPmL8gc9WlV3viPsSzMvQt
 v4AUxlT4K1ui+UmFsLq/mABuym/EXKOO2y5Y3Q07nW4FGSv/8tiBRTwHW4N/YXvuHpAy
 cA3pcgsoim9S6RffUhVxBZ2r3ftZjPVSWev2MRhrrVcfhnL1d8saUEc4ReWTPpnGZ1kw
 KKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrmei2M83kWQ7UG3ZlvrhhKftuKLYs48AQkSQjuWBHY=;
 b=kJ1NmKcmVlwKymWJGFGbhNe+GB3qc5pBGsCfL5i33GHkHoVGav/kmNU7NBAp8ebY1O
 p+puFY1gQBU2gK8loqFSwvZQd00FNNpnc64ip74VysZrIoJ/i1DZB9LhqqB1euUthI38
 2LFv70WTwBdapzcYlPForuxXt/o17iogb+bP0xmh/qeWZDsDKh0Zpa4h0kkvf3UFuy36
 cKa5lUKJUA+NPhyMae6bi6B4781MbvruqU57ezpvj4NS3mTyvdhrRppPYrJi699RNS05
 d+ss71cpAycQBNlttk2emRwZpbMCdO2vuxglhoHKVmXb0GPPA4TotvxLuBbpu3llSkKi
 Sgng==
X-Gm-Message-State: AOAM5316ZjL2bUH7NE/O9WL5nAMxE2+DfPcLb+UFV2Dh7r/P6WmbX5Fw
 5kZ+KdB74tx6dvyt1Ho3VIEsew/vtUF0Tw==
X-Google-Smtp-Source: ABdhPJyPOxXd94BfedG26RNC4O19K0NugTxC1SN2H6xE5r9DcV4ZOAB/ygKJOV++nVHrQ761a7D0SQ==
X-Received: by 2002:a63:5503:: with SMTP id j3mr2943498pgb.256.1619405625633; 
 Sun, 25 Apr 2021 19:53:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/25] linux-user/sparc: Fix the stackframe structure
Date: Sun, 25 Apr 2021 19:53:23 -0700
Message-Id: <20210426025334.1168495-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move target_reg_window up and use it.  Fold structptr and xxargs
into xargs -- the use of a host pointer was incorrect anyway.
Rename the structure to target_stackf for consistency.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 29c5e3b0c0..3474098641 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -21,16 +21,26 @@
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
-/* A Sparc stack frame */
-struct sparc_stackf {
+/* A Sparc register window */
+struct target_reg_window {
     abi_ulong locals[8];
     abi_ulong ins[8];
-    /* It's simpler to treat fp and callers_pc as elements of ins[]
-         * since we never need to access them ourselves.
-         */
-    char *structptr;
-    abi_ulong xargs[6];
-    abi_ulong xxargs[1];
+};
+
+/* A Sparc stack frame. */
+struct target_stackf {
+    /*
+     * Since qemu does not reference fp or callers_pc directly,
+     * it's simpler to treat fp and callers_pc as elements of ins[],
+     * and then bundle locals[] and ins[] into reg_window.
+     */
+    struct target_reg_window win;
+    /*
+     * Similarly, bundle structptr and xxargs into xargs[].
+     * This portion of the struct is part of the function call abi,
+     * and belongs to the callee for spilling argument registers.
+     */
+    abi_ulong xargs[8];
 };
 
 typedef struct {
@@ -56,7 +66,7 @@ typedef struct {
 
 
 struct target_signal_frame {
-    struct sparc_stackf ss;
+    struct target_stackf ss;
     __siginfo_t         info;
     abi_ulong           fpu_save;
     uint32_t            insns[2] QEMU_ALIGNED(8);
@@ -150,10 +160,10 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
 
     for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_L0], &sf->ss.locals[i]);
+        __put_user(env->regwptr[i + WREG_L0], &sf->ss.win.locals[i]);
     }
     for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_I0], &sf->ss.ins[i]);
+        __put_user(env->regwptr[i + WREG_I0], &sf->ss.win.ins[i]);
     }
     if (err)
         goto sigsegv;
@@ -349,12 +359,6 @@ struct target_ucontext {
     target_mcontext_t tuc_mcontext;
 };
 
-/* A V9 register window */
-struct target_reg_window {
-    abi_ulong locals[8];
-    abi_ulong ins[8];
-};
-
 /* {set, get}context() needed for 64-bit SparcLinux userland. */
 void sparc64_set_context(CPUSPARCState *env)
 {
-- 
2.25.1


