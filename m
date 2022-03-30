Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D44ECCD2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:01:22 +0200 (CEST)
Received: from localhost ([::1]:39482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdZJ-0006nr-VU
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:01:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd6U-00065o-Ed
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd6S-0006Vj-NF
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648665092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+SKCm9G8BDrWkofYkdT+VZfji3mIihJJxqnUvma9uBM=;
 b=E1Mko3NpoRbFk+UNZtawoOgRtAQ+Dy5Y8q22LoymK/h6caHq4mU6CV2kQxoT5h5uMK76wZ
 Ol8NwTdJN7QNPpWB7mCzf+OeziElr7HzV0VUHFIWZ19Yd4QAf52p3u73qqiVV78eZddnye
 aIKxTzNm9sVJ0cvP0zkMsm3s+mBNrGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-0jJ3JnlBO9m33bT67lv3hg-1; Wed, 30 Mar 2022 14:31:23 -0400
X-MC-Unique: 0jJ3JnlBO9m33bT67lv3hg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 319768F0542;
 Wed, 30 Mar 2022 18:31:23 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0DAB57ECE5;
 Wed, 30 Mar 2022 18:31:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 00/19] Net Control VQ support with asid in vDPA SVQ
Date: Wed, 30 Mar 2022 20:30:57 +0200
Message-Id: <20220330183116.358598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
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
cmd commands than set mac are not tested. Some details like error control a=
re=0D
not 100% tested neither.=0D
=0D
The first patch will be proposed in -trivial sepratedly=0D
=0D
Comments are welcomed on every aspect of the patch.=0D
=0D
Changes from rfc v2:=0D
* Fix use-after-free=0D
=0D
Changes from rfc v1:=0D
* Rebase to latest master=0D
* Configure ASID instead of assuming cvq asid !=3D data vqs asid=0D
* Update device model so (MAC) state can be migrated too.=0D
=0D
[1] https://lkml.kernel.org/kvm/20220224212314.1326-1-gdawar@xilinx.com/=0D
=0D
Eugenio P=C3=A9rez (19):=0D
  util: Return void on iova_tree_remove=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
  vhost: move descriptor translation to vhost_svq_vring_write_descs=0D
  vdpa: Fix index calculus at vhost_vdpa_svqs_start=0D
  virtio-net: use g_memdup2() instead of unsafe g_memdup()=0D
  virtio-net: Expose ctrl virtqueue logic=0D
  vdpa: Extract get geatures part from vhost_vdpa_get_max_queue_pairs=0D
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
  vdpa: Add asid attribute to vdpa device=0D
  vdpa: Add x-cvq-svq=0D
=0D
 qapi/net.json                                |  13 +-=0D
 hw/virtio/vhost-iova-tree.h                  |   2 +=0D
 hw/virtio/vhost-shadow-virtqueue.h           |  46 ++-=0D
 include/hw/virtio/vhost-vdpa.h               |   5 +=0D
 include/hw/virtio/virtio-net.h               |   3 +=0D
 include/hw/virtio/virtio.h                   |   1 +=0D
 include/net/net.h                            |   2 +=0D
 include/qemu/iova-tree.h                     |   4 +-=0D
 include/standard-headers/linux/vhost_types.h |  11 +-=0D
 linux-headers/linux/vhost.h                  |  25 +-=0D
 hw/net/vhost_net.c                           |   4 +=0D
 hw/net/virtio-net.c                          |  82 +++--=0D
 hw/virtio/vhost-iova-tree.c                  |  14 +=0D
 hw/virtio/vhost-shadow-virtqueue.c           | 238 +++++++++---=0D
 hw/virtio/vhost-vdpa.c                       |  70 +++-=0D
 hw/virtio/virtio.c                           |   2 +-=0D
 net/vhost-vdpa.c                             | 368 +++++++++++++++++--=0D
 util/iova-tree.c                             |   4 +-=0D
 18 files changed, 764 insertions(+), 130 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


