Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF5144D477
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:56:59 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6pG-0000sA-RI
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:56:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6nZ-0007JN-Ci
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:14 -0500
Received: from mail.ispras.ru ([83.149.199.84]:44968)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6nX-0008OB-Dv
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:13 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1D48740755CE;
 Thu, 11 Nov 2021 09:55:09 +0000 (UTC)
Subject: [PATCH v2 1/3] icount: preserve cflags when custom tb is about to
 execute
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Nov 2021 12:55:08 +0300
Message-ID: <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
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
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: pavel.dovgalyuk@ispras.ru, david@redhat.com, richard.henderson@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When debugging with the watchpoints, qemu may need to create
TB with single instruction. This is achieved by setting cpu->cflags_next_tb.
But when this block is about to execute, it may be interrupted by another
thread. In this case cflags will be lost and next executed TB will not
be the special one.
This patch checks TB exit reason and restores cflags_next_tb to allow
finding the interrupted block.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 accel/tcg/cpu-exec.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2d14d02f6c..df12452b8f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -846,6 +846,16 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
          * cpu_handle_interrupt.  cpu_handle_interrupt will also
          * clear cpu->icount_decr.u16.high.
          */
+        if (cpu->cflags_next_tb == -1
+            && (!use_icount || !(tb->cflags & CF_USE_ICOUNT)
+                || cpu_neg(cpu)->icount_decr.u16.low >= tb->icount)) {
+            /*
+             * icount is disabled or there are enough instructions
+             * in the budget, do not retranslate this block with
+             * different parameters.
+             */
+            cpu->cflags_next_tb = tb->cflags;
+        }
         return;
     }
 


