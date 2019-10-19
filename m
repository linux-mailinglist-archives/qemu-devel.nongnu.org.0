Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F56DD6F8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 08:46:19 +0200 (CEST)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLiVF-0001EM-VJ
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 02:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iLiOg-0003VK-Dz
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iLiOe-0003xR-Em
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:39:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iLiOY-0003ty-L6; Sat, 19 Oct 2019 02:39:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D079A8553A;
 Sat, 19 Oct 2019 06:39:21 +0000 (UTC)
Received: from localhost (ovpn-116-50.ams2.redhat.com [10.36.116.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1539960BF4;
 Sat, 19 Oct 2019 06:39:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/16] libqos: implement VIRTIO 1.0 FEATURES_OK step
Date: Sat, 19 Oct 2019 07:38:02 +0100
Message-Id: <20191019063810.6944-9-stefanha@redhat.com>
In-Reply-To: <20191019063810.6944-1-stefanha@redhat.com>
References: <20191019063810.6944-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 19 Oct 2019 06:39:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, slp@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Device initialization has an extra step in VIRTIO 1.0.  The FEATURES_OK
status bit is set to indicate that feature negotiation has completed.
The driver then reads the status register again to check that the device
agrees with the final features.

Implement this step as part of qvirtio_set_features() instead of
introducing a separate function.  This way all existing code works
without modifications.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/libqos/virtio.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/libqos/virtio.c b/tests/libqos/virtio.c
index 2593996c98..57fa79373b 100644
--- a/tests/libqos/virtio.c
+++ b/tests/libqos/virtio.c
@@ -52,6 +52,19 @@ void qvirtio_set_features(QVirtioDevice *d, uint64_t f=
eatures)
 {
     d->features =3D features;
     d->bus->set_features(d, features);
+
+    /*
+     * This could be a separate function for drivers that want to access
+     * configuration space before setting FEATURES_OK, but no existing u=
sers
+     * need that and it's less code for callers if this is done implicit=
ly.
+    */
+    if (features & (1ull << VIRTIO_F_VERSION_1)) {
+        uint8_t status =3D d->bus->get_status(d) |
+                         VIRTIO_CONFIG_S_FEATURES_OK;
+
+        d->bus->set_status(d, status);
+        g_assert_cmphex(d->bus->get_status(d), =3D=3D, status);
+    }
 }
=20
 QVirtQueue *qvirtqueue_setup(QVirtioDevice *d,
@@ -88,9 +101,10 @@ void qvirtio_set_driver(QVirtioDevice *d)
=20
 void qvirtio_set_driver_ok(QVirtioDevice *d)
 {
-    d->bus->set_status(d, d->bus->get_status(d) | VIRTIO_CONFIG_S_DRIVER=
_OK);
-    g_assert_cmphex(d->bus->get_status(d), =3D=3D, VIRTIO_CONFIG_S_DRIVE=
R_OK |
-                    VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_ACKNOWLEDGE=
);
+    uint8_t status =3D d->bus->get_status(d) | VIRTIO_CONFIG_S_DRIVER_OK=
;
+
+    d->bus->set_status(d, status);
+    g_assert_cmphex(d->bus->get_status(d), =3D=3D, status);
 }
=20
 void qvirtio_wait_queue_isr(QTestState *qts, QVirtioDevice *d,
--=20
2.21.0


