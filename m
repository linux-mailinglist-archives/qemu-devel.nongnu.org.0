Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9803044D478
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:57:08 +0100 (CET)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6pP-0001Dd-Px
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:57:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6nt-0007Rh-J6
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:35 -0500
Received: from mail.ispras.ru ([83.149.199.84]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6ni-0008T4-7j
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:32 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id E7B7D40A2BC1;
 Thu, 11 Nov 2021 09:55:19 +0000 (UTC)
Subject: [PATCH v2 3/3] softmmu: fix watchpoints on memory used by vCPU
 internals
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Nov 2021 12:55:19 +0300
Message-ID: <163662451972.125458.8046031260136838656.stgit@pasha-ThinkPad-X280>
In-Reply-To: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, david@redhat.com, richard.henderson@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When vCPU processes interrupt request or exception, it can save
register values to the memory. Watchpoints may also be set on
these memory cells. In this case watchpoint processing code should
not retranslate the block which accessed the memory, because there
is no such block at all. "After access" watchpoint also can't be
used in such case.
This patch adds some conditions to prevent failures when watchpoint
is set on memory used for saving the registers on interrupt request.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 softmmu/physmem.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 314f8b439c..53edcf9a51 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -886,6 +886,14 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
 
     assert(tcg_enabled());
     if (cpu->watchpoint_hit) {
+        if (!ra) {
+            /*
+             * Another memory access after hitting the watchpoint.
+             * There is no translation block and interrupt request
+             * is already set.
+             */
+            return;
+        }
         /*
          * We re-entered the check after replacing the TB.
          * Now raise the debug interrupt so that it will
@@ -936,6 +944,12 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 continue;
             }
             cpu->watchpoint_hit = wp;
+            if (!ra) {
+                /* We're not in the TB, can't stop before the access. */
+                g_assert(!(wp->flags & BP_STOP_BEFORE_ACCESS));
+                cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
+                return;
+            }
 
             mmap_lock();
             /* This call also restores vCPU state */


