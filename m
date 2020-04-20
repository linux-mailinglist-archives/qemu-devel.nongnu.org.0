Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB111B0CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 15:40:18 +0200 (CEST)
Received: from localhost ([::1]:35822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQWen-0006ff-2H
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 09:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lulu@redhat.com>) id 1jQSol-0003Po-41
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:34:20 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <lulu@redhat.com>) id 1jQSok-0003kJ-Kz
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:34:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50969
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jQSoj-0003ia-2z
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587375255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w5/CTvaQFEHceba/wDxzrUQhITI0ORXe3srqGvOCTWs=;
 b=aND1+RojUBdPprMwts8Oko20/bqZbIWSUsUYdz9hAEr8ic366zswljD/hjnsSogLhmzTFi
 Ozk1AvnkWedpixT2tdh3hlk76rduPJEntL8MlxIDlM7qR/G/w/RRHbCK6j6I36GOl5b5ky
 ewMLV2slBNAGGGhCrpyg2yN4Ws9Ls5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-QUoif4QcPdqAtijbEISWAg-1; Mon, 20 Apr 2020 05:33:04 -0400
X-MC-Unique: QUoif4QcPdqAtijbEISWAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A4961005513;
 Mon, 20 Apr 2020 09:33:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-243.pek2.redhat.com [10.72.12.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 914D992FA1;
 Mon, 20 Apr 2020 09:32:44 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com, armbru@redhat.com, eblake@redhat.com, cohuck@redhat.com,
 jasowang@redhat.com
Subject: [RFC v1 0/4] vDPA support in qemu
Date: Mon, 20 Apr 2020 17:32:37 +0800
Message-Id: <20200420093241.4238-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 01:47:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
X-Mailman-Approved-At: Mon, 20 Apr 2020 09:36:03 -0400
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

Cindy Lu (3):
  net: Introduce qemu_get_peer
  vhost-vdpa: introduce vhost-vdpa net client
  vhost-vdpa: implement vhost-vdpa backend

Jason Wang (1):
  vhost: introduce vhost_set_vring_ready method

 hw/net/vhost_net-stub.c           |   5 +
 hw/net/vhost_net.c                |  75 +++++-
 hw/net/virtio-net.c               |   9 +
 hw/virtio/Makefile.objs           |   2 +-
 hw/virtio/vhost-backend.c         |   3 +
 hw/virtio/vhost-vdpa.c            | 376 ++++++++++++++++++++++++++++++
 hw/virtio/vhost.c                 |   5 +
 hw/virtio/virtio-pci.c            |  13 ++
 hw/virtio/virtio.c                |   6 +
 include/hw/virtio/vhost-backend.h |   8 +-
 include/hw/virtio/vhost-vdpa.h    |  14 ++
 include/hw/virtio/virtio-bus.h    |   4 +
 include/net/net.h                 |   1 +
 include/net/vhost-vdpa.h          |  18 ++
 include/net/vhost_net.h           |   2 +
 net/Makefile.objs                 |   2 +-
 net/clients.h                     |   2 +
 net/net.c                         |   7 +
 net/vhost-vdpa.c                  | 211 +++++++++++++++++
 qapi/net.json                     |  21 +-
 20 files changed, 773 insertions(+), 11 deletions(-)
 create mode 100644 hw/virtio/vhost-vdpa.c
 create mode 100644 include/hw/virtio/vhost-vdpa.h
 create mode 100644 include/net/vhost-vdpa.h
 create mode 100644 net/vhost-vdpa.c

--=20
2.21.1


