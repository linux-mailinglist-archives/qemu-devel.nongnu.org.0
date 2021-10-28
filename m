Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6943E047
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:53:56 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg3yk-0003Xu-Np
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tM-0001CG-LA
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45554)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tL-0002Rq-4e
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:20 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9169440755D4;
 Thu, 28 Oct 2021 11:48:17 +0000 (UTC)
Subject: [PATCH 3/4] softmmu: fix for "after access" watchpoints
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 28 Oct 2021 14:48:17 +0300
Message-ID: <163542169727.2127597.8141772572696627329.stgit@pasha-ThinkPad-X280>
In-Reply-To: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, david@redhat.com, richard.henderson@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Watchpoints that should fire after the memory access
break an execution of the current block, try to
translate current instruction into the separate block,
which then causes debug interrupt.
But cpu_interrupt can't be called in such block when
icount is enabled, because interrupts muse be allowed
explicitly.
This patch sets CF_LAST_IO flag for retranslated block,
allowing interrupt request for the last instruction.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 softmmu/physmem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 94eda44459..482d80708f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -946,7 +946,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 cpu_loop_exit(cpu);
             } else {
                 /* Force execution of one insn next time.  */
-                cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+                cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
                 mmap_unlock();
                 cpu_loop_exit_noexc(cpu);
             }


