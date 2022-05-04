Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE9519D52
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:49:49 +0200 (CEST)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCZo-0006Gr-DU
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTd-0005HC-7F
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:21 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37154)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTb-0006FM-BG
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:20 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id A31764076253;
 Wed,  4 May 2022 09:39:17 +0000 (UTC)
Subject: [PATCH v2 5/9] docs: convert docs/devel/replay page to rst
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, pbonzini@redhat.com, alex.bennee@linaro.org,
 crosa@redhat.com, f4bug@amsat.org
Date: Wed, 04 May 2022 12:39:16 +0300
Message-ID: <165165715623.1062896.8504410349905427619.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
References: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch converts prior .txt replay devel documentation to .rst.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/index-tcg.rst |    1 +
 docs/devel/replay.rst    |   54 ++++++++++++++++++++++++++++++++++++++++++++++
 docs/devel/replay.txt    |   46 ---------------------------------------
 3 files changed, 55 insertions(+), 46 deletions(-)
 create mode 100644 docs/devel/replay.rst
 delete mode 100644 docs/devel/replay.txt

diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
index 0b0ad12c22..7b9760b26f 100644
--- a/docs/devel/index-tcg.rst
+++ b/docs/devel/index-tcg.rst
@@ -13,3 +13,4 @@ are only implementing things for HW accelerated hypervisors.
    multi-thread-tcg
    tcg-icount
    tcg-plugins
+   replay
diff --git a/docs/devel/replay.rst b/docs/devel/replay.rst
new file mode 100644
index 0000000000..dd8bf3b195
--- /dev/null
+++ b/docs/devel/replay.rst
@@ -0,0 +1,54 @@
+..
+   Copyright (c) 2022, ISP RAS
+   Written by Pavel Dovgalyuk
+
+=======================
+Execution Record/Replay
+=======================
+
+Record/replay mechanism, that could be enabled through icount mode, expects
+the virtual devices to satisfy the following requirements.
+
+The main idea behind this document is that everything that affects
+the guest state during execution in icount mode should be deterministic.
+
+Timers
+------
+
+All virtual devices should use virtual clock for timers that change the guest
+state. Virtual clock is deterministic, therefore such timers are deterministic
+too.
+
+Virtual devices can also use realtime clock for the events that do not change
+the guest state directly. When the clock ticking should depend on VM execution
+speed, use virtual clock with EXTERNAL attribute. It is not deterministic,
+but its speed depends on the guest execution. This clock is used by
+the virtual devices (e.g., slirp routing device) that lie outside the
+replayed guest.
+
+Bottom halves
+-------------
+
+Bottom half callbacks, that affect the guest state, should be invoked through
+replay_bh_schedule_event or replay_bh_schedule_oneshot_event functions.
+Their invocations are saved in record mode and synchronized with the existing
+log in replay mode.
+
+Saving/restoring the VM state
+-----------------------------
+
+All fields in the device state structure (including virtual timers)
+should be restored by loadvm to the same values they had before savevm.
+
+Avoid accessing other devices' state, because the order of saving/restoring
+is not defined. It means that you should not call functions like
+'update_irq' in post_load callback. Save everything explicitly to avoid
+the dependencies that may make restoring the VM state non-deterministic.
+
+Stopping the VM
+---------------
+
+Stopping the guest should not interfere with its state (with the exception
+of the network connections, that could be broken by the remote timeouts).
+VM can be stopped at any moment of replay by the user. Restarting the VM
+after that stop should not break the replay by the unneeded guest state change.
diff --git a/docs/devel/replay.txt b/docs/devel/replay.txt
deleted file mode 100644
index e641c35add..0000000000
--- a/docs/devel/replay.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Record/replay mechanism, that could be enabled through icount mode, expects
-the virtual devices to satisfy the following requirements.
-
-The main idea behind this document is that everything that affects
-the guest state during execution in icount mode should be deterministic.
-
-Timers
-======
-
-All virtual devices should use virtual clock for timers that change the guest
-state. Virtual clock is deterministic, therefore such timers are deterministic
-too.
-
-Virtual devices can also use realtime clock for the events that do not change
-the guest state directly. When the clock ticking should depend on VM execution
-speed, use virtual clock with EXTERNAL attribute. It is not deterministic,
-but its speed depends on the guest execution. This clock is used by
-the virtual devices (e.g., slirp routing device) that lie outside the
-replayed guest.
-
-Bottom halves
-=============
-
-Bottom half callbacks, that affect the guest state, should be invoked through
-replay_bh_schedule_event or replay_bh_schedule_oneshot_event functions.
-Their invocations are saved in record mode and synchronized with the existing
-log in replay mode.
-
-Saving/restoring the VM state
-=============================
-
-All fields in the device state structure (including virtual timers)
-should be restored by loadvm to the same values they had before savevm.
-
-Avoid accessing other devices' state, because the order of saving/restoring
-is not defined. It means that you should not call functions like
-'update_irq' in post_load callback. Save everything explicitly to avoid
-the dependencies that may make restoring the VM state non-deterministic.
-
-Stopping the VM
-===============
-
-Stopping the guest should not interfere with its state (with the exception
-of the network connections, that could be broken by the remote timeouts).
-VM can be stopped at any moment of replay by the user. Restarting the VM
-after that stop should not break the replay by the unneeded guest state change.


