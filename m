Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB761E7FD6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 16:11:48 +0200 (CEST)
Received: from localhost ([::1]:41178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefjf-00060k-TF
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 10:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jeffI-0007YA-GB
 for qemu-devel@nongnu.org; Fri, 29 May 2020 10:07:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41651
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jeffG-0003tL-Rw
 for qemu-devel@nongnu.org; Fri, 29 May 2020 10:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590761232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MgQM0Z5SNSdrfhaVpF3ljEH53QlJKKnlGobbubEPJaI=;
 b=Dt3Y9B8tr7IAw2O7QOs7AywX7kUQRHUXl4CI48xHeOjhqwyx3x7LuCBnUytuCOEic0Kc3o
 As/OVc2Vtr5x1eQLz/ZUqjb8ev/N2camLZs4o6svKltqFH3NRCK9/Tk+cN4wXHfoY6i2pu
 U2L79hW2Y/2wKUkqgExnakpJREDnoro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-tSCy0sqqNlK0Xw-I60Xq5g-1; Fri, 29 May 2020 10:07:11 -0400
X-MC-Unique: tSCy0sqqNlK0Xw-I60Xq5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B11F1083E82;
 Fri, 29 May 2020 14:07:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-84.pek2.redhat.com [10.72.13.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE39B5D9F3;
 Fri, 29 May 2020 14:06:34 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com, armbru@redhat.com, eblake@redhat.com, cohuck@redhat.com,
 jasowang@redhat.com
Subject: [RFC v3 0/8] vDPA support in qemu
Date: Fri, 29 May 2020 22:06:12 +0800
Message-Id: <20200529140620.28759-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:27:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
This RFC introduce the vDPA support in qemu
TODO: 
1) vIOMMU support
2) live migration support

change from v1
separate the patch of introduce vhost_set_vring_ready method
separate the patch of qemu_get_peer
separate the patch  of vhost_set_state
introduce the new macro specific for vDPA in configure
introduce the function to pass the fd from cmdline
introduce the docmation in qemu-options.hx
the other comments form last version 

change from v2
change the work process of vhost set status
introduce vhost_get_device_id
test based on qemu v5.0.0-rc4
the other comments from last version

Cindy Lu (3):
  net: introduce qemu_get_peer
  vhost_net: use the function qemu_get_peer
  vhost-backend: export the vhost backend helper

Jason Wang (3):
  virtio-bus: introduce queue_enabled method
  virtio-pci: implement queue_enabled method
  vhost: introduce vhost_set_vring_ready method

Tiwei Bie (2):
  vhost-vdpa: introduce vhost-vdpa backend
  vhost-vdpa: introduce vhost-vdpa net client

 configure                         |  21 ++
 hw/net/vhost_net-stub.c           |   9 +
 hw/net/vhost_net.c                |  72 +++++-
 hw/virtio/Makefile.objs           |   1 +
 hw/virtio/vhost-backend.c         |  39 +--
 hw/virtio/vhost-vdpa.c            | 399 ++++++++++++++++++++++++++++++
 hw/virtio/vhost.c                 |  37 ++-
 hw/virtio/virtio-pci.c            |  13 +
 hw/virtio/virtio.c                |   6 +
 include/hw/virtio/vhost-backend.h |  38 ++-
 include/hw/virtio/vhost-vdpa.h    |  26 ++
 include/hw/virtio/vhost.h         |   2 +
 include/hw/virtio/virtio-bus.h    |   4 +
 include/net/net.h                 |   1 +
 include/net/vhost-vdpa.h          |  19 ++
 include/net/vhost_net.h           |   3 +-
 net/Makefile.objs                 |   2 +-
 net/clients.h                     |   2 +
 net/net.c                         |   9 +
 net/vhost-vdpa.c                  | 235 ++++++++++++++++++
 qapi/net.json                     |  26 +-
 qemu-options.hx                   |  15 ++
 22 files changed, 951 insertions(+), 28 deletions(-)
 create mode 100644 hw/virtio/vhost-vdpa.c
 create mode 100644 include/hw/virtio/vhost-vdpa.h
 create mode 100644 include/net/vhost-vdpa.h
 create mode 100644 net/vhost-vdpa.c

-- 
2.21.1


