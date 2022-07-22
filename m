Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A8057E0B2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 13:16:32 +0200 (CEST)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEqdz-0007KC-Gd
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 07:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqae-0002sZ-NB
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEqaZ-0006vr-SU
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658488378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pYnqZLOt6JuLDnVzRcHP6wf7Sv/RFMrNZy7ajSXqpfg=;
 b=OpkCxNiPOqw1DjrkMqzrP9YJ3TaQrLdI5hTXIR6FlxO0NkXy848Qh7rpPwCZo7qWQtPbDH
 JQ7jkv9cwajyT4iodqFGFg2rAguXCWmLxTgJA88SEkj5M9Inti/HJugWmQivN9wtCRWb9o
 Y6dfBi9LKPk4naIjbdAPnG5m8rFh6g4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-ICg9LqTJMhu0Gf_-dZy5Uw-1; Fri, 22 Jul 2022 07:12:55 -0400
X-MC-Unique: ICg9LqTJMhu0Gf_-dZy5Uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3890785A581;
 Fri, 22 Jul 2022 11:12:55 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A7CE40D2962;
 Fri, 22 Jul 2022 11:12:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Subject: [PATCH v4 0/7] NIC vhost-vdpa state restore via Shadow CVQ
Date: Fri, 22 Jul 2022 13:12:38 +0200
Message-Id: <20220722111245.3403062-1-eperezma@redhat.com>
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
Eugenio P=C3=A9rez (7):=0D
  vhost: stop transfer elem ownership in vhost_handle_guest_kick=0D
  vdpa: Extract vhost_vdpa_net_cvq_add from=0D
    vhost_vdpa_net_handle_ctrl_avail=0D
  vdpa: Make vhost_vdpa_net_cvq_map_elem accept any out sg=0D
  vdpa: add NetClientState->start() callback=0D
  vdpa: Reorder net_vhost_vdpa_info=0D
  vdpa: Add virtio-net mac address via CVQ at start=0D
  vdpa: Delete CVQ migration blocker=0D
=0D
 include/hw/virtio/vhost-vdpa.h     |   1 -=0D
 include/net/net.h                  |   2 +=0D
 hw/net/vhost_net.c                 |   7 ++=0D
 hw/virtio/vhost-shadow-virtqueue.c |  10 +-=0D
 hw/virtio/vhost-vdpa.c             |  14 ---=0D
 net/vhost-vdpa.c                   | 186 +++++++++++++++++++++--------=0D
 6 files changed, 146 insertions(+), 74 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


