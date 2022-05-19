Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C752DD95
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:16:56 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrldn-0007NH-6G
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlaM-0004Pv-3D
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlaF-0006La-F3
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RX/xER3P7WI9SnQEeZO3P37kdFktt1FQ5vUi0siYlxM=;
 b=VOsyAS1FyVJDW3YlSOdDTU/E5B5q15q3yOXH3KiJ8HvIAsQYN1X+dBUz9dQmor8WBPohh0
 xfBeNT9NtuKJ2U2vkyPJBk3KqWq5P3KP57qhcMjoBfV7cKo0lKLv1WY1kM3S8N1BnpeVuh
 uM1Rf9B9L1wQdu3Kl+u51YyzzgckfZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-IL1bH-gcML6aIO4E4OTXqw-1; Thu, 19 May 2022 15:13:12 -0400
X-MC-Unique: IL1bH-gcML6aIO4E4OTXqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AADCD101AA45;
 Thu, 19 May 2022 19:13:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82B6A2026D6A;
 Thu, 19 May 2022 19:13:08 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 00/21] Net Control VQ support with asid in vDPA SVQ
Date: Thu, 19 May 2022 21:12:45 +0200
Message-Id: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Control virtqueue is used by networking device for accepting various=0D
commands from the driver. It's a must to support multiqueue and other=0D
configurations.=0D
=0D
Shadow VirtQueue (SVQ) already makes possible migration of virtqueue=0D
states, effectively intercepting them so qemu can track what regions of mem=
ory=0D
are dirty because device action and needs migration. However, this does not=
=0D
solve networking device state seen by the driver because CVQ messages, like=
=0D
changes on MAC addresses from the driver.=0D
=0D
To solve that, this series uses SVQ infraestructure proposed to intercept=0D
networking control messages used by the device. This way, qemu is able to=0D
update VirtIONet device model and to migrate it.=0D
=0D
However, to intercept all queues would slow device data forwarding. To solv=
e=0D
that, only the CVQ must be intercepted all the time. This is achieved using=
=0D
the ASID infraestructure, that allows different translations for different=
=0D
virtqueues. The most updated kernel part of ASID is proposed at [1].=0D
=0D
You can run qemu in two modes after applying this series: only intercepting=
=0D
cvq with x-cvq-svq=3Don or intercept all the virtqueues adding cmdline x-sv=
q=3Don:=0D
=0D
-netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdpa0,x-c=
vq-svq=3Don,x-svq=3Don=0D
=0D
First three patches enable the update of the virtio-net device model for ea=
ch=0D
CVQ message acknoledged by the device.=0D
=0D
Patches from 5 to 9 enables individual SVQ to copy the buffers to QEMU's VA=
.=0D
This allows simplyfing the memory mapping, instead of map all the guest's=0D
memory like in the data virtqueues.=0D
=0D
Patch 10 allows to inject control messages to the device. This allows to se=
t=0D
state to the device both at QEMU startup and at live migration destination.=
 In=0D
the future, this may also be used to emulate _F_ANNOUNCE.=0D
=0D
Patch 11 updates kernel headers, but it assign random numbers to needed ioc=
tls=0D
because they are still not accepted in the kernel.=0D
=0D
Patches 12-16 enables the set of the features of the net device model to th=
e=0D
vdpa device at device start.=0D
=0D
Last ones enables the sepparated ASID and SVQ.=0D
=0D
Comments are welcomed.=0D
=0D
TODO:=0D
* Fallback on regular CVQ if QEMU cannot isolate in its own ASID by any=0D
  reason, blocking migration. This is tricky, since it can cause that the V=
M=0D
  cannot be migrated anymore, so some way of block it must be used.=0D
* Review failure paths, some are with TODO notes, other don't.=0D
=0D
Changes from rfc v7:=0D
* Don't map all guest space in ASID 1 but copy all the buffers. No need for=
=0D
  more memory listeners.=0D
* Move net backend start callback to SVQ.=0D
* Wait for device CVQ commands used by the device at SVQ start, avoiding ra=
ces.=0D
* Changed ioctls, but they're provisional anyway.=0D
* Reorder commits so refactor and code adding ones are closer to usage.=0D
* Usual cleaning: better tracing, doc, patches messages, ...=0D
=0D
Changes from rfc v6:=0D
* Fix bad iotlb updates order when batching was enabled=0D
* Add reference counting to iova_tree so cleaning is simpler.=0D
=0D
Changes from rfc v5:=0D
* Fixes bad calculus of cvq end group when MQ is not acked by the guest.=0D
=0D
Changes from rfc v4:=0D
* Add missing tracing=0D
* Add multiqueue support=0D
* Use already sent version for replacing g_memdup=0D
* Care with memory management=0D
=0D
Changes from rfc v3:=0D
* Fix bad returning of descriptors to SVQ list.=0D
=0D
Changes from rfc v2:=0D
* Fix use-after-free.=0D
=0D
Changes from rfc v1:=0D
* Rebase to latest master.=0D
* Configure ASID instead of assuming cvq asid !=3D data vqs asid.=0D
* Update device model so (MAC) state can be migrated too.=0D
=0D
[1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xilinx.com/=0D
=0D
Eugenio P=C3=A9rez (21):=0D
  virtio-net: Expose ctrl virtqueue logic=0D
  vhost: Add custom used buffer callback=0D
  vdpa: control virtqueue support on shadow virtqueue=0D
  virtio: Make virtqueue_alloc_element non-static=0D
  vhost: Add vhost_iova_tree_find=0D
  vdpa: Add map/unmap operation callback to SVQ=0D
  vhost: move descriptor translation to vhost_svq_vring_write_descs=0D
  vhost: Add SVQElement=0D
  vhost: Add svq copy desc mode=0D
  vhost: Add vhost_svq_inject=0D
  vhost: Update kernel headers=0D
  vdpa: delay set_vring_ready after DRIVER_OK=0D
  vhost: Add ShadowVirtQueueStart operation=0D
  vhost: Make possible to check for device exclusive vq group=0D
  vhost: add vhost_svq_poll=0D
  vdpa: Add vhost_vdpa_start_control_svq=0D
  vdpa: Add asid attribute to vdpa device=0D
  vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs=0D
  vhost: Add reference counting to vhost_iova_tree=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
  vdpa: Add x-cvq-svq=0D
=0D
 qapi/net.json                                |  13 +-=0D
 hw/virtio/vhost-iova-tree.h                  |   7 +-=0D
 hw/virtio/vhost-shadow-virtqueue.h           |  61 ++-=0D
 include/hw/virtio/vhost-vdpa.h               |   3 +=0D
 include/hw/virtio/vhost.h                    |   3 +=0D
 include/hw/virtio/virtio-net.h               |   4 +=0D
 include/hw/virtio/virtio.h                   |   1 +=0D
 include/standard-headers/linux/vhost_types.h |  11 +-=0D
 linux-headers/linux/vhost.h                  |  25 +-=0D
 hw/net/vhost_net.c                           |   5 +-=0D
 hw/net/virtio-net.c                          |  84 +++--=0D
 hw/virtio/vhost-iova-tree.c                  |  35 +-=0D
 hw/virtio/vhost-shadow-virtqueue.c           | 378 ++++++++++++++++---=0D
 hw/virtio/vhost-vdpa.c                       | 206 +++++++++-=0D
 hw/virtio/virtio.c                           |   2 +-=0D
 net/vhost-vdpa.c                             | 294 ++++++++++++++-=0D
 hw/virtio/trace-events                       |  10 +-=0D
 17 files changed, 1012 insertions(+), 130 deletions(-)=0D
=0D
-- =0D
2.27.0=0D
=0D


