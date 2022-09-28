Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D45EE6AE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:37:06 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddnl-00033H-QO
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odden-00082i-3t
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0006Nr-Qc
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MCsHm-1oUny40AfA-008oWW; Wed, 28
 Sep 2022 22:27:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/37] linux-user: Add strace for clock_nanosleep()
Date: Wed, 28 Sep 2022 22:27:11 +0200
Message-Id: <20220928202737.793171-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uxe/ig7xPkgNaE3XrHmpD7iNNdAZ18vuUtPQBODcaLPpdTfNuAy
 S7GHvwflmPQ9HMHnRZ4GAnjUqclsy0g/YfZswFdkSr+H3faBi+zB5Mx1k5k8o8u0yT2L6no
 jZDGjnDKHTE8afhlIf21EZ8HC09iCi3Lx8bRfhchJVQxIJ0yKNNL6Gveh7OHQ/+g25HlG1Z
 ngCB7Iwy1nkoHs00fdHow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SamJgTClsRI=:vKRxqBYmXzOFFIxmdVDVu7
 WoVsfUfXy/Y+IPopHduDgThTOXpXaXc2W6KLrQgFg+8I1tOI7nO8x985lBIGa1ZlR8B4KOQSo
 tgCw8kLoDky+N8JVA5/qSRCb87yORw/IbJGHpjmcd1lkMzkWk5lSZvcyQLH17PbUSwca7RMYj
 WQ3GSXhfozuMqbos3ruMAcUHiL2YqusOEkuOJUqxxP3XtnvfeoKRcyxz2iWp/8tozNLY4kYIw
 V/klhcs/MptQKKMv2vdoMq0ffcX9yruXwizrs6bAMhP2BlzRbPP5tPm41dEnEHkHFjYXX8+bq
 OEAo3B0A0T5qAiJIaZiABEYcoFKN5Gzpz4AWVMqhQ7DQfakF/NsDMrYVBRL352yQtH+MB8iRi
 QxSiewUMtGIZ8weEIKuf+O00IItO0KWAMCJRoq5Wys35lW5GQbffJMsvYSbNqkQVJzU9D38/e
 ohk/F2DrURUNjErYn+EbXwlS1MRKupOoSELN8Cff0O7k1t0QkOd3EFsGeI1zyhVMYnZZPSAEx
 LJnV5QHbbYn6gC8KwKIUMMFhcfkx6ACVcfo9Cam8fx5J5l1lb/5Hqxwdxe7n5FYc0yoj1qegJ
 NZRqPn6GkSrgaT7+/2Haownoj6E99BK1/Pyw2vabilTqIvzHHCBLvvuem3HqukDjflBb/vP7/
 9qAEzOS665laPsnU87OGqVe5fY+7LPfnFBhfnf2nMCVizOjZbM6ympHxgMsXJYzY1aVv2P0q+
 94q3e41h4uMSD4EOTeMoHQwgawFRi/3fCz9f4S1iZZt/K9/YEiHHyoUm78tLYA1f0nLjGrPOT
 8FdJMhf
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220918194555.83535-10-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 15 +++++++++++++++
 linux-user/strace.list |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2f539845bb90..6f818212d529 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3567,6 +3567,21 @@ print_unshare(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
+#ifdef TARGET_NR_clock_nanosleep
+static void
+print_clock_nanosleep(CPUArchState *cpu_env, const struct syscallname *name,
+                abi_long arg0, abi_long arg1, abi_long arg2,
+                abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_enums(clockids, arg0, 0);
+    print_raw_param("%d", arg1, 0);
+    print_timespec(arg2, 0);
+    print_timespec(arg3, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_utime
 static void
 print_utime(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 4d8b7f6a5e0c..215d971b2aea 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -91,7 +91,8 @@
                            print_syscall_ret_clock_gettime },
 #endif
 #ifdef TARGET_NR_clock_nanosleep
-{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, NULL, NULL },
+{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, print_clock_nanosleep,
+                            NULL },
 #endif
 #ifdef TARGET_NR_clock_settime
 { TARGET_NR_clock_settime, "clock_settime" , NULL, print_clock_settime, NULL },
-- 
2.37.3


