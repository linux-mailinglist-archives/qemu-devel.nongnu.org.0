Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E23210E29
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:57:34 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqeB4-0001FD-0b
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jqeA8-0000Zu-B6
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:56:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40227
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jqeA5-0007dW-TM
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593615392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y2eMDNbdybPKZdD5/8Z8upjBGCLeNgPjiMXo77uIw30=;
 b=PEGpgWp6UfKoLdgF9F0Ra2qwNlrsc5Zh3smyRvqzMCGLVAV7Rl2ctFKUV5cPGC9uCyXPpt
 8d+V0OK+s9H4xZS9sgxS7vhLW2fjNFra6SSJMEdTGWKFyRFfX7539/XTu9GoBhZTwlpKx1
 NnpaVydh56637jMngk6TVVZbAg+BS2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-ULYT296DPLahSEGFCMz-_A-1; Wed, 01 Jul 2020 10:56:27 -0400
X-MC-Unique: ULYT296DPLahSEGFCMz-_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57F7119253F6;
 Wed,  1 Jul 2020 14:56:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-19.pek2.redhat.com [10.72.12.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D637873FC5;
 Wed,  1 Jul 2020 14:55:41 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com, armbru@redhat.com, eblake@redhat.com, cohuck@redhat.com,
 jasowang@redhat.com
Subject: [PATCH v4 00/14]vDPA support in qemu
Date: Wed,  1 Jul 2020 22:55:24 +0800
Message-Id: <20200701145538.22333-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 00:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mhabets@solarflare.com, qemu-devel@nongnu.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 kevin.tian@intel.com, parav@mellanox.com, vmireyno@marvell.com,
 cunming.liang@intel.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 aadam@redhat.com, rdunlap@infradead.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vDPA device is a device that uses a datapath which complies with the
virtio specifications with vendor specific control path. vDPA devices
can be both physically located on the hardware or emulated by software.
This PATCH introduce the vDPA support in qemu
TODO 
1) vIOMMU support
2) live migration support
3) docs for vhost-vdpa
4) config interrupt support 

Change from v1
separate the patch of vhost_vq_get_addr
separate the patch of vhost_dev_start
introduce the docmation for vhost-vdpa.rst 
other comments form last version 
github address
https://github.com/lulu-github-name/qemutmp.git PATCHV2

Change from v3
fix the complie problem
separate the patch of vhost_force_iommu
other comments form last version 
github address
https://github.com/lulu-github-name/qemutmp.git PATCHV3

Change from v3
fix the centos7 test problem
other comments form last version 
github address
https://github.com/lulu-github-name/qemutmp.git PATCHV4

Cindy Lu (11):
  net: introduce qemu_get_peer
  vhost_net: use the function qemu_get_peer
  vhost: introduce new VhostOps vhost_dev_start
  vhost: implement vhost_dev_start method
  vhost: introduce new VhostOps vhost_vq_get_addr
  vhost: implement vhost_vq_get_addr method
  vhost: introduce new VhostOps vhost_force_iommu
  vhost: implement vhost_force_iommu method
  vhost_net: introduce set_config & get_config
  vhost-vdpa: introduce vhost-vdpa backend
  vhost-vdpa: introduce vhost-vdpa net client

Jason Wang (3):
  virtio-bus: introduce queue_enabled method
  virtio-pci: implement queue_enabled method
  vhost: check the existence of vhost_set_iotlb_callback

 configure                         |  21 ++
 docs/interop/index.rst            |   1 +
 docs/interop/vhost-vdpa.rst       |  17 ++
 hw/net/vhost_net-stub.c           |  11 +
 hw/net/vhost_net.c                |  45 ++-
 hw/net/virtio-net.c               |  19 ++
 hw/virtio/Makefile.objs           |   1 +
 hw/virtio/vhost-backend.c         |   6 +
 hw/virtio/vhost-vdpa.c            | 475 ++++++++++++++++++++++++++++++
 hw/virtio/vhost.c                 |  52 +++-
 hw/virtio/virtio-pci.c            |  13 +
 hw/virtio/virtio.c                |   6 +
 include/hw/virtio/vhost-backend.h |  19 +-
 include/hw/virtio/vhost-vdpa.h    |  26 ++
 include/hw/virtio/vhost.h         |   7 +
 include/hw/virtio/virtio-bus.h    |   4 +
 include/net/net.h                 |   1 +
 include/net/vhost-vdpa.h          |  22 ++
 include/net/vhost_net.h           |   5 +
 net/Makefile.objs                 |   2 +-
 net/clients.h                     |   2 +
 net/net.c                         |  10 +
 net/vhost-vdpa.c                  | 228 ++++++++++++++
 qapi/net.json                     |  28 +-
 qemu-options.hx                   |  12 +
 25 files changed, 1004 insertions(+), 29 deletions(-)
 create mode 100644 docs/interop/vhost-vdpa.rst
 create mode 100644 hw/virtio/vhost-vdpa.c
 create mode 100644 include/hw/virtio/vhost-vdpa.h
 create mode 100644 include/net/vhost-vdpa.h
 create mode 100644 net/vhost-vdpa.c

-- 
2.21.1


