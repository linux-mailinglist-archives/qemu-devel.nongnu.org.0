Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A056B7B6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:53:11 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lbh-0002Bs-IT
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZ4-0008Fq-TR
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZ1-0007o5-5x
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EG4KkoeObcqqJo4sgJ33wulv4SxfYem4N+fWBOb67Ec=;
 b=L0SHGriguingZUyFieDmyKg2h9YtVoTK9kk/+sXVgb2aJp6guCNg0kRW/88oh52CU+pwIH
 SNDAvbnCTDePIA86D7jWiDqmjUPJPwVSyUWG9t9nsscT7HzPhiSks6ndZQsuaCr2PsOMKT
 xdvDuxiNKVAdLS7SfJTfEak0hDANB4U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-TkODqOekMvG1k2zIi3Nx-Q-1; Fri, 08 Jul 2022 06:50:19 -0400
X-MC-Unique: TkODqOekMvG1k2zIi3Nx-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 841C938041D6;
 Fri,  8 Jul 2022 10:50:18 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6F661121314;
 Fri,  8 Jul 2022 10:50:15 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 00/22] vdpa net devices Rx filter change notification with
 Shadow VQ
Date: Fri,  8 Jul 2022 12:49:51 +0200
Message-Id: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
commands from the driver. It's a must to support advanced configurations.=0D
=0D
Rx filtering event is issues by qemu when device's MAC address changed once=
 and=0D
the previous one has not been queried by external agents.=0D
=0D
Shadow VirtQueue (SVQ) already makes possible tracking the state of virtque=
ues,=0D
effectively intercepting them so qemu can track what regions of memory are=
=0D
dirty because device action and needs migration. However, this does not sol=
ve=0D
networking device state seen by the driver because CVQ messages, like chang=
es=0D
on MAC addresses from the driver.=0D
=0D
This series uses SVQ infraestructure to intercept networking control messag=
es=0D
used by the device. This way, qemu is able to update VirtIONet device model=
 and=0D
react to them. In particular, this series enables rx filter change=0D
notification.=0D
=0D
This is a pre-requisite to achieve net vdpa device with CVQ live migration.=
=0D
It's a stripped down version of [1], with error paths checked and no migrat=
ion=0D
enabled.=0D
=0D
First patch solves a memory leak if the device is able to trick qemu to thi=
nk=0D
it has returned more buffers than svq size. This should not be possible, bu=
t=0D
we're a bit safer this way.=0D
=0D
Next nine patches reorder and clean code base so its easier to apply later=
=0D
ones. No functional change should be noticed from these changes.=0D
=0D
Patches from 11 to 16 enable SVQ API to make other parts of qemu to interac=
t=0D
with it. In particular, they will be used by vhost-vdpa net to handle CVQ=0D
messages.=0D
=0D
Patches 17 to 19 enable the update of the virtio-net device model for each=
=0D
CVQ message acknoledged by the device.=0D
=0D
Last patches enable x-svq parameter, forbidding device migration since it i=
s=0D
not restored in the destination's vdpa device yet. This will be added in la=
ter=0D
series, using this work.=0D
=0D
Comments are welcome.=0D
=0D
[1] https://patchwork.kernel.org/project/qemu-devel/cover/20220706184008.16=
49478-1-eperezma@redhat.com/=0D
=0D
Eugenio P=C3=A9rez (22):=0D
  vhost: Return earlier if used buffers overrun=0D
  vhost: move descriptor translation to vhost_svq_vring_write_descs=0D
  vdpa: Clean vhost_vdpa_dev_start(dev, false)=0D
  virtio-net: Expose ctrl virtqueue logic=0D
  vhost: Decouple vhost_svq_add_split from VirtQueueElement=0D
  vhost: Reorder vhost_svq_last_desc_of_chain=0D
  vhost: Add SVQElement=0D
  vhost: Move last chain id to SVQ element=0D
  vhost: Add opaque member to SVQElement=0D
  vdpa: Small rename of error labels=0D
  vhost: add vhost_svq_push_elem=0D
  vhost: Add vhost_svq_inject=0D
  vhost: add vhost_svq_poll=0D
  vhost: Add custom used buffer callback=0D
  vhost: Add svq avail_handler callback=0D
  vhost: add detach SVQ operation=0D
  vdpa: Export vhost_vdpa_dma_map and unmap calls=0D
  vdpa: manual forward CVQ buffers=0D
  vdpa: Buffer CVQ support on shadow virtqueue=0D
  vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs=0D
  vdpa: Add device migration blocker=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
=0D
 qapi/net.json                      |   9 +-=0D
 hw/virtio/vhost-shadow-virtqueue.h |  64 +++-=0D
 include/hw/virtio/vhost-vdpa.h     |   8 +=0D
 include/hw/virtio/virtio-net.h     |   4 +=0D
 hw/net/virtio-net.c                |  84 ++---=0D
 hw/virtio/vhost-shadow-virtqueue.c | 287 +++++++++++++----=0D
 hw/virtio/vhost-vdpa.c             |  63 ++--=0D
 net/vhost-vdpa.c                   | 473 ++++++++++++++++++++++++++++-=0D
 8 files changed, 855 insertions(+), 137 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


