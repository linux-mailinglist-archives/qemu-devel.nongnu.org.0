Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55F576D90
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 13:39:18 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCg8j-00076b-JI
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 07:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg47-00059a-Jr
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCg45-0006zO-W2
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657971269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zVl0tW7N/oley/10yG7TFX5XiTSezQlSlsh1iyh6sBE=;
 b=AfJXY3ZB+oD5K4E8bEpfbb0KuBiJ850YdYRTq1qlG5zEjF4A2fgraIEhcoxtR3S4Lhrbjk
 yaospop4zKA+9j998zJUZCs1keseEUACXfOrq95kO6hIF+PhSnFr6xAI0XCbifkuyV4R7Y
 jKzyQnWVYmeLdymVavQ2x1DTKVX+O3c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-SzTE8YPUOPipRJ2_RtlXeA-1; Sat, 16 Jul 2022 07:34:15 -0400
X-MC-Unique: SzTE8YPUOPipRJ2_RtlXeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60E5C185A79C;
 Sat, 16 Jul 2022 11:34:15 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A35840D2962;
 Sat, 16 Jul 2022 11:34:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH 00/12] NIC vhost-vdpa state restore via Shadow CVQ
Date: Sat, 16 Jul 2022 13:33:55 +0200
Message-Id: <20220716113407.2730331-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

CVQ of net vhost-vdpa devices can be intercepted since the work of [1]. The=
=0D
virtio-net device model is updated. The migration was blocked because altho=
ugh=0D
the state can be megrated between VMM it was not possible to restore on the=
=0D
destination NIC.=0D
=0D
This series add support for SVQ to inject external messages without the gue=
st's=0D
knowledge, so before the guest is resumed all the guest visible state is=0D
restored. It is done using standard CVQ messages, so the vhost-vdpa device =
does=0D
not need to learn how to restore it: As long as they have the feature, they=
=0D
know how to handle it.=0D
=0D
This series needs SVQ CVQ support [1] and fixes [2] to be applied.=0D
=0D
Thanks!=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02808.html=
=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02726.html=
=0D
=0D
Eugenio P=C3=A9rez (12):=0D
  vhost: Get vring base from vq, not svq=0D
  vhost: Move SVQ queue rewind to the destination=0D
  vdpa: Small rename of error labels=0D
  vdpa: delay set_vring_ready after DRIVER_OK=0D
  vhost: stop transfer elem ownership in vhost_handle_guest_kick=0D
  vhost: Use opaque data in SVQDescState=0D
  vhost: Add VhostVDPAStartOp operation=0D
  vdpa: Add vhost_vdpa_start_control_svq=0D
  vdpa: Extract vhost_vdpa_net_svq_add from=0D
    vhost_vdpa_net_handle_ctrl_avail=0D
  vdpa: Make vhost_vdpa_net_cvq_map_elem accept any out sg=0D
  vdpa: Add virtio-net mac address via CVQ at start=0D
  vdpa: Delete CVQ migration blocker=0D
=0D
 hw/virtio/vhost-shadow-virtqueue.h |   7 +-=0D
 include/hw/virtio/vhost-vdpa.h     |   6 +-=0D
 hw/virtio/vhost-shadow-virtqueue.c |  30 ++---=0D
 hw/virtio/vhost-vdpa.c             |  70 ++++++-----=0D
 net/vhost-vdpa.c                   | 184 ++++++++++++++++++++---------=0D
 5 files changed, 193 insertions(+), 104 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


