Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FB4D4648
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:50:21 +0100 (CET)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHJE-000343-Bp
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:50:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxN-0005Mt-9u
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:45 -0500
Received: from [2607:f8b0:4864:20::102a] (port=37402
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxL-0007xG-DO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:44 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 lj8-20020a17090b344800b001bfaa46bca3so4845809pjb.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8buwJrjtMj1NFA6rdKhvKicQJO4j8m6F/Eaj8v2A0XQ=;
 b=rpeX2oFdmtOBiqvjxZnpGTTd+MUcOTawUQr2eSvq47qEy3yJlu5klzqVEO4eMSd5e1
 uLw8Vb7chgDYw720chxwBgBM9r12CqT6a8EHnqx8xpe5YjFdqpQrosM53mpbErKC3V6I
 /Ol/zZb4dytC4ap7ssx8jRIX9PpFjNHZtWt6LfrChRh+W2KSLuI9zKRPq4gv4xRTqAws
 DGLhlts9pfB/FrRxJ78aqcI6MqAjceyiV8iVJJRZ+b9Y/PvrkBZUce7Lqs4l6NVOL981
 3kwOs4exPQffmvgC1YYpzTWVafTjxcX0G43GrrUhA27rnzWhvmvrV6Batw/l7/kkBP57
 24tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8buwJrjtMj1NFA6rdKhvKicQJO4j8m6F/Eaj8v2A0XQ=;
 b=guXNtGAmMUg6qI50sEkLx1ewsb9EjRYAN6C2MVR8I8v/aYpPPXZI2PN+iC9tb+Xs5z
 c3Q6rKIXe9Ba7zoQK+l0EWhZEUZ9JbHzsIEuJbYKY8f9nrg6+ZViJ1orP3jB1Dtg2Qut
 WIkCKSkuf/onF9g9dl4VJsBZThzq+lAPOsQyz/usJTEDHh9G/x1437CbLCaTSkfDzvw8
 PoYsZL4qtloRQp0xBhGdWPo2DDt6q4BgtN4URy4QYz0aIv6sJP/ZmTBKUZDiaguUSkWW
 BmG0WT0I10aLl/Zgf5b10l0+c5vD/HemB7EHO/ZARtaJDebFUNaNItfVvLYkxHvRo8Z0
 VsDA==
X-Gm-Message-State: AOAM531ThWEdOsUoFRnyvpYjg6p9oOntWnHVJ0ix5IIxjL4j6z8Sadth
 E/yyZOWv+p2Vk1mrNW/E3k2ZB9DViuN01Q==
X-Google-Smtp-Source: ABdhPJyXOsfZ/81c5ZZOy3lF3MTSmTZgd9E7wrNApjIgAyZqClly7JN6vQHid+quyZS0EUo+GjFfvw==
X-Received: by 2002:a17:902:cec7:b0:151:bb1b:5c9d with SMTP id
 d7-20020a170902cec700b00151bb1b5c9dmr4535242plg.41.1646911662081; 
 Thu, 10 Mar 2022 03:27:42 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/48] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
Date: Thu, 10 Mar 2022 03:26:51 -0800
Message-Id: <20220310112725.570053-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Use FIELD_DP32 instead of manual shifting and masking.

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


