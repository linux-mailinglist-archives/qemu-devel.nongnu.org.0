Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60936100315
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 11:59:08 +0100 (CET)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWekL-0006mG-Ky
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 05:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1iWefF-0001ph-QX
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:53:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1iWefD-0004VS-A9
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:53:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20320
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1iWefD-0004VH-5b
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574074426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MZMBksKQ4RUbBl1WGfm1llnPtwEZ4SD2P8rjb9Hpew=;
 b=MAvypaDcaG8RGv9RNnWpjpEMjoEXa/seOWQdO4KeZThlNY7AJpcxlkxF9T2uZ/zu57M3Mt
 A4WEXjHI6XwKbyaR8jcL5ooFLBqe2PQj9ioismFMMUzg3fK63vaGYZU3NgFMBYgiolEQag
 BCMW6eDjnSmE1Uk2fY+pxsbN/s0pFPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-gWIJ_IueOuWNhFowkG2JGA-1; Mon, 18 Nov 2019 05:53:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C59BB477;
 Mon, 18 Nov 2019 10:53:40 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-117-32.ams2.redhat.com [10.36.117.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F35AE60856;
 Mon, 18 Nov 2019 10:53:38 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 6/6] mos6522: fix T1 and T2 timers
Date: Mon, 18 Nov 2019 11:53:19 +0100
Message-Id: <20191118105319.7658-7-lvivier@redhat.com>
In-Reply-To: <20191118105319.7658-1-lvivier@redhat.com>
References: <20191118105319.7658-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: gWIJ_IueOuWNhFowkG2JGA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

With the Quadra 800 emulation, mos6522 timers processing can consume
until 70% of the host CPU time with an idle guest (I guess the problem
should also happen with PowerMac emulation).

On a recent system, it can be painless (except if you look at top), but
on an old host like a PowerMac G5 the guest kernel can be terribly slow
during the boot sequence (for instance, unpacking initramfs can take 15
seconds rather than only 3 seconds).

We can avoid this CPU overload by enabling QEMU internal timers only if
the mos6522 counter interrupts are enabled. Sometime the guest kernel
wants to read the counters values, but we don't need the timers to
update the counters.

With this patch applied, an idle Q800 consumes only 3% of host CPU time
(and the guest can boot in a decent time).

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191102154919.17775-1-laurent@vivier.eu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/misc/mos6522.c | 67 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 57f13db266b4..aa3bfe1afddd 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -38,8 +38,10 @@
=20
 /* XXX: implement all timer modes */
=20
-static void mos6522_timer_update(MOS6522State *s, MOS6522Timer *ti,
-                                 int64_t current_time);
+static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
+                                  int64_t current_time);
+static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
+                                  int64_t current_time);
=20
 static void mos6522_update_irq(MOS6522State *s)
 {
@@ -98,7 +100,11 @@ static void set_counter(MOS6522State *s, MOS6522Timer *=
ti, unsigned int val)
     trace_mos6522_set_counter(1 + ti->index, val);
     ti->load_time =3D get_load_time(s, ti);
     ti->counter_value =3D val;
-    mos6522_timer_update(s, ti, ti->load_time);
+    if (ti->index =3D=3D 0) {
+        mos6522_timer1_update(s, ti, ti->load_time);
+    } else {
+        mos6522_timer2_update(s, ti, ti->load_time);
+    }
 }
=20
 static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
@@ -130,19 +136,34 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS=
6522Timer *ti,
     trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
     next_time =3D muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->frequenc=
y) +
                          ti->load_time;
+
     if (next_time <=3D current_time) {
         next_time =3D current_time + 1;
     }
     return next_time;
 }
=20
-static void mos6522_timer_update(MOS6522State *s, MOS6522Timer *ti,
+static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
+                                 int64_t current_time)
+{
+    if (!ti->timer) {
+        return;
+    }
+    if ((s->ier & T1_INT) =3D=3D 0 || (s->acr & T1MODE) !=3D T1MODE_CONT) =
{
+        timer_del(ti->timer);
+    } else {
+        ti->next_irq_time =3D get_next_irq_time(s, ti, current_time);
+        timer_mod(ti->timer, ti->next_irq_time);
+    }
+}
+
+static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
                                  int64_t current_time)
 {
     if (!ti->timer) {
         return;
     }
-    if (ti->index =3D=3D 0 && (s->acr & T1MODE) !=3D T1MODE_CONT) {
+    if ((s->ier & T2_INT) =3D=3D 0) {
         timer_del(ti->timer);
     } else {
         ti->next_irq_time =3D get_next_irq_time(s, ti, current_time);
@@ -155,7 +176,7 @@ static void mos6522_timer1(void *opaque)
     MOS6522State *s =3D opaque;
     MOS6522Timer *ti =3D &s->timers[0];
=20
-    mos6522_timer_update(s, ti, ti->next_irq_time);
+    mos6522_timer1_update(s, ti, ti->next_irq_time);
     s->ifr |=3D T1_INT;
     mos6522_update_irq(s);
 }
@@ -165,7 +186,7 @@ static void mos6522_timer2(void *opaque)
     MOS6522State *s =3D opaque;
     MOS6522Timer *ti =3D &s->timers[1];
=20
-    mos6522_timer_update(s, ti, ti->next_irq_time);
+    mos6522_timer2_update(s, ti, ti->next_irq_time);
     s->ifr |=3D T2_INT;
     mos6522_update_irq(s);
 }
@@ -204,7 +225,16 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsig=
ned size)
 {
     MOS6522State *s =3D opaque;
     uint32_t val;
+    int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
=20
+    if (now >=3D s->timers[0].next_irq_time) {
+        mos6522_timer1_update(s, &s->timers[0], now);
+        s->ifr |=3D T1_INT;
+    }
+    if (now >=3D s->timers[1].next_irq_time) {
+        mos6522_timer2_update(s, &s->timers[1], now);
+        s->ifr |=3D T2_INT;
+    }
     switch (addr) {
     case VIA_REG_B:
         val =3D s->b;
@@ -299,8 +329,8 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t =
val, unsigned size)
         break;
     case VIA_REG_T1CL:
         s->timers[0].latch =3D (s->timers[0].latch & 0xff00) | val;
-        mos6522_timer_update(s, &s->timers[0],
-                             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        mos6522_timer1_update(s, &s->timers[0],
+                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case VIA_REG_T1CH:
         s->timers[0].latch =3D (s->timers[0].latch & 0xff) | (val << 8);
@@ -309,14 +339,14 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_=
t val, unsigned size)
         break;
     case VIA_REG_T1LL:
         s->timers[0].latch =3D (s->timers[0].latch & 0xff00) | val;
-        mos6522_timer_update(s, &s->timers[0],
-                             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        mos6522_timer1_update(s, &s->timers[0],
+                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case VIA_REG_T1LH:
         s->timers[0].latch =3D (s->timers[0].latch & 0xff) | (val << 8);
         s->ifr &=3D ~T1_INT;
-        mos6522_timer_update(s, &s->timers[0],
-                             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        mos6522_timer1_update(s, &s->timers[0],
+                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case VIA_REG_T2CL:
         s->timers[1].latch =3D (s->timers[1].latch & 0xff00) | val;
@@ -334,8 +364,8 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t =
val, unsigned size)
         break;
     case VIA_REG_ACR:
         s->acr =3D val;
-        mos6522_timer_update(s, &s->timers[0],
-                             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        mos6522_timer1_update(s, &s->timers[0],
+                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case VIA_REG_PCR:
         s->pcr =3D val;
@@ -354,6 +384,11 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t=
 val, unsigned size)
             s->ier &=3D ~val;
         }
         mos6522_update_irq(s);
+        /* if IER is modified starts needed timers */
+        mos6522_timer1_update(s, &s->timers[0],
+                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        mos6522_timer2_update(s, &s->timers[1],
+                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     default:
     case VIA_REG_ANH:
@@ -426,9 +461,11 @@ static void mos6522_reset(DeviceState *dev)
     s->timers[0].frequency =3D s->frequency;
     s->timers[0].latch =3D 0xffff;
     set_counter(s, &s->timers[0], 0xffff);
+    timer_del(s->timers[0].timer);
=20
     s->timers[1].frequency =3D s->frequency;
     s->timers[1].latch =3D 0xffff;
+    timer_del(s->timers[1].timer);
 }
=20
 static void mos6522_init(Object *obj)
--=20
2.23.0


