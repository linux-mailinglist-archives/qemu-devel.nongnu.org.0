Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B2243E04A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:54:28 +0200 (CEST)
Received: from localhost ([::1]:50308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg3zF-0004xW-PC
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tS-0001EC-S4
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:28 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mg3tQ-0002ST-Tl
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:48:26 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5C72340D403D;
 Thu, 28 Oct 2021 11:48:23 +0000 (UTC)
Subject: [PATCH 4/4] icount: preserve cflags when custom tb is about to execute
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 28 Oct 2021 14:48:22 +0300
Message-ID: <163542170287.2127597.18369415404458239885.stgit@pasha-ThinkPad-X280>
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
index c9764c1325..af1c6e6ba3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -842,6 +842,16 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
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
 


