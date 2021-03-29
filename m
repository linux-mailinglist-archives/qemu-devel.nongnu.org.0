Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC434C569
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 10:00:46 +0200 (CEST)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQmpJ-0001Hh-4L
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 04:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQmoC-0000pd-FY
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:59:36 -0400
Received: from mail.ispras.ru ([83.149.199.84]:56664)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQmoA-0005X4-8b
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:59:36 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 55E3C40755CC;
 Mon, 29 Mar 2021 07:59:25 +0000 (UTC)
Subject: [PATCH] replay: fix recursive checkpoints
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 29 Mar 2021 10:59:25 +0300
Message-ID: <161700476500.1140362.10108444973730452257.stgit@pasha-ThinkPad-X280>
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record/replay uses checkpoints to synchronize the execution
of the threads and timers. Hardware events such as BH are
processed at the checkpoints too.
Event processing can cause refreshing the virtual timers
and calling the icount-related functions, that also use checkpoints.
This patch prevents recursive processing of such checkpoints,
because they have their own records in the log and should be
processed later.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 replay/replay.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/replay/replay.c b/replay/replay.c
index c806fec69a..6df2abc18c 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -180,12 +180,13 @@ bool replay_checkpoint(ReplayCheckpoint checkpoint)
     }
 
     if (in_checkpoint) {
-        /* If we are already in checkpoint, then there is no need
-           for additional synchronization.
+        /*
            Recursion occurs when HW event modifies timers.
-           Timer modification may invoke the checkpoint and
-           proceed to recursion. */
-        return true;
+           Prevent performing icount warp in this case and
+           wait for another invocation of the checkpoint.
+        */
+        g_assert(replay_mode == REPLAY_MODE_PLAY);
+        return false;
     }
     in_checkpoint = true;
 


