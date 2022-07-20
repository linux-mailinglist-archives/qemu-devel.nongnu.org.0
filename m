Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A857B729
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:17:16 +0200 (CEST)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9Zi-0002J9-SB
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9Uw-0005Nl-93
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9Us-0006pL-1H
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658322733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QbEHtm+GZDemO49+T4wl6lr9geS8pxT/nP719sOPou8=;
 b=ib4IWVlIb/Py+R4gSOicnNEARUPHP+Elmp5iBJMgHqvdITn8zu+uPp5MEFxIu5fIScReFh
 r6WTTI6sbnvWvxHw3DSDnTzQlkMR5WE3CE66YNzFkPKqCIpiSdzOrmkvvz3FXHrNK5+Eo6
 I7rghDz3UowcLkKGDBuWSnimiQvJYAs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-s2yDO3N_Mfa1bd6ejWxhQw-1; Wed, 20 Jul 2022 09:12:12 -0400
X-MC-Unique: s2yDO3N_Mfa1bd6ejWxhQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E73061C16B47;
 Wed, 20 Jul 2022 13:12:11 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F681C28100;
 Wed, 20 Jul 2022 13:12:07 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v13 00/10] vhost-vdpa: add support for configure interrupt
Date: Wed, 20 Jul 2022 21:11:54 +0800
Message-Id: <20220720131204.591104-1-lulu@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

Add support for virtio-mmio bus=0D
active the notifier while the backend support configure interrupt=0D
misc fixes from v1=0D
=0D
Change in v3=0D
fix the coding style problems=0D
=0D
Change in v4=0D
misc fixes from v3=0D
merge the set_config_notifier to set_guest_notifier=0D
when vdpa start, check the feature by VIRTIO_NET_F_STATUS=0D
=0D
Change in v5=0D
misc fixes from v4=0D
split the code to introduce configure interrupt type and the callback funct=
ion=0D
will init the configure interrupt in all virtio-pci and virtio-mmio bus, bu=
t will=0D
only active while using vhost-vdpa driver=0D
=0D
Change in v6=0D
misc fixes from v5=0D
decouple vq from interrupt setting and misc process=0D
fix the bug in virtio_net_handle_rx=0D
=0D
Change in v7=0D
misc fixes from v6=0D
decouple vq from interrupt setting and misc process=0D
decouple vq from vector use/release process=0D
decouple vq from set notifier fd handler process=0D
move config_notifier and masked_config_notifier to VirtIODevice=0D
fix the bug in virtio_net_handle_rx, add more information=0D
add VIRTIO_CONFIG_IRQ_IDX as the queue number for configure interrupt=C2=A0=
=0D
=0D
Change in v8=0D
misc fixes from v7=0D
decouple vq from interrupt setting and misc process=0D
decouple vq from vector use/release process=0D
decouple vq from set notifier fd handler process=0D
move the vhost configure interrupt to vhost_net=0D
=0D
Change in v9=0D
misc fixes from v8=0D
address the comments from v8=0D
=0D
Change in v10=0D
fix the hang issue in qtest=0D
address the comments from v9=0D
=0D
Change in v11=0D
fix the crash in aarch64 plateform.=0D
fix the crash upstream reported=0D
=0D
Changes in v12=0D
fix the typo and the comments=0D
=0D
changes in v13=0D
re-send the patches by git-publish=0D
=0D
Cindy Lu (10):=0D
  virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX=0D
  virtio-pci: decouple notifier from interrupt process=0D
  virtio-pci: decouple the single vector from the interrupt process=0D
  vhost: introduce new VhostOps vhost_set_config_call=0D
  vhost-vdpa: add support for config interrupt=0D
  virtio: add support for configure interrupt=0D
  vhost: add support for configure interrupt=0D
  virtio-net: add support for configure interrupt=0D
  virtio-mmio: add support for configure interrupt=0D
  virtio-pci: add support for configure interrupt=0D
=0D
 hw/display/vhost-user-gpu.c       |  13 ++=0D
 hw/net/vhost_net.c                |   9 +=0D
 hw/net/virtio-net.c               |  20 ++-=0D
 hw/virtio/trace-events            |   1 +=0D
 hw/virtio/vhost-user-fs.c         |  14 ++=0D
 hw/virtio/vhost-vdpa.c            |   8 +=0D
 hw/virtio/vhost-vsock-common.c    |  14 ++=0D
 hw/virtio/vhost.c                 |  78 +++++++-=0D
 hw/virtio/virtio-crypto.c         |  14 ++=0D
 hw/virtio/virtio-mmio.c           |  27 +++=0D
 hw/virtio/virtio-pci.c            | 283 +++++++++++++++++++++---------=0D
 hw/virtio/virtio-pci.h            |   4 +-=0D
 hw/virtio/virtio.c                |  29 +++=0D
 include/hw/virtio/vhost-backend.h |   3 +=0D
 include/hw/virtio/vhost.h         |   4 +=0D
 include/hw/virtio/virtio.h        |   7 +=0D
 include/net/vhost_net.h           |   2 +=0D
 17 files changed, 443 insertions(+), 87 deletions(-)=0D
=0D
-- =0D
2.34.3=0D
=0D


