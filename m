Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DC4D16A7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:52:39 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYOL-0000Hg-Cr
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:52:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7m-0007sq-Hz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:32 -0500
Received: from [2a00:1450:4864:20::62f] (port=35546
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7g-0005zZ-Rl
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:28 -0500
Received: by mail-ej1-x62f.google.com with SMTP id yy13so29691627ejb.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CH0yiB2K8FkMASg2IhK2LMM1ht/mkFlBm+lEdERNCz4=;
 b=kYhBW/Sf1devOK2Sjj3CHTA0UDncwhB0HvBYoHHqVUs4dOOH+8NdQY0+IEiK6m2ZHA
 YTDLvYIjByasMOSHjX+cQNjctUFuy/Mi2ErYxMjVofkg2bHQzVSmpvYHQ8xIuEa6KfDc
 LwCSF80cSj4ccSFQypYrDOSMW+F7AhwnTh9FFEQe7wFxoakWazZUknalueMozhxNUD9W
 Fz7DSdLvvBSJJbYy3roAsNvcxnmYI1t0lz3OI2+koDvWiw8P2tbys3/QUJ7knNbUP5A9
 W0yuU0HVaV6texd6plhn3vcaE1IGpNsx3CeyWe5Mks4voY39fGxunuXhFMYaXB+iJRds
 +/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CH0yiB2K8FkMASg2IhK2LMM1ht/mkFlBm+lEdERNCz4=;
 b=fcmRl3M4NUTxsRVjTnPTWoHitYec6t/LjHlFgtv907FxItFb+MjxfB2qTodK23jYRh
 vXpyhJlVwoHAKutDTBXeftTaTQJnVvAn8JqiIkcG8QcTzfMeOycmh0V/6DcQXQQ9oPyl
 XS1Zw/1yfZkJRZndxZiEnAv4P9x8GnJbjeKr7mRQAsJ3mHgBQ6BHrH88ZOiizeQ0uK6G
 X/2wkdri2UbHHJb4+MXr9BnehsLWvxwGI7MnYqLYryZYajSRZudzquK8Xqa4djX4+DD3
 PmWSq4vgQ/10YFO+rRfPdpRdjsBbpBvSLtvErn50VoDrOUjCEI+aWDIsmoYbZPH8B4yo
 7I/g==
X-Gm-Message-State: AOAM531CpbMog0R2/E6rNOQwFUt6k1la1V0Rz43HI/gnAmDwFEObgzf9
 aUHGZNR+AOIzsaaSCqISJ1Ki6WwPqnw=
X-Google-Smtp-Source: ABdhPJwWHa0i3TpLyYUB/wYJJHvsvNylypkTPsGC2r2Ei/7dO3Qy1QE2LCgaj5vvdOKeIAh/ytFQqw==
X-Received: by 2002:a17:907:6da2:b0:6da:94a9:b7f3 with SMTP id
 sb34-20020a1709076da200b006da94a9b7f3mr13000653ejc.692.1646739306942; 
 Tue, 08 Mar 2022 03:35:06 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/22] target/i386: Throw a #SS when loading a non-canonical IST
Date: Tue,  8 Mar 2022 12:34:34 +0100
Message-Id: <20220308113445.859669-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
2.35.1



