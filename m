Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF296B0949
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtsO-0002r9-5w; Wed, 08 Mar 2023 08:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqx-0001gw-23
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:11 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqv-00065G-84
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:10 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MQMi7-1pwG5O2hqT-00MO1t; Wed, 08
 Mar 2023 14:29:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 04/28] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Wed,  8 Mar 2023 14:28:33 +0100
Message-Id: <20230308132857.161793-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sUWutYqfWYek1hkWk0oBR4I5Yu3UG5yw42sO7gDJL04/SlgDl9W
 97BxcseTV3pj6GBaq7frIx1ptB2Lu0YbWnYD8roK64Rkof2TE05yGaRQ6owcPzSlyjuU2hK
 XeVGnqkJ38m/Vci56/BkLiJkbLPTXsCnnNsWNJ1zJs7p8TtnWZL3/wEZJSnplyx0hUGmMuG
 gCQov/X87NaGk+/2WyG6w==
UI-OutboundReport: notjunk:1;M01:P0:pjWhoxv7Nsk=;YULxpLiT/i3ybt5AgfV9M7HKJtV
 6aMImSMb5wwoCY5aGbVzN2VpnJgWu6wpNmABUPNtGT3Zr5zLFpHD5K40VmZDSjrbU1TQtz9Ae
 7sOhODMJhKEK9xeBINgYRlfHYU27JioqgKMFUtai/d8fs60VLB1Z7OSIRr/kffPfHQYCmuXjq
 nF63NuhJlYUGxmQwiws4jnZKeR0MTSn+nq0xy74wQIeJYqZWsy4axrt/0g/+OyDlXE30v7inV
 iFJJ0F2UnVVXUJswNlm3ZUXzCaQyiSt7Tla/EriLpsv7yKP27O5BHTkCw8Mpt988RAKV0glWV
 Jp/h3GHy95q9fKpOB5wJnMBCPuEQaIMA9o+iCUTAyfr5YosusZR+eb/pwMpGm7mSwHq4J/ajA
 spaZHOG9iLWUTPF9wojzyOJPSs0nQ+K4JPnBVbBysnd7E4qyyY2vUROeLeI/WpzsIdO0hN+bC
 ZlyCum3C8JzmOc/lb0qj5Dpc8lOIG3o+r5ijmaq7ZqgJ9OmCYLKtRtaQSl0zhuT5uBVBUgBTN
 J16/NnbjA0s6CDJABXwMfENX1NbnFX7YKrBqDXhzJD8R7OkBhO65uafgeJqh3biOvEum6nZ9J
 VTqbQTYtzuCNR7+I3dRDO8QcYe2sffTXMMYR1mDYpKdSES1imFzm2ps+UWUv+nwtflAKi4ITP
 QxCBcM4LQMFU5ps2elnwCh3N57WlUuCARbe4OaUTdg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

target_rlimit64 contains uint64_t fields, so it's 8-byte aligned on
some hosts, while some guests may align their respective type on a
4-byte boundary. This may lead to an unaligned access, which is an UB.

Fix by defining the fields as abi_ullong. This makes the host alignment
match that of the guest, and lets the compiler know that it should emit
code that can deal with the guest alignment.

While at it, also use __get_user() and __put_user() instead of
tswap64().

Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230224003907.263914-2-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/generic/target_resource.h | 4 ++--
 linux-user/syscall.c                 | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
index 539d8c46772e..37d3eb09b3b3 100644
--- a/linux-user/generic/target_resource.h
+++ b/linux-user/generic/target_resource.h
@@ -12,8 +12,8 @@ struct target_rlimit {
 };
 
 struct target_rlimit64 {
-    uint64_t rlim_cur;
-    uint64_t rlim_max;
+    abi_ullong rlim_cur;
+    abi_ullong rlim_max;
 };
 
 #define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4f4c1fbc5b0f..db27c85abb8d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12872,8 +12872,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_READ, target_rnew, arg3, 1)) {
                 return -TARGET_EFAULT;
             }
-            rnew.rlim_cur = tswap64(target_rnew->rlim_cur);
-            rnew.rlim_max = tswap64(target_rnew->rlim_max);
+            __get_user(rnew.rlim_cur, &target_rnew->rlim_cur);
+            __get_user(rnew.rlim_max, &target_rnew->rlim_max);
             unlock_user_struct(target_rnew, arg3, 0);
             rnewp = &rnew;
         }
@@ -12883,8 +12883,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_WRITE, target_rold, arg4, 1)) {
                 return -TARGET_EFAULT;
             }
-            target_rold->rlim_cur = tswap64(rold.rlim_cur);
-            target_rold->rlim_max = tswap64(rold.rlim_max);
+            __put_user(rold.rlim_cur, &target_rold->rlim_cur);
+            __put_user(rold.rlim_max, &target_rold->rlim_max);
             unlock_user_struct(target_rold, arg4, 1);
         }
         return ret;
-- 
2.39.2


