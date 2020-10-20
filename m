Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A46282579
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 19:17:11 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOl9i-00062y-JZ
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 13:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6i-00034Z-N3
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:14:04 -0400
Received: from mail.ispras.ru ([83.149.199.84]:36084)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kOl6g-0008Jy-Fb
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:14:04 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3C9D340A1DB0;
 Sat,  3 Oct 2020 17:13:56 +0000 (UTC)
Subject: [PATCH v7 12/14] replay: describe reverse debugging in docs/replay.txt
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Sat, 03 Oct 2020 20:13:55 +0300
Message-ID: <160174523509.12451.1409905901920738979.stgit@pasha-ThinkPad-X280>
In-Reply-To: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
References: <160174516520.12451.10785284392438702137.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/03 13:12:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This patch updates the documentation and describes usage of the reverse
debugging in QEMU+GDB.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--

v4 changes:
 - added an example of the command line for reverse debugging of
   the diskless machine
---
 docs/replay.txt |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/docs/replay.txt b/docs/replay.txt
index 70c27edb36..39fe5e9740 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -265,6 +265,16 @@ of the original disk image, use overlay files linked to the original images.
 Therefore all new snapshots (including the starting one) will be saved in
 overlays and the original image remains unchanged.
 
+When you need to use snapshots with diskless virtual machine,
+it must be started with 'orphan' qcow2 image. This image will be used
+for storing VM snapshots. Here is the example of the command line for this:
+
+  qemu-system-i386 -icount shift=3,rr=replay,rrfile=record.bin,rrsnapshot=init \
+    -net none -drive file=empty.qcow2,if=none,id=rr
+
+empty.qcow2 drive does not connected to any virtual block device and used
+for VM snapshots only.
+
 Network devices
 ---------------
 
@@ -294,6 +304,42 @@ for recording and replaying must contain identical number of ports in record
 and replay modes, but their backends may differ.
 E.g., '-serial stdio' in record mode, and '-serial null' in replay mode.
 
+Reverse debugging
+-----------------
+
+Reverse debugging allows "executing" the program in reverse direction.
+GDB remote protocol supports "reverse step" and "reverse continue"
+commands. The first one steps single instruction backwards in time,
+and the second one finds the last breakpoint in the past.
+
+Recorded executions may be used to enable reverse debugging. QEMU can't
+execute the code in backwards direction, but can load a snapshot and
+replay forward to find the desired position or breakpoint.
+
+The following GDB commands are supported:
+ - reverse-stepi (or rsi) - step one instruction backwards
+ - reverse-continue (or rc) - find last breakpoint in the past
+
+Reverse step loads the nearest snapshot and replays the execution until
+the required instruction is met.
+
+Reverse continue may include several passes of examining the execution
+between the snapshots. Each of the passes include the following steps:
+ 1. loading the snapshot
+ 2. replaying to examine the breakpoints
+ 3. if breakpoint or watchpoint was met
+    - loading the snaphot again
+    - replaying to the required breakpoint
+ 4. else
+    - proceeding to the p.1 with the earlier snapshot
+
+Therefore usage of the reverse debugging requires at least one snapshot
+created in advance. This can be done by omitting 'snapshot' option
+for the block drives and adding 'rrsnapshot' for both record and replay
+command lines.
+See the "Snapshotting" section to learn more about running record/replay
+and creating the snapshot in these modes.
+
 Replay log format
 -----------------
 


