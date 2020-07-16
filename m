Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F3222C12
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 21:43:31 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw9mz-0005r6-3w
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 15:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1jw9je-0005FF-LF
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 15:40:02 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:36864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1jw9jc-0002j8-IQ
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 15:40:02 -0400
Received: from michell-laptop.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 368B0219CA;
 Thu, 16 Jul 2020 19:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1594928397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8yKJ3PFfRI1+4hdxMcLpTHdA+dqcY8u/Hk+IgJron20=;
 b=Nn08U9gskGvg6smP/O8ft5DnS3ptuncHzyICAaPYg7i4TUiaNGGUg3egxQckIv3moBk/bV
 r+7APE2D3gcXyRmCzq7j4ZGDcvB+7TowZRuxQ0oapsFBLvREiOCPvcMEW9VEHb+xa2+X0i
 h0h75GljY9fz6oSF5gOk4fExOOvQrw8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: [PATCH v2] tcg/cpu-exec: precise single-stepping after an exception
Date: Thu, 16 Jul 2020 21:39:47 +0200
Message-Id: <20200716193947.3058389-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 15:39:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When single-stepping with a debugger attached to QEMU, and when an
exception is raised, the debugger misses the first instruction after the
exception:

$ qemu-system-aarch64 -M virt -display none -cpu cortex-a53 -s -S

$ aarch64-linux-gnu-gdb
GNU gdb (GDB) 9.2
[...]
(gdb) tar rem :1234
Remote debugging using :1234
warning: No executable has been specified and target does not support
determining executable automatically.  Try using the "file" command.
0x0000000000000000 in ?? ()
(gdb) # writing nop insns to 0x200 and 0x204
(gdb) set *0x200 = 0xd503201f
(gdb) set *0x204 = 0xd503201f
(gdb) # 0x0 address contains 0 which is an invalid opcode.
(gdb) # The CPU should raise an exception and jump to 0x200
(gdb) si
0x0000000000000204 in ?? ()

With this commit, the same run steps correctly on the first instruction
of the exception vector:

(gdb) si
0x0000000000000200 in ?? ()

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
v2:
  - remove RFC tag
  - inline the recursive call to cpu_handle_exception [Richard]
---
 accel/tcg/cpu-exec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d95c4848a4..59b1b5fe76 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -502,10 +502,22 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
             CPUClass *cc = CPU_GET_CLASS(cpu);
             qemu_mutex_lock_iothread();
             cc->do_interrupt(cpu);
             qemu_mutex_unlock_iothread();
             cpu->exception_index = -1;
+
+            if (unlikely(cpu->singlestep_enabled)) {
+                /*
+                 * After processing the exception, ensure an EXCP_DEBUG is
+                 * raised when single-stepping so that GDB doesn't miss the
+                 * next instruction.
+                 */
+                *ret = EXCP_DEBUG;
+                cpu_handle_debug_exception(cpu);
+                return true;
+            }
+
         } else if (!replay_has_interrupt()) {
             /* give a chance to iothread in replay mode */
             *ret = EXCP_INTERRUPT;
             return true;
         }
-- 
2.27.0


