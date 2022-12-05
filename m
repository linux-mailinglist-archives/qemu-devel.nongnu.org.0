Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D9D642E45
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:06:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Etl-0000Se-Cs; Mon, 05 Dec 2022 12:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Etd-0000Rr-Th
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:04:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Etc-0002eN-9k
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9jhb79LTN1zIzvYKNu6vLgQd/A3YUmNVphhijZNBnm0=;
 b=JvFwDZB1UMeLHVNBw/HyNsFrMqHwy/Mv5SVAMJmRE1yGXw7Smoal3lLtqONbj2U0+ivQX3
 VvrXRS/Q96Rl1YJu2vxQlYQhWQ7/oE1sHPlFzOhPZTyvWUXBTd2caBG3gnqrTcujFSzDvm
 MuuZ1j6uBbV396WAdvAAjIedf6/n0l8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-bFn1aNfDPZKqNsiEs5XcCw-1; Mon, 05 Dec 2022 12:04:44 -0500
X-MC-Unique: bFn1aNfDPZKqNsiEs5XcCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FD543C1022C;
 Mon,  5 Dec 2022 17:04:43 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58416C15BA8;
 Mon,  5 Dec 2022 17:04:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH for 8.0 00/13] vDPA-net inflight descriptors migration
 with SVQ
Date: Mon,  5 Dec 2022 18:04:23 +0100
Message-Id: <20221205170436.2977336-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

The state of the descriptors (avail or used) may not be recoverable just=0D
looking at the guest memory.  Out of order used descriptor may override=0D
previous avail ones in the descriptor table or avail vring.=0D
=0D
Currently we're not migrating this status in net devices because virtio-net=
,=0D
vhost-kernel etc use the descriptors in order, so the information always=0D
recoverable from guest's memory.  However, vDPA devices may use them out of=
=0D
order, and other kind of devices like block need this support.=0D
=0D
Shadow virtqueue is able to track these and resend them at the destination.=
=0D
Add them to the virtio-net migration description so they are not lose in th=
e=0D
process.=0D
=0D
This is a very early RFC just to validate the first draft so expect leftove=
rs.=0D
To fetch and request the descriptors from a device without SVQ need to be=0D
implemented on top. Some other notable pending items are:=0D
* Do not send the descriptors actually recoverable from the guest memory.=0D
* Properly version the migrate data.=0D
* Properly abstract the descriptors access from virtio-net to SVQ.=0D
* Do not use VirtQueueElementOld but migrate directly VirtQueueElement.=0D
* Replace lots of assertions with runtime conditionals.=0D
* Other TODOs in the patch message or code changes.=0D
=0D
Thanks.=0D
=0D
Eugenio P=C3=A9rez (13):=0D
  vhost: add available descriptor list in SVQ=0D
  vhost: iterate only available descriptors at SVQ stop=0D
  vhost: merge avail list and next avail descriptors detach=0D
  vhost: add vhost_svq_save_inflight=0D
  virtio: Specify uint32_t as VirtQueueElementOld members type=0D
  virtio: refactor qemu_get_virtqueue_element=0D
  virtio: refactor qemu_put_virtqueue_element=0D
  virtio: expose VirtQueueElementOld=0D
  virtio: add vmstate_virtqueue_element_old=0D
  virtio-net: Migrate vhost inflight descriptors=0D
  virtio-net: save inflight descriptors at vhost shutdown=0D
  vhost: expose vhost_svq_add_element=0D
  vdpa: Recover inflight descriptors=0D
=0D
 hw/virtio/vhost-shadow-virtqueue.h |   9 ++=0D
 include/hw/virtio/virtio-net.h     |   2 +=0D
 include/hw/virtio/virtio.h         |  32 ++++++=0D
 include/migration/vmstate.h        |  22 ++++=0D
 hw/net/vhost_net.c                 |  56 ++++++++++=0D
 hw/net/virtio-net.c                | 129 +++++++++++++++++++++++=0D
 hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++--=0D
 hw/virtio/vhost-vdpa.c             |  11 --=0D
 hw/virtio/virtio.c                 | 162 ++++++++++++++++++-----------=0D
 9 files changed, 392 insertions(+), 83 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


