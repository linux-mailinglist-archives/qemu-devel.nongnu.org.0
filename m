Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860245683BD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:42:17 +0200 (CEST)
Received: from localhost ([::1]:40180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Y0-0003Sh-KT
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90ML-00073P-NJ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:10 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90ME-0000pQ-Qv
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:09 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w185so10020699pfb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
 b=fS6aY3aRde/oNzQqsP1SjVfUfZNJdYvMtfnR8i4iVRBNLOPd3nE9FB/CSLXPxcYUIw
 DkXUXHQEoCGYzuvyEJ9CNwIJMzIrvI02CTh9MkXPjMDaqBPWODm+aWbhILfJdDdjOWti
 /uCJSRER+e76YQPLR4UvbRBvff/oEwfhlqkWXZwdG8yX+XkSciOwvSm/Ovg3NUJTFmR3
 9c0Dc4s23a49GsJECbAwEbFIXO7+IPMXNBQ8N3MwN5ezohB9pggarRWyXK8RNizdaKcL
 z4lVlP+FDjD48BQsDCX76nmN4QyMs56Gm7JdurzWzXwSvvnKXDtK9ZWpNqfBQZ9HXO93
 5zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=suiCkAICShG42hE+LmFGlXABJkWbjcp+Qv1m7n85pMU=;
 b=s9RgSXZVSgpvQ6tVuZ7UCVI8lsf5Q8td5HJXESGLwj4UB7Bem3Neo19K2UoQltpbT2
 jRrqxlqZSJuaGFcwSrYln3i+yVFZlGEua9uLrIyhmQ7fRFJfzEpalROOyNhpQPYVitiv
 y/2iGTh/bIX+G8JDl0CUJ1nasenrqksD5KcUv5gn6RJuRDr9E+9JQEcAVr/dtZOJFKtT
 1imstanVNb8YZTdNcmNAGv4gyUiKxajGrKpUOAeJ7cF3X2/dzNCiyi6EW2v8qOTwNfNt
 iDeCOE0FAoR+ZDd1puwdOzYHPfq5oAkJXFwlpVqApBpE3LEb2CaNffEtDkDUutz9bvJf
 uRCA==
X-Gm-Message-State: AJIora9eJKiSBV+pMbvjaGjmcwwGi9FdY7dbZTUHowuIQTwWwD+0P6Gd
 bKZcPl3x5l5tpQRs9QCNZ7KUQMb4KihPe7bN
X-Google-Smtp-Source: AGRyM1uyZuRMtZvCywL8UOZA/2RKgxfNKHrfPq1EaNO9k4DR3BI0yP67o3cbFSxIE0F25ylJ/1vWLw==
X-Received: by 2002:a05:6a00:2395:b0:525:8980:5dc7 with SMTP id
 f21-20020a056a00239500b0052589805dc7mr46939596pfc.8.1657095961422; 
 Wed, 06 Jul 2022 01:26:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 39/45] linux-user/aarch64: Move sve record checks into
 restore
Date: Wed,  6 Jul 2022 13:54:05 +0530
Message-Id: <20220706082411.1664825-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Move the checks out of the parsing loop and into the
restore function.  This more closely mirrors the code
structure in the kernel, and is slightly clearer.

Reject rather than silently skip incorrect VL and SVE record sizes,
bringing our checks in to line with those the kernel does.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 9ff79da4be..22d0b8b4ec 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -250,12 +250,36 @@ static void target_restore_fpsimd_record(CPUARMState *env,
     }
 }
 
-static void target_restore_sve_record(CPUARMState *env,
-                                      struct target_sve_context *sve, int vq)
+static bool target_restore_sve_record(CPUARMState *env,
+                                      struct target_sve_context *sve,
+                                      int size)
 {
-    int i, j;
+    int i, j, vl, vq;
 
-    /* Note that SVE regs are stored as a byte stream, with each byte element
+    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &sve->vl);
+    vq = sve_vq(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.SM. */
+    if (size <= sizeof(*sve)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_SVE_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    /*
+     * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
      * of our 64-bit hunks.
      */
@@ -277,6 +301,7 @@ static void target_restore_sve_record(CPUARMState *env,
             }
         }
     }
+    return true;
 }
 
 static int target_restore_sigframe(CPUARMState *env,
@@ -287,7 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    int vq = 0, sve_size = 0;
+    int sve_size = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -321,15 +346,9 @@ static int target_restore_sigframe(CPUARMState *env,
             if (sve || size < sizeof(struct target_sve_context)) {
                 goto err;
             }
-            if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = sve_vq(env);
-                sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (size == sve_size) {
-                    sve = (struct target_sve_context *)ctx;
-                    break;
-                }
-            }
-            goto err;
+            sve = (struct target_sve_context *)ctx;
+            sve_size = size;
+            break;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
@@ -362,8 +381,8 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve) {
-        target_restore_sve_record(env, sve, vq);
+    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+        goto err;
     }
     unlock_user(extra, extra_datap, 0);
     return 0;
-- 
2.34.1


