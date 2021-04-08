Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA45E357F85
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:42:28 +0200 (CEST)
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURBD-0001EJ-SV
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7a-0006cC-MW
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7X-0004IC-C3
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UO5JIOw/ylArPfvbXawPn8mOu4pzYsdBif3r3uj5EaQ=;
 b=OQqClYgL3t9FLL820QWeHKSuW7OA+jhMS3112YalXySM9q+xrdjPpeCnXGM4nkywpjf8Uj
 m7GGrtygyza8LmJ437EHhV/0HWCuQYZ6fw8aIh3WCcn40QptyKvE1s1h7vgjMbOfCM6uyv
 7spME5+G3D+In5ogQ1ysBXVHp2Dj4gM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-4YrIuV-MMa28as9VIG-1JA-1; Thu, 08 Apr 2021 05:38:35 -0400
X-MC-Unique: 4YrIuV-MMa28as9VIG-1JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21D8C1966324
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 09:38:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-72.pek2.redhat.com [10.72.13.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 670A25D9E3;
 Thu,  8 Apr 2021 09:38:29 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] vhost-vdpa: add support for configure interrupt
Date: Thu,  8 Apr 2021 17:38:18 +0800
Message-Id: <20210408093824.14985-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
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

Change in v5
misc fixes form v4
split the code for introduce configure interrupt type and callback fucntion 
will init the configure interrupt in virtio-pci and virtio-mmio bus, but will 
only active while using vhost-vdpa backend


Cindy Lu (6):
  virtio: introduce new type in interrupt process
  vhost: add new call back function for config interrupt
  virtio:add support in configure interrupt
  vhost-vdpa: add support for configure interrupt
  virtio-mmio: add support for configure interrupt
  virtio-pci: add support for configure interrupt

 hw/display/vhost-user-gpu.c       |  14 ++-
 hw/net/vhost_net.c                |   9 ++
 hw/net/virtio-net.c               |  21 +++-
 hw/s390x/virtio-ccw.c             |   6 +-
 hw/virtio/trace-events            |   2 +
 hw/virtio/vhost-user-fs.c         |  12 ++-
 hw/virtio/vhost-vdpa.c            |  33 ++++++-
 hw/virtio/vhost-vsock-common.c    |  12 ++-
 hw/virtio/vhost.c                 |  38 +++++++-
 hw/virtio/virtio-crypto.c         |  13 ++-
 hw/virtio/virtio-mmio.c           |  28 +++++-
 hw/virtio/virtio-pci.c            | 157 ++++++++++++++++++++++++------
 hw/virtio/virtio.c                |  25 +++++
 include/hw/virtio/vhost-backend.h |   3 +
 include/hw/virtio/vhost.h         |   3 +
 include/hw/virtio/virtio.h        |  14 ++-
 include/net/vhost_net.h           |   3 +
 17 files changed, 334 insertions(+), 59 deletions(-)

-- 
2.21.3


