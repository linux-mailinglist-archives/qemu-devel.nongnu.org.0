Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED93F3D6D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:09:15 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHenF-0007wv-KO
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaM-0007q3-V5
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:51 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaL-0000gJ-Fv
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id n5so9807499pjt.4
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1vrWXXk2QGk0hTQCIleqy7sIqee8vTHllkla9WWLZlc=;
 b=JHpHPx0ooW1Il+WvyGLE3GWbFwP+YU9ohioLo0VuVDpk1lcJuOdEcyBSCckLQI4GeM
 CkMFVUPjAky7dwYbnnC1cNFVb+wCuGxz0JdstwAZ5oF023fpp342zeS/M8F8Oi2MVzmO
 pDjxtHTJhEmZombFkvplfrottSL9+hR/eKKSmf5uyVgn3NISYvjBDGtdaIFceCGn40Tx
 Tl135xg8RjZMJsQWIylN0Xd8BY6BTs0QeQEJlYtWxeG/hxCx1Y/FEyQO7tsBbpGsgo7R
 X4Ie5/KRRo+AS3aILOHShlEFlUYe/1ZK5i7HQvbTBNLTIlnSDJrRFqDMfIOjfZ8sqY+0
 MfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vrWXXk2QGk0hTQCIleqy7sIqee8vTHllkla9WWLZlc=;
 b=D0GebufwLtqzOmxr4l8cIwa2972X1aEvb/7W/EXeDQ4r6WoPIZ3Z6kFq++Ep5XTiih
 LDLUx64KoeRUdQ2dSAjzpSVyFT/bR6iqPDPWTkYhUbxfsyUzEYJz4ecl3OeqzPUlAsgu
 9ID6c4JKiWKteQSkOsuKbYXtr6GSt6cSEcjy94oxLMfmneqlDGYYfhWpfHMJvqXs5XBK
 csSoPXIq904rOkQiOQiiKPXZ/6s550lyNx1DNDC/dfiTQVFcBrNLvCSPXAQQcIVTXLjZ
 j3N2JWXgVVuQBe/XXCjFzkz398C6Y3s6jhU+kK16AzTj2ubDprn04Lxxfy7B2qaTxmPK
 eKXA==
X-Gm-Message-State: AOAM5322bhVBZA4dRYqPeyRONQVdlrTFDpHq+35y26eGGtsHI6rY4ZEi
 HPQSK1sib5CCzdlGknPQgNmOOEYhuQHEaw==
X-Google-Smtp-Source: ABdhPJzkd+r6AqrVybe0sL/bzF+76RhO7126+8uRwDq5XcKeEpuVEOocqmj+zqJ4ZVX22kbQHse4DA==
X-Received: by 2002:a17:90a:a087:: with SMTP id
 r7mr12962651pjp.84.1629604548389; 
 Sat, 21 Aug 2021 20:55:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/30] linux-user/hppa: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:21 -0700
Message-Id: <20210822035537.283193-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new functions instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 82d8183821..3500b2c291 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 static abi_ulong hppa_lws(CPUHPPAState *env)
 {
@@ -108,7 +110,6 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
 void cpu_loop(CPUHPPAState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -152,42 +153,23 @@ void cpu_loop(CPUHPPAState *env)
         case EXCP_PAGE_REF:
         case EXCP_DMAR:
         case EXCP_DMPI:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_ACCERR;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sigsegv_for_addr(env->cr[CR_IOR]);
             break;
         case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->cr[CR_IOR]);
             break;
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
         case EXCP_COND:
         case EXCP_ASSIST:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
-- 
2.25.1


