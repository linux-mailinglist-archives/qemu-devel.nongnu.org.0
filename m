Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58E4E255
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 10:47:17 +0200 (CEST)
Received: from localhost ([::1]:55564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFCW-0003lp-Tj
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 04:47:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEza-0004B8-5M
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEoP-0001FQ-CI
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:22:22 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41636)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEoP-0001EU-5v
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:22:21 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4BBC7540082;
 Fri, 21 Jun 2019 11:22:20 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:22:20 +0300
Message-ID: <156110534010.25431.470716625287653564.stgit@pasha-Precision-3630-Tower>
In-Reply-To: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
References: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.1 18/24] replay: describe reverse
 debugging in docs/replay.txt
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com, quintela@redhat.com, ciro.santilli@gmail.com,
 jasowang@redhat.com, crosthwaite.peter@gmail.com, armbru@redhat.com,
 mreitz@redhat.com, alex.bennee@linaro.org, maria.klimushenkova@ispras.ru,
 mst@redhat.com, kraxel@redhat.com, boost.lists@gmail.com,
 thomas.dullien@googlemail.com, dovgaluk@ispras.ru, artem.k.pisarenko@gmail.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This patch updates the documentation and describes usage of the reverse
debugging in QEMU+GDB.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 docs/replay.txt |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/docs/replay.txt b/docs/replay.txt
index ce97c3f72f..47b4f2d9f8 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -293,6 +293,39 @@ for recording and replaying must contain identical number of ports in record
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
+created in advance. See the "Snapshotting" section to learn about running
+record/replay and creating the snapshot in these modes.
+
 Replay log format
 -----------------
 


