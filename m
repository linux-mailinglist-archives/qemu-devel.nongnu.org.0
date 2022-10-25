Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3560C683
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMe-0005yR-Nt; Tue, 25 Oct 2022 04:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onEUF-0001LJ-EF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:42 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onEU5-0003Iz-Nk
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:27 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MIdNt-1oqHHQ1zgT-00EeNr; Tue, 25
 Oct 2022 09:36:09 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <xen0n@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 Joshua Kinard <kumba@gentoo.org>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/8] linux-user: Fix more MIPS n32 syscall ABI issues
Date: Tue, 25 Oct 2022 09:35:59 +0200
Message-Id: <20221025073606.3114355-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZBnt8R6L1Wfxufun9nDQQ4XEeO8Ez4YxdCnokBX4O85Oor1csTB
 1SxiIfNKfIzL6uiGywxsp5quhU/xALzOSVyFfvyWVEPJGzwsBFDhfJfUMYHuUvng8AZMhu2
 hSkaNAx7Q+mOOXEHBoT5PETl1uRvAwjGiIZTlMeAac+f1E0ukHXX2srqoSzfr+4FCNsMYpT
 B+TS6p2RJYmbOsQt5PpXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rah9ltQBPxU=:82cUdJRGwjFu/MP3fLRV9w
 JAsYUgtANG44FfAdf8CP4eBJ7MjZduYeXJAyIX8Dgpd+cKJr+CgijlYQrCKcc5rovOp078JJL
 6EgXtCmVc8SHoyBzOxZ/PeFnAWzH+RwgG06os/91YWEXXxLEIbiQRRQBRKkI0rdLFMQIMgq74
 fN3RvJGHxU7POk/E7MduMbFDE1NyLsOFGLjgMaYdx5Vgrcd/GQKBFn3beKXzSZ2dY7DXev9rr
 NkOw2zc0XwmvZLyPeW1bpSBQdi6S5LfC4gFZYTm0zuuDHlyKhr2wnrsMEi8ma7oG4T/1dnbr8
 k75fTA6VJu7bZ8qiyic4aNdOkPwfQXAAypfyGz0TtndRzWHpMljNw3JDGRq26BAa7nvlzxl9K
 K6CEFshYzuZ8IgIivJ4dkIPFW/6ZPxcptdQKX8s85czaYxsDNv3yf+Qir6zwwWcKAdfRCXmnK
 MJve8TYPG2cWo2FsQZ/bYENqSJxZHJFOD62SBoGUXpW7dGr1NjdLbc1XwU5rDp1Dy3ZWzNrA9
 e0406laxrsQyKzr67LPwWm4inRzoz4VYDm9/0V/neWw64wWkW4LHZd5MFJfCeJ6FOZsSMn/uM
 cp4t8ID0orM8Xnnflzjhp+VNS1GHu+PA3wKeNqQNaEDsS4+p2izErHZspcDaKZ8AFXNqf583y
 J7tvvUPGr4LjcWsBHzbXUeNbUdaBqEZBDDz9fc5XyA9berAPtWVr5Kt7FxKgp9Frwx5CDxIun
 TIgAD6PH5fI24LOb4vgvcaz3GwbTGKqWlFHtkoifO5QQa6DmlXoURpqUZ1XVmTj70a3kqSwCL
 1XsIXlN
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>
Message-Id: <20221006085500.290341-1-xen0n@gentoo.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e954d8dbd9e..8b2d39fe73b3 100644
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
2.37.3


