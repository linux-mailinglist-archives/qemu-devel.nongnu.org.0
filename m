Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC7870321
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 17:08:06 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpZv3-0006rv-UQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 11:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44829)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hpZuS-0005Mu-To
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hpZuQ-0002gH-Mr
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hpZuQ-0002fs-E1
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B9CCF2C9700;
 Mon, 22 Jul 2019 15:07:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-221.ams2.redhat.com
 [10.36.117.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E264544EE;
 Mon, 22 Jul 2019 15:07:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	pavel.dovgaluk@ispras.ru
Date: Mon, 22 Jul 2019 16:07:16 +0100
Message-Id: <20190722150717.10564-3-dgilbert@redhat.com>
In-Reply-To: <20190722150717.10564-1-dgilbert@redhat.com>
References: <20190722150717.10564-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 22 Jul 2019 15:07:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [for 4.2 PATCH 2/3] timer: Remove reset notifiers
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Remove the reset notifer from the core qemu-timer code.
The only user was mc146818 and we've just remove it's use.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/qemu/timer.h | 22 ----------------------
 util/qemu-timer.c    | 21 +--------------------
 2 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 5d978e1634..6817c78ef4 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -227,28 +227,6 @@ void qemu_clock_enable(QEMUClockType type, bool enab=
led);
  */
 void qemu_start_warp_timer(void);
=20
-/**
- * qemu_clock_register_reset_notifier:
- * @type: the clock type
- * @notifier: the notifier function
- *
- * Register a notifier function to call when the clock
- * concerned is reset.
- */
-void qemu_clock_register_reset_notifier(QEMUClockType type,
-                                        Notifier *notifier);
-
-/**
- * qemu_clock_unregister_reset_notifier:
- * @type: the clock type
- * @notifier: the notifier function
- *
- * Unregister a notifier function to call when the clock
- * concerned is reset.
- */
-void qemu_clock_unregister_reset_notifier(QEMUClockType type,
-                                          Notifier *notifier);
-
 /**
  * qemu_clock_run_timers:
  * @type: clock on which to operate
diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 1cc1b2f2c3..2faaaf9926 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -48,7 +48,6 @@ typedef struct QEMUClock {
     /* We rely on BQL to protect the timerlists */
     QLIST_HEAD(, QEMUTimerList) timerlists;
=20
-    NotifierList reset_notifiers;
     int64_t last;
=20
     QEMUClockType type;
@@ -133,7 +132,6 @@ static void qemu_clock_init(QEMUClockType type, QEMUT=
imerListNotifyCB *notify_cb
     clock->enabled =3D (type =3D=3D QEMU_CLOCK_VIRTUAL ? false : true);
     clock->last =3D INT64_MIN;
     QLIST_INIT(&clock->timerlists);
-    notifier_list_init(&clock->reset_notifiers);
     main_loop_tlg.tl[type] =3D timerlist_new(type, notify_cb, NULL);
 }
=20
@@ -630,7 +628,7 @@ int64_t timerlistgroup_deadline_ns(QEMUTimerListGroup=
 *tlg)
=20
 int64_t qemu_clock_get_ns(QEMUClockType type)
 {
-    int64_t now, last;
+    int64_t now;
     QEMUClock *clock =3D qemu_clock_ptr(type);
=20
     switch (type) {
@@ -645,11 +643,7 @@ int64_t qemu_clock_get_ns(QEMUClockType type)
         }
     case QEMU_CLOCK_HOST:
         now =3D REPLAY_CLOCK(REPLAY_CLOCK_HOST, get_clock_realtime());
-        last =3D clock->last;
         clock->last =3D now;
-        if (now < last || now > (last + get_max_clock_jump())) {
-            notifier_list_notify(&clock->reset_notifiers, &now);
-        }
         return now;
     case QEMU_CLOCK_VIRTUAL_RT:
         return REPLAY_CLOCK(REPLAY_CLOCK_VIRTUAL_RT, cpu_get_clock());
@@ -668,19 +662,6 @@ void qemu_clock_set_last(QEMUClockType type, uint64_=
t last)
     clock->last =3D last;
 }
=20
-void qemu_clock_register_reset_notifier(QEMUClockType type,
-                                        Notifier *notifier)
-{
-    QEMUClock *clock =3D qemu_clock_ptr(type);
-    notifier_list_add(&clock->reset_notifiers, notifier);
-}
-
-void qemu_clock_unregister_reset_notifier(QEMUClockType type,
-                                          Notifier *notifier)
-{
-    notifier_remove(notifier);
-}
-
 void init_clocks(QEMUTimerListNotifyCB *notify_cb)
 {
     QEMUClockType type;
--=20
2.21.0


