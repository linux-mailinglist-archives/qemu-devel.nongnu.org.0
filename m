Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E4E64A66B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 19:03:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4n7a-0004Jg-BR; Mon, 12 Dec 2022 13:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4n7V-0004JL-Ke
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:01:42 -0500
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4n7S-0003dD-DY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670868096; bh=ihC106dqLV2G5A2oNKmSZS1BO6ClvT+qxZRaLS5zR9w=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=mDMmKPYmjEIn51lG5EULQTkZlYaJkMFjqdaKO8T3NtH/V9wyjr+fItM4UBmk2hsVB
 pBlF8nYRmOukpQxWITdcfXbcWN7ghqxgDYj41pGPiXUW1msF91BzKBpaKeg+yW2b+W
 /Tx4HpLjW+zNEAydiX3DxHMxF1dXJlN4qxd+DPe5B356m6WudXfnuQusokmb2jiQYz
 IlhNFfCfPUN6ya4t8gzQaenIo0bGNYG38TSutVFMyStqoW5TxsxLZFrOMl/PQY2BUp
 r5DQO4SbuVuU4aVxWz70YY43L3cVw/RNdaqlOWxWv8/vNG/70A+GofGD1vzNKZ6tvG
 layHW49M/v6Dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.137.92]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5GDv-1oueFO3pbx-011AI6; Mon, 12
 Dec 2022 19:01:35 +0100
Date: Mon, 12 Dec 2022 19:01:32 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Enhance strace output for various syscalls
Message-ID: <Y5dsfGB1RChGfraW@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FV+INyCVRyEVPhERCJuDqh1YWmd9q9Mwl//ylcmkavSsKdhFVEL
 KkWEDgLcdG2KlrXSCLNT6RJfvRbSysW+WI0xK30Y80o96eh6I+9BGQ2qVNsHzKbP/7Mif+c
 RTYsRukzifIruSOHIzTCo0oBSfWK3Lwl3ZpMkh6Zu7E+X/P1s8OWEoYUQkW28KujS6mYbVf
 mIE4dDtzn9SBscGgofXYw==
UI-OutboundReport: notjunk:1;M01:P0:we6Q/BDShxw=;Uy2RLp6afmxz5+ZJvlwe72kRmLj
 dnjHtZFa+ExF1VPeUncn8il5X/0PYdseaSUiLRVvaErXmyxsS+aKPivoVaGorDVf8Tqzaq03z
 VyriL756U5mZl1RHxw94Xh2FQReLDr8SHGDBLP0+GP0g8o+qE/VtK+oDUa7b3UQRN55tG/jVY
 PflhQ3rrRai1cCzXaG5e9Jg5k65B/gGC3LPAU9QkRzrnoiQYWzNRF4PXfJKjejCdBombpkpOl
 sRoI90NLmHa159J7NZDJRaAfmg+tL91a7QzPSZRCqEPGTM3twVJH315rUcJseowwEf40vhrg7
 u4KFs3NxWwtx84K1EagmuKw/0TJh8NlFkSzhH+8Qe3HcMVToNHXXaxbY+Hyc/SNYOryWNUu2L
 XrIfbMg+2YUznwsWztLervGMdXuUDiJDFmTHNPL/NAfOIaOrwfTyc66v6t+X7sOW9tFEAWfQW
 2N284C/XG5yXqy7uKF2fsBifc9PjBl8/WJh5tPVy33WFtEKBK7MP320m6as8OtEMAYmidFJyy
 GsBdcjTaH8ReNoLatYQ+Dpz2d83425ZN4lD58GwgShM7xtW0eXfDPrj7XemunGHaknQzXs+1n
 dVCuKMxlypWhfYm/3KzWF83Fpz7kjgj/dgscpi26rFllPPGR3hKP7ZBTIKr/rbkUJfeh4F1ct
 9Yr/PY6kzGrlkvfHhzM7sN4lFlueckefrtpegXyH/+3Ut3Dli7qXM90pKBx/6Sz/waDFQO9OQ
 TuS40YhBRy8SwovKIro6pXXGKgHIv/3QqwU5p6K0ajMGrsihSEEtwmYpa8IrYhApt11fUIG1Y
 ISerqaMddQuxio9tZKxEQKh1luba51aq7C0IUhQJSqvyvSNPnIHo18pSCNzRB7aP05Dxmd5LG
 pDuiZlWucEHwSI35q69KKUFgcJQmTpXmH+S3oAhq0vv6SiNZY9XhnD9Q5VMdVucKTeNp5xPPt
 2H19+3J+adOiu9vA6KwbPnLPTUM=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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

Add appropriate strace printf formats for various Linux syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>

=2D--
v2: Fixed a few entries based on review by Philippe Mathieu-Daud=E9

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3a898e2532..a75101fca1 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -337,7 +337,7 @@
 { TARGET_NR_getpagesize, "getpagesize" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getpeername
-{ TARGET_NR_getpeername, "getpeername" , NULL, NULL, NULL },
+{ TARGET_NR_getpeername, "getpeername" , "%s(%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getpgid
 { TARGET_NR_getpgid, "getpgid" , "%s(%u)", NULL, NULL },
@@ -361,19 +361,19 @@
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
@@ -385,10 +385,10 @@
 { TARGET_NR_getsid, "getsid" , "%s(%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getsockname
-{ TARGET_NR_getsockname, "getsockname" , NULL, NULL, NULL },
+{ TARGET_NR_getsockname, "getsockname" , "%s(%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getsockopt
-{ TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
+{ TARGET_NR_getsockopt, "getsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL }=
,
 #endif
 #ifdef TARGET_NR_get_thread_area
 #if defined(TARGET_I386) && defined(TARGET_ABI32)
@@ -1052,10 +1052,10 @@
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
@@ -1124,7 +1124,7 @@
 { TARGET_NR_reboot, "reboot" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_recv
-{ TARGET_NR_recv, "recv" , NULL, NULL, NULL },
+{ TARGET_NR_recv, "recv" , "%s(%d,%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_recvfrom
 { TARGET_NR_recvfrom, "recvfrom" , NULL, NULL, NULL },
@@ -1184,7 +1184,7 @@
 { TARGET_NR_rt_sigqueueinfo, "rt_sigqueueinfo" , NULL, print_rt_sigqueuei=
nfo, NULL },
 #endif
 #ifdef TARGET_NR_rt_sigreturn
-{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , NULL, NULL, NULL },
+{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_rt_sigsuspend
 { TARGET_NR_rt_sigsuspend, "rt_sigsuspend" , NULL, NULL, NULL },
@@ -1196,16 +1196,19 @@
 { TARGET_NR_rt_tgsigqueueinfo, "rt_tgsigqueueinfo" , NULL, print_rt_tgsig=
queueinfo, NULL },
 #endif
 #ifdef TARGET_NR_sched_getaffinity
-{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , "%s(%d,%u,%p)", NULL=
, NULL },
 #endif
 #ifdef TARGET_NR_sched_get_affinity
 { TARGET_NR_sched_get_affinity, "sched_get_affinity" , NULL, NULL, NULL }=
,
 #endif
 #ifdef TARGET_NR_sched_getattr
-{ TARGET_NR_sched_getattr, "sched_getattr" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getattr, "sched_getattr" , "%s(%d,%p,%u,%u)", NULL, NUL=
L },
+#endif
+#ifdef TARGET_NR_sched_setattr
+{ TARGET_NR_sched_setattr, "sched_setattr" , "%s(%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_getparam
-{ TARGET_NR_sched_getparam, "sched_getparam" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getparam, "sched_getparam" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_get_priority_max
 { TARGET_NR_sched_get_priority_max, "sched_get_priority_max" , NULL, NULL=
, NULL },
@@ -1220,7 +1223,7 @@
 { TARGET_NR_sched_rr_get_interval, "sched_rr_get_interval" , NULL, NULL, =
NULL },
 #endif
 #ifdef TARGET_NR_sched_setaffinity
-{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , NULL, NULL, NULL },
+{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , "%s(%d,%u,%p)", NULL=
, NULL },
 #endif
 #ifdef TARGET_NR_sched_setatt
 { TARGET_NR_sched_setatt, "sched_setatt" , NULL, NULL, NULL },
@@ -1353,23 +1356,23 @@
 { TARGET_NR_setreuid32, "setreuid32" , "%s(%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setrlimit
-{ TARGET_NR_setrlimit, "setrlimit" , NULL, NULL, NULL },
+{ TARGET_NR_setrlimit, "setrlimit" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_set_robust_list
-{ TARGET_NR_set_robust_list, "set_robust_list" , NULL, NULL, NULL },
+{ TARGET_NR_set_robust_list, "set_robust_list" , "%s(%p,%u)", NULL, NULL =
},
 #endif
 #ifdef TARGET_NR_setsid
 { TARGET_NR_setsid, "setsid" , "%s()", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setsockopt
-{ TARGET_NR_setsockopt, "setsockopt" , NULL, NULL, NULL },
+{ TARGET_NR_setsockopt, "setsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL }=
,
 #endif
 #ifdef TARGET_NR_set_thread_area
 { TARGET_NR_set_thread_area, "set_thread_area", "%s(0x"TARGET_ABI_FMT_lx"=
)",
   NULL, NULL },
 #endif
 #ifdef TARGET_NR_set_tid_address
-{ TARGET_NR_set_tid_address, "set_tid_address" , NULL, NULL, NULL },
+{ TARGET_NR_set_tid_address, "set_tid_address" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_settimeofday
 { TARGET_NR_settimeofday, "settimeofday" , NULL, print_settimeofday, NULL=
 },
@@ -1648,7 +1651,7 @@
 { TARGET_NR_vserver, "vserver" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_wait4
-{ TARGET_NR_wait4, "wait4" , NULL, NULL, NULL },
+{ TARGET_NR_wait4, "wait4" , "%s(%d,%p,%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_waitid
 { TARGET_NR_waitid, "waitid" , "%s(%#x,%d,%p,%#x)", NULL, NULL },
@@ -1672,7 +1675,7 @@
 { TARGET_NR_sync_file_range2, "sync_file_range2", NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pipe2
-{ TARGET_NR_pipe2, "pipe2", NULL, NULL, NULL },
+{ TARGET_NR_pipe2, "pipe2", "%s(%p,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_pidfd_open
 { TARGET_NR_pidfd_open, "pidfd_open", "%s(%d,%u)", NULL, NULL },

