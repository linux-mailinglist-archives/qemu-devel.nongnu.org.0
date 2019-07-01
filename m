Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9EE4E265
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 10:54:13 +0200 (CEST)
Received: from localhost ([::1]:55592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFJE-0008PW-7s
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 04:54:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58240)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEzZ-0004B9-1Z
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEoa-0001QR-HV
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:22:33 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41704)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEoa-0001Pr-Ax
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:22:32 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 80FDE540082;
 Fri, 21 Jun 2019 11:22:31 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:22:31 +0300
Message-ID: <156110535134.25431.18355326480887591547.stgit@pasha-Precision-3630-Tower>
In-Reply-To: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
References: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.1 20/24] replay: document development
 rules
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

This patch introduces docs/devel/replay.txt which describes the rules
that should be followed to make virtual devices usable in record/replay mode.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgauk@ispras.ru>

--

v9: fixed external virtual clock description (reported by Artem Pisarenko)
---
 docs/devel/replay.txt |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 docs/devel/replay.txt

diff --git a/docs/devel/replay.txt b/docs/devel/replay.txt
new file mode 100644
index 0000000000..e641c35add
--- /dev/null
+++ b/docs/devel/replay.txt
@@ -0,0 +1,46 @@
+Record/replay mechanism, that could be enabled through icount mode, expects
+the virtual devices to satisfy the following requirements.
+
+The main idea behind this document is that everything that affects
+the guest state during execution in icount mode should be deterministic.
+
+Timers
+======
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
+=============
+
+Bottom half callbacks, that affect the guest state, should be invoked through
+replay_bh_schedule_event or replay_bh_schedule_oneshot_event functions.
+Their invocations are saved in record mode and synchronized with the existing
+log in replay mode.
+
+Saving/restoring the VM state
+=============================
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
+===============
+
+Stopping the guest should not interfere with its state (with the exception
+of the network connections, that could be broken by the remote timeouts).
+VM can be stopped at any moment of replay by the user. Restarting the VM
+after that stop should not break the replay by the unneeded guest state change.


