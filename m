Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1F84DBE8D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:38:55 +0100 (CET)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiqb-0004jb-Ey
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:38:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKj-0000rc-Dw
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:57 -0400
Received: from [2607:f8b0:4864:20::1031] (port=55270
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKh-0002En-Eu
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id b8so3934008pjb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9FWwMXqC9iumPnJnO/Sltv35jl4kn2h5ImUTKmfNWoM=;
 b=c8da+3g+sjkVCOWoF6AdgpgCynvSzMPhZ0fPDERvP8XnXGvABXZvEZ39GxtqVJa0PA
 rv+kwvFBTh5SmkCVEw8TGgktSugd3wjHejia1YIjfCb3a/0vy8NRnm0CZkGcWeVyr8+j
 GsWaOMUhFPOp6B68Ka1baXVAMityG2jpC3qehQ69gdivFKN+Gzg5rC5GszHBDQueSfHl
 i6OAuNi9uUDmh0ygMpcCfmxTdm2hGAheCB+n64nZMTS4jWDALH34DVWytzo2EjUHXY2+
 giqxz3ic93UbcYSTfRguaqMBJ2T6y+ki3uLJDo0hxhbvDAVmyLMaS/Isg0DkowHNNmnY
 Oh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9FWwMXqC9iumPnJnO/Sltv35jl4kn2h5ImUTKmfNWoM=;
 b=TXeMAVJoas6834+ix4GXzrRWtlIx6JuFb7k8qa8E4vvUg4koriVvN/OHSBG2k+PGeZ
 Hm10lkkb9oNUwTb3XT5jIlbPXzgi3E2Td7vpMa4yCN3Lh4VXFzQhaThoivQnYSrQ+aGO
 OTa+dJ3MjKJYhb+J6eixa5D51zvn5M4cxbazsrIpi8hsRmg9FPNSB1wE5Xq0gUr9mMCd
 Xxd70D0+c1M6vw6tQn4rhtXgeNdpjGEktySPgQ6CcIw2FkaQlzw1yGrGq2ARgA6pQV+j
 DC8hX/MoNTnpcVNnj0NAwChHHKZeFvQvpYiJ6zn+HeS/L5Z4ARuT8D5DWyEy3DcFTJD+
 QGKg==
X-Gm-Message-State: AOAM530FUxxlUPlioAUnJxW+Bi2mrvO/L5IwOVly2N0y6QtTpGEvTfzq
 DG3qeWP63qn+yM2RROjbQXYJYi4qpNw5dA==
X-Google-Smtp-Source: ABdhPJwYMxwnID6uiq1TdhlOI9IZhNvLXOM6MlkY9wznKOHrCC8sh1hiS0OLsaXtL9WNIctSIvMAIg==
X-Received: by 2002:a17:902:b941:b0:14d:af72:3f23 with SMTP id
 h1-20020a170902b94100b0014daf723f23mr3071627pls.6.1647493554114; 
 Wed, 16 Mar 2022 22:05:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 14/51] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
Date: Wed, 16 Mar 2022 22:05:01 -0700
Message-Id: <20220317050538.924111-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
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
index ecf8cc929f..963cdec161 100644
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
index 90f918524e..54458a5447 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -64,8 +64,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_IH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->regs[R_EA] = env->pc + 4;
         env->pc = cpu->exception_addr;
@@ -83,8 +84,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->ctrl[CR_STATUS] |= CR_STATUS_EH;
             env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                                 CR_EXCEPTION, CAUSE,
+                                                 cs->exception_index);
 
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
@@ -98,8 +100,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->ctrl[CR_STATUS] |= CR_STATUS_EH;
             env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                                 CR_EXCEPTION, CAUSE,
+                                                 cs->exception_index);
 
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
 
@@ -116,8 +119,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
@@ -140,8 +144,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -158,8 +163,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -183,8 +189,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -228,7 +235,7 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = EXCP_UNALIGN << 2;
+    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
     helper_raise_exception(env, EXCP_UNALIGN);
 }
 
-- 
2.25.1


