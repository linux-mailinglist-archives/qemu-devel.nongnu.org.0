Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA144D486
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:58:33 +0100 (CET)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6qm-0004cV-Jb
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6ne-0007L2-H5
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:19 -0500
Received: from mail.ispras.ru ([83.149.199.84]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml6nb-0008Oh-VS
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:55:17 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7E03840A2BC1;
 Thu, 11 Nov 2021 09:55:14 +0000 (UTC)
Subject: [PATCH v2 2/3] softmmu: fix watchpoint-interrupt races
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Nov 2021 12:55:14 +0300
Message-ID: <163662451431.125458.14945698834107669531.stgit@pasha-ThinkPad-X280>
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

Watchpoint may be processed in two phases. First one is detecting
the instruction with target memory access. And the second one is
executing only one instruction and setting the debug interrupt flag.
Hardware interrupts can break this sequence when they happen after
the first watchpoint phase.
This patch postpones the interrupt request until watchpoint is
processed.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 accel/tcg/cpu-exec.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index df12452b8f..e4526c2f5e 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -742,6 +742,11 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             qemu_mutex_unlock_iothread();
             return true;
         }
+        /* Process watchpoints first, or interrupts will ruin everything */
+        if (cpu->watchpoint_hit) {
+            qemu_mutex_unlock_iothread();
+            return false;
+        }
 #if !defined(CONFIG_USER_ONLY)
         if (replay_mode == REPLAY_MODE_PLAY && !replay_has_interrupt()) {
             /* Do nothing */


