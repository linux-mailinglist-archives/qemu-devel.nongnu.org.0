Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A74E2A4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:07:33 +0200 (CEST)
Received: from localhost ([::1]:55722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFW8-000608-GY
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:07:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEzd-0004Ue-PM
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:33:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEnJ-0000Hj-Mn
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:21:14 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41336)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEnJ-0000HL-FR
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:21:13 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 50B31540093;
 Fri, 21 Jun 2019 11:21:12 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:21:12 +0300
Message-ID: <156110527210.25431.7121967728273636187.stgit@pasha-Precision-3630-Tower>
In-Reply-To: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
References: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.1 06/24] replay: finish record/replay
 before closing the disks
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

After recent updates block devices cannot be closed on qemu exit.
This happens due to the block request polling when replay is not finished.
Therefore now we stop execution recording before closing the block devices.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
---
 replay/replay.c |    2 ++
 vl.c            |    1 +
 2 files changed, 3 insertions(+)

diff --git a/replay/replay.c b/replay/replay.c
index 8b172b2d1b..b75820a1c1 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -385,6 +385,8 @@ void replay_finish(void)
     g_free(replay_snapshot);
     replay_snapshot = NULL;
 
+    replay_mode = REPLAY_MODE_NONE;
+
     replay_finish_events();
 }
 
diff --git a/vl.c b/vl.c
index 8fcfd905ee..4543fdab25 100644
--- a/vl.c
+++ b/vl.c
@@ -4562,6 +4562,7 @@ int main(int argc, char **argv, char **envp)
 
     /* No more vcpu or device emulation activity beyond this point */
     vm_shutdown();
+    replay_finish();
 
     job_cancel_sync_all();
     bdrv_close_all();


