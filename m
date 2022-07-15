Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952A5765F7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:27:26 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCP65-0004gY-JZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOxi-00046q-Re
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOxf-0005r0-Lk
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657905523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2P6a8sIslbzax3bnMQS2mm1c8zBa2ketSvRrjdyLZcU=;
 b=OLezLIauSgiVAu3HpbyGdivr7cd9mmL8yedq6NLGANkKB8HUWKlTeQE6vnHY4NZs202cAm
 dvVWr5H+PN7nGSEJvEx57E3INnm19PP3vryr89VdHZQtNomN+maKvFeN2uBoychyLLxms8
 i/pTfugQ+jUK8Y88i4n4MV3GNEe1gPs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-93r8_YdmPROerVoPz7htKA-1; Fri, 15 Jul 2022 13:18:40 -0400
X-MC-Unique: 93r8_YdmPROerVoPz7htKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B3A738217EB;
 Fri, 15 Jul 2022 17:18:39 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B72B40E8B04;
 Fri, 15 Jul 2022 17:18:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eric Blake <eblake@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 00/19] vdpa net devices Rx filter change notification with
 Shadow VQ
Date: Fri, 15 Jul 2022 19:18:15 +0200
Message-Id: <20220715171834.2666455-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
This series uses SVQ infrastructure to intercept networking control message=
s=0D
used by the device. This way, qemu is able to update VirtIONet device model=
 and=0D
react to them. In particular, this series enables rx filter change=0D
notification.=0D
=0D
This is a prerequisite to achieve net vdpa device with CVQ live migration.=
=0D
It's a stripped down version of [1], with error paths checked and no migrat=
ion=0D
enabled.=0D
=0D
First nine patches reorder and clean code base so its easier to apply later=
=0D
ones. No functional change should be noticed from these changes.=0D
=0D
Patches from 11 to 14 enable SVQ API to make other parts of qemu to interac=
t=0D
with it. In particular, they will be used by vhost-vdpa net to handle CVQ=0D
messages.=0D
=0D
Patches 15 to 17 enable the update of the virtio-net device model for each=
=0D
CVQ message acknowledged by the device.=0D
=0D
Last patches enable x-svq parameter, forbidding device migration since it i=
s=0D
not restored in the destination's vdpa device yet. This will be added in la=
ter=0D
series, using this work.=0D
=0D
Comments are welcome.=0D
v3:=0D
- Replace SVQElement with SVQDescState=0D
=0D
v2:=0D
- (Comments from series [1]).=0D
- Active poll for CVQ answer instead of relay on async used callback=0D
- Do not offer a new buffer to device but reuse qemu's=0D
- Use vhost_svq_add instead of not needed vhost_svq_inject=0D
- Delete used and detach callbacks, not needed anymore=0D
- Embed members of SVQElement in VirtQueueElement=0D
- Reuse the same buffers for all CVQ commands=0D
=0D
[1] https://patchwork.kernel.org/project/qemu-devel/cover/20220706184008.16=
49478-1-eperezma@redhat.com/=0D
=0D
Eugenio P=C3=A9rez (19):=0D
  vhost: move descriptor translation to vhost_svq_vring_write_descs=0D
  virtio-net: Expose MAC_TABLE_ENTRIES=0D
  virtio-net: Expose ctrl virtqueue logic=0D
  vhost: Reorder vhost_svq_kick=0D
  vhost: Move vhost_svq_kick call to vhost_svq_add=0D
  vhost: Check for queue full at vhost_svq_add=0D
  vhost: Decouple vhost_svq_add from VirtQueueElement=0D
  vhost: Add SVQDescState=0D
  vhost: Track number of descs in SVQDescState=0D
  vhost: add vhost_svq_push_elem=0D
  vhost: Expose vhost_svq_add=0D
  vhost: add vhost_svq_poll=0D
  vhost: Add svq avail_handler callback=0D
  vdpa: Export vhost_vdpa_dma_map and unmap calls=0D
  vdpa: manual forward CVQ buffers=0D
  vdpa: Buffer CVQ support on shadow virtqueue=0D
  vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs=0D
  vdpa: Add device migration blocker=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
=0D
 qapi/net.json                      |   9 +-=0D
 hw/virtio/vhost-shadow-virtqueue.h |  52 ++++-=0D
 include/hw/virtio/vhost-vdpa.h     |   8 +=0D
 include/hw/virtio/virtio-net.h     |   7 +=0D
 hw/net/virtio-net.c                |  85 ++++---=0D
 hw/virtio/vhost-shadow-virtqueue.c | 202 +++++++++++-----=0D
 hw/virtio/vhost-vdpa.c             |  25 +-=0D
 net/vhost-vdpa.c                   | 357 +++++++++++++++++++++++++++--=0D
 8 files changed, 627 insertions(+), 118 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


