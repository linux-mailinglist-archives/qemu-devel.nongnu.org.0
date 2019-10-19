Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E6DD6F3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 08:40:59 +0200 (CEST)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLiQ6-0004W7-Gw
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 02:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iLiO5-0002gD-FG
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iLiO4-0003Ue-FB
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:38:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iLiO2-0003Px-9G; Sat, 19 Oct 2019 02:38:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8916F83F40;
 Sat, 19 Oct 2019 06:38:49 +0000 (UTC)
Received: from localhost (ovpn-116-50.ams2.redhat.com [10.36.116.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC255C207;
 Sat, 19 Oct 2019 06:38:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/16] virtio-scsi-test: add missing feature negotiation
Date: Sat, 19 Oct 2019 07:37:58 +0100
Message-Id: <20191019063810.6944-5-stefanha@redhat.com>
In-Reply-To: <20191019063810.6944-1-stefanha@redhat.com>
References: <20191019063810.6944-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 19 Oct 2019 06:38:49 +0000 (UTC)
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

VIRTIO Device Initialization requires feature negotiation.  Currently
virtio-scsi-test.c is non-compliant.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/virtio-scsi-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/virtio-scsi-test.c b/tests/virtio-scsi-test.c
index 7c8f9b27f8..0415e75876 100644
--- a/tests/virtio-scsi-test.c
+++ b/tests/virtio-scsi-test.c
@@ -123,10 +123,16 @@ static QVirtioSCSIQueues *qvirtio_scsi_init(QVirtio=
Device *dev)
     QVirtioSCSIQueues *vs;
     const uint8_t test_unit_ready_cdb[VIRTIO_SCSI_CDB_SIZE] =3D {};
     struct virtio_scsi_cmd_resp resp;
+    uint64_t features;
     int i;
=20
     vs =3D g_new0(QVirtioSCSIQueues, 1);
     vs->dev =3D dev;
+
+    features =3D qvirtio_get_features(dev);
+    features &=3D ~(QVIRTIO_F_BAD_FEATURE | (1ull << VIRTIO_RING_F_EVENT=
_IDX));
+    qvirtio_set_features(dev, features);
+
     vs->num_queues =3D qvirtio_config_readl(dev, 0);
=20
     g_assert_cmpint(vs->num_queues, <, MAX_NUM_QUEUES);
@@ -135,6 +141,8 @@ static QVirtioSCSIQueues *qvirtio_scsi_init(QVirtioDe=
vice *dev)
         vs->vq[i] =3D qvirtqueue_setup(dev, alloc, i);
     }
=20
+    qvirtio_set_driver_ok(dev);
+
     /* Clear the POWER ON OCCURRED unit attention */
     g_assert_cmpint(virtio_scsi_do_command(vs, test_unit_ready_cdb,
                                            NULL, 0, NULL, 0, &resp),
--=20
2.21.0


