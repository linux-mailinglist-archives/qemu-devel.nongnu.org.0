Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C9637E5A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 18:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyG6N-0000dd-JG; Thu, 24 Nov 2022 12:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyG6L-0000dV-VP
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 12:33:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyG6J-0006mi-KK
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 12:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669311206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A7wiq0qxnd9wfCc1NF5dhXwcdg9dsXCdSq/spnL8jlI=;
 b=EHoXnOb5Z/jLuA1uzU/Wen84YnwSEjpfLswc2JWazencLMT4FIQs5R5l/GQniQkgvcrDIA
 3PaFfHz7+vc6eKzM3SM2KtmcAZgZnPF8PRSA6bzmrflAX6IE+qlu/j8tSPqA15yV29rSg0
 HKqyculC9JktBYA0Dlt1yTGyiAUP9SE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-lByKxTxwPD-jT4k_E5ftig-1; Thu, 24 Nov 2022 12:33:22 -0500
X-MC-Unique: lByKxTxwPD-jT4k_E5ftig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E24C086EB60;
 Thu, 24 Nov 2022 17:33:21 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14DB24C819;
 Thu, 24 Nov 2022 17:33:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v2 0/4] Guest announce feature emulation using Shadow VirtQueue
Date: Thu, 24 Nov 2022 18:33:10 +0100
Message-Id: <20221124173314.2123015-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A gratuitous ARP is recommended after a live migration to reduce the amount=
 of=0D
time needed by the network links to be aware of the new location. A hypervi=
sor=0D
may not have the knowledge of the guest network configuration, and this is=
=0D
especially true on passthrough devices, so its simpler to ask the guest to=
=0D
do it.=0D
=0D
However, the device control part of this feature can be totally emulated by=
=0D
qemu and shadow virtqueue, not needing any special feature from the actual=
=0D
vdpa device.=0D
=0D
The vdpa device must offer VIRTIO_NET_F_STATUS for the guest to access the=
=0D
status of virtio net config where announcement status bit is set. It is=0D
possible to emulate it as always active in case backend does not support it=
,=0D
but this is left for the future, as there are not many devices not offering=
 it=0D
anyway.=0D
=0D
Patch 1 is less useful now that we don't emulate _F_STATUS anymore but QEMU=
=0D
coding style seems to prefer early return so leaving it in this version.=0D
=0D
v2:=0D
* Actually remove VIRTIO_NET_F_STATUS emulation. Comparing with v1, we offe=
r=0D
  the feature with virtio instead of using virtio/vhost-vdpa.=0D
=0D
v1:=0D
* Move code from vhost_net_get_config to virtio_net_get_config.=0D
=0D
RFC v2:=0D
* Add VIRTIO_NET_F_STATUS emulation.=0D
=0D
Eugenio P=C3=A9rez (4):=0D
  virtio_net: Modify virtio_net_get_config to early return=0D
  virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device model has it=0D
  vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in=0D
    vhost_vdpa_net_handle_ctrl_avail=0D
  vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in vhost-vdpa=0D
=0D
 hw/net/virtio-net.c | 29 ++++++++++++++++-------------=0D
 net/vhost-vdpa.c    | 16 ++++++++++++----=0D
 2 files changed, 28 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


