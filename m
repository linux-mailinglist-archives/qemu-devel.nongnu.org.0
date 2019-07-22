Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755D70320
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 17:08:02 +0200 (CEST)
Received: from localhost ([::1]:34414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpZuy-0006Ra-Nu
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 11:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44817)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hpZuP-0005B7-M0
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hpZuO-0002ep-N8
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39559)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hpZuO-0002eC-Hr
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D925830821A0;
 Mon, 22 Jul 2019 15:07:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-221.ams2.redhat.com
 [10.36.117.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4345544EE;
 Mon, 22 Jul 2019 15:07:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	pavel.dovgaluk@ispras.ru
Date: Mon, 22 Jul 2019 16:07:15 +0100
Message-Id: <20190722150717.10564-2-dgilbert@redhat.com>
In-Reply-To: <20190722150717.10564-1-dgilbert@redhat.com>
References: <20190722150717.10564-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 22 Jul 2019 15:07:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [for 4.2 PATCH 1/3] mc146818rtc: Remove reset notifiers
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

The reset notifiers are unreliable and recalculating the offsets
after boot causes problems with migration in cases where explicit
base times are set on the destination.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/timer/mc146818rtc.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index ce4550b6f2..352ff9d395 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -92,7 +92,6 @@ typedef struct RTCState {
     uint32_t irq_coalesced;
     uint32_t period;
     QEMUTimer *coalesced_timer;
-    Notifier clock_reset_notifier;
     LostTickPolicy lost_tick_policy;
     Notifier suspend_notifier;
     QLIST_ENTRY(RTCState) link;
@@ -885,20 +884,6 @@ static const VMStateDescription vmstate_rtc =3D {
     }
 };
=20
-static void rtc_notify_clock_reset(Notifier *notifier, void *data)
-{
-    RTCState *s =3D container_of(notifier, RTCState, clock_reset_notifie=
r);
-    int64_t now =3D *(int64_t *)data;
-
-    rtc_set_date_from_host(ISA_DEVICE(s));
-    periodic_timer_update(s, now, 0);
-    check_update_timer(s);
-
-    if (s->lost_tick_policy =3D=3D LOST_TICK_POLICY_SLEW) {
-        rtc_coalesced_timer_update(s);
-    }
-}
-
 /* set CMOS shutdown status register (index 0xF) as S3_resume(0xFE)
    BIOS will read it and start S3 resume at POST Entry */
 static void rtc_notify_suspend(Notifier *notifier, void *data)
@@ -984,10 +969,6 @@ static void rtc_realizefn(DeviceState *dev, Error **=
errp)
     s->update_timer =3D timer_new_ns(rtc_clock, rtc_update_timer, s);
     check_update_timer(s);
=20
-    s->clock_reset_notifier.notify =3D rtc_notify_clock_reset;
-    qemu_clock_register_reset_notifier(rtc_clock,
-                                       &s->clock_reset_notifier);
-
     s->suspend_notifier.notify =3D rtc_notify_suspend;
     qemu_register_suspend_notifier(&s->suspend_notifier);
=20
--=20
2.21.0


