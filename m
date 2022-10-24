Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468B860BC57
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 23:39:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on4I7-0007Iy-U9; Mon, 24 Oct 2022 16:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on4I6-0007Ir-78
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:43:22 -0400
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on4I4-0006mO-9l
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666644198;
 bh=2xx23iL/h5cvIMyaPiGUP7CNQh4bvjUXR+LF0N9eleQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=YJIrJ1L/j5/P/pOoQNkMmT/tpvNi6xob5uaWFBwlnnkcoKu4qOVuGcsySAraC2Q2J
 I8OXye6Dkt9QxKqocUffGbcv5UvDOT0/Z0GV4F2qPMnQzN6jOSVGJ+KStLBWa8uevg
 Kug8Vjzav/gJxobc4nLg4Ns1mrZngm9jbpY9uL58=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.136.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1pR1XX3SYg-00qNyo; Mon, 24
 Oct 2022 22:43:17 +0200
Date: Mon, 24 Oct 2022 22:43:16 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH v4] linux-user: Add close_range() syscall
Message-ID: <Y1b45IL371MJP2WW@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vN84Cft1X4FHGuQR0RVk4OnAsgkWXBBEOoXDrRdN2nMCgrbFehn
 LR8BxinrfV6MerNZv87zrmdRkT3a69PSH+xfibTykzYMvV2srky4ZhrVyH30FAipfJv+SpQ
 WTlVprahF82B5ZVd8WtW2hP7jhgqZR3soWJjGPjglU0dohCiH6BQ1gL90XbLlosReNN/byw
 v4iq7RX1QYM2+FI2u8FXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7mIH1ZAGM8A=:iiqxQ/H4DvCE0kwEaHMQ5P
 kFmf26SlRTm6SlB+staphOYSuzVL6j7/nm+y51onSvRCMShWjGE9/bcgnqucPubC8j/7B92Z1
 Cwac3EYzX31LQIYL7W6Vk6JY6F0h9sQn5M3BoOpbVcU7L7MEptXK5lAJOULNk5Yd5yEiX5Yv2
 JFEJ+R2NlgfqhOgGEHOmfMTUcTrwlYGWOmtua2blJusqzpc0/MbT9IR5gtkZS749L+GjVAFuu
 gxzahDugT1/MrJKhRMhB/ON41YNLx+DIW6QldnePd15hrmlBZERMGo2vyh7+8upgVim9s287x
 txUc9gY5u1F78MU7VPbM/07j6ymZOkMEfLADv1yVNJVKeB+6f8ldNptpyCwazv5yg0wga8Pid
 SrZrO1kbDqe4MDzyy8+ZZsvYNcmlkTwgshsPO1Bqb3jFuOmSRBH3e1+WQn7i9Vo6LuKl01unX
 Z2P0+RAJFXi5KcI8Y17aWpjD3MOVX9P7dMU4Mce9XUdqr/zl8ZylgzRzz+VkvnddIYC6A5K5y
 WPA2o9Otsi7kvuli7oNazJ5VG1NbmW3jF00Tje9Jy7m02E/hgfF6U6ZeuPHjnBkUeweYDig3w
 AZMzugBWtx7xkxSlVQclXyKiGGSsLehcJNxY5xF0BNv02c2utoSj4EMjmXLLZE5wnffHpwDWX
 CWcbIaqo/8vDioi79KVyAVi6cVHdcpeue7cUGlBDCzKvzL9e+oXp6eOM5LcPZk+G0afhniXT2
 vCK1xMuyYVol2+j0HU/XYX4+/azo6TUV8vN9ccQwfp6Z19XbvnjNCH2ZcjboXmEHkjUk4Y8EC
 rgooPL/oCNS3XU3t3DR2zwZujPyThargJLS03XwaEWQpst51vc4IvwDELUZpAce3p52KdnVXB
 g+7i8B4wSwwaI7e4krNVJgYxXTnlkQVhRBJVsqlU0E+qBsgmxFKN+RIYrW1Akm07OfRN+6ef9
 diGHJkord73YGQ0NRUHlq+QgcM9kOpBhaJTURlx3zwS4dQdWqM3LFPQZxNawP6poh3KPCBU0i
 QTe2nKXvgxi+RnnOqIExnevSkmsfOXFIMV7d/gTMjNyCJuBHQMrI4bXiQzt2OdKIAyCwUtrw+
 bjm7gWh0tzNy+8VJ1UHM+rpOEExy3ovrJLGi2Xrjb1cklOJ3nIrFkXcefU+ggtRc5QEEV/Kvc
 KTqph6qZnpRJZpbnfa/vQRKlqbnwgxnlq5n4EFi0KLA+sHi7awpegShpND/BQ4k51v82fMbpt
 KIOWMPWiEaybZQ3ZJWCvy3OeE4Gs9A0fAaL1aL8TJ0IJvaOk9pcQz7y5RxwjL5pFEf63cZfMA
 bAUi3+dF4ioEee10vhedcwui9BFg3tNQUoI0hA6Fv7kJHLwRtj8YlSgU1tdqLzl75ewQY5ntK
 FRebzvN8r9dQ54zR8xnt59OKaG2ACFXiDSLIeeKhppdJhdTDDveUEJUuGH/qOCBfybos4P8gS
 HNVjYyLWGYBfTpbN4q1r18hsRCF/sSGH9561l5l1W0Ilfb6cLGaU/fIFn1pLadmAH5wgCI8CB
 sMV3G1lsJGZCO8Av9gMzOh1CbfuvR9Dfq34Xb13yBawKN
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
Changes:
v4: Fix check for arg2
v3: fd_trans_unregister() only called if close_range() doesn't fail
v2: consider CLOSE_RANGE_CLOEXEC flag

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3df2184580..cd995e5d56 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -103,6 +103,9 @@
 #ifdef TARGET_NR_close
 { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_close_range
+{ TARGET_NR_close_range, "close_range" , "%s(%u,%u,%u)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_connect
 { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 12195d4e99..984039f928 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -339,6 +339,13 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
 #ifdef __NR_exit_group
 _syscall1(int,exit_group,int,error_code)
 #endif
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+#define __NR_sys_close_range __NR_close_range
+_syscall3(int,sys_close_range,int,first,int,last,int,flags)
+#ifndef CLOSE_RANGE_CLOEXEC
+#define CLOSE_RANGE_CLOEXEC     (1U << 2)
+#endif
+#endif
 #if defined(__NR_futex)
 _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
@@ -8735,6 +8742,24 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+    case TARGET_NR_close_range:
+        ret =3D get_errno(sys_close_range(arg1, arg2, arg3));
+        if (ret =3D=3D 0 && !(arg3 & CLOSE_RANGE_CLOEXEC)) {
+            abi_long fd;
+            abi_long maxfd =3D arg2;
+
+            if ((sizeof(abi_long) =3D=3D 4 && arg2 =3D=3D (abi_long)0x7FF=
FFFFFUL) ||
+                (sizeof(abi_long) =3D=3D 8 && arg2 =3D=3D (abi_long)0x7FF=
FFFFFFFFFFFFFULL)) {
+                maxfd =3D target_fd_max;
+            }
+
+            for (fd =3D arg1; fd < maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return ret;
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);

