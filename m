Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7F1262C5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 14:00:55 +0100 (CET)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihvQD-0005nc-Kd
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 08:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1ihvCV-0003dw-JU
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1ihvCT-0003GQ-In
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:46:42 -0500
Received: from mail.ispras.ru ([83.149.199.45]:35256)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1ihvCT-0003D9-8T
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:46:41 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id DF007540022;
 Thu, 19 Dec 2019 15:46:28 +0300 (MSK)
Subject: [PATCH] replay: check other timers for icount limit
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 Dec 2019 15:46:28 +0300
Message-ID: <157675958855.14346.18049977447896411847.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 83.149.199.45
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
Cc: pbonzini@redhat.com, dovgaluk@ispras.ru, pavel.dovgaluk@ispras.ru,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record/replay can stall when there are no virtual devices that generate
events - it just uses all the time for vCPU thread. Therefore main loop
has to wait too much for the vCPU thread, because they are synchronized
in rr mode.
This patch does not let creating too long vCPU executions without
interrupting to main loop. It checks realtime timers that always exits
to control user input.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 cpus.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/cpus.c b/cpus.c
index 63bda152f5..7dba4fa414 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1388,6 +1388,10 @@ static int64_t tcg_get_icount_limit(void)
          */
         deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                               QEMU_TIMER_ATTR_ALL);
+        /* Check realtime timers, because they help with input processing */
+        deadline = qemu_soonest_timeout(deadline,
+                qemu_clock_deadline_ns_all(QEMU_CLOCK_REALTIME,
+                                           QEMU_TIMER_ATTR_ALL));
 
         /* Maintain prior (possibly buggy) behaviour where if no deadline
          * was set (as there is no QEMU_CLOCK_VIRTUAL timer) or it is more than


