Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4448CFD5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 01:57:42 +0100 (CET)
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7oQv-0002Nh-K6
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 19:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMw-0008V0-LV
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:34 -0500
Received: from [2a00:1450:4864:20::130] (port=41929
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMt-0000Wu-9s
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:33 -0500
Received: by mail-lf1-x130.google.com with SMTP id x7so14033212lfu.8
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 16:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDjRtlfdJm8ybSCVHOvFOaC8nUHRGEycooXc8kxeUnM=;
 b=jqgW4AG58oOCZ77L3Enr5YrHnhr2hg/kGub7L+zUNoBBbFT4JgXGHCxckNGGt/rxCZ
 3gnJNVyb2bqbfDyUpSvUtRYHoELK7wEKLGPHJuwDVIJyWVD/nIYlPgHFlc00bu9NN2ry
 wAfw3m+RycYWthxIS8bi3fECZkQedyX0PnemMhiI53NOtBRXo802u/wX5NHNOs+yrIXq
 98eXBPVVv7toIYtDBVpD2M4hW+R5xxkAVydJs7m1+DtAjHGjsTNR5IVQ0tjIs1i+eVVY
 mqIxrtJT/ZL26FCbP6JgOGUb/aJN85DIpvVeaG54L7mMlbl69iTFUwJTnXC3aABLjbgj
 fGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDjRtlfdJm8ybSCVHOvFOaC8nUHRGEycooXc8kxeUnM=;
 b=f5Ll0v13uMp8aesP1RAcXIFvaNRHSkPUuJmKGEmYLztgqVFTraJ+IsnrOw26e6FleM
 QZHyBVK+11bn3l/ox3GQaP4ljlAbeVjpuB2A1gCnL97qKZ0NxnaHnoZyT3S4zWxTiAyx
 D/jC8r6lSZzm+NPyFuK2b6E5eXCuZL0Vi5RrS5yGUvLqXY3iYBsQw8HuFfVaCM9PgAcw
 5jn+oUshHm9Op1onLIWMyjfecrNc2MM3M9QaPgpyIe/pjRW+lGxLC3y9h0CbSefRMwea
 jk+GCRmpI8goo6tclNAbH3O49jYKPl4SiQT1X7KMfejMH3iV0E/xBbG9BnjCL9/0t+W1
 OfjA==
X-Gm-Message-State: AOAM531phU/o6vf1GvJl02G1O1Iv5Oq6+RkPmncpwSRxRQRXgzjhu58/
 6mgq996KRqQRzuo0ngQlV3J8AQ==
X-Google-Smtp-Source: ABdhPJwxV6ZRNF2vX+4pqQiVtk9MUWl/bSdssaCmhmQw55rUIABR0f8j1PgxhXcNhP0fL4+2QNxMaw==
X-Received: by 2002:a05:6512:2506:: with SMTP id
 be6mr1675952lfb.113.1642035208938; 
 Wed, 12 Jan 2022 16:53:28 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id d2sm107688ljj.118.2022.01.12.16.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 16:53:28 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] include/qemu: rename Windows context definitions to
 expose bitness
Date: Thu, 13 Jan 2022 03:52:45 +0300
Message-Id: <20220113005248.172522-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
References: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Context structure in 64-bit Windows differs from 32-bit one and it
should be reflected in its name.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 contrib/elf2dmp/main.c       |  6 +++---
 dump/win_dump.c              | 14 +++++++-------
 include/qemu/win_dump_defs.h |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 20b477d582..b9fc6d230c 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -141,10 +141,10 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb,
     return kdbg;
 }
 
-static void win_context_init_from_qemu_cpu_state(WinContext *ctx,
+static void win_context_init_from_qemu_cpu_state(WinContext64 *ctx,
         QEMUCPUState *s)
 {
-    WinContext win_ctx = (WinContext){
+    WinContext64 win_ctx = (WinContext64){
         .ContextFlags = WIN_CTX_X64 | WIN_CTX_INT | WIN_CTX_SEG | WIN_CTX_CTL,
         .MxCsr = INITIAL_MXCSR,
 
@@ -302,7 +302,7 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
     for (i = 0; i < qe->state_nr; i++) {
         uint64_t Prcb;
         uint64_t Context;
-        WinContext ctx;
+        WinContext64 ctx;
         QEMUCPUState *s = qe->state[i];
 
         if (va_space_rw(vs, kdbg->KiProcessorBlock + sizeof(Prcb) * i,
diff --git a/dump/win_dump.c b/dump/win_dump.c
index c5eb5a9aac..29b6e4f670 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -189,7 +189,7 @@ try_again:
 }
 
 struct saved_context {
-    WinContext ctx;
+    WinContext64 ctx;
     uint64_t addr;
 };
 
@@ -221,7 +221,7 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         CPUX86State *env = &x86_cpu->env;
         uint64_t Prcb;
         uint64_t Context;
-        WinContext ctx;
+        WinContext64 ctx;
 
         if (cpu_memory_rw_debug(first_cpu,
                 KiProcessorBlock + i * sizeof(uint64_t),
@@ -241,8 +241,8 @@ static void patch_and_save_context(WinDumpHeader64 *h,
 
         saved_ctx[i].addr = Context;
 
-        ctx = (WinContext){
-            .ContextFlags = WIN_CTX_ALL,
+        ctx = (WinContext64){
+            .ContextFlags = WIN_CTX64_ALL,
             .MxCsr = env->mxcsr,
 
             .SegEs = env->segs[0].selector,
@@ -284,13 +284,13 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         };
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 0)) {
+                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 0)) {
             error_setg(errp, "win-dump: failed to save CPU #%d context", i);
             return;
         }
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&ctx, sizeof(WinContext), 1)) {
+                (uint8_t *)&ctx, sizeof(WinContext64), 1)) {
             error_setg(errp, "win-dump: failed to write CPU #%d context", i);
             return;
         }
@@ -306,7 +306,7 @@ static void restore_context(WinDumpHeader64 *h,
 
     for (i = 0; i < h->NumberProcessors; i++) {
         if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 1)) {
+                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 1)) {
             warn_report("win-dump: failed to restore CPU #%d context", i);
         }
     }
diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
index 145096e8ee..5a5e5a5e09 100644
--- a/include/qemu/win_dump_defs.h
+++ b/include/qemu/win_dump_defs.h
@@ -97,8 +97,8 @@ typedef struct WinDumpHeader64 {
 #define WIN_CTX_FP  0x00000008L
 #define WIN_CTX_DBG 0x00000010L
 
-#define WIN_CTX_FULL    (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
-#define WIN_CTX_ALL     (WIN_CTX_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
+#define WIN_CTX64_FULL  (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
+#define WIN_CTX64_ALL   (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
 
 #define LIVE_SYSTEM_DUMP    0x00000161
 
@@ -107,7 +107,7 @@ typedef struct WinM128A {
     int64_t high;
 } QEMU_ALIGNED(16) WinM128A;
 
-typedef struct WinContext {
+typedef struct WinContext64 {
     uint64_t PHome[6];
 
     uint32_t ContextFlags;
@@ -174,6 +174,6 @@ typedef struct WinContext {
     uint64_t LastBranchFromRip;
     uint64_t LastExceptionToRip;
     uint64_t LastExceptionFromRip;
-} QEMU_ALIGNED(16) WinContext;
+} QEMU_ALIGNED(16) WinContext64;
 
 #endif /* QEMU_WIN_DUMP_DEFS_H */
-- 
2.31.1


