Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A4B64D743
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5if3-0001MD-S5; Thu, 15 Dec 2022 02:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5ieu-0001Lm-Kz
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:28:03 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5ier-00066i-Nj
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671089268; bh=Er3y6UESAILDEwUKZDL8kfXRduYjqwJzZiiRm2FsFRs=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=PoTLnqwCCMwh2erU0psuCQ9fP+wJxzNaVT3NOJlRo7huCjHllvz8Ij114GpA0N8v/
 1rRHvobud5j+w3yPRM6Gw+iJhefBe88zvYUnyiYMmDiiVrBngAnAUHpW3yeJf7y6UR
 mzmYILjAq+FXs9p8BKo+LFA7GnfRMzPZNXOunz7fZbTpYbRmidc7sCN3YD4eAyavx3
 ulC9yNjna9gcu7XQOfaDRLTAoVIcnV05c/eIBNau+Q1ThrGq/3NujgNTJ7c+LHPa5T
 k8DDmBLKsf3mcE0GGuZ1Fi7zgkAur/YgGI67sI2T3top+XkHjQhZKQCmljKRuq/uDB
 ylVrbhDcXksfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.161.210]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fn0-1ouXWO3DaK-011ylf; Thu, 15
 Dec 2022 08:27:48 +0100
Date: Thu, 15 Dec 2022 08:27:46 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user: Add translation for argument of msync()
Message-ID: <Y5rMcts4qe15RaVN@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:toRDHmZGw6XLuTv/OizbmHSRJfXPkuUtjUVmz5eBUqxcCZQwXIA
 wFriQrUNJ6Dr++kxSBANYHuEMBo68Qrn9g1+e5itjZW1tM9LE3zjxT51UGgh8ZXYyrkAyDb
 5wi3o8S9JtT2G+te3HJBLHi9AZy4q3jTWc9PK0rokbk+tvl0PnY5g8sgu5fxft+ghJmeVEW
 t8N60RYV2UewogAOX4g2Q==
UI-OutboundReport: notjunk:1;M01:P0:2FQJfyZLbZA=;lqiabZJX1qLc6W9YOuheUpO7163
 a+WuF1vzVKm/pcUKuDOOcVPDKKOFVfv9SzeGX8ngWt6lSRMJA6rv9LeaWDdTMygYmK7hZ+OKN
 UueFCoZY4RbWrAVjPv10ZvNy1ppph+zs3LbbHYGH2YWe0P4i/uzlQFki+Kje07VE3eEiDmfJz
 dJ48pH7j6CaMB9IEH3V6VdjboMHlnSJtfTZ6XjSr64aBFIKAL4N9DI3tsiZN/fMy3qWiwIqUK
 JEBkHolejwrw02u3m+E1Omj1614pAWpGmycUi58YYGwlVPAusf81J5VdG/kblqfyFZPyZQA8O
 opHztXqg8nqGdM/2F9YLfIGwNDv38lJ4+s8qnSJ1hxXMviIODKRHgqefwRI/fXPq4jctkaFWa
 0pvm14FbpMfykTwc2Jv+N+7t4f0rzYmnijyVN62IJlVdQsKIjT/ob5r7u61dW3ZJcgxv67be8
 gNC8EVOIPJrCMdeoV/2wObUmA9ilRmIU6gLYF2mOtDhX6ynhFjyDqYHvZibexOUsr8lsMV0Bd
 oZ1KCv9cqkZcTq0ISWpglRE4XEdciTOIomPQoXZIHxR25gsa3COVfwz84Mw2VaulntX0jwQSG
 vNppl+VESEu0PqkP/+0k/4AcY1wtRZy+0oduy0X4YRUOZe8wsvsdhYFS6Uyiz3HBAb7K7jO6S
 zHb5tivMrQCZ3iiGGbzAFkA9WvtFJ9Pd8dLTnDIuPAMwDzNUINhKK9/gJ84oQqrmflqE2TX7L
 DROdOvrfnEqVxehSwKp/fXHWvYl5egR3lOUIIYjfwf6oZ0dROSL+FvbIQlYiSmjeopfT1LH00
 CjmUwAO2ss7ta6XjyddYeRHn4k+ktyd4C8uZBtoNEsoWx9YhX2/d83XMlfPUtCBFSldQIVcZx
 0SEp+gmdpPkFV+sjFYQhJhODLQD2VBZNBMkDpDQDb6RvOdns8KVVyf31OU1XsfuCqLTm0rUi1
 +/P5xuEvyKdJfz/XaUSQCnNeCro=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

msync() uses the flags MS_ASYNC, MS_INVALIDATE and MS_SYNC, which differ
between platforms, specifcally on alpha and hppa.

Add a target to host translation for those and wire up a nicer strace
output.

This fixes the testsuite of the macaulay2 debian package with a hppa-linux
guest on a x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/alpha/target_mman.h b/linux-user/alpha/target_mman=
.h
index cd6e3d70a6..051544f5ab 100644
=2D-- a/linux-user/alpha/target_mman.h
+++ b/linux-user/alpha/target_mman.h
@@ -3,6 +3,10 @@

 #define TARGET_MADV_DONTNEED 6

+#define TARGET_MS_ASYNC 1
+#define TARGET_MS_SYNC 2
+#define TARGET_MS_INVALIDATE 4
+
 #include "../generic/target_mman.h"

 #endif
diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/target_=
mman.h
index 1436a3c543..32bf1a52d0 100644
=2D-- a/linux-user/generic/target_mman.h
+++ b/linux-user/generic/target_mman.h
@@ -89,4 +89,17 @@
 #define TARGET_MADV_DONTNEED_LOCKED 24
 #endif

+
+#ifndef TARGET_MS_ASYNC
+#define TARGET_MS_ASYNC 1
+#endif
+
+#ifndef TARGET_MS_INVALIDATE
+#define TARGET_MS_INVALIDATE 2
+#endif
+
+#ifndef TARGET_MS_SYNC
+#define TARGET_MS_SYNC 4
+#endif
+
 #endif
diff --git a/linux-user/hppa/target_mman.h b/linux-user/hppa/target_mman.h
index 66dd9f7941..f9b6b97032 100644
=2D-- a/linux-user/hppa/target_mman.h
+++ b/linux-user/hppa/target_mman.h
@@ -10,6 +10,10 @@
 #define TARGET_MADV_WIPEONFORK 71
 #define TARGET_MADV_KEEPONFORK 72

+#define TARGET_MS_SYNC 1
+#define TARGET_MS_ASYNC 2
+#define TARGET_MS_INVALIDATE 4
+
 #include "../generic/target_mman.h"

 #endif
diff --git a/linux-user/strace.list b/linux-user/strace.list
index a75101fca1..ac8f872371 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -650,7 +650,7 @@
 { TARGET_NR_msgsnd, "msgsnd" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_msync
-{ TARGET_NR_msync, "msync" , NULL, NULL, NULL },
+{ TARGET_NR_msync, "msync" , "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_multiplexer
 { TARGET_NR_multiplexer, "multiplexer" , NULL, NULL, NULL },
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d58e9b8d10..e541fbe09a 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -22,6 +22,7 @@
 #include "qemu/path.h"
 #include "qemu/memfd.h"
 #include "qemu/queue.h"
+#include "target_mman.h"
 #include <elf.h>
 #include <endian.h>
 #include <grp.h>
@@ -7667,6 +7668,14 @@ static inline int target_to_host_mlockall_arg(int a=
rg)
 }
 #endif

+static inline int target_to_host_msync_arg(abi_long arg)
+{
+    return ((arg & TARGET_MS_ASYNC) ? MS_ASYNC : 0) |
+           ((arg & TARGET_MS_INVALIDATE) ? MS_INVALIDATE : 0) |
+           ((arg & TARGET_MS_SYNC) ? MS_SYNC : 0) |
+           (arg & ~(TARGET_MS_ASYNC | TARGET_MS_INVALIDATE | TARGET_MS_SY=
NC));
+}
+
 #if (defined(TARGET_NR_stat64) || defined(TARGET_NR_lstat64) ||     \
      defined(TARGET_NR_fstat64) || defined(TARGET_NR_fstatat64) ||  \
      defined(TARGET_NR_newfstatat))
@@ -10163,7 +10172,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env,=
 int num, abi_long arg1,
         /* ??? msync/mlock/munlock are broken for softmmu.  */
 #ifdef TARGET_NR_msync
     case TARGET_NR_msync:
-        return get_errno(msync(g2h(cpu, arg1), arg2, arg3));
+        return get_errno(msync(g2h(cpu, arg1), arg2,
+                               target_to_host_msync_arg(arg3)));
 #endif
 #ifdef TARGET_NR_mlock
     case TARGET_NR_mlock:

