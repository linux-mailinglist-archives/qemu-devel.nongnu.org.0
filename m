Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4C11E327
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 13:05:18 +0100 (CET)
Received: from localhost ([::1]:48092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifjh7-0002Ew-EJ
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 07:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifjai-0005tb-P8
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:58:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifjah-000234-Kg
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:58:40 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40366
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifjah-00021l-GO
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576238319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLHIhKF8gtemS4I3jbOco6uwER63VSSn31OuRMEr5wU=;
 b=Vq22yntu8Dw4AtFHLpIMDIR4mq9xggJkp2I8RS0KaKzXloHVdGGC4saYPnB8QWL3hQU10M
 tHHVfhSoA6gclSGJTOhOZuMeLHke2z0K8mHOPLPTavKxe83252FuSPQmgJPxeY1dVbrC1A
 vwLNaMJ84JJ4iAX6HGy6/SOLfgG8I84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-6y9u__Q2P9mdr7prac_g5A-1; Fri, 13 Dec 2019 06:58:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD27B800EB4
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 11:58:34 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.117.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AACE719C4F;
 Fri, 13 Dec 2019 11:58:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] virtio-fs: fix MSI-X nvectors calculation
Date: Fri, 13 Dec 2019 11:58:22 +0000
Message-Id: <20191213115822.77260-3-dgilbert@redhat.com>
In-Reply-To: <20191213115822.77260-1-dgilbert@redhat.com>
References: <20191213115822.77260-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 6y9u__Q2P9mdr7prac_g5A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The following MSI-X vectors are required:
 * VIRTIO Configuration Change
 * hiprio virtqueue
 * requests virtqueues

Fix the calculation to reserve enough MSI-X vectors.  Otherwise guest
drivers fall back to a sub-optional configuration where all virtqueues
share a single vector.

This change does not break live migration compatibility since
vhost-user-fs-pci devices are not migratable yet.

Reported-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20191209110759.35227-1-stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/vhost-user-fs-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index 933a3f265b..e3a649d4a6 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -40,7 +40,8 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpc=
i_dev, Error **errp)
     DeviceState *vdev =3D DEVICE(&dev->vdev);
=20
     if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
-        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 1;
+        /* Also reserve config change and hiprio queue vectors */
+        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 2;
     }
=20
     qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
--=20
2.23.0


