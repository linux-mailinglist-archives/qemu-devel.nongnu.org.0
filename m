Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C904E2A0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:04:54 +0200 (CEST)
Received: from localhost ([::1]:55696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFTZ-0003AK-Nv
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:04:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58773)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEzc-0004Ud-Bz
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEnb-0000UL-Bv
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:21:33 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41414)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEnb-0000TO-5E
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:21:31 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 8FEEE540094;
 Fri, 21 Jun 2019 11:21:29 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:21:29 +0300
Message-ID: <156110528936.25431.18200323929081559117.stgit@pasha-Precision-3630-Tower>
In-Reply-To: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
References: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.1 09/24] replay: provide an accessor for
 rr filename
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

This patch adds an accessor function for the name of the record/replay
log file. Adding an accessor instead of making variable global,
prevents accidental modification of this variable by other modules.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 include/sysemu/replay.h |    2 ++
 replay/replay.c         |    5 +++++
 2 files changed, 7 insertions(+)

diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 3a7c58e423..b3f593f2f0 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -71,6 +71,8 @@ void replay_start(void);
 void replay_finish(void);
 /*! Adds replay blocker with the specified error description */
 void replay_add_blocker(Error *reason);
+/* Returns name of the replay log file */
+const char *replay_get_filename(void);
 
 /* Processing the instructions */
 
diff --git a/replay/replay.c b/replay/replay.c
index b75820a1c1..aa534116b5 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -394,3 +394,8 @@ void replay_add_blocker(Error *reason)
 {
     replay_blockers = g_slist_prepend(replay_blockers, reason);
 }
+
+const char *replay_get_filename(void)
+{
+    return replay_filename;
+}


