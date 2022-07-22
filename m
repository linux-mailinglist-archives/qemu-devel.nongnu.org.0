Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78F57DD0E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 11:04:01 +0200 (CEST)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEoZj-0006bE-Qz
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 05:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEoSv-0000mg-Bn
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEoSr-0000YY-VS
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658480213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XmK8MRSta5/KVwafVir5ZMCiEJHQhQOAm/LGZ3PJPic=;
 b=Y0UF4vqzFLGiQIZsLDFexQoKLfrLqFDISjwcCVzppIMpFidTusiwWYj0ZPpHuF+cequ2XF
 8Ql9o6kTiHrqGoDGMLO6ZEz4ukgGqD2ICsnzGX4UYC6xcH6ZqvF8OVHM23UsQqzb/4Jq+4
 6uiR0n8vdysy5CnNO0mSeow1APrSEdg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-qvUXJ8ZGPwCnXgnAIOoOZA-1; Fri, 22 Jul 2022 04:56:49 -0400
X-MC-Unique: qvUXJ8ZGPwCnXgnAIOoOZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2095E1C06EC7;
 Fri, 22 Jul 2022 08:56:49 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2447C2166B26;
 Fri, 22 Jul 2022 08:56:46 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 0/6] NIC vhost-vdpa state restore via Shadow CVQ
Date: Fri, 22 Jul 2022 10:56:38 +0200
Message-Id: <20220722085644.3376708-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
This series needs fixes [1] and [2] to be applied to achieve full live=0D
migration.=0D
=0D
Thanks!=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02984.html=
=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03993.html=
=0D
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
Eugenio P=C3=A9rez (6):=0D
  vhost: stop transfer elem ownership in vhost_handle_guest_kick=0D
  vdpa: Extract vhost_vdpa_net_cvq_add from=0D
    vhost_vdpa_net_handle_ctrl_avail=0D
  vdpa: Make vhost_vdpa_net_cvq_map_elem accept any out sg=0D
  vdpa: add NetClientState->start() callback=0D
  vdpa: Add virtio-net mac address via CVQ at start=0D
  vdpa: Delete CVQ migration blocker=0D
=0D
 include/hw/virtio/vhost-vdpa.h     |   1 -=0D
 include/net/net.h                  |   2 +=0D
 include/net/vhost-vdpa.h           |   1 +=0D
 hw/net/vhost_net.c                 |   7 ++=0D
 hw/virtio/vhost-shadow-virtqueue.c |  10 +-=0D
 hw/virtio/vhost-vdpa.c             |  14 ---=0D
 net/vhost-vdpa.c                   | 162 +++++++++++++++++++++--------=0D
 7 files changed, 133 insertions(+), 64 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


