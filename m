Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577B609A37
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:07:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompso-0007Pc-3H; Mon, 24 Oct 2022 01:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompro-0006aj-R3
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprl-0002La-8V
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id m2so3321783pjr.3
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
 b=IfYYdXX5BP6H2RKB06MWo2FGklxdm07IL/N5UXRPwLBGTAEP0hqm7919yy3GVGqKjd
 uaD75kv6DQqxgbZf5VyT0kdfFeTX2Cw4eOAkIIg9ITJdmArWCGyKJcTqEsH6R69cslJy
 oruTjvQQqUYgs0jrjaXKqb5smIVyxVJwENHfbH8Q7sUgbu2CgUGIXLJbA4gErK1KHQH8
 tcxw6VuFgGhQuYc69C//SKX4J9c/07HSugvm/2EVoVAZmRfEQTOAjKPBYWlWnyNrEKw3
 AYPSnVcrBCBI1F03zgDwWtz7ZqBnlmB0lzLFLnRN4GPSuYZ86Q5tcAqu9b6HFA06VtdS
 yIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
 b=Q9u/CTbpsuyt+vL/yIxrL5pNR478Gk+hKHZIa5AENgq+5hU80mnwf7hSfVzlMs51K3
 dSNmPqnC2cbCUUVsCEmrGpOEq4xED6GZ10V0OiBbcYelPZrGYuoDwdZ2awOU6PsVJTmB
 h4Ku79CS8PsTX/4sN2yuGfYhqSSwWqQUViLPw1KEmIxn1L98Oezw0BZTVV1vw+mGEqb7
 rTVAfmSSmapAuliIF88+ocsBWJeXcP9NUhtZUe5JRVlfY13OMzxYL0xtiJoSohMfJnD7
 NcXp6cW1qoWS0vUE8l3m+JEORZmRKfcDZNqQvqPsDVabCzK7gDv+VHZEX1PGTtNuW7p4
 kojg==
X-Gm-Message-State: ACrzQf2YmDessKD80gzXToAZLF6BxAhK/h8u92m6heqaTXllFB1Nq+Zc
 cpGBj2Gj3NKb+PELry/rWOMl5da62cwddWOB
X-Google-Smtp-Source: AMsMyM7pvFvFpRNMM5cnT2xW2vSFpIYMp9+eKhf6DDzFizDr2DkJwjDGQrk5fx8S3ombY4NeG3gXEw==
X-Received: by 2002:a17:903:283:b0:186:8a20:c1b6 with SMTP id
 j3-20020a170903028300b001868a20c1b6mr10784768plr.119.1666588751667; 
 Sun, 23 Oct 2022 22:19:11 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 05/14] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Mon, 24 Oct 2022 15:18:42 +1000
Message-Id: <20221024051851.3074715-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 161b7922e3..36524b35ef 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -319,18 +319,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
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
@@ -358,18 +352,12 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
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
@@ -526,7 +514,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
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
@@ -564,7 +555,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
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
@@ -649,7 +643,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
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
@@ -702,7 +699,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
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
@@ -1291,7 +1291,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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


