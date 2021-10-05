Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7219422026
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:09:06 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfVZ-0003KH-D3
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXfQN-0001OF-KY
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXfOP-0000gN-W1
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633420898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xBmfbX2Z7ElPNe4Nl1YqLqrIDobQBvqxlq9N6lwVgGA=;
 b=hbx/E75VPJEiAXQVcElANaz9hi5HJrewreru3TTpfKHdODyR0v+24RyPs5jQ3k8hym43yM
 WYMtvjEQJfBzINmUGP+B3qvHLd47zjx6TMwKf7ANHJpU8JdRJJ5FtQzlKfa/RGoRCpP+gl
 JIhrlJTLQBpmDmVm+J7iLuHNjFHBiv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-6iUuxDs5McSRKD9nPOXTfg-1; Tue, 05 Oct 2021 04:01:37 -0400
X-MC-Unique: 6iUuxDs5McSRKD9nPOXTfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB4C10151E2;
 Tue,  5 Oct 2021 08:01:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 482F260BF4;
 Tue,  5 Oct 2021 08:01:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vdpa: Check iova range on memory regions ops
Date: Tue,  5 Oct 2021 10:01:28 +0200
Message-Id: <20211005080131.408506-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this moment vdpa will not send memory regions bigger than 1<<63.=0D
However, actual iova range could be way more restrictive than that.=0D
=0D
Since we can obtain the range through vdpa ioctl call, just save it=0D
from the beginning of the operation and check against it.=0D
=0D
Eugenio P=C3=A9rez (3):=0D
  vdpa: Skip protected ram IOMMU mappings=0D
  vdpa: Add vhost_vdpa_section_end=0D
  vdpa: Check for iova range at mappings changes=0D
=0D
 include/hw/virtio/vhost-vdpa.h |  2 +=0D
 hw/virtio/vhost-vdpa.c         | 83 +++++++++++++++++++++++++---------=0D
 hw/virtio/trace-events         |  1 +=0D
 3 files changed, 65 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


