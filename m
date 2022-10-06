Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A9E5F6422
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:08:45 +0200 (CEST)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogNo4-0005oM-7M
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1ogMf8-0001Cy-Lz
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:55:26 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:48064
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1ogMf6-0000bI-3F
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:55:25 -0400
From: WANG Xuerui <xen0n@gentoo.org>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <xen0n@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH] linux-user: Fix more MIPS n32 syscall ABI issues
Date: Thu,  6 Oct 2022 16:55:00 +0800
Message-Id: <20221006085500.290341-1-xen0n@gentoo.org>
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

In commit 80f0fe3a85 ("linux-user: Fix syscall parameter handling for
MIPS n32") the ABI problem regarding offset64 on MIPS n32 was fixed,
but still some cases remain where the n32 is incorrectly treated as any
other 32-bit ABI that passes 64-bit arguments in pairs of GPRs. Fix by
excluding TARGET_ABI_MIPSN32 from various TARGET_ABI_BITS == 32 checks.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/1238
Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
Cc: Joshua Kinard <kumba@gentoo.org>
---

Note: I can't reproduce the crash with neither MIPS n32 sysroot at my hand
(a self-built one for Loongson-2F, and stage3-mips64_n32-openrc-20221001T170527Z),
so I can only verify by looking at the (host and qemu) strace outputs, and
would have to ask you to review/test this harder. Thanks.

 linux-user/syscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e954d8dbd..8b2d39fe73 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11793,7 +11793,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         return -host_to_target_errno(ret);
 #endif
 
-#if TARGET_ABI_BITS == 32
+#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
 
 #ifdef TARGET_NR_fadvise64_64
     case TARGET_NR_fadvise64_64:
@@ -11920,7 +11920,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         return get_errno(sys_gettid());
 #ifdef TARGET_NR_readahead
     case TARGET_NR_readahead:
-#if TARGET_ABI_BITS == 32
+#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
         if (regpairs_aligned(cpu_env, num)) {
             arg2 = arg3;
             arg3 = arg4;
@@ -12612,7 +12612,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #endif /* CONFIG_EVENTFD  */
 #if defined(CONFIG_FALLOCATE) && defined(TARGET_NR_fallocate)
     case TARGET_NR_fallocate:
-#if TARGET_ABI_BITS == 32
+#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
         ret = get_errno(fallocate(arg1, arg2, target_offset64(arg3, arg4),
                                   target_offset64(arg5, arg6)));
 #else
@@ -12623,7 +12623,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #if defined(CONFIG_SYNC_FILE_RANGE)
 #if defined(TARGET_NR_sync_file_range)
     case TARGET_NR_sync_file_range:
-#if TARGET_ABI_BITS == 32
+#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
 #if defined(TARGET_MIPS)
         ret = get_errno(sync_file_range(arg1, target_offset64(arg3, arg4),
                                         target_offset64(arg5, arg6), arg7));
@@ -12645,7 +12645,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_arm_sync_file_range:
 #endif
         /* This is like sync_file_range but the arguments are reordered */
-#if TARGET_ABI_BITS == 32
+#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
         ret = get_errno(sync_file_range(arg1, target_offset64(arg3, arg4),
                                         target_offset64(arg5, arg6), arg2));
 #else
-- 
2.38.0


