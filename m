Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97F577FBC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:33:55 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDO4Y-0005hT-HK
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO0q-00009P-EN
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO0n-000188-0W
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658140200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ijYs5UOIb4+ls10VWx/9qgc7gTh2epiyH30/5SMlO0Q=;
 b=Bd8RZKiGwJXDLMhUlEadpha8yPu7aNYf6NCLYFukM4cBKmbtAx6+jpu0Hl/tCHfrKC77u+
 NNXOPCxFRcSKQXRwEm+cP0pgtyOOjGPljFO7KWm0xBIbu3TZ1qh+6sFMywgCIZ8LN0dyfq
 OfHDSJN9ecVqAiJXo+xoEnLcHQXZX1g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-DBFN5u5JNMugOvhLJERHlg-1; Mon, 18 Jul 2022 06:29:57 -0400
X-MC-Unique: DBFN5u5JNMugOvhLJERHlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4DE43804526;
 Mon, 18 Jul 2022 10:29:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D6232166B26;
 Mon, 18 Jul 2022 10:29:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v4 00/19] vdpa net devices Rx filter change notification with
 Shadow VQ
Date: Mon, 18 Jul 2022 12:29:30 +0200
Message-Id: <20220718102949.2868267-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
v4:=0D
- Add a timeout to vhost_svq_poll to not hold BQL forever=0D
=0D
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
 hw/virtio/vhost-shadow-virtqueue.c | 207 ++++++++++++-----=0D
 hw/virtio/vhost-vdpa.c             |  25 +-=0D
 net/vhost-vdpa.c                   | 357 +++++++++++++++++++++++++++--=0D
 8 files changed, 632 insertions(+), 118 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


