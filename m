Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223E5BF078
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:47:03 +0200 (CEST)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oam18-0008BJ-Lz
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6F-0003zq-Ap
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:31:59 -0400
Received: from mout.gmx.net ([212.227.17.21]:57563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003IX-Dt
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695115;
 bh=eTqsOAZEvSr87I7k2ZocXc4S7Y4RRkoU5ruRaHuVfIs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IvzikMhYRAax7tsioVUbkeVF3EkVvzPtRLJ7GsheSgxIdiPmCAPmHpQibD983qUoH
 ENBCSZqNZdNrTyK1HHWqSrebAg/o8+6oN3jISaxEQyQgcKgEwNdXxly4RZ21xlMneO
 sFKRQeqws3X3QOwoHkUGr1+FthDTEbsLg8dWQKPo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO24-1p35yV00ue-00okwP; Tue, 20
 Sep 2022 19:31:55 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 11/12] linux-user: Add close_range() syscall
Date: Tue, 20 Sep 2022 19:31:51 +0200
Message-Id: <20220920173152.199359-12-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u7r0yQYQ7/lVpsZQGKWdXfHn2cep2/o+IoVjdRKMD5aIEKpkhCe
 X2Jv+jOoh+4MUUq8bsX+tB6hHZ5H2mGEg6ZNF2uISLFPLHyNgl59pN7XG5XhK4SU5YVfMNW
 yiyvzT5S3y7xWTk+woeTI/9g4PUMoqALLjZ+kzrn6YxUzHBPcb9IHcZgKaGCW4wwU6d+b95
 eNXzYYcJNBK5O6iqQBZ4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g9J0BUo0XvU=:W0myMmJmXQyCpHn6h0lhoz
 /1JEYb7xSkNckhlKDvoax9EGQsje1yXbPbUEBRl1UdlayAe/iMEYS6RsIfOOMmLXcwF15ImEe
 A256kjaUVcQDUrCEr1eeMdONPPgNdQiGH+mYbCyBffj/dFwDDyfmbvWbLG2jak9VkCkwTKBNt
 PoeVcW19LRt+IlcEXeyBnF8eZqzLt7WHIDZ2pOsZi1zKl0hE2qV7mk0BP4z3pLUXP3Xv8pK+Q
 dISxChd8rQhbxkxtCIPT6tqIjeu+F9YPL3L+C88+xPdYiMsipzJL7ma8m8hbKCmsuZ0Aqy5kT
 AClz9Ht1JL8DBxDIZoVo2ny9XBfVgyc2OguY58mVVb16a2QsAJMLZWemhkFOyrM5sdcRMLALg
 je8O+JQ3MVz/m5OvEKOJNcyCi3/sSEwW6MSAS93TmwB1WcnU5n/V411jEz8qbCcLGJaYG4IHa
 lDGnzRcnOTzkdK1LgdmzXDOq6lRz4POnL6GcNxl+j08YIR5rhLz2eBJINEzq6zUX2rS2NWA+M
 z2iUIKq4qDILKGVMVlTSbI1qd7tsteFu1oYH5+ql4uaky2qxaAyIzdURTVjvgf0kkq3kFfkl9
 c4+O/YQPwWmqrSJ9Q3MYiPYy9LYH6yWGLJTrR38om7kF70pgZDTqXXbOgM07UsdljI4/gU9CA
 K8hoc1sLjf20aEYKwuqioGWSw6RpJ28PC/92qC8mBrtxOkrjqMzhP96xHxdWPeKP0Rnar6UhQ
 MBPY22dJeEHoffIUsraN/byds3CxM88mKyolpoIcXWquxwbrnifMHgi9SXL7Qx0twCjRhxhhN
 eXs3VKjrZEs9ymoBtS9B075znAnDk49Ymru+xK2AB/4m97qtrydEAraIgO/LrNt06n+wa7NXC
 oek6srfut74hsFNxHHQ5xT3IDMxWlSHUkbw6Z70bBk4Mhdyki3QKwe/ThqAzQoUtdLPzMR6Y8
 b6QIxubIGYaRW5FW2SvT826lEE0Fw8GYLInCvSwxwJ0xrP97jTzci937zXkKAcbV9wW55ZoG5
 BgvyQriqxQYXLW+J2+puowh3OcZrqLT4x5EUO84gpZs5WHBjlYHeXFzFyX2JjOcO2lUbFSz3Y
 pifc8g/vlLOojcj9Ls1fzQ+9ZxVnRYI/aoEQrqUyoVE5wDYx0Iq8nx9dcQKza8Hg1h61dHJh1
 mo//0=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list |  3 +++
 linux-user/syscall.c   | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 215d971b2a..ad9ef94689 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -103,6 +103,9 @@
 #ifdef TARGET_NR_close
 { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_close_range
+{ TARGET_NR_close_range, "close_range" , "%s(%d,%d,%d)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_connect
 { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ca39acfceb..2e0e974562 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -338,6 +338,10 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
 #ifdef __NR_exit_group
 _syscall1(int,exit_group,int,error_code)
 #endif
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+#define __NR_sys_close_range __NR_close_range
+_syscall3(int,sys_close_range,int,first,int,last,int,flags)
+#endif
 #if defined(__NR_futex)
 _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
@@ -8721,6 +8725,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+    case TARGET_NR_close_range:
+        {
+            abi_long fd;
+            abi_long maxfd =3D (arg2 =3D=3D (abi_long)-1) ? target_fd_max=
 : arg2;
+
+            for (fd =3D arg1; fd <=3D maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return get_errno(sys_close_range(arg1, arg2, arg3));
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);
=2D-
2.37.3


