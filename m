Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E405F8996
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 08:10:47 +0200 (CEST)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohPWP-0007IS-VG
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 02:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1ohPUb-0005Qz-4w
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 02:08:57 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:52480
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1ohPUY-0008Oq-0K
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 02:08:51 -0400
From: WANG Xuerui <xen0n@gentoo.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <xen0n@gentoo.org>,
 =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
Subject: [PATCH] linux-user: Implement faccessat2
Date: Sun,  9 Oct 2022 14:08:13 +0800
Message-Id: <20221009060813.2289077-1-xen0n@gentoo.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=xen0n@gentoo.org;
 helo=smtp.gentoo.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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

User space has been preferring this syscall for a while, due to its
closer match with C semantics, and newer platforms such as LoongArch
apparently have libc implementations that don't fallback to faccessat
so normal access checks are failing without the emulation in place.

Tested by successfully emerging several packages within a Gentoo loong
stage3 chroot, emulated on amd64 with help of static qemu-loongarch64.

Reported-by: Andreas K. Hüttel <dilfridge@gentoo.org>
Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
---
 linux-user/strace.list | 3 +++
 linux-user/syscall.c   | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index a87415bf3d..3df2184580 100644
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
index 2e954d8dbd..a81f0b65b9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9110,6 +9110,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
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
2.38.0


