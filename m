Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B3560C70A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:57:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMX-0004iV-Nj; Tue, 25 Oct 2022 04:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onEU5-0001L6-8I
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:30 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onEU3-0003Hj-Gc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:25 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N32y5-1pEQrZ0Eub-013LBv; Tue, 25
 Oct 2022 09:36:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <xen0n@gentoo.org>,
 =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 7/8] linux-user: Implement faccessat2
Date: Tue, 25 Oct 2022 09:36:05 +0200
Message-Id: <20221025073606.3114355-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QDvODlbm5JC+HJJRhSY10kxwrSCubyBAMP2E/pFg0zBF3AUNykh
 usNXY1XRFw9C6M2TX8/AuAgRfSKNozmtEEEId7mAtdzATORQ5AOxg+EfWw1KE0zDjipswA9
 4GokYy+tAix57UZdqrdCSL4Fh0O7yney707PCvRUOJbrBLHwqSxe93tAOc2a/B+UT1WtVJl
 am9QtJIsesLXDa9IJ//Rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XRgM17klfF4=:7DzSbKkIRtOfka6j6jabAt
 XFf05RGv2TSEx7xO/GrX8KaXfH8Q8np+tD4WD02xwRx5119AiwpxN8UwLqZJulJ+6+6fw9NwA
 U1Yq1RmLrGWihFmTkGvjFhYxFYlyLfeibYQF50lfslGsiVVyEkPowbF+RALoNxnAakMYL9p5k
 6/3Su1edTl3bMknhUvXZqJrJahdI3Kx62kzjq7yW3IYKBhIH52q7pWA4Ao4+j5eseFfNUVitR
 zdPNMV4X6iPrFeikPcg6utrXQOd2MgcgnjtnrmI6KIdxyS9GeVfI7Mrq2jm2kCB5baPaAetGz
 gP1jXSaIK9f7PZVcZsMpdbrYEsbygtOvyqaQNIEYZYk8Qs1+flEzvOyYFUDHCqEtVw/4jKUyX
 JBYUWC7SND+pZNamTeKCeg5scXw4SosJvuKzOtq+NPM2FTPRwv+Bouo2t6j6sa83ZHVeX+kJ5
 MwWrCVZxhL8OUD9RFxmFuBMeerEQZhZNe4NI9A7Nl6b4tdPvCSeNnlOag27KrmnhT1QZXA5C1
 Bd6UziVFhUdFsfX2D/Jb33BBgAagmSqCmoTUqm15F5MXcBcbGZ8AEMXJG4HZJCJL78OaC5fSt
 5qWufMt9NKskqsF3TyBmJrBL/vLj67AxUK58FGVP5kebfbVmrPsjoxL/kE/WQNmt6uIGS0fXf
 42hRwhpU/lzr8l6Gr0msl5tDX0i1c9FpqdfbH31DFtb96iR9HEgoz+iO1Nn8z85VqJB6cxi4W
 G/U2mubxVxnrjzI5LNE9/s3H5iZbHHoj3Np3/0qyNVHW2src0PAf/hTujDZ2UwOkaqPdbDMf6
 EsSKEum
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: WANG Xuerui <xen0n@gentoo.org>

User space has been preferring this syscall for a while, due to its
closer match with C semantics, and newer platforms such as LoongArch
apparently have libc implementations that don't fallback to faccessat
so normal access checks are failing without the emulation in place.

Tested by successfully emerging several packages within a Gentoo loong
stage3 chroot, emulated on amd64 with help of static qemu-loongarch64.

Reported-by: Andreas K. Hüttel <dilfridge@gentoo.org>
Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
Message-Id: <20221009060813.2289077-1-xen0n@gentoo.org>
[lv: removing defined(__NR_faccessat2) in syscall.c,
     adding defined(TARGET_NR_faccessat2) on print_faccessat()]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 2 +-
 linux-user/strace.list | 3 +++
 linux-user/syscall.c   | 9 +++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 86c081c83f74..9ae5a812cd71 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1969,7 +1969,7 @@ print_execv(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
-#ifdef TARGET_NR_faccessat
+#if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index a87415bf3d50..3df2184580aa 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -178,6 +178,9 @@
 #ifdef TARGET_NR_faccessat
 { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL },
 #endif
+#ifdef TARGET_NR_faccessat2
+{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
+#endif
 #ifdef TARGET_NR_fadvise64
 { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d499cac1d5d1..e985ad167f21 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9143,6 +9143,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+#if defined(TARGET_NR_faccessat2)
+    case TARGET_NR_faccessat2:
+        if (!(p = lock_user_string(arg2))) {
+            return -TARGET_EFAULT;
+        }
+        ret = get_errno(faccessat(arg1, p, arg3, arg4));
+        unlock_user(p, arg2, 0);
+        return ret;
+#endif
 #ifdef TARGET_NR_nice /* not on alpha */
     case TARGET_NR_nice:
         return get_errno(nice(arg1));
-- 
2.37.3


