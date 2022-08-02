Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB514588180
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 19:59:54 +0200 (CEST)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIwBO-0005vL-52
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 13:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9I-0000tw-2T
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9E-0003cG-RY
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659463059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PtDxPG9mPu/1+52DzW3IhsI4lL1bND0yUX7h5yuRZZU=;
 b=cMwHuESf1TYojj5IfXvrY1iXlYjNVClTx41YA0/bV54D1gxO+Rd5HQdJtpxWBunDSDC65T
 eimJ2GLtDtD4e/nx/GyF24dcz4nvVctyvx6LzXSuBEUPidmxXnbfwklqXsZKvdADUXjNVx
 xsw5K9ILVsvlaX0BSRAYxDk8JV0fBgo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-nNC8UxeoPneaVdT1KYnJBw-1; Tue, 02 Aug 2022 13:57:36 -0400
X-MC-Unique: nNC8UxeoPneaVdT1KYnJBw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D921C06EC5;
 Tue,  2 Aug 2022 17:57:35 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFEC8492C3B;
 Tue,  2 Aug 2022 17:57:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH v5 00/10] NIC vhost-vdpa state restore via Shadow CVQ
Date: Tue,  2 Aug 2022 19:57:21 +0200
Message-Id: <20220802175731.312115-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
This series needs fixes [1], [2] and [3] to be applied to achieve full live=
=0D
migration.=0D
=0D
Thanks!=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02984.html=
=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03993.html=
=0D
[3] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg00325.html=
=0D
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
Eugenio P=C3=A9rez (10):=0D
  vhost: stop transfer elem ownership in vhost_handle_guest_kick=0D
  vhost: use SVQ element ndescs instead of opaque data for desc=0D
    validation=0D
  vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush=0D
  vdpa: Get buffers from VhostVDPAState on vhost_vdpa_net_cvq_map_elem=0D
  vdpa: Extract vhost_vdpa_net_cvq_add from=0D
    vhost_vdpa_net_handle_ctrl_avail=0D
  vdpa: Make vhost_vdpa_net_cvq_map_elem accept any out sg=0D
  vdpa: add NetClientState->load() callback=0D
  vdpa: add net_vhost_vdpa_cvq_info NetClientInfo=0D
  vdpa: Add virtio-net mac address via CVQ at start=0D
  vdpa: Delete CVQ migration blocker=0D
=0D
 include/hw/virtio/vhost-vdpa.h     |   1 -=0D
 include/net/net.h                  |   2 +=0D
 hw/net/vhost_net.c                 |   7 ++=0D
 hw/virtio/vhost-shadow-virtqueue.c |  31 +++---=0D
 hw/virtio/vhost-vdpa.c             |  14 ---=0D
 net/vhost-vdpa.c                   | 163 +++++++++++++++++++++--------=0D
 6 files changed, 145 insertions(+), 73 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


