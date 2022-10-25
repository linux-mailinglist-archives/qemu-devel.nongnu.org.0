Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B760C1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:38:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9m6-0006YK-W3; Mon, 24 Oct 2022 22:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on9ln-0006Uv-RO
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:34:28 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on9li-0006fu-8c
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666665255;
 bh=l+0+TgBn0P8Q+6c1mzQiS08UvHrvZ4gtQDqwpq6k67g=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=WSK/kfJdAgvP20cKct4b94jHweWXYc4D8S3NtuQdQ5y6Zo+Pz8RsT31WiX4CvRNny
 BAtywP8T7/5ED4Cb8fCmbIadUMNP2lk1w4iVP0S74SvGBUlOoabbskjeAeRG5aG7/H
 tQmkt0Ydv035JEhXg0rTz/ekXpQTIqbZ6k4gZeFg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.136.30]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1oiDp72AWw-00513U; Tue, 25
 Oct 2022 04:34:15 +0200
Date: Tue, 25 Oct 2022 04:34:14 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH v5] linux-user: Add close_range() syscall
Message-ID: <Y1dLJoEDhJ2AAYDn@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:0iNqPumLwof2q/0F5xKJn0rtTt+DuMWmyvOVFLPj8eKzYLB5Y8A
 iZr2hY/SnTzwTIvEBiMVBk/uWEHbMJGtihi8WNdV2BmQqcYFgyN2ulqvESP6/XhhOpzeIPx
 BaOrJc7rmo9m4Pah/nKvQsL5A3rO0Ln4XNnaFwAAo9afSdUZJ0VJLQe39K2tGk/Vs0gOyjx
 EouLUGcsg+JVNoy/hK81g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RWuazRpU+EQ=:Z6r72k+5MwhdJvGoDirNaF
 gDPD0QUgwQzzPiFnFIjxE1JFh0MqWw+jM2i2qxa3yu5HCZkEHaiCt0x2EC1MCXad/u6izomIH
 BCWbg6UuaS8o7p6RJcMv1wXQ/6AgMjyziDhqhq4jg5d+QC3AAvzwjFNuB9mMpJkvg+94zxQSR
 gJxklkqmFYsr7MjrPJQjSomiDV6Fla2omgG0BfnwHoey0bsQGgL5S/fhqnmgGP6BtAhwQk2qL
 NCDqLF2mVBfN+mYyeUvuSTVgtJ4qIHSI08DiFeXRYp2w0GYFXcpAY/dVDqLITcPAJ5pru6wIc
 GEcNH4ss5W6Ury/6EMygmeUWYKEHS3rKJFGUYwhBlWPKO6vy0D+peEULLBtJP7NeQrEGIkKgE
 02G2AJeNI0Pm13D3rqsc0WZZofXERcOqTCRTewoW18LFtXE6vhkUMaan780EzPjTIuAjjBf+y
 XhM3QJh5mF/8SfOz+AXROlXfbKGSQGC3Ajm0piPSbILZ6D52ueYK1P2Veac1VF++qjabjzmR6
 eb5SiQTt4iBjzwbHTEZeehx/Prjwc7RwYykoaLZ+ZHP4EwO5eMTzFAAs/erPye7wNz2VqjwQE
 yLz3p+AnTGjS58TstV42MIS8menFcmpqtpVM6xXTix5DdAgj3oTNja0eVI8B6jcefzi2wAOBb
 vJLLZADD+CGn+9n+6LAScpdrygNz9uq0SK6KfTs3DxL2uE41nnS59z2EOxdzX0qq4UdKUKB25
 J+Tm2zXFhitEszhcWMkU0RkU+WOVn78h+1+bgVGakqWQTKYTq8P0W2O5Z6i9uoShdnD97fodp
 WSHdBAsErHKCpdexvNhkLg32EBuRpqJjXUvENMnTcD1UPTG5sVm42PTyS0wP4mNhCWoghDQ2s
 tMYsKo5xBGMkAZ1nKwHIN395VvnOlQB70TItmAM6rNKZpVrYGxffLkhZorrgdFx1ij7uTPbSw
 HCDyKcpNAQdhgXVY3q/5JEN/DH3Mt+5z7NWfiw85dZjvY5lx6+ANE4o0MTPlthJSaURopLewg
 FtQ22O8f7f4SZuQpHmq55U414LtaGias2Dq7f7pMtfYY+N6U636pogGuvZDsm5SQ968IxOrmR
 lufm+6WgdwiFiEay5pB8CwhMPeQ6KMm0F3v299b4ffGU4qd5JDNMtQBZYxc4InObr8nhhb/eC
 Y4/DQU9ZDtVuSYJrX5oYJzv/KFSgi7Y6QEbrxvT/PSPf5OoY6rdX918hY6S+W6PKkmvqzLf7A
 sSfB3lqe4sBqaqMHd3UrDLYaG1wWyZH4/QLwMwE4+UWieYsn/EzcPwfP/PnMpnbARoLBp7TCz
 /m0rHqonPSuC/RGVEq2ka0qsxi79gBLAMpUo8tJBZscxaQHRDHr46ekwFCi1EZ7E/i9S1+44y
 DcIlOmtrmGMlXWDp5GithFb7P3QPNv44GZPtpCcGMiJ5qY3fYwIgWgzmEc5VGGEbxoj6jSlaj
 LDTmcN7yq6dxyQfHtjoyq82Nj5jBuZn9GGwJXO5Q6GcpvP++LoKfQeuHZjOMe/YWRvLDtcAEi
 TditVcxpxnWYhH3HTW9+SVEd+LUPEYOeU9OMVsKorUq4t
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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
v5: Simplify check of arg2 against target_fd_max even more
v4: Fix check of arg2
v3: fd_trans_unregister() only called if close_range() doesn't fail
v2: consider CLOSE_RANGE_CLOEXEC flag

diff --git a/linux-user/strace.list b/linux-user/strace.list
index a87415bf3d..78796266e8 100644
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
index 2e954d8dbd..c51d619a5c 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -338,6 +338,13 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
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
@@ -8699,6 +8706,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+    case TARGET_NR_close_range:
+        ret =3D get_errno(sys_close_range(arg1, arg2, arg3));
+        if (ret =3D=3D 0 && !(arg3 & CLOSE_RANGE_CLOEXEC)) {
+            abi_long fd, maxfd;
+            maxfd =3D MIN(arg2, target_fd_max);
+            for (fd =3D arg1; fd < maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return ret;
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);

