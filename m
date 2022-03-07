Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2674D068C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:29:57 +0100 (CET)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI7I-0003CY-53
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuj-0001AB-Cx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:57 -0500
Received: from [2a00:1450:4864:20::62a] (port=33713
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005NV-99
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:57 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kt27so33956554ejb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUSJfkexg7KkY2CuTVEeR2bYeZuOFKrm5GHwZ7Vta6I=;
 b=FUDWAhLhf+opo/MiYM1FjXNwgxOPIiar99xq+5C903fR5rqNSCVOszMH9hhpuTsSiQ
 G+gmDYujJjzBWDQQYgi1DApjssqbkuSMWzWrc6G0rzdUtLkDDdFsjTC7Bi6BV5WNAQmP
 5QbHHSkJZeNqV2NH6tcQPV2YR6CFN+K98xqEmm7KrhlQRIYn4loM52G/W2lNtzYXGyxr
 fNv78b1c0O2sVR8sq81UVMSeGA8XeAkmKXyhEOMu4zUY46RV7/tfBw+CH7DriIOU7AQO
 S3TohEHaM+KlXQLduwT0bwp+SdhteHV1By+tLs5r6VoHs88vixij91riKDaLd22AW591
 Ej9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sUSJfkexg7KkY2CuTVEeR2bYeZuOFKrm5GHwZ7Vta6I=;
 b=xvmUDmlEdp9FwR1S9KT6Fd/jBYfdIz66SaTdK7TWgMdHHCXJ4q6jHUvuzwB1slAulZ
 ZvWV5vMAj6OVQT9WHX4jJwPqX0Td09WH00+FChi+LgPbd5zDTsR2dKgHusKtDZNRKnhq
 XFaNNTjZv8mFmJOC1625PLRxYWgeD/0OClqliLWi8kWZCVKnoJwA852hsS61o99k+pv7
 87pjD76lS+duZN0NTHZdoyX+m19Ls1hUpCsfEKKCKHwVcD2qs+wquE0xOx3v0wE1oEXN
 Rsahyp5j0BJiLJpQ/8oN4UKUt07wF/I9a0eu6Z8cNthDT3hFtrv/uVpXxO5nImT8FrRG
 OHKA==
X-Gm-Message-State: AOAM530kg+iSbl/njhw1aCG0UKTllRq0bcmWD04ibx4JXxgio4z0u8J6
 NiygyCvzWEGcOOQ+iyuSzNa+qZQWBJc=
X-Google-Smtp-Source: ABdhPJyEEHe1pfSti6X929tBQiqSzxAe41nXiiwQWW5P5HWVdAO6N1Bw4Yhx6Pc/NdvHqxJQrOb9mA==
X-Received: by 2002:a17:906:1ece:b0:6ce:e14:6d92 with SMTP id
 m14-20020a1709061ece00b006ce0e146d92mr10189677ejj.408.1646677004305; 
 Mon, 07 Mar 2022 10:16:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] target/i386: Throw a #SS when loading a non-canonical IST
Date: Mon,  7 Mar 2022 19:16:21 +0100
Message-Id: <20220307181633.596898-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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



