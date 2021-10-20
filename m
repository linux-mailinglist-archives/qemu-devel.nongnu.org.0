Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFA43446C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 06:58:22 +0200 (CEST)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3gD-0004LJ-B9
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 00:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3eM-0001rD-SI
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3eJ-0007Nu-7F
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634705780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m5PzHGlc9nMkwoQcT4smSVcjEg5DfOi9XRR6j6Wfc3U=;
 b=Diqz63OuTyma/MtN0mWy4U2VLVId++SiSUdcHId/QSw0o9fT02OZbAWicSnYFcvB2hQcQh
 sT0tgp51ExRamL2qPoQe6Sp1ht6qpO2Qeb+Ez83e1PNrsQbg5cOvV7RSV40L4Z0n/NoYIy
 VogJw/zP2NedXxVdQK2jNk1Yxw5BRM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-kJPCDF-EO5aF0nn9Fq0h1w-1; Wed, 20 Oct 2021 00:56:17 -0400
X-MC-Unique: kJPCDF-EO5aF0nn9Fq0h1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7548D806689;
 Wed, 20 Oct 2021 04:56:16 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-13.pek2.redhat.com [10.72.13.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2026E60BF1;
 Wed, 20 Oct 2021 04:56:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V5 00/10] vhost-vDPA multiqueue
Date: Wed, 20 Oct 2021 12:55:50 +0800
Message-Id: <20211020045600.16082-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

This patch implements the multiqueue support for vhost-vDPA. The most
important requirement si the control virtqueue support. The virtio-net
and vhost-net core are tweak to support control virtqueue as if what
data queue pairs are done: a dedicated vhost_net device which is
coupled with the NetClientState is intrdouced so most of the existing
vhost codes could be reused with minor changes. This means the control
virtqueue will bypass the Qemu. With the control virtqueue, vhost-vDPA
are extend to support creating and destroying multiqueue queue pairs
plus the control virtqueue.

For the future, if we want to support live migration, we can either do
shadow cvq on top or introduce new interfaces for reporting device
states.

Tests are done via the vp_vdpa driver in L1 guest.

Changes since V4:
- rebase on top of Michael's pci branch

Changes since V3:
- fix build with vhost disabled

Changes since V2:
- rebase to qemu master
- use "queue_pairs" instead of "qps"
- typo fixes

Changes since V1:
- start and stop vhost devices when all queues were setup
- fix the case when driver doesn't support MQ but device support
- correctly set the batching capability to avoid a map/unmap storm
- various other tweaks

Jason Wang (10):
  vhost-vdpa: open device fd in net_init_vhost_vdpa()
  vhost-vdpa: classify one time request
  vhost-vdpa: prepare for the multiqueue support
  vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
  net: introduce control client
  vhost-net: control virtqueue support
  virtio-net: use "queue_pairs" instead of "queues" when possible
  vhost: record the last virtqueue index for the virtio device
  virtio-net: vhost control virtqueue support
  vhost-vdpa: multiqueue support

 hw/net/vhost_net-stub.c        |   4 +-
 hw/net/vhost_net.c             |  55 ++++++++---
 hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
 hw/virtio/vhost-vdpa.c         |  57 ++++++++++--
 include/hw/virtio/vhost-vdpa.h |   1 +
 include/hw/virtio/vhost.h      |   2 +
 include/hw/virtio/virtio-net.h |   5 +-
 include/net/net.h              |   5 +
 include/net/vhost_net.h        |   6 +-
 net/net.c                      |  24 ++++-
 net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
 11 files changed, 331 insertions(+), 120 deletions(-)

-- 
2.25.1


