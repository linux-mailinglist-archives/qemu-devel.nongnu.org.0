Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA78F5FAB3C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:37:47 +0200 (CEST)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi65S-00074G-PN
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o2-0002Z7-1D
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:46 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o0-00031J-7M
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so11947022pjo.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwIpTgEdJC+Uxc/pi8uZBNwBm2FWqdghmj+rTinUKMk=;
 b=Ufn3j/f14om1Tnf6mfy9yUPRVnn8vjia70YuhYrQiE4CkDYyhZoadYOe9XkDbm+u5F
 I6VhbZZrKod+zd0ecfHGkA8O3hKYumuxdQJKqgMrgs5u6CPQBJyn5VIjuppm7gBpTxER
 YtFh3Zc04Bkz5EGgVIAlOMQnzU4ef4/JD7aoo7RFGAKLZ2DWXv+Jz1jeQAJJizYdAhqb
 UuFwP8yugYofzoHDRXaDqvzgwgFphA6mjA6HQrB0l/QLItUXTuMJEBdqmWdKjtgGxE3F
 CG5ysHRUi+VgA3m2qAA3JW85/NZKRx9nOFgru50qN255Atvj9X//Uq3P6upaJ5PqAgNx
 nwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwIpTgEdJC+Uxc/pi8uZBNwBm2FWqdghmj+rTinUKMk=;
 b=cRO0A6gGySjBaPPJuSl3kIlEyxbihV8GigLJ9bGPQBaqbxxc0VFkUzmOmxVyrosdgz
 RwtdqkNXUOjhy+AoozLJRv7Jl++6lYO2ahMAmwTImWKwt+a4ksS201bmv8SY+au3RthV
 ChR2um6o3kfU9asprT8DJUS+XBaUzljZ3CJRNP/tXWI+jA0vI7Bu3BVrADtgGraPQXv1
 wnCsA0txl/33llU5ARvXJWMUrN12X0Sn/jo/AuqEZd/gA5No3lrzOB/VDPLQmseDmjq1
 Oe5bArvcy/ImaEjQkbLMDkUzxUse+DAfzeAhpBXiADeH2GtW1za2IlhohleNv7zEiIXG
 PxBw==
X-Gm-Message-State: ACrzQf35K6kxOjEpo+lO5DO10n9KIiM7yxmPSUCGqphqB1C5C1rpE8uH
 97X/o/h1/C8ph/1/V96cIUmPUKjI59Bh5A==
X-Google-Smtp-Source: AMsMyM6GnsWGLF+b2unTt/PGZmQ9UyuzfW6MccpNvpD706EPcOX8fkAonMHGc7lzWN5UJoSmoYcY/w==
X-Received: by 2002:a17:902:f541:b0:181:83e4:4910 with SMTP id
 h1-20020a170902f54100b0018183e44910mr12923949plf.109.1665458383259; 
 Mon, 10 Oct 2022 20:19:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 16/24] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Mon, 10 Oct 2022 20:19:03 -0700
Message-Id: <20221011031911.2408754-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b2bfcfde9a..d54e6ca938 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -320,18 +320,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     uint32_t data;
 
-    if (!S1_ptw_translate(env, ptw, addr, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
     if (likely(ptw->out_host)) {
         /* Page tables are in RAM, and we have the host address. */
         if (ptw->out_be) {
@@ -359,18 +353,12 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     uint64_t data;
 
-    if (!S1_ptw_translate(env, ptw, addr, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
     if (likely(ptw->out_host)) {
         /* Page tables are in RAM, and we have the host address. */
         if (ptw->out_be) {
@@ -527,7 +515,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, ptw, table, fi);
+    if (!S1_ptw_translate(env, ptw, table, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, ptw, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -565,7 +556,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, ptw, table, fi);
+        if (!S1_ptw_translate(env, ptw, table, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -650,7 +644,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, ptw, table, fi);
+    if (!S1_ptw_translate(env, ptw, table, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, ptw, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -703,7 +700,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, ptw, table, fi);
+        if (!S1_ptw_translate(env, ptw, table, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1286,7 +1286,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             ptw->in_ptw_idx &= ~1;
             ptw->in_secure = false;
         }
-        descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
+        if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1


