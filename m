Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C61B50A487
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:43:17 +0200 (CEST)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYxg-0004s6-Gv
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZX-0007ce-Vn
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:20 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZW-0006Jf-6y
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:19 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t13so4900275pgn.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bhC4Xmof1vsFelhZ+DCnUiXEWmyCQUvp+ucYa47m4g=;
 b=eFpYsMnskBwdT84fYFbqsSbmaEqUAALriruWCzThVyPqBxRnxwDFEsKzJo2HG1Q3K2
 v0uHu7Q7XAeXDxMFK2bUuTig+bEbb/hmGAo7rLh6NUCHqwoxZEXD1eQrclhAwQlcoj+Q
 /f4i4GXppuiUKV1M5RBXiutn7ouK5lHMppP+cyCkdlTVqy9xjuJOguYv1FmXilnUsdYj
 QpFn6/oSOIUAt7rrkbEU7Ex1usTfpBOZlv88kDIhKL9K7fKK7mLas9WzoDnLuPfliVLZ
 C2hgNjzptifhOclBAdB0n0Ri1Vcu/hybr+/55VBJokv/Rdjyl6MDaQn6qDSEe0MDGHNi
 twyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bhC4Xmof1vsFelhZ+DCnUiXEWmyCQUvp+ucYa47m4g=;
 b=OnNfSMHYSsfYwZkQEKRgPCOLWhXG6IsOO+sONbDie19STrluW3TCLch48ZsUzgdL9q
 x4T+luP9D0u/Bo7CrHNo6mAI0YbPjlPTzWKmavYnrxGKxtpah17SGBD/7L8KQK9Dgv5s
 HqzP/nCVGxogAv7AgzruPEoI8zNrPwueh6Z7ZGzCX48Le1q8wojeqBMNPg2EVAHRSCKL
 T8+No1+D7R+fG7JxW49s4ikCqnY4f0yNF8/5E3KHq28a23jUmGWAtejJvxaJ9sOljKuk
 Noh7mFqVcvx2xaF3kbSUVwEzRnsFQSrphxPipyUdOE6y2BAskPqluZbvRYWo7tz4O47m
 FFpQ==
X-Gm-Message-State: AOAM530WoZaLW6ibd2sGlq9ZU8EzWOkDv52uCsoPXakWxtHZC4qY3yu2
 tao+DAlzHg6pA3g0r/+4S3lwY9GtQE1tKQ==
X-Google-Smtp-Source: ABdhPJwVVToAji+lYMV+x9/I68gtleUk4YSJvmJAW9kJv6wgEagNuI5xPpBsTG75azeI6JTSSyfu/w==
X-Received: by 2002:a63:ef06:0:b0:39d:7613:7d38 with SMTP id
 u6-20020a63ef06000000b0039d76137d38mr24116352pgh.284.1650554296906; 
 Thu, 21 Apr 2022 08:18:16 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 25/64] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
Date: Thu, 21 Apr 2022 08:16:56 -0700
Message-Id: <20220421151735.31996-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Use FIELD_DP32 instead of manual shifting and masking.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    |  4 ++++
 target/nios2/helper.c | 37 ++++++++++++++++++++++---------------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 44fc681c58..114b494294 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -105,6 +105,10 @@ FIELD(CR_STATUS, RSIE, 23, 1)
 #define CR_CPUID         5
 #define CR_CTL6          6
 #define CR_EXCEPTION     7
+
+FIELD(CR_EXCEPTION, CAUSE, 2, 5)
+FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
+
 #define CR_PTEADDR       8
 #define   CR_PTEADDR_PTBASE_SHIFT 22
 #define   CR_PTEADDR_PTBASE_MASK  (0x3FF << CR_PTEADDR_PTBASE_SHIFT)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 2e5f5b8b54..b30740824c 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -44,8 +44,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_IH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->regs[R_EA] = env->pc + 4;
         env->pc = cpu->exception_addr;
@@ -63,8 +64,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->ctrl[CR_STATUS] |= CR_STATUS_EH;
             env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                                 CR_EXCEPTION, CAUSE,
+                                                 cs->exception_index);
 
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
@@ -78,8 +80,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->ctrl[CR_STATUS] |= CR_STATUS_EH;
             env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                                 CR_EXCEPTION, CAUSE,
+                                                 cs->exception_index);
 
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
 
@@ -96,8 +99,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
@@ -120,8 +124,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -138,8 +143,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -163,8 +169,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -208,7 +215,7 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = EXCP_UNALIGN << 2;
+    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
     helper_raise_exception(env, EXCP_UNALIGN);
 }
 
-- 
2.34.1


