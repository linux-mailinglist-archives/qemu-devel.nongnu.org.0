Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282854E1A54
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 07:10:47 +0100 (CET)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVom4-0001fS-MB
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 02:10:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nVo2i-00083h-PI
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 01:23:53 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:46742
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nVo2R-00026U-Pc
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 01:23:40 -0400
From: WANG Xuerui <xen0n@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0] linux-user: Fix syscall parameter handling for MIPS
 n32
Date: Sun, 20 Mar 2022 13:22:59 +0800
Message-Id: <20220320052259.1610883-1-xen0n@gentoo.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=xen0n@gentoo.org;
 helo=smtp.gentoo.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 20 Mar 2022 01:54:16 -0400
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
Cc: WANG Xuerui <xen0n@gentoo.org>,
 =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS n32 ABI is basically n64 with the address space (i.e. pointer
width) shrinked to 32 bits. Meanwhile the current code treats it as
o32-like based on TARGET_ABI_BITS, which causes problems with n32
syscalls utilizing 64-bit offsets, like pread64, affecting most (if not
all) recently built n32 binaries.

This partially solves issue #909 ("qemu-mipsn32(el) user mode emulator
fails to execute any recently built n32 binaries"); with this change
applied, the built qemu-mipsn32el is able to progress beyond the
pread64, and finish _dl_start_user for the "getting ld.so load libc.so"
case. The program later dies with SIGBUS, though, due to _dl_start_user
not maintaining stack alignment after removing ld.so itself from argv,
and qemu-user starting to enforce alignment recently, but that is
orthogonal to the issue here; the more common case of chrooting is
working, verified with my own-built Gentoo n32 sysroot. (Depending on
the exact ISA used, one may have to explicitly specify QEMU_CPU, which
is the case for my chroot.)

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/909
Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
---

P.S. This patch is done with my Gentoo hat on, so I'm not using my
usual xen0n.name address. I'd like to add a mailmap entry for correct
shortlog display though, but it seems there's no category for "merely
preference" mappings yet. What should I do in this case?

 linux-user/user-internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index a8fdd6933b2..ee152ccfaa8 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -112,7 +112,7 @@ static inline int is_error(abi_long ret)
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
 
-#if TARGET_ABI_BITS == 32
+#if (TARGET_ABI_BITS == 32) && !defined(TARGET_ABI_MIPSN32)
 static inline uint64_t target_offset64(uint32_t word0, uint32_t word1)
 {
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -121,7 +121,7 @@ static inline uint64_t target_offset64(uint32_t word0, uint32_t word1)
     return ((uint64_t)word1 << 32) | word0;
 #endif
 }
-#else /* TARGET_ABI_BITS == 32 */
+#else /* TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32) */
 static inline uint64_t target_offset64(uint64_t word0, uint64_t word1)
 {
     return word0;
@@ -136,7 +136,7 @@ static inline int regpairs_aligned(void *cpu_env, int num)
 {
     return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
 }
-#elif defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
+#elif defined(TARGET_MIPS) && defined(TARGET_ABI_MIPSO32)
 static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
 #elif defined(TARGET_PPC) && !defined(TARGET_PPC64)
 /*
-- 
2.35.1


