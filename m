Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F41E17B2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 12:19:20 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNDjb-0003Kp-Kv
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 06:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iNDWc-0004Hw-Ex
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iNDWb-0002Da-4H
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:05:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46783
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iNDWa-00029R-VU
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571825147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TgnIp6Vzl6+oiH4t/k6zREBHFuWNo0ZBz0CUc04Pots=;
 b=gZsL0/6/eNJQ0jGWKaB+io+O6+VDKBaoVcxqGF0CsyhA/eTGVcjzOI0PXLce2Srd/CR9Uj
 /GkRDGqAq91mmWdse8NQq5DiWShbe1Vw+a99ojD/CNa7+vbBTs0Zb+t7PUEuVvsrVmaRoL
 FebNpu5Yr56v3ZloOZ/OAE6mMB4iKRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-scP6e1UlMz2dtDatncfSWw-1; Wed, 23 Oct 2019 06:05:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D38DE47B;
 Wed, 23 Oct 2019 10:05:42 +0000 (UTC)
Received: from localhost (unknown [10.36.118.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 019A05D6C8;
 Wed, 23 Oct 2019 10:05:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/16] tests/virtio-blk-test: set up virtqueue after
 feature negotiation
Date: Wed, 23 Oct 2019 11:04:14 +0100
Message-Id: <20191023100425.12168-6-stefanha@redhat.com>
In-Reply-To: <20191023100425.12168-1-stefanha@redhat.com>
References: <20191023100425.12168-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: scP6e1UlMz2dtDatncfSWw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VIRTIO Device Initialization requires that feature negotiation has
completed before virtqueues are set up.  This makes sense because the
driver must know whether it is operating in Legacy or VIRTIO 1.0 mode
before it can access vring fields with the correct endianness.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/virtio-blk-test.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/virtio-blk-test.c b/tests/virtio-blk-test.c
index 31680cc159..fe0dc4a896 100644
--- a/tests/virtio-blk-test.c
+++ b/tests/virtio-blk-test.c
@@ -113,8 +113,8 @@ static uint64_t virtio_blk_request(QGuestAllocator *all=
oc, QVirtioDevice *d,
     return addr;
 }
=20
-static void test_basic(QVirtioDevice *dev, QGuestAllocator *alloc,
-                       QVirtQueue *vq)
+/* Returns the request virtqueue so the caller can perform further tests *=
/
+static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
 {
     QVirtioBlkReq req;
     uint64_t req_addr;
@@ -124,6 +124,7 @@ static void test_basic(QVirtioDevice *dev, QGuestAlloca=
tor *alloc,
     uint8_t status;
     char *data;
     QTestState *qts =3D global_qtest;
+    QVirtQueue *vq;
=20
     features =3D qvirtio_get_features(dev);
     features =3D features & ~(QVIRTIO_F_BAD_FEATURE |
@@ -135,6 +136,8 @@ static void test_basic(QVirtioDevice *dev, QGuestAlloca=
tor *alloc,
     capacity =3D qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, =3D=3D, TEST_IMAGE_SIZE / 512);
=20
+    vq =3D qvirtqueue_setup(dev, alloc, 0);
+
     qvirtio_set_driver_ok(dev);
=20
     /* Write and read with 3 descriptor layout */
@@ -331,14 +334,16 @@ static void test_basic(QVirtioDevice *dev, QGuestAllo=
cator *alloc,
=20
         guest_free(alloc, req_addr);
     }
+
+    return vq;
 }
=20
 static void basic(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioBlk *blk_if =3D obj;
     QVirtQueue *vq;
-    vq =3D qvirtqueue_setup(blk_if->vdev, t_alloc, 0);
-    test_basic(blk_if->vdev, t_alloc, vq);
+
+    vq =3D test_basic(blk_if->vdev, t_alloc);
     qvirtqueue_cleanup(blk_if->vdev->bus, vq, t_alloc);
=20
 }
@@ -746,9 +751,7 @@ static void resize(void *obj, void *data, QGuestAllocat=
or *t_alloc)
     QVirtQueue *vq;
     QTestState *qts =3D global_qtest;
=20
-    vq =3D qvirtqueue_setup(dev, t_alloc, 0);
-
-    test_basic(dev, t_alloc, vq);
+    vq =3D test_basic(dev, t_alloc);
=20
     qmp_discard_response("{ 'execute': 'block_resize', "
                          " 'arguments': { 'device': 'drive0', "
--=20
2.21.0


