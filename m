Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560404D99BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:56:58 +0100 (CET)
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4rJ-0000W8-Av
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:56:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU4pO-0007X2-Uj
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:55:00 -0400
Received: from [2a00:1450:4864:20::62b] (port=40790
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU4pL-0002JP-HQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:54:58 -0400
Received: by mail-ej1-x62b.google.com with SMTP id p15so40322130ejc.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9mHVQHDIm7DVjpGVzcS7cW2hw0ZLmx4Z+DStqy5tLuI=;
 b=gqeUcyQkEn4M3L/1rm7usPmSFT+/ZPexPTViOUP6ysYy/LivXD/46MHikh51vgsRms
 iYxh9i3hFiNUWl+O36tM9SiKOUQ7RQ2dfqbzw9pe2RQwT5wkDRMtPr3EG/yOI37vTQPP
 nkpnXHY7A9Ngfd4RIjjXblNNXuJh684BUhvP+iO5LrKhi0DlANF6Aq8p1y+BH/xFzeGS
 3xz9JyHlbaoZy5lrdAguQq8qncrWuZx8TbnMFs8gl9cbjzysMA4NllgH7fZnd8YJi7Th
 cCoPWIAu8VH02AfaJEXdO+xoSXyA326J7EzWGJqrRFWdCtvxkjNu8B87ypeZf/XdA677
 jMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9mHVQHDIm7DVjpGVzcS7cW2hw0ZLmx4Z+DStqy5tLuI=;
 b=KkwSMUUvDQB8HsxMqYtfN5vz6OaqwFbhN8pJj2zI7gtghM4cFtldvRGMd0GLRJuHuE
 w2vPTLfsju+PtvB3cfaQ/j9+1hFzkq8f73CTMX69zug+/03owsOeffP8IGAOwODwFsd/
 oPszbdi4dTPZqpEPj11qgVTU5lXXVsaeiUh2Bjokvye1D4YF7k0qm0AXRjta8KqGrWyq
 LIzSyCZfvfNlyKeKb1gwp+cJZ44QTswBo3bLRS0saaU04k31OLwPPgnImKiKk01z5RUT
 Bm7bupg5FQQdWgrAyAwXevJcgREzawmR1NwEYKTGYXEVnXuyeQmOCw2yz5mS96TjJLqV
 9e1w==
X-Gm-Message-State: AOAM533wZCkNjSEK6OFAPyaP8GL0MJUSmqK1I0wMuixwLfITaqbd/RgZ
 XgYFNTmiUUlklUrNxkQdj0yjY0x9mDo=
X-Google-Smtp-Source: ABdhPJwDKMaoDEl3AbLOdOagfzpxVg1hsm8FZRGxWV46B/CuO52EZ5ZO6ZpH4cSgtSck2okzAQF7Tw==
X-Received: by 2002:a17:907:da1:b0:6db:8e8e:a04 with SMTP id
 go33-20020a1709070da100b006db8e8e0a04mr18916346ejc.285.1647341694004; 
 Tue, 15 Mar 2022 03:54:54 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 qa44-20020a17090786ac00b006dbe1ca23casm1731344ejc.45.2022.03.15.03.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 03:54:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 11/22] target/i386: Throw a #SS when loading a non-canonical
 IST
Date: Tue, 15 Mar 2022 11:54:50 +0100
Message-Id: <20220315105450.1587293-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315105450.1587293-1-pbonzini@redhat.com>
References: <20220315105450.1587293-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
 target/i386/tcg/seg_helper.c         | 52 ++++++++++++++++++++++++++--
 target/i386/tcg/sysemu/excp_helper.c | 36 -------------------
 2 files changed, 50 insertions(+), 38 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index baa905a0cd..bffd82923f 100644
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
@@ -794,7 +830,9 @@ static void do_interrupt_protected(CPUX86State *env, int intno, int is_int,
 static inline target_ulong get_rsp_from_tss(CPUX86State *env, int level)
 {
     X86CPU *cpu = env_archcpu(env);
-    int index;
+    int index, pg_mode;
+    target_ulong rsp;
+    int32_t sext;
 
 #if 0
     printf("TR: base=" TARGET_FMT_lx " limit=%x\n",
@@ -808,7 +846,17 @@ static inline target_ulong get_rsp_from_tss(CPUX86State *env, int level)
     if ((index + 7) > env->tr.limit) {
         raise_exception_err(env, EXCP0A_TSS, env->tr.selector & 0xfffc);
     }
-    return cpu_ldq_kernel(env, env->tr.base + index);
+
+    rsp = cpu_ldq_kernel(env, env->tr.base + index);
+
+    /* test virtual address sign extension */
+    pg_mode = get_pg_mode(env);
+    sext = (int64_t)rsp >> (pg_mode & PG_MODE_LA57 ? 56 : 47);
+    if (sext != 0 && sext != -1) {
+        raise_exception_err(env, EXCP0C_STACK, 0);
+    }
+
+    return rsp;
 }
 
 /* 64 bit interrupt */
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 6f1fbe667b..e1b6d88683 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -22,42 +22,6 @@
 #include "exec/exec-all.h"
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

