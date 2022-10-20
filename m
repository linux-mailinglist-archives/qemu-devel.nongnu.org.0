Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CE605E80
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:12:29 +0200 (CEST)
Received: from localhost ([::1]:53598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTTQ-0002CM-Ax
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:12:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTGk-0001D5-Fy
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSsq-00047s-Q5
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSso-0001Hd-VJ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666262077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sJ/fLvmfad7Yv6lMcNtg6A1jXNTFzmrIAsNX5CpwRyU=;
 b=Adxqed7JnHwUAb5DXiR1AXMyPr2HCdWLc87UGOEKNY4Bb1pS3Pzz7OJHuVr+2lhKGtmJ5d
 d1sllCp8ILdn87u2PhlDT2k0Ft48HFO86wxUPMZqyKMqcZnjg8REXwLsJw+Ln6h8aZOuzf
 YYnm4YlKfv2o4EXf/kZJTVqXzCYbSek=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-CxnbsaOFO8ikg4cgm5yNXA-1; Thu, 20 Oct 2022 06:34:34 -0400
X-MC-Unique: CxnbsaOFO8ikg4cgm5yNXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 223E11010368;
 Thu, 20 Oct 2022 10:34:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93D16C15BA5;
 Thu, 20 Oct 2022 10:34:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 0/7] Guest announce feature emulation using Shadow VirtQueue
Date: Thu, 20 Oct 2022 12:34:22 +0200
Message-Id: <20221020103429.347525-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
VIRTIO_NET_F_STATUS is also needed for the guest to access the status of=0D
virtio net config where announcement status bit is set. Emulating it as=0D
always active in case backend does not support it.=0D
=0D
This series need two fixes applied:=0D
* https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03242.html=0D
* https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03241.html=0D
=0D
v1:=0D
* Move code from vhost_net_get_config to virtio_net_get_config.=0D
=0D
RFC v2:=0D
* Add VIRTIO_NET_F_STATUS emulation.=0D
=0D
Eugenio P=C3=A9rez (7):=0D
  vdpa: Save emulated features list in vhost_vdpa=0D
  virtio_net: Modify virtio_net_get_config to early return=0D
  virtio_net: Handle _F_STATUS emulation in virtio_net_get_config=0D
  vdpa: Expose VIRTIO_NET_F_STATUS unconditionally=0D
  vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in=0D
    vhost_vdpa_net_handle_ctrl_avail=0D
  virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device model has it=0D
  vdpa: Offer VIRTIO_NET_F_GUEST_ANNOUNCE feature if SVQ is enabled=0D
=0D
 include/hw/virtio/vhost-vdpa.h |  2 ++=0D
 hw/net/virtio-net.c            | 40 +++++++++++++++++++++-------------=0D
 hw/virtio/vhost-vdpa.c         |  8 +++----=0D
 net/vhost-vdpa.c               | 25 ++++++++++++++++++---=0D
 4 files changed, 53 insertions(+), 22 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


