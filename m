Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCA2BB4B4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:01:36 +0100 (CET)
Received: from localhost ([::1]:49332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBf5-0003fa-Kn
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBXn-0005s8-2N
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBXl-0007TF-1l
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYiokrtmxVGaxHYQFYtHrYcyj4QArcgChV2OGqAzahY=;
 b=Hc3ctVPSgydSURZY66CjMLPs0tM+la9i9XB0tRnsg+tZd0LGxS2DJ8bseaWfMCGmMtbasA
 qqB2jXefNJIIAJwlkoW1TWAn2VA22dpwYOPmnAiye3z+wB+0xhoitpJqj5fYywyeQrE2Ml
 HMSpUrJX2XCxIvKkraO3+Go1ub0Xsrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-Q2QN0RgLOE-Z4tC5OIvHtg-1; Fri, 20 Nov 2020 13:53:58 -0500
X-MC-Unique: Q2QN0RgLOE-Z4tC5OIvHtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4232100C605;
 Fri, 20 Nov 2020 18:53:54 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 721AB5C1D5;
 Fri, 20 Nov 2020 18:53:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/27] virtio: const-ify all virtio_tswap* functions
Date: Fri, 20 Nov 2020 19:50:49 +0100
Message-Id: <20201120185105.279030-12-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They do not modify vdev, so these should be const as qemu coding style
guideline.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio-access.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 6818a23a2d..7474f89b5f 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -24,7 +24,7 @@
 #define LEGACY_VIRTIO_IS_BIENDIAN 1
 #endif
 
-static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
+static inline bool virtio_access_is_big_endian(const VirtIODevice *vdev)
 {
 #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
     return virtio_is_big_endian(vdev);
@@ -147,7 +147,7 @@ static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
     }
 }
 
-static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
+static inline uint16_t virtio_tswap16(const VirtIODevice *vdev, uint16_t s)
 {
 #ifdef HOST_WORDS_BIGENDIAN
     return virtio_access_is_big_endian(vdev) ? s : bswap16(s);
@@ -213,7 +213,7 @@ static inline void virtio_tswap16s(VirtIODevice *vdev, uint16_t *s)
     *s = virtio_tswap16(vdev, *s);
 }
 
-static inline uint32_t virtio_tswap32(VirtIODevice *vdev, uint32_t s)
+static inline uint32_t virtio_tswap32(const VirtIODevice *vdev, uint32_t s)
 {
 #ifdef HOST_WORDS_BIGENDIAN
     return virtio_access_is_big_endian(vdev) ? s : bswap32(s);
@@ -227,7 +227,7 @@ static inline void virtio_tswap32s(VirtIODevice *vdev, uint32_t *s)
     *s = virtio_tswap32(vdev, *s);
 }
 
-static inline uint64_t virtio_tswap64(VirtIODevice *vdev, uint64_t s)
+static inline uint64_t virtio_tswap64(const VirtIODevice *vdev, uint64_t s)
 {
 #ifdef HOST_WORDS_BIGENDIAN
     return virtio_access_is_big_endian(vdev) ? s : bswap64(s);
-- 
2.18.4


