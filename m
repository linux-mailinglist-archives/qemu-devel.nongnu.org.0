Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3435BBFA5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:53:25 +0200 (CEST)
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0M0-0001QA-Q3
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Eu-00071a-1v
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.21]:57085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Eq-0007b3-Ki
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530358;
 bh=eTqsOAZEvSr87I7k2ZocXc4S7Y4RRkoU5ruRaHuVfIs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kFc8JXmL1/HlBeencLNqXP0B2Y8LJmOwvlQVBpOmXL10fOXxKB/gtwwbu3zLrC2X5
 jZ2tHjjLPOevtiTotRuz5dYEhKRHiznCZBRux6jNuHSHkio7ESqDUPrqaBbrgI/dh2
 iEL2w4feHhbhYS3ykIIJ8vlKiBLG5qBvNa3vxpV0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1pAAP50Xvx-00cwqg; Sun, 18
 Sep 2022 21:45:58 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 11/12] linux-user: Add close_range() syscall
Date: Sun, 18 Sep 2022 21:45:54 +0200
Message-Id: <20220918194555.83535-12-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hpGy3QaDJn0nSzDP9DsVrEnnkwzmv7/poBAHCvhsR0I7qzEJ5NF
 l4gNr3nsJnd16FVNDFTA6+dl048ZNMsN4sktCA77uoDtf4vS8/1Tx/KKcm17xxy5R+xFy6q
 PbPjs2VgtjzhTefZVuDcyHo6yNxopPF+VItlM4BVezJINX2l/LLgUV3w8Tf1WB7zPieeecn
 q42qCfZDo6boELMWlD3zw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q5ZJZoJTcBs=:pArOi20xmCcuA4akj11sEE
 XsY6al+kI/4kQQ7R1xaIvVeCsiJWFtUz8/bwlMNlGvo4X0yrNdtP/w5VMgkBKJ/RSvLBVQVY5
 GBlkfRAQFJ0a1U2WfM6Tdek8gmjQvFLnNDbHjNztXW7QoWSMcEPdpBLNCWUHR+AB757US6zHA
 3jZPttXTn9VUiouq0l3huwSV0TN6GZo1JmVk/fq4RI1X/HxbZ8dvoNpmM5vZ/goZ/tzNtQ2Sf
 8NllxnBGk7a6XLKj5hzzodcFiIp/5nHpOG4dwU+3fyXeHYfahmxKA1H3bg0roht9gL5fzUqoX
 5WQjcRmqU4Oa4K4LuOnDtUaF8YKJPl8uXDloLOuS5a/gfPAaxbKXT+aO+lKi1pefvhf0xU/2N
 03BcYhZCusRPeQpyKB3/tee056sIkn9+u6O0bQ+5tNrqxbWHvw5vIScTEcbA9LYqhutroutKe
 zJJ05nwWEOPJCN1TVbbTgHy2vorjZTcRfdXiGAzV8kR3tem5OlIvAZdlLrySPBLgP5zBafQ6D
 hLilJA4XVqkjffQ1OoxV39RpZGEDVqvv2FIbpjILTOJvAOp5A9QII4MUVHHhubFSWgt5K4bn0
 h+V1aKTHLeybdD9sc2qTyHeryK4TRRdnW1U86mSjUMj0/VUFkbqBsLzMOq8jqo2RToTUGtWZ8
 IueZh1DpRzvCRct5oNqfm9eFpV+F8aWxJM+fIkVQM2uKVjexf+svX06gkIyPFC1edlelh3J/m
 Jw9gs6hc0WmEpxWNT8smQYsW6B9+bkT2ckzA/tv9BYStAe4DdBI33H2QwhC8+Ye4Op1zVelwl
 UTjUR7iWZtAzhVMrRh67gBWuaOS4NAR6BPmCu0cmMSEniJrXbdNGfGMmLHOjBl4zAVJMCK6P7
 Ixv8taKgc1pRapRn8dV+e/eYqYtb80bL4cwOxM8ffLlP9zk4aJvmyg0W6fw1SY14u+V4GQjee
 Cx6ggugiBx3nUgi0Nw+amegvWVy9unPunYvJAWxKNWTr9rTPBp6KibGYAAMW89ZYz621GkNck
 /NCv/QLx32iaHq1aFu4yPXdmrT/6OkLrs7HrM54CLeSttm4tvNgKzFpQP6KZQ3wKrEqdf4puY
 W99iDAKdKTnXcU4vAH4jJoSJiWjP8a4E91g+UQFpxpfxMPDf4Q281cADXpjadgdyorCA6psSs
 CXlPU+qCRDSM/PM8JQ+k1BDKBU
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


