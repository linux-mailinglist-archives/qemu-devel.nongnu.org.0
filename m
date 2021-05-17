Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5450383C1B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:18:52 +0200 (CEST)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihpL-0000fF-Uc
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlE-0005uX-6q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:37 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:56199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihl9-0004Kt-EV
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:36 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPp0l-1m4Tlx3mNP-00MsRA; Mon, 17
 May 2021 20:14:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/59] linux-user: strace now handles unshare syscall args
 correctly
Date: Mon, 17 May 2021 20:13:27 +0200
Message-Id: <20210517181424.8093-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VMsNYEW94I+yxtcfSz2JI/qdDDiDSOrLf+t2RdqPMAZWe+o5/h3
 pFJYf8vx3z2ZXNShkT7v7ctF9pFvL2ZrLxqKQwwcC8BaCYaOzKd0FCJIbnMSdU8p1//bXjo
 41rJQnw3WItgLiPG7LMeyTXTZIm72xEcXiCaUofjsQ66cjTQqKere2/G8uVj7gV6j0Favo/
 GDqiv4H2E10qulUNQ/D+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fjlvMvfHHPg=:Z/I5aGkC/9J0cdviO48Twd
 f8kt1xmyST0scvma14KRow147PpsPO5NVmBNDytOODZEdWAa/p2SH56rx4EC3dNT1R8whtc2s
 /NVXNO3dBbo8fQMmH3ID4x/sPGBLJzAg2ap734nXhxmsjkNj040Q8gLjmMSqeEDcIZtX26OSa
 ft9k0ZNHlM2FeT7Fk+zQPO3peZRwQwHG6pxgj3qm1BHBnwfsuTXNMBMJdMmfd1FJz39YBA2q+
 Y3oShYg3nApzBi8ucVBKt9Wz5ZSQKldBK0W5pKZ5qzc+wgo+dKgdRse3oXf/gpasG89fvawXA
 fEgQdo1Gcxf+4kwilPznVM4XmLFSnUgylAv50z6MhT6tsZT0St66b1KvYzIC/cl/NM0GDLySl
 ixc9ryNz8GVW4eim6Bv+ZAunnPN/LYI7DF6+TA/sHMDBscx8jrFfzwrjDcrtAy4oqI8o84E40
 NUHI6nQ+PhOgnTgrmS7GHVUCmWcSqbE2UvyWB+x4CCDuMIaF10buHamCXwffHLu2+guuccfwM
 6VvivELaP/7Mgz8B4ly3LY=
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
Cc: Laurent Vivier <laurent@vivier.eu>, Matus Kysel <mkysel@tachyum.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matus Kysel <mkysel@tachyum.com>

Syscall unshare did not have custom print function for strace, but it's argument is same as flags in clone syscall, so it can be easily implemented.
Also updated missing flags from clone_flags.

Signed-off-by: Matus Kysel <mkysel@tachyum.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210406144203.1020598-1-mkysel@tachyum.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 18 ++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e969121b6cd7..1cadb6d50f2d 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1109,6 +1109,12 @@ UNUSED static struct flags clone_flags[] = {
 #if defined(CLONE_NEWNET)
     FLAG_GENERIC(CLONE_NEWNET),
 #endif
+#if defined(CLONE_NEWCGROUP)
+    FLAG_GENERIC(CLONE_NEWCGROUP),
+#endif
+#if defined(CLONE_NEWTIME)
+    FLAG_GENERIC(CLONE_NEWTIME),
+#endif
 #if defined(CLONE_IO)
     FLAG_GENERIC(CLONE_IO),
 #endif
@@ -3467,6 +3473,18 @@ print_unlinkat(void *cpu_env, const struct syscallname *name,
 }
 #endif
 
+#ifdef TARGET_NR_unshare
+static void
+print_unshare(void *cpu_env, const struct syscallname *name,
+              abi_long arg0, abi_long arg1, abi_long arg2,
+              abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_flags(clone_flags, arg0, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_utime
 static void
 print_utime(void *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 084048ab96dd..3b7c15578ca4 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1573,7 +1573,7 @@
 { TARGET_NR_unlinkat, "unlinkat" , NULL, print_unlinkat, NULL },
 #endif
 #ifdef TARGET_NR_unshare
-{ TARGET_NR_unshare, "unshare" , NULL, NULL, NULL },
+{ TARGET_NR_unshare, "unshare" , NULL, print_unshare, NULL },
 #endif
 #ifdef TARGET_NR_userfaultfd
 { TARGET_NR_userfaultfd, "userfaultfd" , NULL, NULL, NULL },
-- 
2.31.1


