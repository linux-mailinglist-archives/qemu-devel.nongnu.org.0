Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73296505E52
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 21:18:55 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngWti-0005Oy-IJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 15:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ngWmu-0006gw-EZ; Mon, 18 Apr 2022 15:11:57 -0400
Received: from [187.72.171.209] (port=10848 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ngWms-00036o-W9; Mon, 18 Apr 2022 15:11:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Apr 2022 16:11:46 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5B9398000A0;
 Mon, 18 Apr 2022 16:11:46 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
Date: Mon, 18 Apr 2022 16:10:57 -0300
Message-Id: <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Apr 2022 19:11:46.0806 (UTC)
 FILETIME=[260D4160:01D85358]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PPC64 CPUs can change its endian dynamically, so semihosting code
must check its MSR at run time to determine if byte swapping is
needed.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 include/exec/softmmu-semi.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/exec/softmmu-semi.h b/include/exec/softmmu-semi.h
index fbcae88f4b..723aa2f58a 100644
--- a/include/exec/softmmu-semi.h
+++ b/include/exec/softmmu-semi.h
@@ -12,12 +12,27 @@
 
 #include "cpu.h"
 
+#ifdef TARGET_PPC64
+static inline uint64_t sh_swap64(CPUArchState *env, uint64_t val)
+{
+    return msr_le ? val : tswap64(val);
+}
+
+static inline uint32_t sh_swap32(CPUArchState *env, uint32_t val)
+{
+    return msr_le ? val : tswap32(val);
+}
+#else
+#define sh_swap64(env, val)     tswap64(val)
+#define sh_swap32(env, val)     tswap32(val)
+#endif
+
 static inline uint64_t softmmu_tget64(CPUArchState *env, target_ulong addr)
 {
     uint64_t val;
 
     cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 8, 0);
-    return tswap64(val);
+    return sh_swap64(env, val);
 }
 
 static inline uint32_t softmmu_tget32(CPUArchState *env, target_ulong addr)
@@ -25,7 +40,7 @@ static inline uint32_t softmmu_tget32(CPUArchState *env, target_ulong addr)
     uint32_t val;
 
     cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 4, 0);
-    return tswap32(val);
+    return sh_swap32(env, val);
 }
 
 static inline uint32_t softmmu_tget8(CPUArchState *env, target_ulong addr)
@@ -44,14 +59,14 @@ static inline uint32_t softmmu_tget8(CPUArchState *env, target_ulong addr)
 static inline void softmmu_tput64(CPUArchState *env,
                                   target_ulong addr, uint64_t val)
 {
-    val = tswap64(val);
+    val = sh_swap64(env, val);
     cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 8, 1);
 }
 
 static inline void softmmu_tput32(CPUArchState *env,
                                   target_ulong addr, uint32_t val)
 {
-    val = tswap32(val);
+    val = sh_swap32(env, val);
     cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 4, 1);
 }
 #define put_user_u64(arg, p) ({ softmmu_tput64(env, p, arg) ; 0; })
-- 
2.25.1


