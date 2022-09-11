Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251A25B508E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:23:18 +0200 (CEST)
Received: from localhost ([::1]:58566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRbw-0001gC-4U
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXX-0002S3-6R
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.15]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002ld-82
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920314;
 bh=a+VzLr3Jr6Stg5DkRL6y+jodPcSdR3H4tkNT2D1+lps=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b/Ly4DRHpQrqJsmaFeIIjlxmMUnQs3qUta0x/ZpxdFz/FUSrpGk7poHL3sO6VFuk1
 k59v/xBQ2yV46BtAMvtF4pZePcyz6peQfLE9BOwKCkhjgf6pg56qLPd7d2XKzM1yXy
 r7kki14ju/HDcZNZjNPdBob9f35FZ0ULrQt50hOY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McY8d-1p3l9L2xmH-00cxwu; Sun, 11
 Sep 2022 20:18:34 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 09/12] linux-user: Add strace for clock_nanosleep()
Date: Sun, 11 Sep 2022 20:18:27 +0200
Message-Id: <20220911181830.15851-10-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lff3e/Y929NxN/7Z6B6B/XT78SfpRqrRcBbMphcg4ZcEyfGIgTF
 WCbN3tgVwbZ4JMGCod83RjZ6BWfFReLH+kMSBh4/KX4Ug5YFjl0ZwcN1BiCqOHsicqbln6+
 FsEc6UAgsPUk1r1wowdAy8FCsOutQ1+YHZzyKBDjqDbG5hqXKOIaf5+Ki4g8el2Gi1h2CN0
 Gc6cAeYD1X+lWYVfxc+Ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lnMJ7uGgnVc=:c39rW3mynBI6g0WP4TdvaL
 mTnjp1D1dXnIYfLId3JFmX/qKIQEUHFxFC/rqtedSIHLFkuC2j1RnCGrmFaflT6LsWqI+jlUE
 WA8CaLYkxDQVhiy/NWuD+kYJyoQRnmy9mqO6ia+Xka2mRjYSrAXgD90NXAYrO7B/Esj8llPdB
 /VfPzZGMnW13uhzuKxBaN/3OyKF+y/wK9ap9KJ7eHV6Qr0BZRdxMtdYs341BlAnmyGnJidLiu
 epvpd1Dyup2V5FFh44t4XARNTM9yPo03UKymrhxdVwyeP/J8HekVlCfKIMf5wJUz8d345Zsrw
 zGEqKBNpVABjZlEAHwePbXF5ueeoZ4pvNieEQbZas7QLDhYzCK9UafL87QqFid5uWWJw21cgA
 zaheob9Oez2I0snsD/v3zxFmUKdet8NvuBpZm56bR4bmasTi2W1w28pgbT5k8MJblbTuNUByb
 nnGuGJ6QDVc7khnFcCDuDoy6WX8o/wGq8pmsk1d11fkNzGbY/byG6Df2SaccsHezfD1R5JHZC
 qnOrkimwSN6sYrfnnD7XCIUPBI0C+w8ah74rBv5LiPkMkSJwFZBAm131eRBn7aQ474eWhv2UG
 OZSy3BEiRcwrnqYmOkVU4z3ZR55Uo49zVgdDTfXYxVU7xDBqpxiJlW+SBQRMHc6kXsDp1jRnZ
 G+Z8pU6Pd0v8rc8/9Hsvii6Fe2+TcdFKE8OofGNkvYMox3+qRqkZ7t4oHHJcbNZclqxE/T06/
 khzN0/QoCz/7eWYfElqG1PQfFjGNmqvsTDuMg31pRwkezv1Jsv04QCSx3q2rdPDXD6okWFWRF
 2yGoW5Go1IUMvAcwRg4hq/YZOP6r+0PFR93Qb2HNLq4cea7KcZSSod1yTD6kKOFVWIy1RUoLH
 z8tCEbMrhnJcUgWC4wG9Xhdg8MAVa3Ut3qRgQgr+fbELEUyi8wQmLEcZbapysmW8sK502GEQ2
 VLYyiAMf6THtBPWucFYC8IkNWYjPZmg3Nz8UfrdOXIFIncocv8e8EpWhO9/nC2bf+kC6skeW6
 wmA71NNxCYLP3unexHdIMW9IUn3BcqCm2j0r9RQprMd+rmVuX3b4wbW0WWGRhyEcAkFIGKZq9
 pwFX3nAXTuACeSFb1qt8AsvAjf4aCmD/OnkEEQEfBb21ZWzL/BbNVahNibppyXu8qNw412G2w
 0KsDqR9ZFtHj9C9My27OUZUN58
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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
 linux-user/strace.c    | 15 +++++++++++++++
 linux-user/strace.list |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2f539845bb..6f818212d5 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3567,6 +3567,21 @@ print_unshare(CPUArchState *cpu_env, const struct s=
yscallname *name,
 }
 #endif

+#ifdef TARGET_NR_clock_nanosleep
+static void
+print_clock_nanosleep(CPUArchState *cpu_env, const struct syscallname *na=
me,
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
index 4d8b7f6a5e..215d971b2a 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -91,7 +91,8 @@
                            print_syscall_ret_clock_gettime },
 #endif
 #ifdef TARGET_NR_clock_nanosleep
-{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, NULL, NULL },
+{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, print_clock_nanosl=
eep,
+                            NULL },
 #endif
 #ifdef TARGET_NR_clock_settime
 { TARGET_NR_clock_settime, "clock_settime" , NULL, print_clock_settime, N=
ULL },
=2D-
2.37.2


