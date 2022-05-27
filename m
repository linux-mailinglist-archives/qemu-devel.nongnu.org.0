Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39401536834
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:46:55 +0200 (CEST)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugrF-0003YO-B4
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nugp1-00022U-Gi
 for qemu-devel@nongnu.org; Fri, 27 May 2022 16:44:35 -0400
Received: from mout.gmx.net ([212.227.17.21]:53433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nugoz-0002E0-0C
 for qemu-devel@nongnu.org; Fri, 27 May 2022 16:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653684269;
 bh=gQBvQ3PSfW5tNU0Xh/gUwVZ5KSRw+UVE+dgojsF6mkQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=e0y9HHY7a5O9lF6HG0ILcu4frnSqDX2HRVlolhphQRo4/BR/SGitkoshRu2mfwpIm
 d0AIzWUD2ajEiAKr1GR1OpX/oMR3oP20w54g+z+WQ93D2nausv0qeF8UVmlAAqxtZx
 5G5sQaNYJunc3jWVmy0k28ynQN1nVlUixH8oRXho=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.153.1]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma24y-1oHoGu3YGa-00Vzu3; Fri, 27
 May 2022 22:44:28 +0200
Date: Fri, 27 May 2022 22:44:26 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: dave.anglin@bell.net
Subject: Re: [PATCH v2] linux-user: Adjust child_tidptr on set_tid_address()
 syscall
Message-ID: <YpE4KnMXyg/2hgy4@p100>
References: <YpDyWAr/MYl3mizU@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpDyWAr/MYl3mizU@p100>
X-Provags-ID: V03:K1:2AfHRCDpmQZkNqQyay3ydBFoqyD1CnlBFQE48zSv5WWElutbQSl
 yL86j1t8nS0PySkn9jelyEQMJTN4GN0yh6X+C96sAhXSjUweisjmbSldKjoIwHSvCEGvPnp
 BuWE2opC2B/HV4qmbbFJBVdNEPBJkaX7++pcvsPnznxUYFRucjijy9Onw97AhhTYNNAvuqT
 FqxeZL3gb9YceeCwcX/vQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FK69DekUdLY=:8Fz8/2WPbF2gqslQJtOpja
 KOAgwjozUtKK8Xj0oPgnIHegNXX4W6+S9PHX3I0yyx2yzud841sSvFM1PKIGwaF4fvvrWOZI6
 oItjBKFwPoboKuSzS9r2X7214omLnx4OcQEOdNqt7EGmZQCSkK2EXu2DzlKFoAS9gaRILBDGs
 o5ONs4NPAFtP4reIEQGABbnz7PTSdsCLzquJHBvc+CsTDjs7Qoo2fJK+m3br+15pvrBPhQAYe
 6jeWp+T7psxFJkchL4wgaEv7Fats1hq83l71hwzdLUh8aX23/cQM79RWgWf+ziKkFM/MAPL4q
 c3bm1FfxEc2eK4FqRrai1jy9/RPzNSbE5EvGbzCtt816KulkFSOW4jnbqiZO5n6BauFxESOzn
 A2W6lfD+zsBP2g6QeeFBhjZm33giTPQV2gpkLZdTuvmCdqfrcFErHyoXiMe/cZBLukSRlbQFF
 PHPogXyFJetfb4ynbLVAIUcg04HyZaSw9mGmzYKlIa/bl9gTjswWnJ6bKKCt8Xg5Z/xqVUnTf
 Sr1o3kHwoH5Z4jHjch5G6Wu5166lTn0f3d1wpX6w5Rc01VvRM03U0VVNQF24FCMIU929JfMTc
 Ln+JJRa86q1CN1FWY+rAKLINfXd56+I4pQkpB+148VEUzGL8NtBEEs92rFZnv9y4oKIswJ6kO
 73dlhkhVDKkzEhvpmQuxRW7Gzkj3rhX6GJMIVlc+zMfnTDNftiaRp/spq758lNMT4G6ueLxFf
 A/De7ha2PaqxKMXtTGyILcIR34nKM8xXgYA6P2nc7uPOmHMcHWffeDBLUW+CwGC+Jah9IWlPb
 LCTvQzN+X7bBLxppD3ewkHEi7ZXA0VDDoj9tpmBXTjS/fua3FeOum9o/hHD3i/7RHUx1zeBQ+
 1gzGNGYVwLoJ3R50uBHbb68CEHFPol7RqItqdcQmHUQyl+yHyAhQ8DYjGgLUO1uh9yroOWkIb
 kxZBFY+d3R5pgvAb2Zpzpgf8qVO7N5uIgkOJ/a1RMJl0IrwbVbCcjlEgPNszVqr/0dZKQ032K
 mepBD82CWZvFt+mytz6sj8d+Fd6mdYpiK/6vruqW7HX2iLfhBrSfKXK46AOzRNC14TNZuNpdq
 OxMTYkHh5FLasfY4n+OXO2OvcnXH9e3ZmFMJws2pjZuneT+gBIc6G2wrA==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I think the previous patch was wrong, since we just emulate writing to
child_tidptr. Below is updated RFC patch.

=2D--
[PATCH] linux-user: Adjust child_tidptr on set_tid_address()

Keep track of the new child tidptr given by a set_tid_address() syscall.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f65045efe6..9114c611a0 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -320,9 +320,6 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
 #ifdef __NR_exit_group
 _syscall1(int,exit_group,int,error_code)
 #endif
-#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
-_syscall1(int,set_tid_address,int *,tidptr)
-#endif
 #if defined(__NR_futex)
 _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
@@ -12200,9 +12197,14 @@ static abi_long do_syscall1(void *cpu_env, int nu=
m, abi_long arg1,
     }
 #endif

-#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
+#if defined(TARGET_NR_set_tid_address)
     case TARGET_NR_set_tid_address:
-        return get_errno(set_tid_address((int *)g2h(cpu, arg1)));
+    {
+        TaskState *ts =3D cpu->opaque;
+        ts->child_tidptr =3D arg1;
+        /* do not call host set_tid_address() syscall, instead return tid=
() */
+        return get_errno(sys_gettid());
+    }
 #endif

     case TARGET_NR_tkill:

