Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB8D58DD66
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:43:56 +0200 (CEST)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTGl-0000Nn-O0
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTCf-0002le-92
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLTCa-0007bT-Ok
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660066775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w2ngluoeA15b4gpkUrPNx9r+d/YxyKQ5rn5+rKhpPSs=;
 b=HQvvQ/Yr1TO6kdJuW+3KhaJiq9qlRc1nDlooWWLF7DUDbxa6PnWwPFbWhVnYnY/63nP49U
 RCKvuuwn5YlNWabyNtMFk5B+JaaWzcXRNo1/gZQ5dauot27Su1lC7YlqDU0QGNh1vYJzgF
 YKgHdRy+mQml0n68uYfRCFIH5PsgtHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-s4nw6dkfPn-gOuivuZawEg-1; Tue, 09 Aug 2022 13:39:31 -0400
X-MC-Unique: s4nw6dkfPn-gOuivuZawEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42BA58037B5;
 Tue,  9 Aug 2022 17:39:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0038D9457F;
 Tue,  9 Aug 2022 17:39:27 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v8 00/12] NIC vhost-vdpa state restore via Shadow CVQ
Date: Tue,  9 Aug 2022 19:39:14 +0200
Message-Id: <20220809173926.1695280-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

CVQ of net vhost-vdpa devices can be intercepted since the addition of x-sv=
q.=0D
The virtio-net device model is updated. The migration was blocked because=0D
although the state can be megrated between VMM it was not possible to resto=
re=0D
on the destination NIC.=0D
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
This series needs fix [1] to be applied to achieve full live=0D
migration.=0D
=0D
Thanks!=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg00325.html=
=0D
=0D
v8:=0D
- Rename NetClientInfo load to start, so is symmetrical with stop()=0D
- Delete copy of device's in buffer at vhost_vdpa_net_load=0D
=0D
v7:=0D
- Remove accidental double free.=0D
=0D
v6:=0D
- Move map and unmap of the buffers to the start and stop of the device. Th=
is=0D
  implies more callbacks on NetClientInfo, but simplifies the SVQ CVQ code.=
=0D
- Not assume that in buffer is sizeof(virtio_net_ctrl_ack) in=0D
  vhost_vdpa_net_cvq_add=0D
- Reduce the number of changes from previous versions=0D
- Delete unused memory barrier=0D
=0D
v5:=0D
- Rename s/start/load/=0D
- Use independent NetClientInfo to only add load callback on cvq.=0D
- Accept out sg instead of dev_buffers[] at vhost_vdpa_net_cvq_map_elem=0D
- Use only out size instead of iovec dev_buffers to know if the descriptor =
is=0D
  effectively available, allowing to delete artificial !NULL VirtQueueEleme=
nt=0D
  on vhost_svq_add call.=0D
=0D
v4:=0D
- Actually use NetClientInfo callback.=0D
=0D
v3:=0D
- Route vhost-vdpa start code through NetClientInfo callback.=0D
- Delete extra vhost_net_stop_one() call.=0D
=0D
v2:=0D
- Fix SIGSEGV dereferencing SVQ when not in svq mode=0D
=0D
v1 from RFC:=0D
- Do not reorder DRIVER_OK & enable patches.=0D
- Delete leftovers=0D
=0D
Eugenio P=C3=A9rez (12):=0D
  vhost: stop transfer elem ownership in vhost_handle_guest_kick=0D
  vhost: use SVQ element ndescs instead of opaque data for desc=0D
    validation=0D
  vhost: Delete useless read memory barrier=0D
  vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush=0D
  vhost_net: Add NetClientInfo prepare callback=0D
  vhost_net: Add NetClientInfo stop callback=0D
  vdpa: add net_vhost_vdpa_cvq_info NetClientInfo=0D
  vdpa: Move command buffers map to start of net device=0D
  vdpa: extract vhost_vdpa_net_cvq_add from=0D
    vhost_vdpa_net_handle_ctrl_avail=0D
  vhost_net: add NetClientState->load() callback=0D
  vdpa: Add virtio-net mac address via CVQ at start=0D
  vdpa: Delete CVQ migration blocker=0D
=0D
 include/hw/virtio/vhost-vdpa.h     |   1 -=0D
 include/net/net.h                  |   6 +=0D
 hw/net/vhost_net.c                 |  17 +++=0D
 hw/virtio/vhost-shadow-virtqueue.c |  27 ++--=0D
 hw/virtio/vhost-vdpa.c             |  14 --=0D
 net/vhost-vdpa.c                   | 225 ++++++++++++++++++-----------=0D
 6 files changed, 178 insertions(+), 112 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


