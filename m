Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E372E63BEA0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 12:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozyTc-0001kJ-T4; Tue, 29 Nov 2022 06:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ozyTU-0001iJ-99
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:08:33 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ozyTS-0006Cq-0X
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1669720102; bh=3ST47Sv3InBy+sTkldHbbtS7kv1PJG1L8SJ09nu1LMU=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=fE11HeGCm4eOnrya26cJTGIEkeXLLble2agDBkULEfxCTSIqMOCR/I2V3wNdHCs3c
 VCwO9SpgVLGxUiDK1Nm3TqZw0I/Jm7hNnBR1ZyJXxtG9imzMIuO5+qKengjTJmnWk+
 oBh97Qwiu3jH/2n1XLpBbNzY97ffm9dWzh5DkFyGJX1iGuoL07TzV+UuBCiPG+J9Uo
 Tpbd9ZAHlkK9Jx8IlGoppArOnp7rgaS5BHD87kcZEgOa9mq+RRTxtyEL3h2OjrDMg7
 BVwXc0Ao1cUJCsPaGQcWPv1q+aXnIy+hN/uKUzgT2Sh3Z6e2DxoqNexfnB7BtqTOTd
 hTCdCtKZP6X7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.174.127]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lY1-1p0Fin1nDX-000sNh; Tue, 29
 Nov 2022 12:08:22 +0100
Date: Tue, 29 Nov 2022 12:08:20 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Emulate CLONE_PIDFD flag in clone()
Message-ID: <Y4XoJCpvUA1JD7Sj@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:MFLwA0Dg0flpRRDPsoREwH++s1YO0DAGvDilvAQ0oQUWBUtnjp/
 B/m2SLp8RlcZ8btiawlYLJI0SDl+GoB41BO2SKE42eaI8XAO0byLyfsfS+vCI67Dbxmdg6F
 1fK9XM+Xg5YjCCVfVqLLx2ITZbN29XU+NjlWLjBvNcVVZzC9bm0gW+fRPZsy8yPB2zvKGw/
 i5YeMtFLAS6wQjpwnmSbg==
UI-OutboundReport: notjunk:1;M01:P0:6ZNJRoA0I6g=;nXQjFg/BXyKZAcL/C3NpxqAk48V
 3PFC6N2+xUZgXJTWpLacjahuQny2YPdO1cPprcGaPinKGbBt4MEkG8ud8FOqGE3UfXAVHQ8+k
 5jrYbm6NkvE6f6kFMWKR9eSDnWhU53xv9mfYECkXXZxWfqDv3X9WbmeRaHCRjwVSVQlvVqrn8
 dLY/C66SDfuTFFj8vSKnAjxx7YZFUOi6OdTo9BRqfopcqIi/4mjdrsOFc4XtzXsPqmVF/kpNy
 bSbjglsHWDWfzjrTOenE6Zdv8uZEBbGb4nW8iEx0OxX9eMmSe4DihQul24IZiAT42iYJVgNiG
 ZbTTyjPAJCkiUA5rC2asG45YE2aJg+LXNmHIckbJKIlfb/1Z7WIobreQ9bFVGCE6MVJ3TFUpN
 FSs2RPGjz9EChr9pm6uWqoxufAy0jd7xS5Y1vXURwPZavGPDpa/5CoiN8FLjDVbQqsOu2p7+Q
 a/YiAfi6nPALTjqR5PfWP33rqs3UqcavpjYwNY4AtmglRBrghgXO7JIszFBrVGpLeu5HUwJxe
 sfdxxg38r/rToy0C1lfWskjkrxXDq4Y4RyyaujmfyqrZUq/a/Y9aTa2YqPvsv11c7Xvw5yGJG
 jPw0hJCdXWMyaTmXA898FW5KvXDdfYrsn+oprIF2mtIKIq3wGnH9BKve3RpWPKG8bRpgjKXwU
 kisZJQdZCdIEuxBwfd5y60isSPxQBA/JsBAfKW93kYZVlxjnMSAjrv0Ofu/5G4MoWKEdzT45Q
 NTGP0C1E252alN9K14FTbX+aIVYc71WPm92BYqzXNLakv6IzTECFUBsOFL4WyVgWf9pMkl6Oy
 2lC1JCu1lvTgXotUSXVDk626ZUrJjtNIGciXcMQA7oCRzSKHcnvePGvI7AKMBeurEB47QKTDz
 a41wr2FhKulOYcyjogZrKMlWtdXK7TCBV4T2tu2HpQ4Qv8w1YF7Tk3jvuCK1zN8PV9fyoBY5d
 +6+52EQZ6Bjx/IznDzEq74u9B7k=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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

Add emulation for the CLONE_PIDFD flag of the clone() syscall.
This flag was added in Linux kernel 5.2.

Successfully tested on a x86-64 Linux host with hppa-linux target.
Can be verified by running the testsuite of the qcoro debian package,
which breaks hard and kills the currently logged-in user without this
patch.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9ae5a812cd..8fa5c1ec3d 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1097,6 +1097,7 @@ UNUSED static struct flags clone_flags[] =3D {
     FLAG_GENERIC(CLONE_FS),
     FLAG_GENERIC(CLONE_FILES),
     FLAG_GENERIC(CLONE_SIGHAND),
+    FLAG_GENERIC(CLONE_PIDFD),
     FLAG_GENERIC(CLONE_PTRACE),
     FLAG_GENERIC(CLONE_VFORK),
     FLAG_GENERIC(CLONE_PARENT),
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24b25759be..0468a1bad7 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -213,7 +213,7 @@ struct file_clone_range {

 /* Flags for fork which we can implement within QEMU itself */
 #define CLONE_OPTIONAL_FORK_FLAGS               \
-    (CLONE_SETTLS | CLONE_PARENT_SETTID |       \
+    (CLONE_SETTLS | CLONE_PARENT_SETTID | CLONE_PIDFD | \
      CLONE_CHILD_CLEARTID | CLONE_CHILD_SETTID)

 /* Flags for thread creation which we can implement within QEMU itself */
@@ -6747,6 +6747,17 @@ static int do_fork(CPUArchState *env, unsigned int =
flags, abi_ulong newsp,
             return -TARGET_EINVAL;
         }

+#if !defined(__NR_pidfd_open) || !defined(TARGET_NR_pidfd_open)
+        if (flags & CLONE_PIDFD) {
+            return -TARGET_EINVAL;
+        }
+#endif
+
+        /* Can not allow CLONE_PIDFD with CLONE_PARENT_SETTID */
+        if ((flags & CLONE_PIDFD) && (flags & CLONE_PARENT_SETTID)) {
+            return -TARGET_EINVAL;
+        }
+
         if (block_signals()) {
             return -QEMU_ERESTARTSYS;
         }
@@ -6774,6 +6785,20 @@ static int do_fork(CPUArchState *env, unsigned int =
flags, abi_ulong newsp,
                 ts->child_tidptr =3D child_tidptr;
         } else {
             cpu_clone_regs_parent(env, flags);
+            if (flags & CLONE_PIDFD) {
+                int pid_fd =3D 0;
+#if defined(__NR_pidfd_open) && defined(TARGET_NR_pidfd_open)
+                int pid_child =3D ret;
+                pid_fd =3D pidfd_open(pid_child, 0);
+                if (pid_fd >=3D 0) {
+                        fcntl(pid_fd, F_SETFD, fcntl(pid_fd, F_GETFL)
+                                               | FD_CLOEXEC);
+                } else {
+                        pid_fd =3D 0;
+                }
+#endif
+                put_user_u32(pid_fd, parent_tidptr);
+                }
             fork_end(0);
         }
     }

