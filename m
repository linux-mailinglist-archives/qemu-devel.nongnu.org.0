Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A143F5752FC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:40:00 +0200 (CEST)
Received: from localhost ([::1]:48724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1sd-0003KQ-NK
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lC-0007Ae-CA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1l2-0003JI-Gy
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657816327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TXAJuBLNCR/YueTQIzMFDsucH95wdhdXNDKfvpB+NL4=;
 b=WfarkQfROMXZeXy4kIisyP03fBKrpLhkvxC+60ItC4Z205UEMNjEKNPOENBk0PcM+6ggTP
 zA3irHB4c58B43EaLCFtFtu3x3ISSvg/Cjb9Zi1Ecw7TZ2xJxqfPdRtpiAmZbQT9VQvQrz
 dkmLGMd+ygMctRhLoQIQHXNADycTMjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-9xgjmtHINNaDBEgOwVTXig-1; Thu, 14 Jul 2022 12:31:56 -0400
X-MC-Unique: 9xgjmtHINNaDBEgOwVTXig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4A8485A581;
 Thu, 14 Jul 2022 16:31:55 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 242CD1121314;
 Thu, 14 Jul 2022 16:31:51 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v2 00/19] vdpa net devices Rx filter change notification with
 Shadow VQ
Date: Thu, 14 Jul 2022 18:31:31 +0200
Message-Id: <20220714163150.2536327-1-eperezma@redhat.com>
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
  vhost: Add SVQElement=0D
  vhost: Track number of descs in SVQElement=0D
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
 hw/virtio/vhost-shadow-virtqueue.c | 216 +++++++++++------=0D
 hw/virtio/vhost-vdpa.c             |  25 +-=0D
 net/vhost-vdpa.c                   | 357 +++++++++++++++++++++++++++--=0D
 8 files changed, 635 insertions(+), 124 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


