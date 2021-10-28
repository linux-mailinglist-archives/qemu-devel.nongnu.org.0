Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5346C43E050
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:56:13 +0200 (CEST)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg40x-0006pf-QD
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tL-0001Bw-CH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45498)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tE-0002Pq-TB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:17 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id A5BD340A2BDD;
 Thu, 28 Oct 2021 11:48:05 +0000 (UTC)
Subject: [PATCH 1/4] softmmu: fix watchpoint processing in icount mode
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 28 Oct 2021 14:48:05 +0300
Message-ID: <163542168516.2127597.8781375223437124644.stgit@pasha-ThinkPad-X280>
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

Watchpoint processing code restores vCPU state twice:
in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
Normally it does not affect anything, but in icount mode instruction
counter is incremented twice and becomes incorrect.
This patch eliminates unneeded CPU state restore.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 softmmu/physmem.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f67ad29981..fd1b3b2088 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -938,18 +938,16 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 cpu->watchpoint_hit = wp;
 
                 mmap_lock();
+                /* This call also restores vCPU state */
                 tb_check_watchpoint(cpu, ra);
                 if (wp->flags & BP_STOP_BEFORE_ACCESS) {
                     cpu->exception_index = EXCP_DEBUG;
                     mmap_unlock();
-                    cpu_loop_exit_restore(cpu, ra);
+                    cpu_loop_exit(cpu);
                 } else {
                     /* Force execution of one insn next time.  */
                     cpu->cflags_next_tb = 1 | curr_cflags(cpu);
                     mmap_unlock();
-                    if (ra) {
-                        cpu_restore_state(cpu, ra, true);
-                    }
                     cpu_loop_exit_noexc(cpu);
                 }
             }


