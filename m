Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79421F725E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 11:40:26 +0100 (CET)
Received: from localhost ([::1]:50688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU77R-0001sE-IN
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 05:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mprivozn@redhat.com>) id 1iU76E-0000vr-8D
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 05:39:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mprivozn@redhat.com>) id 1iU76B-0003jY-W7
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 05:39:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56585
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mprivozn@redhat.com>) id 1iU76B-0003i5-L7
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 05:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573468747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plhy1uZkekv8VMNLA+nPZe58rkKQkQ/37jG9PB7wxcI=;
 b=OyGmLsomMelP1oEzY4G71AvxbMSe1ADCZWJENpbfEobLvwHWjoyuISe+jPHYyxkqkjXr5Q
 dktHrqOgnT3/cObtC3ILQn4qUhpAunynoGCzHiKZgXv7TGtSsAK1DJGneRiQ4UKYR+06II
 rCfuAcIdj3now4wvXTqY5zDhIGEylXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-Z8WlT_zjM0uQGtESJw46PA-1; Mon, 11 Nov 2019 05:38:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96786107ACC4
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 10:37:59 +0000 (UTC)
Received: from moe.redhat.com (unknown [10.43.2.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA84C5C883;
 Mon, 11 Nov 2019 10:37:58 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/vfio/pci: Fix double free of migration_blocker
Date: Mon, 11 Nov 2019 11:37:41 +0100
Message-Id: <c96b132607f4314ce1efc1af995be300f21ecc04.1573468531.git.mprivozn@redhat.com>
In-Reply-To: <cover.1573468531.git.mprivozn@redhat.com>
References: <cover.1573468531.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Z8WlT_zjM0uQGtESJw46PA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When user tries to hotplug a VFIO device, but the operation fails
somewhere in the middle (in my testing it failed because of
RLIMIT_MEMLOCK forbidding more memory allocation), then a double
free occurs. In vfio_realize() the vdev->migration_blocker is
allocated, then something goes wrong which causes control to jump
onto 'error' label where the error is freed. But the pointer is
left pointing to invalid memory. Later, when
vfio_instance_finalize() is called, the memory is freed again.

In my testing the second hunk was sufficient to fix the bug, but
I figured the first hunk doesn't hurt either.

=3D=3D169952=3D=3D Invalid read of size 8
=3D=3D169952=3D=3D    at 0xA47DCD: error_free (error.c:266)
=3D=3D169952=3D=3D    by 0x4E0A18: vfio_instance_finalize (pci.c:3040)
=3D=3D169952=3D=3D    by 0x8DF74C: object_deinit (object.c:606)
=3D=3D169952=3D=3D    by 0x8DF7BE: object_finalize (object.c:620)
=3D=3D169952=3D=3D    by 0x8E0757: object_unref (object.c:1074)
=3D=3D169952=3D=3D    by 0x45079C: memory_region_unref (memory.c:1779)
=3D=3D169952=3D=3D    by 0x45376B: do_address_space_destroy (memory.c:2793)
=3D=3D169952=3D=3D    by 0xA5C600: call_rcu_thread (rcu.c:283)
=3D=3D169952=3D=3D    by 0xA427CB: qemu_thread_start (qemu-thread-posix.c:5=
19)
=3D=3D169952=3D=3D    by 0x80A8457: start_thread (in /lib64/libpthread-2.29=
.so)
=3D=3D169952=3D=3D    by 0x81C96EE: clone (in /lib64/libc-2.29.so)
=3D=3D169952=3D=3D  Address 0x143137e0 is 0 bytes inside a block of size 48=
 free'd
=3D=3D169952=3D=3D    at 0x4A342BB: free (vg_replace_malloc.c:530)
=3D=3D169952=3D=3D    by 0xA47E05: error_free (error.c:270)
=3D=3D169952=3D=3D    by 0x4E0945: vfio_realize (pci.c:3025)
=3D=3D169952=3D=3D    by 0x76A4FF: pci_qdev_realize (pci.c:2099)
=3D=3D169952=3D=3D    by 0x689B9A: device_set_realized (qdev.c:876)
=3D=3D169952=3D=3D    by 0x8E2C80: property_set_bool (object.c:2080)
=3D=3D169952=3D=3D    by 0x8E0EF6: object_property_set (object.c:1272)
=3D=3D169952=3D=3D    by 0x8E3FC8: object_property_set_qobject (qom-qobject=
.c:26)
=3D=3D169952=3D=3D    by 0x8E11DB: object_property_set_bool (object.c:1338)
=3D=3D169952=3D=3D    by 0x5E7BDD: qdev_device_add (qdev-monitor.c:673)
=3D=3D169952=3D=3D    by 0x5E81E5: qmp_device_add (qdev-monitor.c:798)
=3D=3D169952=3D=3D    by 0x9E18A8: do_qmp_dispatch (qmp-dispatch.c:132)
=3D=3D169952=3D=3D  Block was alloc'd at
=3D=3D169952=3D=3D    at 0x4A35476: calloc (vg_replace_malloc.c:752)
=3D=3D169952=3D=3D    by 0x51B1158: g_malloc0 (in /usr/lib64/libglib-2.0.so=
.0.6000.6)
=3D=3D169952=3D=3D    by 0xA47357: error_setv (error.c:61)
=3D=3D169952=3D=3D    by 0xA475D9: error_setg_internal (error.c:97)
=3D=3D169952=3D=3D    by 0x4DF8C2: vfio_realize (pci.c:2737)
=3D=3D169952=3D=3D    by 0x76A4FF: pci_qdev_realize (pci.c:2099)
=3D=3D169952=3D=3D    by 0x689B9A: device_set_realized (qdev.c:876)
=3D=3D169952=3D=3D    by 0x8E2C80: property_set_bool (object.c:2080)
=3D=3D169952=3D=3D    by 0x8E0EF6: object_property_set (object.c:1272)
=3D=3D169952=3D=3D    by 0x8E3FC8: object_property_set_qobject (qom-qobject=
.c:26)
=3D=3D169952=3D=3D    by 0x8E11DB: object_property_set_bool (object.c:1338)
=3D=3D169952=3D=3D    by 0x5E7BDD: qdev_device_add (qdev-monitor.c:673)

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/vfio/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e6569a7968..9c165995df 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2740,6 +2740,7 @@ static void vfio_realize(PCIDevice *pdev, Error **err=
p)
         if (err) {
             error_propagate(errp, err);
             error_free(vdev->migration_blocker);
+            vdev->migration_blocker =3D NULL;
             return;
         }
     }
@@ -3023,6 +3024,7 @@ error:
     if (vdev->migration_blocker) {
         migrate_del_blocker(vdev->migration_blocker);
         error_free(vdev->migration_blocker);
+        vdev->migration_blocker =3D NULL;
     }
 }
=20
--=20
2.23.0


