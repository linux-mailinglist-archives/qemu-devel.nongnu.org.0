Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C22CC61
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 18:45:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVfED-0003XA-AC
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 12:45:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfC5-0002KB-Vc
	for qemu-devel@nongnu.org; Tue, 28 May 2019 12:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVfC3-0001UY-9s
	for qemu-devel@nongnu.org; Tue, 28 May 2019 12:43:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hVfC3-0000pZ-18; Tue, 28 May 2019 12:43:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89E6D306E61C;
	Tue, 28 May 2019 16:41:54 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB9FF1F8;
	Tue, 28 May 2019 16:41:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue, 28 May 2019 18:40:14 +0200
Message-Id: <20190528164020.32250-5-philmd@redhat.com>
In-Reply-To: <20190528164020.32250-1-philmd@redhat.com>
References: <20190528164020.32250-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 28 May 2019 16:41:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 04/10] hw/s390x/event-facility: Use the QOM
 BUS() macro to access BusState.qbus
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, Gerd Hoffmann <kraxel@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than looking inside the definition of a BusState with "s->bus.qbus=
",
use the QOM prefered style: "BUS(&s->bus)".

This patch was generated using the following Coccinelle script:

    // Use BUS() macros to access BusState.qbus
    @use_bus_macro_to_access_qbus@
    expression obj;
    identifier bus;
    @@
    -&obj->bus.qbus
    +BUS(&obj->bus)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/s390x/event-facility.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index ee5b83448b..e574223a22 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -466,12 +466,12 @@ static void init_event_facility(Object *obj)
     new =3D object_new(TYPE_SCLP_QUIESCE);
     object_property_add_child(obj, TYPE_SCLP_QUIESCE, new, NULL);
     object_unref(new);
-    qdev_set_parent_bus(DEVICE(new), &event_facility->sbus.qbus);
+    qdev_set_parent_bus(DEVICE(new), BUS(&event_facility->sbus));
=20
     new =3D object_new(TYPE_SCLP_CPU_HOTPLUG);
     object_property_add_child(obj, TYPE_SCLP_CPU_HOTPLUG, new, NULL);
     object_unref(new);
-    qdev_set_parent_bus(DEVICE(new), &event_facility->sbus.qbus);
+    qdev_set_parent_bus(DEVICE(new), BUS(&event_facility->sbus));
     /* the facility will automatically realize the devices via the bus *=
/
 }
=20
--=20
2.20.1


