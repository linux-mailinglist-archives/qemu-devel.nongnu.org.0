Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF215103D69
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 15:41:07 +0100 (CET)
Received: from localhost ([::1]:58774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXRAI-0007ZH-JX
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 09:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iXR8S-0006NP-Tm
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:39:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iXR8R-0007MG-TA
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:39:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21481
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iXR8R-0007Lz-Ne
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574260751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uANpi4ETWCKsezD49h9Xba8iURxarE4ymkAZ2Hp2byo=;
 b=TBEGijM0jmU8xsa+lYkQtqi3/jXNFKUCjiESfT56kvPSF+djiikey3kKBTySwZMTGHTh5g
 M+l0WxIqqJQ03Y6zzzh3+UjavXV2exAglogbTxI1kje0dOs4yD3BTpgZAaNJiVLaPPuUoy
 x7DO9BSNmrJPtT/yo293+fO3jpD3wec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-nrYGorGwPWSYiuMJil3lEw-1; Wed, 20 Nov 2019 09:39:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA43A5F9;
 Wed, 20 Nov 2019 14:39:08 +0000 (UTC)
Received: from localhost (dhcp-192-217.str.redhat.com [10.33.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9586013A;
 Wed, 20 Nov 2019 14:39:05 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] net/virtio: fix dev_unplug_pending
Date: Wed, 20 Nov 2019 15:38:56 +0100
Message-Id: <20191120143859.24584-2-jfreimann@redhat.com>
In-Reply-To: <20191120143859.24584-1-jfreimann@redhat.com>
References: <20191120143859.24584-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: nrYGorGwPWSYiuMJil3lEw-1
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, dgilbert@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.dev_unplug_pending is set up by virtio-net code indepent of failover
support was set for the device or not. This gives a wrong result when
we check for existing primary devices in migration code.

Fix this by actually calling dev_unplug_pending() instead of just
checking if the function pointer was set. When the feature was not
negotiated dev_unplug_pending() will always return false. This prevents
us from going into the wait-unplug state when there's no primary device
present.

Fixes: 9711cd0dfc3f ("net/virtio: add failover support")
Signed-off-by: Jens Freimann <jfreimann@redhat.com>
Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 3 +++
 migration/savevm.c  | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 97a5113f7e..946039c0dc 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3124,6 +3124,9 @@ static bool primary_unplug_pending(void *opaque)
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
     VirtIONet *n =3D VIRTIO_NET(vdev);
=20
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
+        return false;
+    }
     return n->primary_dev ? n->primary_dev->pending_deleted_event : false;
 }
=20
diff --git a/migration/savevm.c b/migration/savevm.c
index 966a9c3bdb..a71b930b91 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1119,7 +1119,8 @@ int qemu_savevm_nr_failover_devices(void)
     int n =3D 0;
=20
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-        if (se->vmsd && se->vmsd->dev_unplug_pending) {
+        if (se->vmsd && se->vmsd->dev_unplug_pending &&
+            se->vmsd->dev_unplug_pending(se->opaque)) {
             n++;
         }
     }
--=20
2.21.0


