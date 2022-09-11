Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E28A5B508B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:21:45 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRaS-00088e-EP
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXV-0002RS-ST
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:42 -0400
Received: from mout.gmx.net ([212.227.15.18]:49401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXS-0002ll-42
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920315;
 bh=Hpg5DACac3hGaxdzOdQRYHv676xvOkEBzGXsw79EJAw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MGlbfR2YvDMR0m+n0BKG3AbrLp4TrffxpLtvGYfjjnmmzt44fzyVDRRAPUwpZdT1j
 a4EXv3bKv+6id+Ie5UTxr4XGT2rF4U7Wj7T9vPpfS4Xy5JlZqgdJmbqiJ0iOF/wyIt
 inAR5UCPeS/ANzDfPn4OAxIf595ABQpvtYznIHBM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1oZuUs00wj-00Ffts; Sun, 11
 Sep 2022 20:18:35 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 11/12] linux-user: Add close_range() syscall
Date: Sun, 11 Sep 2022 20:18:29 +0200
Message-Id: <20220911181830.15851-12-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7TNSPUfZA1GM5ijRE+KIZ9qzi6iddoF8EeRN40y6gz8kVpMLF/+
 xWwedCRZHV9Pk7hSIwKMxpmJU8+BXTco8MW2foReQ7umJs2NdQszlH7Vz+yFa2gu2c/0zGD
 SjdymfJXZBB9UK8R+ERnqa1v7LG1dqxpooxf1r0BbJdWKvYrc3BHIonWNGbxltKC26uj5Es
 7hjROcD0V1D2ogZeMccmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lon/2+bO5r0=:m6uyx678ij6Pcy/l3aUcgI
 ld/DI3SDKykDX+MPd2C+CCIme0X4wUCdcbCjhMbuvyQxL/kWiP+U3Zcp1WAHoVqfiwFfynqfU
 icOIfK6wDOKOrygejaHrv5VObGiCp9SBdh11uAXrK0dmqHwmnhbCk7qmIJbqMEKnPvYQLDfpz
 0clBTvSUg7lGrhNsh4L/03tOsxMyAtToNHVRfpAZLXCmC38Bnn9+BPA/ovQ3h549ivFO+m/X+
 IBeqY47gIGCZNyT5W+3akkIt8det5GFvbScV5tytBVeY1/Dos5gFcF30PqnTvZ0p3C9IZYumR
 FdBN7NuXr/xOarEkzDpnFejL4fZ+37Rysz1uUKBlStfZ8fBku1LwtzgII0mg+W4mWX1kuIwdG
 vK34QzXaDJOiL9JMDql1giz2RD26djE6TQKWh5RD3yJBMXxuNHYXuLqXCcLXWh6SUH3ke93/f
 IVfebkPSaWLER/bOkMfBP8S673zx6M2kuRh62hgSmoVhbCsRQLovvGxWHmlUkb/iFfOBDd+6N
 /Ut4sAnq6Hix0XdmiHJkeKAFxYDYX8bRpJA3eCJemqETDBoIPqlSuCnuUdxOCY5VwwqhW1HOk
 533MTR9CilfZzrKtp5JBcLkXrFHaZTAwJRWkgjG4W2HRP+TjDsCI2YOxC7PfuVSwkABWTBywa
 dWtfDXR9CNjtOCCZIY5/mEzDu8RirqffOyuJYVmhJcB5STsCtFqzm5tGhsV8oZRXte2UyUv98
 5tPkbNsk1ZP9MG9L1yf+dDxthORHLfYcMTr24Bk4fnc31HDcy1FfAR9UfvYcxg5wblx+JZK4e
 KC3sSDINKChUryYziJUKT2xdAbKquglKhFk4Xsnwc62euN7D3xzufBNigLOhLVF9TLoBsFzsC
 9VFVIvWE7PSsQtCCAU4pMYy/CzsSXA/1R8Tbnih7oO5avfrEcmoMjWZWq1/zmm92v/4aCJvnI
 YFGm5rRaJmGdBta1Wt0cnG1UYkgawUSXUSdcrQJkS/CcihRsbwAfNldazd2L7R+U/EcM9j+bj
 ZIv1y33ablmDYVG+7MUGKswbXGTXNTJ39+qGT2e8PL4uW9Rg1lJWaRFhyXHtZBhw/8Mz/D4Wm
 KhMAy7kRq9b3GfhOay2GjW/+iX7KWDutlfvyY2qIVrBRleKzjZ9OKckYvYIRytdmMNd38qR7d
 gTfDOWOjHZDwgMOjiaBoSap7A9
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list |  3 +++
 linux-user/syscall.c   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

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
index df018f0e32..e63025a5e3 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8721,6 +8721,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#ifdef TARGET_NR_close_range
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
+        return get_errno(close_range(arg1, arg2, arg3));
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);
=2D-
2.37.2


