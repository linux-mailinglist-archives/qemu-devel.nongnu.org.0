Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA864CAD68
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:22:07 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTby-000848-5f
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS9-0006xT-2N
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:57 -0500
Received: from [2a00:1450:4864:20::434] (port=45943
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS7-0008Rf-E7
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:56 -0500
Received: by mail-wr1-x434.google.com with SMTP id p9so4046852wra.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUSJfkexg7KkY2CuTVEeR2bYeZuOFKrm5GHwZ7Vta6I=;
 b=aKf5xYeNP4IKbk5KGDSAMCkJAcibSKKkln6lB760tifb3ZohGtzJ8RepwE/zovR+tg
 x+SN4V+uIizAVXeQCY4Qm+P1WU+CnfU86vdU7FlVyfM8uMAXYD4cZoddFh7x6vKuJakn
 hrEfSBVrNIwYOyhWlPRfcR/kueAudwtkpKgVoJ6EbhB09P6Hh2YtxwGE18TlVfh8VG1Q
 g/DJG5HyiMGoR3jHEVEhBUj4iERKAjuFDPUNKWrYaF/J1Vj850G4LGc6kGxFb1/9uVHv
 gATbaeTnHJkBsAODPh2a0M7vdbGr+iKb1G3uiDb+IbXxNJGClwSqiTXltBDIOsT0/yXm
 AvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sUSJfkexg7KkY2CuTVEeR2bYeZuOFKrm5GHwZ7Vta6I=;
 b=IFF06tcA2Qjfq0d6RpULuVqmhdTWzgf5bBmi/HdImzxpKuj8oj8Tk7cdmu4WI5/dHt
 Vdsi8+SMjpUHNV2d9N9GaYoy5JqD0BMrZQW5TW5xHJKlQJwz58PnFKBvXYGaPZFxGRU6
 Ji3ftOWq/hsm5w1dA0qIvFe1aWYEaTW3UfCAaNQiPhN5sXB4slNGeYmNB6jjD2Z7vaKf
 XqFlAHlsrNkH9IkPntFFf2FPIlpYLuRXuokW/vF1ZAt0vyRmqduwjMI5Lr6cN+PhnJ5W
 HAjb0CPkg0rYEvrC8JINxaVhH7haTIcXMOVJXk/ra7tYBBz/f/W0flDW5X38kUEpHt04
 uN7Q==
X-Gm-Message-State: AOAM5318ijenV+Gjkg5Zbl0KJZS7W5aL6dLWJocquDykxH+dpZgVCbiG
 JLiwasmt2DomAxjG+N0TZotOwYC5UQ4=
X-Google-Smtp-Source: ABdhPJyXtDAtPvinovTNM6oiJjgSVaw68JEmxGTXD2yLyZd+8OenJmdTsy8FJZiTRLYgSRdAEbkv9A==
X-Received: by 2002:adf:bc09:0:b0:1f0:2483:48b with SMTP id
 s9-20020adfbc09000000b001f02483048bmr4361098wrg.118.1646244714015; 
 Wed, 02 Mar 2022 10:11:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] target/i386: Throw a #SS when loading a non-canonical IST
Date: Wed,  2 Mar 2022 19:11:34 +0100
Message-Id: <20220302181134.285107-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Gareth Webb <gareth.webb@umbralsoftware.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gareth Webb <gareth.webb@umbralsoftware.co.uk>

Loading a non-canonical address into rsp when handling an interrupt or
performing a far call should raise a #SS not a #GP.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/870
Signed-off-by: Gareth Webb <gareth.webb@umbralsoftware.co.uk>
Message-Id: <164529651121.25406.15337137068584246397-0@git.sr.ht>
[Move get_pg_mode to seg_helper.c for user-mode emulators. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/seg_helper.c         | 49 +++++++++++++++++++++++++++-
 target/i386/tcg/sysemu/excp_helper.c | 36 --------------------
 2 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index baa905a0cd..4cf1f973cf 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -28,6 +28,42 @@
 #include "helper-tcg.h"
 #include "seg_helper.h"
 
+int get_pg_mode(CPUX86State *env)
+{
+    int pg_mode = 0;
+    if (!(env->cr[0] & CR0_PG_MASK)) {
+        return 0;
+    }
+    if (env->cr[0] & CR0_WP_MASK) {
+        pg_mode |= PG_MODE_WP;
+    }
+    if (env->cr[4] & CR4_PAE_MASK) {
+        pg_mode |= PG_MODE_PAE;
+        if (env->efer & MSR_EFER_NXE) {
+            pg_mode |= PG_MODE_NXE;
+        }
+    }
+    if (env->cr[4] & CR4_PSE_MASK) {
+        pg_mode |= PG_MODE_PSE;
+    }
+    if (env->cr[4] & CR4_SMEP_MASK) {
+        pg_mode |= PG_MODE_SMEP;
+    }
+    if (env->hflags & HF_LMA_MASK) {
+        pg_mode |= PG_MODE_LMA;
+        if (env->cr[4] & CR4_PKE_MASK) {
+            pg_mode |= PG_MODE_PKE;
+        }
+        if (env->cr[4] & CR4_PKS_MASK) {
+            pg_mode |= PG_MODE_PKS;
+        }
+        if (env->cr[4] & CR4_LA57_MASK) {
+            pg_mode |= PG_MODE_LA57;
+        }
+    }
+    return pg_mode;
+}
+
 /* return non zero if error */
 static inline int load_segment_ra(CPUX86State *env, uint32_t *e1_ptr,
                                uint32_t *e2_ptr, int selector,
@@ -795,6 +831,8 @@ static inline target_ulong get_rsp_from_tss(CPUX86State *env, int level)
 {
     X86CPU *cpu = env_archcpu(env);
     int index;
+    target_ulong rsp;
+    int32_t sext;
 
 #if 0
     printf("TR: base=" TARGET_FMT_lx " limit=%x\n",
@@ -808,7 +846,16 @@ static inline target_ulong get_rsp_from_tss(CPUX86State *env, int level)
     if ((index + 7) > env->tr.limit) {
         raise_exception_err(env, EXCP0A_TSS, env->tr.selector & 0xfffc);
     }
-    return cpu_ldq_kernel(env, env->tr.base + index);
+
+    rsp = cpu_ldq_kernel(env, env->tr.base + index);
+
+    /* test virtual address sign extension */
+    sext = rsp >> (get_pg_mode(env) & PG_MODE_LA57 ? 56 : 47);
+    if (sext != 0 && sext != -1) {
+        raise_exception_err(env, EXCP0C_STACK, 0);
+    }
+
+    return rsp;
 }
 
 /* 64 bit interrupt */
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 0410170d64..db4c266c86 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -21,42 +21,6 @@
 #include "cpu.h"
 #include "tcg/helper-tcg.h"
 
-int get_pg_mode(CPUX86State *env)
-{
-    int pg_mode = 0;
-    if (!(env->cr[0] & CR0_PG_MASK)) {
-        return 0;
-    }
-    if (env->cr[0] & CR0_WP_MASK) {
-        pg_mode |= PG_MODE_WP;
-    }
-    if (env->cr[4] & CR4_PAE_MASK) {
-        pg_mode |= PG_MODE_PAE;
-        if (env->efer & MSR_EFER_NXE) {
-            pg_mode |= PG_MODE_NXE;
-        }
-    }
-    if (env->cr[4] & CR4_PSE_MASK) {
-        pg_mode |= PG_MODE_PSE;
-    }
-    if (env->cr[4] & CR4_SMEP_MASK) {
-        pg_mode |= PG_MODE_SMEP;
-    }
-    if (env->hflags & HF_LMA_MASK) {
-        pg_mode |= PG_MODE_LMA;
-        if (env->cr[4] & CR4_PKE_MASK) {
-            pg_mode |= PG_MODE_PKE;
-        }
-        if (env->cr[4] & CR4_PKS_MASK) {
-            pg_mode |= PG_MODE_PKS;
-        }
-        if (env->cr[4] & CR4_LA57_MASK) {
-            pg_mode |= PG_MODE_LA57;
-        }
-    }
-    return pg_mode;
-}
-
 #define PG_ERROR_OK (-1)
 
 typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-- 
2.34.1


