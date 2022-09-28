Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F55EE6D6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:52:36 +0200 (CEST)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode2l-0004JV-7W
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddeu-0008Ps-Fo
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:56 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odder-0006TI-Om
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:55 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MK3a4-1owwOY1FwE-00LYD0; Wed, 28
 Sep 2022 22:27:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 15/37] linux-user: Implement stracing madvise()
Date: Wed, 28 Sep 2022 22:27:15 +0200
Message-Id: <20220928202737.793171-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V9SPzMlnxE+LItb7b8Q32tnKbAG1gH/sEylIPbA+cn8FMcx6zli
 urJNIMUoEkrZRgAu10Q+BZpDgO868xpPWIkI8OnbMggnnAkXZfW0hOrrzL2LAZ4802Yr0ha
 r9vI5ajTvHKJLrYaAMa8JHI4YirF4kPGJh53thSc8CER65k4Q+NPZbvjQD5sFAtzGYo8Vtr
 WC7TG1c0ixmXrIp5FiYTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WMIK7whjTD8=:X1ubLesyOgXINhqRnvFtia
 xcHLtTD2AvVK9b3eT4oS49OcmGJWmDOF2+Zw5axAjuB0mOyaHsAkItkuuCdrMR+vWU58/yfQa
 9KVNrA3A7Qw/R8+tZxBbN4O8wpWqGT84onjLuQQiGQB4SqoXtyMLNSoSVDdNP9Crf+fKx/xj7
 rXSJcYkWB351kkG09FGVNxmgjlFwdsnEuDUtPGFZDwRi6JB00qjVNuDktQ4Hy/AnDKZOprtDX
 j1/rg0/3lRebOQh90n6jSnImdaHfQ+6IIKlH79JZtEODzS4vHQ1+TOlArYeMla6GHlOYicSSA
 hSfYykEnHWAGFPBXt77vxs/rCzPC15aGFfD2lh/G1Eh3isRrME6kMM+2gmezff3HL8UiDNKD3
 sxDbpyh64pMI7GfoNMqGFgkqq+SuIKhe2u5up4HX/96CloEVoQn6P1uhCIKl+4LKci+G2sWUA
 99Qq6t2/pGQTJ38dQ3/C8U8IIkVh//3oNb4tttdPDHT9Ei/qOV2eQredGcSAu6NFn+uIF2PRU
 lLnwrGMO6SgegRQaaxzf5JnB3XxNVDWb8ML28bipl8xeacmcvGpAIlep43pMdeGSEad4eYdoG
 AzU05lbFCEQW11Sin+8AK/x6rzLrLB7UF5V9HOpZ9+H7CVuKl8lBNDIL5v8MNAyX/ph2k+S0c
 elzOt589ebA6RlgPVrb2GU2Yaz8r+vidAZnWPqllyhgcmsWVd3hWhnWAtAFRcCItUeXSal0Fr
 LzMNV11AiQ+I6F4AT3xYu/q599WGjoUwlFxfEr46+jO+9Ab8YdoeJ8juTuHHwJct2lqWNmGNh
 KeVNh0c
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

The default implementation has several problems: the first argument is
not displayed as a pointer, making it harder to grep; the third
argument is not symbolized; and there are several extra unused
arguments.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220906000839.1672934-4-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index b6b9abaea466..2deb84a2c106 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -18,6 +18,7 @@
 #include "user-internals.h"
 #include "strace.h"
 #include "signal-common.h"
+#include "target_mman.h"
 
 struct syscallname {
     int nr;
@@ -3019,6 +3020,46 @@ print_stat(CPUArchState *cpu_env, const struct syscallname *name,
 #define print_lstat64   print_stat
 #endif
 
+#if defined(TARGET_NR_madvise)
+static struct enums madvise_advice[] = {
+    ENUM_TARGET(MADV_NORMAL),
+    ENUM_TARGET(MADV_RANDOM),
+    ENUM_TARGET(MADV_SEQUENTIAL),
+    ENUM_TARGET(MADV_WILLNEED),
+    ENUM_TARGET(MADV_DONTNEED),
+    ENUM_TARGET(MADV_FREE),
+    ENUM_TARGET(MADV_REMOVE),
+    ENUM_TARGET(MADV_DONTFORK),
+    ENUM_TARGET(MADV_DOFORK),
+    ENUM_TARGET(MADV_MERGEABLE),
+    ENUM_TARGET(MADV_UNMERGEABLE),
+    ENUM_TARGET(MADV_HUGEPAGE),
+    ENUM_TARGET(MADV_NOHUGEPAGE),
+    ENUM_TARGET(MADV_DONTDUMP),
+    ENUM_TARGET(MADV_DODUMP),
+    ENUM_TARGET(MADV_WIPEONFORK),
+    ENUM_TARGET(MADV_KEEPONFORK),
+    ENUM_TARGET(MADV_COLD),
+    ENUM_TARGET(MADV_PAGEOUT),
+    ENUM_TARGET(MADV_POPULATE_READ),
+    ENUM_TARGET(MADV_POPULATE_WRITE),
+    ENUM_TARGET(MADV_DONTNEED_LOCKED),
+    ENUM_END,
+};
+
+static void
+print_madvise(CPUArchState *cpu_env, const struct syscallname *name,
+              abi_long arg0, abi_long arg1, abi_long arg2,
+              abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_pointer(arg0, 0);
+    print_raw_param("%d", arg1, 0);
+    print_enums(madvise_advice, arg2, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #if defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64)
 static void
 print_fstat(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 215d971b2aea..c6f748505a9e 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -542,7 +542,7 @@
 { TARGET_NR_lstat64, "lstat64" , NULL, print_lstat64, NULL },
 #endif
 #ifdef TARGET_NR_madvise
-{ TARGET_NR_madvise, "madvise" , NULL, NULL, NULL },
+{ TARGET_NR_madvise, "madvise" , NULL, print_madvise, NULL },
 #endif
 #ifdef TARGET_NR_madvise1
 { TARGET_NR_madvise1, "madvise1" , NULL, NULL, NULL },
-- 
2.37.3


