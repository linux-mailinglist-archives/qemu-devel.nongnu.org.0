Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19924E469B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 11:05:17 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNvX0-0003N3-VB
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 05:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eperezma@redhat.com>) id 1iNv5Y-0001hW-BP
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eperezma@redhat.com>) id 1iNv5W-0008Kg-Vw
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56877
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eperezma@redhat.com>) id 1iNv5W-0008KF-Sa
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571992610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PHivj3YKIowirE68kWBUerWJGcOHcyOu8LetWC1SL0=;
 b=WNCo4xs2focgF+1YtdozHu26D8HV+XWNsQLy0uvuLHZ3vuF96roCX8ommIJrXUX4p8Qcoz
 fO4D2aq4X65BwcY0HLouCk7XYNcen/9v8rDTsdkU5eopCM9aKryaf6SwcbzpNLIU5Lj3sf
 b2UjzoYHZAGlcdD8bc6CNFMeqeGrO04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-_1LOIfJUN-abyez-tvzq3A-1; Fri, 25 Oct 2019 04:36:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0784C801E5C;
 Fri, 25 Oct 2019 08:36:43 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 601A460BE0;
 Fri, 25 Oct 2019 08:36:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 7/8] vhost_net: enable packed ring support
Date: Fri, 25 Oct 2019 10:35:26 +0200
Message-Id: <20191025083527.30803-8-eperezma@redhat.com>
In-Reply-To: <20191025083527.30803-1-eperezma@redhat.com>
References: <20191025083527.30803-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: _1LOIfJUN-abyez-tvzq3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, Amit Shah <amit@kernel.org>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/net/vhost_net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index e975700f95..6b82803fa7 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -49,6 +49,7 @@ static const int kernel_feature_bits[] =3D {
     VIRTIO_F_VERSION_1,
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
+    VIRTIO_F_RING_PACKED,
     VHOST_INVALID_FEATURE_BIT
 };
=20
@@ -74,6 +75,7 @@ static const int user_feature_bits[] =3D {
     VIRTIO_NET_F_MRG_RXBUF,
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
+    VIRTIO_F_RING_PACKED,
=20
     /* This bit implies RARP isn't sent by QEMU out of band */
     VIRTIO_NET_F_GUEST_ANNOUNCE,
--=20
2.16.5


