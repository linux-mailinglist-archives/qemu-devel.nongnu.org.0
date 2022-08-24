Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F085A0174
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:39:22 +0200 (CEST)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvHd-0003YM-MS
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEa-0007a6-0O
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEV-0005Re-CE
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661366160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g3dE07fFOkwBx+umfdDXGKHapyjgOgyYk1yaOoyEnVs=;
 b=Bo9nsGJHhyFmCdtzQu6NxB/9ESE3Ofdbi+3PM7AC2AuTgovxlT3vYOzs+uopuJNj1TPzeF
 N83nplYy/dEcD0kP92uIJY0Gvjxyr/rpdibraCcvCzcET/UcrngmD+BMYG9YguVGARgcT1
 FDebmCWUMcMZ6s5HTTu70JLCAp/qQ00=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-ti3n2oXfPoOvJCsXePEy8Q-1; Wed, 24 Aug 2022 14:35:57 -0400
X-MC-Unique: ti3n2oXfPoOvJCsXePEy8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C624804191;
 Wed, 24 Aug 2022 18:35:57 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 129CE2166B26;
 Wed, 24 Aug 2022 18:35:53 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Subject: [PATCH v2 0/6] Vhost-vdpa Shadow Virtqueue multiqueue support.
Date: Wed, 24 Aug 2022 20:35:45 +0200
Message-Id: <20220824183551.197052-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
  vdpa: Make VhostVDPAState cvq_cmd_out_buffer control ack type=0D
  vdpa: extract vhost_vdpa_net_load_mac from vhost_vdpa_net_load=0D
  vdpa: Add vhost_vdpa_net_load_mq=0D
  vdpa: validate MQ CVQ commands=0D
  virtio-net: Update virtio-net curr_queue_pairs in vdpa backends=0D
  vdpa: Allow MQ feture in SVQ=0D
=0D
 hw/net/virtio-net.c |  17 +++-----=0D
 net/vhost-vdpa.c    | 101 ++++++++++++++++++++++++++++++++++----------=0D
 2 files changed, 85 insertions(+), 33 deletions(-)=0D
=0D
--=0D
2.31.1=0D
=0D


