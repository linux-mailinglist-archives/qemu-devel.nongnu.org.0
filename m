Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B773726F782
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 09:56:13 +0200 (CEST)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJBFc-0008I8-Ps
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 03:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kJB7S-0000VC-PE
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kJB7Q-0008Q7-S1
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600415262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otkV9JMmoK5sSwVWVNAvedJTysACuBjOKRt5Slm4jUM=;
 b=ggJsPNk2HfuhLyMT47321XGYqlGo8JWtOnYvTF4GNOAPXyQ4aI3/HcgJQTIcAQNV7raCFg
 dbBAVmZOrp7h3z5f7swu81FwACGsc3q2kCnVzGLvNCVQFm9SBbBE1Fwm+193X5e1BIrIlZ
 k2RFRWQQjuJH5yU1tMEiEm1nT99fVF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-oZKewhyXMvid6LwO1ot_Zg-1; Fri, 18 Sep 2020 03:47:38 -0400
X-MC-Unique: oZKewhyXMvid6LwO1ot_Zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E5686408F;
 Fri, 18 Sep 2020 07:47:37 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-92.ams2.redhat.com
 [10.36.113.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0979355773;
 Fri, 18 Sep 2020 07:47:30 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 2/4] vhost-vsock-pci: force virtio version 1
Date: Fri, 18 Sep 2020 09:47:08 +0200
Message-Id: <20200918074710.27810-3-sgarzare@redhat.com>
In-Reply-To: <20200918074710.27810-1-sgarzare@redhat.com>
References: <20200918074710.27810-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>, Qinghua Cheng <qcheng@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Qian Cai <caiqian@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9b3a35ec82 ("virtio: verify that legacy support is not
accidentally on") added a safety check that requires to set
'disable-legacy=on' on vhost-vsock-pci device:

    $ ./qemu-system-x86_64 ... -device vhost-vsock-pci,guest-cid=5
        qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=5:
        device is modern-only, use disable-legacy=on

virtio-vsock was introduced after the release of VIRTIO 1.0
specifications, so it should be 'modern-only'.
In addition Cornelia verified that forcing a legacy mode on
vhost-vsock-pci device using x86-64 host and s390x guest, so with
different endianness, produces strange behaviours.

This patch forces virtio version 1 and removes the 'transitional_name'
property removing the need to specify 'disable-legacy=on' on
vhost-vsock-pci device.

To avoid migration issues, we force virtio version 1 only when
legacy check is enabled in the new machine types (>= 5.1).

Cc: qemu-stable@nongnu.org
Reported-by: Qian Cai <caiqian@redhat.com>
Reported-by: Qinghua Cheng <qcheng@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1868449
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v3:
 - forced virtio version 1 only with new machine types
v2:
 - fixed commit message [Cornelia]
---
 hw/virtio/vhost-vsock-pci.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index e56067b427..205da8d1f5 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -44,6 +44,15 @@ static void vhost_vsock_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VHostVSockPCI *dev = VHOST_VSOCK_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
+    VirtIODevice *virtio_dev = VIRTIO_DEVICE(vdev);
+
+    /*
+     * To avoid migration issues, we force virtio version 1 only when
+     * legacy check is enabled in the new machine types (>= 5.1).
+     */
+    if (!virtio_legacy_check_disabled(virtio_dev)) {
+        virtio_pci_force_virtio_1(vpci_dev);
+    }
 
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
@@ -73,7 +82,6 @@ static void vhost_vsock_pci_instance_init(Object *obj)
 static const VirtioPCIDeviceTypeInfo vhost_vsock_pci_info = {
     .base_name             = TYPE_VHOST_VSOCK_PCI,
     .generic_name          = "vhost-vsock-pci",
-    .transitional_name     = "vhost-vsock-pci-transitional",
     .non_transitional_name = "vhost-vsock-pci-non-transitional",
     .instance_size = sizeof(VHostVSockPCI),
     .instance_init = vhost_vsock_pci_instance_init,
-- 
2.26.2


