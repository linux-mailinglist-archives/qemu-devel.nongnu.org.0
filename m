Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B765A4B5A9B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:41:15 +0100 (CET)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhDm-0000N6-S3
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:41:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqH-0002dP-Pz
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgqF-0001CQ-7a
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EA0ih5+YeQTwCGrtsY+w4048+MWK30Xu1O3/y6llUVY=;
 b=jHoloUTigKpHnhpNMeAq/AYRLXOBQFiU9ZLllTgpd3GrDurZgbomSAkmqQpAgAr0yZPeQB
 uPqlqXg5Ws/LLJlLJouFPLjmmA3rsCuhtuCPRh44HLrAOIbzPnTfdAZBQoE7Tcy08jQxBm
 Bsx5ZrtFmVaqEZLDHDLcbpRGi+mDLto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-mk7fq_aoOWWrCGaEomdgPg-1; Mon, 14 Feb 2022 14:16:46 -0500
X-MC-Unique: mk7fq_aoOWWrCGaEomdgPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 498082F25;
 Mon, 14 Feb 2022 19:16:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0375C22B;
 Mon, 14 Feb 2022 19:16:37 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/9] Net Control VQ support in vDPA SVQ
Date: Mon, 14 Feb 2022 20:16:26 +0100
Message-Id: <20220214191635.1604932-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Control virtqueue is used by networking device for accepting various=0D
commands from the driver. It's a must to support multiqueue and other=0D
configurations.=0D
=0D
Shadow VirtQueue (SVQ) [1] already makes possible migration of virtqueue=0D
states, effectively intercepting them so qemu can track what regions of mem=
ory=0D
are dirty because device action and needs migration. However, this does not=
=0D
solve networking device state seen by the driver because CVQ messages, like=
=0D
changes on MAC addresses from the driver.=0D
=0D
To solve that, this series uses SVQ infraestructure proposed at SVQ [1] to=
=0D
intercept networking control messages used by the device. This way, qemu is=
=0D
able to update VirtIONet device model and to migrate it. This series needs =
to=0D
be applied on top of [1].=0D
=0D
Ideally, only the control VQ would be shadowed for all the run of qemu and =
the=0D
rest of virtqueues would be passthrough unless it's migration time. However=
,=0D
this requires the vDPA device to support address translations from more tha=
n=0D
one address space, something that is not possible at the moment with the=0D
current vhost-vDPA API. The API change has been proposed at [2], but use of=
 it=0D
is left for future series.=0D
=0D
Sending this as a RFC so some details like error control is still not 100%=
=0D
tested. Comments are welcomed on every aspect of the patch.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20220121202733.404989-1-eperezma@red=
hat.com/=0D
[2] https://lkml.org/lkml/2020/9/23/1243=0D
=0D
Eugenio P=C3=A9rez (9):=0D
  virtio-net: Expose ctrl virtqueue logic=0D
  vdpa: Extract get geatures part from vhost_vdpa_get_max_queue_pairs=0D
  virtio: Make virtqueue_alloc_element non-static=0D
  vhost: Add SVQElement=0D
  vhost: Add custom used buffer callback=0D
  vdpa: Add map/unmap operation callback to SVQ=0D
  vhost: Add vhost_svq_inject=0D
  vhost: Add vhost_svq_start_op=0D
  vdpa: control virtqueue support on shadow virtqueue=0D
=0D
 hw/virtio/vhost-shadow-virtqueue.h |  25 +++-=0D
 include/hw/virtio/vhost-vdpa.h     |   2 +=0D
 include/hw/virtio/virtio-net.h     |   3 +=0D
 include/hw/virtio/virtio.h         |   1 +=0D
 hw/net/virtio-net.c                |  83 ++++++-----=0D
 hw/virtio/vhost-shadow-virtqueue.c | 217 +++++++++++++++++++++++------=0D
 hw/virtio/vhost-vdpa.c             |  22 ++-=0D
 hw/virtio/virtio.c                 |   2 +-=0D
 net/vhost-vdpa.c                   | 140 +++++++++++++++++--=0D
 9 files changed, 405 insertions(+), 90 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


