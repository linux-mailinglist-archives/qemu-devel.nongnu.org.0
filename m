Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09436CBAA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 11:18:34 +0200 (CEST)
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho2Yb-0007ER-MS
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 05:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1ho2Y5-0005j6-AL
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:18:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1ho2Y4-00084z-5x
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:18:01 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:43462)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
 id 1ho2Y3-00081z-H6
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:18:00 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 4DB602E14CE;
 Thu, 18 Jul 2019 12:17:54 +0300 (MSK)
Received: from smtpcorp1p.mail.yandex.net (smtpcorp1p.mail.yandex.net
 [2a02:6b8:0:1472:2741:0:8b6:10])
 by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 QL6cuQh7BN-Hrt4dw2W; Thu, 18 Jul 2019 12:17:54 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1563441474; bh=6vm/tvcGqZqYrL0pivEHJIBSrkUhSvvB9qfJPKUmrp0=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=idsM6fKL2wweoIXEsld6+OawaeSvyNmuiAEL8/rZ/ApImX2PwNCGJKb3c8SDXiZG2
 1P7cjo7CWGJrV4fjJtZ7pAE+r/WIZuS40yK7PO4urh+hcCcxMCPfS1pDggcFJQo/0t
 Vvm74Q5+vzSwZWJ9XHBAP9aLvZOXnpeG+5LT6aS0=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:9028:49c4:6359:9be1])
 by smtpcorp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 JhNdbP5MZj-HrwqSYlc; Thu, 18 Jul 2019 12:17:53 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Thu, 18 Jul 2019 12:17:25 +0300
Message-Id: <20190718091726.9874-3-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190718091726.9874-1-yury-kotov@yandex-team.ru>
References: <20190718091726.9874-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1a2d::193
Subject: [Qemu-devel] [PATCH v3 2/3] cpus: Fix throttling during vm_stop
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:Overall" <qemu-devel@nongnu.org>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Throttling thread sleeps in VCPU thread. For high throttle percentage
this sleep is more than 10ms. E.g. for 60% - 15ms, for 99% - 990ms.
vm_stop() kicks all VCPUs and waits for them. It's called at the end of
migration and because of the long sleep the migration downtime might be
more than 100ms even for downtime-limit 1ms.
Use qemu_cond_timedwait for high percentage to wake up during vm_stop.

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
---
 cpus.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/cpus.c b/cpus.c
index 927a00aa90..3baedd554c 100644
--- a/cpus.c
+++ b/cpus.c
@@ -74,6 +74,8 @@
=20
 #endif /* CONFIG_LINUX */
=20
+static QemuMutex qemu_global_mutex;
+
 int64_t max_delay;
 int64_t max_advance;
=20
@@ -777,7 +779,7 @@ static void cpu_throttle_thread(CPUState *cpu, run_on=
_cpu_data opaque)
 {
     double pct;
     double throttle_ratio;
-    long sleeptime_ns;
+    int64_t sleeptime_ns;
=20
     if (!cpu_throttle_get_percentage()) {
         return;
@@ -785,11 +787,22 @@ static void cpu_throttle_thread(CPUState *cpu, run_=
on_cpu_data opaque)
=20
     pct =3D (double)cpu_throttle_get_percentage()/100;
     throttle_ratio =3D pct / (1 - pct);
-    sleeptime_ns =3D (long)(throttle_ratio * CPU_THROTTLE_TIMESLICE_NS);
-
-    qemu_mutex_unlock_iothread();
-    g_usleep(sleeptime_ns / 1000); /* Convert ns to us for usleep call *=
/
-    qemu_mutex_lock_iothread();
+    /* Add 1ns to fix double's rounding error (like 0.9999999...) */
+    sleeptime_ns =3D (int64_t)(throttle_ratio * CPU_THROTTLE_TIMESLICE_N=
S + 1);
+
+    while (sleeptime_ns >=3D SCALE_MS && !cpu->stop) {
+        int64_t start, end;
+        start =3D qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
+        qemu_cond_timedwait(cpu->halt_cond, &qemu_global_mutex,
+                            sleeptime_ns / SCALE_MS);
+        end =3D qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
+        sleeptime_ns -=3D end - start;
+    }
+    if (sleeptime_ns >=3D SCALE_US && !cpu->stop) {
+        qemu_mutex_unlock_iothread();
+        g_usleep(sleeptime_ns / SCALE_US);
+        qemu_mutex_lock_iothread();
+    }
     atomic_set(&cpu->throttle_thread_scheduled, 0);
 }
=20
@@ -1167,8 +1180,6 @@ static void qemu_init_sigbus(void)
 }
 #endif /* !CONFIG_LINUX */
=20
-static QemuMutex qemu_global_mutex;
-
 static QemuThread io_thread;
=20
 /* cpu creation */
--=20
2.22.0


