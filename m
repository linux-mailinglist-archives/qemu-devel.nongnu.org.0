Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B35A1955
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 21:14:23 +0200 (CEST)
Received: from localhost ([::1]:33092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRIJ4-0002tM-Qr
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 15:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9R-00005u-0q
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9F-0006PT-1S
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661454245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bY/XBVgXDAmTX7MQ9iLwSAqFk8zCZLPTUyagIZscjyo=;
 b=Ew1+SkJNrfn9ftC+2jof4sa6kJwMX+Y9O/UrvGctvNZkoFAZhj48o0uzWpdsOAKT1msz8y
 AoCFhclmCYx8bQ6u28z4eXoPwn2OQ63Lbhz02gDczspw05SNCLBLeMHRnG/VoBt/QZ5D0x
 GZMAd0+jPd9PQHqL7s+sALKwqlgwL5Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-GS_uraMdOvWnmaceP_5czQ-1; Thu, 25 Aug 2022 15:04:02 -0400
X-MC-Unique: GS_uraMdOvWnmaceP_5czQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 512E6185A7B2;
 Thu, 25 Aug 2022 19:04:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FD80492C3B;
 Thu, 25 Aug 2022 19:03:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 0/6] Vhost-vdpa Shadow Virtqueue multiqueue support.
Date: Thu, 25 Aug 2022 21:03:50 +0200
Message-Id: <20220825190356.317527-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This series enables shadowed CVQ to intercept multiqueue commands through=0D
shadowed CVQ, update the virtio NIC device model so qemu send it in a=0D
migration, and the restore of that MQ state in the destination.=0D
=0D
It needs to be applied on top of [1].=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02965.html=0D
=0D
v2:=0D
* Add vhost_vdpa_net_load_cmd helper to avoid out buffers castings.=0D
* Make cvq_cmd_in_buffer virtio_net_ctrl_ack type.=0D
=0D
Eugenio P=C3=A9rez (6):=0D
  vdpa: Make VhostVDPAState cvq_cmd_in_buffer control ack type=0D
  vdpa: extract vhost_vdpa_net_load_mac from vhost_vdpa_net_load=0D
  vdpa: Add vhost_vdpa_net_load_mq=0D
  vdpa: validate MQ CVQ commands=0D
  virtio-net: Update virtio-net curr_queue_pairs in vdpa backends=0D
  vdpa: Allow MQ feature in SVQ=0D
=0D
 hw/net/virtio-net.c |  17 +++----=0D
 net/vhost-vdpa.c    | 119 ++++++++++++++++++++++++++++++++------------=0D
 2 files changed, 93 insertions(+), 43 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


