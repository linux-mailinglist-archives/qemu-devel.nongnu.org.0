Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71FC1022E3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 12:18:47 +0100 (CET)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX1Ww-0006in-DX
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 06:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iX1Uv-0005lw-O9
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:16:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iX1Ut-0003Px-9Q
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:16:40 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42053
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iX1Ut-0003PQ-5o
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574162198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uaiQi2nfEMRuSMjuZ+gsCf+8nC63MKmPedparNIqYU4=;
 b=NH2GP1y0C33wrDkQCjCaSsDeeXLL9DFbHWN3/l11/kRwBBSdEulOrNxRnyOBsAQ8Zs6DW7
 A+CSY2l7huys6t2po6+oJIo6jluHcgt43J8KVMdBgV+cZTm2pwqNLlaWDi32FZDudCt7QX
 P9ShznK1h+B4p2NnLhJXuvW/DRq7jeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-HwM2PLtHPnuqYjjniW6Xmg-1; Tue, 19 Nov 2019 06:16:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 132F5107ACC5
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 11:16:36 +0000 (UTC)
Received: from localhost (unknown [10.36.118.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CDED6404A;
 Tue, 19 Nov 2019 11:16:27 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user-input: use free(elem) instead of g_free(elem)
Date: Tue, 19 Nov 2019 11:16:26 +0000
Message-Id: <20191119111626.112206-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: HwM2PLtHPnuqYjjniW6Xmg-1
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtqueue element returned by vu_queue_pop() is allocated using
malloc(3) by virtqueue_alloc_element().  Use the matching free(3)
function instead of glib's g_free().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/vhost-user-input/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/mai=
n.c
index 449fd2171a..ef4b7769f2 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -77,7 +77,7 @@ static void vi_input_send(VuInput *vi, struct virtio_inpu=
t_event *event)
         len =3D iov_from_buf(elem->in_sg, elem->in_num,
                            0, &vi->queue[i].event, sizeof(virtio_input_eve=
nt));
         vu_queue_push(dev, vq, elem, len);
-        g_free(elem);
+        free(elem);
     }
=20
     vu_queue_notify(&vi->dev.parent, vq);
@@ -153,7 +153,7 @@ static void vi_handle_sts(VuDev *dev, int qidx)
                          0, &event, sizeof(event));
         vi_handle_status(vi, &event);
         vu_queue_push(dev, vq, elem, len);
-        g_free(elem);
+        free(elem);
     }
=20
     vu_queue_notify(&vi->dev.parent, vq);
--=20
2.23.0


