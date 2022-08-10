Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ACB58F287
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 20:49:30 +0200 (CEST)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLqll-0007sY-Mz
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfE-00027b-S5
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfB-0006gm-6H
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660156949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yWfhlBuUvUS3Otocmm0+8YxffnubSzN66Fjessag/k0=;
 b=drrtPnaXHSDuyrFCPHvqTcr5yfS0zozYw1y3hb7M2rpoGPt6mbw6F++6Dwf0kx8ztWPLJv
 KsfZNijdxHuFu4q9koxjc2X0xMxW3VRHi8JYZPLFn3axf6563yw144JCM5MWHICpTJGmef
 hEfOwB0F+Bxd/IkHMBkjdSeDvSkRtCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-xvMb3Jn3NRe-1HQ6ocVsLg-1; Wed, 10 Aug 2022 14:42:26 -0400
X-MC-Unique: xvMb3Jn3NRe-1HQ6ocVsLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88AC218A6525;
 Wed, 10 Aug 2022 18:42:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2983C15BA3;
 Wed, 10 Aug 2022 18:42:22 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [RFC 0/8] Dinamycally switch to vhost shadow virtqueues at vdpa net
 migration
Date: Wed, 10 Aug 2022 20:42:12 +0200
Message-Id: <20220810184220.2362292-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

It's possible to migrate vdpa net devices if they are shadowed from the=0D
start. But to always shadow the dataplane is effectively break its host=0D
passthrough, so its not convenient in vDPA scenarios.=0D
=0D
This series enables dynamically switching to shadow mode only at migration=
=0D
time. This allow full data virtqueues passthrough all the time qemu is not=
=0D
migrating.=0D
=0D
To do so it uses the VHOST_VDPA_SUSPEND ioctl, not merged in Linux at this =
time=0D
[1]. Because of that, first patch is not signed and present a header=0D
[NOTMERGE]. This series is also based on ASID one [2], not merged in qemu a=
t the=0D
moment.=0D
=0D
Comments are welcome.=0D
=0D
[1] https://lkml.org/lkml/2022/8/10/732=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg01047.html=
=0D
=0D
Eugenio P=C3=A9rez (8):=0D
  [NOTMERGE] Update linux headers=0D
  vdpa: Extract get_backend_features from vhost_vdpa_get_as_num=0D
  vhost: expose memory listener priority=0D
  vdpa: Add log_enabled to VhostVDPAState=0D
  vdpa: Add vdpa memory listener=0D
  vdpa: Negotiate _F_SUSPEND feature=0D
  vdpa: Add feature_log member to vhost_vdpa=0D
  vdpa: Conditionally expose _F_LOG in vhost_net devices=0D
=0D
 include/hw/virtio/vhost-vdpa.h               |   1 +=0D
 include/hw/virtio/vhost.h                    |   2 +=0D
 include/standard-headers/linux/vhost_types.h |   3 +=0D
 linux-headers/linux/vhost.h                  |   3 +=0D
 hw/virtio/vhost-vdpa.c                       |   5 +-=0D
 hw/virtio/vhost.c                            |   2 +-=0D
 net/vhost-vdpa.c                             | 128 +++++++++++++++++--=0D
 7 files changed, 132 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


