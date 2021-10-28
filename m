Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF743E059
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:58:49 +0200 (CEST)
Received: from localhost ([::1]:59476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg43T-0002kE-OS
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tL-0001By-Er
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45532)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tF-0002RM-Fs
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:19 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id F1FAC40594EB;
 Thu, 28 Oct 2021 11:48:11 +0000 (UTC)
Subject: [PATCH 2/4] softmmu: remove useless condition in watchpoint check
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 28 Oct 2021 14:48:10 +0300
Message-ID: <163542169094.2127597.8801843697434113110.stgit@pasha-ThinkPad-X280>
In-Reply-To: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

cpu_check_watchpoint function checks cpu->watchpoint_hit at the entry.
But then it also does the same in the middle of the function,
while this field can't change.
That is why this patch removes this useless condition.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 softmmu/physmem.c |   41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index fd1b3b2088..94eda44459 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -929,27 +929,26 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
             }
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
-            if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
-                    !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
-                    wp->flags &= ~BP_WATCHPOINT_HIT;
-                    continue;
-                }
-                cpu->watchpoint_hit = wp;
-
-                mmap_lock();
-                /* This call also restores vCPU state */
-                tb_check_watchpoint(cpu, ra);
-                if (wp->flags & BP_STOP_BEFORE_ACCESS) {
-                    cpu->exception_index = EXCP_DEBUG;
-                    mmap_unlock();
-                    cpu_loop_exit(cpu);
-                } else {
-                    /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags(cpu);
-                    mmap_unlock();
-                    cpu_loop_exit_noexc(cpu);
-                }
+
+            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
+                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
+                wp->flags &= ~BP_WATCHPOINT_HIT;
+                continue;
+            }
+            cpu->watchpoint_hit = wp;
+
+            mmap_lock();
+            /* This call also restores vCPU state */
+            tb_check_watchpoint(cpu, ra);
+            if (wp->flags & BP_STOP_BEFORE_ACCESS) {
+                cpu->exception_index = EXCP_DEBUG;
+                mmap_unlock();
+                cpu_loop_exit(cpu);
+            } else {
+                /* Force execution of one insn next time.  */
+                cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+                mmap_unlock();
+                cpu_loop_exit_noexc(cpu);
             }
         } else {
             wp->flags &= ~BP_WATCHPOINT_HIT;


