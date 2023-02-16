Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C0698C5D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7o-0003yY-3K; Thu, 16 Feb 2023 00:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7l-0003uo-SM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:05 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7k-0005P2-7K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 pg6-20020a17090b1e0600b002349579949aso686879pjb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lc1shs6HgaujiRT2ti/1E0puXb58K6tNRWGGe1EnPI=;
 b=UGDWOFJAvpVw65wrhMoagDlBEby2vJE0j/BqJHLcemxjN4sQuAU5olrhRBWWtIatPh
 I8aI8hOC2MIJtuB01iwQgSjXOXwPWPoFMIiLlaqmQZgElOOh3L0zyrd94uGuzuKM2ziD
 4RjU1JT8yt1o6tieRPUNKD/B3tikQoBSEgA61zseVq7U08GD35z05Zj4ucxhU5fw8Hzt
 Eg8Nxe4FUxBXXDgVa/4gSLG+m+ZhNQXz/fKpmoPAbMyMxHEAwZXhhBbyYNgHObru02cr
 hm0LkatvzgfG1fWf4/4ziRPyg2ZSwvLH1mQlHwzHJLvWtaoVv//cdngXGCTtTCkgfGVX
 qUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5lc1shs6HgaujiRT2ti/1E0puXb58K6tNRWGGe1EnPI=;
 b=HBLVImT+qJRm6dHlMjyp+dnw0F4AdFwPJZcZgEErivvRdRQsjQKXdb8g/0qj7M6g0i
 ygCzkp7fVCkfWfK79t/UU87N62I0CC2ZN1LB9/bLDR26UcReitXhsu+ePKgJoNr2i1n1
 F2jIB23MoVCezNNp9ecWs6WsgqDjpm6cKmPpGzStGo9i2Wul5WVCy5WPI5mz6GSlP5Jz
 jP2mopvnM1q3Q2YjbqC0gd8Hp90pXqnTtM0xSuuQEtlCykVhAJ+GpzbKU/rGU1frMqFt
 Pp7RqLg0cN+AUKeNgkv7NEC/QH2Ia/geRlTycnUKAAGrFtW5+sj3VW2Ok9myC/aYIKzk
 W+XQ==
X-Gm-Message-State: AO0yUKW4qvwikAVRC5pI9aOCSX4cbYSTwadOROUxVQEXv5UnYdQqy7vi
 RdTkfQyMyg4jLFz8rOvAfBT779FaJ5XulBvk5sA=
X-Google-Smtp-Source: AK7set+Ltrz9ZTLqVh0FawWnW+h5EYpsvHCB5Qb5phn0FKAr0l/XzQbqmcr3+PgNCODzQ6oxfKh9ug==
X-Received: by 2002:a17:902:dad1:b0:199:4934:9d33 with SMTP id
 q17-20020a170902dad100b0019949349d33mr6111347plx.15.1676526482759; 
 Wed, 15 Feb 2023 21:48:02 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 06/15] linux-user/sparc: Fix sparc64_{get,
 set}_context traps
Date: Wed, 15 Feb 2023 19:45:07 -1000
Message-Id: <20230216054516.1267305-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These traps are present for sparc64 with ilp32, aka sparc32plus.
Enabling them means adjusting the defines over in signal.c,
and fixing an incorrect usage of abi_ulong when we really meant
the full register, target_ulong.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 23 +++++++++++------------
 linux-user/sparc/signal.c   | 36 +++++++++++++++++++-----------------
 2 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 2bcf32590f..edbc4f3bdc 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -213,6 +213,17 @@ void cpu_loop (CPUSPARCState *env)
             env->npc = env->npc + 4;
             break;
 
+#ifdef TARGET_SPARC64
+        case TT_TRAP + 0x6e:
+            flush_windows(env);
+            sparc64_get_context(env);
+            break;
+        case TT_TRAP + 0x6f:
+            flush_windows(env);
+            sparc64_set_context(env);
+            break;
+#endif
+
         case TARGET_TT_SPILL: /* window overflow */
             save_window(env);
             break;
@@ -220,18 +231,6 @@ void cpu_loop (CPUSPARCState *env)
             restore_window(env);
             break;
 
-#ifdef TARGET_SPARC64
-#ifndef TARGET_ABI32
-        case 0x16e:
-            flush_windows(env);
-            sparc64_get_context(env);
-            break;
-        case 0x16f:
-            flush_windows(env);
-            sparc64_set_context(env);
-            break;
-#endif
-#endif
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index b501750fe0..2be9000b9e 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -503,7 +503,23 @@ long do_rt_sigreturn(CPUSPARCState *env)
     return -QEMU_ESIGRETURN;
 }
 
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+#ifdef TARGET_ABI32
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
+#endif
+
+#ifdef TARGET_SPARC64
 #define SPARC_MC_TSTATE 0
 #define SPARC_MC_PC 1
 #define SPARC_MC_NPC 2
@@ -575,7 +591,7 @@ void sparc64_set_context(CPUSPARCState *env)
     struct target_ucontext *ucp;
     target_mc_gregset_t *grp;
     target_mc_fpu_t *fpup;
-    abi_ulong pc, npc, tstate;
+    target_ulong pc, npc, tstate;
     unsigned int i;
     unsigned char fenab;
 
@@ -773,18 +789,4 @@ do_sigsegv:
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
-#else
-void setup_sigtramp(abi_ulong sigtramp_page)
-{
-    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
-    assert(tramp != NULL);
-
-    default_sigreturn = sigtramp_page;
-    install_sigtramp(tramp, TARGET_NR_sigreturn);
-
-    default_rt_sigreturn = sigtramp_page + 8;
-    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
-
-    unlock_user(tramp, sigtramp_page, 2 * 8);
-}
-#endif
+#endif /* TARGET_SPARC64 */
-- 
2.34.1


