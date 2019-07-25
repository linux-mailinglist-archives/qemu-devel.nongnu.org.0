Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353E74D3A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 13:37:43 +0200 (CEST)
Received: from localhost ([::1]:58866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqc46-0003vf-AT
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 07:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hqc3H-0000zB-4B
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hqc3G-00035Q-28
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:36:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59946)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hqc3F-00035A-TJ; Thu, 25 Jul 2019 07:36:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4000F308339B;
 Thu, 25 Jul 2019 11:36:49 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-70.ams2.redhat.com [10.36.117.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B86D75D71C;
 Thu, 25 Jul 2019 11:36:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 13:36:32 +0200
Message-Id: <20190725113638.4702-2-david@redhat.com>
In-Reply-To: <20190725113638.4702-1-david@redhat.com>
References: <20190725113638.4702-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 25 Jul 2019 11:36:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v4 1/7] virtio-balloon: Fix wrong sign
 extension of PFNs
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we directly cast from int to uint64_t, we will first sign-extend to
an int64_t, which is wrong. We actually want to treat the PFNs like
unsigned values.

As far as I can see, this dates back to the initial virtio-balloon
commit, but wasn't triggered as fairly big guests would be required.

Cc: qemu-stable@nongnu.org
Reported-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e85d1c0d5c..515abf6553 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -343,8 +343,8 @@ static void virtio_balloon_handle_output(VirtIODevice=
 *vdev, VirtQueue *vq)
         }
=20
         while (iov_to_buf(elem->out_sg, elem->out_num, offset, &pfn, 4) =
=3D=3D 4) {
+            unsigned int p =3D virtio_ldl_p(vdev, &pfn);
             hwaddr pa;
-            int p =3D virtio_ldl_p(vdev, &pfn);
=20
             pa =3D (hwaddr) p << VIRTIO_BALLOON_PFN_SHIFT;
             offset +=3D 4;
--=20
2.21.0


