Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6D5EDA73
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:50:24 +0200 (CEST)
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUdz-00042A-A1
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE4-000861-K4
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:28 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE1-00089W-Uj
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:28 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Ml6du-1p58Xg0hKe-00lRA3; Wed, 28
 Sep 2022 10:15:24 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/38] linux-user: Add strace for clock_nanosleep()
Date: Wed, 28 Sep 2022 10:14:50 +0200
Message-Id: <20220928081517.734954-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yWeQiDY9fwlIG1OG2ayCuDT52r8Vqc8bD2I9Kf1Fh4vPBNGh0cx
 KRnmvlHk44GCKp/iEnvmO+qyVgHJ+mdwiov0izreuRvTfid3GNMcVrKia4ZG2ZXR7uNJkP3
 P29pJBVdvbcdjOazWh8dd4VbLLc7TQsB43BwdnSyJhV0rmDZxgdHRdJY5Zcw5VppkzuCNcf
 0O35b2yLd3bHx5r6Gw+3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p/cL610Ro18=:yQn7TpbuA5XEBEXg7lqXnA
 9RH2zTie2iNZM5LiQkpZdT42rrQk/XLgAxAty5AW34oO8iQELsIKZzmg6vM/9E/jNx+Ogjga4
 yb+/9Dk8mZryojTqe3neE3XjijLoPCug/jyusMzSSpyou/AJ43pEFU2dbOh0Nfm0evXAo3HoN
 /nK+x3AM8V1/MfHNN/PYQ3vXSDP5WnAT+M9IINlsNkuCgmQOMXvRhEaBp0FubwIB0LYAILdJA
 tjmMEZ7kEH+vQM7zh5qJXNoRavmatiCIingCTMV6VaBKwGUAY6qLEdAECG4LhTgP1FiaXgx3f
 GHtytMjXHBP5A1QPmvU5F8U9RPpYm1W3DCSC0eOUGNCAWZkHbtRliaNiRSKZZ5zEYWt8ZbrzU
 Onbz5ChmaMVU+SORW2/lKTsjhUfNUOqXSzu1ssC4fnbNYfQxS51wf+sxqNK4uHFxruapwSSQW
 8dcs3MqXGUV5cZhGN70TIzU9BehRX5Epu8/6yMcuElTEve8F4eNGLL4hPkopTxjSI6PyjwzVE
 EoQc9Q/nn1FzafIF92D3SD5z2x/cKW1Hy6f3v3dDWlqH79rSKtold3TG3Yt9MIyv9BVr8Bdyz
 SefinKH9N7YcwgmEnI5EMe6P2Na9hvGvSbTFy2u4aNjxeEOQjSZSaOrsVBcBUzlIVP+GWYOP0
 G3rVipV99KXTlMAce5w+rsnKraK9gsD++FYKq/mS2bc9Vaq+xvEjUTCosylMDJfURucjRLGVa
 SvUoNQFr84EYCUiDTvdGP0uvbK62Wyck86WxGXbY1TJESdNOmrB1cqXyTsQbM6DF7DUSWq4ca
 hcIQfi9
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


