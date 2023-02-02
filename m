Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A125687284
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpt-00060Y-Ji; Wed, 01 Feb 2023 19:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNps-00060M-1U
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:20 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpq-0000PX-El
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:19 -0500
Received: by mail-pl1-x632.google.com with SMTP id b5so290393plz.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ow3wENU3re+t6rHOFJyfUAaWZx2l8P7stWpbA0l+Q3A=;
 b=Jfy1TUH59hfVsGM0a86hOYcoJ9r2E8fayGJ8ciLiC0bSynywWBW7CKoT1kdtwtop6g
 HtmDD+6GieiLU+7XbxSy/gTsWamrK3y4S8J0MtqmhRaZmKQKEq6m3aN1RCZNTfjruRS7
 P3QvhhL2199nJg30M4TlfGe0oNxDDkytPkvik1/YQGSrQG3a3zxBwgYiiheipt65FPVt
 e6XyuDTp2yLLbRUOOb4B9ltUj292oxerOIJXeOtLOCuiYlCUHyyxPbYouAyxTX2dsEiH
 jtPt5djjIuXBQ4YxcNPHBoTDzY4rnsPxVA4D4zkWsGbJBZoJxMaGJBmuYgD3cCaBrxPE
 rHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ow3wENU3re+t6rHOFJyfUAaWZx2l8P7stWpbA0l+Q3A=;
 b=uampcCPUHarP+oK15GCqpwOlcQqYDTRYepGiVoNbJ1qB52Jw2V/7CmB8bh/lwtzlwv
 O1u8kaKin3ifqKbZve8nFQkcCx9ttxSFdY0iF1lQrCcDGmk80UWVyaNfcwbfweez0Fx1
 nIODLOm36jwiJ7Fp+8wEOkKuL43bvRdyv49ADxdBDGQQQocww9mDRedIG5g5vonftzkB
 TChMl4p/t7O0T0NIWN5yQ4goetNZ0WFg35rW+15H7NOuQ5Tmz6onJYi+hm0Nw8ZeJ1Km
 72s8apT04WTq2HSstpD/9yFRQIwJpSNLOPd2a2VeGTxP7Vmm05QK7ZrpLFzuYnLxZ/zP
 NaXQ==
X-Gm-Message-State: AO0yUKWKE8FP6T/gnTzJVv/+wLDN32AZiAKwwDAEZ81PlNk2g841Gu5R
 gbzcHKgXxSwmR2xjJ7eJua+Pse+3PJwZI+QV
X-Google-Smtp-Source: AK7set/qAeKNfFiI5DIewdjn/SZSitD0PR9h6d7zBQhzgvG0VZ1/Z5nXRo/0D/APrB15RJdONDhzdw==
X-Received: by 2002:a17:902:f252:b0:196:768a:a9ae with SMTP id
 j18-20020a170902f25200b00196768aa9aemr3396299plc.47.1675299137019; 
 Wed, 01 Feb 2023 16:52:17 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 05/14] linux-user/sparc: Fix sparc64_{get,set}_context traps
Date: Wed,  1 Feb 2023 14:51:55 -1000
Message-Id: <20230202005204.2055899-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index efc0fa64d5..493845fe76 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -217,6 +217,17 @@ void cpu_loop (CPUSPARCState *env)
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
@@ -224,18 +235,6 @@ void cpu_loop (CPUSPARCState *env)
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


