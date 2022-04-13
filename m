Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4524FFB61
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:34:36 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefwx-0002Af-FA
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefuj-0007mg-JP
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nefuh-00039e-Lz
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mUKEz3lD5B+/uLPoSTHbANHsxK5A7CmBISQsldpSbeE=;
 b=Ja9Lghkb2QJ3VZWalnbBAF0fyFpf5ol5PT+BAV38K3i3n1F6rVU+PayjKHELBiPa8MZfuj
 MrIl54+uDc8xWbdCj7GFy1y+PF0PbBQJbhbFRLGUZH8d+1ZdjWfS0E0Y4W5yesfYXBoNxs
 ZrcSTh/Ld23+BoCxGhPmEuiOlFa58WY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-WX8iTh0ROxKnBCXK_553-Q-1; Wed, 13 Apr 2022 12:32:11 -0400
X-MC-Unique: WX8iTh0ROxKnBCXK_553-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27FA980A0AD;
 Wed, 13 Apr 2022 16:32:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB5D1400B18;
 Wed, 13 Apr 2022 16:32:08 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 00/25] Net Control VQ support with asid in vDPA SVQ
Date: Wed, 13 Apr 2022 18:31:41 +0200
Message-Id: <20220413163206.1958254-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
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
To solve that, this series uses SVQ infraestructure proposed at SVQ to=0D
intercept networking control messages used by the device. This way, qemu is=
=0D
able to update VirtIONet device model and to migrate it.=0D
=0D
You can run qemu in two modes after applying this series: only intercepting=
=0D
cvq with x-cvq-svq=3Don or intercept all the virtqueues adding cmdline x-sv=
q=3Don:=0D
=0D
-netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdpa0,x-c=
vq-svq=3Don,x-svq=3Don=0D
=0D
The most updated kernel part of ASID is proposed at [1].=0D
=0D
Other modes without x-cvq-svq have been not tested with this series. Other =
vq=0D
cmd commands than set mac or mq are not tested. Some details like error con=
trol=0D
are not 100% tested neither.=0D
=0D
The firsts 5 patches will be or have already been proposed sepratedly. Patc=
h 6=0D
and 7 enable some pre-requisites. Patch 8 add cmdline parameter to shadow a=
ll=0D
virtqueues. The rest of commits introduce the actual functionality.=0D
=0D
Comments are welcomed.=0D
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
Eugenio P=C3=A9rez (24):=0D
  vhost: Track descriptor chain in private at SVQ=0D
  vdpa: Add missing tracing to batch mapping functions=0D
  vdpa: Fix bad index calculus at vhost_vdpa_get_vring_base=0D
  util: Return void on iova_tree_remove=0D
  vdpa: Send all updates in memory listener commit=0D
  vhost: Add reference counting to vhost_iova_tree=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
  vhost: move descriptor translation to vhost_svq_vring_write_descs=0D
  vdpa: Fix index calculus at vhost_vdpa_svqs_start=0D
  virtio-net: Expose ctrl virtqueue logic=0D
  vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs=0D
  virtio: Make virtqueue_alloc_element non-static=0D
  vhost: Add SVQElement=0D
  vhost: Add custom used buffer callback=0D
  vdpa: control virtqueue support on shadow virtqueue=0D
  vhost: Add vhost_iova_tree_find=0D
  vdpa: Add map/unmap operation callback to SVQ=0D
  vhost: Add vhost_svq_inject=0D
  vdpa: add NetClientState->start() callback=0D
  vdpa: Add vhost_vdpa_start_control_svq=0D
  vhost: Update kernel headers=0D
  vhost: Make possible to check for device exclusive vq group=0D
  vdpa: Add asid attribute to vdpa device=0D
  vdpa: Add x-cvq-svq=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/virtio: Replace g_memdup() by g_memdup2()=0D
=0D
 qapi/net.json                                |  13 +-=0D
 hw/virtio/vhost-iova-tree.h                  |   7 +-=0D
 hw/virtio/vhost-shadow-virtqueue.h           |  52 +++-=0D
 include/hw/virtio/vhost-vdpa.h               |   4 +-=0D
 include/hw/virtio/vhost.h                    |   6 +=0D
 include/hw/virtio/virtio-net.h               |   3 +=0D
 include/hw/virtio/virtio.h                   |   1 +=0D
 include/net/net.h                            |   2 +=0D
 include/qemu/iova-tree.h                     |   4 +-=0D
 include/standard-headers/linux/vhost_types.h |  11 +-=0D
 linux-headers/linux/vhost.h                  |  25 +-=0D
 hw/net/vhost_net.c                           |  13 +-=0D
 hw/net/virtio-net.c                          |  82 ++---=0D
 hw/virtio/vhost-iova-tree.c                  |  35 ++-=0D
 hw/virtio/vhost-shadow-virtqueue.c           | 265 +++++++++++++---=0D
 hw/virtio/vhost-vdpa.c                       | 262 ++++++++++++----=0D
 hw/virtio/virtio-crypto.c                    |   6 +-=0D
 hw/virtio/virtio.c                           |   2 +-=0D
 net/vhost-vdpa.c                             | 305 +++++++++++++++++--=0D
 util/iova-tree.c                             |   4 +-=0D
 hw/virtio/trace-events                       |   8 +-=0D
 21 files changed, 930 insertions(+), 180 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


