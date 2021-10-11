Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3755D4285EB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 06:31:14 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZmy1-0002IU-2h
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 00:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mZmvd-0000Pd-WD
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mZmvZ-0001lL-Vt
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633926520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zopi3tW7B0XxQXzaTS0i+7Xgf2O8hd5PHzU3aim7v/c=;
 b=RTFe5mm6nq2lUFxPU+b1MEqn3VskQufzRUc4o88m4XMaezfnPLTEARjxHomuW+dVqjjerh
 JUZbXlHtrfhFEnAXKEmXGzvH1kj0NwSpAzLkcCyEkwFG86PvAmTa9Dcl4kOxPSgqkDa82o
 wiqJhJndyiLCMWIYPkurR1t+1fEYL+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-FB9PgPmlMgezALEjUR6pHA-1; Mon, 11 Oct 2021 00:28:38 -0400
X-MC-Unique: FB9PgPmlMgezALEjUR6pHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DBB180830D;
 Mon, 11 Oct 2021 04:28:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-160.pek2.redhat.com
 [10.72.13.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 782E83CC9;
 Mon, 11 Oct 2021 04:28:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V4 00/10] vhost-vDPA multiqueue
Date: Mon, 11 Oct 2021 12:28:19 +0800
Message-Id: <20211011042829.4159-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/virtio/vhost-vdpa.c         |  56 +++++++++--
 include/hw/virtio/vhost-vdpa.h |   1 +
 include/hw/virtio/vhost.h      |   2 +
 include/hw/virtio/virtio-net.h |   5 +-
 include/net/net.h              |   5 +
 include/net/vhost_net.h        |   6 +-
 net/net.c                      |  24 ++++-
 net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
 11 files changed, 330 insertions(+), 120 deletions(-)

-- 
2.25.1


