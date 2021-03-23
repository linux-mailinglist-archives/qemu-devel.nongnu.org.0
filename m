Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C944134552F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 02:58:58 +0100 (CET)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWJt-00014z-C3
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 21:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWI2-0008UC-7v
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWHy-0005qg-Mi
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616464615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iRD/ysF4N+Hl6SJ6pjv1PHECDJUC7Q563A84tZMo7MM=;
 b=KI31awOCu1hHkZRch8l50aHuuUX9UK2cWgGsKfk+0xzNkUUsoQZ5ScDBH9+COYX5Q/Bk0Q
 RlqHTmM3iviwG5HDjuhwzyd+awMCXCyqGn9TGvc0+HGD+e7QQ3vZmS8dxLFlbyzU3EtNn4
 JBxraCesqeWXRRm0cpMVVfgs3R82k/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-iuNAUAPQNWuvwqxifrfEMw-1; Mon, 22 Mar 2021 21:56:53 -0400
X-MC-Unique: iuNAUAPQNWuvwqxifrfEMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45461007467
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 01:56:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD1FD62A6F;
 Tue, 23 Mar 2021 01:56:47 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] vhost-vdpa: add support for configure interrupt
Date: Tue, 23 Mar 2021 09:56:37 +0800
Message-Id: <20210323015641.10820-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

These code are all tested in vp-vdpa (support configure interrupt)
vdpa_sim (not support configure interrupt)

test in virtio-pci bus and virtio-mmio bus

Change in v2:
Add support fot virtio-mmio bus
active the notifier wihle the backend support configure intterrput
misc fixes form v1

Change in v3
fix the coding style problems

Change in v4
misc fixes form v3
merge the set_config_notifier to set_guest_notifier
when vdpa start, check the feature by VIRTIO_NET_F_STATUS 


Cindy Lu (4):
  virtio:add support in configure interrupt
  vhost-vdpa: add callback function for configure interrupt
  virtio-mmio: add support for configure interrupt
  virtio-pci: add support for configure interrupt

 hw/display/vhost-user-gpu.c       |  14 ++-
 hw/net/vhost_net.c                |  16 ++-
 hw/net/virtio-net.c               |  24 ++++-
 hw/s390x/virtio-ccw.c             |   6 +-
 hw/virtio/trace-events            |   2 +
 hw/virtio/vhost-user-fs.c         |  12 ++-
 hw/virtio/vhost-vdpa.c            |  40 ++++++-
 hw/virtio/vhost-vsock-common.c    |  12 ++-
 hw/virtio/vhost.c                 |  44 +++++++-
 hw/virtio/virtio-crypto.c         |  13 ++-
 hw/virtio/virtio-mmio.c           |  30 +++++-
 hw/virtio/virtio-pci.c            | 171 ++++++++++++++++++++++++------
 hw/virtio/virtio.c                |  28 +++++
 include/hw/virtio/vhost-backend.h |   4 +
 include/hw/virtio/vhost.h         |   4 +
 include/hw/virtio/virtio.h        |  23 +++-
 include/net/vhost_net.h           |   3 +
 17 files changed, 378 insertions(+), 68 deletions(-)

-- 
2.21.3



