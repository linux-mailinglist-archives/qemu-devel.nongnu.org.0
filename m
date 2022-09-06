Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A8A5AF0A5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 18:39:35 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVbbq-0000Sn-3h
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 12:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVbYx-0004Do-8n
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVbYt-000199-Kr
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 12:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662482190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ACmtXk/+h0NMvhXp5WfOkf+W4yuQ9yZBLskDiRx0c1c=;
 b=jC7xy49vmJg/VgW0KrIYGCnDL1WtR6qJBN08D74iXYmDa1RJEQZxVtkNDh9B6FgAz9T97R
 fx3tWgoPc6I4I/uOCkhnNEnoaozXG4FUuy0MfIQ/aKIqEolw+ppxIdTV9DLat35FxeZpe9
 rcbOCVtZZ1ODKP7Ke/IyiR0xjvT3/fg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-BpP-1Gl7P4aYXKAT7C2Y2g-1; Tue, 06 Sep 2022 12:36:27 -0400
X-MC-Unique: BpP-1Gl7P4aYXKAT7C2Y2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A21A80A0AE;
 Tue,  6 Sep 2022 16:36:26 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DF1C492C3B;
 Tue,  6 Sep 2022 16:36:23 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 0/3] Vhost-vdpa Shadow Virtqueue VLAN support
Date: Tue,  6 Sep 2022 18:36:18 +0200
Message-Id: <20220906163621.1144675-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This series enables shadowed CVQ to intercept VLAN commands through=0D
shadowed CVQ, update the virtio NIC device model so qemu send it in a=0D
migration, and the restore of that VLAN state in the destination.=0D
=0D
It's based on the multiqueue series [1], but it's easy to reorder in=0D
case vlan feature is accepted earlier than mq.=0D
=0D
Comments are welcome.=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg01006.html=
=0D
=0D
Eugenio P=C3=A9rez (3):=0D
  virtio-net: do not reset vlan filtering at set_features=0D
  vdpa: load vlan configuration at NIC startup=0D
  vdpa: Support VLAN on nic control shadow virtqueue=0D
=0D
 hw/net/virtio-net.c |  4 +---=0D
 net/vhost-vdpa.c    | 57 +++++++++++++++++++++++++++++++++++++++++++--=0D
 2 files changed, 56 insertions(+), 5 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


