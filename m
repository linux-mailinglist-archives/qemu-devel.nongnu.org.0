Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A393F60DE72
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:55:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ond6o-0003TK-F8; Wed, 26 Oct 2022 05:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ond6P-0002i8-9o
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ond6N-0001jv-Qt
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666778014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K/VaNrkI1kHZmZSy2XcjJiPGWY3mjYHueOhHSqi11S8=;
 b=f+UZnqqIso82pq/1GiyYprYVS6AZngOwVUk6jfEA6JoX8L5Sf1jIwTwiihsZNzZI52fL82
 W2LhO8HP8zZEHExZvJdmX06mdzMIJkPJ1glvw6qj5xwu7QiuZT6sr48vmkLGjcjguClWcr
 MRLhX0iNa011RDKqRNJYYran5QjwKKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-XzDISKpdNlSdChiVTiv0DQ-1; Wed, 26 Oct 2022 05:53:32 -0400
X-MC-Unique: XzDISKpdNlSdChiVTiv0DQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3D9C802544;
 Wed, 26 Oct 2022 09:53:15 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63EED492B16;
 Wed, 26 Oct 2022 09:53:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH 0/3] Emulate status feature in vhost-vdpa net
Date: Wed, 26 Oct 2022 11:53:00 +0200
Message-Id: <20221026095303.37907-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The net config space is already copied from the device so it can me modifie=
d=0D
by qemu. In particular, this is already done to fix cases where the NIC doe=
s=0D
not expose the right fields.=0D
=0D
It's trivial to emulate _F_STATE with qemu if not supported by the device,=
=0D
sice a valid approach is to always show the link as up. If the feature is=0D
already supported by the device, no config space modification is needed.=0D
=0D
This is a pre requisite to use other features like _F_GUEST_ANNOUNCE, since=
=0D
_F_STATUS is needed for the guest to access the status.=0D
=0D
These patches are sent on top of [1] series, so trivial conflicts could ari=
se=0D
if it is applied directly on master. Future versions can be not based on=0D
it is more convenient.=0D
=0D
Eugenio P=C3=A9rez (3):=0D
  virtio_net: Modify virtio_net_get_config to early return=0D
  virtio_net: Handle _F_STATUS emulation in virtio_net_get_config=0D
  vdpa: Expose VIRTIO_NET_F_STATUS unconditionally=0D
=0D
 include/net/vhost-vdpa.h |  1 +=0D
 hw/net/vhost_net.c       | 16 ++++++++++++++--=0D
 hw/net/virtio-net.c      | 39 ++++++++++++++++++++++++---------------=0D
 net/vhost-vdpa.c         |  3 +++=0D
 4 files changed, 42 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


