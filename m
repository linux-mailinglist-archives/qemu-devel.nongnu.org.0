Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E34E605A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:32:00 +0100 (CET)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIsx-0001Lj-Jt
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:31:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhy-0006Er-6i
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:38 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:51307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhw-0003TU-4H
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:37 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MwQCb-1oNTsn0nKf-00sNcl; Thu, 24
 Mar 2022 09:20:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] linux-user: Fix syscall parameter handling for MIPS n32
Date: Thu, 24 Mar 2022 09:20:07 +0100
Message-Id: <20220324082016.3463521-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Qx7s9Bv8r1ulMZjDoATFEUOEAO5q9gD3j/ccSTSxF/DgSC3xpKu
 Ic9xxJQtQC/siOVZyyYvLdwDthqmnlrA+IxKIgA/B4nOnEZnNjqy26FD1NIQ3LlO1oTkELM
 K8sDJB3RXT3rpHPnmAzdl60V7eJBug2dEsCHwOqjJAmO9/J6UDo/zOp2Dba9i0vix7kEipj
 sNY2MIXg4airA6eKkBkgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1sLvegZV+XM=:GDbxdMZdfz+9NYq3flkA09
 Z5UA03aUuHQJZaKpkSS1T/4bpUwuW0aNN0ZYArj9BvUrMuAvBCiPKDGHSsS+610Kq4n+wpu1v
 ThLDmPqhc7OYKlXYZ7VQ6mKQvKOlgcXf2tdmBhKOTlX9oFUnt31zcrhxO52jVonXXpvGicVo1
 /t/54007EhFthsRAoiAf9kujWRvEq0JWKVmbxjHEdBuU//xyFEh0fF3to3pyUIQBnXVyXEpqP
 SfkTLq8buwKfeY4vw/nEyDBCPu4TjCz0g0pLI3gIvbDooBpjJkZLWJwv6QwNAgiittrC4s/8E
 iRqOMxLhpcFwDuxdGvGfgRpe4BlqWaIGW0/Qtr9H9SotLGXCM0oGjpH4yMCWEHogO5cs9w6mD
 sPRE84d4dkZK8rMekqzQy8I4wMv62N7BmnGVaihKaxcRRL+zzoTiCjbEOV0Fl+XZ2aMJi/Z1w
 0l3mrJiAU+pJ0sDvJMoAzdyfq7bsnCHcXBE31N4vVmY/1/8K0CDgbr1k4fGXnNlVerjHfX+70
 TKjXxh2OdT7mNspuLpMT2+IG1zZetjFpL32KKOlD9it+qVUMb8PkoZg2lSJtHFfUpeIf/l7Tf
 gyK6vve6KBRYVKzQ+2MGaDCeXfdXcRIglcy4yXP/Gx9AUwEKFXeCTqyXs9/Vi2fZ5t8tw4Q/N
 KPN69evUDKOzZa+XCRyibeCKmeEaCEXhQiJNsmq8owrXtY6Hqzdx/fGGhs1CHUIj0D/Y=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <xen0n@gentoo.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <xen0n@gentoo.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220320052259.1610883-1-xen0n@gentoo.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/user-internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index a8fdd6933b23..ee152ccfaa8f 100644
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


