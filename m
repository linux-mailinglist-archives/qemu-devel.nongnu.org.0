Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1471B284
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 11:14:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ72b-0008J7-Oj
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 05:14:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <schwab@suse.de>) id 1hQ6rJ-0001Gy-HV
	for qemu-devel@nongnu.org; Mon, 13 May 2019 05:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <schwab@suse.de>) id 1hQ6rI-0006ys-Cf
	for qemu-devel@nongnu.org; Mon, 13 May 2019 05:02:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:38554 helo=mx1.suse.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <schwab@suse.de>) id 1hQ6rI-0006xU-6q
	for qemu-devel@nongnu.org; Mon, 13 May 2019 05:02:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 5F656AECD;
	Mon, 13 May 2019 09:02:54 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: qemu-devel@nongnu.org
X-Yow: HELLO KITTY gang terrorizes town, family STICKERED to death!
Date: Mon, 13 May 2019 11:02:53 +0200
Message-ID: <mvmpnomohfm.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: [Qemu-devel] [PATCH] linux-user: Implement membarrier syscall
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 linux-user/syscall.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f5ff6f5dc8..80399f4eb0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -313,6 +313,9 @@ _syscall3(int, getrandom, void *, buf, size_t, buflen, unsigned int, flags)
 _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
           unsigned long, idx1, unsigned long, idx2)
 #endif
+#if defined(TARGET_NR_membarrier) && defined(__NR_membarrier)
+_syscall2(int, membarrier, int, cmd, int, flags)
+#endif
 
 static bitmask_transtbl fcntl_flags_tbl[] = {
   { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
@@ -11620,6 +11623,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         /* PowerPC specific.  */
         return do_swapcontext(cpu_env, arg1, arg2, arg3);
 #endif
+#if defined TARGET_NR_membarrier && defined __NR_membarrier
+    case TARGET_NR_membarrier:
+        return get_errno(membarrier(arg1, arg2));
+#endif
 
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
-- 
2.21.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

