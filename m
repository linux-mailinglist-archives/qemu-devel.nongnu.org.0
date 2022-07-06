Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEA7569223
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:49:25 +0200 (CEST)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9A5U-0005QV-Vj
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99x3-00057N-H9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99wq-0000kb-TG
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0snCD4fRYTG7hbx8JKqRaZhKYClLigqp0VhwGAb23rA=;
 b=XGDkWTtxGfR9KqRI48a/JRyLEY+bnjIOHGBYdPcNUi+Z0RdEoUZJLk/Ap55SaCRQPTm71q
 4mOTk6Gw7LF3/rHtXK/JboxyKgDVlT09yFWCpxF7FT0sPo6U1THrl5PKhvLyH8bLHiOQw8
 Yv3YXHroas9FKzpe2O968cMpQHSF14I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-66LrfIZCO86GiiPUeVuKpQ-1; Wed, 06 Jul 2022 14:40:14 -0400
X-MC-Unique: 66LrfIZCO86GiiPUeVuKpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7887585A581;
 Wed,  6 Jul 2022 18:40:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83B311415116;
 Wed,  6 Jul 2022 18:40:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 00/23] Net Control VQ support in SVQ
Date: Wed,  6 Jul 2022 20:39:45 +0200
Message-Id: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
This series uses SVQ infraestructure to intercept networking control messag=
es=0D
used by the device. This way, qemu is able to update VirtIONet device model=
 and=0D
to migrate it.=0D
=0D
To intercept all queues slows device data forwarding, so this is not the fi=
nal=0D
solution. To solve that, only the CVQ must be intercepted all the time. Thi=
s=0D
will be achieved in future revisions using the ASID infraestructure, that=0D
allows different translations for different virtqueues.=0D
=0D
Another pending item is to move data virtqueues from passthrough mode to SV=
Q=0D
one. To achieve that, a reliable way to obtain the vq state is needed. STOP=
=0D
ioctl will be added for that.=0D
=0D
To intercept all the virtqueues and update the qemu nic device model as the=
=0D
guest changes the device state add the cmdline opt x-svq=3Don:=0D
=0D
-netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdpa0,x-s=
vq=3Don=0D
=0D
Lastly, device state is sent each time qemu starts the device, using SVQ to=
=0D
inject commands through CVQ. This allows the guest to transparently see the=
=0D
same guest-visible state at resume.=0D
=0D
First two patches reorder code so it's easier to apply later patches on top=
 of=0D
the code base.=0D
=0D
Third patch reorders the device ok and the set_vring_enable ioctl sending. =
This=0D
is done so CVQ commands reach the device before the device have the chance =
to=0D
use rx queues, with incorrect data.=0D
=0D
Fourth patch replaces the way of getting vq state. Since qemu will be able =
to=0D
inject buffers, device's used_idx is not valid anymore and we must use=0D
guest-visible one.=0D
=0D
Fifth patch creates the API in SVQ to call when device start. This will all=
ow=0D
vhost-vdpa net to inject control commands before the rest of queues start.=
=0D
=0D
Sixth path enables SVQ to return buffers externally. While it's not possibl=
e at=0D
this point in the series, CVQ will need to return the available buffers=0D
=0D
Patches 8-12 enables SVQ to communicate the caller of SVQ context data of t=
he=0D
used buffer.=0D
=0D
Patch 13 enables vhost-vdpa net to inject buffers to the device. This will =
be=0D
used both to inject the state at the beginning and to decouple guest's CVQ=
=0D
buffers from the ones sent to the device. This brings protections against=0D
TOCTOU, avoiding the device and qemu to see different messages. In the futu=
re,=0D
this may also be used to emulate _F_ANNOUNCE.=0D
=0D
The previous patch and patches from 14 to 17 makes SVQ capable of being=0D
inspected.=0D
=0D
Patches 18 to 20 enable the update of the virtio-net device model for each=
=0D
CVQ message acknoledged by the device.=0D
=0D
Patches 21-22 enables the update of the device configuration right at start=
.=0D
=0D
Finally, last commit enables x-svq parameter.=0D
=0D
Comments are welcomed.=0D
=0D
TODO:=0D
* Review failure paths, some are with TODO notes, other don't.=0D
=0D
Changes from rfc v8:=0D
* Remove ASID part. Delete x-svq-cvq mode too.=0D
* Move all DMA memory management to net/vhost-vdpa, instead of svq.=0D
* Use of qemu_real_host_page_size.=0D
* Improved doc, general fixes.=0D
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
Eugenio P=C3=A9rez (23):=0D
  vhost: Return earlier if used buffers overrun=0D
  vhost: move descriptor translation to vhost_svq_vring_write_descs=0D
  vdpa: delay set_vring_ready after DRIVER_OK=0D
  vhost: Get vring base from vq, not svq=0D
  vhost: Add ShadowVirtQueueStart operation=0D
  virtio-net: Expose ctrl virtqueue logic=0D
  vhost: add vhost_svq_push_elem=0D
  vhost: Decouple vhost_svq_add_split from VirtQueueElement=0D
  vhost: Add SVQElement=0D
  vhost: Reorder vhost_svq_last_desc_of_chain=0D
  vhost: Move last chain id to SVQ element=0D
  vhost: Add opaque member to SVQElement=0D
  vhost: Add vhost_svq_inject=0D
  vhost: add vhost_svq_poll=0D
  vhost: Add custom used buffer callback=0D
  vhost: Add svq avail_handler callback=0D
  vhost: add detach SVQ operation=0D
  vdpa: Export vhost_vdpa_dma_map and unmap calls=0D
  vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs=0D
  vdpa: Buffer CVQ support on shadow virtqueue=0D
  vdpa: Add vhost_vdpa_start_control_svq=0D
  vdpa: Inject virtio-net mac address via CVQ at start=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
=0D
 qapi/net.json                      |   9 +-=0D
 hw/virtio/vhost-shadow-virtqueue.h |  67 +++-=0D
 include/hw/virtio/vhost-vdpa.h     |   7 +=0D
 include/hw/virtio/virtio-net.h     |   4 +=0D
 include/hw/virtio/virtio.h         |   1 +=0D
 hw/net/virtio-net.c                |  84 +++--=0D
 hw/virtio/vhost-shadow-virtqueue.c | 284 ++++++++++++---=0D
 hw/virtio/vhost-vdpa.c             |  54 ++-=0D
 hw/virtio/virtio.c                 |   5 +=0D
 net/vhost-vdpa.c                   | 541 ++++++++++++++++++++++++++++-=0D
 10 files changed, 935 insertions(+), 121 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


