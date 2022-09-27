Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D65EC115
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:22:01 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8f2-0001Ij-SY
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od8Jr-0005us-0e
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:00:18 -0400
Received: from mout.gmx.net ([212.227.17.21]:52639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od8Jo-0003Ml-33
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664276402;
 bh=ibgt8nLgZ+UodxbB1ZTIFvYGT6XnRe69Z7n8N2Spfww=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Hx97lRB7Yi7FVJOUNcJBKQaWYv5rEHWIzWc/ako/hEHaur1oe/LNox5t4XF2iCpQg
 oQn4TwMCcvpVtr19u4WCJHlHRVnZvNZ7/2qCw1y9cnyY/tgcni7N4uCvcJRJ3noOBR
 9f8JRd9igYE5XRIEWPlXuG2kJEEGy8mfltUdaS1g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.138.255]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wll-1pNRN50RIX-012HXN; Tue, 27
 Sep 2022 13:00:02 +0200
Date: Tue, 27 Sep 2022 13:00:00 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH v3] linux-user: Add close_range() syscall
Message-ID: <YzLXsPYR2OjfKWy6@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:d4xXgPxMwkQ5/wBPnyjaaRwulBkLPEGoMq2CEsGDVAhjhFoyHHp
 03doFplOrlQwmAcwUqdEWKo35D+TMo1EvBOIifM8uY5KG1/7XJwUQI4iLDxF1HF6jKuPCFu
 EVE5Q6VdN31h6DrTc9pIoyf6VvSBgAod9F/theyJIOa9r7ZReqPxc6Id2A9nbquVmkB38eb
 dMtU8OXIgh+tvYdFSNelQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZYI1K+oHZks=:PYhkLSn3X+w2QIEXp1iA1s
 0RIorUJC3+us9MZZxm70VkvXrLnAYOoIcAcdgUIEmthXpc3o4xwYPL7MG3j4lG9UPurXkMgAB
 RXv/WQB3Q4VqPkvBEFzY3DrxjZAOxrganosiKi6S85Ib92NRBJ7ysvxVZNL7tOyWmb+1dqTfX
 ZOy8yQ4sZPKHaiGJESm5aQzatmLZX5c0Wi3MZb1UAk+doC0gdTBotGeSclU/9Jt2Dfeu9or8C
 HG+zj3+R4ywRdz1989t5Wd5w1Jri1ODg79YGY9iZ6Zct2Od6fnsv5V6JmXU2HrSH6Rh6DdI6T
 tCguwFyBtJA7usGMBEohHyilE3qyukikyO+il41fWIcm8Cdmfrkqv5Rxj8kLOVYCao8dwMMXa
 v1ubBgoFduHOwzYFsbX600RX5L8qzIIVDkGETJa3Qf9qzqMqJrBd7qJ3fiJ7NcFnisyasvcMm
 KPogHlFwzHtF4RFDEAO1bMqpO5wBCVPeNM4mtTFM2vUyFebHqrekiGNcL+Vs/rtC9I0sB86iJ
 UlhrsXhISmwejqFZX7k3AIim9F7dvcgxJsS9jU7LOP3u/UIb/tn3cJw+eYc/cK6Y9RFc1k0O+
 YuduBciDbDjHWZUB7p0oQncuDeWzIyizF2U0tuxS1XiuMr7sjsyDO7uLLC/sVxKyT/H1waMyP
 x903NxWwlXRaLFK8DRarLh238TIPgcZuWlaUFnFQwV9kajV+8N6ppAZpSnZMHQUlkjFb+BPJb
 nFRfupFNuPRCCxL/vbnm7Hfn/aymXenhFjJ6i58+11FQ8CXmo84ctvIoXvqKTyywAcCDNig+E
 CeH7QqVREyY0eI5uuxoXObpxh4vMTbhYOqgNfzgC5eMwR2GshQ9IQGTtg/bXCgkxg6tIoVAsU
 HVwOW4vLha7hbIiXpVRoM7GKYoPp2t91KT6AzealUoeZ2njtvg5Wz1QTfiXgWq2Sfc3kq5eSC
 ypiY06E/FYpz8xAxkpJzzbf9zOkf8p26laP/o/jow228+VP/13NmtWbMdzo9k+eNwZZjVzxSV
 4CkYQkmHZuJ+tjSR1e0OB6ue80TfH/TYrSo/+ymzuxAWR2nn1Ts1xOOfBmMY5ak+Jeamy5tGq
 E5HGPyzl0/64gghYyIDJp3/0R2gvshaVskziaf7zgy4Vx41JKY+S1ewogPwBwgXkGxRTQjhVl
 km0cFI9s+mQK5FGLmZRRiV6MTL
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_ZBI=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Changes:
v3: fd_trans_unregister() only called if close_range() doesn't fail
v2: consider CLOSE_RANGE_CLOEXEC flag

diff --git a/linux-user/strace.list b/linux-user/strace.list
index f8a771b4f2..8377ef48b2 100644
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
index e0e0f05812..20bf880ace 100644
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
@@ -8730,6 +8737,19 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+    case TARGET_NR_close_range:
+        ret =3D get_errno(sys_close_range(arg1, arg2, arg3));
+        if (ret =3D=3D 0 && !(arg3 & CLOSE_RANGE_CLOEXEC)) {
+            abi_long fd;
+            abi_long maxfd =3D (arg2 =3D=3D (abi_long)-1) ? target_fd_max=
 : arg2;
+
+            for (fd =3D arg1; fd <=3D maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return ret;
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);

