Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE26668AB12
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5z-0005P5-6m; Sat, 04 Feb 2023 11:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5t-0005FU-MO
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:49 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5r-0006yU-Dr
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:49 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N3KDM-1ofkxq3Pu6-010JCP; Sat, 04
 Feb 2023 17:08:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 20/22] linux-user: Enhance strace output for various syscalls
Date: Sat,  4 Feb 2023 17:08:28 +0100
Message-Id: <20230204160830.193093-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Js93xtHuDvVGovJlC6+GReXXsj0E6Ed8IhOo/iiHUmiruR1jNFU
 IabvCtp/7CbceOVozbbJe0l8pl4Y/G1c/fobQLh/QH6Yjk+U1PSnhA/HYqJDsFWcKnxZ3Iz
 hVOVCbZj8WfHN2R/J0fpUum7/zT+WJsi4jf0JUEhpe8TjdnCuoteY9J6FHVqepb/p+bCstT
 4l+6IMCf/DN4xydOf0oSw==
UI-OutboundReport: notjunk:1;M01:P0:p4imyttATcY=;segpLpIWud+dmXsCyHyfKsjLONv
 i37NCukwhY9nn6lhkG5YHHX6dwAGu5MgZQYya9Bt7TSpXMyAeMkLpCc1NoZaU0lxtm86/59fM
 Ul6VV+HXGnrFFXBrIIolQdosT+eAIY4M/QNMbOCyEGlo0KABSRfPCTGFxivIWGc6AGR45qqnp
 oBVE3VxqMnzWnFTKcBWfFKRhU4a2ffPX1QTCRi/s5Xn5S4r1bCPOx50sqF7iViqYre69aq64+
 rUwNnAQtcjuRPUnhi9F6lrSnBHEl2aYKplIIwr4sznu51I8kQAXGd3/CGTj119KgTAiKGeCcJ
 lL7eTswo8Rdx+6/lN50/QKHfAn1AtuiK0sUru2+Ksq8OGw4e5kQ+mNGatxmLyNgX0DVyLocj2
 BfntP2gpLyx11PyYYGI7bIt5jAcHvLRZOnGOaTLgC399t4Nrp2McrjN0crI0xJCJ09V012rg0
 sONoYcH9K2krsuBeGNqUAFtw1Sf6Z+TwKaG2oVIkv5YbDeeP0wcdo4k1chj82kucZhrCLdySU
 4DXy2q1T3ty97Zn+UnIxRWJttYRGa6hdwy+eKP9d6Ss2BEKvLVs44ywh0n+egzpIhE5hlR97x
 K3Pxefn743MkFQ4ofO0zrdwOtEARt3kEvT/R//0UYG7sl6mlMwL6YmGsmLtvgD+CpA7flxccL
 3yUyDGZJdRk47C9jS1mcchwmFIDKcSxfSDLFpSkKUw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

From: Helge Deller <deller@gmx.de>

Add appropriate strace printf formats for various Linux syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <Y5dsfGB1RChGfraW@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 43 ++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3a1f61803a39..d8acbeec6093 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -343,7 +343,7 @@
 { TARGET_NR_getpagesize, "getpagesize" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getpeername
-{ TARGET_NR_getpeername, "getpeername" , NULL, NULL, NULL },
+{ TARGET_NR_getpeername, "getpeername" , "%s(%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getpgid
 { TARGET_NR_getpgid, "getpgid" , "%s(%u)", NULL, NULL },
@@ -367,19 +367,19 @@
 { TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
-{ TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
+{ TARGET_NR_getresgid, "getresgid" , "%s(%p,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid32
 { TARGET_NR_getresgid32, "getresgid32" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresuid
-{ TARGET_NR_getresuid, "getresuid" , NULL, NULL, NULL },
+{ TARGET_NR_getresuid, "getresuid" , "%s(%p,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresuid32
 { TARGET_NR_getresuid32, "getresuid32" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrlimit
-{ TARGET_NR_getrlimit, "getrlimit" , NULL, NULL, NULL },
+{ TARGET_NR_getrlimit, "getrlimit" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_get_robust_list
 { TARGET_NR_get_robust_list, "get_robust_list" , NULL, NULL, NULL },
@@ -391,10 +391,10 @@
 { TARGET_NR_getsid, "getsid" , "%s(%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getsockname
-{ TARGET_NR_getsockname, "getsockname" , NULL, NULL, NULL },
+{ TARGET_NR_getsockname, "getsockname" , "%s(%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getsockopt
-{ TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
+{ TARGET_NR_getsockopt, "getsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_get_thread_area
 #if defined(TARGET_I386) && defined(TARGET_ABI32)
@@ -1059,10 +1059,10 @@
 { TARGET_NR_pivot_root, "pivot_root" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_poll
-{ TARGET_NR_poll, "poll" , NULL, NULL, NULL },
+{ TARGET_NR_poll, "poll" , "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_ppoll
-{ TARGET_NR_ppoll, "ppoll" , NULL, NULL, NULL },
+{ TARGET_NR_ppoll, "ppoll" , "%s(%p,%u,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_prctl
 { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
@@ -1131,7 +1131,7 @@
 { TARGET_NR_reboot, "reboot" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_recv
-{ TARGET_NR_recv, "recv" , NULL, NULL, NULL },
+{ TARGET_NR_recv, "recv" , "%s(%d,%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_recvfrom
 { TARGET_NR_recvfrom, "recvfrom" , NULL, NULL, NULL },
@@ -1191,7 +1191,7 @@
 { TARGET_NR_rt_sigqueueinfo, "rt_sigqueueinfo" , NULL, print_rt_sigqueueinfo, NULL },
 #endif
 #ifdef TARGET_NR_rt_sigreturn
-{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , NULL, NULL, NULL },
+{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_rt_sigsuspend
 { TARGET_NR_rt_sigsuspend, "rt_sigsuspend" , NULL, NULL, NULL },
@@ -1203,16 +1203,19 @@
 { TARGET_NR_rt_tgsigqueueinfo, "rt_tgsigqueueinfo" , NULL, print_rt_tgsigqueueinfo, NULL },
 #endif
 #ifdef TARGET_NR_sched_getaffinity
-{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , "%s(%d,%u,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_get_affinity
 { TARGET_NR_sched_get_affinity, "sched_get_affinity" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_getattr
-{ TARGET_NR_sched_getattr, "sched_getattr" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getattr, "sched_getattr" , "%s(%d,%p,%u,%u)", NULL, NULL },
+#endif
+#ifdef TARGET_NR_sched_setattr
+{ TARGET_NR_sched_setattr, "sched_setattr" , "%s(%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_getparam
-{ TARGET_NR_sched_getparam, "sched_getparam" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getparam, "sched_getparam" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_get_priority_max
 { TARGET_NR_sched_get_priority_max, "sched_get_priority_max" , NULL, NULL, NULL },
@@ -1227,7 +1230,7 @@
 { TARGET_NR_sched_rr_get_interval, "sched_rr_get_interval" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_setaffinity
-{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , NULL, NULL, NULL },
+{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , "%s(%d,%u,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_setatt
 { TARGET_NR_sched_setatt, "sched_setatt" , NULL, NULL, NULL },
@@ -1360,23 +1363,23 @@
 { TARGET_NR_setreuid32, "setreuid32" , "%s(%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setrlimit
-{ TARGET_NR_setrlimit, "setrlimit" , NULL, NULL, NULL },
+{ TARGET_NR_setrlimit, "setrlimit" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_set_robust_list
-{ TARGET_NR_set_robust_list, "set_robust_list" , NULL, NULL, NULL },
+{ TARGET_NR_set_robust_list, "set_robust_list" , "%s(%p,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setsid
 { TARGET_NR_setsid, "setsid" , "%s()", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setsockopt
-{ TARGET_NR_setsockopt, "setsockopt" , NULL, NULL, NULL },
+{ TARGET_NR_setsockopt, "setsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_set_thread_area
 { TARGET_NR_set_thread_area, "set_thread_area", "%s(0x"TARGET_ABI_FMT_lx")",
   NULL, NULL },
 #endif
 #ifdef TARGET_NR_set_tid_address
-{ TARGET_NR_set_tid_address, "set_tid_address" , NULL, NULL, NULL },
+{ TARGET_NR_set_tid_address, "set_tid_address" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_settimeofday
 { TARGET_NR_settimeofday, "settimeofday" , NULL, print_settimeofday, NULL },
@@ -1655,7 +1658,7 @@
 { TARGET_NR_vserver, "vserver" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_wait4
-{ TARGET_NR_wait4, "wait4" , NULL, NULL, NULL },
+{ TARGET_NR_wait4, "wait4" , "%s(%d,%p,%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_waitid
 { TARGET_NR_waitid, "waitid" , "%s(%#x,%d,%p,%#x)", NULL, NULL },
@@ -1679,7 +1682,7 @@
 { TARGET_NR_sync_file_range2, "sync_file_range2", NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pipe2
-{ TARGET_NR_pipe2, "pipe2", NULL, NULL, NULL },
+{ TARGET_NR_pipe2, "pipe2", "%s(%p,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_pidfd_open
 { TARGET_NR_pidfd_open, "pidfd_open", "%s(%d,%u)", NULL, NULL },
-- 
2.39.1


