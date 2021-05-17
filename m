Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921E383C2B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:24:19 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihuc-0003dR-Be
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlO-0005wY-En
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:46 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlC-0004NR-4f
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:46 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MBUZr-1lcuLI3slD-00D0Xg; Mon, 17
 May 2021 20:14:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/59] linux-user/sparc: Include TARGET_STACK_BIAS in
 get_sp_from_cpustate
Date: Mon, 17 May 2021 20:13:37 +0200
Message-Id: <20210517181424.8093-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:exQXnhcczEgG0LKZpn9R2hvIN9yt/NiRD1k6sCajxK0NuMgRK6T
 LgslzWFxadNoiEtIQ93sQba9ZY2ds8lEDYWGg8ssu2KXNVlbaNlJ2eRdQz81gAvIhcuHA3m
 n6rPODD7PCXOYOcvI0n+r4ak1R/qfxATEAGKKxEuILXUzHoFnY46Z/kx2luaQ+wObQY3ljl
 nGRVArOIgf/NX3tRYAPcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TQPmuRlPzHw=:udbgYnfD+KntZ2t/vI8A6a
 7xa4SrdDr2Y5AEsSMIS7vsnsAy/gzXc6wU33jPT+hsMw6uLWTK+2JFyZlNtcUR/UJQ97Ovb+s
 WnTJorzlGCBF80pKlt0ewa6/lrL5V7iQJSxiPgZ1aSkVEiO2GWPMAMJI7b9ib+glvgZIK0tnG
 I5RO1kIqF/HOguoI/xL9txVfnaeX+6nxGV3IbLqQVgkD3LQzCeytX7xJhGNtkxr8Lr7QRsJ36
 D0wSpRQz70kR36jC03+P+1SKGpKItsFAYqmoBbRc0WnNXYhIV95rRz0EXbvEN7spsEORdkbEi
 IkHU9Kv0AOMSS63KyaIw+g1Qyv2ZK9oD6iaaghGD3F16osxpX+478V+hmfOiN+G0TzGKI/Ysg
 Gnoah3vYgfLlW3VMiF7y9UmP29uXr+baD230FRRf7ifH8UX3/LI3NGTodjBVptqxVuX+fmKAq
 yFlYB4L+iuOJ7/4A7CbjfXuN3swULnYPcS8PPMLKTaHyMhkKA+nUDqWXgsLmzDN2K6K9AwEHL
 dpjcDFZ3+GWZTvTWt+MkPQ=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move TARGET_STACK_BIAS from signal.c.  Generic code cares about the
logical stack pointer, not the physical one that has a bias applied
for sparc64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c     | 2 --
 linux-user/sparc/target_cpu.h | 9 ++++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index d27b7a3af79d..76579093a88c 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -394,8 +394,6 @@ struct target_reg_window {
     abi_ulong ins[8];
 };
 
-#define TARGET_STACK_BIAS 2047
-
 /* {set, get}context() needed for 64-bit SparcLinux userland. */
 void sparc64_set_context(CPUSPARCState *env)
 {
diff --git a/linux-user/sparc/target_cpu.h b/linux-user/sparc/target_cpu.h
index 1fa1011775a1..1f4bed50f476 100644
--- a/linux-user/sparc/target_cpu.h
+++ b/linux-user/sparc/target_cpu.h
@@ -20,6 +20,12 @@
 #ifndef SPARC_TARGET_CPU_H
 #define SPARC_TARGET_CPU_H
 
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+# define TARGET_STACK_BIAS 2047
+#else
+# define TARGET_STACK_BIAS 0
+#endif
+
 static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
                                         unsigned flags)
 {
@@ -40,6 +46,7 @@ static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
 #endif
         /* ??? The kernel appears to copy one stack frame to the new stack. */
         /* ??? The kernel force aligns the new stack. */
+        /* Userspace provides a biased stack pointer value. */
         env->regwptr[WREG_SP] = newsp;
     }
 
@@ -77,7 +84,7 @@ static inline void cpu_set_tls(CPUSPARCState *env, target_ulong newtls)
 
 static inline abi_ulong get_sp_from_cpustate(CPUSPARCState *state)
 {
-    return state->regwptr[WREG_SP];
+    return state->regwptr[WREG_SP] + TARGET_STACK_BIAS;
 }
 
 #endif
-- 
2.31.1


